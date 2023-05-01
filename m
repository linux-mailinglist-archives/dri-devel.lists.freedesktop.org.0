Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963146F2FF5
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 11:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0DB10E317;
	Mon,  1 May 2023 09:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A77910E317
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 09:48:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5F0260C12;
 Mon,  1 May 2023 09:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557FFC433EF;
 Mon,  1 May 2023 09:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682934486;
 bh=v9WI2lR65DIK5tBKAXgoWcIG3gqL4iEel8mPIC4USB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OOejkdc2SYVFmdMU1kScnqYHKFNFSSzvj4JQW0iaTp11ecqd8btwxK2gUu1HsZqbf
 s4W0hpXq79ZFc0r84LbmdQgQa1Z50lsUAADe4Eu28WIZTroXgHyK2oUSpBpFFI1aaB
 qvkvy4gtfLnPjDYsi6fvOROnGiaLNMaqR2FcMuXjdDcL6plOiTS6Z50Ercv51gedh9
 HR7CRu/vvc2eql6jnOlQz9SIGXOaO7yfbEROR7+LtuLOLHWK5uj56Z+5ZFMATslomr
 pUAlWtGssrPN1+mgcuTaYEfWdBh2kDMpvH8VIJ7m6qyQc07KeIzvLEqm/YHbyLqAls
 7Utl3pClE/mww==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] accel/habanalabs: fix a static warning - 'dubious: x & !y'
Date: Mon,  1 May 2023 12:47:53 +0300
Message-Id: <20230501094754.100030-5-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501094754.100030-1-ogabbay@kernel.org>
References: <20230501094754.100030-1-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

Use a straight forward approach to get a conditional result.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 058741698d71..240fecfab608 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -4527,7 +4527,7 @@ static int gaudi2_set_tpc_engine_mode(struct hl_device *hdev, u32 engine_id, u32
 	reg_base = gaudi2_tpc_cfg_blocks_bases[tpc_id];
 	reg_addr = reg_base + TPC_CFG_STALL_OFFSET;
 	reg_val = FIELD_PREP(DCORE0_TPC0_CFG_TPC_STALL_V_MASK,
-			!!(engine_command == HL_ENGINE_STALL));
+			(engine_command == HL_ENGINE_STALL) ? 1 : 0);
 	WREG32(reg_addr, reg_val);
 
 	if (engine_command == HL_ENGINE_RESUME) {
@@ -4551,7 +4551,7 @@ static int gaudi2_set_mme_engine_mode(struct hl_device *hdev, u32 engine_id, u32
 	reg_base = gaudi2_mme_ctrl_lo_blocks_bases[mme_id];
 	reg_addr = reg_base + MME_CTRL_LO_QM_STALL_OFFSET;
 	reg_val = FIELD_PREP(DCORE0_MME_CTRL_LO_QM_STALL_V_MASK,
-			!!(engine_command == HL_ENGINE_STALL));
+			(engine_command == HL_ENGINE_STALL) ? 1 : 0);
 	WREG32(reg_addr, reg_val);
 
 	return 0;
@@ -4572,7 +4572,7 @@ static int gaudi2_set_edma_engine_mode(struct hl_device *hdev, u32 engine_id, u3
 	reg_base = gaudi2_dma_core_blocks_bases[edma_id];
 	reg_addr = reg_base + EDMA_CORE_CFG_STALL_OFFSET;
 	reg_val = FIELD_PREP(DCORE0_EDMA0_CORE_CFG_1_HALT_MASK,
-			!!(engine_command == HL_ENGINE_STALL));
+			(engine_command == HL_ENGINE_STALL) ? 1 : 0);
 	WREG32(reg_addr, reg_val);
 
 	if (engine_command == HL_ENGINE_STALL) {
-- 
2.40.1

