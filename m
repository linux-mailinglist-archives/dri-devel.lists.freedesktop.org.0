Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8407B57160
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 09:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F5210E332;
	Mon, 15 Sep 2025 07:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWpMrRkk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2662910E2DE;
 Mon, 15 Sep 2025 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757921146; x=1789457146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=564ThLf/UCzV5nHA0gyyvac/BSQi8sYIEH/FTx2//WU=;
 b=GWpMrRkk5poEHim7oV0gndLCUd76M3qPzbgAu8bGxywV5TOTfjISV0A3
 okGASjZ2PlNXdWy7+8c6swuWils3oet+8rYiwqoAGDRb4VXf1gVCMtSaY
 NR7YgCNGTYIBh3K/op9IoR0H/RLr6qBFEuB8ywlJwQv/wGg4oBlPfHxXU
 So/3uEl7rQwUM+JEcnYRGpRbkNQ+pVt/lbo3g/Hv7k8/iKXhHZNuwqHGz
 aaBxoetxYmroOPqCZkmGN4aYMf5q45Y7Nj2IlevD+F7jV88c79OIpSAK5
 QJjQ3nhYvGV9disxpebmulwBxFcO1KjBy32BHvQnGCNkbf/lX43IjY0Jy w==;
X-CSE-ConnectionGUID: uDd9T8MGSN2wNXWqC6pwhA==
X-CSE-MsgGUID: L8aIz9n3RIG7OfqKFpkYSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="77619124"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="77619124"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:25:46 -0700
X-CSE-ConnectionGUID: bpEGNlXpR06jQXoq3idzzg==
X-CSE-MsgGUID: IQaoH7bMRGSDOAsPQC6WxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="211693873"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:25:46 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v4 3/5] drm/xe/pf: Add a helper function to get a VF's backing
 object in LMEM
Date: Mon, 15 Sep 2025 00:21:07 -0700
Message-ID: <20250915072428.1712837-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
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

To properly import a dmabuf that is associated with a VF (or that
originates in a Guest VM that includes a VF), we need to know where
in LMEM the VF's allocated regions exist. Therefore, introduce a
new helper to return the object that backs the VF's regions in LMEM.

v2:
- Make the helper return the LMEM object instead of the start address

v3:
- Move the declaration of the helper under other lmem helpers (Michal)

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6344b5205c08..1bfcd35cc8ef 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1535,6 +1535,29 @@ u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid)
 	return size;
 }
 
+/**
+ * xe_gt_sriov_pf_config_get_lmem_obj - Get VF's LMEM BO.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function can only be called on PF.
+ *
+ * Return: BO that is backing VF's quota in LMEM.
+ */
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt,
+						 unsigned int vfid)
+{
+	struct xe_gt_sriov_config *config;
+	struct xe_bo *lmem_obj;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	config = pf_pick_vf_config(gt, vfid);
+	lmem_obj = config->lmem_obj;
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return lmem_obj;
+}
+
 /**
  * xe_gt_sriov_pf_config_set_lmem - Provision VF with LMEM.
  * @gt: the &xe_gt (can't be media)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 513e6512a575..bbc5c238cbf6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -36,6 +36,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 					u64 size);
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
 
 u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
-- 
2.50.1

