Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8547E771
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 19:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752CF10E3A2;
	Thu, 23 Dec 2021 18:06:29 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E1110E3A1;
 Thu, 23 Dec 2021 18:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640282787; x=1671818787;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=a0GDubhi7GgNSXRCH8u3X0ELIIpivCxyRPyihRIw9LQ=;
 b=dgcE1QJH04AjXs2TdTESEMeYevTEddGLQA1EiwwoeZq3IXlCVLfPgBPi
 ytu9OtIoDpiltPhNg9aBdsKTxJgMAISrs9IY3sKZybjQudesf0yLTuWuu
 bKL5BVV+farWPsUvVjqBG/RW+6/xJKt9CT76w2ZY3+4cAwmHad/Me4Kcb
 j+YEOfRsEV5uyTGDIyko8NxKzFLDbLrMVQoX/2Tx60d4MvUnyZOrzYlSL
 QSOzGtHFZ+IXM0paSC2od2rnNg3866NhF8t7mARU1Dfedqkb0v/pIantx
 LDTL74h1VVtEBU9XRzMF0nvo03aZ5/mU0Q9RKXb8bVkghUVirIhxdWb+l w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="239628981"
X-IronPort-AV: E=Sophos;i="5.88,230,1635231600"; d="scan'208";a="239628981"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 10:06:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,230,1635231600"; d="scan'208";a="617557915"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 10:06:25 -0800
Date: Thu, 23 Dec 2021 10:00:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/guc: Check for wedged before
 doing stuff
Message-ID: <20211223180034.GA3414@jons-linux-dev-box>
References: <20211221210212.1438670-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221210212.1438670-1-John.C.Harrison@Intel.com>
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

On Tue, Dec 21, 2021 at 01:02:12PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> A fault injection probe test hit a BUG_ON in a GuC error path. It
> showed that the GuC code could potentially attempt to do many things
> when the device is actually wedged. So, add a check in to prevent that.
> 
> v2: Use intel_gt_is_wedged instead of testing bits directly in the
> GuC submission code (review feedback from Tvrtko).
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index e7517206af82..756b29d8326b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1349,7 +1349,8 @@ submission_disabled(struct intel_guc *guc)
>  	struct i915_sched_engine * const sched_engine = guc->sched_engine;
>  
>  	return unlikely(!sched_engine ||
> -			!__tasklet_is_enabled(&sched_engine->tasklet));
> +			!__tasklet_is_enabled(&sched_engine->tasklet) ||
> +			intel_gt_is_wedged(guc_to_gt(guc)));
>  }
>  
>  static void disable_submission(struct intel_guc *guc)
> @@ -1725,7 +1726,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
>  {
>  	/* Reset called during driver load or during wedge? */
>  	if (unlikely(!guc_submission_initialized(guc) ||
> -		     test_bit(I915_WEDGED, &guc_to_gt(guc)->reset.flags))) {
> +		     intel_gt_is_wedged(guc_to_gt(guc)))) {
>  		return;
>  	}
>  
> -- 
> 2.25.1
> 
