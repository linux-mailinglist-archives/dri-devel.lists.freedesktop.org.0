Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A088868ED6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD51610E73C;
	Tue, 27 Feb 2024 11:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TsipD+t4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F7C10E73C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709033612; x=1740569612;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9d80XHNX5FggFotKvEB3IZO9mekZDixu6kmrdgz7788=;
 b=TsipD+t4/pG5B2jPn1Widl0n7eAjiLLsYu8q+Re3j+DXd3+xPzADe6Ce
 a9/CZKM8UjiZQXyTVP10AdDU/cL7QSan8Pp9nuBaikEFnH8nQdvi2xSj/
 MTQ/LCaV2nHcqvCLRjOm+8Ooshb5aoVsV2SxTNb71pzCA20eVHaFNUT9L
 oM8AMv0QYyW+o46XOCkjbmFwjcpJWhdpMnqApST2bGhDVcasA4P4bsFPv
 QiSPTDTYsyOMuWSrcDGlBc5VfH6BE58hP11CxaymfXlWSHdYlkkVB5XoS
 oHm2RBDLNc0ehzUmTBY8jgnP3rDQvA+CkLG2qcp5NcfFakAuVwMVNdZq0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25831454"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="25831454"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 03:33:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="11608743"
Received: from bdallmer-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.187])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 03:33:28 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thierry Reding <thierry.reding@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Remove drm_num_crtcs() helper
In-Reply-To: <20240227112038.411846-1-thierry.reding@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240227112038.411846-1-thierry.reding@gmail.com>
Date: Tue, 27 Feb 2024 13:33:24 +0200
Message-ID: <87edcyjg57.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 27 Feb 2024, Thierry Reding <thierry.reding@gmail.com> wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> The drm_num_crtcs() helper determines the number of CRTCs by iterating
> over the list of CRTCs that have been registered with the mode config.
> However, we already keep track of that number in the mode config's
> num_crtcs field, so we can simply retrieve the value from that and
> remove the extra helper function.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_crtc.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 6795624f16e7..82c665d3e74b 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -107,18 +107,6 @@ int drm_crtc_force_disable(struct drm_crtc *crtc)
>  	return drm_mode_set_config_internal(&set);
>  }
>  
> -static unsigned int drm_num_crtcs(struct drm_device *dev)
> -{
> -	unsigned int num = 0;
> -	struct drm_crtc *tmp;
> -
> -	drm_for_each_crtc(tmp, dev) {
> -		num++;
> -	}
> -
> -	return num;
> -}
> -
>  int drm_crtc_register_all(struct drm_device *dev)
>  {
>  	struct drm_crtc *crtc;
> @@ -278,8 +266,7 @@ static int __drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *
>  	if (name) {
>  		crtc->name = kvasprintf(GFP_KERNEL, name, ap);
>  	} else {
> -		crtc->name = kasprintf(GFP_KERNEL, "crtc-%d",
> -				       drm_num_crtcs(dev));
> +		crtc->name = kasprintf(GFP_KERNEL, "crtc-%d", config->num_crtc);
>  	}
>  	if (!crtc->name) {
>  		drm_mode_object_unregister(dev, &crtc->base);

-- 
Jani Nikula, Intel
