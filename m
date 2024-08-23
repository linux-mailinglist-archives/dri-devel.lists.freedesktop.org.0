Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CDB95C7FB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 10:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA0210EC4B;
	Fri, 23 Aug 2024 08:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akL0SSKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2CC10EC49;
 Fri, 23 Aug 2024 08:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724401487; x=1755937487;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7gEhOXTRHZaE+9aqx6sV7SuHwRI3hywFQ4vGtE9lh4I=;
 b=akL0SSKQfhEfsdDw9pYy7csT46psDRnZjwRWLshkNjQFvX4rJF0hFwYP
 /z613/CR0ZPZOlk2U0+NIK6nXkbFYxoMugAi3sr9RTyQX5vaal41incyN
 gFxIuA9sCpnKShySJMv8ostRZQx42TUvUUZFmkEZsxSPD1Lo6xZiMhC4X
 WGLrJa3O3y+cvdcJvN9YyR+gkEhi0HsIeIgDQU+BrRzmeD/NZ6tSQMg/p
 yqdlOprzXgVw6Ufbzc9oCbLoV5PBMpxikez63clseb9YvENwa1za6LI90
 kMtIHiPpJS9Lb6KtMGiDfmY6/MvnZoEurOU3tKuXwK/AV3pCEu0gD3VqW g==;
X-CSE-ConnectionGUID: y6PSEGSuTT2gQ1GBqGQnOg==
X-CSE-MsgGUID: AKgmc7LIScKiBsAnOWsGcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33521807"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="33521807"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 01:24:46 -0700
X-CSE-ConnectionGUID: ockf3KIFQXGmYDq18RPupw==
X-CSE-MsgGUID: 9i6pdE+rT+q3tvF0dEwHvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="92522146"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.223])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 01:24:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yuesong Li <liyuesong@vivo.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com, Yuesong Li <liyuesong@vivo.com>
Subject: Re: [PATCH v1] drm/i915/dp: Remove double assignment in
 intel_dp_compute_as_sdp()
In-Reply-To: <20240823023612.3027849-1-liyuesong@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240823023612.3027849-1-liyuesong@vivo.com>
Date: Fri, 23 Aug 2024 11:24:36 +0300
Message-ID: <87seuv3auz.fsf@intel.com>
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

On Fri, 23 Aug 2024, Yuesong Li <liyuesong@vivo.com> wrote:
> cocci report a double assignment warning. 'as_sdp->duration_incr_ms'
> was assigned twice in intel_dp_compute_as_sdp().
>
> Signed-off-by: Yuesong Li <liyuesong@vivo.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 6a0c7ae654f4..229c87be4402 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2730,7 +2730,6 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
>  	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
>  	as_sdp->length = 0x9;
>  	as_sdp->duration_incr_ms = 0;
> -	as_sdp->duration_incr_ms = 0;
>  
>  	if (crtc_state->cmrr.enable) {
>  		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;

-- 
Jani Nikula, Intel
