Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7958E38F707
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 02:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D903689DD8;
	Tue, 25 May 2021 00:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9190989DD8;
 Tue, 25 May 2021 00:39:03 +0000 (UTC)
IronPort-SDR: 0sSiHYK682i1iY626ZKPeszCLAWhQvre72Q8CTitpeJT+tBNip9fcCi98yIlI0Sy4dbp/AoGU6
 n15JZ8dJBz3w==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="181703223"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="181703223"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 17:39:01 -0700
IronPort-SDR: sHhCmS7jjk4EsZFjbZPm/mSRq098q+QWYEfAuOM7yWFlS9ruwfGlXTRtnLWHnwQ5xpXSsWjViI
 R3B3mZjaOLeQ==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="476147493"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 17:39:00 -0700
Date: Mon, 24 May 2021 17:31:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 06/97] drm/i915/guc: enable only the user interrupt
 when using GuC submission
Message-ID: <20210525003152.GA24153@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-7-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-7-matthew.brost@intel.com>
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
Cc: tvrtko.ursulin@intel.com, daniele.ceraolospurio@intel.com,
 jason.ekstrand@intel.com, jon.bloomfield@intel.com, daniel.vetter@intel.com,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:13:20PM -0700, Matthew Brost wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> In GuC submission mode the CS is owned by the GuC FW, so all CS status
> interrupts are handled by it. We only need the user interrupt as that
> signals request completion.
> 
> Since we're now starting the engines directly in GuC submission mode
> when selected, we can stop switching back and forth between the
> execlists and the GuC programming and select directly the correct
> interrupt mask.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 18 ++++++-----
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 31 -------------------
>  2 files changed, 11 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index d29126c458ba..f88c10366e58 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -194,14 +194,18 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
>  
>  void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  {
> -	const u32 irqs =
> -		GT_CS_MASTER_ERROR_INTERRUPT |
> -		GT_RENDER_USER_INTERRUPT |
> -		GT_CONTEXT_SWITCH_INTERRUPT |
> -		GT_WAIT_SEMAPHORE_INTERRUPT;
>  	struct intel_uncore *uncore = gt->uncore;
> -	const u32 dmask = irqs << 16 | irqs;
> -	const u32 smask = irqs << 16;
> +	u32 irqs = GT_RENDER_USER_INTERRUPT;
> +	u32 dmask;
> +	u32 smask;
> +
> +	if (!intel_uc_wants_guc_submission(&gt->uc))
> +		irqs |= GT_CS_MASTER_ERROR_INTERRUPT |
> +			GT_CONTEXT_SWITCH_INTERRUPT |
> +			GT_WAIT_SEMAPHORE_INTERRUPT;
> +
> +	dmask = irqs << 16 | irqs;
> +	smask = irqs << 16;
>  
>  	BUILD_BUG_ON(irqs & 0xffff0000);
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 335719f17490..38cda5d599a6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -432,32 +432,6 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>  	}
>  }
>  
> -static void guc_interrupts_capture(struct intel_gt *gt)
> -{
> -	struct intel_uncore *uncore = gt->uncore;
> -	u32 irqs = GT_CONTEXT_SWITCH_INTERRUPT;
> -	u32 dmask = irqs << 16 | irqs;
> -
> -	GEM_BUG_ON(INTEL_GEN(gt->i915) < 11);
> -
> -	/* Don't handle the ctx switch interrupt in GuC submission mode */
> -	intel_uncore_rmw(uncore, GEN11_RENDER_COPY_INTR_ENABLE, dmask, 0);
> -	intel_uncore_rmw(uncore, GEN11_VCS_VECS_INTR_ENABLE, dmask, 0);
> -}
> -
> -static void guc_interrupts_release(struct intel_gt *gt)
> -{
> -	struct intel_uncore *uncore = gt->uncore;
> -	u32 irqs = GT_CONTEXT_SWITCH_INTERRUPT;
> -	u32 dmask = irqs << 16 | irqs;
> -
> -	GEM_BUG_ON(INTEL_GEN(gt->i915) < 11);
> -
> -	/* Handle ctx switch interrupts again */
> -	intel_uncore_rmw(uncore, GEN11_RENDER_COPY_INTR_ENABLE, 0, dmask);
> -	intel_uncore_rmw(uncore, GEN11_VCS_VECS_INTR_ENABLE, 0, dmask);
> -}
> -
>  static int guc_context_alloc(struct intel_context *ce)
>  {
>  	return lrc_alloc(ce, ce->engine);
> @@ -722,9 +696,6 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
>  void intel_guc_submission_enable(struct intel_guc *guc)
>  {
>  	guc_stage_desc_init(guc);
> -
> -	/* Take over from manual control of ELSP (execlists) */
> -	guc_interrupts_capture(guc_to_gt(guc));
>  }
>  
>  void intel_guc_submission_disable(struct intel_guc *guc)
> @@ -735,8 +706,6 @@ void intel_guc_submission_disable(struct intel_guc *guc)
>  
>  	/* Note: By the time we're here, GuC may have already been reset */
>  
> -	guc_interrupts_release(gt);
> -
>  	guc_stage_desc_fini(guc);
>  }
>  
> -- 
> 2.28.0
> 
