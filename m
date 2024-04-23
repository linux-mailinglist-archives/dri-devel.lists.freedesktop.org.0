Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C17988AE10F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 11:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEEC1129F3;
	Tue, 23 Apr 2024 09:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HR70rwkZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF9A10FAD9;
 Tue, 23 Apr 2024 09:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713864741; x=1745400741;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ymj4bE7Ir1JU2jroIaeg0DpQ5XMKOlOl++dCMQZO7mI=;
 b=HR70rwkZRwkqZu3P1vyOgNcPPhrXVnpql8pRla4Oh1vZ9QPPLwC1syg8
 RQWvw9Cee567j8BucpFl7mx0mJkmCmGFbR06Yq4YQUAN0h2Nh7gi/XUww
 IxBUBo25uilExtpEUtxf5dirF0je593q+hBpohTnzAUt/Sg37PUcyNOBl
 dcAetEjkNxNH8IvaFHKlEaIFI0SpfmXgT7jodmx5+/tl1EMHcEdIhLDjM
 zh0nAGaJL23rU0k9o5/zx/i/m0em4vVKwcKHjo9rfsGxUyy2a96CnAG+l
 nINkbKa6UcodztcR6sPCOeHJNaQeZVEvdeRlJhKWr3qHqXDtimrQfurHN A==;
X-CSE-ConnectionGUID: IHcg7YfQQvKTvwzlc3MLFA==
X-CSE-MsgGUID: 6WB8DYMsTNOc0u24eyXicA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9292179"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9292179"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:32:18 -0700
X-CSE-ConnectionGUID: HSHyYy1MQVyw5LUsvnscIw==
X-CSE-MsgGUID: HcHJOd4CQ3+S37bJF6/a8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24359246"
Received: from unknown (HELO intel.com) ([10.247.119.79])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:32:13 -0700
Date: Tue, 23 Apr 2024 11:32:00 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 John.C.Harrison@intel.com
Subject: Re: [PATCH v2 2/2] drm/i915: Fix gt reset with GuC submission is
 disabled
Message-ID: <ZieAEGnCE88TY0GM@ashyti-mobl2.lan>
References: <20240422201951.633-1-nirmoy.das@intel.com>
 <20240422201951.633-2-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422201951.633-2-nirmoy.das@intel.com>
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

Hi Nirmoy,

On Mon, Apr 22, 2024 at 10:19:51PM +0200, Nirmoy Das wrote:
> Currently intel_gt_reset() kills the GuC and then resets requested
> engines. This is problematic because there is a dedicated CSB FIFO
> which only GuC can access and if that FIFO fills up, the hardware
> will block on the next context switch until there is space that means
> the system is effectively hung. If an engine is reset whilst actively
> executing a context, a CSB entry will be sent to say that the context
> has gone idle. Thus if reset happens on a very busy system then
> killing GuC before killing the engines will lead to deadlock because
> of filled up CSB FIFO.

is this a fix?

> To address this issue, the GuC should be killed only after resetting
> the requested engines and before calling intel_gt_init_hw().
> 
> v2: Improve commit message(John)
> 
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_reset.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index b1393863ca9b..6161f7a3ff70 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -879,8 +879,17 @@ static intel_engine_mask_t reset_prepare(struct intel_gt *gt)
>  	intel_engine_mask_t awake = 0;
>  	enum intel_engine_id id;
>  
> -	/* For GuC mode, ensure submission is disabled before stopping ring */
> -	intel_uc_reset_prepare(&gt->uc);
> +	/**
> +	 * For GuC mode with submission enabled, ensure submission
> +	 * is disabled before stopping ring.

nit: "stopping *the* ring"

> +	 *
> +	 * For GuC mode with submission disabled, ensure that GuC is not
> +	 * sanitized, do that after engine reset. reset_prepare()
> +	 * is followed by engine reset which in this mode requires GuC to
> +	 * process any CSB FIFO entries generated by the resets.
> +	 */
> +	if (intel_uc_uses_guc_submission(&gt->uc))
> +		intel_uc_reset_prepare(&gt->uc);
>  
>  	for_each_engine(engine, gt, id) {
>  		if (intel_engine_pm_get_if_awake(engine))
> @@ -1227,6 +1236,9 @@ void intel_gt_reset(struct intel_gt *gt,
>  
>  	intel_overlay_reset(gt->i915);
>  
> +	/* sanitize uC after engine reset */
> +	if (!intel_uc_uses_guc_submission(&gt->uc))
> +		intel_uc_reset_prepare(&gt->uc);

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
