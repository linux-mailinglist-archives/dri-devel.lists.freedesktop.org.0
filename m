Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A5A1C50F0
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E893F6E584;
	Tue,  5 May 2020 08:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154066E57E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:35 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084633euoutp02409fe8758f0fac880771098de697b136~MFXyuYXh32639926399euoutp02H
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200505084633euoutp02409fe8758f0fac880771098de697b136~MFXyuYXh32639926399euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668393;
 bh=XbOrFi14wZnLLR+D8IQye6yZyzXRz7ibxgFZt2Xt8y8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hL5JSfDcU+DCHzbwlON4/36WnmwtQhza0RHC2bCgARLmMp2RhZKAc+e0zyqjiP/1E
 glBuz9elbxgLBS8EGLKEhcrp4Y+FSuHU0sajYwt75ne7L1JIXLr4BuzKlG3L/6GC8D
 ab7TDZY/PRhoDjK8/5gupLnJe/5NTLLCa0/oEedE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200505084633eucas1p1bef72d98018191e2ab095d6b5cde6d45~MFXyiloBc0600906009eucas1p1M;
 Tue,  5 May 2020 08:46:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 26.CF.61286.9E721BE5; Tue,  5
 May 2020 09:46:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200505084633eucas1p26a6a3f44c64955aadec834bed027e522~MFXyIHf071949019490eucas1p2L;
 Tue,  5 May 2020 08:46:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084633eusmtrp153afdf239488ef4df2fa03d0ecbc82de~MFXyHcV0-0942309423eusmtrp1f;
 Tue,  5 May 2020 08:46:33 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-ad-5eb127e955d2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1C.21.07950.9E721BE5; Tue,  5
 May 2020 09:46:33 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084632eusmtip1c357efec5cd7eb62ab62b23c5f3547be~MFXxkQbKo0309503095eusmtip1v;
 Tue,  5 May 2020 08:46:32 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/25] xen: gntdev: fix common struct sg_table related
 issues
Date: Tue,  5 May 2020 10:46:05 +0200
Message-Id: <20200505084614.30424-16-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSWUwTURTldZYODcWxgrwgkaRECSqb+jEJ2GD0YyLRoPHDmIiMMkEjBdIC
 ikvEBaIFZNOACEioAVlqWWohKCrVUhFlKQVBKC5IEAxr2dxQygD+nXuWe5KbSyAiPeZMnI6I
 ZmURTLgYF6Daxh+tnsPulcE+qbWuVEpLE4+qzFZjVHtWAkr91aYjlGlmHKdKyvQ8quC5H5Xb
 s52aNn3mUVUDXRjVUZeLU6pXZj7VMPEVo+Y0mbwAe7o8vxzQ9bMFKF0z+wmjPyYZeHT1g8t0
 78IAQmd2FwP65YQJpZ/0xOP05OAHlL6lKQW0WtOJ0paqjUHCowL/UDb8dCwr85aECE615+l5
 UWrROa26C48HqWsUwJaA5E5YfuUNogACQkQ+BNCiKALcMA1gWpuBxw0WAJvfTyErkeqnv5eF
 YgA7u77xVyOD34eWXDjpCxWjCtyKHcgEAF+n2FlNCJmEwDuqUswqrCMPwbrmjKUASm6Cpg71
 4lqCEJISqGty59pcYVnFiyWL7SI9YOzDrXsg+YEPvwzOAc60F9akf8E4vA6OGDR8DrvA5sxk
 lAtcA/Bzi4rPDckAdlzNXk77wb6Wn7i1GSE9oLrOm6N3w6HEEtRKQ9Iedo+utdLIIszQZiEc
 LYQ3EkWcezPMMTxarW1oMy5fi4Zz983LB9YDaB7rw9OAa87/sgIASoETGyOXhrFy3wj2rJec
 kcpjIsK8TkZKq8DiczUvGKZqwYzxhA6QBBDbCY9Y1MEijImVx0l1ABKI2EFYNF8RLBKGMnHn
 WVnkcVlMOCvXgQ0EKnYS7igcPiYiw5ho9gzLRrGyFZVH2DrHA9U0dbtB6WPcpWMMtN/44W+X
 kEmNW1D69fz9IaFO2/r3MWZHlxcFgSmF0sB+F0wY4GbpmdQGNSkl4+7nplz9I3uJxnLil/n7
 26E5paDeJBiR5j0btgF3AySJ7xoSlZ7zDhcvCu7taT24fupPhY3DyGOPm3GOW7N9L1SMHbiA
 8MWo/BTjuwWRyZl/hn1cLlgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xu7ov1TfGGTxYz27Re+4kk8XGGetZ
 LS5Ob2Wx+L9tIrPFla/v2SxWrj7KZLFgv7XFnJtGFl+uPGSy2PT4GqvF5V1z2CzWHrnLbnHw
 wxNWi+9bJjM58HmsmbeG0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNHj8IcrLB67
 bzaweXx8eovFo2/LKkaP9Vuusnh83iQXwBulZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqln
 aGwea2VkqqRvZ5OSmpNZllqkb5egl3Fx7lGmgvVCFdvWX2NrYOzn72Lk5JAQMJHYvOcPE4gt
 JLCUUeJJkxFEXEbi5LQGVghbWOLPtS62LkYuoJpPjBLPLu8ES7AJGEp0vYVIiAh0MkpM6/7I
 DuIwC0xmlni2+jrYWGGBAIlFR64zgtgsAqoSVy6vB4pzcPAK2EkcOqkOsUFeYvWGA8wgNidQ
 +PGlO2wQFxVKfDj/nXUCI98CRoZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgVG07djPLTsY
 u94FH2IU4GBU4uHd8HV9nBBrYllxZe4hRgkOZiUR3mU/NsQJ8aYkVlalFuXHF5XmpBYfYjQF
 umkis5Rocj4wwvNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTDu
 UKrVPM4bzCF1Rs89/+CqWlVf/+m3Nz0Uq9jHW7mCn9V2sj0Dq9CK5+f/xGmdtCs6dGH2izPP
 TOpb7qtK7ZjNFStx7MMcgbuFi2JdO1N81jyVul7o5Km09tfWf99qnjaJfW/rbVdf9W+C8Uc7
 n3l/7lz0F2UIXV9mu3ebqaqBdMv2pOSXD4qUWIozEg21mIuKEwEKUxAkuAIAAA==
