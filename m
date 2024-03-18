Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D6687E93C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 13:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF98210F652;
	Mon, 18 Mar 2024 12:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9AAB010F654
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 12:21:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CAD0DA7;
 Mon, 18 Mar 2024 05:22:12 -0700 (PDT)
Received: from [10.57.12.69] (unknown [10.57.12.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 073553F762;
 Mon, 18 Mar 2024 05:21:34 -0700 (PDT)
Message-ID: <794bff85-4b59-42e5-ad6c-2a39609fe74f@arm.com>
Date: Mon, 18 Mar 2024 12:21:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Only display fdinfo's engine and cycle tags
 when profiling is on
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240316231306.293817-1-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240316231306.293817-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 16/03/2024 23:13, Adrián Larumbe wrote:
> If job accounting is disabled, then both fdinfo's drm-engine and drm-cycle
> key values will remain immutable. In that case, it makes more sense not to
> display them at all to avoid confusing user space profiling tools.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index eec250114114..ef9f6c0716d5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -550,10 +550,12 @@ static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
>  	BUILD_BUG_ON(ARRAY_SIZE(engine_names) != NUM_JOB_SLOTS);
>  
>  	for (i = 0; i < NUM_JOB_SLOTS - 1; i++) {
> -		drm_printf(p, "drm-engine-%s:\t%llu ns\n",
> -			   engine_names[i], panfrost_priv->engine_usage.elapsed_ns[i]);
> -		drm_printf(p, "drm-cycles-%s:\t%llu\n",
> -			   engine_names[i], panfrost_priv->engine_usage.cycles[i]);
> +		if (pfdev->profile_mode) {
> +			drm_printf(p, "drm-engine-%s:\t%llu ns\n",
> +				   engine_names[i], panfrost_priv->engine_usage.elapsed_ns[i]);
> +			drm_printf(p, "drm-cycles-%s:\t%llu\n",
> +				   engine_names[i], panfrost_priv->engine_usage.cycles[i]);
> +		}
>  		drm_printf(p, "drm-maxfreq-%s:\t%lu Hz\n",
>  			   engine_names[i], pfdev->pfdevfreq.fast_rate);
>  		drm_printf(p, "drm-curfreq-%s:\t%lu Hz\n",
> 
> base-commit: 97252d0a4bfbb07079503d059f7522d305fe0f7a

