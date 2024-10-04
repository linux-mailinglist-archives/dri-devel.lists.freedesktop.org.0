Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A949903CC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 15:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B41F10E9F8;
	Fri,  4 Oct 2024 13:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LgQl1/6N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C3310E9F8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728047969; x=1759583969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RqbTN4XPKChU35WzkAcQtNGfbSU4QiEDlFLPIIHtEf0=;
 b=LgQl1/6NYDLvRA7KHAk4CJZwpynS2ToA2rLQzRmFkNbfcRQY3jOqnq06
 wH/LqEElLTjT3rxtqRZ/liU0q/BGwtSzKHLbaGPEQrvTZNA83kYt5kU4G
 IGfB4GxAObkNOewiKg75LaoqCHM7MnSB3lwkYRyVtewrXKLIjKcm3tXj/
 vgez/qr81lMeTvNJR1XmsuV4YbuqrSvsqdCkngRnnIjz59A6OAVll+txo
 zg+naxi0+zZsI0RJcYmcxj2ZrEz9sUpdjefnIZQ0GjLT/sBxe74A0/rNg
 KkwZpvUsW7nFoB8Cw7IwkglbHrv6f3IFoJzUAeH9V+joLlmGvd9IfqISY Q==;
X-CSE-ConnectionGUID: OM5lChRwRxWMqe+via5v5A==
X-CSE-MsgGUID: 0+HA5C0QTnSZKWybylat0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27149269"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="27149269"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 06:19:28 -0700
X-CSE-ConnectionGUID: VRozbgKITZqYtV20TQ0CxA==
X-CSE-MsgGUID: 93C7G8mGRNaUKpSidxtM6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74694810"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 06:19:27 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 2/2] accel/ivpu: Update power island delays
Date: Fri,  4 Oct 2024 18:25:05 +0200
Message-Id: <20241004162505.1695605-3-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004162505.1695605-1-maciej.falkowski@linux.intel.com>
References: <20241004162505.1695605-1-maciej.falkowski@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Apply Hardware Architecture Specification compatible delays
for main island power delivery for 50xx and above.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h |  2 ++
 drivers/accel/ivpu/ivpu_hw_ip.c       | 49 +++++++++++++++++----------
 2 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_40xx_reg.h b/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
index d0b795b344c7..fc0ee8d637f9 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
+++ b/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
@@ -115,6 +115,8 @@
 
 #define VPU_50XX_HOST_SS_AON_PWR_ISLAND_EN_POST_DLY			0x00030068u
 #define VPU_50XX_HOST_SS_AON_PWR_ISLAND_EN_POST_DLY_POST_DLY_MASK	GENMASK(7, 0)
+#define VPU_50XX_HOST_SS_AON_PWR_ISLAND_EN_POST_DLY_POST1_DLY_MASK	GENMASK(15, 8)
+#define VPU_50XX_HOST_SS_AON_PWR_ISLAND_EN_POST_DLY_POST2_DLY_MASK	GENMASK(23, 16)
 
 #define VPU_50XX_HOST_SS_AON_PWR_ISLAND_STATUS_DLY			0x0003006cu
 #define VPU_50XX_HOST_SS_AON_PWR_ISLAND_STATUS_DLY_STATUS_DLY_MASK	GENMASK(7, 0)
diff --git a/drivers/accel/ivpu/ivpu_hw_ip.c b/drivers/accel/ivpu/ivpu_hw_ip.c
index dfd2f4a5b526..d3fa044d017b 100644
--- a/drivers/accel/ivpu/ivpu_hw_ip.c
+++ b/drivers/accel/ivpu/ivpu_hw_ip.c
@@ -8,15 +8,12 @@
 #include "ivpu_hw.h"
 #include "ivpu_hw_37xx_reg.h"
 #include "ivpu_hw_40xx_reg.h"
+#include "ivpu_hw_btrs.h"
 #include "ivpu_hw_ip.h"
 #include "ivpu_hw_reg_io.h"
 #include "ivpu_mmu.h"
 #include "ivpu_pm.h"
 
