Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0B4BD7D23
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D9810E55B;
	Tue, 14 Oct 2025 07:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vwzsc9nc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15F710E558;
 Tue, 14 Oct 2025 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760426039; x=1791962039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=564ThLf/UCzV5nHA0gyyvac/BSQi8sYIEH/FTx2//WU=;
 b=Vwzsc9ncnE4E9FoC50FGZgwyGECTSLpMyXmEGE1pGo9aTW9QzN6YcDhA
 F1Ia/V7ic58/34MclO1bKLKgGVundohpePMPockCRbMGHWgUt9pzxoGXJ
 Cp1Vx/WiQl20KN0axUIOVg7SW+5irlCZjm6egTp81gfpjKF4kIgT62ME6
 LjmQ2SnRr7FDJa1gIZ7i23tAr7DuYSbkPT25Lu6my3CqP/LYW4K92ybUj
 B0carZeSzi/FXWSpyWZ7lII407NkyQpaGxQzfbEZQRABF3Gfy9NgKiprO
 BBtad7NASkb8paLj1F67ZV4vzXFDcDzOlisuJeE1u/AaY1FW2Wm9Re/KD w==;
X-CSE-ConnectionGUID: AlwgbrfpSG6awSpS7lgFng==
X-CSE-MsgGUID: oLzvr+dvRqW9GyZPcsmJ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257141"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73257141"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:57 -0700
X-CSE-ConnectionGUID: VKBx21v8R2ySyBUJQz07OA==
X-CSE-MsgGUID: O+Cn5x74Qz6uPFhnvFLCtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181369869"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:58 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [RFC 6/8] drm/xe/pf: Add a helper function to get a VF's backing
 object in LMEM
Date: Tue, 14 Oct 2025 00:08:56 -0700
Message-ID: <20251014071243.811884-7-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014071243.811884-1-vivek.kasireddy@intel.com>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
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

