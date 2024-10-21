Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E609A59E1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 07:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4AB10E405;
	Mon, 21 Oct 2024 05:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iu695Xly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252A910E0A1;
 Mon, 21 Oct 2024 05:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729489568; x=1761025568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WvVNhqh7Bwb6iLfqs+U77vNGCodYNky0QU/wAp4qxm4=;
 b=Iu695XlyLDqqz+4vafVbPVQM9Ib+dAVnx2SbJ+ibnD9icmIvV2MOwe+n
 J0cv+pe3yI4GHdmKhL6OJayQAn1ONi6HL+er4z8SdtyAbf68FipRuMJmv
 peOfA73wq3EwmXw5PSfPAx+2G1yJCZYo28qYxx5BQHE47Pva5A8+WumWy
 BbpbP/LgziAdVmrigQ5xwwDZTajK9aHIWyoLA4LBke03DS3/Y3ZGzsTCp
 EuwkzWEAL6PYme/kKBg3gjk3QOpA51VrdqzBm58eOIr1zkltXHTjZwBok
 WiCZvkQ51InXmYVB8pj9mB9ZjqvV2kSkroI1cCGvUZqOS1sv46aurpW7q Q==;
X-CSE-ConnectionGUID: Ffhx4qthTou9y57r8o+G5w==
X-CSE-MsgGUID: eYKGE5wYTJ2chcZCpxyY3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40345942"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40345942"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 22:46:07 -0700
X-CSE-ConnectionGUID: CP45vE/mTEWzbuu7lFCDCw==
X-CSE-MsgGUID: ixgAtctART+or2VjFpQD0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="110180214"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 22:46:05 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v2 3/5] drm/xe/pf: Add a helper function to get a VF's backing
 object in LMEM
Date: Sun, 20 Oct 2024 22:21:31 -0700
Message-ID: <20241021052236.1820329-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
References: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
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
- Make the helper return the LMEM object instead of the start address.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index a863e50b756e..8a5df3d76533 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1455,6 +1455,29 @@ u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid)
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
index b74ec38baa18..7779dc9f9c8d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -31,6 +31,7 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid, unsi
 int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 				       u32 num_dbs);
 
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
 u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size);
 int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
-- 
2.45.1

