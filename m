Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2A5A17D7C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 13:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AEF10E584;
	Tue, 21 Jan 2025 12:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+Srm34y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C4E10E56B;
 Tue, 21 Jan 2025 12:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737461156; x=1768997156;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5ZOTaWU0pr3Lkza45u81StZ/TTvBCTMGO3w3mo/GCRI=;
 b=A+Srm34ylO5zXJIokGmcALu5HJ0H5WL6hajyY+XFyqCXebd2x2XL4tJI
 s1jl3NstWdiuWwgnWIj/UthhxlB5ZLOaCHAZAkg4iepiOERctKS21fIlq
 q8B6RE7pc7Q6ABC3QVWhXjv+Ckm24D9Z4CYBX8pz8xoLaZuAmgFHzoZvD
 gDo2VC3CYYnsTYEKg7t0Uj3A172/YITXNxBipaC8QbEm3uDs6wFW+oBiD
 oPuCwtk/jJxHC7FfaOHd9rQjE9u2KtPXd+La4kDvq8TCaz07KztCfLRnE
 1+KLsFQk4lwMzBoetmKhyE0TrAfE8cdVkdQzdydsZTo2i0nlB5I5s4qgU Q==;
X-CSE-ConnectionGUID: ORLRJBUoRTS+ygpmep4cfQ==
X-CSE-MsgGUID: oiLXXrP5TFmyxtSQYrxbAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="41627744"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="41627744"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 04:05:56 -0800
X-CSE-ConnectionGUID: 7t2LdGxxR2uicw5lGtmolw==
X-CSE-MsgGUID: pqHbNiEgQtaAHWqjMY0kAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="130069645"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.186])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 04:05:52 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: evepolonium@gmail.com, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/i915/fbdev: Discard large BIOS framebuffers
In-Reply-To: <20250121104210.3159-1-evepolonium@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250121104210.3159-1-evepolonium@gmail.com>
Date: Tue, 21 Jan 2025 14:05:49 +0200
Message-ID: <87ldv4pe1u.fsf@intel.com>
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

On Tue, 21 Jan 2025, Atharva Tiwari <evepolonium@gmail.com> wrote:
> On certain 4K panels, the BIOS framebuffer
> exceeds the panel's required dimensions,
> leading to display corruption.
> This patch introduces a validation check to address the issue.
>
> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>

See [1], [2], and [3].

Please add your dmesg with debugs enabled to [3].

BR,
Jani.


[1] https://lore.kernel.org/r/31D69334-DEF9-41B7-968B-B847796926FF@outlook.com

[2] https://lore.kernel.org/r/Yd7ZnBlU0sjP4qcG@intel.com

[3] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13466


> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 00852ff5b247..e8cf06772c31 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -197,10 +197,10 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  	ifbdev->fb = NULL;
>  
>  	if (fb &&
> -	    (sizes->fb_width > fb->base.width ||
> -	     sizes->fb_height > fb->base.height)) {
> +	    (sizes->fb_width != fb->base.width ||
> +	     sizes->fb_height != fb->base.height)) {
>  		drm_dbg_kms(&dev_priv->drm,
> -			    "BIOS fb too small (%dx%d), we require (%dx%d),"
> +			    "BIOS fb dimensions mismatch (%dx%d), we require (%dx%d),"
>  			    " releasing it\n",
>  			    fb->base.width, fb->base.height,
>  			    sizes->fb_width, sizes->fb_height);

-- 
Jani Nikula, Intel