X-CMS-MailID: 20200505084633eucas1p26a6a3f44c64955aadec834bed027e522
X-Msg-Generator: CA
X-RootMTR: 20200505084633eucas1p26a6a3f44c64955aadec834bed027e522
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084633eucas1p26a6a3f44c64955aadec834bed027e522
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084633eucas1p26a6a3f44c64955aadec834bed027e522@eucas1p2.samsung.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of the entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. A common mistake was to ignore a result
of the dma_map_sg function and don't use the sg_table->orig_nents at all.

To avoid such issues, lets use common dma-mapping wrappers operating
directly on the struct sg_table objects and adjust references to the
nents and orig_nents respectively.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v3 00/25] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/5/187
---
 drivers/xen/gntdev-dmabuf.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 75d3bb9..4b22785 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -247,8 +247,7 @@ static void dmabuf_exp_ops_detach(struct dma_buf *dma_buf,
 
 		if (sgt) {
 			if (gntdev_dmabuf_attach->dir != DMA_NONE)
-				dma_unmap_sg_attrs(attach->dev, sgt->sgl,
-						   sgt->nents,
+				dma_unmap_sgtable_attrs(attach->dev, sgt,
 						   gntdev_dmabuf_attach->dir,
 						   DMA_ATTR_SKIP_CPU_SYNC);
 			sg_free_table(sgt);
@@ -288,7 +287,7 @@ static void dmabuf_exp_ops_detach(struct dma_buf *dma_buf,
 	sgt = dmabuf_pages_to_sgt(gntdev_dmabuf->pages,
 				  gntdev_dmabuf->nr_pages);
 	if (!IS_ERR(sgt)) {
-		if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
+		if (dma_map_sgtable_attrs(attach->dev, sgt, dir,
 				      DMA_ATTR_SKIP_CPU_SYNC)) {
 			sg_free_table(sgt);
 			kfree(sgt);
@@ -625,7 +624,7 @@ static struct gntdev_dmabuf *dmabuf_imp_alloc_storage(int count)
 
 	/* Now convert sgt to array of pages and check for page validity. */
 	i = 0;
-	for_each_sg_page(sgt->sgl, &sg_iter, sgt->nents, 0) {
+	for_each_sg_page(sgt->sgl, &sg_iter, sgt->orig_nents, 0) {
 		struct page *page = sg_page_iter_page(&sg_iter);
 		/*
 		 * Check if page is valid: this can happen if we are given
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
