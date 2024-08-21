Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420DA959C3F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 14:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD8110E904;
	Wed, 21 Aug 2024 12:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMV+wGcm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B84910E903;
 Wed, 21 Aug 2024 12:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724244333; x=1755780333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2+UGHgdQYmoBW+oQo4e/hjXKKvosH8D2eHFi/KquwPE=;
 b=UMV+wGcm4ziAUy5sCYWM7JQIeiBxO7iUVYuD40xxtHe0xditk4RyYNCd
 qH9d9tElO7OX0Yn/Rsz9yUdzlwm+MhW4VrO88X9AO1JJsJDVHPYjB5/Xh
 sp58Pa49RIiwhTLWdGXGtfxynWmZs9G37e/eS+PxP3BRURfGRtN5zPrt9
 JwRMntAaUYUj5tNkmBX2IfIrlmSa5QwjhRQNXcdJwV5Jq41DrzkxhzaPp
 21fwHzAi2FKmZY+bwL8GJcZVXNbjMq86RTyjOU5Q81rP/FuBsEca2qxUM
 /AvPbCeXG5EH1OXh0Z1CRGjtk33C8NR2t4h1IutWYtdiCs+b0XEnlMc41 g==;
X-CSE-ConnectionGUID: AwjGBKlkSsGBYbED6F6aXw==
X-CSE-MsgGUID: 9/0FqVDlR021tm230/jLGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40059773"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="40059773"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:33 -0700
X-CSE-ConnectionGUID: bT7+PR8hRiCsJGTdM2/D0Q==
X-CSE-MsgGUID: HXATBpA2SJmOAmX28+yD6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61052305"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:32 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v1 13/14] drm/i915/gt: Implement creation and removal routines
 for CCS engines
Date: Wed, 21 Aug 2024 14:43:48 +0200
Message-ID: <20240821124349.295259-14-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821124349.295259-1-andi.shyti@linux.intel.com>
References: <20240821124349.295259-1-andi.shyti@linux.intel.com>
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

Use a mutex to control the changes to the uabi engine.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  5 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c  |  2 +
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c  | 99 ++++++++++++++++++++
 3 files changed, 106 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index cdc695fda918..28a81e33dbe1 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -413,6 +413,11 @@ struct intel_engine_cs {
 		struct list_head uabi_list;
 		struct rb_node uabi_node;
 	};
+	/*
+	 * Serialize changes if the engine status, validity (through
+	 * RB_CLEAR_NODE) and insertion and removal from uabi list
+	 */
+	struct mutex uabi_mutex;
 
 	struct intel_sseu sseu;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 8e5284af8335..c50060133336 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -219,6 +219,8 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 		struct intel_engine_cs *engine =
 			container_of(it, typeof(*engine), uabi_list);
 
+		mutex_init(&engine->uabi_mutex);
+
 		if (intel_gt_has_unrecoverable_error(engine->gt))
 			goto clear_node_continue; /* ignore incomplete engines */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index 45e9280f9bac..82de29eb4dd7 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -8,6 +8,7 @@
 #include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 #include "intel_gt_sysfs.h"
+#include "sysfs_engines.h"
 
 static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
@@ -115,6 +116,29 @@ static void __update_ccs_mask(struct intel_gt *gt, u32 ccs_mode)
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
@@ -128,6 +152,81 @@ void intel_gt_ccs_mode_init(struct intel_gt *gt)
 	__update_ccs_mask(gt, 1);
 }
 
+static int rb_engine_cmp(struct rb_node *rb_new, const struct rb_node *rb_old)
+{
+	struct intel_engine_cs *new = rb_to_uabi_engine(rb_new);
+	struct intel_engine_cs *old = rb_to_uabi_engine(rb_old);
+
+	return new->uabi_instance - old->uabi_instance;
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
+	for_each_engine_masked(e, gt, new_ccs_mask, tmp) {
+		mutex_lock(&e->uabi_mutex);
+
+		i915->engine_uabi_class_count[I915_ENGINE_CLASS_COMPUTE]++;
+
+		/* The engine is now inserted and marked as valid */
+		rb_find_add(&e->uabi_node, &i915->uabi_engines, rb_engine_cmp);
+
+		if (intel_engine_add_single_sysfs(e))
+			gt_warn(gt,
+				"Unable to create sysfs entries for %s engine",
+				e->name);
+
+		mutex_unlock(&e->uabi_mutex);
+	}
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
+	for_each_engine_masked(e, gt, new_ccs_mask, tmp) {
+		mutex_lock(&e->uabi_mutex);
+
+		i915->engine_uabi_class_count[I915_ENGINE_CLASS_COMPUTE]--;
+
+		rb_erase(&e->uabi_node, &i915->uabi_engines);
+		RB_CLEAR_NODE(&e->uabi_node);
+
+		/* Remove sysfs entries */
+		kobject_del(e->kobj);
+		e->kobj = NULL;
+
+		mutex_unlock(&e->uabi_mutex);
+	}
+}
+
 static ssize_t num_cslices_show(struct device *dev,
 				struct device_attribute *attr,
 				char *buff)
-- 
2.45.2

