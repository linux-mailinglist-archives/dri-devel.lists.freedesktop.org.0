Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4179E9715
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D1410E769;
	Mon,  9 Dec 2024 13:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elveZy89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E933310E75E;
 Mon,  9 Dec 2024 13:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751217; x=1765287217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UQMwoajffTUbXgHz9b6yXuc68B+cQ05epTQLAqmoFVM=;
 b=elveZy89My0Ta/3QBngKaiiuNegQEkK3qoUY9JKaexuW+qJNYrD/MXgl
 gRggKW4uOkiDsKS9rqDkxByROOAX9bk1peNYmt/c0YekkBLg/aUjqGcnL
 W/Ce2UjUT/JTAMW8S1A0jCYCudoNeRnbzJ1g4dCEYjooUel5mZwWmWFAa
 5q+y4qkGsgoZHAmwR7+V/5k2/MWlipqagTC0QEOR/8uHuFHJ6RcreHu4g
 n5NmU1oLNMz3Inwb+7sS2cLuTqEcYQFvqmMHuNRw/CmL+aFzoYYOkdjEO
 8fNXeq5tznxIZjwnoF91lRAkAuJSqyHnEZTfWCeuAjlwGtyU5W+oS3Exr A==;
X-CSE-ConnectionGUID: NXjXnv7SRHWCCc5a8Rip9Q==
X-CSE-MsgGUID: hGczOX+yQmKt7pjmDXJdiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34192145"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34192145"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:36 -0800
X-CSE-ConnectionGUID: Aknx1MlfSRKLCAuRcV5cRw==
X-CSE-MsgGUID: MT8yhJhdTEWWNhVdxp7aGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531355"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:35 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 19/26] drm/xe/eudebug: Dynamically toggle debugger
 functionality
Date: Mon,  9 Dec 2024 15:33:10 +0200
Message-ID: <20241209133318.1806472-20-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

Make it possible to dynamically enable/disable debugger funtionality,
including the setting and unsetting of required hw register values via a
sysfs entry located at '/sys/class/drm/card<X>/device/enable_eudebug'.

This entry uses 'kstrtobool' and as such it accepts inputs as documented
by this function, in particular '0' and '1'.

v2: use new discovery_lock to gain exclusivity (Mika)
v3: remove init_late and init_hw_engine (Dominik)

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   2 -
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_eudebug.c      | 128 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_eudebug.h      |   4 -
 drivers/gpu/drm/xe/xe_exec_queue.c   |   5 ++
 drivers/gpu/drm/xe/xe_hw_engine.c    |   1 -
 drivers/gpu/drm/xe/xe_reg_sr.c       |  21 +++--
 drivers/gpu/drm/xe/xe_reg_sr.h       |   4 +-
 drivers/gpu/drm/xe/xe_rtp.c          |   2 +-
 9 files changed, 137 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a7a715475184..3045f2a2ca1d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -782,8 +782,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_debugfs_register(xe);
 
-	xe_eudebug_init_late(xe);
-
 	xe_hwmon_register(xe);
 
 	for_each_gt(gt, xe, id)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4ab9f06eba2d..f081af5e729d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -557,6 +557,9 @@ struct xe_device {
 		/** discovery_lock: used for discovery to block xe ioctls */
 		struct rw_semaphore discovery_lock;
 
+		/** @enable: is the debugging functionality enabled */
+		bool enable;
+
 		/** @attention_scan: attention scan worker */
 		struct delayed_work attention_scan;
 	} eudebug;
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index e17b8f98c7b6..fe947d5350d8 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -2028,9 +2028,6 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	param->version = DRM_XE_EUDEBUG_VERSION;
 
-	if (!xe->eudebug.available)
-		return -EOPNOTSUPP;
-
 	d = kzalloc(sizeof(*d), GFP_KERNEL);
 	if (!d)
 		return -ENOMEM;
