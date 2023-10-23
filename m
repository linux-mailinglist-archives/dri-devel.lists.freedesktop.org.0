Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C02C47D2964
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 06:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD1310E076;
	Mon, 23 Oct 2023 04:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B116D10E078
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 04:45:58 +0000 (UTC)
X-UUID: 0b803196715f11eea33bb35ae8d461a2-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3RLDw7GW/vAflRKIDHmKnuIo5Umx5dhJsbVlDeutM/U=; 
 b=UbzyB+Prj6akMeln1CjVwNGDYZJh8p/CPtt+eCDbWYCYlkbUO1bzmJVjtduxlgVk0nHF6E/7gGwKUZFoJfKhxnrnE1XJG8qe9TWYga5UbBP3Sv5RGMKDT0RrQXf7iVOvQdDHomjOab/swuL0f0iUQz00Wcn62hEJUMIbz/xbgC8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:7541fdbd-afea-41b6-996b-6ceaa051100e, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5f78ec9, CLOUDID:a68531d7-04a0-4e50-8742-3543eab8cb8e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0b803196715f11eea33bb35ae8d461a2-20231023
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 624508191; Mon, 23 Oct 2023 12:45:52 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 12:45:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 12:45:50 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Subject: [PATCH v2 03/11] drm/mediatek: Add secure buffer control flow to
 mtk_drm_gem
Date: Mon, 23 Oct 2023 12:45:40 +0800
Message-ID: <20231023044549.21412-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.977800-8.000000
X-TMASE-MatchedRID: XAa2d/45j8QXSulpnju2HwNJ3EDwuUClKx5ICGp/WtFLgo8+IIHbcJh8
 90SylZrlwPiYYkBDBMe2fd29CPQsSyQVVteP90CtKaMQ6tw7oDJMkOX0UoduuUYvSDWdWaRhkmi
 3zE7HIvnZoTly3PGW4OyVvSGEffbDb6wZx1ul0pzJ5W6OZe5hhS7te75+XjKBv8D7QPW2jo8ARd
 T81SrHjvetcOpa0TfdcBOyDww4NUgfE8yM4pjsD7j1D7wMfbaSxEHRux+uk8h+ICquNi0WJDQtB
 p+IwDvUf9Bw3O0r/bIHdEwGdShgq1z03sVX2iu4ftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.977800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C526C3CB59431DAEABBA32F08FA18E43D53637F792CE875D119AA0C22F0CCB4B2000:8
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
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch
 Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add secure buffer control flow to mtk_drm_gem.

When user space takes DRM_MTK_GEM_CREATE_ENCRYPTED flag and size
to create a mtk_drm_gem object, mtk_drm_gem will find a matched size
dma buffer from secure dma-heap and bind it to mtk_drm_gem object.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 84 +++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_gem.h |  4 ++
 2 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index bcce723f257d..2064ccd7dde0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <uapi/linux/dma-heap.h>
 #include <drm/mediatek_drm.h>
 
 #include <drm/drm.h>
@@ -55,6 +57,80 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
 	return mtk_gem_obj;
 }
 
