Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A981CF076
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB99D6E8ED;
	Tue, 12 May 2020 09:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776536E8DF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090116euoutp02a3d2b99c9c440a35d1091b4ea39f2ea2~OPFoQnT6Y0304403044euoutp02R
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200512090116euoutp02a3d2b99c9c440a35d1091b4ea39f2ea2~OPFoQnT6Y0304403044euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274076;
 bh=tZ2wXW4noUBlPoorQ0MFGiULFC/VpBEDue4E592LuQY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y2btqlMv5PDgBe1orEmZG4+yhHHbTOv9OtWx6Zj4Cam6Ty7xqKIb4dk3tPm6cFs8B
 UTHbkm6P+ezQtR/9RR51YVlU0jHwZ71wEdEzSV4hNA9lbsAbD5v4l1/FkJi79IJCQE
 uJuVQDLElG6ighkN4SfcpGNeZBzmzsvRVUD4aFfs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200512090115eucas1p2ad34cb9a159d957144d163c6dad1627f~OPFoDm9AG2563025630eucas1p2v;
 Tue, 12 May 2020 09:01:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 1A.6B.60698.BD56ABE5; Tue, 12
 May 2020 10:01:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200512090115eucas1p25e71b29fa935e53e4c04f9b3789a09fc~OPFnyxIz-2091220912eucas1p2x;
 Tue, 12 May 2020 09:01:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200512090115eusmtrp19bf0e4ed1b9272d4e4901565e5c778cf~OPFnsn47k0183401834eusmtrp1g;
 Tue, 12 May 2020 09:01:15 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-1c-5eba65dbcf05
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D5.F2.07950.BD56ABE5; Tue, 12
 May 2020 10:01:15 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090114eusmtip177f89ade3cd54facdf63e61cc13a1d3a~OPFnCxWt-1352813528eusmtip1H;
 Tue, 12 May 2020 09:01:14 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/38] drm: mediatek: use common helper for a scatterlist
 contiguity check
Date: Tue, 12 May 2020 11:00:34 +0200
Message-Id: <20200512090058.14910-14-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRjHec9tR9lZpyn4siRjUWCRd+yAFyoKDvTF+hAYpE09mOWmbM40
 0Gxe0uWsFDVW1FChmrdcMnNdNCmniFY61LKZYoiN1GRe8FpbR+vb7/k//+f5P7y8JCruwSVk
 iiKDUypkqVLCEzN3r344MsZZ4oJGjEGMbqAXYVruNeNMjU6HMb/Nd1HGtjRPME/r3yOMoSOC
 WbRNIoxpahhnhiwPCGYo/xNgGt/ZBYymIJSxj/dgzNtf3/Fju9iGhw2Afb1swNh2vV3Amowl
 BNu2PIGz325ZEfZ53XV2bGsKZStGHwP25ec8gr29GcSWtRoB6zTtjaHOe0YmcakpmZwyMPqi
 56VXdQt4etWuLEeHFckD40It8CAhHQZLNqYILfAkxfQTAO0lfQK+WASwdrUf5wsngN0rc9jO
 SLnj6XbjMYBPqvuRfyOmeQfqdhF0MNTOagk3e9OFAPbohG4TSr9CYY1l7e8qLzoeDtQU4m7G
 6APQ2daLuJmio6Ghwrkd5wfrn3X+Xerh0r892tjWvwhgpf4yzyehvbQK5dkLOqytAp59YV9F
 KeYOhnQ+gJMDjQK+KAVwSHMP8K4I+HVgzXUq6TrPHzZbAnn5OKx/tCVwy5AWwdHZ3W4ZdWG5
 uRrlZQoWF4l590Gotzb9i337cXDbwsL79nD+fd4DOKz5TdwBfvr/WQYAjMCHU6vkyZwqVMFd
 DVDJ5Cq1IjkgMU1uAq7/1bdlXXoB3mwkdAGaBFIhVRzSHifGZZmqbHkXgCQq9aYKUlwSlSTL
 vsYp0+KV6lRO1QX2kJjUhwqt+XFBTCfLMrgrHJfOKXe6COkhyQODh0WMR8uwqHLF17oQdHpv
 1npEwqlim7e3o3Zf1FLwdG0nVracuF60dqLlJ2VD2tqbc9Dqs/tmjqotZE7XtIRgY70mbbFR
 Ew9nRFFnNLlDwtCDzjSH2ny3N1ihvTnSE1YkiZEH3pivCJmcWwg45zv8QLIpbIrM9N9fmTs9
 GC7FVJdkwYdQpUr2B708My5bAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xu7q3U3fFGfzsEbPoPXeSyWLjjPWs
 Fot6e1ks/m+byGxx5et7NouVq48yWSzYb23x5cpDJotNj6+xWlzeNYfN4nLzRUaLtUfusls0
 tRhb3L13gsXi4IcnrA78HmvmrWH02PttAYvHzll32T02repk89j+7QGrx/3u40wem5fUe9z+
 95jZY/KN5Yweu282sHn0/zXw6NuyitHj8ya5AN4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0j
 E0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYw9Sz6yFkzjr3i1/zhTA+M9ni5GTg4JAROJSa9W
 soLYQgJLGSXunXaFiMtInJzWwAphC0v8udbF1sXIBVTziVFi7ffbYAk2AUOJrrcQCRGBTkaJ
 ad0f2UEcZoFjzBIbH79nBqkSFoiVWPZgEpjNIqAq8Xn7SSYQm1fATmLB5M8sECvkJVZvOABW
 wwkUvz//DwvESYUSj66+ZZnAyLeAkWEVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYDxtO/Zz
 yw7GrnfBhxgFOBiVeHg7jHbGCbEmlhVX5h5ilOBgVhLhbckECvGmJFZWpRblxxeV5qQWH2I0
 BTpqIrOUaHI+MNbzSuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUw
 Hl+zoUu9xamrfmvzeSOlR/F7xWIOBCk36MeEB+/eeuPyn//OqaIzDPJYzI672nyzOPlwdpPe
 MunLl/yafC9scj64b7P/oYxJbklRt88e2txXIHzUJrqO7UJRlP7dnZKJxUd0p79m1dsafPqt
 2hVOvc8Z1x5GTjpSfjtqu+dcA5Z7P6/67tb+o8RSnJFoqMVcVJwIAB3xKbi9AgAA
