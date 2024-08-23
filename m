Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE03E95CD5A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D9A10E78B;
	Fri, 23 Aug 2024 13:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fauUrO+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993FF10E78B;
 Fri, 23 Aug 2024 13:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724418641; x=1755954641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DBT0Re2p8Jt6VcmRjDB8G0+ToP+hQCZ31t+6y5laI6M=;
 b=fauUrO+CxtvEb2F04cxHpp2++Upxf8gWiJ/8mHDmEqFn1N7nGtQbtksn
 8767kzyPEjRq5qSWG5JNW4oL9DJMo7dq7t0WC8IfY4a16slzPWZbnXY7r
 0xfvp38SAYBoKgAnUIp4XuPRUC7SepOi/S6e60n4WI2jsjTMaZWR1Z/Gb
 T9L+8RRMMgxAIQ7noN2byWUfnDPhgGPIRTAA0pK/Btu/Xyx44xm39fE/8
 6sYS5qW1oytIRQ2Eoo0sKWat+8FSo48Ode7Ver50J9NI8pK18OxDKf7SP
 QXmD5Ifsu5OjPKmylf2A/J3otaqJU45sdngY81UMIqdDVhOLzMaoZxb+G Q==;
X-CSE-ConnectionGUID: 9VhC5CzARJW9+uy3zXenNA==
X-CSE-MsgGUID: bYlk6gRdQXqx8bUqKjcrag==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23055272"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="23055272"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:10:41 -0700
X-CSE-ConnectionGUID: jG64Bf9BTq2hNfN8XTrY4g==
X-CSE-MsgGUID: fs7Li7nzQu+X5RHBN/JGNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="65999454"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.236])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:10:39 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v3 14/15] drm/i915/gt: Implement creation and removal routines
 for CCS engines
Date: Fri, 23 Aug 2024 15:08:54 +0200
Message-ID: <20240823130855.72436-15-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240823130855.72436-1-andi.shyti@linux.intel.com>
References: <20240823130855.72436-1-andi.shyti@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for upcoming patches, we need routines to
dynamically create and destroy CCS engines based on the CCS mode
that the user wants to set.

The process begins by calculating the engine mask for the engines
that need to be added or removed. We then update the UABI list of
exposed engines and create or destroy the corresponding sysfs
interfaces accordingly.

These functions are not yet in use, so no functional changes are
intended at this stage.

Mark the functions 'add_uabi_ccs_engines()' and
'remove_uabi_ccs_engines()' as '__maybe_unused' to ensure
successful compilation and maintain bisectability. This
annotation will be removed in subsequent commits.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 124 ++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index 5eead7b18f57..cc46ee9dea3f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -4,10 +4,12 @@
  */
 
 #include "i915_drv.h"
+#include "intel_engine_user.h"
 #include "intel_gt_ccs_mode.h"
 #include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 #include "intel_gt_sysfs.h"
+#include "sysfs_engines.h"
 
 static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
@@ -123,6 +125,29 @@ static void __update_ccs_mask(struct intel_gt *gt, u32 ccs_mode)
 	intel_gt_apply_ccs_mode(gt);
 }
 
+static void update_ccs_mask(struct intel_gt *gt, u32 ccs_mode)
+{
+	struct intel_engine_cs *engine;
+	intel_engine_mask_t tmp;
+
+	__update_ccs_mask(gt, ccs_mode);
+
+	/* Update workaround values */
+	for_each_engine_masked(engine, gt, gt->ccs.id_mask, tmp) {
+		struct i915_wa_list *wal = &engine->wa_list;
+		struct i915_wa *wa;
+		int i;
+
+		for (i = 0, wa = wal->list; i < wal->count; i++, wa++) {
+			if (!i915_mmio_reg_equal(wa->reg, XEHP_CCS_MODE))
+				continue;
+
+			wa->set = gt->ccs.mode_reg_val;
+			wa->read = gt->ccs.mode_reg_val;
+		}
+	}
+}
+
 void intel_gt_ccs_mode_init(struct intel_gt *gt)
 {
 	if (!IS_DG2(gt->i915))
@@ -136,6 +161,105 @@ void intel_gt_ccs_mode_init(struct intel_gt *gt)
 	__update_ccs_mask(gt, 1);
 }
 
