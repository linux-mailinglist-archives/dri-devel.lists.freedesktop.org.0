Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE4F1D1542
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DC36EA4A;
	Wed, 13 May 2020 13:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D8B6EA48
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:16 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133314euoutp024dec9698104a424871a5b7993829d3e7~OmcYhR1Kx3219432194euoutp02A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200513133314euoutp024dec9698104a424871a5b7993829d3e7~OmcYhR1Kx3219432194euoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376794;
 bh=ftlkBS8VBSgkdSrodZQPgIE+CocBJx3UwNrqNvsfVeA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZhtUQdGz8EC8yB+wWZLEe8a6/JFE0ziDuGqEMlmzKQ+sOrL1GTJ94Qdo2fu38lz7M
 e4ntmy1NhdHA/ooSp5rTsz40nL8lbEu6g16/Lz3H9BruFDewDkWd+sIQfCEn8JdhMq
 h//BXmHTlVdPlTpXO+kyNl9JnjGPwVaUGJb62HCk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200513133314eucas1p12b362cce72951b2e10d5b146ddad21b8~OmcYU4Aiq0384603846eucas1p1W;
 Wed, 13 May 2020 13:33:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 31.D5.61286.A17FBBE5; Wed, 13
 May 2020 14:33:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133314eucas1p1a607b556e32887e7f5ca60eb09a476c6~OmcYDZxCx2633026330eucas1p1N;
 Wed, 13 May 2020 13:33:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133314eusmtrp126725da789068de919a73c6c40156f9a~OmcYCxzPl1049110491eusmtrp1X;
 Wed, 13 May 2020 13:33:14 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-65-5ebbf71ad87a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6C.1A.08375.A17FBBE5; Wed, 13
 May 2020 14:33:14 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133313eusmtip13987a33839912ac1a5a620fabb4c42ad~OmcXcH7xo2932629326eusmtip1h;
 Wed, 13 May 2020 13:33:13 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 24/38] drm: v3d: fix common struct sg_table related issues
Date: Wed, 13 May 2020 15:32:31 +0200
Message-Id: <20200513133245.6408-24-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djP87pS33fHGZyfJWfRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLA42XGS1Wrj7KZLFgv7XFlysPmSw2Pb7GanF51xw2i7VH7rJbHPzwhNWB
 x6Pp/TE2jzXz1jB67P22gMVj+7cHrB73u48zeWxeUu9x+99jZo/JN5Yzeuy+2cDm0bdlFaPH
 501yAdxRXDYpqTmZZalF+nYJXBmTd1xgK7gvWtH74zRLA+MMoS5GTg4JAROJ7e+PMHUxcnEI
 CaxglJj6+TkbSEJI4AujxKQXqhCJz4wSs54vYe9i5ADrmLlSHSK+nFHi0ZkrbBAOUMPBz22M
 IN1sAoYSXW+7wCaJCLQySpzo5QEpYhbYySSxqHMPWJGwgL/E+v3NzCA2i4CqxMm9x8HivAK2
 Ei/+TmKGuE9eYvWGA2A2J1D81Z39LCCDJAQOsUvs3POIBaLIReLMkcmsELawxKvjW9ghbBmJ
 05N7oBqaGSUenlvLDuH0MEpcbprBCFFlLXHn3C82kOeYBTQl1u/Shwg7Suxdt5UJ4mc+iRtv
 BUHCzEDmpG3TmSHCvBIdbdBwVJOYdXwd3NqDFy5B3e8h8XbbAnZICB1mlOicOp19AqP8LIRl
 CxgZVzGKp5YW56anFhvmpZbrFSfmFpfmpesl5+duYgQmpNP/jn/awfj1UtIhRgEORiUeXotb
 u+OEWBPLiitzDzFKcDArifD6rQcK8aYkVlalFuXHF5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1
 OzW1ILUIJsvEwSnVwCh4Us5NY7+2a1zExZvaIndnz87jPGL80j+t2MaloN9jYWnpZBnnffPn
 GUfu5JG25YqJM7jEtN435VDOhnceLhcuP555zWT3xejdt3lnveqrW7L9jIrmn8DQT/Xn2/l2
 MM+p6UvmcTfq3xJq6OwkULoimmFNbcjfrTuepT540jT79SrewKXmK5VYijMSDbWYi4oTAerz
 /PZEAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsVy+t/xu7pS33fHGbydyGvRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLA42XGS1Wrj7KZLFgv7XFlysPmSw2Pb7GanF51xw2i7VH7rJbHPzwhNWB
 x6Pp/TE2jzXz1jB67P22gMVj+7cHrB73u48zeWxeUu9x+99jZo/JN5Yzeuy+2cDm0bdlFaPH
 501yAdxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJ
 ehmTd1xgK7gvWtH74zRLA+MMoS5GDg4JAROJmSvVuxi5OIQEljJKbJkxn72LkRMoLiNxcloD
 K4QtLPHnWhcbRNEnRom5P/tYQBJsAoYSXW8hEiICnYwS07o/soM4zAL7mSQuHzkFNkpYwFfi
 0NTlTCA2i4CqxMm9xxlBbF4BW4kXfycxQ6yQl1i94QCYzQkUf3VnP9gGIYF8ib2L97FNYORb
 wMiwilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzBCth37uXkH46WNwYcYBTgYlXh4LW7tjhNi
 TSwrrsw9xCjBwawkwuu3HijEm5JYWZValB9fVJqTWnyI0RToqInMUqLJ+cDozSuJNzQ1NLew
 NDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwJg0LWLhGbmDu+OOvL8vvqioaf3t
 BZyKqi7NHzeFL4i884V1+bat2e8WKtXZ/L56hWePYuahYtf9us+jHuQVealX/Pw8b+H1Fc++
 Zrr7+PvnzD9nYzBpRtKxpVPs/279FhX3f2veyoUPU74uXXx1r2b5XzZLd+OqC+687LvaxaZ5
 SLbv7M0PStutxFKckWioxVxUnAgAchFgG6YCAAA=
