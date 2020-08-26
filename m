Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2318252735
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4568B6EA17;
	Wed, 26 Aug 2020 06:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D926E9FB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:41 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063539euoutp0122aefcad38b85c8664455ff89f45bf65~uvewpfsM02034920349euoutp01I
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200826063539euoutp0122aefcad38b85c8664455ff89f45bf65~uvewpfsM02034920349euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423739;
 bh=8SvVp249TnvdrtsN3cK9UiYXaHvxLMtfidsvZb7ATx0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GMfzMNaD8tCyRezUqsl9ZZew+2XaHCp9rj1C3SO2NeQ4Kk+NMhVsrpxYXsV/xog/O
 BONpuFE9DkCIzkA0eJdlBblfzKsOgNcoJmmTtDbjFz4OPF1bu/uscmU0AUFwXJxQNB
 vxc5RNVvr57qOlFlHAvQN9yI0Hm1xAK6oiij6kCM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200826063539eucas1p163681e3b94d83d94f1030ebe516e2260~uvewVtVP01942019420eucas1p1x;
 Wed, 26 Aug 2020 06:35:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 03.5D.06318.BB2064F5; Wed, 26
 Aug 2020 07:35:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063539eucas1p2ed946c6214cdb8574ab288350db22f1a~uvewBaXKt0401804018eucas1p2j;
 Wed, 26 Aug 2020 06:35:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826063539eusmtrp1dc9bf141cf03c4673abfd423c5e6a255~uvewAxgWX1091110911eusmtrp1f;
 Wed, 26 Aug 2020 06:35:39 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-ea-5f4602bb3e32
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 1A.D0.06314.AB2064F5; Wed, 26
 Aug 2020 07:35:39 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063538eusmtip25cde68f15a1e08c51df46c690f5e6122~uveveVu_j0474104741eusmtip2W;
 Wed, 26 Aug 2020 06:35:38 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 19/32] drm: v3d: fix common struct sg_table related issues
Date: Wed, 26 Aug 2020 08:33:03 +0200
Message-Id: <20200826063316.23486-20-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTURzHO7t3d9e1xW1TPGgoDCyy0syii5o9MLtFoERQCGYzLz5yKpta
 +keaWvisdEGiKVME31PnI1PzsWzLVuarMEzTrMBKTZ3Ld3m9Wv99ft/f93u+h8PBEVE11woP
 Douk5WHSUAnGRxt0i28PNHM8/Q7m1kAyo7uLQ9ZkV3HJPw2ZCDkwP42R7bf7AVla/oJDqtpc
 SePAGIfUjL/nkv1NjzGysnOYR3b8+sI9IaASpnUYVZFfAahnJhVKPTGNcqlPaXoOVVsURw2t
 jSOUcrAYUM0f4jHqXl0ZoOY0Nt7bffhuAXRocDQtd3S/yg+a6fjJjSg0v5n3TgXiwRSRCsxw
 SByGuVkpSCrg4yKiBMClhRLADkYA5xdmUHaYA3CmRs/bijR1McwsigE0qqc2FhuRWR3JMEY4
 wdTJVIxhc+IOgC8zBEwAIZ5yYGFKy3oHjosJL2gc9WU8KGEHe/KWUUYWEu5wslbCdtnC8up2
 hGGzdVmfdh9jjoGElge/qUtR1uQBn+t0m5cTw+/6uk3eBQ3KdJQNJAI41l3JY4d0APsTsgHr
 coUfu5cwphkh9sKqJkdWPgkfavp4jAyJHXBwcicjI+uY1fAIYWUhTL4rYt27YY5e/a+2o6cP
 YZmCjROVm2+VCWB3wW/uA2Cb879MBUAZsKSjFLJAWuEcRt9wUEhliqiwQIdr4TINWP9HhjX9
 fCNoXfHXAgIHEoFQhZ32E3Gl0YoYmRZAHJGYC0+9MVwRCQOkMbG0PNxPHhVKK7TAGkcllkLn
 wglfEREojaSv03QELd/acnAzq3ig5H+OGxlZcb9k0Xs8RBUnr3cLb59YPa/8unx0/7ZXvefW
 KpP2HPJU1QmSRI12gyaH+eSikU5qSOaSt2RZbTgS/IO+JdGbLnj7nBWblhds1BbI5frXA64C
 e/VgYqvgojKkLd+6JdpYkOx/RrzqEetV4VCv2+fS4a2dhcfyhhe9JKgiSOpkj8gV0r/WTreF
 QwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsVy+t/xe7q7mdziDZ49ZLToPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFgcbLjBYrVx9lsliw39riy5WHTBabHl9jtbi8aw6bxdojd9ktDn54wurA
 49H0/hibx5p5axg99n5bwOKx/dsDVo/73ceZPDYvqfe4/e8xs8fkG8sZPXbfbGDz6NuyitHj
 8ya5AO4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsE
 vYyPB9+wFiwSqZh7dQFjA+M7gS5GTg4JAROJXSePs3cxcnEICSxllGg42M8KkZCRODmtAcoW
 lvhzrYsNougTo8Tz47+ZQRJsAoYSXW8hEiICnYwS07o/go1iFtjPJHH5yCl2kCphAV+Jn5ff
 MoHYLAKqEhfm/mbpYuTg4BWwk3i7WQlig7zE6g0HwIZyAoWPd/ezgdhCArYSp9fOYJ7AyLeA
 kWEVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYIRsO/Zz8w7GSxuDDzEKcDAq8fAuYHONF2JN
 LCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58UWlOavEhRlOgmyYyS4km5wOjN68k3tDU0NzC
 0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA6PZTM0m9zAFQav59o82v7/GUlUz
 0fbV/ktdO7zlo9oZ5rsWtAln/uT8MIHhaMoeryeS0za7N3nfvbd9XqBjnfd5ziBBdpupq+Lf
 ifvcjdr2NKfh3m07YZ7cNRLf15zZldP8w7y05RtrVuvO7A/WuiI6K7O3vtl2wPfk3rmRlcaa
 qjXCC7+H2yixFGckGmoxFxUnAgCW0JQipgIAAA==
X-CMS-MailID: 20200826063539eucas1p2ed946c6214cdb8574ab288350db22f1a
X-Msg-Generator: CA
X-RootMTR: 20200826063539eucas1p2ed946c6214cdb8574ab288350db22f1a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063539eucas1p2ed946c6214cdb8574ab288350db22f1a
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063539eucas1p2ed946c6214cdb8574ab288350db22f1a@eucas1p2.samsung.com>
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
Reviewed-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/v3d/v3d_mmu.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
index 3b81ea28c0bb..5a453532901f 100644
--- a/drivers/gpu/drm/v3d/v3d_mmu.c
+++ b/drivers/gpu/drm/v3d/v3d_mmu.c
@@ -90,18 +90,17 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
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
 		u32 i;
 
-		BUG_ON(page_address + (sg_dma_len(sgl) >> V3D_MMU_PAGE_SHIFT) >=
+		BUG_ON(page_address + (PAGE_SIZE >> V3D_MMU_PAGE_SHIFT) >=
 		       BIT(24));
-
-		for (i = 0; i < sg_dma_len(sgl) >> V3D_MMU_PAGE_SHIFT; i++)
+		for (i = 0; i < PAGE_SIZE >> V3D_MMU_PAGE_SHIFT; i++)
 			v3d->pt[page++] = pte + i;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
