Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5051D1526
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BF86EA3E;
	Wed, 13 May 2020 13:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97C66EA2A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:03 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133302euoutp02316237c4ef684da210b2dbb4c8c580db~OmcNQAw8l3219432194euoutp02p
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200513133302euoutp02316237c4ef684da210b2dbb4c8c580db~OmcNQAw8l3219432194euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376782;
 bh=Y3Ut1ToGHUzDuHty6PKvQvWWCbWEQibieCAmIQZoNYY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zna+bq8f4F1yKKhjhy6IiKT5tqvfOylN6Dd+VCCoc4cc0VYJ/OUvdXL5UZg4eW4qE
 MkATLuCZh/xvTkTvw1FZao3M0x3Pjbm9pI6bm1NhOHz2zHuF3idsqc1MdHQG9yeSVM
 ZBdpkiuopSsDwOh4uzRdmmxgYF94e+LTbzmGaVtE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200513133302eucas1p2d79ae1c80ae6d1dba237b1505033373b~OmcM65dzq0359403594eucas1p2T;
 Wed, 13 May 2020 13:33:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id DF.C8.60698.E07FBBE5; Wed, 13
 May 2020 14:33:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200513133301eucas1p28c059d25e488ed5ec10feb8f414a1af2~OmcMooeKf2972529725eucas1p26;
 Wed, 13 May 2020 13:33:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133301eusmtrp11a8f6059fe0dd13159bee8d29db5dee6~OmcMn5gIh1011910119eusmtrp1y;
 Wed, 13 May 2020 13:33:01 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-b8-5ebbf70edf04
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B3.37.07950.D07FBBE5; Wed, 13
 May 2020 14:33:01 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133301eusmtip1afa7a07517696ee6065475ad21a65ac3~OmcL-x7aM0693306933eusmtip17;
 Wed, 13 May 2020 13:33:01 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/38] drm: armada: fix common struct sg_table related
 issues
Date: Wed, 13 May 2020 15:32:15 +0200
Message-Id: <20200513133245.6408-8-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfSxVYRzHe845997j5tpxKU9U5m610bwN22leqq21kz968Yc/VHRwhsV1
 dy/CWq5ECCOzMCFZyut1s1t5u2/lZsr7hCimbJiX8rZaqXsd9N/n932+3+f727MHR4VKji0e
 JY5jpGI6WsTlY6qun33OFpttwW5KlQWZ29uNkM3FTRzyr6oAJYfXl7nk87q3CFmp9ibXhqcR
 UjkzwiGHWsu4pK6oA5ANbyZ5pHblK+e0OVVfXg+ooZEBlOrYqMSolxtTHOrLfQNCvahOoT5t
 zaBU4WgNoNrG5Fwqr6UWUKvKo5f2B/F9wpnoqARG6up3nR/5aFCJSHIOJS4YUoEcjFtnAzMc
 Ep6wJX8MzQZ8XEg8A7C17x6XHdYAVKvuIiaXkFgFUN4YtJso38jaMdUA+EFXwdtLbD4u2E5w
 CXeYvZjNNbE1kQ7gu1xzkwklNAjMWFrYNlkRAfB9jgIzMUYcg5mzGp6JBYQPnCxRoGydPaxT
 aLbZjPCF8xNqzHQRJDp5sLJEi7Cms7C6aJ7LshWcN7TwWD4MewpzdgJpAE73NvDYIQfAoTvF
 gHV5w4neX8Y0btzPETa1urLyGZg18BQzyZCwgKOLliYZNeID1UOUlQUwM0PIuo/DUkPjXq22
 f3Bnfwqqqyo47AvpAdSq+9F8YF/6v6wSgFpgw8TLYiIYmYeYuekio2Nk8eIIl7DYGCUw/qSe
 LcP6K9D5O1QHCByIzAVTH9uChRw6QZYUowMQR0XWggtNRkkQTiclM9LYEGl8NCPTATscE9kI
 PKrmrgmJCDqOucEwEka6e4rgZrZyYOkeR7a/tm3lL59XJHZp/LfaQ+0DLjZ4+nv5epR5VU2K
 6+0CVujxcuUfidstxzwnsVCb9jngambghF7fnfIt+VLfj33TB5ynHMSSk70pWLzDKfURW8V3
 hVVeSEH65Sup55aKZjNg+3xzmH7h9twG9SREfZA+0b1c5Tfd1y6XBIowWSTt7oRKZfQ/Tb2g
 k0UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsVy+t/xu7q833fHGVxptrDoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZnFo6l5Gi7VH7rJbHPzwhNWB
 x2PNvDWMHpevXWT22PttAYvH9m8PWD3udx9n8ti8pN7j9r/HzB6Tbyxn9Nh9s4HNo2/LKkaP
 z5vkArij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S
 9DLmXtrEVNAjWfH6eCNjA+MtkS5GTg4JAROJed862boYuTiEBJYySqya94kRIiEjcXJaAyuE
 LSzx51oXVNEnRomuhinMIAk2AUOJrrcQCRGBTkaJad0f2UEcZoFjTBILf31kAakSFgiQ+Ntx
 gw3EZhFQleh4doAdxOYVsJG4O3MDM8QKeYnVGw6A2ZwCthKv7uwH6xUSyJfYu3gf2wRGvgWM
 DKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECY2TbsZ9bdjB2vQs+xCjAwajEw2txa3ecEGti
 WXFl7iFGCQ5mJRFev/VAId6UxMqq1KL8+KLSnNTiQ4ymQEdNZJYSTc4Hxm9eSbyhqaG5haWh
 ubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQZGr+nS7pItDGyZTr/fMJxsNlnvU/rh
 2edzvLXGD0WuqF38e/G+3upTj+qcZctk7FXOZRidqXrlntzRI7WF24Z7YQrD7xN7pXmDAy+2
 Rrcyb311SeJk+QG+fT+OXH5ht7WWx+fDx/ZlG9TqTmhvd1Ddy5L9VUpmv1R39k/1JuFw8xxu
 34/tNb+UWIozEg21mIuKEwFSansSpwIAAA==
