Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC79B25273F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA5A6EA1F;
	Wed, 26 Aug 2020 06:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B0D6EA03
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:44 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063542euoutp017a9b220db794a74babc7df03df2bff70~uvezm_-412034020340euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200826063542euoutp017a9b220db794a74babc7df03df2bff70~uvezm_-412034020340euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423742;
 bh=K2OO+ArQpNbr9py9lvtOZt7FGEEqICWRpeqEX/cK+vw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WUL+yCv2WHpaPCAJUUVZwrSYzw68ne5AFda82CcoIRUsfgs3Py5f9S65bvPWj6GtT
 uhxcD59/v3z4RNIYFG7t97JLveuR4q/FK4peStG57UzxXrhFEd+0KEUrLsH9W24qjf
 svKQCaik4gfgz4DFVVpuolRrXzKw4D6HELFpZSdA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200826063542eucas1p2ada057cab94cea9000995fd1ebfe1387~uvezOnfVE0398303983eucas1p2Y;
 Wed, 26 Aug 2020 06:35:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id B4.5D.06318.EB2064F5; Wed, 26
 Aug 2020 07:35:42 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200826063542eucas1p1713d37f4589ddaca27e1968b5fe44027~uvey3rdEC1474114741eucas1p1q;
 Wed, 26 Aug 2020 06:35:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200826063542eusmtrp20c68a6c1cdb7a94833204a11b04ea18d~uvey2-q7f0466204662eusmtrp2c;
 Wed, 26 Aug 2020 06:35:42 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-f1-5f4602beede1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E9.53.06017.EB2064F5; Wed, 26
 Aug 2020 07:35:42 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063541eusmtip294447d0154a85766f83400ec8c228562~uveySDRKu2993829938eusmtip2k;
 Wed, 26 Aug 2020 06:35:41 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 24/32] drm: host1x: fix common struct sg_table related
 issues
Date: Wed, 26 Aug 2020 08:33:08 +0200
Message-Id: <20200826063316.23486-25-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSWUwTQQB1dtvdpVBdFwwTMJg0ESMJUIImmwAeCLgfJh7hRxPFAhtopIW0
 gGBIJBoMlKIcGhEViqLchxXK0YhQgaJolUMFFREQr4hIOAREsMuC/r15x7yXyRAoZRA6EXJl
 LKtSyqIkmEhg6Ji3uDcjQSHSBb0TnWF5jND3cquF9LIhC6X7ZiYwurS8HaF1D33o6b5hhNaP
 vhLSvU03MDptOg+jK9sGcbr150chPd+UL9gjZiryKwDzYFYnYBrzBnGmfvaDkBlKNyPM/aKz
 zNulUZTJ6S8GjHEgGWMu1pYBZkrvcsj2mMg3nI2Sx7Mqz10nRZG/sk1YzB3nhNoJM54MvmzS
 ABsCkjtgYXIDrgEigiJLAMypb0M5gSKnASzodeeFKQAzm9qRtcSfuWkBLxQDWLVQsxq3JuZu
 p2CcCyO9oGZcs4IdyBQAOzPsOBNKjiAw7XW3tYMg7MkjsKA5mPMIyK1waP6zkMNichdMeW/B
 +LYtsLymZWWSjZU3p1/CuHsgacKhOf/C6qQAuHjXCHhsD7+Za3Eeb4bLjQUIHzgP4LClEucP
 WgB7z+WuJnzgO8sCxi1Cye2wusmTp/fCm21zCEdDcj3sH9/I0agVZhuuojwthqkXKN7tCvPM
 Vf9qW1/0oDxmoPHaLOAfKAvA792X8UywJe9/mQ6AMuDIxqkVEazaW8me9lDLFOo4ZYRHWLRC
 D6y/qWvJPNMAmhdDTYAkgMROrMMCQyihLF6dqDABSKASB7H/s64TlDhclniGVUWHqOKiWLUJ
 OBMCiaPY+9bX4xQZIYtlT7FsDKtaUxHCxikZ7AcDOQevd1KHE5LI1CvUa78GyVah47ng9iK9
 pg57JGflOf2KsLSe/iJHo7Gwzs115OUbrevuJK00NGDs975W6Y+AAkvpgZ1p5Ud1UtvO5+OZ
 k/652qiIoA2GqY6lT9p1TriLSBI/KFGGR6dvc3hSMuYbOFn+9Fp8pF+Ls68pUiJQR8q83FCV
 WvYXOwW0gkkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xe7r7mNziDaZdZLHoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZtH5ZRabxdojd9ktDn54wmrx
 c9c8FgdejzXz1jB67P22gMVj56y77B7bvz1g9bjffZzJY/OSeo/b/x4ze0y+sZzRY/fNBjaP
 vi2rGD0+b5IL4I7SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcks
 Sy3St0vQy/g+6RBbwVLpii3vj7M3ML4Q7WLk5JAQMJH4++MLSxcjF4eQwFJGifmfDzJDJGQk
 Tk5rYIWwhSX+XOtigyj6xCjR1/2PHSTBJmAo0fUWIiEi0MkoMa37IzuIwyzwikniw59WRpAq
 YYEAiYPzroGNYhFQlbj/8zmYzStgJ9F67xwbxAp5idUbDoCt5gSKH+/uB4sLCdhKnF47g3kC
 I98CRoZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgdGy7djPLTsYu94FH2IU4GBU4uFdwOYa
 L8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjKZAR01klhJNzgdGcl5JvKGp
 obmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBkZBLbOJBX88NZl+PHi0Nukl
 g/eUAveje+8235J83ju78J6xUt1JZ3X+QrNfLovOxmhPiDN027OEzaHBWPbQopKtWnvf+6q7
 rD5/s+yjzNfYAk+bIA+LNvHKBX48iyo+NDnf36Vov/35jNPCjDLzLXrrn7mv/lVVfatbsFvW
 8dNbgzYW5bb6FCWW4oxEQy3mouJEAKnmdfKsAgAA
