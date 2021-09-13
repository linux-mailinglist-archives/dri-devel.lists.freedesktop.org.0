Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8138B409F10
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 23:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6446E255;
	Mon, 13 Sep 2021 21:22:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0B36E252;
 Mon, 13 Sep 2021 21:22:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="307351331"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="307351331"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 14:22:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="543490066"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 14:22:42 -0700
Date: Mon, 13 Sep 2021 14:17:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Cc: Intel-GFX@Lists.FreeDesktop.Org, DRI-Devel@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Refcount context during error
 capture
Message-ID: <20210913211742.GA6940@jons-linux-dev-box>
References: <20210913211016.2299138-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913211016.2299138-1-John.C.Harrison@Intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Mon, Sep 13, 2021 at 02:10:16PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> When i915 receives a context reset notification from GuC, it triggers
> an error capture before resetting any outstanding requsts of that
> context. Unfortunately, the error capture is not a time bound
> operation. In certain situations it can take a long time, particularly
> when multiple large LMEM buffers must be read back and eoncoded. If
> this delay is longer than other timeouts (heartbeat, test recovery,
> etc.) then a full GT reset can be triggered in the middle.
> 
> That can result in the context being reset by GuC actually being
> destroyed before the error capture completes and the GuC submission
> code resumes. Thus, the GuC side can start dereferencing stale
> pointers and Bad Things ensue.
> 
> So add a refcount get of the context during the entire reset
> operation. That way, the context can't be destroyed part way through
> no matter what other resets or user interactions occur.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index c7a41802b448..7291fd8f68a6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2920,6 +2920,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
>  {
>  	struct intel_context *ce;
>  	int desc_idx;
> +	unsigned long flags;
>  
>  	if (unlikely(len != 1)) {
>  		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> @@ -2927,11 +2928,24 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
>  	}
>  
>  	desc_idx = msg[0];
> +
> +	/*
> +	 * The context lookup uses the xarray but lookups only require an RCU lock
> +	 * not the full spinlock. So take the lock explicitly and keep it until the
> +	 * context has been reference count locked to ensure it can't be destroyed
> +	 * asynchronously until the reset is done.
> +	 */
> +	xa_lock_irqsave(&guc->context_lookup, flags);
>  	ce = g2h_context_lookup(guc, desc_idx);
> +	if (ce)
> +		intel_context_get(ce);
> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> +
>  	if (unlikely(!ce))
>  		return -EPROTO;
>  
>  	guc_handle_context_reset(guc, ce);
> +	intel_context_put(ce);

So this is going to directly conflict with a patch that I'm about to
post as I'm going to change the error capture to async operation. In
that case the intel_context_put would need to be done once that op
completes. I'll likely pull this patch into that series. I'd expect it
to be posted by the end of the day.

Matt 

>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 
