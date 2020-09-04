Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E4825D9EA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517F16E354;
	Fri,  4 Sep 2020 13:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CB06E32D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:11 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133509euoutp02e789fd3f87193d707b10cbcbb8b51d3c~xmAmdzg322890128901euoutp02w
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200904133509euoutp02e789fd3f87193d707b10cbcbb8b51d3c~xmAmdzg322890128901euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226509;
 bh=oVvlfd4BWRvKpcZfemLuoBrPFcZ7vE33qi6qHPEMJzU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bZADD3NM1w2tJ2pTaO2nxdL24Nio2jCAVdnMNdQkCm6Spbn9RhHVfdeZtgwrEn9nV
 YQVs0NbCaOCupXqW+Vn7OBKd/uI7/5/NgwOBnwtvubCvayOZci0yfItTVSc3yYRiLQ
 UP9pFUz9eoY9xaIQwYhYPUAznm2RbFdX5pPCMOl8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200904133509eucas1p2cdcfff47365ce2abf05a67b3cfd98d59~xmAmJPvH90781307813eucas1p2D;
 Fri,  4 Sep 2020 13:35:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 40.76.05997.D82425F5; Fri,  4
 Sep 2020 14:35:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200904133509eucas1p23ae97afc5f53f7d84e7f0183803ec483~xmAlyscfu1446814468eucas1p2o;
 Fri,  4 Sep 2020 13:35:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200904133509eusmtrp18a2e515d0fff9afa972ff974ba8cdad1~xmAlyB8xp0766507665eusmtrp1L;
 Fri,  4 Sep 2020 13:35:09 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-79-5f52428d1da2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id FB.BE.06314.C82425F5; Fri,  4
 Sep 2020 14:35:08 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133508eusmtip184c2d322fe339707e2360f80c5b8e05d~xmAlICjeq1926319263eusmtip1f;
 Fri,  4 Sep 2020 13:35:08 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 25/30] dmabuf: fix common struct sg_table related issues
Date: Fri,  4 Sep 2020 15:17:06 +0200
Message-Id: <20200904131711.12950-26-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa2xLYRj29VzXKEcNn+ukwULmNhJHsLKIfD/8ED8QCXM2Z91i7Wi3uSRo
 LFhqc5nLanHpZDLTYXapqcu0UV1VS7oRrc7GGjLZMtGq+6bHKf497/O8z/c8efPRmPwxMYHO
 1RTwWg2XpyCluOXRN+/ssvS1GfMspjFsmdclYW8abxBsf9cdgh2ynMDYjs8DJFtrdkhYU+sS
 9l3AhbGRjjcStqHnBcG2W8+RbGl9M8Fee9hJsbaPIYJ93Bmmlo9EB32/SFR3oQ6ge1ETjoIv
 7pLoVrSbQF1HnBLUWL0fvRrswdDJlzUA3fHrSTRw/zmJjjZdBSjcMGWNbKN06VY+L7eI185N
 2yLNGfI8obYfn7ir3tQq0QPrWANIoCGzEL597QcGIKXlzBUAqxwmQhwiAIbvdeHiEAbQ774i
 +Wupth2LCzUAetqMlCD8sVQeTREwycyHhn4DKeBE5iCAbWXDBQPGODAYOFyFC8JoZjXsKw7G
 XqVpnJkOP15KFmgZkwZ7HF9xMSwJmusfYAJOiPHNxtCfepB5S0G3qzfeaCU8HGzERDwafnA2
 USKeBN0nS3HRUAzgG+81ShxKAWw/YATi1hIY9H4nhRYYMxPesM4V6RXwfF0/JtCQGQFf9o8S
 aCwGyy0VcVoGSw7Jxe0ZsNJ5/V+s7ZkvXgdB88CP+LFOAFhe3AuOg6TK/2EmAK6CcXyhTq3i
 dakafuccHafWFWpUc7Ly1Q0g9sPcg85IC7D+zLQDhgaK4bJhyrUZcoIr0u1W2wGkMUWiLN3j
 3iyXbeV27+G1+RnawjxeZwcTaVwxTrbgUu8mOaPiCvhtPL+d1/5VJXTCBD1Y9KQ6975mWrJ+
 VWjF+MbWVMLMjHXYle8fbXH1lVxWcfuGPPMyP6d9UoYCG7XLyhcP3lRuwKaeyvIZK6I2uKEv
 snfx2WxE5ei/XexekPKwVhVdhtYl3U7KSl4/s2ZaoFb56TQ35pxt0alneP6OyVMOTVeXfFnq
 zza2PD1T4GOJkALX5XDzZ2FaHfcbzYpBcV0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xu7o9TkHxBh/6rC16z51kstg4Yz2r
 xdv7u1kt/m+byGxx5et7NouVq48yWSzYb23x7NZJZosvVx4yWWx6fI3V4vKuOWwWPRu2slqs
 PXKX3eLghyesFqfufmZ34PdovfSXzWPNvDWMHnu/LWDxuHNtD5vH9m8PWD3udx9n8ti8pN7j
 9r/HzB6Tbyxn9Nh9s4HN4/2+q2wefVtWMXp83iQXwBulZ1OUX1qSqpCRX1xiqxRtaGGkZ2hp
 oWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl/H/7Bn2ggnSFRsW7GdqYNwl1sXIySEhYCKx
 5GA/SxcjF4eQwFJGieb/99ghEjISJ6c1sELYwhJ/rnWxQRR9YpRY8/QMM0iCTcBQoustREJE
 oJNRYlr3R3YQh1ngLLPEr+fLwUYJC/hIvGm+w9TFyMHBIqAq8WGROkiYV8BO4vHRHywQG+Ql
 Vm84ADaUEyi+dcYTsM1CArYSH+YsZpnAyLeAkWEVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZG
 YExtO/Zz8w7GSxuDDzEKcDAq8fAy2AfFC7EmlhVX5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++
 qDQntfgQoynQTROZpUST84HxnlcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUI
 po+Jg1OqgdE8xLLsYG0d/4qWr44mpQZlvBNunlH9X6Z+ecHBF6GyvDKq+xvOb4xjdnS5FmtW
 U1pzyU0iyzPKY8HukxLCn/I/9e+wflXXk+/tuK+WxX/yNLlFe6qsRVVr94uq10z/v0zl9CX+
 qaGlXMc2CJXu2uQUHxrLZBizU7EzxCWAaauolPkPIS0FJZbijERDLeai4kQAxfkiVb8CAAA=
