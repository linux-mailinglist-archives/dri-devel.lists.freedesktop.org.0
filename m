Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433BB1CF0A7
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA856E8F5;
	Tue, 12 May 2020 09:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E5C6E8E8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090128euoutp016c41bd8b7069d64c29a1ae07d1604af7~OPF0CfyAc2629726297euoutp01m
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200512090128euoutp016c41bd8b7069d64c29a1ae07d1604af7~OPF0CfyAc2629726297euoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274088;
 bh=BArEnwlZV6yXcbVCJZm10TtidFE3Koqpc+04N057bYI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TCJGbQsufbbvzgUKGojWZ/NMRdRmmO6fayzjE+MXhJE9ckxDKLXldC5LsS0NwCe92
 G/Vku+kfIyLI0TiXMJSLmZ/SE2RQ2Wqb6WOP7Uf0EYjtAAXMPa+AxL/qAyGFqv4Z8p
 lEgSM3LeHEX3XAQw7Kkz8JLexVt0eAoMBstuTl5c=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200512090128eucas1p27fe6fe11596863115806d57d4e3a87ea~OPFzxT5Bd1372813728eucas1p2e;
 Tue, 12 May 2020 09:01:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A6.32.60679.8E56ABE5; Tue, 12
 May 2020 10:01:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200512090128eucas1p2cf31bfdca3b096585ba9f2741ef08ce0~OPFzb9Eku2110421104eucas1p2O;
 Tue, 12 May 2020 09:01:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200512090128eusmtrp1a81d3b11ff6134e7f5d1e37fb26ae025~OPFzbKWPm0183401834eusmtrp12;
 Tue, 12 May 2020 09:01:28 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-d9-5eba65e8f74e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 68.03.07950.7E56ABE5; Tue, 12
 May 2020 10:01:27 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090127eusmtip14b6982a0ff8e934c7db2200583cbc90a~OPFy6Z7r31181011810eusmtip1v;
 Tue, 12 May 2020 09:01:27 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 34/38] misc: fastrpc: fix common struct sg_table related
 issues
Date: Tue, 12 May 2020 11:00:54 +0200
Message-Id: <20200512090058.14910-34-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTURzn3Hu3XcXZbS520EhaKJXko/xwwdKEPlxKeuEnwcfUi1pOZddH
 huHwEbp8TvOVmqig+cjyrUNsQzebMJ+JPURFkTVTAx/gI2vzan77/X+P/++cw8FRwQDHHo+K
 iadlMZJoMdca69bujl0z0v1B7vVGIZlr+IyQf5RaHvmxrI1D/u0uRMnp7Q0umV7XxiXfNQ8j
 ZM2gF7k1vYiQ7UszHHKqv5JLtg7N8Uj172XObT7VUt0CqP09JaAGdmowqmdngUMNVrXwqPlX
 OoTqqE+lvh8uoVTRbAOgVF/lXCqvswlQm+0XHtoEWN8Mp6OjEmmZm3eIdeSIqQuNyxY80zYW
 Y3JQcEYBrHBIeMLCfCOqANa4gGgE8I1eCdhhC8CpsTkOO2wCmNW5zT2JZKfVI6zQAGDVQsZp
 ZGW5C7W4uIQHVKwpjhJCIhPAkVwbiwklTAisrszmWAQ7wh9qB9Q8C8YIJ7gv/4JYMJ/whvKd
 oeM6R9j84dPRUiszP//2ALMsgoSeBzdrizHWdAeO/2o6DthBk66Tx+LzcLQo5ziQDuCioZXH
 Djnm66WVAdblBX8Y9sxp3Hy+K7Ct342lfeFaq55noSFhC2fXzlpo1AyV3aUoS/Nh1ksB63aG
 Fbr3/2vV45MoiymoUJmO33EYQE2vBisAjhWnZTUANAERncBII2jmegyd5MpIpExCTIRrWKy0
 HZg/1eihbqsX9B+EagCBA7EN3929L0jAkSQyyVINgDgqFvIzoswUP1yS/JyWxQbLEqJpRgMc
 cEws4t+o/RkoICIk8fRTmo6jZScqglvZy0FOtKQndap8KWo0ySe/yku/futSx2O/8gn/dbnU
 eFFIuQRezsusVaka9nZX933vMaLcRr/clJmJ8uIHxklRsPSbwKE0xFDqXOLiFZCz2uetU50L
 9Yi975xCrvhKN+Kzwmwb/FdeiOaRoQTlvM/4ob71ruG1Z8kjpyemwGD1cJ0YYyIlHldRGSP5
 B2crIfpQAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsVy+t/xu7ovUnfFGezgs+g9d5LJ4u+kY+wW
 G2esZ7X4v20is8WVr+/ZLJoXr2ezWLn6KJPFgv3WFl+uPGSy2PT4GqvF5V1z2CzWHrnLbnHw
 wxNWB16PNfPWMHr8/jWJ0WPvtwUsHtu/PWD12D93DbvH/e7jTB6bl9R73P73mNlj8o3ljB67
 bzawefRtWcXo8XmTXABPlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1N
 SmpOZllqkb5dgl7GiVdbmQs6hSqOrZjC0sA4gb+LkZNDQsBEorNpCVMXIxeHkMBSRonfZ66w
 QiRkJE5Oa4CyhSX+XOtigyj6xCjx/eVNNpAEm4ChRNdbiISIQCejxLTuj+wgDrPAJyaJI9dO
 g1UJCwRJvFw7jwXEZhFQlfjdcJUJxOYVsJNo+HaEDWKFvMTqDQeYQWxOoPj9+X/A6oUECiUe
 XX3LMoGRbwEjwypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAqNl27OeWHYxd74IPMQpwMCrx
 8HYY7YwTYk0sK67MPcQowcGsJMLbkgkU4k1JrKxKLcqPLyrNSS0+xGgKdNREZinR5HxgROeV
 xBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamBs9csTUfGN9CrfMj38
 kdii24cSUt3Dt3tcMbl6tn7VszyObX4Cz658XTdBMM9wjc0vmznKyrmJr1+4THm/eG6rdpvt
 tFlCnE2nVy5bvK7OjKdmGaOi4snK0wIVTd8+Ks8qkrhlO7PO5onfqaSXf7cEPl55t1316+Kb
 9Qu1So1fsxTtVrjlFdmoxFKckWioxVxUnAgAqkItvLACAAA=
X-CMS-MailID: 20200512090128eucas1p2cf31bfdca3b096585ba9f2741ef08ce0
X-Msg-Generator: CA
X-RootMTR: 20200512090128eucas1p2cf31bfdca3b096585ba9f2741ef08ce0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090128eucas1p2cf31bfdca3b096585ba9f2741ef08ce0
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090128eucas1p2cf31bfdca3b096585ba9f2741ef08ce0@eucas1p2.samsung.com>
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
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
---
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index e3e085e..0a3e02aa 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -518,7 +518,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 
 	table = &a->sgt;
 
-	if (!dma_map_sg(attachment->dev, table->sgl, table->nents, dir))
+	if (!dma_map_sgtable(attachment->dev, table, dir))
 		return ERR_PTR(-ENOMEM);
 
 	return table;
@@ -528,7 +528,7 @@ static void fastrpc_unmap_dma_buf(struct dma_buf_attachment *attach,
 				  struct sg_table *table,
 				  enum dma_data_direction dir)
 {
-	dma_unmap_sg(attach->dev, table->sgl, table->nents, dir);
+	dma_unmap_sgtable(attach->dev, table, dir);
 }
 
 static void fastrpc_release(struct dma_buf *dmabuf)
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
