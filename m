Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9806E988029
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4298D10E19E;
	Fri, 27 Sep 2024 08:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6rL3U7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8374310E145;
 Fri, 27 Sep 2024 08:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727425244; x=1758961244;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ciKZ7fyG7EQCIIC1pnDqm3+FhRp/aFH6oclRu+SsR4s=;
 b=j6rL3U7yehIPIp1k4g3iCIf+POKDSM6HrRTACfTYhOKOnT2VQtvt8ACU
 uPfOaNbNjcBdRmx3X67AyMvoEmQGhOwvw+nXmb3c7uQ4B3Gn4x1h3nxDy
 4VYGDiIwLx3Wapk5XJcr1axnG2RxVuWt+c2Ylm4+FXdnM1a7XUJAFj8Gu
 l0EO/lU289YA189BYZyvu6iW37iYA5JSB6Vo9eGnkXQ3r8fWhMOAudETb
 le/KrcD17nKRCo0m012ZZ7e+qOBfbpSQYPKnQbU/3mRFCiKBNX+I9CpsZ
 2vaje3WQATie1poli1UGGNOFwHU3/8VJvo3OSvUQm2l6T6/NMC/kvHNQC w==;
X-CSE-ConnectionGUID: WRfmd6VqTIWdMyk3wPChSA==
X-CSE-MsgGUID: MUmUUhwuRnatWx9rLLeVZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="44030167"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="44030167"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 01:20:43 -0700
X-CSE-ConnectionGUID: dPic5LqbQs2pNBTZTNz8sg==
X-CSE-MsgGUID: El3NEdyzRgua84QjVM1kkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="103248182"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.211])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 01:20:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alessandro Zanni <alessandro.zanni87@gmail.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: Alessandro Zanni <alessandro.zanni87@gmail.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, anupnewsmail@gmail.com, Ville Syrjala
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] gpu: drm: i915: display: Avoid null values
 intel_plane_atomic_check_with_state
In-Reply-To: <20240927000146.50830-1-alessandro.zanni87@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240927000146.50830-1-alessandro.zanni87@gmail.com>
Date: Fri, 27 Sep 2024 11:20:32 +0300
Message-ID: <87tte1zewf.fsf@intel.com>
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

On Fri, 27 Sep 2024, Alessandro Zanni <alessandro.zanni87@gmail.com> wrote:
> This fix solves multiple Smatch errors:
>
> drivers/gpu/drm/i915/display/intel_atomic_plane.c:660
> intel_plane_atomic_check_with_state() error:
> we previously assumed 'fb' could be null (see line 648)
>
> drivers/gpu/drm/i915/display/intel_atomic_plane.c:664
> intel_plane_atomic_check_with_state()
> error: we previously assumed 'fb' could be null (see line 659)
>
> drivers/gpu/drm/i915/display/intel_atomic_plane.c:671
> intel_plane_atomic_check_with_state()
> error: we previously assumed 'fb' could be null (see line 663)
>
> We should check first if fb is not null before to access its properties.

new_plane_state->uapi.visible && !fb should not be possible, but it's
probably too hard for smatch to figure out. It's not exactly trivial for
humans to figure out either.

I'm thinking something like below to help both.

Ville, thoughts?


BR,
Jani.


diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 3505a5b52eb9..d9da47aed55d 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -629,6 +629,9 @@ int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_
 	if (ret)
 		return ret;
 
+	if (drm_WARN_ON(display->drm, new_plane_state->uapi.visible && !fb))
+		return -EINVAL;
+
 	if (fb)
 		new_crtc_state->enabled_planes |= BIT(plane->id);
 


>
> Signed-off-by: Alessandro Zanni <alessandro.zanni87@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index e979786aa5cf..1606f79b39e6 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -656,18 +656,18 @@ int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_
>  	    intel_plane_is_scaled(new_plane_state))
>  		new_crtc_state->scaled_planes |= BIT(plane->id);
>  
> -	if (new_plane_state->uapi.visible &&
> +	if (new_plane_state->uapi.visible && fb &&
>  	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
>  		new_crtc_state->nv12_planes |= BIT(plane->id);
>  
> -	if (new_plane_state->uapi.visible &&
> +	if (new_plane_state->uapi.visible && fb &&
>  	    fb->format->format == DRM_FORMAT_C8)
>  		new_crtc_state->c8_planes |= BIT(plane->id);
>  
>  	if (new_plane_state->uapi.visible || old_plane_state->uapi.visible)
>  		new_crtc_state->update_planes |= BIT(plane->id);
>  
> -	if (new_plane_state->uapi.visible &&
> +	if (new_plane_state->uapi.visible && fb &&
>  	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
>  		new_crtc_state->data_rate_y[plane->id] =
>  			intel_plane_data_rate(new_crtc_state, new_plane_state, 0);

-- 
Jani Nikula, Intel
