Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGGwDaxtnGmcGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:09:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602EA17880F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3352410E3AD;
	Mon, 23 Feb 2026 15:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DE6U5u91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA5810E3AA;
 Mon, 23 Feb 2026 15:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771859366; x=1803395366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jX4YDxdn5hgR786f9PadjSz7+ZrPnN0iXe5hkhrN2PA=;
 b=DE6U5u91HgqxWM0LOnbzvN8aBN3/q3pcduo+C7cfiOfu7D7rzjz9SuO5
 9s+6R7LpZ4LcKi4rbORyRC9OeRpHzfn1yiAEusIo/a4JdvTUCc/OSxAMv
 /SI/7ocN5cUC10lbJbhGY/PDNPzBfDuxuSVYxHmjt7td2PsSDx2oW1qeX
 LEp1kKQgzMBXq/Ctjr/EdRBc2BJGTe+MUspDZO+RpMlCPrBCqEahcoSHD
 Co/EqdGhWgiJcAuy6zqroXi2pnGNPvvMd6u51zXOhE8mM4folZmMR4V9D
 3e5ttFVklsnGuQmuubmKLVoMl+d04BmNxvbBjSIQun2JXPBWSjNCi9bCq A==;
X-CSE-ConnectionGUID: E3GI4kRfQ1WcLJUd/Zsi4g==
X-CSE-MsgGUID: bFCFZ948TtiXkNnvd2w4Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72918990"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72918990"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 07:09:26 -0800
X-CSE-ConnectionGUID: tvW/PNJnQRKPmCsweOOppg==
X-CSE-MsgGUID: ZAYvV9BHSjqu7ioibYv9HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219136621"
Received: from ksatya-dev.iind.intel.com ([10.190.229.161])
 by fmviesa004.fm.intel.com with ESMTP; 23 Feb 2026 07:09:24 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: [RFC v2 1/1] =?UTF-8?q?drm/xe/pf:=20Skip=20creating=20DRM=20devic?=
 =?UTF-8?q?e=20entries=20in=20PF=20admin=E2=80=91only=20mode?=