X-CMS-MailID: 20200512090115eucas1p25e71b29fa935e53e4c04f9b3789a09fc
X-Msg-Generator: CA
X-RootMTR: 20200512090115eucas1p25e71b29fa935e53e4c04f9b3789a09fc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090115eucas1p25e71b29fa935e53e4c04f9b3789a09fc
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090115eucas1p25e71b29fa935e53e4c04f9b3789a09fc@eucas1p2.samsung.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use common helper for checking the contiguity of the imported dma-buf and
do this check before allocating resources, so the error path is simpler.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index b04a3c2..6c34c06 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -212,34 +212,21 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 			struct dma_buf_attachment *attach, struct sg_table *sg)
 {
 	struct mtk_drm_gem_obj *mtk_gem;
-	int ret;
-	struct scatterlist *s;
-	unsigned int i;
-	dma_addr_t expected;
 
-	mtk_gem = mtk_drm_gem_init(dev, attach->dmabuf->size);
+	/* check if the entries in the sg_table are contiguous */
+	if (drm_prime_get_contiguous_size(sg) < attach->dmabuf->size) {
+		DRM_ERROR("sg_table is not contiguous");
+		return ERR_PTR(-EINVAL);
+	}
 
+	mtk_gem = mtk_drm_gem_init(dev, attach->dmabuf->size);
 	if (IS_ERR(mtk_gem))
 		return ERR_CAST(mtk_gem);
 
-	expected = sg_dma_address(sg->sgl);
-	for_each_sg(sg->sgl, s, sg->nents, i) {
-		if (sg_dma_address(s) != expected) {
-			DRM_ERROR("sg_table is not contiguous");
-			ret = -EINVAL;
-			goto err_gem_free;
-		}
-		expected = sg_dma_address(s) + sg_dma_len(s);
-	}
-
 	mtk_gem->dma_addr = sg_dma_address(sg->sgl);
 	mtk_gem->sg = sg;
 
 	return &mtk_gem->base;
-
-err_gem_free:
-	kfree(mtk_gem);
-	return ERR_PTR(ret);
 }
 
 void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
