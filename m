Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9D92C657E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53BB6ED8A;
	Fri, 27 Nov 2020 12:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660046ED82;
 Fri, 27 Nov 2020 12:12:10 +0000 (UTC)
IronPort-SDR: Y0L3Y3SnRvoAEdmIRWuaht4ctkd/dVQt7gMIUj3XgNb/sG0/8AU1qMvSPUhhXNJxs/dAHW+AxG
 X1Gq3rqIbEzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883836"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883836"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:10 -0800
IronPort-SDR: wN0rkzspnFHUHmi3NzHRveqh3c4UjM14tbSGHx0OAOApdZv5VJ+6Zc2Xj96A/CiVfJP9n1U0R7
 52qzowtb5uCA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029998"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:07 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 146/162] drm/i915/pm: suspend and restore ppgtt mapping
Date: Fri, 27 Nov 2020 12:07:02 +0000
Message-Id: <20201127120718.454037-147-matthew.auld@intel.com>
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
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>,
 CQ Tang <cq.tang@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>

During suspend we will lose all page tables as they are allocated in
LMEM. In-order to  make sure that the contexts do not access the
corrupted page table after we restore, we are evicting all vma's that
are bound to vm's. This includes kernel vm.

During resume, we are restoring the page tables back to scratch page.

Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c  |  13 ++++
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h  |   2 +
 drivers/gpu/drm/i915/gt/intel_ppgtt.c |   4 +
 drivers/gpu/drm/i915/i915_drv.c       | 102 +++++++++++++++++++++++---
 4 files changed, 112 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index b6fcebeef02a..704cab807e0b 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -775,3 +775,16 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
 	kfree(ppgtt);
 	return ERR_PTR(err);
 }
+
+void gen8_restore_ppgtt_mappings(struct i915_address_space *vm)
+{
+	const unsigned int count = gen8_pd_top_count(vm);
+	int i;
+
+	for (i = 1; i <= vm->top; i++)
+		fill_px(vm->scratch[i], vm->scratch[i - 1]->encode);
+
+	fill_page_dma(px_base(i915_vm_to_ppgtt(vm)->pd),
+		      vm->scratch[vm->top]->encode, count);
+}
+
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
index 76a08b9c1f5c..3fa4b95aaabd 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
@@ -6,8 +6,10 @@
 #ifndef __GEN8_PPGTT_H__
 #define __GEN8_PPGTT_H__
 
+struct i915_address_space;
 struct intel_gt;
 
+void gen8_restore_ppgtt_mappings(struct i915_address_space *vm);
 struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 34a02643bb75..9b3eacd12a7e 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -9,6 +9,8 @@
 #include "intel_gtt.h"
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
+#include "gem/i915_gem_context.h"
+#include "gem/i915_gem_region.h"
 #include "gen6_ppgtt.h"
 #include "gen8_ppgtt.h"
 
@@ -317,3 +319,5 @@ void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt)
 	ppgtt->vm.vma_ops.set_pages   = ppgtt_set_pages;
 	ppgtt->vm.vma_ops.clear_pages = clear_pages;
 }
+
+
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index e8c4931fc818..7115f4db5043 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -64,6 +64,7 @@
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_ioctls.h"
 #include "gem/i915_gem_mman.h"
+#include "gt/gen8_ppgtt.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_pm.h"
 #include "gt/intel_rc6.h"
@@ -1136,13 +1137,13 @@ static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend)
 
 				mutex_unlock(&mem->objects.lock);
 
-				if (in_suspend)
-					i915_gem_object_unbind(obj, 0);
-
 				if (in_suspend) {
 					obj->swapto = NULL;
 					obj->evicted = false;
 					obj->do_swapping = true;
+
+					i915_gem_object_unbind(obj, 0);
+
 					ret = __i915_gem_object_put_pages(obj);
 					obj->do_swapping = false;
 					if (ret) {
@@ -1176,6 +1177,43 @@ static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend)
 	return ret;
 }
 
