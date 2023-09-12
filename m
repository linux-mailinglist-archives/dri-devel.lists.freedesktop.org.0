Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA457A41ED
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDBD10E1BB;
	Mon, 18 Sep 2023 07:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575E710E3AB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:58:13 +0000 (UTC)
X-UUID: 1bd99ef2514211eea33bb35ae8d461a2-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2R9wOQrt2hYCSpKJhLmyUTxma34SGY5+qu2t41w5Qi0=; 
 b=PUoSJUYM7rf8QghkgdM1pYGjbpxt6dA8UdCdx034gC8xXUbNm1CZaJ/wNWwnglMvRPKEG+jaxplUFRPDA45/YFQuxWsEXnfzv29zH0+CV/Dtm2IX01ljCH/CUJNy0j3kuFiplocLLvDktvPdtpvm+lXPab4xhf9cI5SoPjZlea4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:d90ad237-4040-4402-ad03-c2a26132f11d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:bd5199ef-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1bd99ef2514211eea33bb35ae8d461a2-20230912
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 46534301; Tue, 12 Sep 2023 15:58:07 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 15:58:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 15:58:06 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v5 05/14] media: platform: mtk-mdp3: introduce more pipelines
 from MT8195
Date: Tue, 12 Sep 2023 15:57:56 +0800
Message-ID: <20230912075805.11432-6-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230912075805.11432-1-moudy.ho@mediatek.com>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Increasing the number of sets built by MMSYS and MUTEX in MT8195
will enable the creation of more pipelines in MDP3.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 80 ++++++++++++-------
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  7 ++
 2 files changed, 60 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 606651687465..6d04f72cf86f 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -57,6 +57,43 @@ static struct mtk_mutex *__get_mutex(const struct mdp_dev *mdp_dev,
 	return m;
 }
 
+static enum mdp_pipe_id __get_pipe(const struct mdp_dev *mdp_dev,
+				   enum mtk_mdp_comp_id id)
+{
+	enum mdp_pipe_id pipe_id;
+
+	switch (id) {
+	case MDP_COMP_RDMA0:
+		pipe_id = MDP_PIPE_RDMA0;
+		break;
+	case MDP_COMP_ISP_IMGI:
+		pipe_id = MDP_PIPE_IMGI;
+		break;
+	case MDP_COMP_WPEI:
+		pipe_id = MDP_PIPE_WPEI;
+		break;
+	case MDP_COMP_WPEI2:
+		pipe_id = MDP_PIPE_WPEI2;
+		break;
+	case MDP_COMP_RDMA1:
+		pipe_id = MDP_PIPE_RDMA1;
+		break;
+	case MDP_COMP_RDMA2:
+		pipe_id = MDP_PIPE_RDMA2;
+		break;
+	case MDP_COMP_RDMA3:
+		pipe_id = MDP_PIPE_RDMA3;
+		break;
+	default:
+		/* Avoid exceptions when operating MUTEX */
+		pipe_id = MDP_PIPE_RDMA0;
+		dev_err(&mdp_dev->pdev->dev, "Unknown pipeline id %d", id);
+		break;
+	}
+
+	return pipe_id;
+}
+
 static int mdp_path_subfrm_require(const struct mdp_path *path,
 				   struct mdp_cmdq_cmd *cmd,
 				   struct mdp_pipe_info *p, u32 count)
@@ -64,7 +101,6 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 	const int p_id = path->mdp_dev->mdp_data->mdp_plat_id;
 	const struct mdp_comp_ctx *ctx;
 	const struct mtk_mdp_driver_data *data = path->mdp_dev->mdp_data;
-	struct device *dev = &path->mdp_dev->pdev->dev;
 	struct mtk_mutex *mutex;
 	int id, index;
 	u32 num_comp = 0;
@@ -73,23 +109,7 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 		num_comp = CFG_GET(MT8183, path->config, num_components);
 
 	/* Decide which mutex to use based on the current pipeline */
