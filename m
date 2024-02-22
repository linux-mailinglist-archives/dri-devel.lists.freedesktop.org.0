Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E6E85FCBB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0152010E988;
	Thu, 22 Feb 2024 15:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OlgSv9Wa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A074710E983
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:41:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7FEC4CE282E;
 Thu, 22 Feb 2024 15:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D8EC43399;
 Thu, 22 Feb 2024 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708616498;
 bh=76oWXYBZv2prDrLhgaX7zuBp9oiheXSqhINTrAxFSR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OlgSv9Wa5S0L2u5ow7ycezogfX4uqzAYLRTpryMDSktjrYQUbEZyLX6IcEYb4enmF
 xXr3lMYIj5V/BPZy1PzXBoEWf3LePahwi67LfmVgs6HHwxrYlWXMxh425+yAReLR7j
 patZ/IuMbHYFz/Gf/axHJdGpRHHTdLgVdkTLFUqSfxLeWoUN9dHFtrxh5lVN6IU5cW
 mFiiZV3u+5LAOU1JSlmD83m7BxJwWr/rFm0z6JLXbC02PWWXgZ9GeZrr1jbVIQl1cG
 1WE35nA/eHBB6Bmv3yMoDrLh2oxjTek86CFPhmvSTu6JYyJVhmklSP/qGM+o3AsN2l
 lL1H7ZR5We9Uw==
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
Subject: [PATCH v2 03/12] soc: mediatek: cmdq: Rename cmdq_pkt_jump() to
 cmdq_pkt_jump_abs()
Date: Thu, 22 Feb 2024 15:41:11 +0000
Message-Id: <20240222154120.16959-4-chunkuang.hu@kernel.org>
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

In order to distinguish absolute jump and relative jump,
cmdq_pkt_jump() append absolute jump command, so rename it to
cmdq_pkt_jump_abs().

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c |  4 ++--
 include/linux/soc/mediatek/mtk-cmdq.h  | 13 +++++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 3380e56dd69b..38d9077725d2 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -393,7 +393,7 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 }
 EXPORT_SYMBOL(cmdq_pkt_assign);
 
-int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 {
 	struct cmdq_instruction inst = {};
 
@@ -402,7 +402,7 @@ int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 	inst.value = addr >> shift_pa;
 	return cmdq_pkt_append_command(pkt, inst);
 }
-EXPORT_SYMBOL(cmdq_pkt_jump);
+EXPORT_SYMBOL(cmdq_pkt_jump_abs);
 
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 72adfd867cd9..f9b8608cb5d9 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -248,17 +248,18 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
 
 /**
- * cmdq_pkt_jump() - Append jump command to the CMDQ packet, ask GCE
- *		     to execute an instruction that change current thread PC to
- *		     a physical address which should contains more instruction.
+ * cmdq_pkt_jump_abs() - Append jump command to the CMDQ packet, ask GCE
+ *			 to execute an instruction that change current thread
+ *			 PC to a absolute physical address which should
+ *			 contains more instruction.
  * @pkt:        the CMDQ packet
- * @addr:       physical address of target instruction buffer
+ * @addr:       absolute physical address of target instruction buffer
  * @shift_pa:	shift bits of physical address in CMDQ instruction. This value
  *		is got by cmdq_get_shift_pa().
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
+int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
 
 /**
  * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
@@ -376,7 +377,7 @@ static inline int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+static inline int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 {
 	return -EINVAL;
 }
-- 
2.34.1

