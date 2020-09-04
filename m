Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5090225D9CC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0FC6E2CC;
	Fri,  4 Sep 2020 13:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C9E6E2A0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:34:57 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133455euoutp01d9e4787c5506f7189b1050f9820f3116~xmAZn4QTR0569905699euoutp01R
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:34:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200904133455euoutp01d9e4787c5506f7189b1050f9820f3116~xmAZn4QTR0569905699euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226496;
 bh=9tby+eXQc9GFv9LjYLvm3k/yK9N2564i1mbZm16IiOU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g8pv8raKTnkXVqa3H07sh0PUWc+xfHZx6EGxoM+bZ11RXRqz3sWqoQTg8h4tgG8rb
 Yuy4nv5XPve/xj0XhSu8cuAuoV/xpz6tNQr1xmx+MtSMP2M+t65MaRG29Dmd2HW+68
 aEwTCLJU43UED/a0KzOQuI0ERi7ZfLqeF4n8WlWk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200904133455eucas1p2f2951946214baee213a1a55534e8cbcb~xmAZMeb3v1447714477eucas1p2K;
 Fri,  4 Sep 2020 13:34:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3F.29.06318.F72425F5; Fri,  4
 Sep 2020 14:34:55 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200904133455eucas1p27e43b99c981ff756aafcb9599e71bff7~xmAY5ya4c0143201432eucas1p2f;
 Fri,  4 Sep 2020 13:34:55 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904133455eusmtrp247c68124a363d0bab8f69d75c116f3df~xmAY2H42b0905709057eusmtrp2Y;
 Fri,  4 Sep 2020 13:34:55 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-84-5f52427f3ece
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id EB.90.06017.F72425F5; Fri,  4
 Sep 2020 14:34:55 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133454eusmtip1e69b6f8104f32e82f7a868610fe5aa01~xmAYQ8p3W1888418884eusmtip1P;
 Fri,  4 Sep 2020 13:34:54 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 03/30] drm: core: fix common struct sg_table related issues
Date: Fri,  4 Sep 2020 15:16:44 +0200
Message-Id: <20200904131711.12950-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsWy7djPc7r1TkHxBk8/y1j0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfLnykMli0+NrrBaXd81hs1h75C67xcKPW1ks2jqXsVoc
 /PCE1WLLm4msDnwea+atYfTY+20Bi8emVZ1sHtu/PWD1mHcy0ON+93Emj81L6j1u/3vM7DH5
 xnJGj903G9g8+rasYvTYfLra4/MmuQDeKC6blNSczLLUIn27BK6Mh/PLCxaqVSw9cJ+9gfG9
 fBcjJ4eEgInEhzvtzF2MXBxCAisYJa6uuc8O4XxhlHiy5iIbhPOZUeLw383MMC2/T1xigUgs
 Z5T49uQRE1zLv9mfGEGq2AQMJbredrGB2CICrYwSJ3p5QIqYBRYwS/z83AZWJCwQKLFh9QwW
 EJtFQFXizpy/YCt4BWwlZm7/ygixTl5i9YYDYHFOATuJrTOesIIMkhC4xi7xedZNFogiF4lT
 Ey9DNQhLvDq+hR3ClpH4v3M+E0RDM6PEw3Nr2SGcHkaJy00zoDqsJe6c+wV0KwfQfZoS63fp
 Q4QdJa4f2cQIEpYQ4JO48VYQJMwMZE7aNp0ZIswr0dEmBFGtJjHr+Dq4tQcvXIIGl4fEqWmT
 oSE0kVGi6V472wRG+VkIyxYwMq5iFE8tLc5NTy02zkst1ytOzC0uzUvXS87P3cQITFun/x3/
 uoNx35+kQ4wCHIxKPLwM9kHxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7E
 KM3BoiTOa7zoZayQQHpiSWp2ampBahFMlomDU6qBsU7ZKf19/+HE8q87PQMXHA9UvxximZCg
 1/VqRl/a85MbxXj1apQ/xf1msVi6SeFOwaJ/ujqygi8zLiwWnXeroSb/d6Kk9qn907X/rtt9
 kvNam4ocx4zkeyvb2CVt2IxPXVt9/Mxb79mZd5LN5ym4heoyLPv9pq1zvfQrg2MxO98/vS/u
 zBzxW4mlOCPRUIu5qDgRAFtR+SJXAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xu7r1TkHxBvOnsVv0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfLnykMli0+NrrBaXd81hs1h75C67xcKPW1ks2jqXsVoc
 /PCE1WLLm4msDnwea+atYfTY+20Bi8emVZ1sHtu/PWD1mHcy0ON+93Emj81L6j1u/3vM7DH5
 xnJGj903G9g8+rasYvTYfLra4/MmuQDeKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj
 81grI1MlfTublNSczLLUIn27BL2Mh/PLCxaqVSw9cJ+9gfG9fBcjJ4eEgInE7xOXWLoYuTiE
 BJYySiz4co4RIiEjcXJaAyuELSzx51oXG0TRJ0aJ9R8/M4Mk2AQMJbreQiREBDoZJaZ1f2QH
 cZgFVjBLvNo3lwWkSljAX+LnlAlsIDaLgKrEnTl/wbp5BWwlZm7/CrVOXmL1hgNgcU4BO4mt
 M56ArRYCqvkwZzHLBEa+BYwMqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQKjaNuxn1t2MHa9
 Cz7EKMDBqMTDy2AfFC/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4ymQEdN
 ZJYSTc4HRnheSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQZGwx2L
 S/auLzF4lLN+R4/yCVnZ08+PBuyZpxbWo1S5iHfR1I7vwafb3wkn6Maqnty1/evVZ/0HvzEY
 2roIebrcmTzp559ZTFknLQM3R7I/ScoOiGKM3+LkP/Om85TVMsFSmqt1hZz/h9+MOWh43kxN
 2aRrmp/MhPn5Z5N/LWz5fuJI+8lZD/x4lViKMxINtZiLihMBFhrwHLgCAAA=
