Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAHoOfeIoWmVuAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:07:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C941B6EBC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DB410EB1E;
	Fri, 27 Feb 2026 12:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6Vd4kgm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA08C10EB1B;
 Fri, 27 Feb 2026 12:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772194035; x=1803730035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GKwpxupsEqZ+JmpRQfZpzPQwx5Te/JTxsWUhB85ZjO8=;
 b=D6Vd4kgmPkAy+97rjiYqLFY7QASCaw8N5DvdQixyWTY6AAf21exTp2ml
 8O89KoDR21x3E0ItwuNYRV0PlGft1EkuSteddvt54LTAIyR4jmzUd/1DN
 EvbI5AU7lXGfCWztqRJjNCLBf8WGmgdklXMy5cxslKGQMc0KG7tFtLkTX
 g4W/ckj+SQh9kNrolje1xsjFJPCopYVp9rcMJOMgZe9Hv4F3P3xnL/1lu
 MY+jYQKXMQ6w7WpviwCzcuKlLa/AE38MIxkk6E36eW1wG/RuVfRLlbWGj
 pv5LfE7Vjxg6bIHbX67D29nkzr5jeZfn529OJyn60qgS/1NCGHExpcV5S g==;
X-CSE-ConnectionGUID: ucnbrETpSXyEfELcmdnYwg==
X-CSE-MsgGUID: r42jQhy4R6+0gn0DwnLaDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83909656"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="83909656"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 04:07:14 -0800
X-CSE-ConnectionGUID: jODbLRutR+Gh0wxJ/HIREQ==
X-CSE-MsgGUID: sA8HvevjT+CpmLHqrpVOfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="254661486"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa001.jf.intel.com with ESMTP; 27 Feb 2026 04:07:11 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Dunajski Bartosz <bartosz.dunajski@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: [RFC v5 1/1] drm/xe/pf: Restrict device query responses in admin-only
 PF mode
Date: Fri, 27 Feb 2026 12:07:04 +0000
Message-ID: <20260227120702.3651913-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227120702.3651913-3-satyanarayana.k.v.p@intel.com>
References: <20260227120702.3651913-3-satyanarayana.k.v.p@intel.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,driver.name:url];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[satyanarayana.k.v.p@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 50C941B6EBC
X-Rspamd-Action: no action

When a PF is configured in admin-only mode, it is intended for management
only and must not expose workload-facing capabilities to userspace.

Limit the exposed ioctl set in admin-only PF mode to XE_DEVICE_QUERY, and
suppress capability-bearing query payloads so userspace cannot discover
execution-related device details in this mode.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Dunajski Bartosz <bartosz.dunajski@intel.com>
Cc: dri-devel@lists.freedesktop.org

---
V4 -> V5:
- Updated commit message (Matt B).
- Introduced new driver_admin_only_pf structure (Michal Wajdeczko).
- Updated all query configs (Michal Wajdeczko).
- Renamed xe_device_is_admin_only() to xe_device_is_admin_only_pf()
- Fixed other review comments (Michal Wajdeczko).

V3 -> V4:
- Suppressed device capabilities in admin-only PF mode. (Wajdeczko)

V2 -> V3:
- Introduced new helper function xe_debugfs_create_files() to create
debugfs entries based on admin_only_pf mode or normal mode.

V1 -> V2:
- Rebased to latest drm-tip.
- Update update_minor_dev() to debugfs_minor_dev().
---
 drivers/gpu/drm/xe/xe_device.c | 47 +++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_query.c  | 55 ++++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_sriov.h  | 11 +++++++
 3 files changed, 94 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3462645ca13c..76d534491e01 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -25,6 +25,7 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
+#include "xe_configfs.h"
 #include "xe_debugfs.h"
 #include "xe_defaults.h"
 #include "xe_devcoredump.h"
@@ -213,6 +214,10 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 };
 
+static const struct drm_ioctl_desc xe_ioctls_admin_only_pf[] = {
+	DRM_IOCTL_DEF_DRV(XE_DEVICE_QUERY, xe_query_ioctl, DRM_RENDER_ALLOW),
+};
+
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct drm_file *file_priv = file->private_data;
@@ -415,6 +420,29 @@ static struct drm_driver driver = {
 	.patchlevel = DRIVER_PATCHLEVEL,
 };
 
