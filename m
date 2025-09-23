Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9467B96174
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 15:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95D110E60B;
	Tue, 23 Sep 2025 13:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAX4jeqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E2C10E60B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 13:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758635508; x=1790171508;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KNsHfCNP5BcDpTQ3p9SIHGa9nh0HGDtnumDcWKGG+V0=;
 b=RAX4jeqNntM/TQJNLrnfQhBVknl2M8vRfd8xNKP/KVQZFD05LHFUC41Q
 weIryhpGfJj3C8zbTLQx3N+LulO/747kGUejHeLysNroAcReI+DyquPGb
 7sPBye9mXhFTuBtdSyCDh3XsOFLFSwJezXHzGhiO80HOi7X/9UizrfUFn
 Lzln4bX7M9ZkB43TE96cAPbS15wKlRatmrXf3LO/nCf4id2Iu7XyN2ZXm
 f073L//Zo5xm+o8G4/uUx9aqreXZ+uI3ROywXyIMZALXuavczn6722yi6
 /pKPkmmRqCBpe44G/CIj7XtSPA0JecoOnrl/XGrDZV2lNEMXME954WP6t A==;
X-CSE-ConnectionGUID: XCZ5mfx/R02/8hdshmjKhQ==
X-CSE-MsgGUID: NJ3F/FXWR8+cb34Yizf/FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64550601"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="64550601"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:51:47 -0700
X-CSE-ConnectionGUID: NPFOkG42QwKwZ+wCXwUQmg==
X-CSE-MsgGUID: ae/oMbIkS7me6pQQdxZZ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="181940449"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.94])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:51:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rahul Kumar <rk0006818@gmail.com>, lanzano.alex@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 rk0006818@gmail.com
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
In-Reply-To: <20250923110025.1358920-1-rk0006818@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250923110025.1358920-1-rk0006818@gmail.com>
Date: Tue, 23 Sep 2025 16:51:40 +0300
Message-ID: <712a27fc6c4060e67b3da58cb8564387b40b5971@intel.com>
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

On Tue, 23 Sep 2025, Rahul Kumar <rk0006818@gmail.com> wrote:
> Documentation/process/deprecated.rst recommends against the use of
> kmalloc with dynamic size calculations due to the risk of overflow and
> smaller allocation being made than the caller was expecting.
>
> Replace kmalloc() with kmalloc_array() in drivers/gpu/drm/tiny/repaper.c
> to make the intended allocation size clearer and avoid potential overflow
> issues.
>
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> ---
>  drivers/gpu/drm/tiny/repaper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 5c3b51eb0a97..4d439a2d973a 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -535,7 +535,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb,
>  	DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>  		  epd->factored_stage_time);
>  
> -	buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
> +	buf = kmalloc_array(fb->width, fb->height / 8, GFP_KERNEL);

That's just not the same thing, though.

BR,
Jani.

>  	if (!buf) {
>  		ret = -ENOMEM;
>  		goto out_exit;

-- 
Jani Nikula, Intel