-	switch (path->comps[0].comp->public_id) {
-	case MDP_COMP_RDMA0:
-		index = MDP_PIPE_RDMA0;
-		break;
-	case MDP_COMP_ISP_IMGI:
-		index = MDP_PIPE_IMGI;
-		break;
-	case MDP_COMP_WPEI:
-		index = MDP_PIPE_WPEI;
-		break;
-	case MDP_COMP_WPEI2:
-		index = MDP_PIPE_WPEI2;
-		break;
-	default:
-		dev_err(dev, "Unknown pipeline and no mutex is assigned");
-		return -EINVAL;
-	}
+	index = __get_pipe(path->mdp_dev, path->comps[0].comp->public_id);
 	memcpy(p, &data->pipe_info[index], sizeof(struct mdp_pipe_info));
 	mutex = __get_mutex(path->mdp_dev, p);
 
@@ -343,11 +363,13 @@ static void mdp_auto_release_work(struct work_struct *work)
 	struct mdp_cmdq_cmd *cmd;
 	struct mdp_dev *mdp;
 	struct mtk_mutex *mutex;
+	enum mdp_pipe_id pipe_id;
 
 	cmd = container_of(work, struct mdp_cmdq_cmd, auto_release_work);
 	mdp = cmd->mdp;
 
-	mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0]);
+	pipe_id = __get_pipe(mdp, cmd->comps[0].public_id);
+	mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[pipe_id]);
 	mtk_mutex_unprepare(mutex);
 	mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 			    cmd->num_comps);
@@ -368,6 +390,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 	struct cmdq_cb_data *data;
 	struct mdp_dev *mdp;
 	struct device *dev;
+	enum mdp_pipe_id pipe_id;
 
 	if (!mssg) {
 		pr_info("%s:no callback data\n", __func__);
@@ -395,7 +418,8 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 		struct mtk_mutex *mutex;
 
 		dev_err(dev, "%s:queue_work fail!\n", __func__);
-		mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0]);
+		pipe_id = __get_pipe(mdp, cmd->comps[0].public_id);
+		mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[pipe_id]);
 		mtk_mutex_unprepare(mutex);
 		mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 				    cmd->num_comps);
@@ -419,6 +443,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	struct device *dev = &mdp->pdev->dev;
 	const int p_id = mdp->mdp_data->mdp_plat_id;
 	struct mtk_mutex *mutex = NULL;
+	enum mdp_pipe_id pipe_id;
 	int i, ret;
 	u32 num_comp = 0;
 
@@ -456,13 +481,6 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		goto err_free_comps;
 	}
 
-	mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0]);
-	ret = mtk_mutex_prepare(mutex);
-	if (ret) {
-		dev_err(dev, "Fail to enable mutex clk\n");
-		goto err_free_path;
-	}
-
 	path->mdp_dev = mdp;
 	path->config = param->config;
 	path->param = param->param;
@@ -482,6 +500,14 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		goto err_free_path;
 	}
 
+	pipe_id = __get_pipe(mdp, path->comps[0].comp->public_id);
+	mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[pipe_id]);
+	ret = mtk_mutex_prepare(mutex);
+	if (ret) {
+		dev_err(dev, "Fail to enable mutex clk\n");
+		goto err_free_path;
+	}
+
 	ret = mdp_path_config(mdp, cmd, path);
 	if (ret) {
 		dev_err(dev, "mdp_path_config error\n");
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 725f5a803406..e4ffa25b9271 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -49,6 +49,13 @@ enum mdp_pipe_id {
 	MDP_PIPE_WPEI2,
 	MDP_PIPE_IMGI,
 	MDP_PIPE_RDMA0,
+	MDP_PIPE_RDMA1,
+	MDP_PIPE_RDMA2,
+	MDP_PIPE_RDMA3,
+	MDP_PIPE_SPLIT,
+	MDP_PIPE_SPLIT2,
+	MDP_PIPE_VPP0_SOUT,
+	MDP_PIPE_VPP1_SOUT,
 	MDP_PIPE_MAX
 };
 
-- 
2.18.0

