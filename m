Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A372C64F0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D5F6ECB4;
	Fri, 27 Nov 2020 12:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05326EC9D;
 Fri, 27 Nov 2020 12:10:02 +0000 (UTC)
IronPort-SDR: tt/XtOURBOsiOo+65ES/fjNLdo6ukXqfl1SGx6npBmEdEJanhihFtkQ0MRaOcGCaINlNTskPDK
 eXAo18PafQ3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540754"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540754"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:02 -0800
IronPort-SDR: Z56XARuDDDZZluK4bbKuFsOa/YL2nPXMJYay0yr34rDgQus98WR15NX9ODhKXWn7wKWFTbANhC
 bt5mLfmUSFJw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029185"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:00 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 084/162] drm/i915: introduce kernel blitter_context
Date: Fri, 27 Nov 2020 12:06:00 +0000
Message-Id: <20201127120718.454037-85-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We may be without a context to perform various internal blitter
operations, for example when performing object migration. Piggybacking
off the kernel_context is probably a bad idea, since it has other uses.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine.h       |  2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 40 +++++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  1 +
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 760fefdfe392..188c5ff6dc64 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -186,6 +186,8 @@ intel_write_status_page(struct intel_engine_cs *engine, int reg, u32 value)
 #define I915_GEM_HWS_PREEMPT_ADDR	(I915_GEM_HWS_PREEMPT * sizeof(u32))
 #define I915_GEM_HWS_SEQNO		0x40
 #define I915_GEM_HWS_SEQNO_ADDR		(I915_GEM_HWS_SEQNO * sizeof(u32))
+#define I915_GEM_HWS_BLITTER		0x42
+#define I915_GEM_HWS_BLITTER_ADDR	(I915_GEM_HWS_BLITTER * sizeof(u32))
 #define I915_GEM_HWS_SCRATCH		0x80
 
 #define I915_HWS_CSB_BUF0_INDEX		0x10
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 677c97ded81d..0ba020346566 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -819,6 +819,7 @@ create_pinned_context(struct intel_engine_cs *engine,
 	int err;
 
 	ce = intel_context_create(engine);
+
 	if (IS_ERR(ce))
 		return ce;
 
@@ -851,6 +852,20 @@ create_kernel_context(struct intel_engine_cs *engine)
 				     &kernel, "kernel_context");
 }
 
+static struct intel_context *
+create_blitter_context(struct intel_engine_cs *engine)
+{
+	static struct lock_class_key blitter;
+	struct intel_context *ce;
+
+	ce = create_pinned_context(engine, I915_GEM_HWS_BLITTER_ADDR, &blitter,
+				   "blitter_context");
+	if (IS_ERR(ce))
+		return ce;
+
+	return ce;
+}
+
 /**
  * intel_engines_init_common - initialize cengine state which might require hw access
  * @engine: Engine to initialize.
@@ -881,17 +896,33 @@ static int engine_init_common(struct intel_engine_cs *engine)
 	if (IS_ERR(ce))
 		return PTR_ERR(ce);
 
+	engine->kernel_context = ce;
 	ret = measure_breadcrumb_dw(ce);
 	if (ret < 0)
 		goto err_context;
 
 	engine->emit_fini_breadcrumb_dw = ret;
-	engine->kernel_context = ce;
+
+	/*
+	 * The blitter context is used to quickly memset or migrate objects
+	 * in local memory, so it has to always be available.
+	 */
+	if (engine->class == COPY_ENGINE_CLASS) {
+		ce = create_blitter_context(engine);
+		if (IS_ERR(ce)) {
+			ret = PTR_ERR(ce);
+			goto err_unpin;
+		}
+
+		engine->blitter_context = ce;
+	}
 
 	return 0;
 
+err_unpin:
+	intel_context_unpin(engine->kernel_context);
 err_context:
-	intel_context_put(ce);
+	intel_context_put(engine->kernel_context);
 	return ret;
 }
 
@@ -947,6 +978,11 @@ void intel_engine_cleanup_common(struct intel_engine_cs *engine)
 	if (engine->default_state)
 		fput(engine->default_state);
 
+	if (engine->blitter_context) {
+		intel_context_unpin(engine->blitter_context);
+		intel_context_put(engine->blitter_context);
+	}
+
 	if (engine->kernel_context) {
 		intel_context_unpin(engine->kernel_context);
 		intel_context_put(engine->kernel_context);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index ee6312601c56..cb2de4bf86ba 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -347,6 +347,7 @@ struct intel_engine_cs {
 	struct llist_head barrier_tasks;
 
 	struct intel_context *kernel_context; /* pinned */
+	struct intel_context *blitter_context; /* pinned; exists for BCS only */
 
 	intel_engine_mask_t saturated; /* submitting semaphores too late? */
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
