Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A1796771B
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 16:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16CC10E1A8;
	Sun,  1 Sep 2024 14:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i6MkhTrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BFB10E1A8
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 14:33:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD5BD5C56AD;
 Sun,  1 Sep 2024 14:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56570C4CEC8;
 Sun,  1 Sep 2024 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725201195;
 bh=ROGEn5ECVelo0EfWlJ1OSMy/l5R+qmtaTbsKv+Infh4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i6MkhTrFq716cdv+8qD66wvIL1A8tVM3FVlgHNjG3zO3nFUrcjfTC7JZLpInpP/Q3
 0NiMeypm1Lnf0c5Y6eNvbTEpbBlVdc1ff6hslU0NsODASxmRd2Z0rXCT2SMuzebont
 FLxi+knnKYiGKcArMn2iLv3IX/SBwkF2eunhz7evzPoJsuSxxHgWbtkJvrwKQz0Zbo
 lRZTDB8F+FrKzMABEQUdYk2al3otfZ6zfvfep/FGVoAkJ2y/lq7Al4m1d1aeSvdoII
 9pHenYqLpsfI0Ag8f+obus8e2aoqu1tKiT/F1BbT0Km1cUbsHElSpNnOj+eNEfBOTE
 lOmB9NHPCJRxA==
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
Subject: [PATCH v4 3/3] soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper
 function
Date: Sun,  1 Sep 2024 14:32:59 +0000
Message-Id: <20240901143259.16849-4-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240901143259.16849-1-chunkuang.hu@kernel.org>
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
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

In order to have fine-grained control, use cmdq_pkt_eoc() and
cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 22 ----------------------
 include/linux/soc/mediatek/mtk-cmdq.h  | 13 -------------
 2 files changed, 35 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index a8fccedba83f..2a47dda4dd4a 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -538,27 +538,5 @@ int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_eoc);
 
-int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
-{
-	struct cmdq_instruction inst = { {0} };
-	int err;
-
-	/* insert EOC and generate IRQ for each command iteration */
-	inst.op = CMDQ_CODE_EOC;
-	inst.value = CMDQ_EOC_IRQ_EN;
-	err = cmdq_pkt_append_command(pkt, inst);
-	if (err < 0)
-		return err;
-
-	/* JUMP to end */
-	inst.op = CMDQ_CODE_JUMP;
-	inst.value = CMDQ_JUMP_PASS >>
-		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
-	err = cmdq_pkt_append_command(pkt, inst);
-
-	return err;
-}
-EXPORT_SYMBOL(cmdq_pkt_finalize);
-
 MODULE_DESCRIPTION("MediaTek Command Queue (CMDQ) driver");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 5bee6f7fc400..0c3906e8ad19 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -391,14 +391,6 @@ int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
  */
 int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
 
-/**
- * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
- * @pkt:	the CMDQ packet
- *
- * Return: 0 for success; else the error code is returned
- */
-int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
-
 #else /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 static inline int cmdq_dev_get_client_reg(struct device *dev,
@@ -519,11 +511,6 @@ static inline int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
-{
-	return -EINVAL;
-}
-
 #endif /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.34.1

