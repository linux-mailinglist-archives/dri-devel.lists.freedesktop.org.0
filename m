Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961AA39F260
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857E66EB6E;
	Tue,  8 Jun 2021 09:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3DB6EB6D;
 Tue,  8 Jun 2021 09:29:14 +0000 (UTC)
IronPort-SDR: Y6Y4bHqej5G28SBE+XMKdtE2z/n0AKtJy483UeSodA74HKW3fTND6jI8o2a7zxFQ0VBJ3Ywsdl
 cnPVVb/UYnjQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="226150964"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="226150964"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:29:13 -0700
IronPort-SDR: j9Oh9s8f1LcwTVzGjxFy3e5Lz0NtT6CqMJVIYJW59czlb2z2XtC1b9ZyH6GFyvLkh/vQXnteuH
 aLfUMz1WYWWQ==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="551544443"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.115])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:29:12 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/i915/gt: Export the pinned context constructor
Date: Tue,  8 Jun 2021 11:28:43 +0200
Message-Id: <20210608092846.64198-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
References: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
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
Cc: matthew.auld@intel.com, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Allow internal clients to create a pinned context.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_engine.h    |  9 +++++++++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 21 ++++++++++++++-------
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 8d9184920c51..0862c42b4cac 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -19,7 +19,9 @@
 #include "intel_workarounds.h"
 
 struct drm_printer;
+struct intel_context;
 struct intel_gt;
+struct lock_class_key;
 
 /* Early gen2 devices have a cacheline of just 32 bytes, using 64 is overkill,
  * but keeps the logic simple. Indeed, the whole purpose of this macro is just
@@ -256,6 +258,13 @@ struct i915_request *
 intel_engine_find_active_request(struct intel_engine_cs *engine);
 
 u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
+struct intel_context *
+intel_engine_create_pinned_context(struct intel_engine_cs *engine,
+				   struct i915_address_space *vm,
+				   unsigned int ring_size,
+				   unsigned int hwsp,
+				   struct lock_class_key *key,
+				   const char *name);
 
 void intel_engine_init_active(struct intel_engine_cs *engine,
 			      unsigned int subclass);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 9ceddfbb1687..ac32fd29d7ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -810,11 +810,13 @@ intel_engine_init_active(struct intel_engine_cs *engine, unsigned int subclass)
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
@@ -825,6 +827,10 @@ create_pinned_context(struct intel_engine_cs *engine,
 
 	__set_bit(CONTEXT_BARRIER_BIT, &ce->flags);
 	ce->timeline = page_pack_bits(NULL, hwsp);
+	ce->ring = __intel_context_ring_size(ring_size);
+
+	i915_vm_put(ce->vm);
+	ce->vm = i915_vm_get(vm);
 
 	err = intel_context_pin(ce); /* perma-pin so it is always available */
 	if (err) {
@@ -863,8 +869,9 @@ create_kernel_context(struct intel_engine_cs *engine)
 {
 	static struct lock_class_key kernel;
 
-	return create_pinned_context(engine, I915_GEM_HWS_SEQNO_ADDR,
-				     &kernel, "kernel_context");
+	return intel_engine_create_pinned_context(engine, engine->gt->vm, SZ_4K,
+						  I915_GEM_HWS_SEQNO_ADDR,
+						  &kernel, "kernel_context");
 }
 
 /**
-- 
2.31.1

