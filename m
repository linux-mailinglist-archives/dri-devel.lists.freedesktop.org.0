Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119621CF055
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B48B6E8E9;
	Tue, 12 May 2020 09:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EC86E8D4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:13 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090112euoutp022a273ed236302ba04da1fa84da597185~OPFk702nb0453404534euoutp02D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200512090112euoutp022a273ed236302ba04da1fa84da597185~OPFk702nb0453404534euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274072;
 bh=dIencXhlepazbgyGCsjVhfbPXIwtuARWPw6D+oCcJWQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DouhV7qBPqbjgc6QT4NrEvTv522TQgvTgNn6mpY1khiXr+KAqHMlcqLJzGOa6azhP
 8o+6Mof/nvPUUFeg47FSdKM/4yFq68g8lXq/geBdeiX4zP9Hk60e0XeQto24RN4Ru2
 pBC+Q7PHkcbjPva0BkDAwfx4fUUcol4W2Aigc1V4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200512090112eucas1p1eb18e6c20979908e6df5e8226bc38088~OPFkwJScl2839628396eucas1p11;
 Tue, 12 May 2020 09:01:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 81.22.60679.8D56ABE5; Tue, 12
 May 2020 10:01:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200512090111eucas1p29897737c262b467437d0775204129105~OPFkWCLZc2661326613eucas1p2H;
 Tue, 12 May 2020 09:01:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200512090111eusmtrp1dd5fb260a663ad982dffc1f9cd3fd8c6~OPFkVRiI-0183401834eusmtrp1a;
 Tue, 12 May 2020 09:01:11 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-81-5eba65d800c5
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C1.F2.07950.7D56ABE5; Tue, 12
 May 2020 10:01:11 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090111eusmtip1b579dc79f082a6a20cf154deaa0a4ee2~OPFjzDv8c1352813528eusmtip1D;
 Tue, 12 May 2020 09:01:11 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/38] drm: armada: fix common struct sg_table related
 issues
Date: Tue, 12 May 2020 11:00:28 +0200
Message-Id: <20200512090058.14910-8-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSWUwTURTN60ynA1IcC8oTcJuoURLZ9GMMiooYxuCG0R+NYJEJixSwZRF/
 aFhldUEUUJAQDbtstUgNkTZSBBIQ2YqyBvwArUhZ3AjYYYr+nXvuWW5eHo6Iavi2eHBYJCMN
 E4eSmDmq1P7q2qdjVL7OBh1KZXa28aja3Go+taK8h1C9CzMYVVbRwqOK3rhR873jPKpuop9P
 9aieYJQmpwlQVW+HBZT6+yT/qAVdWVgJ6J7+boRuWixC6YbFMT49mt7Ko+ufxdGflicQOltX
 AujXg3KMzlKUA3qubuu5dZfMDwUwocHRjNTJ/ap5kEJNR6RvvllYoOTLwaB1GjDDIXEAfl5e
 EaQBc1xElAL4QzeBccM8gMNf80zDHIBThQbBmkWzNIqyWESUAKhXenLY6LiTGcRijHCBafo0
 jMXWRBKA7zIt2CCEaObB5G9feOzCijgPa0Z6ERajxC44mfpwNVRIHIZ/CtQ8rmwbrKhpXtWY
 Ee5w9OkSygZBQiWAfS9/YpzIE44pU0wGKzjdqjBdag87sjNMhgQAxzurBNyQAWBPfC7gVG5w
 qPO3MQk33rcXVqucOPoYnCgeQVkaEpZQp9/A0ogR3lc+QjhaCG8nizj1bpjf+uJfrfr9B4TD
 NEyZaTG9YguA8swZ7C7Ylv+/rAiAcmDDRMkkgYzMNYyJcZSJJbKosEDHa+GSOmD8Rx3LrfOv
 gGrJXwMIHJAWQmfnRl8RXxwti5VoAMQR0lqYGGykhAHi2FuMNNxPGhXKyDTADkdJG+H+4qkr
 IiJQHMlcZ5gIRrq25eFmtnJwYksWqelebyg9u8ePOkXOlg7Ynyw+kpftkRLiGz8d19ymnskh
 Aga8yBsHg7XHyz0s/c/otR8vPM7qSHSNuTylbX/e2/7AO2Fnbqpddl+yx4iI3Nig8Fm42NXv
 byOoXwnR1hoaDTZ1SWVDVV6nRyVBVJvYp9xhuyiE3uS9o2i2gkRlQWIXB0QqE/8Fn/EWxkMD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsVy+t/xu7rXU3fFGbz+pG/Re+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzeLQ1L2MFmuP3GW3OPjhCasD
 j8eaeWsYPS5fu8jssffbAhaP7d8esHrc7z7O5LF5Sb3H7X+PmT0m31jO6LH7ZgObR9+WVYwe
 nzfJBXBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl
 6GVsOehR0C1ZMW/uNtYGxpsiXYycHBICJhKH/txn6WLk4hASWMooMe/mOSaIhIzEyWkNrBC2
 sMSfa11sEEWfGCUOHGtlAUmwCRhKdL2FSIgIdDJKTOv+yA7iMAscY5JY+OsjWJWwQIDEyWMX
 GUFsFgFViSed08DivAK2Er/nHoRaJy+xesMBZhCbU8BO4v78P2A1QgKFEo+uvmWZwMi3gJFh
 FaNIamlxbnpusZFecWJucWleul5yfu4mRmCEbDv2c8sOxq53wYcYBTgYlXh4O4x2xgmxJpYV
 V+YeYpTgYFYS4W3JBArxpiRWVqUW5ccXleakFh9iNAU6aiKzlGhyPjB680riDU0NzS0sDc2N
 zY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MNrdPtNRvMnzXfWcR1E3LBv5Vj6aNPd2
 jOkd/ql2W1hu33kskfHG0dz/ftDhycJ9yyObi/llrA2XPU7j/Clp81PK/4bDqVDNDRa6U3Li
 E1P1JfsffZ91s3f60YK9PZGved/N3fJNk3s68+6eE7+sjIyijihy6X26l1W77tZtl+quexJ8
 /FEv45VYijMSDbWYi4oTAfQLZTmmAgAA
X-CMS-MailID: 20200512090111eucas1p29897737c262b467437d0775204129105
X-Msg-Generator: CA
X-RootMTR: 20200512090111eucas1p29897737c262b467437d0775204129105
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090111eucas1p29897737c262b467437d0775204129105
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090111eucas1p29897737c262b467437d0775204129105@eucas1p2.samsung.com>
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
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
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