@@ -2090,28 +2087,30 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 {
 	struct xe_device *xe = to_xe_device(dev);
 	struct drm_xe_eudebug_connect * const param = data;
-	int ret = 0;
 
-	ret = xe_eudebug_connect(xe, param);
+	lockdep_assert_held(&xe->eudebug.discovery_lock);
 
-	return ret;
+	if (!xe->eudebug.enable)
+		return -ENODEV;
+
+	return xe_eudebug_connect(xe, param);
 }
 
 static void add_sr_entry(struct xe_hw_engine *hwe,
 			 struct xe_reg_mcr mcr_reg,
-			 u32 mask)
+			 u32 mask, bool enable)
 {
 	const struct xe_reg_sr_entry sr_entry = {
 		.reg = mcr_reg.__reg,
 		.clr_bits = mask,
-		.set_bits = mask,
+		.set_bits = enable ? mask : 0,
 		.read_mask = mask,
 	};
 
-	xe_reg_sr_add(&hwe->reg_sr, &sr_entry, hwe->gt);
+	xe_reg_sr_add(&hwe->reg_sr, &sr_entry, hwe->gt, true);
 }
 
-void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
+static void xe_eudebug_reinit_hw_engine(struct xe_hw_engine *hwe, bool enable)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_device *xe = gt_to_xe(gt);
@@ -2123,23 +2122,113 @@ void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
 		return;
 
 	if (XE_WA(gt, 18022722726))
-		add_sr_entry(hwe, ROW_CHICKEN, STALL_DOP_GATING_DISABLE);
+		add_sr_entry(hwe, ROW_CHICKEN,
+			     STALL_DOP_GATING_DISABLE, enable);
 
 	if (XE_WA(gt, 14015474168))
-		add_sr_entry(hwe, ROW_CHICKEN2, XEHPC_DISABLE_BTB);
+		add_sr_entry(hwe, ROW_CHICKEN2,
+			     XEHPC_DISABLE_BTB,
+			     enable);
 
 	if (xe->info.graphics_verx100 >= 1200)
 		add_sr_entry(hwe, TD_CTL,
 			     TD_CTL_BREAKPOINT_ENABLE |
 			     TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
-			     TD_CTL_FEH_AND_FEE_ENABLE);
+			     TD_CTL_FEH_AND_FEE_ENABLE,
+			     enable);
 
 	if (xe->info.graphics_verx100 >= 1250)
-		add_sr_entry(hwe, TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE);
+		add_sr_entry(hwe, TD_CTL,
+			     TD_CTL_GLOBAL_DEBUG_ENABLE, enable);
+}
+
+static int xe_eudebug_enable(struct xe_device *xe, bool enable)
+{
+	struct xe_gt *gt;
+	int i;
+	u8 id;
+
+	if (!xe->eudebug.available)
+		return -EOPNOTSUPP;
+
+	/*
+	 * The connect ioctl has read lock so we can
+	 * serialize with taking write
+	 */
+	down_write(&xe->eudebug.discovery_lock);
+
+	if (!enable && !list_empty(&xe->eudebug.list)) {
+		up_write(&xe->eudebug.discovery_lock);
+		return -EBUSY;
+	}
+
+	if (enable == xe->eudebug.enable) {
+		up_write(&xe->eudebug.discovery_lock);
+		return 0;
+	}
+
+	for_each_gt(gt, xe, id) {
+		for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++) {
+			if (!(gt->info.engine_mask & BIT(i)))
+				continue;
+
+			xe_eudebug_reinit_hw_engine(&gt->hw_engines[i], enable);
+		}
+
+		xe_gt_reset_async(gt);
+		flush_work(&gt->reset.worker);
+	}
+
+	xe->eudebug.enable = enable;
+	up_write(&xe->eudebug.discovery_lock);
+
+	if (enable)
+		attention_scan_flush(xe);
+	else
+		attention_scan_cancel(xe);
+
+	return 0;
+}
+
+static ssize_t enable_eudebug_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+
+	return sysfs_emit(buf, "%u\n", xe->eudebug.enable);
+}
+
+static ssize_t enable_eudebug_store(struct device *dev, struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	bool enable;
+	int ret;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	ret = xe_eudebug_enable(xe, enable);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(enable_eudebug);
+
+static void xe_eudebug_sysfs_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_enable_eudebug.attr);
 }
 
 void xe_eudebug_init(struct xe_device *xe)
 {
+	struct device *dev = xe->drm.dev;
+	int ret;
+
 	spin_lock_init(&xe->eudebug.lock);
 	INIT_LIST_HEAD(&xe->eudebug.list);
 
@@ -2150,14 +2239,17 @@ void xe_eudebug_init(struct xe_device *xe)
 
 	xe->eudebug.ordered_wq = alloc_ordered_workqueue("xe-eudebug-ordered-wq", 0);
 	xe->eudebug.available = !!xe->eudebug.ordered_wq;
-}
 
