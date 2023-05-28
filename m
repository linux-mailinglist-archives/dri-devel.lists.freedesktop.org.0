Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054957138D1
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 11:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7024810E03C;
	Sun, 28 May 2023 09:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D1510E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 09:04:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E00A60C6B;
 Sun, 28 May 2023 09:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D77C433EF;
 Sun, 28 May 2023 09:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685264673;
 bh=Z3bvWhD/u01rpspMPxP7efintS3g2+tSoG8lJ+oMj7g=;
 h=From:To:Cc:Subject:Date:From;
 b=bXIz3dxPGo1uG+Od/KLa/jjni7SchtEc/kYsHpEv1CLsxxGtXeUmhcq/5N4PaQ7j3
 Ufr+H8NPYVjnoCTn7I3njxXPp4HET6pYOKmvz6Befpa0IhWs3NH+15VJknevw08OnM
 wnU3PO8LKLt93RbFBzROGVdP/YG2/RDKilTodIspMeQ3iLspe///PL+IyR7qJisUOv
 hVaMkVkfofxroyqaZ0VJ2tlZeR6jJWlksPvedIRhPpEh5OxUI3BJotTNNIWf7TVO7M
 NR7R5E32mMQzDL12f8IffRN3jtHqs3u6XCvw0iVN/2NhG8xDy3+n7GuLvDSXDfZL3n
 gZmSTkCWZ+xIw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] accel/habanalabs: unsecure TSB_CFG_MTRR regs
Date: Sun, 28 May 2023 12:04:26 +0300
Message-Id: <20230528090428.1948778-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
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

In order to utilize Engine Barrier padding, user must have access to
this register set.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
index fadb870ff4c0..2742b1f801eb 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
@@ -1534,6 +1534,10 @@ static const u32 gaudi2_pb_dcr0_tpc0_unsecured_regs[] = {
 	mmDCORE0_TPC0_CFG_QM_KERNEL_CONFIG,
 	mmDCORE0_TPC0_CFG_QM_KERNEL_ID,
 	mmDCORE0_TPC0_CFG_QM_POWER_LOOP,
+	mmDCORE0_TPC0_CFG_TSB_CFG_MTRR_2_0,
+	mmDCORE0_TPC0_CFG_TSB_CFG_MTRR_2_1,
+	mmDCORE0_TPC0_CFG_TSB_CFG_MTRR_2_2,
+	mmDCORE0_TPC0_CFG_TSB_CFG_MTRR_2_3,
 	mmDCORE0_TPC0_CFG_LUT_FUNC32_BASE2_ADDR_LO,
 	mmDCORE0_TPC0_CFG_LUT_FUNC32_BASE2_ADDR_HI,
 	mmDCORE0_TPC0_CFG_LUT_FUNC64_BASE2_ADDR_LO,
-- 
2.40.1

