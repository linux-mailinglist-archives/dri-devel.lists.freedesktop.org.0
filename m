Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EAA7A41FD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243F610E1D1;
	Mon, 18 Sep 2023 07:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A5610E3AA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:58:12 +0000 (UTC)
X-UUID: 1c58bf70514211ee8051498923ad61e6-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=l4jHo6DsCQRjh6AULckjgONKdVGgVJjTSSlZs9pOuO8=; 
 b=huX5fhjbVtc3Psykz3/+3R1Qj8AurBRpxdh7LwqNsfOamuOk8uziV+oDqcErZNNf7LPRTYgO94TTymMnPNZmsc9WtklUmpRt+OKZPDancUbUNUH+KI1pxGttk2Ww7/aX/p0U1pYC/cJFSdRiqLJ6myvU8gan1uyhc8hPRCSwfVU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:da3a9aba-743c-4275-8d2c-4c02ef9eb917, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:06fbbcbe-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1c58bf70514211ee8051498923ad61e6-20230912
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1552670017; Tue, 12 Sep 2023 15:58:08 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 15:58:06 +0800
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
Subject: [PATCH v5 04/14] media: platform: mtk-mdp3: add support second sets
 of MUTEX
Date: Tue, 12 Sep 2023 15:57:55 +0800
Message-ID: <20230912075805.11432-5-moudy.ho@mediatek.com>
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

After setting up the second set of MMSYS (VPPSYS1), it is necessary
to have a corresponding second set of MUTEX (MUTEX2) to assist in
handling SOF/EOF.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 64 ++++++++++++-------
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 34 ++++++++--
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  2 +
 3 files changed, 70 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 3177592490be..606651687465 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -44,15 +44,28 @@ static bool is_output_disabled(int p_id, const struct img_compparam *param, u32
 	return (count < num) ? (dis_output || dis_tile) : true;
 }
 
+static struct mtk_mutex *__get_mutex(const struct mdp_dev *mdp_dev,
+				     const struct mdp_pipe_info *p)
+{
+	struct mtk_mutex *m;
+
+	if (p->mmsys_id)
+		m = mdp_dev->mdp_mutex2[p->mutex_id];
+	else
+		m = mdp_dev->mdp_mutex[p->mutex_id];
+
+	return m;
+}
+
 static int mdp_path_subfrm_require(const struct mdp_path *path,
 				   struct mdp_cmdq_cmd *cmd,
-				   s32 *mutex_id, u32 count)
+				   struct mdp_pipe_info *p, u32 count)
 {
 	const int p_id = path->mdp_dev->mdp_data->mdp_plat_id;
 	const struct mdp_comp_ctx *ctx;
 	const struct mtk_mdp_driver_data *data = path->mdp_dev->mdp_data;
 	struct device *dev = &path->mdp_dev->pdev->dev;
-	struct mtk_mutex **mutex = path->mdp_dev->mdp_mutex;
+	struct mtk_mutex *mutex;
 	int id, index;
 	u32 num_comp = 0;
 
@@ -77,7 +90,8 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 		dev_err(dev, "Unknown pipeline and no mutex is assigned");
 		return -EINVAL;
 	}
-	*mutex_id = data->pipe_info[index].mutex_id;
+	memcpy(p, &data->pipe_info[index], sizeof(struct mdp_pipe_info));
+	mutex = __get_mutex(path->mdp_dev, p);
 
 	/* Set mutex mod */
 	for (index = 0; index < num_comp; index++) {
@@ -85,29 +99,28 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 		if (is_output_disabled(p_id, ctx->param, count))
 			continue;
 		id = ctx->comp->public_id;
-		mtk_mutex_write_mod(mutex[*mutex_id],
-				    data->mdp_mutex_table_idx[id], false);
+		mtk_mutex_write_mod(mutex, data->mdp_mutex_table_idx[id], false);
+
 	}
 
