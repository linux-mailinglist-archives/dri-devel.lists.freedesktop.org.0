Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F23A3BF2BA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 02:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2C96E1F8;
	Thu,  8 Jul 2021 00:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655AF6E201;
 Thu,  8 Jul 2021 00:12:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="231164562"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="231164562"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:12:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="411146623"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:12:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] Introduce set_parallel2 extension
Date: Wed,  7 Jul 2021 17:30:17 -0700
Message-Id: <20210708003019.9213-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210706222010.101522-1-matthew.brost@intel.com>
References: <20210706222010.101522-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: john.c.harrison@intel.com, Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on upstream feedback [1] the current set_parallel extension isn't
suitable. Add a single patch to DII implementing the new interface
agreed two upstream [2]. Intended to enable the UMDs with the upstream
interface while maintaining the old interface on DII. 

Quick IGT to prove this is working should be list shortly.

v2: Move single patch in GuC section on pile, align with agreed to
upstream interface, only include prelim* definitions. 
v3: Enable set_parallel2 via SET_PARAM IOCTL, resend for CI
v4: Fix regression when patch was merge - only do parallel checks on
user engine sets 

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/patch/432205/?series=89840&rev=1
[2] https://patchwork.freedesktop.org/patch/438911/?series=91417&rev=1

Signed-off-by: Matthew Brost <matthew.brost@intel.com>


---
baseline: b7227afd06bac1fe6719136e2ddd2bfed1d85feb
pile-commit: b7a2c9136977a385659a71df837cbe5a1f775b32
range-diff:
   -:  ------------ >  930:  ad12b87b91af INTEL_DII/NOT_UPSTREAM: drm/i915: Introduce set_parallel2 extension
1083:  73e59e150cde ! 1084:  79b296835b1c INTEL_DII/FIXME: drm/i915/perf: add a parameter to control the size of OA buffer
1120:  edbc20ae1355 ! 1121:  30d02d618229 INTEL_DII/FIXME: drm/i915: Add context parameter for debug flags
1293:  997b317fc408 ! 1294:  016b5903b0a0 INTEL_DII: drm/i915/perf: Add OA formats for XEHPSDV
1364:  136064b76b92 ! 1365:  5f564d553dc8 INTEL_DII: drm/i915/xehpsdv: Expand total numbers of supported engines up to 256
1403:  67b729033e82 ! 1404:  4398a2322f2f INTEL_DII: drm/i915/xehpsdv: Impose ULLS context restrictions
1405:  b8dd2a22a952 ! 1406:  dd2fab232cf1 INTEL_DII: drm/i915: Add context methods to suspend and resume requests
1670:  b4633106fa13 ! 1671:  53b4a54ee2cc INTEL_DII: drm/i915/pxp: interface for marking contexts as using protected content
1671:  22369ab70556 ! 1672:  42234590cdf5 INTEL_DII: drm/i915/pxp: start the arb session on demand

 series                                             |   1 +
 ...IXME-drm-i915-perf-add-a-parameter-to-con.patch |   4 +-
 ...IXME-drm-i915-Add-context-parameter-for-d.patch |  18 +-
 ...-drm-i915-perf-Add-OA-formats-for-XEHPSDV.patch |   4 +-
 ...rm-i915-xehpsdv-Expand-total-numbers-of-s.patch |   2 +-
 ...rm-i915-xehpsdv-Impose-ULLS-context-restr.patch |  12 +-
 ...rm-i915-Add-context-methods-to-suspend-an.patch |  38 +-
 ...rm-i915-pxp-interface-for-marking-context.patch |  16 +-
 ...rm-i915-pxp-start-the-arb-session-on-dema.patch |   2 +-
 ...OT_UPSTREAM-drm-i915-Introduce-set_parall.patch | 676 +++++++++++++++++++++
 10 files changed, 725 insertions(+), 48 deletions(-)

diff --git a/series b/series
index 8b77d52df40c..7db508ea974d 100644
--- a/series
+++ b/series
@@ -929,6 +929,7 @@
 0001-INTEL_DII-drm-i915-guc-Increase-GuC-log-size-for-CON.patch
 0001-INTEL_DII-NOT_UPSTREAM-drm-i915-Dump-error-capture-t.patch
 0001-INTEL_DII-NOT_UPSTREAM-drm-i915-guc-Dump-error-captu.patch
+0001-INTEL_DII-NOT_UPSTREAM-drm-i915-Introduce-set_parall.patch
 0001-INTEL_DII-END-GuC-submission-and-slpc-support.patch
 0001-INTEL_DII-BEGIN-SR-IOV-ENABLING.patch
 0001-INTEL_DII-drm-i915-guc-Update-GuC-to-62.0.3.patch
diff --git a/0001-INTEL_DII-FIXME-drm-i915-perf-add-a-parameter-to-con.patch b/0001-INTEL_DII-FIXME-drm-i915-perf-add-a-parameter-to-con.patch
index dd654f144374..b7a637b3813f 100644
--- a/0001-INTEL_DII-FIXME-drm-i915-perf-add-a-parameter-to-con.patch
+++ b/0001-INTEL_DII-FIXME-drm-i915-perf-add-a-parameter-to-con.patch
@@ -384,8 +384,8 @@ diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
 diff --git a/include/uapi/drm/i915_drm_prelim.h b/include/uapi/drm/i915_drm_prelim.h
 --- a/include/uapi/drm/i915_drm_prelim.h
 +++ b/include/uapi/drm/i915_drm_prelim.h
