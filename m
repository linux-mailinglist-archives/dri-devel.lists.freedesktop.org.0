Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109C98252AB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A0610E5CD;
	Fri,  5 Jan 2024 11:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A76410E5C2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704453748; x=1735989748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W4JbtoyJ00RGV9haQPtAb/CFyfVDaDlwM841u9IbhGo=;
 b=Y00Xg9u2nvrl/zxhq8D4z0Dx9+4IUarWo4OKppZU0nFYCnIl782VmQcr
 ihTPw7UubQcUHQaoR21O4wb6Lp6eYDBS3Cv9mqzjXgvsHUb2w1zf96vmK
 nwmjFyuzIEhoQ8mvi9TBXDquwtDDR1S1+h5NcPVjYyYycsFUAVEs+edxE
 E1anicmI9r0N0cPgIZwojo7GJ28lLDaN9tOfW7WZPcmwc9hmGJpk6lh8x
 jDyiSKAc7BYl+lfH4xGk2EePsLNcoZ3LhGQVRtyv1/wrJmJlR1PLe1O13
 13PBZduasFhyE5rNEDl7pjlh50W2xmBroIzxALQoeZ9eRYMiA5EeCSudj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4255401"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4255401"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756918718"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="756918718"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:26 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/10] accel/ivpu: Add debug prints for MMU map/unmap
 operations
Date: Fri,  5 Jan 2024 12:22:11 +0100
Message-ID: <20240105112218.351265-4-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, "Wachowski,
 Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wachowski, Karol" <karol.wachowski@intel.com>

It is common need to be able to  see IOVA/physical to VPU addresses
mappings. Especially when debugging different kind of memory related
issues. Lack of such logs forces user to modify and recompile KMD manually.

This commit adds those logs under MMU debug mask which can be turned on
dynamically with module param during KMD load.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h         | 1 +
 drivers/accel/ivpu/ivpu_mmu_context.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index ebc4b84f27b2..9b6e336626e3 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -56,6 +56,7 @@
 #define IVPU_DBG_JSM	 BIT(10)
 #define IVPU_DBG_KREF	 BIT(11)
 #define IVPU_DBG_RPM	 BIT(12)
+#define IVPU_DBG_MMU_MAP BIT(13)
 
 #define ivpu_err(vdev, fmt, ...) \
 	drm_err(&(vdev)->drm, "%s(): " fmt, __func__, ##__VA_ARGS__)
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 12a8c09d4547..fe6161299236 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -355,6 +355,9 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 		dma_addr_t dma_addr = sg_dma_address(sg) - sg->offset;
 		size_t size = sg_dma_len(sg) + sg->offset;
 
+		ivpu_dbg(vdev, MMU_MAP, "Map ctx: %u dma_addr: 0x%llx vpu_addr: 0x%llx size: %lu\n",
+			 ctx->id, dma_addr, vpu_addr, size);
+
 		ret = ivpu_mmu_context_map_pages(vdev, ctx, vpu_addr, dma_addr, size, prot);
 		if (ret) {
 			ivpu_err(vdev, "Failed to map context pages\n");
@@ -366,6 +369,7 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 
 	/* Ensure page table modifications are flushed from wc buffers to memory */
 	wmb();
+
 	mutex_unlock(&ctx->lock);
 
 	ret = ivpu_mmu_invalidate_tlb(vdev, ctx->id);
@@ -388,14 +392,19 @@ ivpu_mmu_context_unmap_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ct
 	mutex_lock(&ctx->lock);
 
 	for_each_sgtable_dma_sg(sgt, sg, i) {
+		dma_addr_t dma_addr = sg_dma_address(sg) - sg->offset;
 		size_t size = sg_dma_len(sg) + sg->offset;
 
+		ivpu_dbg(vdev, MMU_MAP, "Unmap ctx: %u dma_addr: 0x%llx vpu_addr: 0x%llx size: %lu\n",
+			 ctx->id, dma_addr, vpu_addr, size);
+
 		ivpu_mmu_context_unmap_pages(ctx, vpu_addr, size);
 		vpu_addr += size;
 	}
 
 	/* Ensure page table modifications are flushed from wc buffers to memory */
 	wmb();
+
 	mutex_unlock(&ctx->lock);
 
 	ret = ivpu_mmu_invalidate_tlb(vdev, ctx->id);
-- 
2.43.0

