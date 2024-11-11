Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F829C4127
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 15:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B8510E4D9;
	Mon, 11 Nov 2024 14:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OW+KAPjd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D893810E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731336071; x=1762872071;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QC6ViF4IkpA7VCOBhetwyFyQO8qDfwObi+1D1VM2vtw=;
 b=OW+KAPjdc0wbEvPy2OVsvya7QQCoE+Fx3cH0StTfv50ZoQtHH6mzOcr7
 WOTwHCth3txaY0ZVOtXkrDIKizEuR54Ac/vBi0YL0CMO3d0RYSZEz+z8c
 aGFbvkTIyjvQjwdKGwfP4sXSIVb3SmtGAf2Izg+K4qjFepi5aqePFpGwg
 O/+z152T1xD65VVXhFoo7mvq4Pv8YffPfI+2xfQLr8P92OGaRsBTvMz0/
 onA2QiT2CrE9+SuJIw0TyWuC10pAJ+TbefPOCGmD0y2vFlXNAFeqzbSwO
 DWoCzMiDx45CruAC1k/cRK1g78MWExJALFiAjBDdQ2lofVr2icINeFUr/ w==;
X-CSE-ConnectionGUID: 8QaSinQoTI2yCNXXyWFpsQ==
X-CSE-MsgGUID: pXxxz4AcRG+P7y+FLLolKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="41772022"
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="41772022"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 06:41:11 -0800
X-CSE-ConnectionGUID: qzaX9EvWQue5xFFr0a2tfw==
X-CSE-MsgGUID: +0jsyEwVRhq2JDaq6Z2XUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="91725322"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.75])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 06:41:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Huacai Chen <chenhuacai@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Huacai Chen <chenhuacai@loongson.cn>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm: Remove redundant statement in
 drm_crtc_helper_set_mode()
In-Reply-To: <20241111132149.1113736-1-chenhuacai@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241111132149.1113736-1-chenhuacai@loongson.cn>
Date: Mon, 11 Nov 2024 16:41:04 +0200
Message-ID: <87o72lde9r.fsf@intel.com>
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

On Mon, 11 Nov 2024, Huacai Chen <chenhuacai@loongson.cn> wrote:
> Commit dbbfaf5f2641a ("drm: Remove bridge support from legacy helpers")
> removes the drm_bridge_mode_fixup() call in drm_crtc_helper_set_mode(),
> which makes the subsequent "encoder_funcs = encoder->helper_private" be
> redundant, so remove it.
>
> Cc: stable@vger.kernel.org
> Fixes: dbbfaf5f2641a ("drm: Remove bridge support from legacy helpers")

IMO not necessary because nothing's broken, it's just redundant.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/gpu/drm/drm_crtc_helper.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
> index 0955f1c385dd..39497493f74c 100644
> --- a/drivers/gpu/drm/drm_crtc_helper.c
> +++ b/drivers/gpu/drm/drm_crtc_helper.c
> @@ -334,7 +334,6 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
>  		if (!encoder_funcs)
>  			continue;
>  
> -		encoder_funcs = encoder->helper_private;
>  		if (encoder_funcs->mode_fixup) {
>  			if (!(ret = encoder_funcs->mode_fixup(encoder, mode,
>  							      adjusted_mode))) {

-- 
Jani Nikula, Intel
