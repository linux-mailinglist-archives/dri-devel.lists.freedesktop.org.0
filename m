Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6D448B61C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 19:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD11910E224;
	Tue, 11 Jan 2022 18:51:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BE210E1CD;
 Tue, 11 Jan 2022 18:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641927093; x=1673463093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DxRGyG/Lxj0Vqy/vgv9C0AN2IiddMV+mvEIJhqDcuVM=;
 b=cGW3Ktun5Y6ZH304Lhg0klQO4FNB4IvE48ROSAlhLuFNbex+RSb1Wu89
 +tPFKL+3fgbeb6qhHhRIeJu5/MJzKI9qvROd1IhLFCVp3ya3FzG8GxhTN
 c8iejRNL1EHTppDkQh7ZDQMwJ7GRhJ0F0mjrVbmWnmEk+/wrKZxsfL6qo
 bJOeV8CuVmssIoSRhMaNa6z5GLLojOF0i6GKW4Q41CgHMc7oil2s17ajJ
 xl4wziMhDD9SRWL7OdBDF9q6YpaiYOnQ31lyeunNEUE9+2J8+OG1HIkTC
 IcJiW7sjMgwKyVlaHg1ECRcsjRWUYFj+w2bdi5kgf7dvOUC5HuxCc6Y2v A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="304299534"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="304299534"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 10:51:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="490474708"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 10:51:32 -0800
Date: Tue, 11 Jan 2022 10:45:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Subject: Re: [PATCH] drm/i915/guc: Don't error on reset of banned context
Message-ID: <20220111184541.GA14954@jons-linux-dev-box>
References: <20220107003143.326046-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107003143.326046-1-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@Lists.FreeDesktop.Org, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 06, 2022 at 04:31:43PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> There is a race (already documented in the code) whereby a context can
> be (re-)queued for submission at the same time as it is being banned
> due to a hang and reset. That leads to a hang/reset report from GuC
> for a context which i915 thinks is already banned.
> 

I think there are 2 issues here.

1. Banning of context (e.g. user closes a non-persistent context)
results in an context reset. In this case we will receive a G2H
indicating a context reset and we want to convert the context reset to a
nop.

2. A GT reset races with a context reset result in the context getting
banned before the G2H is processed. Again we want to convert the context
reset to a nop. This race should be sealed when we can flush the G2H
handler in the reset path. Flushing G2H handler depends on the error
capture not allocating memory in non-sleeping contexts. Thomas H had a
patch for this.

In both cases we shouldn't print an error.

> While the race is indented to be fixed in a future GuC update, there
> is no actual harm beyond the wasted execution time of that new hang
> detection period. The context has already been banned for bad
> behaviour so a fresh hang is hardly surprising and certainly isn't
> going to be losing any work that wouldn't already have been lost if
> there was no race.
>

See above, I think you are confusing the issues here. This won't be
fixed by an updated GuC firmware.

> So don't treat this situation as an error. The error message is seen
> by the CI system as something fatal and causes test failures. Instead,
> just print an informational so the user at least knows a context reset
> occurred (given that the error capture is being skipped).
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9989d121127d..e8a32a7e7daf 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3978,6 +3978,10 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>  		   !context_blocked(ce))) {
>  		capture_error_state(guc, ce);
>  		guc_context_replay(ce);
> +	} else if (intel_context_is_banned(ce)) {
> +		drm_info(&guc_to_gt(guc)->i915->drm,
> +			 "Reset notificaion for banned context 0x%04X on %s",
> +			 ce->guc_id.id, ce->engine->name);

The context being blocking isn't an error either. I think real fix is
changing the below drm_err to drm_info and call it a day.

Matt

>  	} else {
>  		drm_err(&guc_to_gt(guc)->i915->drm,
>  			"Invalid GuC engine reset notificaion for 0x%04X on %s: banned = %d, blocked = %d",
> -- 
> 2.25.1
> 
