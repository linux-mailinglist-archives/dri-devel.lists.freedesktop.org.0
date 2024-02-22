Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8570D85FCB9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9D510E984;
	Thu, 22 Feb 2024 15:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jZVVBKw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A428310E984
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:41:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8DC0CCE2808;
 Thu, 22 Feb 2024 15:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964D0C43390;
 Thu, 22 Feb 2024 15:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708616501;
 bh=rK1krWLb7shm5l17Ae3PYsFAPIxWE0/hDUOnRbU8Hms=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jZVVBKw2J1qlidIBDZKh0L7B2jAWgRX+55M0yA4RfXh4LLvWlCqc5FBcwKdjKNO8g
 tYR5GfRnfvTuGqV4g03wJmYteJn09cG8IkNyGyawEMGf3EeLapDhpNp4lrik9xS3eH
 5tpzH2woRsubrZ7fHY9HR+o4wamHPJXB3VIFDeHSd12N54XTsrmvh/5AymtyhwKWUe
 mEs7qqZmxk1jDQWIwhCw6wvCTYZzzxjho5a83m3uLpfpkhXDQZv6bzy+9Jc/GscTOF
 f+mvwe6MbfC614OuDsa4+eAKBZnwM5fTP0opxQaj/vu9bAFFu7+HT0v2+2bJ9jq748
 GXS1chuI2eyIQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 04/12] soc: mediatek: cmdq: Add cmdq_pkt_jump_rel() helper
 function
Date: Thu, 22 Feb 2024 15:41:12 +0000
Message-Id: <20240222154120.16959-5-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222154120.16959-1-chunkuang.hu@kernel.org>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
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

cmdq_pkt_jump_rel() append relative jump command to the packet.
Relative jump change PC to the target address with offset from
current PC.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 10 ++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 19 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 38d9077725d2..678db09983d4 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -404,6 +404,16 @@ int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 }
 EXPORT_SYMBOL(cmdq_pkt_jump_abs);
 
+int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
+{
+	struct cmdq_instruction inst = { {0} };
+
+	inst.op = CMDQ_CODE_JUMP;
+	inst.value = (u32)offset >> shift_pa;
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_jump_rel);
+
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
 	struct cmdq_instruction inst = { {0} };
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index f9b8608cb5d9..a935cd69d80f 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -261,6 +261,20 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
  */
 int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
 
+/**
+ * cmdq_pkt_jump_rel() - Append jump command to the CMDQ packet, ask GCE
+ *			 to execute an instruction that change current thread
+ *			 PC to a physical address with relative offset. The
+ *			 target address should contains more instruction.
+ * @pkt:	the CMDQ packet
+ * @offset:	relative offset of target instruction buffer from current PC.
+ * @shift_pa:	shift bits of physical address in CMDQ instruction. This value
+ *		is got by cmdq_get_shift_pa().
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
+
 /**
  * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
  * @pkt:	the CMDQ packet
@@ -382,6 +396,11 @@ static inline int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 sh
 	return -EINVAL;
 }
 
+static inline int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
+{
+	return -EINVAL;
+}
+
 static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
 	return -EINVAL;
-- 
2.34.1

