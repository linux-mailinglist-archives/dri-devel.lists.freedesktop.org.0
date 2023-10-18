Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014757CD312
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 06:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6C510E377;
	Wed, 18 Oct 2023 04:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EC210E330
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 04:37:02 +0000 (UTC)
X-UUID: f7f560946d6f11eea33bb35ae8d461a2-20231018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gbjXlNeTaWOAgDiP7qRRiuPNtFIqTcPeM3WN/tA9eQc=; 
 b=ryoyhtcAHbLBDDANTvUppiSI1ByEbt9C68EBbUX65/c9Ho5QarPp1+S1dSpMFb3f2yNTvXKkjrkrf9imdXgnfPMqjm8/kK9ZGh0TSceFgdZlE412pF+n4Bb5VfosbbeOJEV+vAaJ3WRj5tHA/RnqLNG/FH1NIivWTrT1NjnpDmE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:73db61d0-2d51-4da6-9096-b620122767fa, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5f78ec9, CLOUDID:1d392a15-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f7f560946d6f11eea33bb35ae8d461a2-20231018
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1464819507; Wed, 18 Oct 2023 12:36:56 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Oct 2023 12:36:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 18 Oct 2023 12:36:55 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v9 22/23] drm/mediatek: Power on devices in OVL adaptor when
 atomic enable
Date: Wed, 18 Oct 2023 12:36:49 +0800
Message-ID: <20231018043650.22532-23-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231018043650.22532-1-shawn.sung@mediatek.com>
References: <20231018043650.22532-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Fei Shao <fshao@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Different from OVL, OVL adaptor is a pseudo device so we didn't
define it in the device tree, consequently, pm_runtime_resume_and_get()
called by .atomic_enable() powers on no device in OVL adaptor and
leads to power outage in the corresponding IOMMU.

To resolve the issue, we implement a function to power on the RDMAs
in OVL adaptor, and the system will make sure the IOMMU is powered on
as well because of the device link (iommus) in the RDMA nodes in DTS.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  4 ++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 63 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 28 +++------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   | 20 ++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 16 +++++
 6 files changed, 112 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index e2b602037ac3..c44f5b31bab5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -109,6 +109,8 @@ void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev,
 			     unsigned int next);
 void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys_dev,
 				unsigned int next);
+int mtk_ovl_adaptor_power_on(struct device *dev);
+void mtk_ovl_adaptor_power_off(struct device *dev);
 int mtk_ovl_adaptor_clk_enable(struct device *dev);
 void mtk_ovl_adaptor_clk_disable(struct device *dev);
 void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
@@ -150,6 +152,8 @@ void mtk_rdma_disable_vblank(struct device *dev);
 const u32 *mtk_rdma_get_formats(struct device *dev);
 size_t mtk_rdma_get_num_formats(struct device *dev);
 
+int mtk_mdp_rdma_power_on(struct device *dev);
+void mtk_mdp_rdma_power_off(struct device *dev);
 int mtk_mdp_rdma_clk_enable(struct device *dev);
 void mtk_mdp_rdma_clk_disable(struct device *dev);
 void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 753a7f829173..35bbce35b7b5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -98,6 +98,8 @@ static const struct mtk_ddp_comp_funcs padding = {
 };
 
 static const struct mtk_ddp_comp_funcs rdma = {
+	.power_on = mtk_mdp_rdma_power_on,
+	.power_off = mtk_mdp_rdma_power_off,
 	.clk_enable = mtk_mdp_rdma_clk_enable,
 	.clk_disable = mtk_mdp_rdma_clk_disable,
 };
@@ -241,6 +243,67 @@ void mtk_ovl_adaptor_stop(struct device *dev)
 	}
 }
 