+struct mtk_drm_gem_obj *mtk_drm_gem_create_from_heap(struct drm_device *dev,
+						     const char *heap, size_t size)
+{
+	struct mtk_drm_private *priv = dev->dev_private;
+	struct mtk_drm_gem_obj *mtk_gem;
+	struct drm_gem_object *obj;
+	struct dma_heap *dma_heap;
+	struct dma_buf *dma_buf;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	struct iosys_map map = {};
+	int ret;
+
+	mtk_gem = mtk_drm_gem_init(dev, size);
+	if (IS_ERR(mtk_gem))
+		return ERR_CAST(mtk_gem);
+
+	obj = &mtk_gem->base;
+
+	dma_heap = dma_heap_find(heap);
+	if (!dma_heap) {
+		DRM_ERROR("heap find fail\n");
+		goto err_gem_free;
+	}
+	dma_buf = dma_heap_buffer_alloc(dma_heap, size,
+					O_RDWR | O_CLOEXEC, DMA_HEAP_VALID_HEAP_FLAGS);
+	if (IS_ERR(dma_buf)) {
+		DRM_ERROR("buffer alloc fail\n");
+		dma_heap_put(dma_heap);
+		goto err_gem_free;
+	}
+	dma_heap_put(dma_heap);
+
+	attach = dma_buf_attach(dma_buf, priv->dma_dev);
+	if (IS_ERR(attach)) {
+		DRM_ERROR("attach fail, return\n");
+		dma_buf_put(dma_buf);
+		goto err_gem_free;
+	}
+	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		DRM_ERROR("map failed, detach and return\n");
+		dma_buf_detach(dma_buf, attach);
+		dma_buf_put(dma_buf);
+		goto err_gem_free;
+	}
+	obj->import_attach = attach;
+	mtk_gem->dma_addr = sg_dma_address(sgt->sgl);
+	mtk_gem->sg = sgt;
+	mtk_gem->size = dma_buf->size;
+
+	if (!strcmp(heap, "mtk_svp") || !strcmp(heap, "mtk_svp_cma")) {
+		/* secure buffer can not be mapped */
+		mtk_gem->sec = true;
+	} else {
+		ret = dma_buf_vmap(dma_buf, &map);
+		mtk_gem->kvaddr = map.vaddr;
+		if (ret) {
+			DRM_ERROR("map failed, ret=%d\n", ret);
+			dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
+			dma_buf_detach(dma_buf, attach);
+			dma_buf_put(dma_buf);
+			mtk_gem->kvaddr = NULL;
+		}
+	}
+
+	return mtk_gem;
+
+err_gem_free:
+	drm_gem_object_release(obj);
+	kfree(mtk_gem);
+	return ERR_PTR(-ENOMEM);
+}
+
 struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
 					   size_t size, bool alloc_kmap)
 {
@@ -218,7 +294,9 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 	if (IS_ERR(mtk_gem))
 		return ERR_CAST(mtk_gem);
 
+	mtk_gem->sec = !sg_page(sg->sgl);
 	mtk_gem->dma_addr = sg_dma_address(sg->sgl);
+	mtk_gem->size = attach->dmabuf->size;
 	mtk_gem->sg = sg;
 
 	return &mtk_gem->base;
@@ -290,7 +368,11 @@ int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_mtk_gem_create *args = data;
 	int ret;
 
-	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
+	if (args->flags & DRM_MTK_GEM_CREATE_ENCRYPTED)
+		mtk_gem = mtk_drm_gem_create_from_heap(dev, "mtk_svp_cma", args->size);
+	else
+		mtk_gem = mtk_drm_gem_create(dev, args->size, false);
+
 	if (IS_ERR(mtk_gem))
 		return PTR_ERR(mtk_gem);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
index 90f3d2916ec5..ed4d23e252e9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
@@ -27,9 +27,11 @@ struct mtk_drm_gem_obj {
 	void			*cookie;
 	void			*kvaddr;
 	dma_addr_t		dma_addr;
+	size_t			size;
 	unsigned long		dma_attrs;
 	struct sg_table		*sg;
 	struct page		**pages;
+	bool			sec;
 };
 
 #define to_mtk_gem_obj(x)	container_of(x, struct mtk_drm_gem_obj, base)
@@ -37,6 +39,8 @@ struct mtk_drm_gem_obj {
 void mtk_drm_gem_free_object(struct drm_gem_object *gem);
 struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev, size_t size,
 					   bool alloc_kmap);
+struct mtk_drm_gem_obj *mtk_drm_gem_create_from_heap(struct drm_device *dev,
+						     const char *heap, size_t size);
 int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 			    struct drm_mode_create_dumb *args);
 struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
-- 
2.18.0

