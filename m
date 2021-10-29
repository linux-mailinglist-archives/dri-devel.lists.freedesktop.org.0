Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A5443F5D6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 05:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E543D6E9DA;
	Fri, 29 Oct 2021 03:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756F86E9D1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 03:55:54 +0000 (UTC)
X-UUID: 8fa37a61089c4e3093a5365400990aa9-20211029
X-UUID: 8fa37a61089c4e3093a5365400990aa9-20211029
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 397708099; Fri, 29 Oct 2021 11:55:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Oct 2021 11:55:48 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 29 Oct 2021 11:55:46 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v8,
 12/17] media: mtk-vcodec: Add new interface to lock different hardware
Date: Fri, 29 Oct 2021 11:55:22 +0800
Message-ID: <20211029035527.454-13-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029035527.454-1-yunfei.dong@mediatek.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For add new hardware, not only need to lock lat hardware, also
need to lock core hardware in case of different instance start
to decoder at the same time.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c     | 4 ++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 6 +++---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 2b334a8a81c6..130ecef2e766 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -105,12 +105,12 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
 
 void mtk_vdec_unlock(struct mtk_vcodec_ctx *ctx)
 {
-	mutex_unlock(&ctx->dev->dec_mutex);
+	mutex_unlock(&ctx->dev->dec_mutex[ctx->hw_id]);
 }
 
 void mtk_vdec_lock(struct mtk_vcodec_ctx *ctx)
 {
-	mutex_lock(&ctx->dev->dec_mutex);
+	mutex_lock(&ctx->dev->dec_mutex[ctx->hw_id]);
 }
 
 void mtk_vcodec_dec_release(struct mtk_vcodec_ctx *ctx)
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 28f96e1973ff..0ae6399ba407 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -320,7 +320,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	struct video_device *vfd_dec;
 	phandle rproc_phandle;
 	enum mtk_vcodec_fw_type fw_type;
-	int ret;
+	int i, ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -352,8 +352,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_dec_pm;
 	}
 
-	mutex_init(&dev->dec_mutex);
-	mutex_init(&dev->dev_mutex);
+	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
+		mutex_init(&dev->dec_mutex[i]);
 	spin_lock_init(&dev->irqlock);
 
 	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 20712f80bdb5..598205db5120 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -501,7 +501,7 @@ struct mtk_vcodec_dev {
 	int dec_irq;
 	int enc_irq;
 
-	struct mutex dec_mutex;
+	struct mutex dec_mutex[MTK_VDEC_HW_MAX];
 	struct mutex enc_mutex;
 
 	struct mtk_vcodec_pm pm;
-- 
2.25.1

