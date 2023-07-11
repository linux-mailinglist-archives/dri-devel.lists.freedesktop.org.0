Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533F674EC64
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 13:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338F910E370;
	Tue, 11 Jul 2023 11:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E707510E371
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A48866142E;
 Tue, 11 Jul 2023 11:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D450C433C8;
 Tue, 11 Jul 2023 11:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689073952;
 bh=GbAVVXenpzEwyGaNST7Zo4SNR1X2b2Sx/2R8j6HsGtU=;
 h=From:To:Cc:Subject:Date:From;
 b=ZgSyAZxyaZ+Wg8DlhMfUWSBvl8vm667bsCaZ2g0dc5Fxq2idl+UoabzEgawIXaUF6
 atZzM5Bc+gU07w1IFg6hm6aRNK0n4BI9jJZJ64bRO5GmCPPzlioDb3CsWg1UXmrW3S
 qNV0W2gTkITqO2l19aqXkdnbJA+g40vWowuWCR/Nf26ibvJsYuc/4Qh0rjZB41yOM3
 enKbZzPZH+mylKkDgZMZSq85CDf0OqwFsqGP925scPAOgN1I03xas5Wh0Z1JfKUCse
 2COyHik7NuR+TF5fnH8smKGVOpW1YnB2NCAsybamTlRpDU5tmsH0D+F1tpiomXgN60
 pgYye4pVEQk5Q==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/12] accel/habanalabs/gaudi2: un-secure register for engine
 cores interrupt
Date: Tue, 11 Jul 2023 14:12:15 +0300
Message-Id: <20230711111226.163670-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

The F/W dynamically allocates one of the PSOC scratchpad registers for
the engine cores, so they can raise events towards the F/W.
To allow the engine cores to access this register, this register must be
non-secured.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../accel/habanalabs/gaudi2/gaudi2_security.c | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
index 2742b1f801eb..d08267e59303 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
@@ -2907,7 +2907,7 @@ static void gaudi2_init_lbw_range_registers_secure(struct hl_device *hdev)
 	 * - range 11: NIC11_CFG + *_DBG (not including TPC_DBG)
 	 *
 	 * If F/W security is not enabled:
-	 * - ranges 12,13: PSOC_CFG (excluding PSOC_TIMESTAMP)
+	 * - ranges 12,13: PSOC_CFG (excluding PSOC_TIMESTAMP, PSOC_EFUSE and PSOC_GLOBAL_CONF)
 	 */
 	u64 lbw_range_min_short[] = {
 		mmNIC0_TX_AXUSER_BASE,
@@ -2923,7 +2923,7 @@ static void gaudi2_init_lbw_range_registers_secure(struct hl_device *hdev)
 		mmNIC10_TX_AXUSER_BASE,
 		mmNIC11_TX_AXUSER_BASE,
 		mmPSOC_I2C_M0_BASE,
-		mmPSOC_EFUSE_BASE
+		mmPSOC_GPIO0_BASE
 	};
 	u64 lbw_range_max_short[] = {
 		mmNIC0_MAC_CH3_MAC_PCS_BASE + HL_BLOCK_SIZE,
@@ -3219,6 +3219,7 @@ static void gaudi2_init_range_registers(struct hl_device *hdev)
  */
 static int gaudi2_init_protection_bits(struct hl_device *hdev)
 {
+	u32 *user_regs_array = NULL, user_regs_array_size = 0, engine_core_intr_reg;
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 	u32 instance_offset;
 	int rc = 0;
@@ -3389,11 +3390,24 @@ static int gaudi2_init_protection_bits(struct hl_device *hdev)
 	/* PSOC.
 	 * Except for PSOC_GLOBAL_CONF, skip when security is enabled in F/W, because the blocks are
 	 * protected by privileged RR.
+	 * For PSOC_GLOBAL_CONF, need to un-secure the scratchpad register which is used for engine
+	 * cores to raise events towards F/W.
 	 */
+	engine_core_intr_reg = (u32) (hdev->asic_prop.engine_core_interrupt_reg_addr - CFG_BASE);
+	if (engine_core_intr_reg >= mmPSOC_GLOBAL_CONF_SCRATCHPAD_0 &&
+			engine_core_intr_reg <= mmPSOC_GLOBAL_CONF_SCRATCHPAD_31) {
+		user_regs_array = &engine_core_intr_reg;
+		user_regs_array_size = 1;
+	} else {
+		dev_err(hdev->dev,
+			"Engine cores register for interrupts (%#x) is not a PSOC scratchpad register\n",
+			engine_core_intr_reg);
+	}
+
 	rc |= hl_init_pb(hdev, HL_PB_SHARED, HL_PB_NA,
 			HL_PB_SINGLE_INSTANCE, HL_PB_NA,
 			gaudi2_pb_psoc_global_conf, ARRAY_SIZE(gaudi2_pb_psoc_global_conf),
-			NULL, HL_PB_NA);
+			user_regs_array, user_regs_array_size);
 
 	if (!hdev->asic_prop.fw_security_enabled)
 		rc |= hl_init_pb(hdev, HL_PB_SHARED, HL_PB_NA,
-- 
2.34.1