-#define PWR_ISLAND_EN_POST_DLY_FREQ_DEFAULT 0
-#define PWR_ISLAND_EN_POST_DLY_FREQ_HIGH    18
-#define PWR_ISLAND_STATUS_DLY_FREQ_DEFAULT  3
-#define PWR_ISLAND_STATUS_DLY_FREQ_HIGH	    46
 #define PWR_ISLAND_STATUS_TIMEOUT_US        (5 * USEC_PER_MSEC)
 
 #define TIM_SAFE_ENABLE		            0xf1d0dead
@@ -268,20 +265,15 @@ void ivpu_hw_ip_idle_gen_disable(struct ivpu_device *vdev)
 		idle_gen_drive_40xx(vdev, false);
 }
 
-static void pwr_island_delay_set_50xx(struct ivpu_device *vdev)
+static void
+pwr_island_delay_set_50xx(struct ivpu_device *vdev, u32 post, u32 post1, u32 post2, u32 status)
 {
-	u32 val, post, status;
-
-	if (vdev->hw->pll.profiling_freq == PLL_PROFILING_FREQ_DEFAULT) {
-		post = PWR_ISLAND_EN_POST_DLY_FREQ_DEFAULT;
-		status = PWR_ISLAND_STATUS_DLY_FREQ_DEFAULT;
-	} else {
-		post = PWR_ISLAND_EN_POST_DLY_FREQ_HIGH;
-		status = PWR_ISLAND_STATUS_DLY_FREQ_HIGH;
-	}
+	u32 val;
 
 	val = REGV_RD32(VPU_50XX_HOST_SS_AON_PWR_ISLAND_EN_POST_DLY);
 	val = REG_SET_FLD_NUM(VPU_50XX_HOST_SS_AON_PWR_ISLAND_EN_POST_DLY, POST_DLY, post, val);
+	val = REG_SET_FLD_NUM(VPU_50XX_HOST_SS_AON_PWR_ISLAND_EN_POST_DLY, POST1_DLY, post1, val);
+	val = REG_SET_FLD_NUM(VPU_50XX_HOST_SS_AON_PWR_ISLAND_EN_POST_DLY, POST2_DLY, post2, val);
 	REGV_WR32(VPU_50XX_HOST_SS_AON_PWR_ISLAND_EN_POST_DLY, val);
 
 	val = REGV_RD32(VPU_50XX_HOST_SS_AON_PWR_ISLAND_STATUS_DLY);
@@ -686,13 +678,36 @@ static void dpu_active_drive_37xx(struct ivpu_device *vdev, bool enable)
 	REGV_WR32(VPU_37XX_HOST_SS_AON_DPU_ACTIVE, val);
 }
 
+static void pwr_island_delay_set(struct ivpu_device *vdev)
+{
+	bool high = vdev->hw->pll.profiling_freq == PLL_PROFILING_FREQ_HIGH;
+	u32 post, post1, post2, status;
+
+	if (ivpu_hw_ip_gen(vdev) < IVPU_HW_IP_50XX)
+		return;
+
+	switch (ivpu_device_id(vdev)) {
+	case PCI_DEVICE_ID_PTL_P:
+		post = high ? 18 : 0;
+		post1 = 0;
+		post2 = 0;
+		status = high ? 46 : 3;
+		break;
+
+	default:
+		dump_stack();
+		ivpu_err(vdev, "Unknown device ID\n");
+		return;
+	}
+
+	pwr_island_delay_set_50xx(vdev, post, post1, post2, status);
+}
+
 int ivpu_hw_ip_pwr_domain_enable(struct ivpu_device *vdev)
 {
 	int ret;
 
-	if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_50XX)
-		pwr_island_delay_set_50xx(vdev);
-
+	pwr_island_delay_set(vdev);
 	pwr_island_enable(vdev);
 
 	ret = wait_for_pwr_island_status(vdev, 0x1);
-- 
2.34.1

