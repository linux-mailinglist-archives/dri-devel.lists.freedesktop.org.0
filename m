Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D777D99B054
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 05:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF0D10E2F5;
	Sat, 12 Oct 2024 03:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqCWAj++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFB210E12D;
 Sat, 12 Oct 2024 03:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728702576; x=1760238576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eDYn9CA15hgY4hqNjoe/pPWJsBfriIPOsrPKZd/YuUw=;
 b=BqCWAj++49exPjOzoZGUz02zghbKFDyGKFLyI9XwTVN5GaxvwzqHsTma
 ZbVSz8o3ZXUgwEmdEFzPsY0y6FUgOS5dmiqsqcTezimn/OP+/Q3JbPnXB
 kN/M+daW/uh42FfDJAV+id9WGDrTnkpPTLevNblXWciN13h4ikJ155UcG
 9o0M/YxqAidqOFfVQuT0cBhzORIrXxirW4sFNXMZV7oobD8yzdkCg+vVT
 mHTAdkuz+8wIzIwV67n+qhdWiRySu8niAPdXnrz4aDuwe/olAlzG3XOaW
 uo4kKEKaIv9yGwFInCGiw2Do2lEdxvDeyKBCtXAI8WiJs3r8UiaZg9vy+ A==;
X-CSE-ConnectionGUID: GTODDr05TG2xEjZj1o/CYA==
X-CSE-MsgGUID: n4aZ3/L1Qn2lOy3zMuct0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38687321"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="38687321"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 20:09:36 -0700
X-CSE-ConnectionGUID: H/e6jO5sTgyglego/Br+HQ==
X-CSE-MsgGUID: LEwcwPawScG+PfijhdjDyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="77278464"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 20:09:36 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v1 3/5] drm/xe/pf: Add a helper function to get a VF's
 starting address in LMEM
Date: Fri, 11 Oct 2024 19:40:25 -0700
Message-ID: <20241012024524.1377836-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
References: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
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
in LMEM the VF's allocated region starts. The function introduced
in this patch does just that by returning the DPA associated with
the BO that backs the VF's region in LMEM.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index a863e50b756e..b1da329244d0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1455,6 +1455,29 @@ u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid)
 	return size;
 }
 
+/**
+ * xe_gt_sriov_pf_config_get_lmem_addr - Get VF's LMEM starting addr.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function can only be called on PF.
+ *
+ * Return: VF's starting address in LMEM.
+ */
+dma_addr_t xe_gt_sriov_pf_config_get_lmem_addr(struct xe_gt *gt,
+					       unsigned int vfid)
+{
+	struct xe_gt_sriov_config *config;
+	dma_addr_t addr;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	config = pf_pick_vf_config(gt, vfid);
+	addr = xe_bo_addr(config->lmem_obj, 0, PAGE_SIZE);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return addr;
+}
+
 /**
  * xe_gt_sriov_pf_config_set_lmem - Provision VF with LMEM.
  * @gt: the &xe_gt (can't be media)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index b74ec38baa18..af9995f094a9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -31,6 +31,7 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid, unsi
 int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 				       u32 num_dbs);
 
+dma_addr_t xe_gt_sriov_pf_config_get_lmem_addr(struct xe_gt *gt, unsigned int vfid);
 u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size);
 int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
-- 
2.45.1

