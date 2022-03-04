Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFACF4CE12B
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 00:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465CD10FC0B;
	Fri,  4 Mar 2022 23:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E5810FC0B;
 Fri,  4 Mar 2022 23:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646437606; x=1677973606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=66R4B5IQg3diEZcQA3+4CLcKSAw7qvE0CGO7f6BELGw=;
 b=QxncS2cN6KbGDyZsYSs5eN5V+YyFOuRZ9uOLgVzFpZ+uEsW/N2D2igD4
 2QQUe1a6ESA2t/yyWXJW52eMikB7QAXEA9DJNaHUiE6Ngk//l8aeMDffr
 Pbc/OGKQNhidsMO9x8sqKMu+5o20gw5YckeROGxf7qoKecZxy1fRRckbN
 5pkRbg7lK4QNUQIlgT89oJxxjrm9v6pMPNlpaqM/+4AKywxKt8JoLqXgb
 zdmWRnbN29qTWdFTPNxxaIjxfiy9Cq/oVTzF+hV1W0WrHbmx889xLm3OE
 OVEFh/Zq/U+Xanl4c9kdE4KtDWqb0kvfrOMSUWcJSTJ3jI5ztU48Ti3Ou g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="254280749"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="254280749"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 15:46:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="687024885"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 15:46:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/dg2: Add debugfs to control global preemption
 setting
Date: Fri,  4 Mar 2022 15:46:39 -0800
Message-Id: <20220304234639.3231617-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304234639.3231617-1-matthew.d.roper@intel.com>
References: <20220304234639.3231617-1-matthew.d.roper@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, John Harrison <john.c.harrison@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>

Since DG2 and beyond only support global preemption enable/disable (see
Wa_14015141709), userspace no longer has a way to control preemption on
a per-context basis.  Preemption is globally enabled by default, but the
UMD teams have requested that we provide a debugfs interface that can be
used to query and adjust the system-wide preemption setting for
development and bug reporting purposes.

v2 (MattR):
 - Split debugfs out into a separate patch.  (Jani)
 - Add the hardware update/query as facilities in intel_gt.c and just
   call them from the debugfs code.  (Jani)
 - Add register to GuC's save/restore list so that the value will
   persist across resets.  (Tvrtko)
 - Place under per-GT debugfs rather than i915 debugfs.  (MattR)
 - Only register debugfs entries on platforms subject to Wa_14015141709,
   and only on platforms that have an RCS engine.  (MattR/Tvrtko)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c         | 50 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt.h         |  3 ++
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c | 31 ++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h    |  3 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c |  7 +++
 5 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 8a2483ccbfb9..90bdebd8d267 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1045,3 +1045,53 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
 	intel_uncore_forcewake_put_delayed(uncore, FORCEWAKE_ALL);
 	mutex_unlock(&gt->tlb_invalidate_lock);
 }
