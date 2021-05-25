Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA36738FA25
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 07:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2188924A;
	Tue, 25 May 2021 05:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D7388EE3;
 Tue, 25 May 2021 05:48:18 +0000 (UTC)
IronPort-SDR: 56ZreM454PmBLnBuENSTmP8PeYJU2zcxpp9Ls5FXjoKuD6B+DwIKzP/nAfp4gkrbM/06h6hvDS
 v7j94AL4wbWQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="266005389"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="266005389"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 22:48:18 -0700
IronPort-SDR: YFJ7pIub+GahiEpEc1XrzDc/ddLwdPxHUGtoWqJ6SMQs01Yl5bioZAHD2bmvZRgfkoMq/M+QZN
 9FWBcepuiFGg==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="397231670"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 22:48:18 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 04/17] drm/i915/gt: Export the pinned context constructor
 and destructor
Date: Mon, 24 May 2021 22:47:50 -0700
Message-Id: <20210525054803.7387-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
References: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Allow internal clients to create a pinned context.

v2 (Daniele): export destructor as well, allow optional usage of custom
vm for maximum flexibility.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine.h    | 10 ++++++++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 29 +++++++++++++++--------
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 47ee8578e511..a64d28aba257 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -18,7 +18,9 @@
 #include "intel_workarounds.h"
 
 struct drm_printer;
+struct intel_context;
 struct intel_gt;
+struct lock_class_key;
 
 /* Early gen2 devices have a cacheline of just 32 bytes, using 64 is overkill,
  * but keeps the logic simple. Indeed, the whole purpose of this macro is just
@@ -255,6 +257,14 @@ struct i915_request *
 intel_engine_find_active_request(struct intel_engine_cs *engine);
 
 u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
+struct intel_context *
+intel_engine_create_pinned_context(struct intel_engine_cs *engine,
+				   struct i915_address_space *vm,
+				   unsigned int ring_size,
+				   unsigned int hwsp,
+				   struct lock_class_key *key,
+				   const char *name);
+void intel_engine_destroy_pinned_context(struct intel_context *ce);
 
 void intel_engine_init_active(struct intel_engine_cs *engine,
 			      unsigned int subclass);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index eba2da9679a5..8cbf11497e8e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -801,11 +801,13 @@ intel_engine_init_active(struct intel_engine_cs *engine, unsigned int subclass)
 #endif
 }
 
-static struct intel_context *
-create_pinned_context(struct intel_engine_cs *engine,
-		      unsigned int hwsp,
-		      struct lock_class_key *key,
-		      const char *name)
+struct intel_context *
+intel_engine_create_pinned_context(struct intel_engine_cs *engine,
+				   struct i915_address_space *vm,
+				   unsigned int ring_size,
+				   unsigned int hwsp,
+				   struct lock_class_key *key,
+				   const char *name)
 {
 	struct intel_context *ce;
 	int err;
@@ -816,6 +818,12 @@ create_pinned_context(struct intel_engine_cs *engine,
 
 	__set_bit(CONTEXT_BARRIER_BIT, &ce->flags);
 	ce->timeline = page_pack_bits(NULL, hwsp);
+	ce->ring = __intel_context_ring_size(ring_size);
+
+	if (vm) {
+		i915_vm_put(ce->vm);
+		ce->vm = i915_vm_get(vm);
+	}
 
 	err = intel_context_pin(ce); /* perma-pin so it is always available */
 	if (err) {
@@ -834,7 +842,7 @@ create_pinned_context(struct intel_engine_cs *engine,
 	return ce;
 }
 
-static void destroy_pinned_context(struct intel_context *ce)
+void intel_engine_destroy_pinned_context(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = ce->engine;
 	struct i915_vma *hwsp = engine->status_page.vma;
@@ -854,8 +862,9 @@ create_kernel_context(struct intel_engine_cs *engine)
 {
 	static struct lock_class_key kernel;
 
-	return create_pinned_context(engine, I915_GEM_HWS_SEQNO_ADDR,
-				     &kernel, "kernel_context");
+	return intel_engine_create_pinned_context(engine, NULL, SZ_4K,
+						  I915_GEM_HWS_SEQNO_ADDR,
+						  &kernel, "kernel_context");
 }
 
 /**
@@ -898,7 +907,7 @@ static int engine_init_common(struct intel_engine_cs *engine)
 	return 0;
 
 err_context:
-	destroy_pinned_context(ce);
+	intel_engine_destroy_pinned_context(ce);
 	return ret;
 }
 
@@ -956,7 +965,7 @@ void intel_engine_cleanup_common(struct intel_engine_cs *engine)
 		fput(engine->default_state);
 
 	if (engine->kernel_context)
-		destroy_pinned_context(engine->kernel_context);
+		intel_engine_destroy_pinned_context(engine->kernel_context);
 
 	GEM_BUG_ON(!llist_empty(&engine->barrier_tasks));
 	cleanup_status_page(engine);
-- 
2.29.2

