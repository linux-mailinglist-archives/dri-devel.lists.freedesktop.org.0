Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5197B94B205
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 23:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4433A10E5EA;
	Wed,  7 Aug 2024 21:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFxu8Hb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540AF10E5E9;
 Wed,  7 Aug 2024 21:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723065718; x=1754601718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Dq1+AV92i31+4oeKeLoCAinDWxNJUx71g/nSYf1wiqo=;
 b=NFxu8Hb1+5p5jj3bz79LSDNIYAErrsCii5xwH2q/qpq7KoSTgutXMOiW
 fMNE+RH47lmGwaJp3waOE/Xm4OGHSdFP8sJu27koxrwpnxk3uUnG/hVPM
 ouMEtHHLzPsjidjOv2lHrwBwmzSNY+4RG2AMjBRpLrBdwLp/4fhNc85Th
 yWiau2NLe0DR5JxbOjpEs1Yawe5LIhfQL36S7NE9xPpCQWWlNurUprNDW
 Yc2yIuNfboD4g9eTU9BWMp3KJw7nfrQJkJbfMdN0j0SJU0GwdYhvS+XY4
 gW8wLQ8WKXZkV59pLCJbtbskQrZ5/eQOunt2T11LupetC48jETVpSSUwJ Q==;
X-CSE-ConnectionGUID: 44kHqaplQqGds8NI03h+jg==
X-CSE-MsgGUID: mTfr2gJkTLSqZsTmA+G7jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21285335"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="21285335"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 14:21:57 -0700
X-CSE-ConnectionGUID: 5nV0nHCrQNqcrggwMFCChg==
X-CSE-MsgGUID: SnpUb/X8QU65IyoY1zD1rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="56946448"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.42])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 14:21:52 -0700
Date: Wed, 7 Aug 2024 22:21:48 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 airlied@gmail.com, daniel@ffwll.ch, ville.syrjala@linux.intel.com,
 stanislav.lisovskiy@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix NULL ptr deref in
 intel_async_flip_check_uapi()
Message-ID: <ZrPlbBGFAGLVfGf3@ashyti-mobl2.lan>
References: <20240806092249.2407555-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806092249.2407555-1-make24@iscas.ac.cn>
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

Hi Ma,

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index c2c388212e2e..9dd7b5985d57 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6115,7 +6115,7 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
>  		return -EINVAL;
>  	}
>  
> -	if (intel_crtc_needs_modeset(new_crtc_state)) {
> +	if (new_crtc_state && intel_crtc_needs_modeset(new_crtc_state)) {

new_crtc_state is used also earlier. If it was NULL you wouldn't
have reached this state.

Have you experienced a null pointer dereference or is it some
code analyzer that reported this? Can you explain how
intel_atomic_get_new_crtc_state() can return NULL?

For now this is nacked.

Thanks,
Andi
