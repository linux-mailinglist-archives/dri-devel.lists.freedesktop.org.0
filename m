Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBCyAll1oGmtjwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:31:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00131AA6E1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C978210E9C8;
	Thu, 26 Feb 2026 16:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBgcuo3r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95EE10E9C8;
 Thu, 26 Feb 2026 16:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772123477; x=1803659477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mgnw1vhE/Xd8k9PSrNbg/xjLplNK+/sxH3NHFyBJqyE=;
 b=NBgcuo3rTiy8M/VCo8MCm9H6ABVY/qAEuANhGvt6OlsUoSGEb2xNrF6Q
 YljSgyGesG9wu69R3+ELzrWd6m/GDePCnQAh7oO5Oxn5nu3etwcm/ty+4
 Lej1cGMwXvKVNjd1flzp81tLnawc4LJJqyCCeTl7aQcFAbHnmt4nHsHR6
 I8whF99uXcvbNPyHSnhOJINu2P59B3T4aRV/epXiX6874BLXsVd2Ibfkz
 F/KRsyID9PMipwfnwCmbvZAOghrVj/uTWfygJnom1DuTldmvusBWPXRQJ
 lxx/LohQJT7oOsV8zQx7CC28aFz5uyMss49s1YW4PN6MHj2j7qRCuUh+a w==;
X-CSE-ConnectionGUID: US69K5iFRamjO0D3oj4clQ==
X-CSE-MsgGUID: aM96TPnJSKW2xfSaQkVc9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90598921"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="90598921"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:31:17 -0800
X-CSE-ConnectionGUID: xmuDLPdNRZe7l9QLFrwtRA==
X-CSE-MsgGUID: 8ohlYdQDRmika9Zlt+yK5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="215736066"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa006.jf.intel.com with ESMTP; 26 Feb 2026 08:31:14 -0800
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
Subject: [RFC v4 1/1] drm/xe/pf: Restrict device query responses in admin-only
 PF mode
Date: Thu, 26 Feb 2026 16:31:06 +0000
Message-ID: <20260226163104.3192618-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226163104.3192618-3-satyanarayana.k.v.p@intel.com>
References: <20260226163104.3192618-3-satyanarayana.k.v.p@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[satyanarayana.k.v.p@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email,driver.name:url];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: D00131AA6E1
X-Rspamd-Action: no action

When the PF is configured for admin‑only mode, it is restricted to
management functions and should not allow users to run workloads.
Suppress device capabilities to userspace in admin-only PF mode.

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
V3 -> V4:
- Suppressed device capabilities in admin-only PF mode. (Wajdeczko)

V2 -> V3:
- Introduced new helper function xe_debugfs_create_files() to create
debugfs entries based on admin_only_pf mode or normal mode.

V1 -> V2:
- Rebased to latest drm-tip.
- Update update_minor_dev() to debugfs_minor_dev().
---
 drivers/gpu/drm/xe/xe_device.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_query.c  | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_sriov.h  |  8 ++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3462645ca13c..7bf462eed917 100644
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
@@ -213,6 +214,11 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 };
 
+static const struct drm_ioctl_desc xe_pf_admin_only_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(XE_DEVICE_QUERY, xe_query_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+};
+
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct drm_file *file_priv = file->private_data;
@@ -442,6 +448,14 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	struct xe_device *xe;
 	int err;
 
+	if (xe_configfs_admin_only_pf(pdev)) {
+		driver.ioctls = xe_pf_admin_only_ioctls;
+		driver.num_ioctls = ARRAY_SIZE(xe_pf_admin_only_ioctls);
+	} else {
+		driver.ioctls = xe_ioctls;
+		driver.num_ioctls = ARRAY_SIZE(xe_ioctls);
+	}
+
 	xe_display_driver_set_hooks(&driver);
 
 	err = aperture_remove_conflicting_pci_devices(pdev, driver.name);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 34db266b723f..1416ab7be809 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -215,7 +215,10 @@ static int query_engines(struct xe_device *xe,
 			i++;
 		}
 
-	engines->num_engines = i;
+	if (xe_device_is_admin_only(xe))
+		engines->num_engines = 0;
+	else
+		engines->num_engines = i;
 
 	if (copy_to_user(query_ptr, engines, size)) {
 		kfree(engines);
@@ -297,6 +300,9 @@ static int query_mem_regions(struct xe_device *xe,
 		}
 	}
 
+	if (xe_device_is_admin_only(xe))
+		mem_regions->num_mem_regions = 0;
+
 	if (!copy_to_user(query_ptr, mem_regions, size))
 		ret = 0;
 	else
@@ -419,6 +425,9 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 		iter++;
 	}
 
+	if (xe_device_is_admin_only(xe))
+		gt_list->num_gt = 0;
+
 	if (copy_to_user(query_ptr, gt_list, size)) {
 		kfree(gt_list);
 		return -EFAULT;
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
 
-- 
2.43.0

