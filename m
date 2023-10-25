Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485E87D672E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7844410E627;
	Wed, 25 Oct 2023 09:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A179810E62D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698227056; x=1729763056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r4d9yuHiK49ifKbE2SJ4mN6Ro4bLqqFlp62ocCIUsIg=;
 b=NeCiU7O18uhDIEvPIqYcuyjc5ThyJ/1sL8oW4wJrh7DPQlH3QYNSTJHA
 kxHcyhej2NbVdcXvYrKgWGhPMnEmSC1ExqDO3H0DFt1YjaG1AP4V0nfJG
 QiX4Ly/np5oUxjK7T7N3MCPLFWjjSJDRML4J5ldC3+8byq+lQMY4PKIiY
 NBOL6axcarYT4sCm69hJVbDgAHkyVs3Asj+zbVpnwUIxJpcvz1L1GCl3k
 hOPZuT9IKLwjeediaQg5ND7psdZ7HLS8mna35wBuoPuA0B+F3cT6W0LSI
 WH1hCiydKgQL0be/owrUkmYMQJOYNmcCWYrhgl7sz9l7klIoh4EIy4u/d Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="390127478"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="390127478"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="752280254"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="752280254"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:44:13 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/11] accel/ivpu: Wait for VPU to enter idle state after D0i3
 entry message
Date: Wed, 25 Oct 2023 11:43:23 +0200
Message-Id: <20231025094323.989987-12-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>

The VPU needs non zero time to enter IDLE state after responding to
D0i3 entry message. If the driver does not wait for the VPU to enter
IDLE state it could cause warm boot failures.

Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw.h      |  6 ++++++
 drivers/accel/ivpu/ivpu_hw_37xx.c |  8 +++++++-
 drivers/accel/ivpu/ivpu_hw_40xx.c |  7 +++++++
 drivers/accel/ivpu/ivpu_jsm_msg.c | 12 +++++++++---
 4 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
index bb4368168247..329721f8f010 100644
--- a/drivers/accel/ivpu/ivpu_hw.h
+++ b/drivers/accel/ivpu/ivpu_hw.h
@@ -15,6 +15,7 @@ struct ivpu_hw_ops {
 	int (*power_down)(struct ivpu_device *vdev);
 	int (*reset)(struct ivpu_device *vdev);
 	bool (*is_idle)(struct ivpu_device *vdev);
+	int (*wait_for_idle)(struct ivpu_device *vdev);
 	void (*wdt_disable)(struct ivpu_device *vdev);
 	void (*diagnose_failure)(struct ivpu_device *vdev);
 	u32 (*reg_pll_freq_get)(struct ivpu_device *vdev);
@@ -87,6 +88,11 @@ static inline bool ivpu_hw_is_idle(struct ivpu_device *vdev)
 	return vdev->hw->ops->is_idle(vdev);
 };
 
+static inline int ivpu_hw_wait_for_idle(struct ivpu_device *vdev)
+{
+	return vdev->hw->ops->wait_for_idle(vdev);
+};
+
 static inline int ivpu_hw_power_down(struct ivpu_device *vdev)
 {
 	ivpu_dbg(vdev, PM, "HW power down\n");
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index edf4776acf29..9b04dcc90de1 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -37,7 +37,7 @@
 #define TIMEOUT_US		     (150 * USEC_PER_MSEC)
 #define PWR_ISLAND_STATUS_TIMEOUT_US (5 * USEC_PER_MSEC)
 #define PLL_TIMEOUT_US		     (1500 * USEC_PER_MSEC)
-#define IDLE_TIMEOUT_US		     (500 * USEC_PER_MSEC)
+#define IDLE_TIMEOUT_US		     (5 * USEC_PER_MSEC)
 
 #define ICB_0_IRQ_MASK ((REG_FLD(VPU_37XX_HOST_SS_ICB_STATUS_0, HOST_IPC_FIFO_INT)) | \
 			(REG_FLD(VPU_37XX_HOST_SS_ICB_STATUS_0, MMU_IRQ_0_INT)) | \
@@ -732,6 +732,11 @@ static bool ivpu_hw_37xx_is_idle(struct ivpu_device *vdev)
 	       REG_TEST_FLD(VPU_37XX_BUTTRESS_VPU_STATUS, IDLE, val);
 }
 