X-CMS-MailID: 20200513133301eucas1p28c059d25e488ed5ec10feb8f414a1af2
X-Msg-Generator: CA
X-RootMTR: 20200513133301eucas1p28c059d25e488ed5ec10feb8f414a1af2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133301eucas1p28c059d25e488ed5ec10feb8f414a1af2
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133301eucas1p28c059d25e488ed5ec10feb8f414a1af2@eucas1p2.samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
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
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/armada/armada_gem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 976685f..0d61da5 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -395,7 +395,7 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 
 		mapping = dobj->obj.filp->f_mapping;
 
-		for_each_sg(sgt->sgl, sg, count, i) {
+		for_each_sgtable_sg(sgt, sg, i) {
 			struct page *page;
 
 			page = shmem_read_mapping_page(mapping, i);
@@ -407,8 +407,8 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 			sg_set_page(sg, page, PAGE_SIZE, 0);
 		}
 
-		if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0) {
-			num = sgt->nents;
+		if (dma_map_sgtable(attach->dev, sgt, dir, 0)) {
+			num = count;
 			goto release;
 		}
 	} else if (dobj->page) {
@@ -418,7 +418,7 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 
 		sg_set_page(sgt->sgl, dobj->page, dobj->obj.size, 0);
 
-		if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0)
+		if (dma_map_sgtable(attach->dev, sgt, dir, 0))
 			goto free_table;
 	} else if (dobj->linear) {
 		/* Single contiguous physical region - no struct page */
@@ -449,11 +449,11 @@ static void armada_gem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
 	int i;
 
 	if (!dobj->linear)
-		dma_unmap_sg(attach->dev, sgt->sgl, sgt->nents, dir);
+		dma_unmap_sgtable(attach->dev, sgt, dir, 0);
 
 	if (dobj->obj.filp) {
 		struct scatterlist *sg;
-		for_each_sg(sgt->sgl, sg, sgt->nents, i)
+		for_each_sgtable_sg(sgt, sg, i)
 			put_page(sg_page(sg));
 	}
 
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
