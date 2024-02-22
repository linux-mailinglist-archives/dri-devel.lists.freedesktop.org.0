Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F9985FCC5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBC810E992;
	Thu, 22 Feb 2024 15:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uQUAk1TB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D5210E987
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:42:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDF29618E6;
 Thu, 22 Feb 2024 15:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA22C43390;
 Thu, 22 Feb 2024 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708616521;
 bh=EnlDgbrVCRzMk/5nA8phcXNSHmHCcO7T/tMtxNbprvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uQUAk1TBgeFaNwoHocfLvos2nHMyvH2XhcOjildr5QnbcV2KxngArqmqNWBVDSjzG
 Rr60cmb1GL7P5guQAhUHdGl8n17FvfS14znBK6SuHtcLOmjQsLqT2VfryOM5b/Go2k
 qvY/6/yWtPNrJMKmilSD9hky8QFKJeipX5pfeh0Y1TbPyjeogfzMvz3m1TPJC/wIey
 tZPcuuf0Ae6zfvyrJZVfN8knDfILwu/d/n51eDiRcZXDk7HFoOl967jQFc5CJCRXwB
 DWUEHXISRfU+C9fjoVXBr8lpUtKNb83AGQLg31Gy3Prv41xtoGM9+GoekwBQvm5prS
 muIVquBk9yXQA==
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
Subject: [PATCH v2 10/12] media: platform: mtk-mdp3: Get fine-grain control of
 cmdq_pkt_finalize()
Date: Thu, 22 Feb 2024 15:41:18 +0000
Message-Id: <20240222154120.16959-11-chunkuang.hu@kernel.org>
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

In order to have fine-grained control, use cmdq_pkt_eoc() and
cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 3 ++-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 ++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 6adac857a477..b720e69b341d 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -471,7 +471,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		dev_err(dev, "mdp_path_config error\n");
 		goto err_free_path;
 	}
-	cmdq_pkt_finalize(&cmd->pkt);
+	cmdq_pkt_eoc(&cmd->pkt);
+	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa);
 
 	for (i = 0; i < num_comp; i++)
 		memcpy(&comps[i], path->comps[i].comp,
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 94f4ed78523b..2214744c937c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -231,6 +231,8 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_put_scp;
 	}
 
+	mdp->cmdq_shift_pa = cmdq_get_shift_pa(mdp->cmdq_clt->chan);
+
 	init_waitqueue_head(&mdp->callback_wq);
 	ida_init(&mdp->mdp_ida);
 	platform_set_drvdata(pdev, mdp);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 7e21d226ceb8..ed61e0bb69ee 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -83,6 +83,7 @@ struct mdp_dev {
 	u32					id_count;
 	struct ida				mdp_ida;
 	struct cmdq_client			*cmdq_clt;
+	u8					cmdq_shift_pa;
 	wait_queue_head_t			callback_wq;
 
 	struct v4l2_device			v4l2_dev;
-- 
2.34.1

