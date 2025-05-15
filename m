Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CD1AB82CE
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6CD10E7EC;
	Thu, 15 May 2025 09:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="BzG3gSuu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BCE10E7E2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:35:17 +0000 (UTC)
X-UUID: e5afd91c316f11f0813e4fe1310efc19-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OPM8nhqf4L9SWcrLMVk2agWBmm8gPjgZer2l0aTPrF4=; 
 b=BzG3gSuukb4JvqmWTHcKq2ucj5D1xc+mOjfiwtPScGVvEM81WoM5CNO63ACk2SuRqg329A/7wJMLXJjrBsIDW/1z6tZQSE1/Xu75JHy1hPC7YjENY73mXecnZhwLAonN57TcvPKHKJ3UzEDoMoC4/VqBvbHvLh8e4W2emj56Z9o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:5e405a2e-d11b-47cd-8e39-68c30e286bcb, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:9795cb73-805e-40ad-809d-9cec088f3bd8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e5afd91c316f11f0813e4fe1310efc19-20250515
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 557445935; Thu, 15 May 2025 17:35:11 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 17:35:07 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 17:35:07 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
 <sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
 <sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 08/17] soc: mediatek: mutex: refactor SOF settings for
 output components
Date: Thu, 15 May 2025 17:34:20 +0800
Message-ID: <20250515093454.1729720-9-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

From: Paul-pl Chen <paul-pl.chen@mediatek.com>

Refactor SOF settings by adding mtk_mutex_get_output_comp_sof()
and extracting SOF logic from mtk_mutex_add_comp()
and mtk_mutex_remove_comp().

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 60 +++++++++++++++++++++-----
 include/linux/soc/mediatek/mtk-mutex.h |  4 ++
 2 files changed, 53 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 47f4d9ae4bfc..b2a9992fb232 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -879,19 +879,57 @@ static int mtk_mutex_get_output_comp_sof(enum mtk_ddp_comp_id id)
 	return -EINVAL;
 }
 
+void mtk_mutex_add_comp_sof(struct mtk_mutex *mutex, enum mtk_ddp_comp_id id)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	int sof_id = mtk_mutex_get_output_comp_sof(id);
+	unsigned int offset;
+
+	if (sof_id < 0 || sof_id >= DDP_MUTEX_SOF_MAX)
+		return;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id);
+
+	writel_relaxed(mtx->data->mutex_sof[sof_id], mtx->regs + offset);
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_add_comp_sof);
+
+void mtk_mutex_remove_comp_sof(struct mtk_mutex *mutex, enum mtk_ddp_comp_id id)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int reg;
+	int sof_id = mtk_mutex_get_output_comp_sof(id);
+	unsigned int offset;
+
+	if (sof_id < 0 || sof_id >= DDP_MUTEX_SOF_MAX)
+		return;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id);
+	reg = readl_relaxed(mtx->regs + offset);
+	reg &= ~(1 << mtx->data->mutex_sof[id]);
+
+	writel_relaxed(reg, mtx->regs + offset);
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp_sof);
+
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	unsigned int reg;
-	unsigned int sof_id;
 	unsigned int offset;
-	int sof_id = mtk_mutex_get_output_comp_sof(id);
+	bool is_output_comp = (mtk_mutex_get_output_comp_sof(id) > 0);
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
-	if (sof_id < 0) {
+	if (!is_output_comp) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -904,11 +942,10 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			reg |= 1 << (mtx->data->mutex_mod[id] - 32);
 			writel_relaxed(reg, mtx->regs + offset);
 		}
-		return;
 	}
 
-	writel_relaxed(mtx->data->mutex_sof[sof_id], mtx->regs +
-		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id));
+	if (is_output_comp)
+		mtk_mutex_add_comp_sof(mutex, id);
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
 
@@ -919,10 +956,11 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 						 mutex[mutex->id]);
 	unsigned int reg;
 	unsigned int offset;
-	int sof_id = mtk_mutex_get_output_comp_sof(id);
+	bool is_output_comp = (mtk_mutex_get_output_comp_sof(id) > 0);
+
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
-	if (sof_id < 0) {
+	if (!is_output_comp) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -938,9 +976,9 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 		return;
 	}
 
-	writel_relaxed(MUTEX_SOF_SINGLE_MODE,
-		       mtx->regs + DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
-		       mutex->id));
+	if (is_output_comp)
+		mtk_mutex_remove_comp_sof(mutex, id);
+
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
 
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index 635218e3ac68..515e2d8bfc90 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -69,6 +69,10 @@ enum mtk_mutex_sof_index {
 
 struct mtk_mutex *mtk_mutex_get(struct device *dev);
 int mtk_mutex_prepare(struct mtk_mutex *mutex);
+void mtk_mutex_add_comp_sof(struct mtk_mutex *mutex,
+			    enum mtk_ddp_comp_id id);
+void mtk_mutex_remove_comp_sof(struct mtk_mutex *mutex,
+			       enum mtk_ddp_comp_id id);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
 void mtk_mutex_enable(struct mtk_mutex *mutex);
-- 
2.45.2

