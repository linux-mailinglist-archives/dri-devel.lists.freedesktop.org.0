Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9198A4E00
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9990310EF19;
	Mon, 15 Apr 2024 11:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ogm2Oxca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBE210EF19;
 Mon, 15 Apr 2024 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713181690; x=1744717690;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xfGsuQ0+69WyPQyrM0chU3taApNvAMTp1JOSNGMRqNI=;
 b=Ogm2Oxca7+at3g1kp90I8NPtcGGDelKu0cviKkp8PfbJckrwx3Me4ML9
 FDEn/tchmO4UPR9dRHKmLpONb56PSaDtNYVuEXbqI+OVFm3vKyQRHNwaO
 cu4bFlWFgSJxYYd6JHXYc1gEsApfPPAoxgV1+H9yRftLfukW1BcfN+4mR
 OcBw43TnXAzrWml60s8pW1JxwJIMfekLc6DDdktc0UFVoNyqd18JJZn9L
 R0f8+3uztTLFhDKaO1aZLPX6/0mtmI1IcetOxQ3P6wkGgw9mL2umEovEG
 LZb/gaFohkspZ9tPE+uy1kNMLvI16VpPFozmUx+CLWGVSONLA6eqjLDap w==;
X-CSE-ConnectionGUID: +rpz9F9WQJ+PssZq+GkPHA==
X-CSE-MsgGUID: a98MUvNqSiiGWDlUSw0AZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8675577"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8675577"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 04:48:09 -0700
X-CSE-ConnectionGUID: MagpnJfxQwSqujv0Sa0JEQ==
X-CSE-MsgGUID: cpszuV4gSz6IwlNTb3M1EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22364772"
Received: from lcariou-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.121])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 04:48:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jouni.hogander@intel.com,
 arun.r.murthy@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: Re: [PATCH v2 4/6] drm/i915/alpm: Add compute config for lobf
In-Reply-To: <20240412155243.2891996-5-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240412155243.2891996-1-animesh.manna@intel.com>
 <20240412155243.2891996-5-animesh.manna@intel.com>
Date: Mon, 15 Apr 2024 14:47:56 +0300
Message-ID: <87y19e3l03.fsf@intel.com>
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

On Fri, 12 Apr 2024, Animesh Manna <animesh.manna@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
> index c45d078e5a6b..c341d2c2b7f7 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> @@ -10,9 +10,14 @@
>  
>  struct intel_dp;
>  struct intel_crtc_state;
> +struct drm_connector_state;
>  
> +bool intel_dp_get_aux_less_alpm_status(struct intel_dp *intel_dp);

The names here are supposed to be intel_alpm_*. Is the function in the
wrong place or is the name wrong?

BR,
Jani.

>  bool intel_alpm_compute_params(struct intel_dp *intel_dp,
>  			       struct intel_crtc_state *crtc_state);
> +void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
> +				    struct intel_crtc_state *crtc_state,
> +				    struct drm_connector_state *conn_state);
>  void intel_alpm_configure(struct intel_dp *intel_dp);
>  
>  #endif

-- 
Jani Nikula, Intel