X-CMS-MailID: 20200904133509eucas1p23ae97afc5f53f7d84e7f0183803ec483
X-Msg-Generator: CA
X-RootMTR: 20200904133509eucas1p23ae97afc5f53f7d84e7f0183803ec483
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133509eucas1p23ae97afc5f53f7d84e7f0183803ec483
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133509eucas1p23ae97afc5f53f7d84e7f0183803ec483@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
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
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/dma-buf/heaps/heap-helpers.c | 13 ++++++-------
 drivers/dma-buf/udmabuf.c            |  7 +++----
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
index 9f964ca3f59c..d0696cf937af 100644
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ b/drivers/dma-buf/heaps/heap-helpers.c
@@ -140,13 +140,12 @@ struct sg_table *dma_heap_map_dma_buf(struct dma_buf_attachment *attachment,
 				      enum dma_data_direction direction)
 {
 	struct dma_heaps_attachment *a = attachment->priv;
-	struct sg_table *table;
-
-	table = &a->table;
+	struct sg_table *table = &a->table;
+	int ret;
 
-	if (!dma_map_sg(attachment->dev, table->sgl, table->nents,
-			direction))
-		table = ERR_PTR(-ENOMEM);
+	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	if (ret)
+		table = ERR_PTR(ret);
 	return table;
 }
 
@@ -154,7 +153,7 @@ static void dma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				   struct sg_table *table,
 				   enum dma_data_direction direction)
 {
-	dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
+	dma_unmap_sgtable(attachment->dev, table, direction, 0);
 }
 
 static vm_fault_t dma_heap_vm_fault(struct vm_fault *vmf)
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index acb26c627d27..89e293bd9252 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -63,10 +63,9 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 					GFP_KERNEL);
 	if (ret < 0)
 		goto err;
-	if (!dma_map_sg(dev, sg->sgl, sg->nents, direction)) {
-		ret = -EINVAL;
+	ret = dma_map_sgtable(dev, sg, direction, 0);
+	if (ret < 0)
 		goto err;
-	}
 	return sg;
 
 err:
@@ -78,7 +77,7 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 static void put_sg_table(struct device *dev, struct sg_table *sg,
 			 enum dma_data_direction direction)
 {
-	dma_unmap_sg(dev, sg->sgl, sg->nents, direction);
+	dma_unmap_sgtable(dev, sg, direction, 0);
 	sg_free_table(sg);
 	kfree(sg);
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