+static int ivpu_hw_37xx_wait_for_idle(struct ivpu_device *vdev)
+{
+	return REGB_POLL_FLD(VPU_37XX_BUTTRESS_VPU_STATUS, IDLE, 0x1, IDLE_TIMEOUT_US);
+}
+
 static void ivpu_hw_37xx_save_d0i3_entry_timestamp(struct ivpu_device *vdev)
 {
 	vdev->hw->d0i3_entry_host_ts = ktime_get_boottime();
@@ -1018,6 +1023,7 @@ const struct ivpu_hw_ops ivpu_hw_37xx_ops = {
 	.info_init = ivpu_hw_37xx_info_init,
 	.power_up = ivpu_hw_37xx_power_up,
 	.is_idle = ivpu_hw_37xx_is_idle,
+	.wait_for_idle = ivpu_hw_37xx_wait_for_idle,
 	.power_down = ivpu_hw_37xx_power_down,
 	.reset = ivpu_hw_37xx_reset,
 	.boot_fw = ivpu_hw_37xx_boot_fw,
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 971d8d4ecba1..fb28e83a29a3 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -39,6 +39,7 @@
 #define TIMEOUT_US		     (150 * USEC_PER_MSEC)
 #define PWR_ISLAND_STATUS_TIMEOUT_US (5 * USEC_PER_MSEC)
 #define PLL_TIMEOUT_US		     (1500 * USEC_PER_MSEC)
+#define IDLE_TIMEOUT_US		     (5 * USEC_PER_MSEC)
 
 #define WEIGHTS_DEFAULT              0xf711f711u
 #define WEIGHTS_ATS_DEFAULT          0x0000f711u
@@ -912,6 +913,11 @@ static bool ivpu_hw_40xx_is_idle(struct ivpu_device *vdev)
 	       REG_TEST_FLD(VPU_40XX_BUTTRESS_VPU_STATUS, IDLE, val);
 }
 
+static int ivpu_hw_40xx_wait_for_idle(struct ivpu_device *vdev)
+{
+	return REGB_POLL_FLD(VPU_40XX_BUTTRESS_VPU_STATUS, IDLE, 0x1, IDLE_TIMEOUT_US);
+}
+
 static void ivpu_hw_40xx_save_d0i3_entry_timestamp(struct ivpu_device *vdev)
 {
 	vdev->hw->d0i3_entry_host_ts = ktime_get_boottime();
@@ -1207,6 +1213,7 @@ const struct ivpu_hw_ops ivpu_hw_40xx_ops = {
 	.info_init = ivpu_hw_40xx_info_init,
 	.power_up = ivpu_hw_40xx_power_up,
 	.is_idle = ivpu_hw_40xx_is_idle,
+	.wait_for_idle = ivpu_hw_40xx_wait_for_idle,
 	.power_down = ivpu_hw_40xx_power_down,
 	.reset = ivpu_hw_40xx_reset,
 	.boot_fw = ivpu_hw_40xx_boot_fw,
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
index 03cf6b35d73a..8cea0dd731b9 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.c
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
@@ -4,6 +4,7 @@
  */
 
 #include "ivpu_drv.h"
+#include "ivpu_hw.h"
 #include "ivpu_ipc.h"
 #include "ivpu_jsm_msg.h"
 
@@ -265,13 +266,18 @@ int ivpu_jsm_pwr_d0i3_enter(struct ivpu_device *vdev)
 {
 	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_PWR_D0I3_ENTER };
 	struct vpu_jsm_msg resp;
+	int ret;
 
 	if (IVPU_WA(disable_d0i3_msg))
 		return 0;
 
 	req.payload.pwr_d0i3_enter.send_response = 1;
 
-	return ivpu_ipc_send_receive_active(vdev, &req, VPU_JSM_MSG_PWR_D0I3_ENTER_DONE,
-					    &resp, VPU_IPC_CHAN_GEN_CMD,
-					    vdev->timeout.d0i3_entry_msg);
+	ret = ivpu_ipc_send_receive_active(vdev, &req, VPU_JSM_MSG_PWR_D0I3_ENTER_DONE,
+					   &resp, VPU_IPC_CHAN_GEN_CMD,
+					   vdev->timeout.d0i3_entry_msg);
+	if (ret)
+		return ret;
+
+	return ivpu_hw_wait_for_idle(vdev);
 }
-- 
2.25.1

