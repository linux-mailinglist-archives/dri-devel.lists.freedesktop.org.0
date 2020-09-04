Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7879325D9FA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B239E6E320;
	Fri,  4 Sep 2020 13:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76DB6E30C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:08 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133507euoutp02157ac2492053797b1291f4286a07f7b1~xmAkcUNTP2890028900euoutp02r
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200904133507euoutp02157ac2492053797b1291f4286a07f7b1~xmAkcUNTP2890028900euoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226507;
 bh=J4cTiD2Ov/1hJwWc6LhEYhhzrX1Y8PyWVK9BxFfcGP0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E2+GPMWXYdPg6wO7u88NdFpmh7Qmxmg02AYlLLkPfUdEIAjgA9yStuveqdl11ayZ5
 v6+QLb7vDoHoY7TvWk87cYbWJ/5657D0o+qIV5+BB2AkRTQn/WwAJo6OKFna1XU6vL
 nR0ubK8cWA1KWW8DmPls1/CJlRN2w+4XEp0Ddg9M=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200904133507eucas1p15315e55ae9efc273d6a927ec4f7acb80~xmAkSXygD1681116811eucas1p1t;
 Fri,  4 Sep 2020 13:35:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 7E.39.06318.B82425F5; Fri,  4
 Sep 2020 14:35:07 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133507eucas1p197261c4a609b4034f9269f9b413ed5e7~xmAj-y_tE0113901139eucas1p13;
 Fri,  4 Sep 2020 13:35:07 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200904133507eusmtrp1434b8b650f1f6df000db1de47e990e94~xmAj-K42t0766507665eusmtrp1H;
 Fri,  4 Sep 2020 13:35:07 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-b4-5f52428b44f2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 98.BE.06314.A82425F5; Fri,  4
 Sep 2020 14:35:07 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133506eusmtip1dc04bed1f79290debe4a072459180c58~xmAjXC1QP1683116831eusmtip1Z;
 Fri,  4 Sep 2020 13:35:06 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 22/30] xen: gntdev: fix common struct sg_table related
 issues
Date: Fri,  4 Sep 2020 15:17:03 +0200
Message-Id: <20200904131711.12950-23-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMKsWRmVeSWpSXmKPExsWy7djP87rdTkHxBi9niFr0njvJZLFxxnpW
 i4vTW1ks/m+byGxx5et7NouVq48yWSzYb20x56aRxZcrD5ksNj2+xmpxedccNou1R+6yWxz8
 8ITV4vuWyUwOfB5r5q1h9Nj7bQGLx/ZvD1g97ncfZ/LYvKTe4/a/x8wek28sZ/Q4/OEKi8fu
 mw1sHh+f3mLx6NuyitFj/ZarLB6fN8kF8EZx2aSk5mSWpRbp2yVwZbx5t5mt4KRYRdPjRvYG
 xi1CXYycHBICJhJ7rk5g7GLk4hASWMEosbRtFQuE84VRov9WJ5TzmVFiwd12JpiWuRfusEMk
 ljNKrLxyH6Hl4+sFYFVsAoYSXW+72EBsEYFWRokTvTwgRcwC3cwSU9euYgVJCAsES7y+OJ0Z
 xGYRUJW4dfMYkM3BwStgJ/HiDtQ2eYnVGw6AlXAChbfOeMIKMkdC4Ba7RNOyfqgiF4kz0xvZ
 IGxhiVfHt7BD2DISpyf3sEA0NDNKPDy3lh3C6WGUuNw0gxGiylrizrlfbCCbmQU0Jdbv0gcx
 JQQcJb5OFoEw+SRuvBUEKWYGMidtm84MEeaV6GiDhqOaxKzj6+C2HrxwCarEQ+La73JI8Exk
 lOhoesY2gVF+FsKqBYyMqxjFU0uLc9NTi43zUsv1ihNzi0vz0vWS83M3MQKT1ul/x7/uYNz3
 J+kQowAHoxIPL4N9ULwQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KLDzFKc7Ao
 ifMaL3oZKySQnliSmp2aWpBaBJNl4uCUamCcerHJ2NbletDuteHOt9PUY4+t9u3ZHBS6cPf1
 c7oR7brv/sfLNipypMrtyha636fuzXVbQyrG5qP3w3yzDWJ/GxqnXL9XF+a8MejC3pUv2gWf
 Ln34+JXP3p0Ov4yWP7PO+bdje820d6fanzPNSV4stvRejehW5vBMtalpp2fUtx26ue6C0fYy
 JZbijERDLeai4kQA21QidVYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xu7rdTkHxBhOnMlr0njvJZLFxxnpW
 i4vTW1ks/m+byGxx5et7NouVq48yWSzYb20x56aRxZcrD5ksNj2+xmpxedccNou1R+6yWxz8
 8ITV4vuWyUwOfB5r5q1h9Nj7bQGLx/ZvD1g97ncfZ/LYvKTe4/a/x8wek28sZ/Q4/OEKi8fu
 mw1sHh+f3mLx6NuyitFj/ZarLB6fN8kF8Ebp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZ
 GpvHWhmZKunb2aSk5mSWpRbp2yXoZbx5t5mt4KRYRdPjRvYGxi1CXYycHBICJhJzL9xh72Lk
 4hASWMoo0XXxAxNEQkbi5LQGVghbWOLPtS42iKJPjBL7bt5jB0mwCRhKdL2FSIgIdDJKTOv+
 CDaKWWAys8Sz1dfBRgkLBEpM+NTOCGKzCKhK3Lp5jLmLkYODV8BO4sUdqG3yEqs3HGAGsTmB
 wltnPAHbLCRgK/FhzmKWCYx8CxgZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgTG0bZjPzfv
 YLy0MfgQowAHoxIPL4N9ULwQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KLDzGa
 At00kVlKNDkfGON5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoY
 /QI5dRNsuSde0f8Z9P3HoYtuv7K0vN4YpnLKr+pJuLWJde3Zem6WXKf9yadKZF4Ebpy3feOh
 sy7/Ki7yLuY9qrsg7N0ZhuMzbD9Ir/LdEv3jdUzrQ4EzfWFfzJ65VnwRbV2UFVw5r9n0xIzT
 Szy0mCWMou4HMPFkb8j7nmG0tfexv1C88cMyJZbijERDLeai4kQACNKhf7kCAAA=