+/**
+ * power_off - Power off the devices in OVL adaptor
+ * @dev: Device to be powered off
+ * @num: Number of the devices to be powered off
+ *
+ * Calls the .power_off() ovl_adaptor component callback if it is present.
+ */
+static inline void power_off(struct device *dev, unsigned int num)
+{
+	int i;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	if (num > OVL_ADAPTOR_ID_MAX)
+		num = OVL_ADAPTOR_ID_MAX;
+
+	for (i = num - 1; i >= 0; i--) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i] ||
+		    !comp_matches[i].funcs->power_off)
+			continue;
+
+		comp_matches[i].funcs->power_off(ovl_adaptor->ovl_adaptor_comp[i]);
+	}
+}
+
+/**
+ * mtk_ovl_adaptor_power_on - Power on the devices in OVL adaptor
+ * @dev: Device to be powered on
+ *
+ * Different from OVL, OVL adaptor is a pseudo device so
+ * we didn't define it in the device tree, pm_runtime_resume_and_get()
+ * called by .atomic_enable() power on no device in OVL adaptor,
+ * we have to implement a function to do the job instead.
+ *
+ * Return: Zero for success or negative number for failure.
+ */
+int mtk_ovl_adaptor_power_on(struct device *dev)
+{
+	int i, ret;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i] ||
+		    !comp_matches[i].funcs->power_on)
+			continue;
+
+		ret = comp_matches[i].funcs->power_on(ovl_adaptor->ovl_adaptor_comp[i]);
+		if (ret < 0) {
+			dev_err(ovl_adaptor->ovl_adaptor_comp[i],
+				"Failed to power on: %d\n", ret);
+			power_off(dev, i);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+void mtk_ovl_adaptor_power_off(struct device *dev)
+{
+	power_off(dev, OVL_ADAPTOR_ID_MAX);
+}
+
 int mtk_ovl_adaptor_clk_enable(struct device *dev)
 {
 	int i;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index a0b2ba3cbcdb..c7edd80be428 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -6,7 +6,6 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/mailbox_controller.h>
-#include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
@@ -362,22 +361,16 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc, struct drm_atomic
 		drm_connector_list_iter_end(&conn_iter);
 	}
 
-	ret = pm_runtime_resume_and_get(crtc->dev->dev);
-	if (ret < 0) {
-		DRM_ERROR("Failed to enable power domain: %d\n", ret);
-		return ret;
-	}
-
 	ret = mtk_mutex_prepare(mtk_crtc->mutex);
 	if (ret < 0) {
 		DRM_ERROR("Failed to enable mutex clock: %d\n", ret);
-		goto err_pm_runtime_put;
+		goto error;
 	}
 
 	ret = mtk_crtc_ddp_clk_enable(mtk_crtc);
 	if (ret < 0) {
 		DRM_ERROR("Failed to enable component clocks: %d\n", ret);
-		goto err_mutex_unprepare;
+		goto error;
 	}
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
@@ -426,16 +419,13 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc, struct drm_atomic
 
 	return 0;
 
-err_mutex_unprepare:
+error:
 	mtk_mutex_unprepare(mtk_crtc->mutex);
-err_pm_runtime_put:
-	pm_runtime_put(crtc->dev->dev);
 	return ret;
 }
 
 static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 {
-	struct drm_device *drm = mtk_crtc->base.dev;
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	int i;
 
@@ -465,8 +455,6 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 	mtk_crtc_ddp_clk_disable(mtk_crtc);
 	mtk_mutex_unprepare(mtk_crtc->mutex);
 
-	pm_runtime_put(drm->dev);
-
 	if (crtc->state->event && !crtc->state->active) {
 		spin_lock_irq(&crtc->dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
@@ -774,7 +762,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 	}
 
-	ret = pm_runtime_resume_and_get(comp->dev);
+	ret = mtk_ddp_comp_power_on(comp);
 	if (ret < 0) {
 		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n", ret);
 		return;
@@ -782,7 +770,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	ret = mtk_crtc_ddp_hw_init(mtk_crtc, state);
 	if (ret) {
-		pm_runtime_put(comp->dev);
+		mtk_ddp_comp_power_off(comp);
 		return;
 	}
 
@@ -795,7 +783,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-	int i, ret;
+	int i;
 
 	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
 	if (!mtk_crtc->enabled)
@@ -825,9 +813,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(crtc);
 	mtk_crtc_ddp_hw_fini(mtk_crtc);
-	ret = pm_runtime_put(comp->dev);
-	if (ret < 0)
-		DRM_DEV_ERROR(comp->dev, "Failed to disable power domain: %d\n", ret);
+	mtk_ddp_comp_power_off(comp);
 
 	mtk_crtc->enabled = false;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 10402e07a4a7..9940909c7435 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -396,6 +396,8 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 };
 
 static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
+	.power_on = mtk_ovl_adaptor_power_on,
+	.power_off = mtk_ovl_adaptor_power_off,
 	.clk_enable = mtk_ovl_adaptor_clk_enable,
 	.clk_disable = mtk_ovl_adaptor_clk_disable,
 	.config = mtk_ovl_adaptor_config,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 1c1d670cfe41..2597dd7ac0d2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -7,6 +7,7 @@
 #define MTK_DRM_DDP_COMP_H
 
 #include <linux/io.h>
+#include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
@@ -46,6 +47,8 @@ enum mtk_ddp_comp_type {
 struct mtk_ddp_comp;
 struct cmdq_pkt;
 struct mtk_ddp_comp_funcs {
+	int (*power_on)(struct device *dev);
+	void (*power_off)(struct device *dev);
 	int (*clk_enable)(struct device *dev);
 	void (*clk_disable)(struct device *dev);
 	void (*config)(struct device *dev, unsigned int w,
@@ -91,6 +94,23 @@ struct mtk_ddp_comp {
 	int encoder_index;
 };
 
+static inline int mtk_ddp_comp_power_on(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->power_on)
+		return comp->funcs->power_on(comp->dev);
+	else
+		return pm_runtime_resume_and_get(comp->dev);
+	return 0;
+}
+
+static inline void mtk_ddp_comp_power_off(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->power_off)
+		comp->funcs->power_off(comp->dev);
+	else
+		pm_runtime_put(comp->dev);
+}
+
 static inline int mtk_ddp_comp_clk_enable(struct mtk_ddp_comp *comp)
 {
 	if (comp->funcs && comp->funcs->clk_enable)
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index cb36a961786f..8feeb6dce217 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -243,6 +243,22 @@ size_t mtk_mdp_rdma_get_num_formats(struct device *dev)
 	return ARRAY_SIZE(formats);
 }
 
+int mtk_mdp_rdma_power_on(struct device *dev)
+{
+	int ret = pm_runtime_resume_and_get(dev);
+
+	if (ret < 0) {
+		dev_err(dev, "Failed to power on: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+void mtk_mdp_rdma_power_off(struct device *dev)
+{
+	pm_runtime_put(dev);
+}
+
 int mtk_mdp_rdma_clk_enable(struct device *dev)
 {
 	struct mtk_mdp_rdma *rdma = dev_get_drvdata(dev);
-- 
2.18.0