-	mtk_mutex_write_sof(mutex[*mutex_id],
-			    MUTEX_SOF_IDX_SINGLE_MODE);
+	mtk_mutex_write_sof(mutex, MUTEX_SOF_IDX_SINGLE_MODE);
 
 	return 0;
 }
 
 static int mdp_path_subfrm_run(const struct mdp_path *path,
 			       struct mdp_cmdq_cmd *cmd,
-			       s32 *mutex_id, u32 count)
+			       struct mdp_pipe_info *p, u32 count)
 {
 	const int p_id = path->mdp_dev->mdp_data->mdp_plat_id;
 	const struct mdp_comp_ctx *ctx;
 	struct device *dev = &path->mdp_dev->pdev->dev;
-	struct mtk_mutex **mutex = path->mdp_dev->mdp_mutex;
+	struct mtk_mutex *mutex;
 	int index;
 	u32 num_comp = 0;
 	s32 event;
 
-	if (-1 == *mutex_id) {
+	if (-1 == p->mutex_id) {
 		dev_err(dev, "Incorrect mutex id");
 		return -EINVAL;
 	}
@@ -127,7 +140,8 @@ static int mdp_path_subfrm_run(const struct mdp_path *path,
 	}
 
 	/* Enable the mutex */
-	mtk_mutex_enable_by_cmdq(mutex[*mutex_id], (void *)&cmd->pkt);
+	mutex = __get_mutex(path->mdp_dev, p);
+	mtk_mutex_enable_by_cmdq(mutex, (void *)&cmd->pkt);
 
 	/* Wait SOF events and clear mutex modules (optional) */
 	for (index = 0; index < num_comp; index++) {
@@ -174,7 +188,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	const struct img_mmsys_ctrl *ctrl = NULL;
 	const struct img_mux *set;
 	struct mdp_comp_ctx *ctx;
-	s32 mutex_id;
+	struct mdp_pipe_info pipe;
 	int index, ret;
 	u32 num_comp = 0;
 
@@ -185,7 +199,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 		ctrl = CFG_ADDR(MT8183, path->config, ctrls[count]);
 
 	/* Acquire components */
-	ret = mdp_path_subfrm_require(path, cmd, &mutex_id, count);
+	ret = mdp_path_subfrm_require(path, cmd, &pipe, count);
 	if (ret)
 		return ret;
 	/* Enable mux settings */
@@ -204,7 +218,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 			return ret;
 	}
 	/* Run components */
-	ret = mdp_path_subfrm_run(path, cmd, &mutex_id, count);
+	ret = mdp_path_subfrm_run(path, cmd, &pipe, count);
 	if (ret)
 		return ret;
 	/* Wait components done */
@@ -328,13 +342,13 @@ static void mdp_auto_release_work(struct work_struct *work)
 {
 	struct mdp_cmdq_cmd *cmd;
 	struct mdp_dev *mdp;
-	int id;
+	struct mtk_mutex *mutex;
 
 	cmd = container_of(work, struct mdp_cmdq_cmd, auto_release_work);
 	mdp = cmd->mdp;
 
-	id = mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0].mutex_id;
-	mtk_mutex_unprepare(mdp->mdp_mutex[id]);
+	mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0]);
+	mtk_mutex_unprepare(mutex);
 	mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 			    cmd->num_comps);
 
@@ -354,7 +368,6 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 	struct cmdq_cb_data *data;
 	struct mdp_dev *mdp;
 	struct device *dev;
-	int id;
 
 	if (!mssg) {
 		pr_info("%s:no callback data\n", __func__);
@@ -379,9 +392,11 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 
 	INIT_WORK(&cmd->auto_release_work, mdp_auto_release_work);
 	if (!queue_work(mdp->clock_wq, &cmd->auto_release_work)) {
+		struct mtk_mutex *mutex;
+
 		dev_err(dev, "%s:queue_work fail!\n", __func__);
-		id = mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0].mutex_id;
-		mtk_mutex_unprepare(mdp->mdp_mutex[id]);
+		mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0]);
+		mtk_mutex_unprepare(mutex);
 		mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 				    cmd->num_comps);
 
@@ -403,6 +418,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	struct mdp_comp *comps = NULL;
 	struct device *dev = &mdp->pdev->dev;
 	const int p_id = mdp->mdp_data->mdp_plat_id;
+	struct mtk_mutex *mutex = NULL;
 	int i, ret;
 	u32 num_comp = 0;
 
@@ -440,8 +456,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		goto err_free_comps;
 	}
 
-	i = mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0].mutex_id;
-	ret = mtk_mutex_prepare(mdp->mdp_mutex[i]);
+	mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0]);
+	ret = mtk_mutex_prepare(mutex);
 	if (ret) {
 		dev_err(dev, "Fail to enable mutex clk\n");
 		goto err_free_path;
@@ -506,8 +522,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 			    cmd->num_comps);
 err_free_path:
