Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6EA2DF2C6
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 03:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5266E104;
	Sun, 20 Dec 2020 02:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46E26E102
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 02:37:20 +0000 (UTC)
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/5] drm/mediatek: Automatically search unclaimed mtk mutex in
 mtk_mutex_get()
Date: Sun, 20 Dec 2020 10:36:54 +0800
Message-Id: <20201220023655.30795-5-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201220023655.30795-1-chunkuang.hu@kernel.org>
References: <20201220023655.30795-1-chunkuang.hu@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CK Hu <ck.hu@mediatek.com>

Moving mutex resource management from client driver to  mutex driver
could prevent client drivers negotiating for resource management.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  2 +-
 drivers/gpu/drm/mediatek/mtk_mutex.c    | 16 ++++++++--------
 drivers/gpu/drm/mediatek/mtk_mutex.h    |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 5c4e8e2f4448..23d9abc4f46c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -772,7 +772,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	if (!mtk_crtc->ddp_comp)
 		return -ENOMEM;
 
-	mtk_crtc->mutex = mtk_mutex_get(priv->mutex_dev, pipe);
+	mtk_crtc->mutex = mtk_mutex_get(priv->mutex_dev);
 	if (IS_ERR(mtk_crtc->mutex)) {
 		ret = PTR_ERR(mtk_crtc->mutex);
 		dev_err(dev, "Failed to get mutex: %d\n", ret);
diff --git a/drivers/gpu/drm/mediatek/mtk_mutex.c b/drivers/gpu/drm/mediatek/mtk_mutex.c
index ece26359a292..e16b1772317c 100644
--- a/drivers/gpu/drm/mediatek/mtk_mutex.c
+++ b/drivers/gpu/drm/mediatek/mtk_mutex.c
@@ -226,18 +226,18 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 };
 
-struct mtk_mutex *mtk_mutex_get(struct device *dev, unsigned int id)
+struct mtk_mutex *mtk_mutex_get(struct device *dev)
 {
 	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
+	int i;
 
-	if (id >= 10)
-		return ERR_PTR(-EINVAL);
-	if (mtx->mutex[id].claimed)
-		return ERR_PTR(-EBUSY);
-
-	mtx->mutex[id].claimed = true;
+	for (i = 0; i < 10; i++)
+		if (!mtx->mutex[i].claimed) {
+			mtx->mutex[i].claimed = true;
+			return &mtx->mutex[i];
+		}
 
-	return &mtx->mutex[id];
+	return ERR_PTR(-EBUSY);
 }
 
 void mtk_mutex_put(struct mtk_mutex *mutex)
diff --git a/drivers/gpu/drm/mediatek/mtk_mutex.h b/drivers/gpu/drm/mediatek/mtk_mutex.h
index b678e0988a37..6fe4ffbde290 100644
--- a/drivers/gpu/drm/mediatek/mtk_mutex.h
+++ b/drivers/gpu/drm/mediatek/mtk_mutex.h
@@ -10,7 +10,7 @@ struct regmap;
 struct device;
 struct mtk_mutex;
 
-struct mtk_mutex *mtk_mutex_get(struct device *dev, unsigned int id);
+struct mtk_mutex *mtk_mutex_get(struct device *dev);
 int mtk_mutex_prepare(struct mtk_mutex *mutex);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