X-CMS-MailID: 20200904133455eucas1p27e43b99c981ff756aafcb9599e71bff7
X-Msg-Generator: CA
X-RootMTR: 20200904133455eucas1p27e43b99c981ff756aafcb9599e71bff7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133455eucas1p27e43b99c981ff756aafcb9599e71bff7
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133455eucas1p27e43b99c981ff756aafcb9599e71bff7@eucas1p2.samsung.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
returns the number of the created entries in the DMA address space.
However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
dma_unmap_sg must be called with the original number of the entries
passed to the dma_map_sg().

struct sg_table is a common structure used for describing a non-contiguous
memory buffer, used commonly in the DRM and graphics subsystems. It
consists of a scatterlist with memory pages and DMA addresses (sgl entry),
as well as the number of scatterlist entries: CPU pages (orig_nents entry)
and DMA mapped pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, calling DMA-mapping functions with a wrong number of entries or
ignoring the number of mapped entries returned by the dma_map_sg()
function.

To avoid such issues, lets use a common dma-mapping wrappers operating
directly on the struct sg_table objects and use scatterlist page
iterators where possible. This, almost always, hides references to the
nents and orig_nents entries, making the code robust, easier to follow
and copy/paste safe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/drm_cache.c            |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c | 14 +++++++++-----
 drivers/gpu/drm/drm_prime.c            | 11 ++++++-----
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 03e01b000f7a..0fe3c496002a 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -127,7 +127,7 @@ drm_clflush_sg(struct sg_table *st)
 		struct sg_page_iter sg_iter;
 
 		mb(); /*CLFLUSH is ordered only by using memory barriers*/
-		for_each_sg_page(st->sgl, &sg_iter, st->nents, 0)
+		for_each_sgtable_page(st, &sg_iter, 0)
 			drm_clflush_page(sg_page_iter_page(&sg_iter));
 		mb(); /*Make sure that all cache line entry is flushed*/
 
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 4b7cfbac4daa..47d8211221f2 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -126,8 +126,8 @@ void drm_gem_shmem_free_object(struct drm_gem_object *obj)
 		drm_prime_gem_destroy(obj, shmem->sgt);
 	} else {
 		if (shmem->sgt) {
-			dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
-				     shmem->sgt->nents, DMA_BIDIRECTIONAL);
+			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
+					  DMA_BIDIRECTIONAL, 0);
 			sg_free_table(shmem->sgt);
 			kfree(shmem->sgt);
 		}
@@ -424,8 +424,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_object *obj)
 
 	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
 
-	dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
-		     shmem->sgt->nents, DMA_BIDIRECTIONAL);
+	dma_unmap_sgtable(obj->dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
@@ -697,12 +696,17 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj)
 		goto err_put_pages;
 	}
 	/* Map the pages for use by the h/w. */
-	dma_map_sg(obj->dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret)
+		goto err_free_sgt;
 
 	shmem->sgt = sgt;
 
 	return sgt;
 
+err_free_sgt:
+	sg_free_table(sgt);
+	kfree(sgt);
 err_put_pages:
 	drm_gem_shmem_put_pages(shmem);
 	return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index c5e796d4a489..b8c7f068a5a4 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -617,6 +617,7 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct sg_table *sgt;
+	int ret;
 
 	if (WARN_ON(dir == DMA_NONE))
 		return ERR_PTR(-EINVAL);
@@ -626,11 +627,12 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 	else
 		sgt = obj->dev->driver->gem_prime_get_sg_table(obj);
 
-	if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
-			      DMA_ATTR_SKIP_CPU_SYNC)) {
+	ret = dma_map_sgtable(attach->dev, sgt, dir,
+			      DMA_ATTR_SKIP_CPU_SYNC);
+	if (ret) {
 		sg_free_table(sgt);
 		kfree(sgt);
-		sgt = ERR_PTR(-ENOMEM);
+		sgt = ERR_PTR(ret);
 	}
 
 	return sgt;
@@ -652,8 +654,7 @@ void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 	if (!sgt)
 		return;
 
-	dma_unmap_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
-			   DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sgt);
 	kfree(sgt);
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
