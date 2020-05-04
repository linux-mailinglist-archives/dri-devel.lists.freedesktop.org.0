Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A38F21C3A0F
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4109989453;
	Mon,  4 May 2020 12:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D296289622
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:14 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200504125413euoutp012d5e561c095245a833f847a40c480aa4~L1GvtDnw62809728097euoutp01A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200504125413euoutp012d5e561c095245a833f847a40c480aa4~L1GvtDnw62809728097euoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588596853;
 bh=363IWIw2RDFl8Q541Ij+nYWeRz7z6H9HYij1uvd7iTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qAYx9kvt+6ePArCX0l9J0WUPsySsvyTnSuZLdkLUng6YRqn0HvT1GcES1+6hA5IkE
 BiuSqM+kZ0mSs4wMpfe6Ho75w6rMcd+T39fDZkg2TRJrIkxahIFQBvgJl/9UpeodPY
 AeFm2RD52fcUMcffJz0sdJG+CI0hMZ3QEGm9ch3Y=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200504125413eucas1p11b0cdd5b164cbf7e597e45342524d381~L1GvVlScQ1058810588eucas1p1e;
 Mon,  4 May 2020 12:54:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 94.12.60698.57010BE5; Mon,  4
 May 2020 13:54:13 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200504125412eucas1p1aa394ac0f9a88fb7be0ec2359690c416~L1GvCb15M0158001580eucas1p11;
 Mon,  4 May 2020 12:54:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200504125412eusmtrp286075c03202d614fe5cfc81f1c54ad84~L1GvBz7t02826928269eusmtrp2K;
 Mon,  4 May 2020 12:54:12 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-46-5eb010758d16
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 16.69.08375.47010BE5; Mon,  4
 May 2020 13:54:12 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200504125412eusmtip21f459a327d510b0e4be0352ca3d3e581~L1GuW_5YK0241702417eusmtip2I;
 Mon,  4 May 2020 12:54:12 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/21] drm: exynos: fix sg_table nents vs. orig_nents misuse
