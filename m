Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4782465E5A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 07:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496C26E9DC;
	Thu,  2 Dec 2021 06:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8536E9D6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 06:41:05 +0000 (UTC)
X-UUID: 4f5ccd7e63694a5192012da2a906a952-20211202
X-UUID: 4f5ccd7e63694a5192012da2a906a952-20211202
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1400198638; Thu, 02 Dec 2021 14:41:00 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 2 Dec 2021 14:40:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Dec 2021 14:40:58 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <tzungbi@google.com>
Subject: [PATCH v4 2/2] drm/mediatek: add devlink to cmdq dev
Date: Thu, 2 Dec 2021 14:40:39 +0800
Message-ID: <20211202064039.20797-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
References: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
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
Cc: fshao@chromium.org, David Airlie <airlied@linux.ie>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add devlink to cmdq to make sure the order of suspend and resume
is correct.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 43 ++++++++++++++++++-------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 0b4012335e7a..612d1d69c16c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -60,6 +60,7 @@ struct mtk_drm_crtc {
 #endif
 
 	struct device			*mmsys_dev;
+	struct device			*drm_dev;
 	struct mtk_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
@@ -159,6 +160,7 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
 
 	if (mtk_crtc->cmdq_client.chan) {
+		device_link_remove(mtk_crtc->drm_dev, mtk_crtc->cmdq_client.chan->mbox->dev);
 		mbox_free_channel(mtk_crtc->cmdq_client.chan);
 		mtk_crtc->cmdq_client.chan = NULL;
 	}
@@ -902,6 +904,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		return -ENOMEM;
 
 	mtk_crtc->mmsys_dev = priv->mmsys_dev;
+	mtk_crtc->drm_dev = priv->dev;
 	mtk_crtc->ddp_comp_nr = path_len;
 	mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr,
 						sizeof(*mtk_crtc->ddp_comp),
@@ -969,6 +972,18 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	}
 
 	if (mtk_crtc->cmdq_client.chan) {
+		struct device_link *link;
+
+		/* add devlink to cmdq dev to make sure suspend/resume order is correct */
+		link = device_link_add(priv->dev, mtk_crtc->cmdq_client.chan->mbox->dev,
+				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+		if (!link) {
+			dev_err(priv->dev, "Unable to link dev=%s\n",
+				dev_name(mtk_crtc->cmdq_client.chan->mbox->dev));
+			ret = -ENODEV;
+			goto cmdq_err;
+		}
+
 		ret = of_property_read_u32_index(priv->mutex_node,
 						 "mediatek,gce-events",
 						 i,
@@ -976,22 +991,26 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		if (ret) {
 			dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
 				drm_crtc_index(&mtk_crtc->base));
-			mbox_free_channel(mtk_crtc->cmdq_client.chan);
-			mtk_crtc->cmdq_client.chan = NULL;
-		} else {
-			ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
-						      &mtk_crtc->cmdq_handle,
-						      PAGE_SIZE);
-			if (ret) {
-				dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
-					drm_crtc_index(&mtk_crtc->base));
-				mbox_free_channel(mtk_crtc->cmdq_client.chan);
-				mtk_crtc->cmdq_client.chan = NULL;
-			}
+			goto cmdq_err;
+		}
+
+		ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
+					      &mtk_crtc->cmdq_handle,
+					      PAGE_SIZE);
+		if (ret) {
+			dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
+				drm_crtc_index(&mtk_crtc->base));
+			goto cmdq_err;
 		}
 
 		/* for sending blocking cmd in crtc disable */
 		init_waitqueue_head(&mtk_crtc->cb_blocking_queue);
+
+cmdq_err:
+		if (ret) {
+			mbox_free_channel(mtk_crtc->cmdq_client.chan);
+			mtk_crtc->cmdq_client.chan = NULL;
+		}
 	}
 #endif
 	return 0;
-- 
2.18.0