-@@ -393,6 +393,36 @@ struct prelim_i915_context_param_engines {
- #define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
+@@ -508,6 +508,36 @@ struct prelim_i915_context_param_engines {
+ #define PRELIM_I915_CONTEXT_ENGINES_EXT_PARALLEL2_SUBMIT (PRELIM_I915_USER_EXT | 3) /* see prelim_i915_context_engines_parallel2_submit */
  };
  
 +enum prelim_drm_i915_perf_property_id {
diff --git a/0001-INTEL_DII-FIXME-drm-i915-Add-context-parameter-for-d.patch b/0001-INTEL_DII-FIXME-drm-i915-Add-context-parameter-for-d.patch
index dfd5790ac2b8..71a5943b5536 100644
--- a/0001-INTEL_DII-FIXME-drm-i915-Add-context-parameter-for-d.patch
+++ b/0001-INTEL_DII-FIXME-drm-i915-Add-context-parameter-for-d.patch
@@ -44,7 +44,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/
  }
  
  static void __free_engines(struct i915_gem_engines *e, unsigned int count)
-@@ -2252,6 +2255,76 @@ static int set_priority(struct i915_gem_context *ctx,
+@@ -2436,6 +2439,76 @@ static int set_priority(struct i915_gem_context *ctx,
  	return 0;
  }
  
@@ -121,7 +121,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/
  static int ctx_setparam(struct drm_i915_file_private *fpriv,
  			struct i915_gem_context *ctx,
  			struct drm_i915_gem_context_param *args)
-@@ -2321,6 +2394,11 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
+@@ -2505,6 +2578,11 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
  		ret = set_ringsize(ctx, args);
  		break;
  
@@ -133,7 +133,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/
  	case I915_CONTEXT_PARAM_BAN_PERIOD:
  	default:
  		ret = -EINVAL;
-@@ -2777,6 +2855,11 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
+@@ -2961,6 +3039,11 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
  		ret = get_ringsize(ctx, args);
  		break;
  
@@ -184,7 +184,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm
 diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
 --- a/drivers/gpu/drm/i915/gt/intel_context.h
 +++ b/drivers/gpu/drm/i915/gt/intel_context.h
-@@ -285,6 +285,24 @@ intel_context_clear_nopreempt(struct intel_context *ce)
+@@ -296,6 +296,24 @@ intel_context_clear_nopreempt(struct intel_context *ce)
  		ce->emit_bb_start = ce->engine->emit_bb_start;
  }
  
@@ -212,19 +212,19 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/i
 diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
 --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
 +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
-@@ -114,6 +114,7 @@ struct intel_context {
- #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
+@@ -115,6 +115,7 @@ struct intel_context {
  #define CONTEXT_NOPREEMPT		8
  #define CONTEXT_LRCA_DIRTY		9
-+#define CONTEXT_DEBUG			10
+ #define CONTEXT_NO_PREEMPT_MID_BATCH	10
++#define CONTEXT_DEBUG			11
  
  	struct {
  		u64 timeout_us;
 diff --git a/include/uapi/drm/i915_drm_prelim.h b/include/uapi/drm/i915_drm_prelim.h
 --- a/include/uapi/drm/i915_drm_prelim.h
 +++ b/include/uapi/drm/i915_drm_prelim.h
-@@ -395,6 +395,32 @@ struct prelim_i915_context_param_engines {
- #define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
+@@ -510,6 +510,32 @@ struct prelim_i915_context_param_engines {
+ #define PRELIM_I915_CONTEXT_ENGINES_EXT_PARALLEL2_SUBMIT (PRELIM_I915_USER_EXT | 3) /* see prelim_i915_context_engines_parallel2_submit */
  };
  
 +struct prelim_drm_i915_gem_context_param {
diff --git a/0001-INTEL_DII-drm-i915-perf-Add-OA-formats-for-XEHPSDV.patch b/0001-INTEL_DII-drm-i915-perf-Add-OA-formats-for-XEHPSDV.patch
index 19a07b3926ae..f62d7848e091 100644
--- a/0001-INTEL_DII-drm-i915-perf-Add-OA-formats-for-XEHPSDV.patch
+++ b/0001-INTEL_DII-drm-i915-perf-Add-OA-formats-for-XEHPSDV.patch
@@ -204,8 +204,8 @@ diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
 diff --git a/include/uapi/drm/i915_drm_prelim.h b/include/uapi/drm/i915_drm_prelim.h
 --- a/include/uapi/drm/i915_drm_prelim.h
 +++ b/include/uapi/drm/i915_drm_prelim.h
-@@ -435,6 +435,27 @@ struct prelim_i915_context_param_engines {
- #define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
+@@ -550,6 +550,27 @@ struct prelim_i915_context_param_engines {
+ #define PRELIM_I915_CONTEXT_ENGINES_EXT_PARALLEL2_SUBMIT (PRELIM_I915_USER_EXT | 3) /* see prelim_i915_context_engines_parallel2_submit */
  };
  
 +enum prelim_drm_i915_oa_format {
diff --git a/0001-INTEL_DII-drm-i915-xehpsdv-Expand-total-numbers-of-s.patch b/0001-INTEL_DII-drm-i915-xehpsdv-Expand-total-numbers-of-s.patch
index 05a84884a3d1..ee486b95d11e 100644
--- a/0001-INTEL_DII-drm-i915-xehpsdv-Expand-total-numbers-of-s.patch
+++ b/0001-INTEL_DII-drm-i915-xehpsdv-Expand-total-numbers-of-s.patch
@@ -76,7 +76,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i9
  
  	/* Kernel clipping was a DRI1 misfeature */
  	if (!(exec->flags & I915_EXEC_FENCE_ARRAY)) {
-@@ -3233,9 +3235,12 @@ eb_select_engine(struct i915_execbuffer *eb)
+@@ -3233,9 +3235,12 @@ eb_select_engine(struct i915_execbuffer *eb, unsigned int batch_number)
  	int err;
  
  	if (i915_gem_context_user_engines(eb->gem_context))
diff --git a/0001-INTEL_DII-drm-i915-xehpsdv-Impose-ULLS-context-restr.patch b/0001-INTEL_DII-drm-i915-xehpsdv-Impose-ULLS-context-restr.patch
index 38ad84c4dc12..80880e3008cc 100644
--- a/0001-INTEL_DII-drm-i915-xehpsdv-Impose-ULLS-context-restr.patch
+++ b/0001-INTEL_DII-drm-i915-xehpsdv-Impose-ULLS-context-restr.patch
@@ -76,7 +76,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i9
  	if (intel_context_nopreempt(eb->context) ||
  	    intel_context_debug(eb->context))
  		__set_bit(I915_FENCE_FLAG_NOPREEMPT, &eb->request->fence.flags);
-@@ -3453,6 +3462,13 @@ static int eb_request_add(struct i915_execbuffer *eb, int err)
+@@ -3463,6 +3472,13 @@ static int eb_request_add(struct i915_execbuffer *eb, int err)
  
  	trace_i915_request_add(rq);
  
@@ -90,7 +90,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i9
  	prev = __i915_request_commit(rq);
  
  	/* Check that the context wasn't destroyed before submission */
-@@ -3531,6 +3547,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
+@@ -3541,6 +3557,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
  	int err;
  	bool first = batch_number == 0;
  	bool last = batch_number + 1 == num_batches;
@@ -98,7 +98,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i9
  
  	BUILD_BUG_ON(__EXEC_INTERNAL_FLAGS & ~__I915_EXEC_ILLEGAL_FLAGS);
  	BUILD_BUG_ON(__EXEC_OBJECT_INTERNAL_FLAGS &
-@@ -3582,6 +3599,13 @@ i915_gem_do_execbuffer(struct drm_device *dev,
+@@ -3592,6 +3609,13 @@ i915_gem_do_execbuffer(struct drm_device *dev,
  	if (unlikely(err))
  		goto err_destroy;
  
@@ -109,7 +109,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i9
 +		goto err_context;
 +	}
 +
- 	err = eb_select_engine(&eb);
+ 	err = eb_select_engine(&eb, batch_number);
  	if (unlikely(err))
  		goto err_context;
 diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -239,7 +239,7 @@ diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_req
  		/*
  		 * Requests on the same timeline are explicitly ordered, along
  		 * with their dependencies, by i915_request_add() which ensures
-@@ -2126,6 +2181,7 @@ long i915_request_wait(struct i915_request *rq,
+@@ -2121,6 +2176,7 @@ long i915_request_wait(struct i915_request *rq,
  {
  	might_sleep();
  	GEM_BUG_ON(timeout < 0);
@@ -247,7 +247,7 @@ diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_req
  
  	if (dma_fence_is_signaled(&rq->fence))
  		return timeout;
-@@ -2331,6 +2387,8 @@ static struct i915_global_request global = { {
+@@ -2326,6 +2382,8 @@ static struct i915_global_request global = { {
  
  int __init i915_global_request_init(void)
  {
diff --git a/0001-INTEL_DII-drm-i915-Add-context-methods-to-suspend-an.patch b/0001-INTEL_DII-drm-i915-Add-context-methods-to-suspend-an.patch
index 7d523c8dadba..44fd93184b8a 100644
--- a/0001-INTEL_DII-drm-i915-Add-context-methods-to-suspend-an.patch
+++ b/0001-INTEL_DII-drm-i915-Add-context-methods-to-suspend-an.patch
@@ -52,7 +52,7 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/i
  void
  intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
  {
-@@ -475,6 +481,9 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
+@@ -476,6 +482,9 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
  	ce->guc_id = GUC_INVALID_LRC_ID;
  	INIT_LIST_HEAD(&ce->guc_id_link);
  
@@ -62,7 +62,7 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/i
  	i915_active_init(&ce->active,
  			 __intel_context_active, __intel_context_retire);
  }
-@@ -485,6 +494,7 @@ void intel_context_fini(struct intel_context *ce)
+@@ -486,6 +495,7 @@ void intel_context_fini(struct intel_context *ce)
  
  	if (ce->last_rq)
  		i915_request_put(ce->last_rq);
@@ -73,7 +73,7 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/i
 diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
 --- a/drivers/gpu/drm/i915/gt/intel_context.h
 +++ b/drivers/gpu/drm/i915/gt/intel_context.h
-@@ -252,6 +252,54 @@ static inline bool intel_context_ban(struct intel_context *ce,
+@@ -263,6 +263,54 @@ static inline bool intel_context_ban(struct intel_context *ce,
  	return ret;
  }
  
@@ -152,10 +152,10 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i91
  	void (*enter)(struct intel_context *ce);
  	void (*exit)(struct intel_context *ce);
  
-@@ -241,6 +248,9 @@ struct intel_context {
+@@ -245,6 +252,9 @@ struct intel_context {
  
- 	/* Last request submitted on a parent */
- 	struct i915_request *last_rq;
+ 	/* Parallel submit mutex */
+ 	struct mutex parallel_submit;
 +
 +	/* GuC context blocked fence */
 +	struct i915_sw_fence guc_blocked;
@@ -231,7 +231,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  
  	if (!enabled) {
  		GEM_BUG_ON(context_pending_enable(ce));
-@@ -1103,6 +1137,8 @@ static void __guc_context_destroy(struct intel_context *ce);
+@@ -1102,6 +1136,8 @@ static void __guc_context_destroy(struct intel_context *ce);
  static void release_guc_id(struct intel_guc *guc, struct intel_context *ce);
  static void guc_signal_context_fence(struct intel_context *ce);
  static void guc_cancel_context_requests(struct intel_context *ce);
@@ -240,7 +240,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  
  static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
  {
-@@ -1143,6 +1179,8 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
+@@ -1142,6 +1178,8 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
  
  		/* Not mutualy exclusive with above if statement. */
  		if (pending_disable) {
@@ -249,7 +249,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  			guc_signal_context_fence(ce);
  			if (banned) {
  				guc_cancel_context_requests(ce);
-@@ -1150,7 +1188,12 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
+@@ -1149,7 +1187,12 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
  			}
  			intel_context_sched_disable_unpin(ce);
  			atomic_dec(&guc->outstanding_submission_g2h);
@@ -262,7 +262,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  		}
  	}
  }
-@@ -2549,6 +2592,22 @@ static void guc_parent_context_unpin(struct intel_context *ce)
+@@ -2551,6 +2594,22 @@ static void guc_parent_context_unpin(struct intel_context *ce)
  	__guc_context_unpin(ce);
  }
  
@@ -285,7 +285,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  static void __guc_context_sched_disable(struct intel_guc *guc,
  					struct intel_context *ce,
  					u16 guc_id)
-@@ -2576,10 +2635,13 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
+@@ -2578,10 +2637,13 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
  				 G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
  }
  
@@ -299,7 +299,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  	intel_context_get(ce);
  
  	return ce->guc_id;
-@@ -2677,6 +2739,132 @@ static void guc_context_sched_disable(struct intel_context *ce)
+@@ -2679,6 +2741,132 @@ static void guc_context_sched_disable(struct intel_context *ce)
  	intel_context_sched_disable_unpin(ce);
  }
  
@@ -432,7 +432,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  int intel_guc_modify_scheduling(struct intel_guc *guc, bool enable)
  {
  	struct intel_gt *gt = guc_to_gt(guc);
-@@ -2991,6 +3179,9 @@ static const struct intel_context_ops guc_context_ops = {
+@@ -2993,6 +3181,9 @@ static const struct intel_context_ops guc_context_ops = {
  
  	.ban = guc_context_ban,
  
@@ -442,7 +442,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  	.enter = intel_context_enter_engine,
  	.exit = guc_context_exit,
  
-@@ -3380,6 +3571,9 @@ static const struct intel_context_ops virtual_guc_context_ops = {
+@@ -3382,6 +3573,9 @@ static const struct intel_context_ops virtual_guc_context_ops = {
  
  	.ban = guc_context_ban,
  
@@ -452,7 +452,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  	.enter = guc_virtual_context_enter,
  	.exit = guc_virtual_context_exit,
  
-@@ -3457,6 +3651,9 @@ static const struct intel_context_ops parent_context_ops = {
+@@ -3459,6 +3653,9 @@ static const struct intel_context_ops parent_context_ops = {
  
  	.ban = guc_context_ban,
  
@@ -462,7 +462,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  	.enter = intel_context_enter_engine,
  	.exit = intel_context_exit_engine,
  
-@@ -3476,6 +3673,9 @@ static const struct intel_context_ops virtual_parent_context_ops = {
+@@ -3478,6 +3675,9 @@ static const struct intel_context_ops virtual_parent_context_ops = {
  
  	.ban = guc_context_ban,
  
@@ -472,7 +472,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  	.enter = guc_virtual_context_enter,
  	.exit = guc_virtual_context_exit,
  
-@@ -3487,6 +3687,9 @@ static const struct intel_context_ops virtual_parent_context_ops = {
+@@ -3489,6 +3689,9 @@ static const struct intel_context_ops virtual_parent_context_ops = {
  static const struct intel_context_ops child_context_ops = {
  	.alloc = guc_context_alloc,
  
@@ -482,7 +482,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  	.enter = intel_context_enter_engine,
  	.exit = guc_context_exit,
  
-@@ -3497,6 +3700,9 @@ static const struct intel_context_ops child_context_ops = {
+@@ -3499,6 +3702,9 @@ static const struct intel_context_ops child_context_ops = {
  static const struct intel_context_ops virtual_child_context_ops = {
  	.alloc = guc_virtual_context_alloc,
  
@@ -492,7 +492,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  	.enter = guc_virtual_context_enter,
  	.exit = guc_virtual_context_exit,
  
-@@ -4440,6 +4646,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
+@@ -4441,6 +4647,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
  		clr_context_banned(ce);
  		clr_context_pending_disable(ce);
  		__guc_signal_context_fence(ce);
diff --git a/0001-INTEL_DII-drm-i915-pxp-interface-for-marking-context.patch b/0001-INTEL_DII-drm-i915-pxp-interface-for-marking-context.patch
index 6b38bd36d21b..8a6b9561eb24 100644
--- a/0001-INTEL_DII-drm-i915-pxp-interface-for-marking-context.patch
+++ b/0001-INTEL_DII-drm-i915-pxp-interface-for-marking-context.patch
@@ -56,7 +56,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/
  #include "i915_gem_context.h"
  #include "i915_gem_ioctls.h"
  #include "i915_globals.h"
-@@ -2574,6 +2576,40 @@ static int set_acc(struct i915_gem_context *ctx,
+@@ -2769,6 +2771,40 @@ static int set_acc(struct i915_gem_context *ctx,
  	return 0;
  }
  
@@ -97,7 +97,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/
  static int ctx_setparam(struct drm_i915_file_private *fpriv,
  			struct i915_gem_context *ctx,
  			struct drm_i915_gem_context_param *args,
-@@ -2607,6 +2643,8 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
+@@ -2802,6 +2838,8 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
  			ret = -EPERM;
  		else if (args->value)
  			i915_gem_context_set_bannable(ctx);
@@ -106,7 +106,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/
  		else
  			i915_gem_context_clear_bannable(ctx);
  		break;
-@@ -2614,10 +2652,12 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
+@@ -2809,10 +2847,12 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
  	case I915_CONTEXT_PARAM_RECOVERABLE:
  		if (args->size)
  			ret = -EINVAL;
@@ -122,7 +122,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/
  		break;
  
  	case I915_CONTEXT_PARAM_PRIORITY:
-@@ -2664,6 +2704,9 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
+@@ -2865,6 +2905,9 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
  	case I915_CONTEXT_PARAM_DEBUG_FLAGS:
  		ret = set_debug_flags(ctx, args);
  		break;
@@ -132,7 +132,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/
  
  	case I915_CONTEXT_PARAM_BAN_PERIOD:
  	default:
-@@ -3157,6 +3200,9 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
+@@ -3358,6 +3401,9 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
  	case I915_CONTEXT_PARAM_DEBUG_FLAGS:
  		ret = get_debug_flags(ctx, args);
  		break;
@@ -142,7 +142,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/
  
  	case I915_CONTEXT_PARAM_BAN_PERIOD:
  	default:
-@@ -3281,6 +3327,11 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
+@@ -3482,6 +3528,11 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
  	args->batch_active = atomic_read(&ctx->guilty_count);
  	args->batch_pending = atomic_read(&ctx->active_count);
  
@@ -225,7 +225,7 @@ diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i9
  	eb->gem_context = ctx;
  	if (rcu_access_pointer(ctx->vm))
  		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
-@@ -3301,6 +3308,17 @@ eb_select_engine(struct i915_execbuffer *eb)
+@@ -3311,6 +3318,17 @@ eb_select_engine(struct i915_execbuffer *eb, unsigned int batch_number)
  
  	intel_gt_pm_get(ce->engine->gt);
  
@@ -348,7 +348,7 @@ diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
 diff --git a/include/uapi/drm/i915_drm_prelim.h b/include/uapi/drm/i915_drm_prelim.h
 --- a/include/uapi/drm/i915_drm_prelim.h
 +++ b/include/uapi/drm/i915_drm_prelim.h
-@@ -893,6 +893,26 @@ struct prelim_drm_i915_gem_context_param {
+@@ -1003,6 +1003,26 @@ struct prelim_drm_i915_gem_context_param {
  #define I915_CONTEXT_PARAM_ACC    0xd
  };
  
diff --git a/0001-INTEL_DII-drm-i915-pxp-start-the-arb-session-on-dema.patch b/0001-INTEL_DII-drm-i915-pxp-start-the-arb-session-on-dema.patch
index 5ee627b00811..4b4326057959 100644
--- a/0001-INTEL_DII-drm-i915-pxp-start-the-arb-session-on-dema.patch
+++ b/0001-INTEL_DII-drm-i915-pxp-start-the-arb-session-on-dema.patch
@@ -22,7 +22,7 @@ Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
 diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
 --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
 +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
-@@ -3309,9 +3309,11 @@ eb_select_engine(struct i915_execbuffer *eb)
+@@ -3319,9 +3319,11 @@ eb_select_engine(struct i915_execbuffer *eb, unsigned int batch_number)
  	intel_gt_pm_get(ce->engine->gt);
  
  	if (i915_gem_context_uses_protected_content(eb->gem_context)) {
diff --git a/0001-INTEL_DII-NOT_UPSTREAM-drm-i915-Introduce-set_parall.patch b/0001-INTEL_DII-NOT_UPSTREAM-drm-i915-Introduce-set_parall.patch
new file mode 100644
index 000000000000..415fbd930383
--- /dev/null
+++ b/0001-INTEL_DII-NOT_UPSTREAM-drm-i915-Introduce-set_parall.patch
@@ -0,0 +1,676 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Matthew Brost <matthew.brost@intel.com>
+Date: Wed, 7 Jul 2021 16:55:03 -0700
+Subject: [PATCH] INTEL_DII/NOT_UPSTREAM: drm/i915: Introduce set_parallel2
+ extension
+
+Based on upstream feedback the set_parallel extension isn't suitable as
+it looks a bit too much like the bonding extension. Introduce a
+set_parallel2 extension which configures parallel submission in a single
+extension and in a single slot. This compares to old set_parallel
+extension which configured parallel submission across multiple slots.
+
+Also remove the ability for the user to pass in the number of BBs in
+the execbuf IOCTL. The number of BBs is now implied based on the width
+of the context in the slot.
+
+This patch is intended in enable UMDs for the upstream direction while
+maintaining the old set_parallel extension to not break UMDs. Once UMDs
+have been updated to use new extension the old one can be removed from
+DII.
+
+v2: Only enable parallel submission on engines set by user
+
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+---
+ drivers/gpu/drm/i915/gem/i915_gem_context.c   | 190 +++++++++++++++++-
+ .../gpu/drm/i915/gem/i915_gem_context_types.h |   6 -
+ .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  73 +++++--
+ drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
+ drivers/gpu/drm/i915/gt/intel_context.h       |  11 +
+ drivers/gpu/drm/i915/gt/intel_context_types.h |   4 +
+ .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   4 +-
+ drivers/gpu/drm/i915/i915_request.c           |   7 +-
+ include/uapi/drm/i915_drm_prelim.h            | 115 +++++++++++
+ 9 files changed, 376 insertions(+), 36 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
+--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
++++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
+@@ -374,7 +374,6 @@ void i915_gem_context_release(struct kref *ref)
+ 	mutex_destroy(&ctx->engines_mutex);
+ 	mutex_destroy(&ctx->lut_mutex);
+ 	mutex_destroy(&ctx->mutex);
+-	mutex_destroy(&ctx->parallel_submit);
+ 
+ 	kfree_rcu(ctx, rcu);
+ }
+@@ -699,8 +698,6 @@ __create_context(struct drm_i915_private *i915)
+ 	mutex_init(&ctx->mutex);
+ 	INIT_LIST_HEAD(&ctx->link);
+ 
+-	mutex_init(&ctx->parallel_submit);
+-
+ 	spin_lock_init(&ctx->stale.lock);
+ 	INIT_LIST_HEAD(&ctx->stale.engines);
+ 
+@@ -1857,6 +1854,48 @@ static bool validate_parallel_engines_layout(const struct set_engines *set)
+ 	return true;
+ }
+ 
++/*
++ * Engine must be same class and form a logically contiguous mask.
++ *
++ * FIXME: Logical mask check not 100% correct but good enough for the PoC
++ */
++static bool __validate_parallel_engines_layout(struct drm_i915_private *i915,
++					       struct intel_context *parent)
++{
++	u8 engine_class = parent->engine->class;
++	u8 num_siblings = hweight_long(parent->engine->logical_mask);
++	struct intel_context *child;
++	intel_engine_mask_t logical_mask = parent->engine->logical_mask;
++
++	for_each_child(parent, child) {
++		if (child->engine->class != engine_class) {
++			drm_dbg(&i915->drm, "Class mismatch: %u, %u",
++				engine_class, child->engine->class);
++			return false;
++		}
++		if (hweight_long(child->engine->logical_mask) != num_siblings) {
++			drm_dbg(&i915->drm, "Sibling mismatch: %u, %lu",
++				num_siblings,
++				hweight_long(child->engine->logical_mask));
++			return false;
++		}
++		if (logical_mask & child->engine->logical_mask) {
++			drm_dbg(&i915->drm, "Overlapping logical mask: 0x%04x, 0x%04x",
++				logical_mask, child->engine->logical_mask);
++			return false;
++		}
++		logical_mask |= child->engine->logical_mask;
++	}
++
++	if (!is_power_of_2((logical_mask >> (ffs(logical_mask) - 1)) + 1)) {
++		drm_dbg(&i915->drm, "Non-contiguous logical mask: 0x%04x",
++			logical_mask);
++		return false;
++	}
++
++	return true;
++}
++
+ static int
+ set_engines__parallel_submit(struct i915_user_extension __user *base, void *data)
+ {
+@@ -2009,11 +2048,156 @@ set_engines__parallel_submit(struct i915_user_extension __user *base, void *data
+ 	return err;
+ }
+ 
++static int
++set_engines__parallel2_submit(struct i915_user_extension __user *base,
++			      void *data)
++{
++	struct prelim_drm_i915_context_engines_parallel2_submit __user *ext =
++		container_of_user(base, typeof(*ext), base);
++	const struct set_engines *set = data;
++	struct drm_i915_private *i915 = set->ctx->i915;
++	struct intel_context *parent, *child, *ce;
++	u64 flags;
++	int err = 0, n, i, j;
++	u16 slot, width, num_siblings;
++	struct intel_engine_cs **siblings = NULL;
++
++	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
++		return -ENODEV;
++
++	if (get_user(slot, &ext->engine_index))
++		return -EFAULT;
++
++	if (get_user(width, &ext->width))
++		return -EFAULT;
++
++	if (get_user(num_siblings, &ext->num_siblings))
++		return -EFAULT;
++
++	if (slot >= set->engines->num_engines) {
++		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
++			slot, set->engines->num_engines);
++		return -EINVAL;
++	}
++
++	parent = set->engines->engines[slot];
++	if (parent) {
++		drm_dbg(&i915->drm, "Context index[%d] not NULL\n", slot);
++		return -EINVAL;
++	}
++
++	if (get_user(flags, &ext->flags))
++		return -EFAULT;
++
++	if (flags) {
++		drm_dbg(&i915->drm, "Unknown flags 0x%02llx", flags);
++		return -EINVAL;
++	}
++
++	for (n = 0; n < ARRAY_SIZE(ext->mbz64); n++) {
++		err = check_user_mbz(&ext->mbz64[n]);
++		if (err)
++			return err;
++	}
++
++	if (width < 1) {
++		drm_dbg(&i915->drm, "Width (%d) < 1 \n", width);
++		return -EINVAL;
++	}
++
++	if (num_siblings < 1) {
++		drm_dbg(&i915->drm, "Number siblings (%d) < 1 \n",
++			num_siblings);
++		return -EINVAL;
++	}
++
++	siblings = kmalloc_array(num_siblings,
++				 sizeof(*siblings),
++				 GFP_KERNEL);
++	if (!siblings)
++		return -ENOMEM;
++
++	mutex_lock(&set->ctx->mutex);
++
++	/* Create contexts / engines */
++	for (i = 0; i < width; ++i) {
++		for (j = 0; j < num_siblings; ++j) {
++			struct i915_engine_class_instance ci;
++
++			if (copy_from_user(&ci, &ext->engines[i * num_siblings + j],
++					   sizeof(ci))) {
++				err = -EFAULT;
++				goto out_err;
++			}
++
++			siblings[j] = intel_engine_lookup_user(i915,
++							       ci.engine_class,
++							       ci.engine_instance);
++			if (!siblings[j]) {
++				drm_dbg(&i915->drm,
++					"Invalid sibling[%d]: { class:%d, inst:%d }\n",
++					n, ci.engine_class, ci.engine_instance);
++				err = -EINVAL;
++				goto out_err;
++			}
++		}
++
++		ce = intel_engine_create_virtual(siblings, num_siblings,
++						 FORCE_VIRTUAL);
++		if (IS_ERR(ce)) {
++			err = PTR_ERR(ce);
++			goto out_err;
++		}
++		intel_context_set_gem(ce, set->ctx);
++
++		if (i == 0) {
++			parent = ce;
++			__set_bit(CONTEXT_NO_PREEMPT_MID_BATCH, &ce->flags);
++		} else {
++			intel_context_bind_parent_child(parent, ce);
++			err = intel_context_alloc_state(ce);
++			if (err)
++				goto out_err;
++		}
++	}
++
++	if (!__validate_parallel_engines_layout(i915, parent)) {
++		drm_dbg(&i915->drm, "Invalidate parallel context layout");
++		err = -EINVAL;
++		goto out_err;
++	}
++
++	intel_guc_configure_parent_context(parent);
++	if (cmpxchg(&set->engines->engines[slot], NULL, parent)) {
++		err = -EEXIST;
++		goto out_err;
++	}
++
++	kfree(siblings);
++	mutex_unlock(&set->ctx->mutex);
++
++	return 0;
++
++out_err:
++	if (parent) {
++		for_each_child(parent, child)
++			intel_context_put(child);
++		intel_context_put(parent);
++		set->engines->engines[slot] = NULL;
++	}
++	kfree(siblings);
++	mutex_unlock(&set->ctx->mutex);
++
++	return err;
++}
++
+ static const i915_user_extension_fn set_engines__extensions[] = {
+ 	[I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE] = set_engines__load_balance,
+ 	[I915_CONTEXT_ENGINES_EXT_BOND] = set_engines__bond,
+ 	[PRELIM_I915_USER_EXT_MASK(PRELIM_I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT)] =
+ 		set_engines__parallel_submit,
++	[PRELIM_I915_USER_EXT_MASK(PRELIM_I915_CONTEXT_ENGINES_EXT_PARALLEL2_SUBMIT)] =
++		set_engines__parallel2_submit,
+ };
+ 
+ static int
+diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
++++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+@@ -194,12 +194,6 @@ struct i915_gem_context {
+ 	 */
+ 	u64 fence_context;
+ 
+-	/**
+-	 * @parallel_submit: Ensure only 1 parallel submission is happening on
+-	 * this context at a time.
+-	 */
+-	struct mutex parallel_submit;
+-
+ 	/**
+ 	 * @seqno: Seqno when using when a parallel context.
+ 	 */
+diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
++++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+@@ -1633,7 +1633,7 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
+ 		goto err_unmap;
+ 
+ 	if (engine == eb->context->engine &&
+-	    !i915_gem_context_is_parallel(eb->gem_context)) {
++	    !intel_context_is_parallel(eb->context)) {
+ 		rq = i915_request_create(eb->context);
+ 	} else {
+ 		struct intel_context *ce = eb->reloc_context;
+@@ -1727,7 +1727,7 @@ static u32 *reloc_gpu(struct i915_execbuffer *eb,
+ 		struct intel_engine_cs *engine = eb->engine;
+ 
+ 		if (!reloc_can_use_engine(engine) ||
+-		    i915_gem_context_is_parallel(eb->gem_context)) {
++		    intel_context_is_parallel(eb->context)) {
+ 			engine = engine->gt->engine_class[COPY_ENGINE_CLASS][0];
+ 			if (!engine)
+ 				return ERR_PTR(-ENODEV);
+@@ -3223,7 +3223,7 @@ eb_select_legacy_ring(struct i915_execbuffer *eb)
+ }
+ 
+ static int
+-eb_select_engine(struct i915_execbuffer *eb)
++eb_select_engine(struct i915_execbuffer *eb, unsigned int batch_number)
+ {
+ 	struct intel_context *ce;
+ 	unsigned int idx;
+@@ -3238,6 +3238,16 @@ eb_select_engine(struct i915_execbuffer *eb)
+ 	if (IS_ERR(ce))
+ 		return PTR_ERR(ce);
+ 
++	if (batch_number > 0 &&
++	    !i915_gem_context_is_parallel(eb->gem_context)) {
++		struct intel_context *parent = ce;
++		for_each_child(parent, ce)
++			if (!--batch_number)
++				break;
++		intel_context_put(parent);
++		intel_context_get(ce);
++	}
++
+ 	intel_gt_pm_get(ce->engine->gt);
+ 
+ 	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
+@@ -3562,7 +3572,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
+ 	if (unlikely(err))
+ 		goto err_destroy;
+ 
+-	err = eb_select_engine(&eb);
++	err = eb_select_engine(&eb, batch_number);
+ 	if (unlikely(err))
+ 		goto err_context;
+ 
+@@ -3751,6 +3761,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
+ 	const size_t count = args->buffer_count;
+ 	unsigned int num_batches, i;
+ 	int err, start_context;
++	bool is_parallel = false;
++	struct intel_context *parent = NULL;
+ 
+ 	if (!check_buffer_count(count)) {
+ 		drm_dbg(&i915->drm, "execbuf2 with %zd buffers\n", count);
+@@ -3782,15 +3794,35 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
+ 			I915_EXEC_NUMBER_BB_LSB) +
+ 		       ((args->flags & PRELIM_I915_EXEC_NUMBER_BB_MASK) >>
+ 			PRELIM_I915_EXEC_NUMBER_BB_LSB)) + 1;
+-	if (i915_gem_context_is_parallel(ctx)) {
+-		if (num_batches > count ||
+-		    start_context + num_batches > ctx->width) {
+-			err = -EINVAL;
+-			goto err_context;
++
++	if (i915_gem_context_user_engines(ctx)) {
++		parent = i915_gem_context_get_engine(ctx, start_context);
++		if (IS_ERR(parent)) {
++			i915_gem_context_put(ctx);
++			return PTR_ERR(parent);
+ 		}
+ 
+-		if (i915_gem_context_is_bb_preempt_boundary(ctx) &&
+-		    (start_context || num_batches != ctx->width)) {
++		is_parallel = i915_gem_context_is_parallel(ctx) ||
++			intel_context_is_parallel(parent);
++		if (i915_gem_context_is_parallel(ctx)) {
++			if (num_batches > count ||
++			    start_context + num_batches > ctx->width) {
++				err = -EINVAL;
++				goto err_context;
++			}
++
++			if (i915_gem_context_is_bb_preempt_boundary(ctx) &&
++			    (start_context || num_batches != ctx->width)) {
++				err = -EINVAL;
++				goto err_context;
++			}
++		} else if (intel_context_is_parallel(parent)) {
++			if (num_batches != 1)
++				return -EINVAL;
++			num_batches = parent->guc_number_children + 1;
++			if (num_batches > count)
++				return -EINVAL;
++		} else if(num_batches > 1) {
+ 			err = -EINVAL;
+ 			goto err_context;
+ 		}
+@@ -3827,8 +3859,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
+ 	 * properly, also this is needed to create an excl fence for an dma buf
+ 	 * objects these BBs touch.
+ 	 */
+-	if (args->flags & I915_EXEC_FENCE_OUT ||
+-	    i915_gem_context_is_parallel(ctx)) {
++	if (args->flags & I915_EXEC_FENCE_OUT || is_parallel) {
+ 		out_fences = kcalloc(num_batches, sizeof(*out_fences),
+ 				     GFP_KERNEL);
+ 		if (!out_fences) {
+@@ -3874,8 +3905,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
+ 	 * in intel_context sequence, thus only 1 submission can happen at a
+ 	 * time.
+ 	 */
+-	if (i915_gem_context_is_parallel(ctx))
+-		mutex_lock(&ctx->parallel_submit);
++	if (is_parallel)
++		mutex_lock(&parent->parallel_submit);
+ 
+ 	err = i915_gem_do_execbuffer(dev, file, args, exec2_list,
+ 				     args->flags & I915_EXEC_BATCH_FIRST ?
+@@ -3889,8 +3920,10 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
+ 				     &ww);
+ 
+ 	for (i = 1; err == 0 && i < num_batches; i++) {
+-		args->flags &= ~I915_EXEC_RING_MASK;
+-		args->flags |= start_context + i;
++		if (i915_gem_context_is_parallel(ctx)) {
++			args->flags &= ~I915_EXEC_RING_MASK;
++			args->flags |= start_context + i;
++		}
+ 		args->batch_len = 0;
+ 
+ 		err = i915_gem_do_execbuffer(dev, file, args, exec2_list,
+@@ -3905,8 +3938,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
+ 					     &ww);
+ 	}
+ 
+-	if (i915_gem_context_is_parallel(ctx))
+-		mutex_unlock(&ctx->parallel_submit);
++	if (is_parallel)
++		mutex_unlock(&parent->parallel_submit);
+ 
+ 	/*
+ 	 * Now that we have begun execution of the batchbuffer, we ignore
+@@ -4009,6 +4042,8 @@ end:;
+ 	dma_fence_put(in_fence);
+ err_context:
+ 	i915_gem_context_put(ctx);
++	if (parent)
++		intel_context_put(parent);
+ 
+ 	return err;
+ }
+diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
+--- a/drivers/gpu/drm/i915/gt/intel_context.c
++++ b/drivers/gpu/drm/i915/gt/intel_context.c
+@@ -460,6 +460,7 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
+ 	INIT_LIST_HEAD(&ce->signals);
+ 
+ 	mutex_init(&ce->pin_mutex);
++	mutex_init(&ce->parallel_submit);
+ 
+ 	spin_lock_init(&ce->guc_state.lock);
+ 	INIT_LIST_HEAD(&ce->guc_state.fences);
+@@ -491,6 +492,7 @@ void intel_context_fini(struct intel_context *ce)
+ 			intel_context_put(child);
+ 
+ 	mutex_destroy(&ce->pin_mutex);
++	mutex_destroy(&ce->parallel_submit);
+ 	i915_active_fini(&ce->active);
+ }
+ 
+diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
+--- a/drivers/gpu/drm/i915/gt/intel_context.h
++++ b/drivers/gpu/drm/i915/gt/intel_context.h
+@@ -52,6 +52,11 @@ static inline bool intel_context_is_parent(struct intel_context *ce)
+ 	return !!ce->guc_number_children;
+ }
+ 
++static inline bool intel_context_is_parallel(struct intel_context *ce)
++{
++	return intel_context_is_child(ce) || intel_context_is_parent(ce);
++}
++
+ /* Only should be called directly by selftests */
+ void __intel_context_bind_parent_child(struct intel_context *parent,
+ 				       struct intel_context *child);
+@@ -204,6 +209,12 @@ static inline bool intel_context_is_barrier(const struct intel_context *ce)
+ 	return test_bit(CONTEXT_BARRIER_BIT, &ce->flags);
+ }
+ 
++static inline bool
++intel_context_is_no_preempt_mid_batch(const struct intel_context *ce)
++{
++	return test_bit(CONTEXT_NO_PREEMPT_MID_BATCH, &ce->flags);
++}
++
+ static inline bool intel_context_is_closed(const struct intel_context *ce)
+ {
+ 	return test_bit(CONTEXT_CLOSED_BIT, &ce->flags);
+diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
+--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
++++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
+@@ -114,6 +114,7 @@ struct intel_context {
+ #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
+ #define CONTEXT_NOPREEMPT		8
+ #define CONTEXT_LRCA_DIRTY		9
++#define CONTEXT_NO_PREEMPT_MID_BATCH	10
+ 
+ 	struct {
+ 		u64 timeout_us;
+@@ -239,6 +240,9 @@ struct intel_context {
+ 
+ 	/* Last request submitted on a parent */
+ 	struct i915_request *last_rq;
++
++	/* Parallel submit mutex */
++	struct mutex parallel_submit;
+ };
+ 
+ #endif /* __INTEL_CONTEXT_TYPES__ */
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+@@ -798,8 +798,7 @@ static inline int rq_prio(const struct i915_request *rq)
+ 
+ static inline bool is_multi_lrc(struct intel_context *ce)
+ {
+-	return intel_context_is_child(ce) ||
+-		intel_context_is_parent(ce);
++	return intel_context_is_parallel(ce);
+ }
+ 
+ static inline bool is_multi_lrc_rq(struct i915_request *rq)
+@@ -3458,6 +3457,7 @@ void intel_guc_configure_parent_context(struct intel_context *ce)
+ 		bb_preempt_boundary =
+ 			i915_gem_context_is_bb_preempt_boundary(ctx);
+ 	rcu_read_unlock();
++	bb_preempt_boundary |= intel_context_is_no_preempt_mid_batch(ce);
+ 	if (bb_preempt_boundary) {
+ 		ce->emit_bb_start = emit_bb_start_parent_bb_preempt_boundary;
+ 		ce->emit_fini_breadcrumb =
+diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
+--- a/drivers/gpu/drm/i915/i915_request.c
++++ b/drivers/gpu/drm/i915/i915_request.c
+@@ -1606,14 +1606,9 @@ i915_request_await_object(struct i915_request *to,
+ 	return ret;
+ }
+ 
+-static inline bool is_parallel(struct intel_context *ce)
+-{
+-	return intel_context_is_child(ce) || intel_context_is_parent(ce);
+-}
+-
+ static inline bool is_parallel_rq(struct i915_request *rq)
+ {
+-	return is_parallel(rq->context);
++	return intel_context_is_parallel(rq->context);
+ }
+ 
+ static inline struct intel_context *request_to_parent(struct i915_request *rq)
+diff --git a/include/uapi/drm/i915_drm_prelim.h b/include/uapi/drm/i915_drm_prelim.h
+--- a/include/uapi/drm/i915_drm_prelim.h
++++ b/include/uapi/drm/i915_drm_prelim.h
+@@ -370,9 +370,124 @@ struct prelim_i915_context_engines_parallel_submit {
+ } __attribute__ ((packed));
+ #define i915_context_engines_parallel_submit prelim_i915_context_engines_parallel_submit
+ 
++/**
++ * struct prelim_drm_i915_context_engines_parallel2_submit - Configure engine
++ * for parallel submission.
++ *
++ * Setup a slot in the context engine map to allow multiple BBs to be submitted
++ * in a single execbuf IOCTL. Those BBs will then be scheduled to run on the GPU
++ * in parallel. Multiple hardware contexts are created internally in the i915
++ * run these BBs. Once a slot is configured for N BBs only N BBs can be
++ * submitted in each execbuf IOCTL and this is implicit behavior e.g. The user
++ * doesn't tell the execbuf IOCTL there are N BBs, the execbuf IOCTL knows how
++ * many BBs there are based on the slot's configuration. The N BBs are the last
++ * N buffer objects or first N if I915_EXEC_BATCH_FIRST is set.
++ *
++ * The default placement behavior is to create implicit bonds between each
++ * context if each context maps to more than 1 physical engine (e.g. context is
++ * a virtual engine). Also we only allow contexts of same engine class and these
++ * contexts must be in logically contiguous order. Examples of the placement
++ * behavior described below. Lastly, the default is to not allow BBs to
++ * preempted mid BB rather insert coordinated preemption on all hardware
++ * contexts between each set of BBs. Flags may be added in the future to change
++ * both of these default behaviors.
++ *
++ * Returns -EINVAL if hardware context placement configuration is invalid or if
++ * the placement configuration isn't supported on the platform / submission
++ * interface.
++ * Returns -ENODEV if extension isn't supported on the platform / submission
++ * inteface.
++ *
++ * .. code-block::
++ *
++ *	Example 1 pseudo code:
++ *	CS[X] = generic engine of same class, logical instance X
++ *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
++ *	set_engines(INVALID)
++ *	set_parallel(engine_index=0, width=2, num_siblings=1,
++ *		     engines=CS[0],CS[1])
++ *
++ *	Results in the following valid placement:
++ *	CS[0], CS[1]
++ *
++ *	Example 2 pseudo code:
++ *	CS[X] = generic engine of same class, logical instance X
++ *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
++ *	set_engines(INVALID)
++ *	set_parallel(engine_index=0, width=2, num_siblings=2,
++ *		     engines=CS[0],CS[2],CS[1],CS[3])
++ *
++ *	Results in the following valid placements:
++ *	CS[0], CS[1]
++ *	CS[2], CS[3]
++ *
++ *	This can also be thought of as 2 virtual engines described by 2-D array
++ *	in the engines the field with bonds placed between each index of the
++ *	virtual engines. e.g. CS[0] is bonded to CS[1], CS[2] is bonded to
++ *	CS[3].
++ *	VE[0] = CS[0], CS[2]
++ *	VE[1] = CS[1], CS[3]
++ *
++ *	Example 3 pseudo code:
++ *	CS[X] = generic engine of same class, logical instance X
++ *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
++ *	set_engines(INVALID)
++ *	set_parallel(engine_index=0, width=2, num_siblings=2,
++ *		     engines=CS[0],CS[1],CS[1],CS[3])
++ *
++ *	Results in the following valid and invalid placements:
++ *	CS[0], CS[1]
++ *	CS[1], CS[3] - Not logical contiguous, return -EINVAL
++ */
++struct prelim_drm_i915_context_engines_parallel2_submit {
++	/**
++	 * @base: base user extension.
++	 */
++	struct i915_user_extension base;
++
++	/**
++	 * @engine_index: slot for parallel engine
++	 */
++	__u16 engine_index;
++
++	/**
++	 * @width: number of contexts per parallel engine
++	 */
++	__u16 width;
++
++	/**
++	 * @num_siblings: number of siblings per context
++	 */
++	__u16 num_siblings;
++
++	/**
++	 * @mbz16: reserved for future use; must be zero
++	 */
++	__u16 mbz16;
++
++	/**
++	 * @flags: all undefined flags must be zero, currently not defined flags
++	 */
++	__u64 flags;
++
++	/**
++	 * @mbz64: reserved for future use; must be zero
++	 */
++	__u64 mbz64[3];
++
++	/**
++	 * @engines: 2-d array of engine instances to configure parallel engine
++	 *
++	 * length = width (i) * num_siblings (j)
++	 * index = j + i * num_siblings
++	 */
++	struct i915_engine_class_instance engines[0];
++} __attribute__ ((packed));
++
+ struct prelim_i915_context_param_engines {
+ #define PRELIM_I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT (PRELIM_I915_USER_EXT | 2) /* see prelim_i915_context_engines_parallel_submit */
+ #define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
++#define PRELIM_I915_CONTEXT_ENGINES_EXT_PARALLEL2_SUBMIT (PRELIM_I915_USER_EXT | 3) /* see prelim_i915_context_engines_parallel2_submit */
+ };
+ 
+ enum prelim_drm_i915_gem_memory_class {
--
git-pile 0.97