X-CMS-MailID: 20200513133314eucas1p1a607b556e32887e7f5ca60eb09a476c6
X-Msg-Generator: CA
X-RootMTR: 20200513133314eucas1p1a607b556e32887e7f5ca60eb09a476c6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133314eucas1p1a607b556e32887e7f5ca60eb09a476c6
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133314eucas1p1a607b556e32887e7f5ca60eb09a476c6@eucas1p1.samsung.com>
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
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/v3d/v3d_mmu.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
index 3b81ea2..175c257 100644
--- a/drivers/gpu/drm/v3d/v3d_mmu.c
+++ b/drivers/gpu/drm/v3d/v3d_mmu.c
@@ -90,19 +90,16 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
 	struct v3d_dev *v3d = to_v3d_dev(shmem_obj->base.dev);
 	u32 page = bo->node.start;
 	u32 page_prot = V3D_PTE_WRITEABLE | V3D_PTE_VALID;
-	unsigned int count;
-	struct scatterlist *sgl;
+	struct sg_dma_page_iter dma_iter;
 
-	for_each_sg(shmem_obj->sgt->sgl, sgl, shmem_obj->sgt->nents, count) {
-		u32 page_address = sg_dma_address(sgl) >> V3D_MMU_PAGE_SHIFT;
+	for_each_sgtable_dma_page(shmem_obj->sgt, &dma_iter, 0) {
+		dma_addr_t dma_addr = sg_page_iter_dma_address(&dma_iter);
+		u32 page_address = dma_addr >> V3D_MMU_PAGE_SHIFT;
 		u32 pte = page_prot | page_address;
-		u32 i;
 
-		BUG_ON(page_address + (sg_dma_len(sgl) >> V3D_MMU_PAGE_SHIFT) >=
-		       BIT(24));
-
-		for (i = 0; i < sg_dma_len(sgl) >> V3D_MMU_PAGE_SHIFT; i++)
-			v3d->pt[page++] = pte + i;
+		BUILD_BUG_ON(V3D_MMU_PAGE_SHIFT != PAGE_SIZE);
+		BUG_ON(page_address + 1 >= BIT(24));
+		v3d->pt[page++] = pte;
 	}
 
 	WARN_ON_ONCE(page - bo->node.start !=
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
