Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F07DBEA92D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5074810EC8D;
	Fri, 17 Oct 2025 16:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iB7QTdM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772DD10EC8D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760717770; x=1792253770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HAk5XarQfseeqeP7zVYEUF8QINQ4zYPsmcKTZ1AN/VI=;
 b=iB7QTdM509sfwgkFsOgC7prkCvVYnq8ZR+gsKNqgmkRtYF1WDkvqyaoN
 SjYcvoWg0sNZViameMSbGlceCFEzqwKiLZAmJ2YXoRMq42YNlwSD6Q+eB
 hMQ6Tot6YZzbRhX9caOHZz5Dm5YnW8ru4A4WOx0uEZGatRsayhsZTH+8h
 E9CZgrY3nN1Jn3wR/f5p/poVw2w90tZ7BfPlrCB9e3lGWD62FtlWh7A7e
 Pxks+HOGxDm4DocxMEgV/hCIE2qlzWCoXZAf18IB31ml3e3zY0dIpGr3L
 0T5CtLdi0cigzUnNmTvWF7U5rXhkWX+CvuHlW3tY5HwbGrbphsokSCuz+ Q==;
X-CSE-ConnectionGUID: MTU1K+6SSja4EDl/OYbx3g==
X-CSE-MsgGUID: +gf+lvqyRd60JfVLv5htng==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62978110"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="62978110"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:15:53 -0700
X-CSE-ConnectionGUID: zrBRjgAaQuOVNryk6/wZVA==
X-CSE-MsgGUID: XToEUZ7rRImx/pOoImC1/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="182712153"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.129])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:15:50 -0700
Date: Fri, 17 Oct 2025 19:15:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/sysfb: Fix a NULL vs IS_ERR() bug
Message-ID: <aPJrs7_u8KcalNsC@intel.com>
References: <aPJo1W5Dl4rmGX_P@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPJo1W5Dl4rmGX_P@stanley.mountain>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Oct 17, 2025 at 07:03:33PM +0300, Dan Carpenter wrote:
> The drm_atomic_get_crtc_state() function never returns NULL, it returns
> error pointers.  Update the error checking to match.
> 
> Fixes: cb71de092553 ("drm/sysfb: Lookup blit function during atomic check")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> index 8517c490e815..d2c4d8f3d4d0 100644
> --- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> +++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> @@ -259,7 +259,7 @@ int drm_sysfb_plane_helper_begin_fb_access(struct drm_plane *plane,
>  	ret = -EINVAL;
>  
>  	crtc_state = drm_atomic_get_crtc_state(plane_state->state, plane_state->crtc);

Looking at where this gets called, that should be
drm_atomic_get_new_crtc_state(). Either that or the
code is more seriously borked.

I'll send out a patch that warns about invalid use of 
*_get_state()...

> -	if (drm_WARN_ON_ONCE(dev, !crtc_state))
> +	if (drm_WARN_ON_ONCE(dev, IS_ERR(crtc_state)))
>  		goto err_drm_gem_end_shadow_fb_access;
>  	sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
>  
> -- 
> 2.51.0

-- 
Ville Syrjälä
Intel