Date: Mon,  4 May 2020 14:53:43 +0200
Message-Id: <20200504125359.5678-5-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200504125359.5678-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRzGec85OzsuF8cp+KqhNahRkheUOqBFRR9OBGEEEYnmKQ9qbSqb
 s+yLIy/UampmtSxqWDhvazptmprpTJcaal7K+wXzg4qoeEktNedR+/b8f//neZ+Xl5dARSae
 KxEVHcfKoxmpGBdg5saV1qNKsjjUJyWfoDStTQhVojXyqA3zY5TqWpzBqfzCBoTKHM7AKN3n
 AGqhaxShTGM/eFRn5Suc0rbVIJThyyCfqpv9xTslpIteFwH605IOo8uXRnj08EMrQpe+S6T7
 18dQ+kmPHtBVvSqcTisrAPS8yT1IcFUQGM5Ko+JZuffJMEHkUNYDPHZFeCd9uBpTgbk9amBH
 QNIf9javATUQECIyD8CSb/N8blgAMG1Eg3DDPID1ZXp8J9JinNmO6AHMbfuD70ZW14q3XDjp
 C9XT6i3tRKYA+FVjbzOh5BACZ/KeYraFI3kRZld182waIw9CXY9liwvJQFg+N4hxdR6wsLgW
 VQOCsCNPwBcaie0cSFr40PQheftKZ2HL2xU+px3hpLVsW++DGx/fIFwgCcDRVgOfGx4B2HlP
 CzhXABxoXcVtDSh5GBorvTl8GhoqK4ANQ3Iv7Jl2sGF0U2aan6McFsL7qSLOfQhmW9/v1ta1
 d6CcpmF3aS7GPVA9gMt6I8gAHtn/y3QAFABnVqmQRbAKv2j2tpeCkSmU0RFeN2JkJrD5k1rW
 rYsVoObvdQsgCSC2F16ZN4aKeEy8IkFmAZBAxU7CiuRNJAxnEu6y8phrcqWUVViAG4GJnYV+
 ORMhIjKCiWNvsWwsK9/ZIoSdqwoMiKamR9ekvb8v7w8OkWpdyGOG3HOz6qCwWQe/qTDY14RW
 JCknsnQH0puO1yhHJt2GJ/KqBhLjGYnZyyW4v7FGby4436CbWbk5Vl7ZoZTY97WPqzTPFvOS
 /CXLOW0ilc/3AsPPvqQw/ZmUcUlRNVs7dYmxf+l5wR1rTtV6isWYIpLxPYLKFcw/Fz+9S0UD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsVy+t/xe7olAhviDM7MM7DoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwm3Z/AYrFgv7XFlysPmSw2Pb7GanF51xw2ixnn9zFZrD1yl93i
 4IcnrA68HmvmrWH02PttAYvH9m8PWD3udx9n8ti8pN7j9r/HzB6Tbyxn9Nh9s4HNo2/LKkaP
 z5vkArii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S
 9DLuTelkK/jJW9F/fw9LA+NH7i5GTg4JAROJ0+vfM3YxcnEICSxllDiy4RorREJG4uS0Bihb
 WOLPtS42iKJPjBL7P94DS7AJGEp0vYVIiAh0MkpM6/7IDuIwCzxjkvhz8xwTSJWwgL/EvhPv
 WEBsFgFViQU3DoHZvAI2Ets/3mWBWCEvsXrDAeYuRg4OTgFbiZm96iBhIYF8ibtP/7FMYORb
 wMiwilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzBCth37uXkH46WNwYcYBTgYlXh4Iz6vjxNi
 TSwrrsw9xCjBwawkwrujBSjEm5JYWZValB9fVJqTWnyI0RToponMUqLJ+cDozSuJNzQ1NLew
 NDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwKj1bDrby6D5tgeWPKp7fbQvtDDl
 5JIf8gpphpZnFbpiXGVT2paZLs/QDrqfGbDOc7HSupd/zyT9KD1lasB2jnnjuUuh4pHrDnzZ
 4pYvFBQVI3DraF+LV2Zn5IOnhZZcl59+4FlrLyT2fe2VPr245Q/L49mf39538spi8eRN5dtD
 g2LfrnqmsE2JpTgj0VCLuag4EQCEwSCWpgIAAA==
X-CMS-MailID: 20200504125412eucas1p1aa394ac0f9a88fb7be0ec2359690c416
X-Msg-Generator: CA
X-RootMTR: 20200504125412eucas1p1aa394ac0f9a88fb7be0ec2359690c416
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200504125412eucas1p1aa394ac0f9a88fb7be0ec2359690c416
References: <20200504125017.5494-1-m.szyprowski@samsung.com>
 <20200504125359.5678-1-m.szyprowski@samsung.com>
 <CGME20200504125412eucas1p1aa394ac0f9a88fb7be0ec2359690c416@eucas1p1.samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. Adapt the code to obey those rules.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v2 00/21] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/4/373
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index fcee33a..f995b0c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -396,7 +396,7 @@ static void g2d_userptr_put_dma_addr(struct g2d_data *g2d,
 
 out:
 	dma_unmap_sg(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt->sgl,
-			g2d_userptr->sgt->nents, DMA_BIDIRECTIONAL);
+		     g2d_userptr->sgt->orig_nents, DMA_BIDIRECTIONAL);
 
 	pages = frame_vector_pages(g2d_userptr->vec);
 	if (!IS_ERR(pages)) {
@@ -511,8 +511,9 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 
 	g2d_userptr->sgt = sgt;
 
-	if (!dma_map_sg(to_dma_dev(g2d->drm_dev), sgt->sgl, sgt->nents,
-				DMA_BIDIRECTIONAL)) {
+	sgt->nents = dma_map_sg(to_dma_dev(g2d->drm_dev), sgt->sgl,
+				sgt->orig_nents, DMA_BIDIRECTIONAL);
+	if (!sgt->nents) {
 		DRM_DEV_ERROR(g2d->dev, "failed to map sgt with dma region.\n");
 		ret = -ENOMEM;
 		goto err_sg_free_table;
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