+
+/**
+ * intel_gt_get_global_preemption - return whether the global preemption
+ *     setting is enabled in hardware
+ * @gt: GT structure
+ *
+ * Returns the hardware's global 'preemption enabled' setting.  Only relevant
+ * on newer platforms that lack per-context preemption control (and only on
+ * GTs that have a render engine).
+ *
+ * Returns 1 if preemption is enabled, 0 if disabled.
+ */
+u64 intel_gt_get_global_preemption(struct intel_gt *gt)
+{
+	intel_wakeref_t wakeref;
+	u32 val;
+
+	drm_WARN_ON(&gt->i915->drm, GRAPHICS_VER_FULL(gt->i915) < IP_VER(12, 55));
+	drm_WARN_ON(&gt->i915->drm, RCS_MASK(gt) == 0);
+
+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
+		val = intel_uncore_read(gt->uncore, GEN12_VFG_PREEMPTION_CHICKEN);
+
+	return !(val & GEN12_VFG_PREEMPT_CHICKEN_DISABLE);
+}
+
+/**
+ * intel_gt_set_global_preemption - adjust global preemption enabled setting
+ * @gt: GT structure
+ * @val: desired preemption setting
+ *
+ * Enables global preemption if @val is non-zero, otherwise disables it.  Only
+ * relevant on newer platforms that lack per-context preemption control (and
+ * only on GTs that have a render engine).
+ *
+ * Returns 1 if preemption is enabled, 0 if disabled.
+ */
+void intel_gt_set_global_preemption(struct intel_gt *gt, u64 val)
+{
+	intel_wakeref_t wakeref;
+	u32 tmp = val ?
+		_MASKED_BIT_DISABLE(GEN12_VFG_PREEMPT_CHICKEN_DISABLE) :
+		_MASKED_BIT_ENABLE(GEN12_VFG_PREEMPT_CHICKEN_DISABLE);
+
+	drm_WARN_ON(&gt->i915->drm, GRAPHICS_VER_FULL(gt->i915) < IP_VER(12, 55));
+	drm_WARN_ON(&gt->i915->drm, RCS_MASK(gt) == 0);
+
+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
+		intel_uncore_write(gt->uncore, GEN12_VFG_PREEMPTION_CHICKEN, tmp);
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 0f571c8ee22b..63a599a1bf6d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -94,4 +94,7 @@ void intel_gt_watchdog_work(struct work_struct *work);
 
 void intel_gt_invalidate_tlbs(struct intel_gt *gt);
 
+u64 intel_gt_get_global_preemption(struct intel_gt *gt);
+void intel_gt_set_global_preemption(struct intel_gt *gt, u64 val);
+
 #endif /* __INTEL_GT_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index f103664b71d4..d851e3f80877 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -6,6 +6,7 @@
 #include <linux/debugfs.h>
 
 #include "i915_drv.h"
+#include "intel_gt.h"
 #include "intel_gt_debugfs.h"
 #include "intel_gt_engines_debugfs.h"
 #include "intel_gt_pm_debugfs.h"
@@ -57,13 +58,43 @@ static int __intel_gt_debugfs_reset_store(void *data, u64 val)
 DEFINE_SIMPLE_ATTRIBUTE(reset_fops, __intel_gt_debugfs_reset_show,
 			__intel_gt_debugfs_reset_store, "%llu\n");
 
+static int i915_global_preemption_enabled_get(void *data, u64 *val)
+{
+	*val = intel_gt_get_global_preemption((struct intel_gt *)data);
+
+	return 0;
+}
+
+static int i915_global_preemption_enabled_set(void *data, u64 val)
+{
+	intel_gt_set_global_preemption((struct intel_gt *)data, val);
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(i915_global_preemption_enabled_fops,
+			i915_global_preemption_enabled_get,
+			i915_global_preemption_enabled_set,
+			"%llu\n");
+
 static void gt_debugfs_register(struct intel_gt *gt, struct dentry *root)
 {
 	static const struct intel_gt_debugfs_file files[] = {
 		{ "reset", &reset_fops, NULL },
 	};
+	static const struct  intel_gt_debugfs_file preempt_files[] = {
+		{ "preemption_enabled", &i915_global_preemption_enabled_fops }
+	};
 
 	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), gt);
+
+	/*
+	 * Global preemption control only applies to DG2 and beyond
+	 * (Wa_14015141709) and only to GTs with an RCS.
+	 */
+	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 55) && RCS_MASK(gt))
+		intel_gt_debugfs_register_files(root, preempt_files,
+						ARRAY_SIZE(preempt_files), gt);
 }
 
 void intel_gt_debugfs_register(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 19cd34f24263..21ede1887b9f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -468,6 +468,9 @@
 #define VF_PREEMPTION				_MMIO(0x83a4)
 #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
 
+#define GEN12_VFG_PREEMPTION_CHICKEN		_MMIO(0x83b4)
+#define   GEN12_VFG_PREEMPT_CHICKEN_DISABLE	REG_BIT(8)
+
 #define GEN8_RC6_CTX_INFO			_MMIO(0x8504)
 
 #define GEN12_SQCM				_MMIO(0x8724)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index acc4a3766dc1..7e008382ab03 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -352,6 +352,13 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
 	for (i = 0; i < GEN9_LNCFCMOCS_REG_COUNT; i++)
 		ret |= GUC_MMIO_REG_ADD(regset, GEN9_LNCFCMOCS(i), false);
 
+	/*
+	 * VFG_PREEMPTION_CHICKEN can be controlled via debugfs; ensure
+	 * the setting sticks across resets
+	 */
+	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
+		ret |= GUC_MMIO_REG_ADD(regset, GEN12_VFG_PREEMPTION_CHICKEN, true);
+
 	return ret ? -1 : 0;
 }
 
-- 
2.34.1