X-CMS-MailID: 20200826063542eucas1p1713d37f4589ddaca27e1968b5fe44027
X-Msg-Generator: CA
X-RootMTR: 20200826063542eucas1p1713d37f4589ddaca27e1968b5fe44027
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063542eucas1p1713d37f4589ddaca27e1968b5fe44027
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063542eucas1p1713d37f4589ddaca27e1968b5fe44027@eucas1p1.samsung.com>
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
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
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
 drivers/gpu/host1x/job.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 89b6c14b7392..82d0a60ba3f7 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -170,11 +170,9 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 				goto unpin;
 			}
 
-			err = dma_map_sg(dev, sgt->sgl, sgt->nents, dir);
-			if (!err) {
-				err = -ENOMEM;
+			err = dma_map_sgtable(dev, sgt, dir, 0);
+			if (err)
 				goto unpin;
-			}
 
 			job->unpins[job->num_unpins].dev = dev;
 			job->unpins[job->num_unpins].dir = dir;
@@ -228,7 +226,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		}
 
 		if (host->domain) {
-			for_each_sg(sgt->sgl, sg, sgt->nents, j)
+			for_each_sgtable_sg(sgt, sg, j)
 				gather_size += sg->length;
 			gather_size = iova_align(&host->iova, gather_size);
 
@@ -240,9 +238,9 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 				goto put;
 			}
 
-			err = iommu_map_sg(host->domain,
+			err = iommu_map_sgtable(host->domain,
 					iova_dma_addr(&host->iova, alloc),
-					sgt->sgl, sgt->nents, IOMMU_READ);
+					sgt, IOMMU_READ);
 			if (err == 0) {
 				__free_iova(&host->iova, alloc);
 				err = -EINVAL;
@@ -252,12 +250,9 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			job->unpins[job->num_unpins].size = gather_size;
 			phys_addr = iova_dma_addr(&host->iova, alloc);
 		} else if (sgt) {
-			err = dma_map_sg(host->dev, sgt->sgl, sgt->nents,
-					 DMA_TO_DEVICE);
-			if (!err) {
-				err = -ENOMEM;
+			err = dma_map_sgtable(host->dev, sgt, DMA_TO_DEVICE, 0);
+			if (err)
 				goto put;
-			}
 
 			job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
 			job->unpins[job->num_unpins].dev = host->dev;
@@ -660,8 +655,7 @@ void host1x_job_unpin(struct host1x_job *job)
 		}
 
 		if (unpin->dev && sgt)
-			dma_unmap_sg(unpin->dev, sgt->sgl, sgt->nents,
-				     unpin->dir);
+			dma_unmap_sgtable(unpin->dev, sgt, unpin->dir, 0);
 
 		host1x_bo_unpin(dev, unpin->bo, sgt);
 		host1x_bo_put(unpin->bo);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
