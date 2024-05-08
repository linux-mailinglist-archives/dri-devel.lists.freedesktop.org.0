Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F49B8C054C
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 21:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7792B1131C7;
	Wed,  8 May 2024 19:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGL+6Gcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E091131C9;
 Wed,  8 May 2024 19:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715198206; x=1746734206;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JUYK14yf13OFljwh7Fkp50F+nLJd6ilr3LJXbhfPMz4=;
 b=NGL+6GcbuFKJT+MWXMVr8hyYix/KzFLb5FWgaLyc58HGW3l9Xhev8kqC
 1Xdo8eDAFa/LdbTTPTabxU33VHYe8JdeN+S7laZiBrvniYdFSBg4JHtrO
 I2j/jRuDSJEMmXS5MkkZw+2otVNCg61xZyzqXEj+nyFr6H8RH/BasMG95
 37CiwLthjOhDd3PY5R6B87c8fyzAn2U39MMOWmqqapzNnU9zQHjKCnJck
 vIRIeP/i6R5jL8k8Z9lbHP8GO5UvEsZPS2pUvS+xzlddsScBfC/FX3m5K
 SLw9HtoEfmRw3Ild6VisrNTNsaFOOoXJa38uKHH8+HxHCUF3DiQQqt6U/ Q==;
X-CSE-ConnectionGUID: VDpi+bSdTSeMO0rSGNTsHQ==
X-CSE-MsgGUID: HsQKsePXT82T8zoiMW4OSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28598135"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28598135"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:56:46 -0700
X-CSE-ConnectionGUID: exVjfBluR0qxXwvRQD+XYQ==
X-CSE-MsgGUID: VmMb/7PzRWCj/EI4T0uylw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28938967"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 08 May 2024 12:56:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 May 2024 22:56:40 +0300
Date: Wed, 8 May 2024 22:56:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Tyler Schneider <tyler.schneider@amd.com>
Subject: Re: [PATCH 1/2] drm: Allow mode object properties to be added after
 a device is registered
Message-ID: <ZjvY-B_VG0uBTiJO@intel.com>
References: <20240508194308.48366-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508194308.48366-1-mario.limonciello@amd.com>
X-Patchwork-Hint: comment
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

On Wed, May 08, 2024 at 02:43:07PM -0500, Mario Limonciello wrote:
> When the colorspace property is registered on MST devices there is
> no `obj_free_cb` callback for it in drm_mode_object_add().
> 
> Don't show a warning trace for __drm_mode_object_add() calls for
> DRM_MODE_OBJECT_PROPERTY.

You need to create the property ahead of time. See eg.
commit 1b9bd09630d4 ("drm/i915: Do not create a new max_bpc prop for MST
connectors")

> 
> Reported-and-tested-by: Tyler Schneider <tyler.schneider@amd.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3353
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/drm_mode_object.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> index 0e8355063eee..b077547a2db4 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -42,7 +42,7 @@ int __drm_mode_object_add(struct drm_device *dev, struct drm_mode_object *obj,
>  {
>  	int ret;
>  
> -	WARN_ON(!dev->driver->load && dev->registered && !obj_free_cb);
> +	WARN_ON(!dev->driver->load && dev->registered && !obj_free_cb && obj_type != DRM_MODE_OBJECT_PROPERTY);
>  
>  	mutex_lock(&dev->mode_config.idr_mutex);
>  	ret = idr_alloc(&dev->mode_config.object_idr, register_obj ? obj : NULL,
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
