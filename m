Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC53AD13CEC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 16:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A701410E40B;
	Mon, 12 Jan 2026 15:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rGyjzEAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9898810E408;
 Mon, 12 Jan 2026 15:52:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5E789442AB;
 Mon, 12 Jan 2026 15:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF30C16AAE;
 Mon, 12 Jan 2026 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768233142;
 bh=KWCUPfdTCOxM+OGgL7C9d8L3KAzjyilfSdxECTaSnIw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rGyjzEAOAitLBs7Mpy9qLpdeK53KafRW2CihF0trgjNzRwB5LvNfmtO28wNvmdj2n
 JVDZNFv0BJeXqIzJ+7PzxjnzBKrIC/YgyIviyeezFUnHP5jJerdSSSdymF1NYtuZ86
 4cMX1gNHOb+ZMWfjMKawXBZtC5qgEeQRgXGtrGU1shOFRI8IK6e+wfdJG3NWNdVxkJ
 jct3ua9uV4Edmc4JFTBs858emmeCY1UJL59XX2d2Kje3083XmwyGetyaqGbFQP8z07
 DiE/78K44RZrdaqd5NQogwFhxc9EFoaaQzHHVxuqjY5ZVsrdpu8hESakCjn9XHdqRf
 0sL8StoOTJeRw==
Message-ID: <d928e0e0-2478-4cdc-9d7d-5a984a8146d2@kernel.org>
Date: Mon, 12 Jan 2026 09:52:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: Initialise backlight level values
 from hw
To: Vivek Das Mohapatra <vivek@collabora.com>
Cc: airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com,
 kernel@collabora.com, linux-kernel@vger.kernel.org, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com
References: <7ec7b4ae-6186-4961-a857-f97afcfc3ded@kernel.org>
 <20260112152856.2616532-1-vivek@collabora.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260112152856.2616532-1-vivek@collabora.com>
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

On 1/12/26 9:28 AM, Vivek Das Mohapatra wrote:
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

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 354e359c4507..9e8cbfeee915 100644
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
> @@ -5300,8 +5304,20 @@ amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
>   	if (IS_ERR(dm->backlight_dev[aconnector->bl_idx])) {
>   		drm_err(drm, "DM: Backlight registration failed!\n");
>   		dm->backlight_dev[aconnector->bl_idx] = NULL;
> -	} else
> +	} else {
> +		/*
> +		 * dm->brightness[x] can be inconsistent just after startup until
> +		 * ops.get_brightness is called.
> +		 */
> +		real_brightness =
> +			amdgpu_dm_backlight_ops.get_brightness(dm->backlight_dev[aconnector->bl_idx]);
> +
> +		if (real_brightness != init_brightness) {
> +			dm->actual_brightness[aconnector->bl_idx] = real_brightness;
> +			dm->brightness[aconnector->bl_idx] = real_brightness;
> +		}
>   		drm_dbg_driver(drm, "DM: Registered Backlight device: %s\n", bl_name);
> +	}
>   }
>   
>   static int initialize_plane(struct amdgpu_display_manager *dm,