-void xe_eudebug_init_late(struct xe_device *xe)
-{
 	if (!xe->eudebug.available)
 		return;
 
-	attention_scan_flush(xe);
+	ret = sysfs_create_file(&xe->drm.dev->kobj, &dev_attr_enable_eudebug.attr);
+	if (ret)
+		drm_warn(&xe->drm, "eudebug sysfs init failed: %d, debugger unavailable\n", ret);
+	else
+		devm_add_action_or_reset(dev, xe_eudebug_sysfs_fini, xe);
+
+	xe->eudebug.available = ret == 0;
 }
 
 void xe_eudebug_fini(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 572493d341ff..a08abf796cc1 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -26,9 +26,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 			     struct drm_file *file);
 
 void xe_eudebug_init(struct xe_device *xe);
-void xe_eudebug_init_late(struct xe_device *xe);
 void xe_eudebug_fini(struct xe_device *xe);
-void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
 
 void xe_eudebug_file_open(struct xe_file *xef);
 void xe_eudebug_file_close(struct xe_file *xef);
@@ -62,9 +60,7 @@ static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
 					   struct drm_file *file) { return 0; }
 
 static inline void xe_eudebug_init(struct xe_device *xe) { }
-static inline void xe_eudebug_init_late(struct xe_device *xe) { }
 static inline void xe_eudebug_fini(struct xe_device *xe) { }
-static inline void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe) { }
 
 static inline void xe_eudebug_file_open(struct xe_file *xef) { }
 static inline void xe_eudebug_file_close(struct xe_file *xef) { }
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index cca46a32723e..044a0f2e1873 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -432,6 +432,11 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
 			 !(value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)))
 		return -EINVAL;
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	if (XE_IOCTL_DBG(xe, !xe->eudebug.enable))
+		return -EPERM;
+#endif
+
 	q->eudebug_flags = EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
 	q->sched_props.preempt_timeout_us = 0;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8a188ddc99f4..c734aae88a57 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -559,7 +559,6 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_tuning_process_engine(hwe);
 	xe_wa_process_engine(hwe);
 	hw_engine_setup_default_state(hwe);
-	xe_eudebug_init_hw_engine(hwe);
 
 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
 	xe_reg_whitelist_process_engine(hwe);
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index e1a0e27cda14..e3a539c1c08e 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -93,22 +93,31 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
 
 int xe_reg_sr_add(struct xe_reg_sr *sr,
 		  const struct xe_reg_sr_entry *e,
-		  struct xe_gt *gt)
+		  struct xe_gt *gt,
+		  bool overwrite)
 {
 	unsigned long idx = e->reg.addr;
 	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
 	int ret;
 
 	if (pentry) {
-		if (!compatible_entries(pentry, e)) {
+		if (overwrite && e->set_bits) {
+			pentry->clr_bits |= e->clr_bits;
+			pentry->set_bits |= e->set_bits;
+			pentry->read_mask |= e->read_mask;
+		} else if (overwrite && !e->set_bits) {
+			pentry->clr_bits |= e->clr_bits;
+			pentry->set_bits &= ~e->clr_bits;
+			pentry->read_mask |= e->read_mask;
+		} else if (!compatible_entries(pentry, e)) {
 			ret = -EINVAL;
 			goto fail;
+		} else {
+			pentry->clr_bits |= e->clr_bits;
+			pentry->set_bits |= e->set_bits;
+			pentry->read_mask |= e->read_mask;
 		}
 
-		pentry->clr_bits |= e->clr_bits;
-		pentry->set_bits |= e->set_bits;
-		pentry->read_mask |= e->read_mask;
-
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
index 51fbba423e27..d67fafdcd847 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
@@ -6,6 +6,8 @@
 #ifndef _XE_REG_SR_
 #define _XE_REG_SR_
 
+#include <linux/types.h>
+
 /*
  * Reg save/restore bookkeeping
  */
@@ -21,7 +23,7 @@ int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe)
 void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
 
 int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
-		  struct xe_gt *gt);
+		  struct xe_gt *gt, bool overwrite);
 void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe);
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index b13d4d62f0b1..6006f7c90cac 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -153,7 +153,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 	};
 
 	sr_entry.reg.addr += mmio_base;
-	xe_reg_sr_add(sr, &sr_entry, gt);
+	xe_reg_sr_add(sr, &sr_entry, gt, false);
 }
 
 static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
-- 
2.43.0

