Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DD485FCBC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCF710E989;
	Thu, 22 Feb 2024 15:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jqhMuhuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9F610E989
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:41:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 813DE618F5;
 Thu, 22 Feb 2024 15:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A070C43394;
 Thu, 22 Feb 2024 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708616508;
 bh=nGIP2vJqkcuTspXXlk6nKjt5v1e19Z7ObipqHsmxyZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jqhMuhuMr3ZVz+g+vLndCqRLYsyQZ4IinHR1grM3SGkXk45xdHov7i6pbWL1tNzC7
 ytz8QU3K6Q8kVwdoQJpx01oWPHIIQ8S3+lz9k1QGQ1qhy9Xz+chv3XLLm+pq4YUA2z
 7m9plYDKkAc53EjNpO6qtn2WsZJBIYtB58RkgZ5cW8ouNZRjR7aOCVCs5iB8/lyGEq
 1sp8GncUj0cT5w2oga4GHKDdONNXrwk2yZtsKNlEht08xZtyjjwZLbN2WyQNTugeN5
 TriCyLboxKdX/bgFn6GItjoW3pQUoEupiVACgnfU+CtbJBYQ5kbqA5oN31Fi4/SAG4
 y0fKqeK49d0ZA==
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
Subject: [PATCH v2 06/12] soc: mediatek: cmdq: Remove cmdq_pkt_flush_async()
 helper function
Date: Thu, 22 Feb 2024 15:41:14 +0000
Message-Id: <20240222154120.16959-7-chunkuang.hu@kernel.org>
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

cmdq_pkt_flush_async() is not used by all client drivers (MediaTek
drm driver and MediaTek mdp3 driver), so remove it.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 15 ---------------
 include/linux/soc/mediatek/mtk-cmdq.h  | 18 ------------------
 2 files changed, 33 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 766dbafaef62..bbe41302210a 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -446,19 +446,4 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_finalize);
 
-int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
-{
-	int err;
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
-	err = mbox_send_message(client->chan, pkt);
-	if (err < 0)
-		return err;
-	/* We can send next packet immediately, so just call txdone. */
-	mbox_client_txdone(client->chan, 0);
-
-	return 0;
-}
-EXPORT_SYMBOL(cmdq_pkt_flush_async);
-
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 45110494ee9d..f82e789550ae 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -297,19 +297,6 @@ int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
  */
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
 
-/**
- * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
- *                          packet and call back at the end of done packet
- * @pkt:	the CMDQ packet
- *
- * Return: 0 for success; else the error code is returned
- *
- * Trigger CMDQ to asynchronously execute the CMDQ packet and call back
- * at the end of done packet. Note that this is an ASYNC function. When the
- * function returned, it may or may not be finished.
- */
-int cmdq_pkt_flush_async(struct cmdq_pkt *pkt);
-
 #else /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 static inline int cmdq_dev_get_client_reg(struct device *dev,
@@ -425,11 +412,6 @@ static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
-{
-	return -EINVAL;
-}
-
 #endif /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.34.1

