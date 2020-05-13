Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B65D1D154F
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555196EA58;
	Wed, 13 May 2020 13:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961926EA39
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133323euoutp012991fa79f52e099976628e31137336a1~Omcge4VEw2140621406euoutp01h
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200513133323euoutp012991fa79f52e099976628e31137336a1~Omcge4VEw2140621406euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376803;
 bh=hOzGkgpVRp2q9xhBCeReDI8efbS4p6KRDxcNYVfdqtg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d1QCE1dbOu9qpg2J5H3w2QFe5aAyLvIF/UO3TcglgArXlWv1MlRUbV9oct3H9FLPk
 1Vye7s+r+KLtx54gWEDQk4osqg73tclkx2tTLYvfr9auEPYw3OH56tK+Yqphm90qDi
 v83XRLSFc1l1vBEIvQGGxwVtbrhWcW6nfm9KmwUE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200513133322eucas1p2dbe519154c03fde5530af20217ac43de~Omcf9-RMn1009610096eucas1p2Y;
 Wed, 13 May 2020 13:33:22 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 9A.D5.61286.227FBBE5; Wed, 13
 May 2020 14:33:22 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133322eucas1p19b55463a3926b7c1459034f2b02969f8~OmcfkTlCl2350723507eucas1p1I;
 Wed, 13 May 2020 13:33:22 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133322eusmtrp13bf97a83c6a7a5b8cd4399e120fb1623~OmcfjpEg_1050710507eusmtrp1Y;
 Wed, 13 May 2020 13:33:22 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-84-5ebbf722cea0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 76.2A.08375.227FBBE5; Wed, 13
 May 2020 14:33:22 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133321eusmtip1eb9262652eba999cc1b5ed2ab52d1b40~Omce42SCY0693306933eusmtip1M;
 Wed, 13 May 2020 13:33:21 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 34/38] misc: fastrpc: fix common struct sg_table related
 issues
Date: Wed, 13 May 2020 15:32:41 +0200
Message-Id: <20200513133245.6408-34-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTURzHObu7u9ex5W0KHqwUJiZGqcOCS1oUhN0IIkIDDbWZ1we6Kbtq
 2T+JYrj5Sk0ydSpqWD7STM3U8Jk6hysfmK80tbQUK3y3zNq80/77/j7n8zu/H4eDI6IW1BoP
 lUfRCrk0XMzjcxu6f+lOiDeb/Vymkx3JVJ2GQ/7J7MbIFznVKPm3IQMhh9d/8MiEkmoe+azi
 LYcsanUj14ZnOGTt3AhKDjXl88iqro8Y2f7zM3pOSFUWVALqtz4TUG82irjUq41PKNWqrsSo
 6eQeDvWy9B41sTOHUFmjZYBqHovjUWl15YBarbW5KvDhuwfS4aExtML57E1+SG68HotMF935
 ujWBxoGH5ipghkPiJExefI2oAB8XEU8B7J+fx9hiDcCmgXTAFqsA9mV0Ynstbcokk1UGYIm2
 F9lvGZ4tQo0Wj5BA1bKKZ8yWRCKAvakCo4QQixxYkK/clSwIT5jfWGOQcJxL2MOq1SAjFhJn
 4GzCEoedZgsratoQYzYz8MXJVq7xHkjoMFi80M9jpQtw6ks3wmYLuNhTZ1r1MNRmpZgaEgCc
 0VVhbJEC4FB8DmAtNzip0+9ugRCOsLrJmcXnoWpdzzFiSByAo8sHjRgxxMyGRwiLhTDpvoi1
 j8Lcnuf7Y9vfD5rWoWDXE6XpGTsBrN8c5D4Atrn/hxUBUA6s6GhGFkwzEjl924mRyphoebDT
 rQhZLTD8Ke1Oz0ojWB8M6AAEDsQCITne7CdCpTFMrKwDQBwRWwqvVBuQMFAae5dWRPgrosNp
 pgMcwrliK6Fr8TdfEREsjaLDaDqSVuydcnAz6zhgU/H4e5DttYBVv16vzaqNi14Owa6ppbZY
 UHOYJv/yBwEarWz0sTte4xEbC2e9004PSS75ZjFrfeqggfHrWdpw837obZ5IukTWF2aEZWuW
 7CSeY+7beQteNxQr6nRBWOn4VosDMZE9kjd6PWrK44hmu9DT2t/uVGO22l7v9m5OzGVCpJJj
 iIKR/gOYlM9tTwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsVy+t/xu7pK33fHGXTu5rPoPXeSyeLvpGPs
 FhtnrGe1+L9tIrPFla/v2SyaF69ns1i5+iiTxYL91hZfrjxkstj0+BqrxeVdc9gs1h65y25x
 8MMTVgdejzXz1jB6/P41idFj77cFLB7bvz1g9dg/dw27x/3u40wem5fUe9z+95jZY/KN5Ywe
 u282sHn0bVnF6PF5k1wAT5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
 TUpqTmZZapG+XYJexqymX+wF/UIVL37cZm1gnMLfxcjJISFgInGgs4O9i5GLQ0hgKaPE6iXH
 2SASMhInpzWwQtjCEn+udbFBFH1ilDi39TM7SIJNwFCi6y1EQkSgk1FiWvdHsFHMAp+YJI5c
 Ow02SlggSGLulElMXYwcHCwCqhJrP6eBhHkFbCUeNb9mgtggL7F6wwFmEJsTKP7qzn4WEFtI
 IF9i7+J9bBMY+RYwMqxiFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjJptx35u3sF4aWPwIUYB
 DkYlHl6LW7vjhFgTy4orcw8xSnAwK4nw+q0HCvGmJFZWpRblxxeV5qQWH2I0BbppIrOUaHI+
 MKLzSuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwGlhOrvJftebF
 40Qrl6Jn7UtSFiheqSgUNH0pcI57z5MPJdEFXQuWhnc59W6oTjv1WVdUuqWzaJXGHJ3tM5Pf
 PtvadmdVMYvus5Y1NStyDpb8u+jqaM3naZr2xFD3weSFp9JbOJP/Sb6v2LFF9ymratK9q6L3
 fkxUyPV97eX7k8V+n2/fM76ZSizFGYmGWsxFxYkAFhuED7ACAAA=
X-CMS-MailID: 20200513133322eucas1p19b55463a3926b7c1459034f2b02969f8
X-Msg-Generator: CA
X-RootMTR: 20200513133322eucas1p19b55463a3926b7c1459034f2b02969f8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133322eucas1p19b55463a3926b7c1459034f2b02969f8
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133322eucas1p19b55463a3926b7c1459034f2b02969f8@eucas1p1.samsung.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index e3e085e..0b5b927 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -518,7 +518,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 
 	table = &a->sgt;
 
-	if (!dma_map_sg(attachment->dev, table->sgl, table->nents, dir))
+	if (!dma_map_sgtable(attachment->dev, table, dir, 0))
 		return ERR_PTR(-ENOMEM);
 
 	return table;
@@ -528,7 +528,7 @@ static void fastrpc_unmap_dma_buf(struct dma_buf_attachment *attach,
 				  struct sg_table *table,
 				  enum dma_data_direction dir)
 {
-	dma_unmap_sg(attach->dev, table->sgl, table->nents, dir);
+	dma_unmap_sgtable(attach->dev, table, dir, 0);
 }
 
 static void fastrpc_release(struct dma_buf *dmabuf)
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