-	i = mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0].mutex_id;
-	mtk_mutex_unprepare(mdp->mdp_mutex[i]);
+	if (mutex)
+		mtk_mutex_unprepare(mutex);
 	kfree(path);
 err_free_comps:
 	kfree(comps);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 9c33d3aaf9cd..239f496b7a30 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -146,8 +146,10 @@ void mdp_video_device_release(struct video_device *vdev)
 	vb2_dma_contig_clear_max_seg_size(&mdp->pdev->dev);
 
 	mdp_comp_destroy(mdp);
-	for (i = 0; i < MDP_PIPE_MAX; i++)
+	for (i = 0; i < MDP_PIPE_MAX; i++) {
 		mtk_mutex_put(mdp->mdp_mutex[i]);
+		mtk_mutex_put(mdp->mdp_mutex2[i]);
+	}
 
 	mdp_vpu_shared_mem_free(&mdp->vpu);
 	v4l2_m2m_release(mdp->m2m_dev);
@@ -190,13 +192,30 @@ static int mdp_probe(struct platform_device *pdev)
 		ret = -ENODEV;
 		goto err_destroy_device;
 	}
+	mm2_pdev = __get_pdev_by_id(pdev, mm_pdev, MDP_INFRA_MUTEX2);
+	/* The 2nd MUTEX is not universally available, it only exists when
+	 * there is a 2nd MMSYS present.
+	 */
+	if ((IS_ERR(mm2_pdev)) ||
+	    (mm2_pdev && IS_ERR_OR_NULL(mdp->mdp_mmsys2))) {
+		ret = -ENODEV;
+		goto err_destroy_device;
+	}
 	for (i = 0; i < mdp->mdp_data->pipe_info_len; i++) {
+		struct platform_device *p;
+		struct mtk_mutex **m;
+		u32 id;
+
 		mutex_id = mdp->mdp_data->pipe_info[i].mutex_id;
-		if (!IS_ERR_OR_NULL(mdp->mdp_mutex[mutex_id]))
+		id = mdp->mdp_data->pipe_info[i].mmsys_id;
+		p = (id && mm2_pdev) ? mm2_pdev : mm_pdev;
+		m = (id && mm2_pdev) ? mdp->mdp_mutex2 : mdp->mdp_mutex;
+
+		if (!IS_ERR_OR_NULL(m[mutex_id]))
 			continue;
-		mdp->mdp_mutex[mutex_id] = mtk_mutex_get(&mm_pdev->dev);
-		if (IS_ERR(mdp->mdp_mutex[mutex_id])) {
-			ret = PTR_ERR(mdp->mdp_mutex[mutex_id]);
+		m[mutex_id] = mtk_mutex_get(&p->dev);
+		if (IS_ERR(m[mutex_id])) {
+			ret = PTR_ERR(m[mutex_id]);
 			goto err_free_mutex;
 		}
 	}
@@ -276,9 +295,12 @@ static int mdp_probe(struct platform_device *pdev)
 err_deinit_comp:
 	mdp_comp_destroy(mdp);
 err_free_mutex:
-	for (i = 0; i < mdp->mdp_data->pipe_info_len; i++)
+	for (i = 0; i < mdp->mdp_data->pipe_info_len; i++) {
 		if (!IS_ERR_OR_NULL(mdp->mdp_mutex[i]))
 			mtk_mutex_put(mdp->mdp_mutex[i]);
+		if (!IS_ERR_OR_NULL(mdp->mdp_mutex2[i]))
+			mtk_mutex_put(mdp->mdp_mutex2[i]);
+	}
 err_destroy_device:
 	kfree(mdp);
 err_return:
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 0434b70e1fc9..725f5a803406 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -22,6 +22,7 @@ enum mdp_infra_id {
 	MDP_INFRA_MMSYS,
 	MDP_INFRA_MMSYS2,
 	MDP_INFRA_MUTEX,
+	MDP_INFRA_MUTEX2,
 	MDP_INFRA_SCP,
 	MDP_INFRA_MAX
 };
@@ -71,6 +72,7 @@ struct mdp_dev {
 	struct device				*mdp_mmsys;
 	struct device				*mdp_mmsys2;
 	struct mtk_mutex			*mdp_mutex[MDP_PIPE_MAX];
+	struct mtk_mutex			*mdp_mutex2[MDP_PIPE_MAX];
 	struct mdp_comp				*comp[MDP_MAX_COMP_COUNT];
 	const struct mtk_mdp_driver_data	*mdp_data;
 
-- 
2.18.0

