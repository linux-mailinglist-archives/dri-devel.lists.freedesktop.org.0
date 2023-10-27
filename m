Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D0A7D8F5B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 09:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0600C10E93B;
	Fri, 27 Oct 2023 07:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F2610E93A;
 Fri, 27 Oct 2023 07:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698390840; x=1729926840;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=0UuQe6xKl4sTy++j9/NjWBw8agO/kqJEZWEeQBZ3c/Q=;
 b=fjL0w/gOAYC6wMMFUZmfm6bct7Bvn0zt1iecNCNNUMyHCCUZDoMXZNFz
 wdAKLSNeLbofIPtgm+OHpw2yuoqtKrSTL0dZh7tkzfBH01YDaBY3rhrVs
 OhVPM/C7ZELJZ3g5x9h5kJj3VK26o9MBixq6TQmQ7ZONujs+rwa/Zqu3F
 hxBH7QGh8fhR9CcJQM+MHEpkATvAd/AjjZObAflI9fUn51blSViIFPfZA
 dIm0fGE5hQbnXlITpVQrADVev6qwTURsZ4QdegP0bqQ4xH7hUo9nNL/VT
 7fFU8yCkvQpT7tc0MeSxrfV11l7NgKUmSBFeEGYgMEKX/wnnegYoV0Mez w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="387539885"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="387539885"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="7140086"
Received: from jhajducz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:12:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Skip pxp init if gt is wedged
In-Reply-To: <20231026215444.54880-1-zhanjun.dong@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231026215444.54880-1-zhanjun.dong@intel.com>
Date: Fri, 27 Oct 2023 10:13:54 +0300
Message-ID: <87a5s47d1p.fsf@intel.com>
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

On Thu, 26 Oct 2023, Zhanjun Dong <zhanjun.dong@intel.com> wrote:
> gt wedged is fatal error, skip the pxp init on this situation.

More information is needed in the commit message. When do you encounter
this situation?

I'll note that nobody checks intel_pxp_init() return status, so this
silently skips PXP.

BR,
Jani.

>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index dc327cf40b5a..923f233c91e1 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -212,6 +212,9 @@ int intel_pxp_init(struct drm_i915_private *i915)
>  	if (!gt)
>  		return -ENODEV;
>  
> +	if (intel_gt_is_wedged(gt))
> +		return -ENODEV;
> +
>  	/*
>  	 * At this point, we will either enable full featured PXP capabilities
>  	 * including session and object management, or we will init the backend tee

-- 
Jani Nikula, Intel
