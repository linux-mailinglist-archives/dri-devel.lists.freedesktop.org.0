Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7E84BF55E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 11:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D18710E8B4;
	Tue, 22 Feb 2022 10:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8579110E7E5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 10:07:47 +0000 (UTC)
X-UUID: 3b0a255467ca4fca8148beaa222ad104-20220222
X-UUID: 3b0a255467ca4fca8148beaa222ad104-20220222
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1154194015; Tue, 22 Feb 2022 18:07:44 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 22 Feb 2022 18:07:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Feb 2022 18:07:44 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v12 13/23] drm/mediatek: add display merge start/stop API for
 cmdq support
Date: Tue, 22 Feb 2022 18:07:31 +0800
Message-ID: <20220222100741.30138-14-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220222100741.30138-1-nancy.lin@mediatek.com>
References: <20220222100741.30138-1-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add merge start/stop API for cmdq support. The ovl_adaptor merges
are configured with each drm plane update. Need to enable/disable
merge with cmdq making sure all the settings taken effect in the
same vblank.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 20 +++++++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index c2de53a5892e..224a710bb537 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -66,6 +66,8 @@ void mtk_merge_stop(struct device *dev);
 void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsigned int r_w,
 			      unsigned int h, unsigned int vrefresh, unsigned int bpc,
 			      struct cmdq_pkt *cmdq_pkt);
+void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt);
+void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 40da0555416d..c0d9b43b2a66 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -67,17 +67,31 @@ struct mtk_disp_merge {
 };
 
 void mtk_merge_start(struct device *dev)
+{
+	mtk_merge_start_cmdq(dev, NULL);
+}
+
+void mtk_merge_stop(struct device *dev)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 
-	writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
+	mtk_merge_stop_cmdq(dev, NULL);
 }
 
-void mtk_merge_stop(struct device *dev)
+void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CTRL);
+}
+
+void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 
-	writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
+	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CTRL);
 }
 
 static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
-- 
2.18.0