+static int i915_gem_suspend_ppgtt_mappings(struct drm_i915_private *i915)
+{
+	struct i915_gem_context *ctx, *cn;
+	int ret;
+
+	spin_lock(&i915->gem.contexts.lock);
+	list_for_each_entry_safe(ctx, cn, &i915->gem.contexts.list, link) {
+		struct i915_address_space *vm;
+
+		if (!kref_get_unless_zero(&ctx->ref))
+			continue;
+		spin_unlock(&i915->gem.contexts.lock);
+
+		vm = i915_gem_context_get_vm_rcu(ctx);
+		mutex_lock(&vm->mutex);
+		ret = i915_gem_evict_vm(vm);
+		mutex_unlock(&vm->mutex);
+		if (ret) {
+			GEM_WARN_ON(ret);
+			i915_vm_put(vm);
+			i915_gem_context_put(ctx);
+			return ret;
+		}
+		i915_vm_put(vm);
+		spin_lock(&i915->gem.contexts.lock);
+		list_safe_reset_next(ctx, cn, link);
+		i915_gem_context_put(ctx);
+	}
+	spin_unlock(&i915->gem.contexts.lock);
+
+	mutex_lock(&i915->gt.vm->mutex);
+	ret = i915_gem_evict_vm(i915->gt.vm);
+	mutex_unlock(&i915->gt.vm->mutex);
+
+	return ret;
+}
+
 static int i915_drm_suspend(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
@@ -1213,9 +1251,17 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	intel_fbdev_set_suspend(dev, FBINFO_STATE_SUSPENDED, true);
 
-	ret = intel_dmem_evict_buffers(dev, true);
-	if (ret)
-		return ret;
+	if (HAS_LMEM(dev_priv))	{
+		ret = intel_dmem_evict_buffers(dev, true);
+		if (ret)
+			return ret;
+
+		i915_teardown_blt_windows(dev_priv);
+
+		ret = i915_gem_suspend_ppgtt_mappings(dev_priv);
+		if (ret)
+			return ret;
+	}
 
 	dev_priv->suspend_count++;
 
@@ -1306,6 +1352,36 @@ int i915_suspend_switcheroo(struct drm_i915_private *i915, pm_message_t state)
 	return i915_drm_suspend_late(&i915->drm, false);
 }
 
+static void i915_gem_restore_ppgtt_mappings(struct drm_i915_private *i915)
+{
+	struct i915_gem_context *ctx, *cn;
+
+	spin_lock(&i915->gem.contexts.lock);
+
+	list_for_each_entry_safe(ctx, cn, &i915->gem.contexts.list, link) {
+		struct i915_address_space *vm;
+
+		if (!kref_get_unless_zero(&ctx->ref))
+			continue;
+
+		spin_unlock(&i915->gem.contexts.lock);
+
+		vm = i915_gem_context_get_vm_rcu(ctx);
+		mutex_lock(&vm->mutex);
+		gen8_restore_ppgtt_mappings(vm);
+		mutex_unlock(&vm->mutex);
+		i915_vm_put(vm);
+		spin_lock(&i915->gem.contexts.lock);
+		list_safe_reset_next(ctx, cn, link);
+		i915_gem_context_put(ctx);
+	}
+	spin_unlock(&i915->gem.contexts.lock);
+
+	mutex_lock(&i915->gt.vm->mutex);
+	gen8_restore_ppgtt_mappings(i915->gt.vm);
+	mutex_unlock(&i915->gt.vm->mutex);
+}
+
 static int i915_drm_resume(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
@@ -1342,9 +1418,17 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	drm_mode_config_reset(dev);
 
-	ret = intel_dmem_evict_buffers(dev, false);
-	if (ret)
-		DRM_ERROR("i915_resume:i915_gem_object_pin_pages failed with err=%d\n", ret);
+	if (HAS_LMEM(dev_priv)) {
+		i915_gem_restore_ppgtt_mappings(dev_priv);
+
+		ret = i915_setup_blt_windows(dev_priv);
+		if (ret)
+			GEM_BUG_ON(ret);
+
+		ret = intel_dmem_evict_buffers(dev, false);
+		if (ret)
+			DRM_ERROR("i915_resume:i915_gem_object_pin_pages failed with err=%d\n", ret);
+	}
 
 	i915_gem_resume(dev_priv);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
