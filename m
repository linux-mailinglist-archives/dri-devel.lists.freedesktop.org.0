Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 218696C0069
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 10:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC1B10E17E;
	Sun, 19 Mar 2023 09:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7108E10E166
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 09:41:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB29360F5E;
 Sun, 19 Mar 2023 09:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BF5C4339B;
 Sun, 19 Mar 2023 09:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679218915;
 bh=ubnHstDO3ufdEedvkXwk/IOxP/76Yy/Q6tcHUazkw3U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gymrjLlPKKDyQskFD8M9kXDU6qfQHdVseU+0mQhS142j/WOL2kvXsh0OFP7GuG2wV
 0G3JeimFypyzFaOX9rA9aTkO9YI+66jEnpVjViZ+02Liy+bofoWI5DMWg7OP25CUWS
 knJXvAfnDgwC8yaun4cB1q7NNRiWstSBe5RU3Mztx1NI1CQilTJS5VJP6byehkoz33
 aXgTCnemoNEQMZKYsKJu/vpFBZ2eyUxQtEdk9gcc4vgZDol0LvtVUsYFvUA1uH9ROK
 vtQgp6RPBHmV5go0Vs+RnagR8eyUDLTgAKtH7xMWFQr0iAtU2sirbxInotJonxb3Re
 o6vSNlPJ1Z5Dg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] accel/habanalabs: expose rotator mask to userspace
Date: Sun, 19 Mar 2023 11:41:46 +0200
Message-Id: <20230319094148.680750-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230319094148.680750-1-ogabbay@kernel.org>
References: <20230319094148.680750-1-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

All engine masks are exposed to user, make sure user gets the
correct rotator enabled mask in gaudi2.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h       | 5 +++--
 drivers/accel/habanalabs/common/habanalabs_ioctl.c | 1 +
 drivers/accel/habanalabs/gaudi2/gaudi2.c           | 2 ++
 include/uapi/drm/habanalabs_accel.h                | 4 +++-
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 98e6d98cf868..c01677ed3c07 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -609,8 +609,8 @@ struct hl_hints_range {
  * @cb_pool_cb_cnt: number of CBs in the CB pool.
  * @cb_pool_cb_size: size of each CB in the CB pool.
  * @decoder_enabled_mask: which decoders are enabled.
- * @decoder_binning_mask: which decoders are binned, 0 means usable and 1
- *                        means binned (at most one binned decoder per dcore).
+ * @decoder_binning_mask: which decoders are binned, 0 means usable and 1 means binned.
+ * @rotator_enabled_mask: which rotators are enabled.
  * @edma_enabled_mask: which EDMAs are enabled.
  * @edma_binning_mask: which EDMAs are binned, 0 means usable and 1 means
  *                     binned (at most one binned DMA).
@@ -760,6 +760,7 @@ struct asic_fixed_properties {
 	u32				cb_pool_cb_size;
 	u32				decoder_enabled_mask;
 	u32				decoder_binning_mask;
+	u32				rotator_enabled_mask;
 	u32				edma_enabled_mask;
 	u32				edma_binning_mask;
 	u32				max_pending_cs;
diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 81e026066f96..203ee857810c 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -108,6 +108,7 @@ static int hw_ip_info(struct hl_device *hdev, struct hl_info_args *args)
 	hw_ip.server_type = prop->server_type;
 	hw_ip.security_enabled = prop->fw_security_enabled;
 	hw_ip.revision_id = hdev->pdev->revision;
+	hw_ip.rotator_enabled_mask = prop->rotator_enabled_mask;
 	hw_ip.engine_core_interrupt_reg_addr = prop->engine_core_interrupt_reg_addr;
 	hw_ip.reserved_dram_size = dram_kmd_size;
 
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 57c94f9a6042..9f6dbc020d27 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2315,6 +2315,8 @@ static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 
 	prop->hints_range_reservation = true;
 
+	prop->rotator_enabled_mask = BIT(NUM_OF_ROT) - 1;
+
 	if (hdev->pldm)
 		prop->mmu_pgt_size = 0x800000; /* 8MB */
 	else
diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index e43688d30e96..c139aab17c8a 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -886,6 +886,8 @@ enum hl_server_type {
  * @device_mem_alloc_default_page_size: default page size used in device memory allocation.
  * @revision_id: PCI revision ID of the ASIC.
  * @tpc_interrupt_id: interrupt id for TPC to use in order to raise events towards the host.
+ * @rotator_enabled_mask: Bit-mask that represents which rotators are enabled.
+ *                        Relevant for Gaudi3 and later.
  * @engine_core_interrupt_reg_addr: interrupt register address for engine core to use
  *                                  in order to raise events toward FW.
  * @reserved_dram_size: DRAM size reserved for driver and firmware.
@@ -926,7 +928,7 @@ struct hl_info_hw_ip_info {
 	__u8 reserved7;
 	__u8 revision_id;
 	__u16 tpc_interrupt_id;
-	__u32 reserved8;
+	__u32 rotator_enabled_mask;
 	__u32 reserved9;
 	__u64 engine_core_interrupt_reg_addr;
 	__u64 reserved_dram_size;
-- 
2.40.0