+static struct drm_driver driver_admin_only_pf  = {
+	.driver_features =
+	    DRIVER_GEM | DRIVER_GEM_GPUVA,
+	.open = xe_file_open,
+	.postclose = xe_file_close,
+
+	.gem_prime_import = xe_gem_prime_import,
+
+	.dumb_create = xe_bo_dumb_create,
+	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
+#ifdef CONFIG_PROC_FS
+	.show_fdinfo = xe_drm_client_fdinfo,
+#endif
+	.ioctls = xe_ioctls_admin_only_pf,
+	.num_ioctls = ARRAY_SIZE(xe_ioctls_admin_only_pf),
+	.fops = &xe_driver_fops,
+	.name = DRIVER_NAME,
+	.desc = DRIVER_DESC,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+};
+
 static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -439,16 +467,24 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
+	struct drm_driver *active_drm_driver = &driver;
 	struct xe_device *xe;
 	int err;
 
-	xe_display_driver_set_hooks(&driver);
+	/*
+	 * Since XE device is not initialized yet, read from configfs
+	 * directly to decide whether we are in admin-only PF mode or not.
+	 */
+	if (xe_configfs_admin_only_pf(pdev))
+		active_drm_driver = &driver_admin_only_pf;
+
+	xe_display_driver_set_hooks(active_drm_driver);
 
-	err = aperture_remove_conflicting_pci_devices(pdev, driver.name);
+	err = aperture_remove_conflicting_pci_devices(pdev, active_drm_driver->name);
 	if (err)
 		return ERR_PTR(err);
 
-	xe = devm_drm_dev_alloc(&pdev->dev, &driver, struct xe_device, drm);
+	xe = devm_drm_dev_alloc(&pdev->dev, active_drm_driver, struct xe_device, drm);
 	if (IS_ERR(xe))
 		return xe;
 
@@ -708,6 +744,11 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe_sriov_probe_early(xe);
 
