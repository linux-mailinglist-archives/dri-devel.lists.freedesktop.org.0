Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 396572006B1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8296EC80;
	Fri, 19 Jun 2020 10:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896AD6EC6F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:17 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103716euoutp01ab0f1cc88c47731fe095a9204db5b97b~Z66TKJbVb1849918499euoutp01q
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200619103716euoutp01ab0f1cc88c47731fe095a9204db5b97b~Z66TKJbVb1849918499euoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563036;
 bh=uHaHrVj9uEjHIe4StK4tJYVPskphxegmYKiq5klM8TA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ywpk7BzBeYG4URoO85FgwCZ6eE7ka6tKbmpPLXnvQNtmx7gNCZtrb94Si5p9QMs1g
 5eQB4DVpdg1xBGQvUFQIo3VqMYgKLoVnX4gCDv38OzfSpA0ddUQPOJekJhlNuooMlT
 ONjCTkX6eg88s2xtUd7GIny6Vmp+GZlSxIkFgcnk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200619103715eucas1p178ac18d358f7b184d050b81e0692bc0f~Z66S2WkkY0708707087eucas1p1T;
 Fri, 19 Jun 2020 10:37:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 4F.9D.05997.B559CEE5; Fri, 19
 Jun 2020 11:37:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200619103715eucas1p12d01355499fbecb8632472b1b8230e6f~Z66SdoRi91690716907eucas1p1L;
 Fri, 19 Jun 2020 10:37:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103715eusmtrp151c83cc7d772b85505181748195fd8f4~Z66Sc413D1007310073eusmtrp1H;
 Fri, 19 Jun 2020 10:37:15 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-10-5eec955b45c4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D8.1B.06017.B559CEE5; Fri, 19
 Jun 2020 11:37:15 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103714eusmtip2a2a161e08a6c2f452a3d0a0868c0a625~Z66R25A5u0247402474eusmtip2f;
 Fri, 19 Jun 2020 10:37:14 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 32/36] misc: fastrpc: fix common struct sg_table related
 issues
Date: Fri, 19 Jun 2020 12:36:32 +0200
Message-Id: <20200619103636.11974-33-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfUhTYRTGee/Hdrc2uV2lvag0WiQkaZ/EBUPUFG4QZBR9krXssknbqi0t
 Q8g0paZZzj5smJiTsrnSVKzW+tgsZ4yW2Cgro4aWqZmCVrSmtes1++93nnOe9zkcXgKlHHgk
 kaU7zOp1So1CIMbaOn69iNt54WvGsqYnK+kz3mcIPWnqENK3Kxtx+k9bOUr7vo8K6EJLo4C+
 0fAUoWseJdATPj9CN/e9wumX9ioBffPJeyHtHOvHk6SMrdoGmN8BE2Ae/KjBmDs/PuLMoys2
 IfOhxI0wLXXHmXdTfShT0XMdMPff5AuYslYrYMab56dLdojX7GM1WTmsfmniHrG6+PkH/KCP
 PPr653ssH4xJjUBEQHIVDHbbUSMQExRZD6ClohfjiwkArZ7ATDEOYEv7KeSfpfpKP8YxRV4H
 0GPdNOv4OFQq5BoCcjk0jhgFHEeQRQB2npFwQyg5hMDqqtM41wgnN0Or/9o0Y+Qi6O4MTLOU
 TIQ9Zp+QT5PDhqbHKMeikD580olzD0HSK4S206aZlVLhoNeM8xwOh9ytM+Zo6KkoxXhDIYB+
 700hX5QC+LKgEvBTCbDXGwjtSoT2Wwwb7Ut5ORkWOhpwToZkGOwZmcvJaAhNbZdQXpbCU8UU
 Px0Dze5bs7HOrm6UZwZee2ZB+AuVA/gpYEHOAbn5f1gNAFYgY7MNWhVrWKFjj8QblFpDtk4V
 n3lA2wxCf8oz5Z64C+zBvS5AEkAhkX7ZPJxB4cocQ67WBSCBKiKkKc89GZR0nzL3GKs/sFuf
 rWENLhBFYAqZdGXt4C6KVCkPs/tZ9iCr/9dFCFFkPohqcm81p/YaI3x5LrVKU5Z2vyh6nfxb
 1YZdWme1LPFqYM69gdWWAknXZ7AkSVf+dpstOKU+Kqpb+DnTYhOHRdePTra2L9gyTyZxCM+n
 nUB+Fl9eHabIM629WBITGaScmpRNqapAip8dWL+d6FTE1cYmPJQf2thR1udIP6dJPqvADGrl
 8lhUb1D+BZXP3jBPAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsVy+t/xe7rRU9/EGRx+I2PRe+4kk8XfScfY
 LTbOWM9q8X/bRGaLK1/fs1k0L17PZrFy9VEmiwX7rS2+XHnIZLHp8TVWi8u75rBZrD1yl93i
 4IcnrA68HmvmrWH0+P1rEqPH3m8LWDy2f3vA6rF/7hp2j/vdx5k8Ni+p97j97zGzx+Qbyxk9
 dt9sYPPo27KK0ePzJrkAnig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07
 m5TUnMyy1CJ9uwS9jLaz91kLrghUXP9+l6WB8QNvFyMnh4SAicS8uU9Yuhi5OIQEljJKfPiz
 lA0iISNxcloDK4QtLPHnWhcbRNEnRomXZ0+xgyTYBAwlut5CJEQEOhklpnV/ZAdxmAU+MUkc
 uXYabJSwQJDEnvv/wDpYBFQljp/4BTaWV8BO4sasK+wQK+QlVm84wAxicwLFX7ccBKsRErCV
 WL7gPfMERr4FjAyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAuNm27GfW3Ywdr0LPsQowMGo
 xMP7IuR1nBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMZoCHTWRWUo0OR8Y
 03kl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhjlXzWHHJ+mOOdG
 9Py/B5+2Rln7OZ7NemSlEL7oe5e4/7QdLJucOOWFuc6ZtRwreVLzsDa5RfrqWYtYpxkrr8YJ
 Trn8KEpAsSXm56FD33mZ8wRi/f4W8jT9vNJW9fxixFOJHcqRv5s11pecbxMtemPNaKnW4db0
 7g0z+15l4a63Ydfdrnb0X1ZiKc5INNRiLipOBAD1t5sVsQIAAA==
X-CMS-MailID: 20200619103715eucas1p12d01355499fbecb8632472b1b8230e6f
X-Msg-Generator: CA
X-RootMTR: 20200619103715eucas1p12d01355499fbecb8632472b1b8230e6f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103715eucas1p12d01355499fbecb8632472b1b8230e6f
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103715eucas1p12d01355499fbecb8632472b1b8230e6f@eucas1p1.samsung.com>
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
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7939c55daceb..9d6867749316 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -518,7 +518,7 @@ fastrpc_map_dma_buf(struct dma_buf_attachment *attachment,
 
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
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
