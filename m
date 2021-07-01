Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB23B9899
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 00:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3506EC70;
	Thu,  1 Jul 2021 22:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7586EC6F;
 Thu,  1 Jul 2021 22:33:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="206812206"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="206812206"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 15:33:10 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="420596633"
Received: from aebanas-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.38.1])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 15:33:09 -0700
Date: Thu, 1 Jul 2021 15:33:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 06/53] drm/i915/selftests: Allow for larger engine counts
Message-ID: <20210701223303.eliom4nhky2x4koo@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-7-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210701202427.1547543-7-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>,
 chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 01, 2021 at 01:23:40PM -0700, Matt Roper wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>Increasing the engine count causes a couple of local array variables
>to exceed the kernel stack limit. So make them dynamic allocations
>instead.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/gt/selftest_execlists.c  | 10 ++++--
> .../gpu/drm/i915/gt/selftest_workarounds.c    | 32 ++++++++++++-------
> 2 files changed, 29 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
>index 08896ae027d5..1e7fe2222479 100644
>--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
>+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
>@@ -3561,12 +3561,16 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
> #define BATCH BIT(0)
> {
> 	struct task_struct *tsk[I915_NUM_ENGINES] = {};
>-	struct preempt_smoke arg[I915_NUM_ENGINES];
>+	struct preempt_smoke *arg;
> 	struct intel_engine_cs *engine;
> 	enum intel_engine_id id;
> 	unsigned long count;
> 	int err = 0;
>
>+	arg = kmalloc_array(I915_NUM_ENGINES, sizeof(*arg), GFP_KERNEL);
>+	if (!arg)
>+		return -ENOMEM;
>+
> 	for_each_engine(engine, smoke->gt, id) {
> 		arg[id] = *smoke;
> 		arg[id].engine = engine;
>@@ -3574,7 +3578,7 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
> 			arg[id].batch = NULL;
> 		arg[id].count = 0;
>
>-		tsk[id] = kthread_run(smoke_crescendo_thread, &arg,
>+		tsk[id] = kthread_run(smoke_crescendo_thread, arg,
> 				      "igt/smoke:%d", id);
> 		if (IS_ERR(tsk[id])) {
> 			err = PTR_ERR(tsk[id]);
>@@ -3603,6 +3607,8 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
>
> 	pr_info("Submitted %lu crescendo:%x requests across %d engines and %d contexts\n",
> 		count, flags, smoke->gt->info.num_engines, smoke->ncontext);
>+
>+	kfree(arg);
> 	return 0;


this looks correctly, but apparently this test doesn't test anything as
`err` is write-only - there is only one read, but basically to avoid
overriding an earlier error.

looks like this should be `return err;` ?
+Chris

This patch itself looks good.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
