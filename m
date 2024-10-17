Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00369A25CB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE7A10E85E;
	Thu, 17 Oct 2024 14:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQY7dmiJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869A610E85B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177121; x=1760713121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GFnMijU1p2X1ZonYZabB+tbN6pf+tMSTHWv2/c2U9Ss=;
 b=NQY7dmiJ+fYXkWGIm39wcuwTLZTwoNnJKWiJKLHEi3srbqV7afOCfSvX
 Ghobj/c+KjtJuBSnIkFMraTbfIXlLKj8dwaOLujCGBRY00K3EK0XFsfE6
 iqWDcufER6Qv7jGgdhzD5A0qMY7/V4kaD6Z4hiYuxYiVHeIH1Dtlpzpro
 Dcr+wZYgFtmQY/2Vtt2qq1+qFc5tSrfw+saZ4JCQoX6nYzMQ/PT2rBG6y
 R+OGDRKssDbLX5MZqD8R92qY+Y4ZII7zJ36xcgH3crsDF7v12ciDL1JIf
 dkDeOqEzvaJiXGtabSUCh4LBzuVWZEKm5lybVxzw8w4JuBNt2A4PcxMi9 g==;
X-CSE-ConnectionGUID: CIcO9Od9Tv+NFnpcSp4Izg==
X-CSE-MsgGUID: +eOfSPF8SDOtEJRnv4pmfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39790370"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39790370"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:40 -0700
X-CSE-ConnectionGUID: G18kORvIRTKoSfF3v47ClQ==
X-CSE-MsgGUID: 2O0DoNtVTJK7PQur21wB7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109374562"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:38 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 10/11] accel/ivpu: Increase DMA address range
Date: Thu, 17 Oct 2024 16:58:16 +0200
Message-ID: <20241017145817.121590-11-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
References: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Increase DMA address range to:
 * 128 GB on 37xx (due to MMU limitations)
 * 256 GB on other generations
Merge User and DMA ranges on 40xx and above as it is possible
to access whole 256 GBs from both FW and DMA.

Increase User range on 37xx from 255MB to 511MB
to allow loading very large models.

Do not set global_alias_pio_base/size on other generations than 37xx
as it's only used on 37xx anyway.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c          |  6 ++++--
 drivers/accel/ivpu/ivpu_hw.c          | 10 +++++-----
 drivers/accel/ivpu/ivpu_mmu_context.c |  4 ++--
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index d358cf0b0f972..6037ec0b30968 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -584,8 +584,10 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->ipc_payload_area_start = ipc_mem_rx->vpu_addr + ivpu_bo_size(ipc_mem_rx) / 2;
 	boot_params->ipc_payload_area_size = ivpu_bo_size(ipc_mem_rx) / 2;
 
-	boot_params->global_aliased_pio_base = vdev->hw->ranges.user.start;
-	boot_params->global_aliased_pio_size = ivpu_hw_range_size(&vdev->hw->ranges.user);
+	if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX) {
+		boot_params->global_aliased_pio_base = vdev->hw->ranges.user.start;
+		boot_params->global_aliased_pio_size = ivpu_hw_range_size(&vdev->hw->ranges.user);
+	}
 
 	/* Allow configuration for L2C_PAGE_TABLE with boot param value */
 	boot_params->autoconfig = 1;
diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 1c259d7178151..09ada8b500b99 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -114,14 +114,14 @@ static void memory_ranges_init(struct ivpu_device *vdev)
 {
 	if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX) {
 		ivpu_hw_range_init(&vdev->hw->ranges.global, 0x80000000, SZ_512M);
-		ivpu_hw_range_init(&vdev->hw->ranges.user,   0xc0000000, 255 * SZ_1M);
+		ivpu_hw_range_init(&vdev->hw->ranges.user,   0x88000000, 511 * SZ_1M);
 		ivpu_hw_range_init(&vdev->hw->ranges.shave, 0x180000000, SZ_2G);
-		ivpu_hw_range_init(&vdev->hw->ranges.dma,   0x200000000, SZ_8G);
+		ivpu_hw_range_init(&vdev->hw->ranges.dma,   0x200000000, SZ_128G);
 	} else {
 		ivpu_hw_range_init(&vdev->hw->ranges.global, 0x80000000, SZ_512M);
-		ivpu_hw_range_init(&vdev->hw->ranges.user,   0x80000000, SZ_256M);
-		ivpu_hw_range_init(&vdev->hw->ranges.shave,  0x80000000 + SZ_256M, SZ_2G - SZ_256M);
-		ivpu_hw_range_init(&vdev->hw->ranges.dma,   0x200000000, SZ_8G);
+		ivpu_hw_range_init(&vdev->hw->ranges.shave,  0x80000000, SZ_2G);
+		ivpu_hw_range_init(&vdev->hw->ranges.user,  0x100000000, SZ_256G);
+		vdev->hw->ranges.dma = vdev->hw->ranges.user;
 	}
 }
 
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 697b57071d546..891967a95bc3c 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -571,8 +571,8 @@ void ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ct
 		start = vdev->hw->ranges.global.start;
 		end = vdev->hw->ranges.shave.end;
 	} else {
-		start = vdev->hw->ranges.user.start;
-		end = vdev->hw->ranges.dma.end;
+		start = min_t(u64, vdev->hw->ranges.user.start, vdev->hw->ranges.shave.start);
+		end = max_t(u64, vdev->hw->ranges.user.end, vdev->hw->ranges.dma.end);
 	}
 
 	drm_mm_init(&ctx->mm, start, end - start);
-- 
2.45.1

