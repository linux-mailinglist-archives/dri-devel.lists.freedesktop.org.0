Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2073369C792
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 10:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE5E10E636;
	Mon, 20 Feb 2023 09:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0237C10E631
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 09:19:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D5283CE0C54;
 Mon, 20 Feb 2023 09:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9D1C433EF;
 Mon, 20 Feb 2023 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676884788;
 bh=xJQ0AkjsnpYr6z64NCxdAH5jCoPRaizPR6h8LevQ8fg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iqGVua3x/DdpFAp4VvxzoHeXLPt18SiQkCoEhB1+Gx/8S6v5a0g+aLybPJdZHa8nV
 VnxIQf+9myoWa8laIy80y0Bo1z15K8yN0c6Rp2pUq+5RdFUJwdoSkfhbNO+8rc2dje
 RhQzhEN4qAyCpLG5QsN9gM8Xq9qWLGMe9aU3dJ+/dFd/ucFiK+4nEpzvN1na9ugOm+
 ybPO/rYx9nzuBLeOZvrXcipSlHPlxUtaILILUWzxZof97ysJwtPHxa+YWtS+lnhI8n
 H1+gL8louRATOBUgEDkIk9xPK92lA+NO27W4mvDnJ9tlehyhQHkoLWsheogdrFChWj
 nvRVCOUU+Uyhw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] habanalabs: change hw_fini to return int to indicate error
Date: Mon, 20 Feb 2023 11:19:38 +0200
Message-Id: <20230220091939.3467487-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220091939.3467487-1-ogabbay@kernel.org>
References: <20230220091939.3467487-1-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

We later use cpucp packet for soft reset which might fail
so we should be able propagate the failure case.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h | 2 +-
 drivers/accel/habanalabs/gaudi/gaudi.c       | 5 +++--
 drivers/accel/habanalabs/gaudi2/gaudi2.c     | 5 +++--
 drivers/accel/habanalabs/goya/goya.c         | 5 +++--
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index de4ff525cbcb..597c7f1037d1 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -1576,7 +1576,7 @@ struct hl_asic_funcs {
 	int (*sw_init)(struct hl_device *hdev);
 	int (*sw_fini)(struct hl_device *hdev);
 	int (*hw_init)(struct hl_device *hdev);
-	void (*hw_fini)(struct hl_device *hdev, bool hard_reset, bool fw_reset);
+	int (*hw_fini)(struct hl_device *hdev, bool hard_reset, bool fw_reset);
 	void (*halt_engines)(struct hl_device *hdev, bool hard_reset, bool fw_reset);
 	int (*suspend)(struct hl_device *hdev);
 	int (*resume)(struct hl_device *hdev);
diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index a276a2a4a46d..26287084a9e0 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -4069,7 +4069,7 @@ static int gaudi_hw_init(struct hl_device *hdev)
 	return rc;
 }
 
-static void gaudi_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset)
+static int gaudi_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset)
 {
 	struct cpu_dyn_regs *dyn_regs =
 			&hdev->fw_loader.dynamic_loader.comm_desc.cpu_dyn_regs;
@@ -4079,7 +4079,7 @@ static void gaudi_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset
 
 	if (!hard_reset) {
 		dev_err(hdev->dev, "GAUDI doesn't support soft-reset\n");
-		return;
+		return 0;
 	}
 
 	if (hdev->pldm) {
@@ -4216,6 +4216,7 @@ static void gaudi_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset
 
 		hdev->device_cpu_is_halted = false;
 	}
+	return 0;
 }
 
 static int gaudi_suspend(struct hl_device *hdev)
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 2f51a121909b..5a225f23961b 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -5885,7 +5885,7 @@ static void gaudi2_get_soft_rst_done_indication(struct hl_device *hdev, u32 poll
 				reg_val);
 }
 
-static void gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset)
+static int gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset)
 {
 	struct gaudi2_device *gaudi2 = hdev->asic_specific;
 	u32 poll_timeout_us, reset_sleep_ms;
@@ -5951,7 +5951,7 @@ static void gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_rese
 		gaudi2_get_soft_rst_done_indication(hdev, poll_timeout_us);
 
 	if (!gaudi2)
-		return;
+		return 0;
 
 	gaudi2->dec_hw_cap_initialized &= ~(HW_CAP_DEC_MASK);
 	gaudi2->tpc_hw_cap_initialized &= ~(HW_CAP_TPC_MASK);
@@ -5978,6 +5978,7 @@ static void gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_rese
 			HW_CAP_PDMA_MASK | HW_CAP_EDMA_MASK | HW_CAP_MME_MASK |
 			HW_CAP_ROT_MASK);
 	}
+	return 0;
 }
 
 static int gaudi2_suspend(struct hl_device *hdev)
diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
index c5a22a8e0957..7a45ab3ca43a 100644
--- a/drivers/accel/habanalabs/goya/goya.c
+++ b/drivers/accel/habanalabs/goya/goya.c
@@ -2783,7 +2783,7 @@ static int goya_hw_init(struct hl_device *hdev)
 	return rc;
 }
 
-static void goya_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset)
+static int goya_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset)
 {
 	struct goya_device *goya = hdev->asic_specific;
 	u32 reset_timeout_ms, cpu_timeout_ms, status;
@@ -2839,7 +2839,7 @@ static void goya_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset)
 						HW_CAP_GOLDEN | HW_CAP_TPC);
 		WREG32(mmGIC_DISTRIBUTOR__5_GICD_SETSPI_NSR,
 				GOYA_ASYNC_EVENT_ID_SOFT_RESET);
-		return;
+		return 0;
 	}
 
 	/* Chicken bit to re-initiate boot sequencer flow */
@@ -2858,6 +2858,7 @@ static void goya_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset)
 
 		memset(goya->events_stat, 0, sizeof(goya->events_stat));
 	}
+	return 0;
 }
 
 int goya_suspend(struct hl_device *hdev)
-- 
2.25.1

