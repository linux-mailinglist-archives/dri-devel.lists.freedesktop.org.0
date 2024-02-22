Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFD785FCB4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D04C10E97F;
	Thu, 22 Feb 2024 15:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tiBlVyOC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2404E10E97F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:41:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8E524618EA;
 Thu, 22 Feb 2024 15:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5700C43394;
 Thu, 22 Feb 2024 15:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708616495;
 bh=RuWY1cv8Dhz18Wxup/ZL/5dm4lWX9+YTDfCxalcnNUo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tiBlVyOCYtJPgJOPH/yQz3yHhsu5izAVu0rXFmi6w6IQTdn8PtsC8zim0x2V6KkLn
 gFG1gOFuwAKXl+Rp3793LnwLN268Tqmd38WhnUKQL0CrQN59BgC49LbtWhMxfYs87B
 TAYruJfJ/809V40bGe6y4NHi/Cf8AwxlYazgBLacAuyNQDdUjXyRF22XftDqeekqjV
 e02JE4zBp0nyDnjUCLKau6xDlPHsswTho8YevEGNB5ABJy/T7UO8Fib5hKNBMidEha
 SWDtS3AHAMQfcThlt1R1u6kw9JwECb30RwkQkRwT0EfAFBVTOR1yv3cOoKHKRX5kdU
 pmzIdAqmVsXiw==
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
Subject: [PATCH v2 02/12] soc: mediatek: cmdq: Add parameter shift_pa to
 cmdq_pkt_jump()
Date: Thu, 22 Feb 2024 15:41:10 +0000
Message-Id: <20240222154120.16959-3-chunkuang.hu@kernel.org>
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

In original design, cmdq_pkt_jump() call cmdq_get_shift_pa() every
time to get shift_pa. But the shift_pa is constant value for each
SoC, so client driver just need to call cmdq_get_shift_pa() once
and pass shift_pa to cmdq_pkt_jump() to prevent frequent function
call.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 5 ++---
 include/linux/soc/mediatek/mtk-cmdq.h  | 6 ++++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 0b2e5690dacf..3380e56dd69b 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -393,14 +393,13 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 }
 EXPORT_SYMBOL(cmdq_pkt_assign);
 
-int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
+int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 {
 	struct cmdq_instruction inst = {};
 
 	inst.op = CMDQ_CODE_JUMP;
 	inst.offset = CMDQ_JUMP_ABSOLUTE;
-	inst.value = addr >>
-		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
+	inst.value = addr >> shift_pa;
 	return cmdq_pkt_append_command(pkt, inst);
 }
 EXPORT_SYMBOL(cmdq_pkt_jump);
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 649955d2cf5c..72adfd867cd9 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -253,10 +253,12 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
  *		     a physical address which should contains more instruction.
  * @pkt:        the CMDQ packet
  * @addr:       physical address of target instruction buffer
+ * @shift_pa:	shift bits of physical address in CMDQ instruction. This value
+ *		is got by cmdq_get_shift_pa().
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
+int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
 
 /**
  * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
@@ -374,7 +376,7 @@ static inline int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
+static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 {
 	return -EINVAL;
 }
-- 
2.34.1