+	if (xe_configfs_admin_only_pf(to_pci_dev(xe->drm.dev)) && !IS_SRIOV_PF(xe)) {
+		drm_err(&xe->drm, "Admin-only PF mode is enabled in non PF mode\n");
+		return -ENODEV;
+	}
+
 	if (IS_SRIOV_VF(xe))
 		vf_update_device_info(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 34db266b723f..f46e62797dd6 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -55,6 +55,9 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
 	u8 gt_id;
 	int i = 0;
 
+	if (xe_device_is_admin_only_pf(xe))
+		return 0;
+
 	for_each_gt(gt, xe, gt_id)
 		for_each_hw_engine(hwe, gt, id) {
 			if (xe_hw_engine_is_reserved(hwe))
@@ -126,7 +129,10 @@ query_engine_cycles(struct xe_device *xe,
 	if (IS_SRIOV_VF(xe))
 		return -EOPNOTSUPP;
 
-	if (query->size == 0) {
+	if (xe_device_is_admin_only_pf(xe))
+		size = 0;
+
+	if (query->size == 0 || !size) {
 		query->size = size;
 		return 0;
 	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
@@ -190,7 +196,7 @@ static int query_engines(struct xe_device *xe,
 	u8 gt_id;
 	int i = 0;
 
-	if (query->size == 0) {
+	if (query->size == 0 || !size) {
 		query->size = size;
 		return 0;
 	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
@@ -231,6 +237,9 @@ static size_t calc_mem_regions_size(struct xe_device *xe)
 	u32 num_managers = 1;
 	int i;
 
+	if (xe_device_is_admin_only_pf(xe))
+		return 0;
+
 	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i)
 		if (ttm_manager_type(&xe->ttm, i))
 			num_managers++;
@@ -248,7 +257,7 @@ static int query_mem_regions(struct xe_device *xe,
 	struct ttm_resource_manager *man;
 	int ret, i;
 
-	if (query->size == 0) {
+	if (query->size == 0 || !size) {
 		query->size = size;
 		return 0;
 	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
@@ -309,13 +318,13 @@ static int query_mem_regions(struct xe_device *xe,
 static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 {
 	const u32 num_params = DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
-	size_t size =
+	size_t size = xe_device_is_admin_only_pf(xe) ? 0 :
 		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
 	struct drm_xe_query_config __user *query_ptr =
 		u64_to_user_ptr(query->data);
 	struct drm_xe_query_config *config;
 
-	if (query->size == 0) {
+	if (query->size == 0 || !size) {
 		query->size = size;
 		return 0;
 	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
@@ -358,15 +367,15 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query)
 {
 	struct xe_gt *gt;
-	size_t size = sizeof(struct drm_xe_query_gt_list) +
-		xe->info.gt_count * sizeof(struct drm_xe_gt);
+	size_t size = xe_device_is_admin_only_pf(xe) ? 0 :
+		sizeof(struct drm_xe_query_gt_list) + xe->info.gt_count * sizeof(struct drm_xe_gt);
 	struct drm_xe_query_gt_list __user *query_ptr =
 		u64_to_user_ptr(query->data);
 	struct drm_xe_query_gt_list *gt_list;
 	int iter = 0;
 	u8 id;
 
-	if (query->size == 0) {
+	if (query->size == 0 || !size) {
 		query->size = size;
 		return 0;
 	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
@@ -436,7 +445,10 @@ static int query_hwconfig(struct xe_device *xe,
 	void __user *query_ptr = u64_to_user_ptr(query->data);
 	void *hwconfig;
 
-	if (query->size == 0) {
+	if (xe_device_is_admin_only_pf(xe))
+		size = 0;
+
+	if (query->size == 0 || !size) {
 		query->size = size;
 		return 0;
 	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
@@ -464,6 +476,9 @@ static size_t calc_topo_query_size(struct xe_device *xe)
 	size_t query_size = 0;
 	int id;
 
+	if (xe_device_is_admin_only_pf(xe))
+		return 0;
+
 	for_each_gt(gt, xe, id) {
 		query_size += 3 * sizeof(struct drm_xe_query_topology_mask) +
 			sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
@@ -505,7 +520,7 @@ static int query_gt_topology(struct xe_device *xe,
 	struct xe_gt *gt;
 	int id;
 
-	if (query->size == 0) {
+	if (query->size == 0 || !size) {
 		query->size = size;
 		return 0;
 	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
@@ -559,11 +574,12 @@ static int
 query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
 {
 	struct drm_xe_query_uc_fw_version __user *query_ptr = u64_to_user_ptr(query->data);
-	size_t size = sizeof(struct drm_xe_query_uc_fw_version);
+	size_t size = xe_device_is_admin_only_pf(xe) ? 0 :
+		sizeof(struct drm_xe_query_uc_fw_version);
 	struct drm_xe_query_uc_fw_version resp;
 	struct xe_uc_fw_version *version = NULL;
 
-	if (query->size == 0) {
+	if (query->size == 0 || !size) {
 		query->size = size;
 		return 0;
 	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
@@ -634,6 +650,9 @@ static size_t calc_oa_unit_query_size(struct xe_device *xe)
 	struct xe_gt *gt;
 	int i, id;
 
+	if (xe_device_is_admin_only_pf(xe))
+		return 0;
+
 	for_each_gt(gt, xe, id) {
 		for (i = 0; i < gt->oa.num_oa_units; i++) {
 			size += sizeof(struct drm_xe_oa_unit);
@@ -659,7 +678,7 @@ static int query_oa_units(struct xe_device *xe,
 	struct xe_gt *gt;
 	u8 *pdu;
 
-	if (query->size == 0) {
+	if (query->size == 0 || !size) {
 		query->size = size;
 		return 0;
 	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
@@ -711,11 +730,12 @@ static int query_oa_units(struct xe_device *xe,
 static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *query)
 {
 	struct drm_xe_query_pxp_status __user *query_ptr = u64_to_user_ptr(query->data);
-	size_t size = sizeof(struct drm_xe_query_pxp_status);
+	size_t size = xe_device_is_admin_only_pf(xe) ? 0 :
+		sizeof(struct drm_xe_query_pxp_status);
 	struct drm_xe_query_pxp_status resp = { 0 };
 	int ret;
 
-	if (query->size == 0) {
+	if (query->size == 0 || !size) {
 		query->size = size;
 		return 0;
 	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
@@ -751,7 +771,10 @@ static int query_eu_stall(struct xe_device *xe,
 	array_size = xe_eu_stall_get_sampling_rates(&num_rates, &rates);
 	size = sizeof(struct drm_xe_query_eu_stall) + array_size;
 
-	if (query->size == 0) {
+	if (xe_device_is_admin_only_pf(xe))
+		size = 0;
+
+	if (query->size == 0 || !size) {
 		query->size = size;
 		return 0;
 	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 72e55543c30e..ee84978350aa 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -37,6 +37,17 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
 	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
 }
 
+/**
+ * xe_device_is_admin_only_pf() - Check whether device is admin only PF or not.
+ * @xe: the &xe_device to check
+ *
+ * Return: true if the device is admin only PF, false otherwise.
+ */
+static inline bool xe_device_is_admin_only_pf(const struct xe_device *xe)
+{
+	return xe_device_is_sriov_pf(xe) && xe->sriov.pf.admin_only;
+}
+
 #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
 #define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
 
-- 
2.43.0