+static int rb_engine_cmp(struct rb_node *rb_new, const struct rb_node *rb_old)
+{
+	struct intel_engine_cs *new = rb_to_uabi_engine(rb_new);
+	struct intel_engine_cs *old = rb_to_uabi_engine(rb_old);
+
+	if (new->uabi_class - old->uabi_class == 0)
+		return new->uabi_instance - old->uabi_instance;
+
+	return new->uabi_class - old->uabi_class;
+}
+
+static void __maybe_unused add_uabi_ccs_engines(struct intel_gt *gt, u32 ccs_mode)
+{
+	struct drm_i915_private *i915 = gt->i915;
+	intel_engine_mask_t new_ccs_mask, tmp;
+	struct intel_engine_cs *e;
+
+	/* Store the current ccs mask */
+	new_ccs_mask = gt->ccs.id_mask;
+	update_ccs_mask(gt, ccs_mode);
+
+	/*
+	 * Store only the mask of the CCS engines that need to be added by
+	 * removing from the new mask the engines that are already active
+	 */
+	new_ccs_mask = gt->ccs.id_mask & ~new_ccs_mask;
+	new_ccs_mask <<= CCS0;
+
+	mutex_lock(&i915->uabi_engines_mutex);
+	for_each_engine_masked(e, gt, new_ccs_mask, tmp) {
+		int err;
+
+		i915->engine_uabi_class_count[I915_ENGINE_CLASS_COMPUTE]++;
+
+		/*
+		 * The engine is now inserted and marked as valid.
+		 *
+		 * rb_find_add() should always return NULL. If it returns a
+		 * pointer to an rb_node it means that it found the engine we
+		 * are trying to insert which means that something is really
+		 * wrong.
+		 */
+		GEM_BUG_ON(rb_find_add(&e->uabi_node,
+				       &i915->uabi_engines, rb_engine_cmp));
+
+		/* We inserted the engine, let's check if now we can find it */
+		GEM_BUG_ON(intel_engine_lookup_user(i915, e->uabi_class,
+						    e->uabi_instance) != e);
+
+		/*
+		 * If the engine has never been used before (e.g. we are moving
+		 * for the first time from CCS mode 1 to CCS mode 2 or 4), then
+		 * also its sysfs entry has never been created. In this case its
+		 * value will be null and we need to allocate it.
+		 */
+		if (!e->kobj)
+			err = intel_engine_add_single_sysfs(e);
+		else
+			err = kobject_add(e->kobj,
+					  i915->sysfs_engine, "%s", e->name);
+
+		if (err)
+			gt_warn(gt,
+				"Unable to create sysfs entries for %s engine",
+				e->name);
+	}
+	mutex_unlock(&i915->uabi_engines_mutex);
+}
+
+static void __maybe_unused remove_uabi_ccs_engines(struct intel_gt *gt, u8 ccs_mode)
+{
+	struct drm_i915_private *i915 = gt->i915;
+	intel_engine_mask_t new_ccs_mask, tmp;
+	struct intel_engine_cs *e;
+
+	/* Store the current ccs mask */
+	new_ccs_mask = gt->ccs.id_mask;
+	update_ccs_mask(gt, ccs_mode);
+
+	/*
+	 * Store only the mask of the CCS engines that need to be removed by
+	 * unmasking them from the new mask the engines that are already active
+	 */
+	new_ccs_mask = new_ccs_mask & ~gt->ccs.id_mask;
+	new_ccs_mask <<= CCS0;
+
+	mutex_lock(&i915->uabi_engines_mutex);
+	for_each_engine_masked(e, gt, new_ccs_mask, tmp) {
+		i915->engine_uabi_class_count[I915_ENGINE_CLASS_COMPUTE]--;
+
+		rb_erase(&e->uabi_node, &i915->uabi_engines);
+		RB_CLEAR_NODE(&e->uabi_node);
+
+		/* Remove sysfs entries */
+		kobject_del(e->kobj);
+	}
+	mutex_unlock(&i915->uabi_engines_mutex);
+}
+
 static ssize_t num_cslices_show(struct device *dev,
 				struct device_attribute *attr,
 				char *buff)
-- 
2.45.2

