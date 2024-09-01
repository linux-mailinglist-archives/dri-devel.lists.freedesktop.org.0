Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A896771A
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 16:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9ED10E1A7;
	Sun,  1 Sep 2024 14:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="djwqOs+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B6010E1A7
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 14:33:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CD1915C56A5;
 Sun,  1 Sep 2024 14:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA8EC4CEC3;
 Sun,  1 Sep 2024 14:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725201192;
 bh=CzM2V1KtCAgZIRHM5qi4/f/LeVuo0+4iK2VKniGUAgc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=djwqOs+KAxYksQ3ycimQY9MHBo+Ag87hDjdbOUePuoPZHv3QzObQ0LnQ7jrHRcRL9
 sPwawMpsUl1u0+2dDFtmyWBJP3Bl98kyXk4Gd3DAttxCzvPLY+NYqMbuUrZJZuHvAh
 J1zK01JdE4eT4OCFv8RNWAKcsJ8Q2W8aG52TUk7e9UlGL0bJM7J1Hyms//xvIoWp71
 OU3Cg+ifcK3GMVBN/A5e3RK7yToc0NU9YwVwpa6WXjriM03bpVRmquVvhOQXO9iO0c
 gTQjlqdYiuqqQ7X0SlVyz22Jg4Cl2vqzisWGnIDOqqF8XhzYizrNHRRCPTcfSuITKs
 kw0VjQrPy2wLQ==
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
Subject: [PATCH v4 2/3] media: platform: mtk-mdp3: Use cmdq_pkt_create() and
 cmdq_pkt_destroy()
Date: Sun,  1 Sep 2024 14:32:58 +0000
Message-Id: <20240901143259.16849-3-chunkuang.hu@kernel.org>
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

Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
instead of implementing mdp3 version.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 46 ++-----------------
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |  1 +
 2 files changed, 6 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index ef5dade35fd3..740a484c8eb4 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -471,43 +471,6 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
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
@@ -538,7 +501,7 @@ static void mdp_auto_release_work(struct work_struct *work)
 		wake_up(&mdp->callback_wq);
 	}
 
-	mdp_cmdq_pkt_destroy(&cmd->pkt);
+	cmdq_pkt_destroy(mdp->cmdq_clt[cmd->pp_idx], &cmd->pkt);
 	kfree(cmd->comps);
 	cmd->comps = NULL;
 	kfree(cmd);
@@ -578,7 +541,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 		if (refcount_dec_and_test(&mdp->job_count))
 			wake_up(&mdp->callback_wq);
 
-		mdp_cmdq_pkt_destroy(&cmd->pkt);
+		cmdq_pkt_destroy(mdp->cmdq_clt[cmd->pp_idx], &cmd->pkt);
 		kfree(cmd->comps);
 		cmd->comps = NULL;
 		kfree(cmd);
@@ -620,7 +583,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
 		goto err_uninit;
 	}
 
-	ret = mdp_cmdq_pkt_create(mdp->cmdq_clt[pp_idx], &cmd->pkt, SZ_16K);
+	ret = cmdq_pkt_create(mdp->cmdq_clt[pp_idx], &cmd->pkt, SZ_16K);
 	if (ret)
 		goto err_free_cmd;
 
@@ -700,6 +663,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
 	cmd->comps = comps;
 	cmd->num_comps = num_comp;
 	cmd->mdp_ctx = param->mdp_ctx;
+	cmd->pp_idx = pp_idx;
 
 	kfree(path);
 	return cmd;
@@ -711,7 +675,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
 err_free_comps:
 	kfree(comps);
 err_destroy_pkt:
-	mdp_cmdq_pkt_destroy(&cmd->pkt);
+	cmdq_pkt_destroy(mdp->cmdq_clt[pp_idx], &cmd->pkt);
 err_free_cmd:
 	kfree(cmd);
 err_uninit:
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
index 53a30ad7e0b0..935ae9825728 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
@@ -35,6 +35,7 @@ struct mdp_cmdq_cmd {
 	struct mdp_comp *comps;
 	void *mdp_ctx;
 	u8 num_comps;
+	u8 pp_idx;
 };
 
 struct mdp_dev;
-- 
2.34.1

