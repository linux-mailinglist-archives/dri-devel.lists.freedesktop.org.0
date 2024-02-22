Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D8085FCC3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E8B10E987;
	Thu, 22 Feb 2024 15:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bMRvnplW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973B010E987
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:42:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D104618D5;
 Thu, 22 Feb 2024 15:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC892C433C7;
 Thu, 22 Feb 2024 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708616524;
 bh=KgDcscSofoiJ56aGo6M+RgNx0sKZfbHtKRJhpGa5w9Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bMRvnplWNr4x0m1A+BadooEBnvlrCUQoEAi8eDvoZ+gs9jt023jMYy/vdPgGMCIKI
 x33RQJpFw+SxNgNabT81f1WfKax8FGGnF9UJnY9lu3j/U2X71coiWNQsTaXgfBGHWN
 THMaQqWamo0XU3LXS/PgxKfbWZ6Cn0uYEsQb3XAE9MjtUtxVX79jxi6AwUMj8jKLuI
 u82Q/MhXrWsx7vu0l+55IQ73dIjtFyP85ep2vjjpNpk9LnM9j2BlsKF7ZGvtnr4io2
 psVBM4eLtJgkJ4EepXV4lNx0tVKVKwb0SK3RSNDeI419yC5tLFi4m/1f/Nu2HEDccJ
 fN6JTn/mWt9Fw==
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
Subject: [PATCH v2 11/12] media: platform: mtk-mdp3: Use cmdq_pkt_create() and
 cmdq_pkt_destroy()
Date: Thu, 22 Feb 2024 15:41:19 +0000
Message-Id: <20240222154120.16959-12-chunkuang.hu@kernel.org>
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

Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
instead of implementing mdp3 version.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 45 ++-----------------
 1 file changed, 4 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index b720e69b341d..c7a9f142102d 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -287,43 +287,6 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 	return 0;
 }
 
-static int mdp_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
-			       size_t size)
-{
-	struct device *dev;
-	dma_addr_t dma_addr;
-
-	pkt->va_base = kzalloc(size, GFP_KERNEL);
-	if (!pkt->va_base)
-		return -ENOMEM;
-
-	pkt->buf_size = size;
-	pkt->cl = (void *)client;
-
-	dev = client->chan->mbox->dev;
-	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
-				  DMA_TO_DEVICE);
-	if (dma_mapping_error(dev, dma_addr)) {
-		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
-		kfree(pkt->va_base);
-		return -ENOMEM;
-	}
-
-	pkt->pa_base = dma_addr;
-
-	return 0;
-}
-
-static void mdp_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
-{
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
-	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
-			 DMA_TO_DEVICE);
-	kfree(pkt->va_base);
-	pkt->va_base = NULL;
-}
-
 static void mdp_auto_release_work(struct work_struct *work)
 {
 	struct mdp_cmdq_cmd *cmd;
@@ -341,7 +304,7 @@ static void mdp_auto_release_work(struct work_struct *work)
 	atomic_dec(&mdp->job_count);
 	wake_up(&mdp->callback_wq);
 
-	mdp_cmdq_pkt_destroy(&cmd->pkt);
+	cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
 	kfree(cmd->comps);
 	cmd->comps = NULL;
 	kfree(cmd);
@@ -388,7 +351,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 		atomic_dec(&mdp->job_count);
 		wake_up(&mdp->callback_wq);
 
-		mdp_cmdq_pkt_destroy(&cmd->pkt);
+		cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
 		kfree(cmd->comps);
 		cmd->comps = NULL;
 		kfree(cmd);
@@ -418,7 +381,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		goto err_cancel_job;
 	}
 
-	ret = mdp_cmdq_pkt_create(mdp->cmdq_clt, &cmd->pkt, SZ_16K);
+	ret = cmdq_pkt_create(mdp->cmdq_clt, &cmd->pkt, SZ_16K);
 	if (ret)
 		goto err_free_cmd;
 
@@ -513,7 +476,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 err_free_comps:
 	kfree(comps);
 err_destroy_pkt:
-	mdp_cmdq_pkt_destroy(&cmd->pkt);
+	cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
 err_free_cmd:
 	kfree(cmd);
 err_cancel_job:
-- 
2.34.1