Date: Mon, 23 Feb 2026 15:09:51 +0000
Message-ID: <20260223150951.1834063-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223150951.1834063-1-satyanarayana.k.v.p@intel.com>
References: <20260223150951.1834063-1-satyanarayana.k.v.p@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[satyanarayana.k.v.p@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email,lists.freedesktop.org:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 602EA17880F
X-Rspamd-Action: no action

When the PF is configured for admin‑only mode, it is restricted to
management functions and should not expose a device node that would
allow users to run workloads.

In this mode, no DRM device entry is created; however, sysfs and debugfs
interfaces for the PF remain available at:

sysfs: /sys/devices/pci0000:00/<B:D:F>
debugfs: /sys/kernel/debug/dri/<B:D:F>

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: dri-devel@lists.freedesktop.org

---
V2 -> V3:
- Introduced new helper function xe_debugfs_create_files() to create
debugfs entries based on admin_only_pf mode or normal mode.

V1 -> V2:
- Rebased to latest drm-tip.
- Update update_minor_dev() to debugfs_minor_dev().
---
 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/xe_debugfs.c               | 18 +++--
 drivers/gpu/drm/xe/xe_debugfs_helpers.c       | 78 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_debugfs_helpers.h       | 27 +++++++
 drivers/gpu/drm/xe/xe_device.c                | 20 +++--
 drivers/gpu/drm/xe/xe_gsc_debugfs.c           |  8 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c            | 20 +++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c   |  5 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c           | 20 ++---
 drivers/gpu/drm/xe/xe_huc_debugfs.c           |  8 +-
 drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 23 ++++--
 drivers/gpu/drm/xe/xe_sriov.h                 |  8 ++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  5 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c              |  5 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.c          | 10 +--
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 14 ++--
 17 files changed, 202 insertions(+), 73 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_debugfs_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_debugfs_helpers.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 41ec698b3cc1..31901da1eff2 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -35,6 +35,7 @@ $(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe
 xe-y += xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
+	xe_debugfs_helpers.o \
 	xe_dep_scheduler.o \
 	xe_devcoredump.o \
 	xe_device.o \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 844cfafe1ec7..b560c170aaf1 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -13,6 +13,7 @@
 
 #include "regs/xe_pmt.h"
 #include "xe_bo.h"
+#include "xe_debugfs_helpers.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_debugfs.h"
@@ -512,22 +513,23 @@ static const struct file_operations disable_late_binding_fops = {
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
-	struct drm_minor *minor = xe->drm.primary;
-	struct dentry *root = minor->debugfs_root;
 	struct ttm_resource_manager *man;
 	struct xe_tile *tile;
+	struct dentry *root;
 	struct xe_gt *gt;
 	u8 tile_id;
 	u8 id;
 
-	drm_debugfs_create_files(debugfs_list,
-				 ARRAY_SIZE(debugfs_list),
-				 root, minor);
+	root = xe_debugfs_root_dir(xe);
+
+	xe_debugfs_create_files(debugfs_list,
+				ARRAY_SIZE(debugfs_list),
+				root, xe);
 
 	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
-		drm_debugfs_create_files(debugfs_residencies,
-					 ARRAY_SIZE(debugfs_residencies),
-					 root, minor);
+		xe_debugfs_create_files(debugfs_residencies,
+					ARRAY_SIZE(debugfs_residencies),
+					root, xe);
 		fault_create_debugfs_attr("inject_csc_hw_error", root,
 					  &inject_csc_hw_error);
 	}
diff --git a/drivers/gpu/drm/xe/xe_debugfs_helpers.c b/drivers/gpu/drm/xe/xe_debugfs_helpers.c
new file mode 100644
index 000000000000..c8b4a088cf28
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_debugfs_helpers.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_debugfs.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+
+#include <linux/debugfs.h>
+
+#include "xe_debugfs_helpers.h"
+
+static int xe_debugfs_open(struct inode *inode, struct file *file)
+{
+	struct drm_info_node *node = inode->i_private;
+
+	return single_open(file, node->info_ent->show, node);
+}
+
+static const struct file_operations xe_debugfs_fops = {
+	.owner = THIS_MODULE,
+	.open = xe_debugfs_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+/**
+ * xe_debugfs_create_files - Initialize a given set of debugfs files.
+ * @files: The array of files to create.
+ * @count: The number of files given.
+ * @root: debugfs dir root entry.
+ * @xe: the &xe_device to register
+ *
+ * Create a given set of debugfs files represented by an array of
+ * &struct drm_info_list in the given root directory. These files will be
+ * removed automatically on drm_debugfs_dev_fini().
+ *
+ * Returns 0 on success, negative error code on failure.
+ */
+int xe_debugfs_create_files(const struct drm_info_list *files, int count,
+			    struct dentry *root, struct xe_device *xe)
+{
+	struct drm_device *dev = &xe->drm;
+	struct drm_info_node *tmp;
+	struct drm_minor *minor;
+	int i;
+
+	if (!xe_device_is_admin_only(xe)) {
+		minor = dev->primary;
+		drm_debugfs_create_files(files, count, root, minor);
+		return 0;
+	}
+
+	for (i = 0; i < count; i++) {
+		u32 features = files[i].driver_features;
+
+		if (features && !drm_core_check_all_features(dev, features))
+			continue;
+
+		tmp = drmm_kzalloc(dev, sizeof(*tmp), GFP_KERNEL);
+		if (!tmp)
+			return -ENOMEM;
+
+		tmp->minor = drmm_kzalloc(dev, sizeof(*tmp->minor), GFP_KERNEL);
+		if (!tmp->minor)
+			return -ENOMEM;
+
+		tmp->minor->dev = dev;
+		tmp->dent = debugfs_create_file(files[i].name,
+						0444, root, tmp,
+						&xe_debugfs_fops);
+		tmp->info_ent = &files[i];
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_debugfs_helpers.h b/drivers/gpu/drm/xe/xe_debugfs_helpers.h
new file mode 100644
index 000000000000..15f9e51e0d27
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_debugfs_helpers.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026-2027 Intel Corporation
+ */
+
+#ifndef _XE_DEBUGFS_HELPERS_H_
+#define _XE_DEBUGFS_HELPERS_H_
+
+#include "xe_gt_types.h"
+#include "xe_sriov.h"
+
+struct drm_info_list;
+
+int xe_debugfs_create_files(const struct drm_info_list *files, int count,
+			    struct dentry *root, struct xe_device *xe);
+
+static inline struct dentry *xe_debugfs_root_dir(struct xe_device *xe)
+{
+	struct drm_minor *minor = xe->drm.primary;
+
+	if (xe_device_is_admin_only(xe))
+		return xe->drm.debugfs_root;
+	else
+		return minor->debugfs_root;
+}
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3462645ca13c..e6df3091659f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -971,15 +971,17 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = drm_dev_register(&xe->drm, 0);
-	if (err)
-		return err;
+	if (!xe_device_is_admin_only(xe)) {
+		err = drm_dev_register(&xe->drm, 0);
+		if (err)
+			return err;
 
-	xe_display_register(xe);
+		err = xe_oa_register(xe);
+		if (err)
+			goto err_drm_dev_unregister;
+	}
 
-	err = xe_oa_register(xe);
-	if (err)
-		goto err_unregister_display;
+	xe_display_register(xe);
 
 	err = xe_pmu_register(&xe->pmu);
 	if (err)
@@ -1014,6 +1016,7 @@ int xe_device_probe(struct xe_device *xe)
 
 err_unregister_display:
 	xe_display_unregister(xe);
+err_drm_dev_unregister:
 	drm_dev_unregister(&xe->drm);
 
 	return err;
@@ -1023,7 +1026,8 @@ void xe_device_remove(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
 
-	drm_dev_unplug(&xe->drm);
+	if (!xe_device_is_admin_only(xe))
+		drm_dev_unplug(&xe->drm);
 
 	xe_bo_pci_dev_remove_all(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_gsc_debugfs.c b/drivers/gpu/drm/xe/xe_gsc_debugfs.c
index d4977e666946..cbd057ce8571 100644
--- a/drivers/gpu/drm/xe/xe_gsc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gsc_debugfs.c
@@ -9,6 +9,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include "xe_debugfs_helpers.h"
 #include "xe_gt_types.h"
 #include "xe_gsc.h"
 #include "xe_pm.h"
@@ -48,7 +49,6 @@ static const struct drm_info_list debugfs_list[] = {
 
 void xe_gsc_debugfs_register(struct xe_gsc *gsc, struct dentry *parent)
 {
-	struct drm_minor *minor = gsc_to_xe(gsc)->drm.primary;
 	struct drm_info_list *local;
 	int i;
 
@@ -63,7 +63,7 @@ void xe_gsc_debugfs_register(struct xe_gsc *gsc, struct dentry *parent)
 	for (i = 0; i < ARRAY_SIZE(debugfs_list); ++i)
 		local[i].data = gsc;
 
-	drm_debugfs_create_files(local,
-				 ARRAY_SIZE(debugfs_list),
-				 parent, minor);
+	xe_debugfs_create_files(local,
+				ARRAY_SIZE(debugfs_list),
+				parent, gsc_to_xe(gsc));
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index f45306308cd6..24db5aef56a2 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -10,6 +10,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
+#include "xe_debugfs_helpers.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -339,11 +340,13 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct drm_minor *minor = gt_to_xe(gt)->drm.primary;
 	struct dentry *parent = gt->tile->debugfs;
+	struct dentry *xe_debugfs_root;
 	struct dentry *root;
 	char symlink[16];
 	char name[8];
 
-	xe_gt_assert(gt, minor->debugfs_root);
+	if (!xe_device_is_admin_only(xe))
+		xe_gt_assert(gt, minor->debugfs_root);
 
 	if (IS_ERR(parent))
 		return;
@@ -367,14 +370,14 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
 	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
 
-	drm_debugfs_create_files(vf_safe_debugfs_list,
-				 ARRAY_SIZE(vf_safe_debugfs_list),
-				 root, minor);
+	xe_debugfs_create_files(vf_safe_debugfs_list,
+				ARRAY_SIZE(vf_safe_debugfs_list),
+				root, xe);
 
 	if (!IS_SRIOV_VF(xe))
-		drm_debugfs_create_files(pf_only_debugfs_list,
-					 ARRAY_SIZE(pf_only_debugfs_list),
-					 root, minor);
+		xe_debugfs_create_files(pf_only_debugfs_list,
+					ARRAY_SIZE(pf_only_debugfs_list),
+					root, xe);
 
 	xe_uc_debugfs_register(&gt->uc, root);
 
@@ -388,5 +391,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	 * who may expect gt/ directory at the root level, not the tile level.
 	 */
 	snprintf(symlink, sizeof(symlink), "tile%u/%s", gt->tile->id, name);
-	debugfs_create_symlink(name, minor->debugfs_root, symlink);
+	xe_debugfs_root = xe_debugfs_root_dir(xe);
+	debugfs_create_symlink(name, xe_debugfs_root, symlink);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index ffa27f66bba7..a8892fd9cf4c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -8,7 +8,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
 
-#include "xe_debugfs.h"
+#include "xe_debugfs_helpers.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_debugfs.h"
@@ -806,7 +806,6 @@ static void pf_add_compat_attrs(struct xe_gt *gt, struct dentry *dent, unsigned
 static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int vfid)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	struct drm_minor *minor = xe->drm.primary;
 
 	if (vfid) {
 		pf_add_config_attrs(gt, dent, vfid);
@@ -826,7 +825,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 		pf_add_policy_attrs(gt, dent);
 		pf_add_sched_groups(gt, dent, PFID);
 
-		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
+		xe_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, xe);
 	}
 
 	/* for backward compatibility only */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
index 507718326e1f..5d6ee9728f68 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
@@ -7,11 +7,11 @@
 
 #include <drm/drm_debugfs.h>
 
+#include "xe_debugfs_helpers.h"
 #include "xe_gt_debugfs.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_sriov_vf_debugfs.h"
 #include "xe_gt_types.h"
-#include "xe_sriov.h"
 
 /*
  *      /sys/kernel/debug/dri/0/
@@ -52,7 +52,6 @@ static const struct drm_info_list vf_info[] = {
 void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	struct drm_minor *minor = xe->drm.primary;
 	struct dentry *vfdentry;
 
 	xe_assert(xe, IS_SRIOV_VF(xe));
@@ -68,7 +67,7 @@ void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 		return;
 	vfdentry->d_inode->i_private = gt;
 
-	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
+	xe_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, xe);
 
 	/*
 	 *      /sys/kernel/debug/dri/BDF/
diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 2f23119686d4..ddd3d209328a 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -8,6 +8,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
+#include "xe_debugfs_helpers.h"
 #include "xe_device_types.h"
 #include "xe_gt_types.h"
 #include "xe_guc.h"
@@ -129,20 +130,19 @@ static const struct drm_info_list pf_only_debugfs_list[] = {
 void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
 {
 	struct xe_device *xe =  guc_to_xe(guc);
-	struct drm_minor *minor = xe->drm.primary;
 
-	drm_debugfs_create_files(vf_safe_debugfs_list,
-				 ARRAY_SIZE(vf_safe_debugfs_list),
-				 parent, minor);
+	xe_debugfs_create_files(vf_safe_debugfs_list,
+				ARRAY_SIZE(vf_safe_debugfs_list),
+				parent, xe);
 
 	if (!IS_SRIOV_VF(xe)) {
-		drm_debugfs_create_files(pf_only_debugfs_list,
-					 ARRAY_SIZE(pf_only_debugfs_list),
-					 parent, minor);
+		xe_debugfs_create_files(pf_only_debugfs_list,
+					ARRAY_SIZE(pf_only_debugfs_list),
+					parent, xe);
 
 		if (!xe->info.skip_guc_pc)
-			drm_debugfs_create_files(slpc_debugfs_list,
-						 ARRAY_SIZE(slpc_debugfs_list),
-						 parent, minor);
+			xe_debugfs_create_files(slpc_debugfs_list,
+						ARRAY_SIZE(slpc_debugfs_list),
+						parent, xe);
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
index 80829967b3d7..59de78355eee 100644
--- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
@@ -9,6 +9,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include "xe_debugfs_helpers.h"
 #include "xe_gt_types.h"
 #include "xe_huc.h"
 #include "xe_pm.h"
@@ -48,7 +49,6 @@ static const struct drm_info_list debugfs_list[] = {
 
 void xe_huc_debugfs_register(struct xe_huc *huc, struct dentry *parent)
 {
-	struct drm_minor *minor = huc_to_xe(huc)->drm.primary;
 	struct drm_info_list *local;
 	int i;
 
@@ -63,7 +63,7 @@ void xe_huc_debugfs_register(struct xe_huc *huc, struct dentry *parent)
 	for (i = 0; i < ARRAY_SIZE(debugfs_list); ++i)
 		local[i].data = huc;
 
-	drm_debugfs_create_files(local,
-				 ARRAY_SIZE(debugfs_list),
-				 parent, minor);
+	xe_debugfs_create_files(local,
+				ARRAY_SIZE(debugfs_list),
+				parent, huc_to_xe(huc));
 }
diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.c b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
index d6e2e41bc88c..c807f992ed6a 100644
--- a/drivers/gpu/drm/xe/xe_pxp_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
@@ -11,6 +11,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include "xe_debugfs_helpers.h"
 #include "xe_device_types.h"
 #include "xe_pxp.h"
 #include "xe_pxp_types.h"
@@ -96,17 +97,22 @@ static const struct drm_info_list debugfs_list[] = {
 
 void xe_pxp_debugfs_register(struct xe_pxp *pxp)
 {
-	struct drm_minor *minor;
 	struct drm_info_list *local;
+	struct drm_minor *minor;
+	struct xe_device *xe;
 	struct dentry *root;
 	int i;
 
 	if (!xe_pxp_is_enabled(pxp))
 		return;
 
-	minor = pxp->xe->drm.primary;
-	if (!minor->debugfs_root)
-		return;
+	xe = pxp->xe;
+
+	if (!xe_device_is_admin_only(xe)) {
+		minor = xe->drm.primary;
+		if (!minor->debugfs_root)
+			return;
+	}
 
 #define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
 	local = drmm_kmalloc(&pxp->xe->drm, DEBUGFS_SIZE, GFP_KERNEL);
@@ -119,11 +125,12 @@ void xe_pxp_debugfs_register(struct xe_pxp *pxp)
 	for (i = 0; i < ARRAY_SIZE(debugfs_list); ++i)
 		local[i].data = pxp;
 
-	root = debugfs_create_dir("pxp", minor->debugfs_root);
+	root = xe_debugfs_root_dir(xe);
+	root = debugfs_create_dir("pxp", root);
 	if (IS_ERR(root))
 		return;
 
-	drm_debugfs_create_files(local,
-				 ARRAY_SIZE(debugfs_list),
-				 root, minor);
+	xe_debugfs_create_files(local,
+				ARRAY_SIZE(debugfs_list),
+				root, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 72e55543c30e..be426afa90b1 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -37,6 +37,14 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
 	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
 }
 
+static inline bool xe_device_is_admin_only(const struct xe_device *xe)
+{
+	if (xe_device_is_sriov_pf(xe) && xe->sriov.pf.admin_only)
+		return true;
+	else
+		return false;
+}
+
 #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
 #define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index 81b377830d6d..68afcd5a0dc4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -6,6 +6,7 @@
 #include <linux/debugfs.h>
 #include <drm/drm_debugfs.h>
 
+#include "xe_debugfs_helpers.h"
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_pm.h"
@@ -152,9 +153,7 @@ static const struct drm_info_list debugfs_list[] = {
 
 static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
 {
-	struct drm_minor *minor = xe->drm.primary;
-
-	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), pfdent, minor);
+	xe_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), pfdent, xe);
 }
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 29894bd081c0..61c8d199f18b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -6,6 +6,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
+#include "xe_debugfs_helpers.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
 #include "xe_sriov_printk.h"
@@ -281,6 +282,6 @@ static const struct drm_info_list debugfs_list[] = {
  */
 void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root)
 {
-	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list),
-				 root, xe->drm.primary);
+	xe_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list),
+				root, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c b/drivers/gpu/drm/xe/xe_tile_debugfs.c
index 5df2f461b7b7..79bd87c9fe67 100644
--- a/drivers/gpu/drm/xe/xe_tile_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
@@ -6,6 +6,7 @@
 #include <linux/debugfs.h>
 #include <drm/drm_debugfs.h>
 
+#include "xe_debugfs_helpers.h"
 #include "xe_ggtt.h"
 #include "xe_pm.h"
 #include "xe_sa.h"
@@ -123,8 +124,7 @@ static void tile_debugfs_create_vram_mm(struct xe_tile *tile)
 void xe_tile_debugfs_register(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct drm_minor *minor = xe->drm.primary;
-	struct dentry *root = minor->debugfs_root;
+	struct dentry *root = xe_debugfs_root_dir(xe);
 	char name[8];
 
 	snprintf(name, sizeof(name), "tile%u", tile->id);
@@ -139,9 +139,9 @@ void xe_tile_debugfs_register(struct xe_tile *tile)
 	 */
 	tile->debugfs->d_inode->i_private = tile;
 
-	drm_debugfs_create_files(vf_safe_debugfs_list,
-				 ARRAY_SIZE(vf_safe_debugfs_list),
-				 tile->debugfs, minor);
+	xe_debugfs_create_files(vf_safe_debugfs_list,
+				ARRAY_SIZE(vf_safe_debugfs_list),
+				tile->debugfs, xe);
 
 	tile_debugfs_create_vram_mm(tile);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
index 7f97db2f89bb..fd352be6840d 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
@@ -8,6 +8,7 @@
 
 #include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_debugfs_helpers.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_debugfs.h"
 #include "xe_pm.h"
@@ -183,20 +184,19 @@ static void pf_add_config_attrs(struct xe_tile *tile, struct dentry *dent, unsig
 static void pf_populate_tile(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
 {
 	struct xe_device *xe = tile->xe;
-	struct drm_minor *minor = xe->drm.primary;
 	struct xe_gt *gt;
 	unsigned int id;
 
 	pf_add_config_attrs(tile, dent, vfid);
 
 	if (!vfid) {
-		drm_debugfs_create_files(pf_ggtt_info,
-					 ARRAY_SIZE(pf_ggtt_info),
-					 dent, minor);
+		xe_debugfs_create_files(pf_ggtt_info,
+					ARRAY_SIZE(pf_ggtt_info),
+					dent, xe);
 		if (IS_DGFX(xe))
-			drm_debugfs_create_files(pf_vram_info,
-						 ARRAY_SIZE(pf_vram_info),
-						 dent, minor);
+			xe_debugfs_create_files(pf_vram_info,
+						ARRAY_SIZE(pf_vram_info),
+						dent, xe);
 	}
 
 	for_each_gt_on_tile(gt, tile, id)
-- 
2.43.0

