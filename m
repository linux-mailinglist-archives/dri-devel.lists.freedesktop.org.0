Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10287D1304B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 15:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D14610E3E0;
	Mon, 12 Jan 2026 14:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KjrDl3j+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD2410E3DE;
 Mon, 12 Jan 2026 14:10:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6EAC842AFD;
 Mon, 12 Jan 2026 14:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7771EC16AAE;
 Mon, 12 Jan 2026 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768227033;
 bh=CfNJPE1nl/7o5k/wDQ4X6fS/hd3zNOqhNxuVfUQZkxU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KjrDl3j+2AfjB9/eZ36YStEGgwjSiXVe0+Pb69beUBaY10cZ2oknCPZw45Rps7xOa
 kJjjWD4HPlHmXqKBtSM+nzIF2xjYyDo0nccIJ1c1tuRaiDadE9PljcA9NRhizaO0Ib
 HNTimgli+moD6ttdkwJuNE7EGywiKVSTUMx/pMonxrpKTQ75JclWcKGeQjM1xjZy3s
 7j/j+A7BcEs+vquxLe3TaR+6kLBHcmovCnDptlyTyeNKU7nWJpGqNioIPTDmcbwwy4
 7mZPC+1joDR4FJgJAxWPFeNSrB3UaXbSilhEnG6joK0CqB6QDDpabAZ+0Wuoa1q/vf
 cA+5sV4NLLSyQ==
Message-ID: <7ec7b4ae-6186-4961-a857-f97afcfc3ded@kernel.org>
Date: Mon, 12 Jan 2026 08:10:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/amd/display: Initialise backlight level values
 from hw
To: Vivek Das Mohapatra <vivek@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260112122140.2609679-1-vivek@collabora.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260112122140.2609679-1-vivek@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/12/26 6:20 AM, Vivek Das Mohapatra wrote:
> Internal backlight levels are initialised from ACPI but the values
> are sometimes out of sync with the levels in effect until there has
> been a read from hardware (eg triggered by reading from sysfs).
> 
> This means that the first drm_commit can cause the levels to be set
> to a different value than the actual starting one, which results in
> a sudden change in brightness.
> 
> This path shows the problem (when the values are out of sync):
> 
>     amdgpu_dm_atomic_commit_tail()
>     -> amdgpu_dm_commit_streams()
>     -> amdgpu_dm_backlight_set_level(..., dm->brightness[n])
> 
> This patch calls the backlight ops get_brightness explicitly
> at the end of backlight registration to make sure dm->brightness[n]
> is in sync with the actual hardware levels.
> 
> Signed-off-by: Vivek Das Mohapatra <vivek@collabora.com>

Thanks for the patch.  One comment below.

> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 354e359c4507..50f0547ed63c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5258,6 +5258,8 @@ amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
>   	struct amdgpu_dm_backlight_caps *caps;
>   	char bl_name[16];
>   	int min, max;
> +	int real_brightness;
> +	int init_brightness;
>   
>   	if (aconnector->bl_idx == -1)
>   		return;
> @@ -5282,6 +5284,8 @@ amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
>   	} else
>   		props.brightness = props.max_brightness = MAX_BACKLIGHT_LEVEL;
>   
> +	init_brightness = props.brightness;
> +
>   	if (caps->data_points && !(amdgpu_dc_debug_mask & DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE)) {
>   		drm_info(drm, "Using custom brightness curve\n");
>   		props.scale = BACKLIGHT_SCALE_NON_LINEAR;
> @@ -5297,6 +5301,18 @@ amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
>   					  &amdgpu_dm_backlight_ops, &props);
>   	dm->brightness[aconnector->bl_idx] = props.brightness;
>   
> +	/*
> +	 * dm->brightness[x] can be inconsistent just after startup until
> +	 * ops.get_brightness is called.
> +	 */
> +	real_brightness =
> +		amdgpu_dm_backlight_ops.get_brightness(dm->backlight_dev[aconnector->bl_idx]);
> +
> +	if (real_brightness != init_brightness) {
> +		dm->actual_brightness[aconnector->bl_idx] = real_brightness;
> +		dm->brightness[aconnector->bl_idx] = real_brightness;
> +	}
> +

I think this call should be after the IS_ERR() check right below it in 
only the case that IS_ERR() failed.

>   	if (IS_ERR(dm->backlight_dev[aconnector->bl_idx])) {
>   		drm_err(drm, "DM: Backlight registration failed!\n");
>   		dm->backlight_dev[aconnector->bl_idx] = NULL;

