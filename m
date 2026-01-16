Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7175D2F0A3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 10:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD7010E843;
	Fri, 16 Jan 2026 09:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xl9fu/wE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1738F10E840;
 Fri, 16 Jan 2026 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768557055; x=1800093055;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rGnuuiGHTCK33n12B8lS8ws8dXFlcVUBexrpfI0qXH0=;
 b=Xl9fu/wEIoO1aKVADaMDKSC4u565sicDH8U8BVHtYY7HIkyXkXw8OpMN
 8VfV+09p5u+mKjNJaQnfZpm86h5EdFSGuOh0U1ne86MkTNSAgYnTKUHAN
 9Ldg94lUIQmmiLvtGbp8QrWFVXws9/WVSdKq8gxO8pL96jRXvvz64dDHd
 OtRBpRfJtc10+hqRj0NuaPIHl7AWuxEHfDjAH6gNop2QGNlqMbEMxKlB0
 UAsf7N2KJZYzsxGooo7QPrAGjfRy7lO2JCYIZwiwmhrCyeag6xFYkJwGZ
 Vf+GEjdWUa5TH2pKwkGv8kcb6MI/h5+HfPK/515PfCANYCRLQJNtcl5Fv A==;
X-CSE-ConnectionGUID: k7cif0KASyCXo7eiNpEpNQ==
X-CSE-MsgGUID: ZYyRCbQaTTKMsoqXx4jw7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80987496"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="80987496"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 01:50:54 -0800
X-CSE-ConnectionGUID: JX+nYLThTNGpaL+oGubYAA==
X-CSE-MsgGUID: lnj2SeAwSX6+MEk3w6U9aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="235893561"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 01:50:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kaushlendra Kumar <kaushlendra.kumar@intel.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kaushlendra Kumar
 <kaushlendra.kumar@intel.com>
Subject: Re: [PATCH] drm/i915/crtc: Guard vblank wait when CRTC lookup fails
In-Reply-To: <20260116062203.1650454-1-kaushlendra.kumar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260116062203.1650454-1-kaushlendra.kumar@intel.com>
Date: Fri, 16 Jan 2026 11:50:46 +0200
Message-ID: <6f7ad8bd5d41e50176d98cfb658aaa7b77f63cd0@intel.com>
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

On Fri, 16 Jan 2026, Kaushlendra Kumar <kaushlendra.kumar@intel.com> wrote:
> intel_crtc_for_pipe() may return NULL in teardown/error paths.
> Add a NULL check in intel_wait_for_vblank_if_active() to avoid
> dereferencing a missing CRTC and rare NULL deref panics.

Do you have the backtrace?

BR,
Jani.

>
> Fixes: 92e9624ad946 ("drm/i915/crtc: un-inline some crtc functions and move to intel_crtc.[ch]")
> Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index 9d2a23c96c61..9eb158737c1c 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -74,7 +74,7 @@ void intel_wait_for_vblank_if_active(struct intel_display *display,
>  {
>  	struct intel_crtc *crtc = intel_crtc_for_pipe(display, pipe);
>  
> -	if (crtc->active)
> +	if (crtc && crtc->active)
>  		intel_crtc_wait_for_next_vblank(crtc);
>  }

-- 
Jani Nikula, Intel
