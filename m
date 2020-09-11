Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2201826856B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B05C6E202;
	Mon, 14 Sep 2020 07:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CCD6E07F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 11:22:14 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 276D44D483AD00BB640F;
 Fri, 11 Sep 2020 19:22:11 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Fri, 11 Sep 2020
 19:22:01 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <djkurtz@chromium.org>,
 <yt.shen@mediatek.com>, <ck.hu@mediatek.com>, <littlecvr@chromium.org>
Subject: [PATCH] drm/mediatek: add missing put_device() call in
 mtk_drm_kms_init()
Date: Fri, 11 Sep 2020 19:21:19 +0800
Message-ID: <20200911112119.3218073-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 yukuai3@huawei.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

if of_find_device_by_node() succeed, mtk_drm_kms_init() doesn't have
a corresponding put_device(). Thus add jump target to fix the exception
handling for this function implementation.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 040a8f393fe2..7aceace94ebf 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -165,7 +165,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 
 	ret = drmm_mode_config_init(drm);
 	if (ret)
-		return ret;
+		goto put_mutex_dev;
 
 	drm->mode_config.min_width = 64;
 	drm->mode_config.min_height = 64;
@@ -182,7 +182,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 
 	ret = component_bind_all(drm->dev, drm);
 	if (ret)
-		return ret;
+		goto put_mutex_dev;
 
 	/*
 	 * We currently support two fixed data streams, each optional,
@@ -229,7 +229,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	}
 	if (!dma_dev->dma_parms) {
 		ret = -ENOMEM;
-		goto err_component_unbind;
+		goto put_dma_dev;
 	}
 
 	ret = dma_set_max_seg_size(dma_dev, (unsigned int)DMA_BIT_MASK(32));
@@ -256,9 +256,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 err_unset_dma_parms:
 	if (private->dma_parms_allocated)
 		dma_dev->dma_parms = NULL;
+put_dma_dev:
+	put_device(private->dma_dev);
 err_component_unbind:
 	component_unbind_all(drm->dev, drm);
-
+put_mutex_dev:
+	put_device(private->mutex_dev);
 	return ret;
 }
 
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
