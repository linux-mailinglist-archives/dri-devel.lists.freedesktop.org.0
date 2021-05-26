Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65655391FBB
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 20:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9A06E7E5;
	Wed, 26 May 2021 18:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D756E7DA;
 Wed, 26 May 2021 18:53:27 +0000 (UTC)
IronPort-SDR: dUzCZb2NOG85zsu96RiXYuhLxehydWgaDQTi61l7G4gwHl0Be1nCW+ovwRP7RmWSpPhSFu2gHc
 KDNCo8ay9PYg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202579545"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="202579545"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 11:53:25 -0700
IronPort-SDR: B2NSqIGGskRtspIKMamTuyk06ZmzVtsJcnFaG2d6fgN/Pm24uXnPJ2dR7O5tQl0PXDHON18cfa
 Mf3cRdoHRJbQ==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="477078156"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 11:53:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/i915: Engine relative MMIO
Date: Wed, 26 May 2021 12:11:16 -0700
Message-Id: <20210526191116.44017-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210526191116.44017-1-matthew.brost@intel.com>
References: <20210526191116.44017-1-matthew.brost@intel.com>
MIME-Version: 1.0
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
Cc: john.c.harrison@intel.com, tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With virtual engines, it is no longer possible to know which specific
physical engine a given request will be executed on at the time that
request is generated. This means that the request itself must be engine
agnostic - any direct register writes must be relative to the engine
and not absolute addresses.

The LRI command has support for engine relative addressing. However,
the mechanism is not transparent to the driver. The scheme for Gen11
(MI_LRI_ADD_CS_MMIO_START) requires the LRI address to have no
absolute engine base component in the ring and BBs. The hardware then
adds on the correct engine offset at execution time. This differs
slightly for LRC where the upper bits of the base component are just
ignored.

Due to the non-trivial and differing schemes on different hardware, it
is not possible to simply update the code that creates the LRI
commands to set a remap flag and let the hardware get on with it.
Instead, this patch adds function wrappers for generating the LRI
command itself and then for constructing the correct address to use
with the LRI.

Bspec: 45606
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
CC: Chris P Wilson <chris.p.wilson@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c  |  7 ++++---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 22 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  3 +++
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  6 ++++++
 drivers/gpu/drm/i915/gt/intel_lrc.c          |  4 +---
 5 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 188dee13e017..a8a195bfcb57 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1211,7 +1211,7 @@ static int emit_ppgtt_update(struct i915_request *rq, void *data)
 {
 	struct i915_address_space *vm = rq->context->vm;
 	struct intel_engine_cs *engine = rq->engine;
-	u32 base = engine->mmio_base;
+	u32 base = engine->lri_mmio_base;
 	u32 *cs;
 	int i;
 
@@ -1223,7 +1223,7 @@ static int emit_ppgtt_update(struct i915_request *rq, void *data)
 		if (IS_ERR(cs))
 			return PTR_ERR(cs);
 
-		*cs++ = MI_LOAD_REGISTER_IMM(2);
+		*cs++ = MI_LOAD_REGISTER_IMM_REL(engine, 2);
 
 		*cs++ = i915_mmio_reg_offset(GEN8_RING_PDP_UDW(base, 0));
 		*cs++ = upper_32_bits(pd_daddr);
@@ -1245,7 +1245,8 @@ static int emit_ppgtt_update(struct i915_request *rq, void *data)
 		if (IS_ERR(cs))
 			return PTR_ERR(cs);
 
-		*cs++ = MI_LOAD_REGISTER_IMM(2 * GEN8_3LVL_PDPES) | MI_LRI_FORCE_POSTED;
+		*cs++ = MI_LOAD_REGISTER_IMM_REL(engine, 2 * GEN8_3LVL_PDPES) |
+			MI_LRI_FORCE_POSTED;
 		for (i = GEN8_3LVL_PDPES; i--; ) {
 			const dma_addr_t pd_daddr = i915_page_dir_dma_addr(ppgtt, i);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 3f9a811eb02b..0de6bc533776 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -15,6 +15,7 @@
 #include "intel_engine_pm.h"
 #include "intel_engine_user.h"
 #include "intel_execlists_submission.h"
+#include "intel_gpu_commands.h"
 #include "intel_gt.h"
 #include "intel_gt_requests.h"
 #include "intel_gt_pm.h"
@@ -222,6 +223,25 @@ static u32 __engine_mmio_base(struct drm_i915_private *i915,
 	return bases[i].base;
 }
 
+static bool i915_engine_has_relative_lri(const struct intel_engine_cs *engine)
+{
+	if (INTEL_GEN(engine->i915) < 11)
+		return false;
+
+	return true;
+}
+
+static void lri_init(struct intel_engine_cs *engine)
+{
+	if (i915_engine_has_relative_lri(engine)) {
+		engine->lri_cmd_mode = MI_LRI_LRM_CS_MMIO;
+		engine->lri_mmio_base = 0;
+	} else {
+		engine->lri_cmd_mode = 0;
+		engine->lri_mmio_base = engine->mmio_base;
+	}
+}
+
 static void __sprint_engine_name(struct intel_engine_cs *engine)
 {
 	/*
@@ -329,6 +349,8 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 	/* Nothing to do here, execute in order of dependencies */
 	engine->schedule = NULL;
 
+	lri_init(engine);
+
 	ewma__engine_latency_init(&engine->latency);
 	seqcount_init(&engine->stats.lock);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 9ef349cd5cea..e48da23c9b0f 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -310,6 +310,9 @@ struct intel_engine_cs {
 	u32 context_size;
 	u32 mmio_base;
 
+	u32 lri_mmio_base;
+	u32 lri_cmd_mode;
+
 	/*
 	 * Some w/a require forcewake to be held (which prevents RC6) while
 	 * a particular engine is active. If so, we set fw_domain to which
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 2694dbb9967e..f0f101134fd8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -134,8 +134,14 @@
  *   simply ignores the register load under certain conditions.
  * - One can actually load arbitrary many arbitrary registers: Simply issue x
  *   address/value pairs. Don't overdue it, though, x <= 2^4 must hold!
+ * - Newer hardware supports engine relative addressing but older hardware does
+ *   not. This is required for hw engine load balancing. The
+ *   MI_LOAD_REGISTER_IMM_REL macro can be used on both newer and older
+ *   hardware.
  */
 #define MI_LOAD_REGISTER_IMM(x)	MI_INSTR(0x22, 2*(x)-1)
+#define MI_LOAD_REGISTER_IMM_REL(egine, x)	\
+	(MI_LOAD_REGISTER_IMM(x) | engine->lri_cmd_mode)
 /* Gen11+. addr = base + (ctx_restore ? offset & GENMASK(12,2) : offset) */
 #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
 #define   MI_LRI_FORCE_POSTED		(1<<12)
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index aafe2a4df496..390628666564 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -44,11 +44,9 @@ static void set_offsets(u32 *regs,
 		flags = *data >> 6;
 		data++;
 
-		*regs = MI_LOAD_REGISTER_IMM(count);
+		*regs = MI_LOAD_REGISTER_IMM_REL(engine, count);
 		if (flags & POSTED)
 			*regs |= MI_LRI_FORCE_POSTED;
-		if (INTEL_GEN(engine->i915) >= 11)
-			*regs |= MI_LRI_LRM_CS_MMIO;
 		regs++;
 
 		GEM_BUG_ON(!count);
-- 
2.28.0

