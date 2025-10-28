Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B427C133D0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 08:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE99810E593;
	Tue, 28 Oct 2025 07:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xg8nrJmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F35610E593
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 07:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761635221; x=1793171221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GfAwuRAyO8LoaqLJ6cWeAgsIw9H8QWrNQ5ruHO20Fk8=;
 b=Xg8nrJmivM3j3yBGwyQQewibCBst5ZCU5I6DEjc0XM5T0hSdldvZemX7
 WPW4FNqdwnr69BT1WPp+IJFmpFrXSCf4NlYhN9i2UPegYgS/26UAAFqXY
 0TnTiwrTWhOF+21p4A/SmXVB/TXJHsiC96XjidQc4pznI5nRydoG4qSn0
 eiskhI345uQZDiJq8hreFbcWVQdcXS6iFLwTiBIj9w9qm/rx5Z2WhTH5w
 rGiOrssuXksEdGFILaHohNylYM9RwzFQWIdTtIK5Zm2YBiJ+jJUea7MSe
 VKexfzdAAdJfP0hEiy34RNLY0yqxst5LD3OBjwyD9f5fC8J420xkcNjQ3 A==;
X-CSE-ConnectionGUID: z/9hjwXUTJuNcEON3MtLKA==
X-CSE-MsgGUID: BoXG86uKQRK7scyfQpm50A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74014468"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="74014468"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:06:52 -0700
X-CSE-ConnectionGUID: sHxJZR6zSA+sqrWU3uX3gg==
X-CSE-MsgGUID: f6f306+DTCmCSFQMDvRabA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="189322644"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:06:50 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Wait for CDYN de-assertion during power down
 sequence
Date: Tue, 28 Oct 2025 08:06:42 +0100
Message-ID: <20251028070642.135166-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

During power down, pending DVFS operations may still be in progress
when the NPU reset is asserted after CDYN=0 is set. Since the READY
bit may already be deasserted at this point, checking only the READY
bit is insufficient to ensure all transactions have completed.

Add an explicit check for CDYN de-assertion after the READY bit check
to guarantee no outstanding transactions remain before proceeding.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_btrs.c         | 16 ++++++++++++++++
 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
index aa33f562d29c..2662ef364c22 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.c
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
@@ -321,6 +321,14 @@ static int wait_for_pll_lock(struct ivpu_device *vdev, bool enable)
 	return REGB_POLL_FLD(VPU_HW_BTRS_MTL_PLL_STATUS, LOCK, exp_val, PLL_TIMEOUT_US);
 }
 
+static int wait_for_cdyn_deassert(struct ivpu_device *vdev)
+{
+	if (ivpu_hw_btrs_gen(vdev) == IVPU_HW_BTRS_MTL)
+		return 0;
+
+	return REGB_POLL_FLD(VPU_HW_BTRS_LNL_CDYN, CDYN, 0, PLL_TIMEOUT_US);
+}
+
 int ivpu_hw_btrs_wp_drive(struct ivpu_device *vdev, bool enable)
 {
 	struct wp_request wp;
@@ -354,6 +362,14 @@ int ivpu_hw_btrs_wp_drive(struct ivpu_device *vdev, bool enable)
 		return ret;
 	}
 
+	if (!enable) {
+		ret = wait_for_cdyn_deassert(vdev);
+		if (ret) {
+			ivpu_err(vdev, "Timed out waiting for CDYN deassert\n");
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h b/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
index fff2ef2cada6..a81a9ba540fa 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
+++ b/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
@@ -74,6 +74,9 @@
 #define VPU_HW_BTRS_LNL_PLL_FREQ				0x00000148u
 #define VPU_HW_BTRS_LNL_PLL_FREQ_RATIO_MASK			GENMASK(15, 0)
 
+#define VPU_HW_BTRS_LNL_CDYN					0x0000014cu
+#define VPU_HW_BTRS_LNL_CDYN_CDYN_MASK				GENMASK(15, 0)
+
 #define VPU_HW_BTRS_LNL_TILE_FUSE				0x00000150u
 #define VPU_HW_BTRS_LNL_TILE_FUSE_VALID_MASK			BIT_MASK(0)
 #define VPU_HW_BTRS_LNL_TILE_FUSE_CONFIG_MASK			GENMASK(6, 1)
-- 
2.43.0