X-CMS-MailID: 20200904133507eucas1p197261c4a609b4034f9269f9b413ed5e7
X-Msg-Generator: CA
X-RootMTR: 20200904133507eucas1p197261c4a609b4034f9269f9b413ed5e7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133507eucas1p197261c4a609b4034f9269f9b413ed5e7
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133507eucas1p197261c4a609b4034f9269f9b413ed5e7@eucas1p1.samsung.com>
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
Acked-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/gntdev-dmabuf.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index b1b6eebafd5d..4c13cbc99896 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -247,10 +247,9 @@ static void dmabuf_exp_ops_detach(struct dma_buf *dma_buf,
 
 		if (sgt) {
 			if (gntdev_dmabuf_attach->dir != DMA_NONE)
-				dma_unmap_sg_attrs(attach->dev, sgt->sgl,
-						   sgt->nents,
-						   gntdev_dmabuf_attach->dir,
-						   DMA_ATTR_SKIP_CPU_SYNC);
+				dma_unmap_sgtable(attach->dev, sgt,
+						  gntdev_dmabuf_attach->dir,
+						  DMA_ATTR_SKIP_CPU_SYNC);
 			sg_free_table(sgt);
 		}
 
@@ -288,8 +287,8 @@ dmabuf_exp_ops_map_dma_buf(struct dma_buf_attachment *attach,
 	sgt = dmabuf_pages_to_sgt(gntdev_dmabuf->pages,
 				  gntdev_dmabuf->nr_pages);
 	if (!IS_ERR(sgt)) {
-		if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
-				      DMA_ATTR_SKIP_CPU_SYNC)) {
+		if (dma_map_sgtable(attach->dev, sgt, dir,
+				    DMA_ATTR_SKIP_CPU_SYNC)) {
 			sg_free_table(sgt);
 			kfree(sgt);
 			sgt = ERR_PTR(-ENOMEM);
@@ -633,7 +632,7 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 
 	/* Now convert sgt to array of pages and check for page validity. */
 	i = 0;
-	for_each_sg_page(sgt->sgl, &sg_iter, sgt->nents, 0) {
+	for_each_sgtable_page(sgt, &sg_iter, 0) {
 		struct page *page = sg_page_iter_page(&sg_iter);
 		/*
 		 * Check if page is valid: this can happen if we are given
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
