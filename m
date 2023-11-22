Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101657F4155
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 10:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461A910E5EA;
	Wed, 22 Nov 2023 09:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F4010E2FA;
 Wed, 22 Nov 2023 09:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700644516; x=1732180516;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RrwEo1VDHhlnf+Pa2Ly1JESTxjciztMmCHm/k/NWo+I=;
 b=IbgB0IA+OjpO7khSMZaQJJnqrot6Z6k+5g1OW5jRhirNsFkqIDTlWe7W
 7Bj9bUiI2ALucXokNkeMY7upyGhBvOxOzFw+Rcaugl+KOU4P/bY0/Y+vT
 huZEaWXuIE9LNKgWU+OQb9fzpfXQ7PJ+h1l1FFktG15UoQARLkVV6gzph
 1TYBxuC0W+zFfnEfYaSuvqGr46yBVRVJ8lwBaa19hxOhS0yQmFxLBsAUx
 nFlfxbtYH/9GG+tl7D8kJfvisWkGCDiUO6TJJ7qBQ89Ih4LrLdrwI0+0W
 SqtuyuwDC96hr0KZdqmaPeCymeYSel+ImU9txQN5L2t0w8FjlD01hGjmZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5158991"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="5158991"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 01:15:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1098335938"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="1098335938"
Received: from tjquresh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 01:14:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm/i915/psr: Fix unsigned expression compared with zero
In-Reply-To: <20231122085239.89046-1-jiapeng.chong@linux.alibaba.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231122085239.89046-1-jiapeng.chong@linux.alibaba.com>
Date: Wed, 22 Nov 2023 11:14:57 +0200
Message-ID: <87y1eqm9ny.fsf@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, Mika Kahola <mika.kahola@intel.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 intel-gfx@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Nov 2023, Jiapeng Chong <jiapeng.chong@linux.alibaba.com> wrote:
> The entry_setup_frames is defined as u8 type, else(entry_setup_frames < 0)
> is invalid. At the same time, the return value of function
> intel_psr_entry_setup_frames is also of type int. so modified
> its type to int.
>
> ./drivers/gpu/drm/i915/display/intel_psr.c:1336:5-23: WARNING: Unsigned expression compared with zero: entry_setup_frames >= 0.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7610
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

There's already a patch. Mika, please follow up with it.

https://patchwork.freedesktop.org/patch/msgid/20231116090512.480373-1-mika.kahola@intel.com

> ---
>  drivers/gpu/drm/i915/display/intel_psr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 8d180132a74b..204da50e3f28 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -1319,7 +1319,7 @@ static bool _psr_compute_config(struct intel_dp *intel_dp,
>  {
>  	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
>  	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
> -	u8 entry_setup_frames;
> +	int entry_setup_frames;
>  
>  	/*
>  	 * Current PSR panels don't work reliably with VRR enabled

-- 
Jani Nikula, Intel
