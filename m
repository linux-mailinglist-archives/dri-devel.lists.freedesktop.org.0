Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177B81C3A18
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A9689938;
	Mon,  4 May 2020 12:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDD789453
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:15 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200504125414euoutp022d317f3d5a321dd90c2539a80375589b~L1GwlfZYo1833318333euoutp02w
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200504125414euoutp022d317f3d5a321dd90c2539a80375589b~L1GwlfZYo1833318333euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588596854;
 bh=KRVlGBMWUMeFLIc4seX4vfQItfXPKOxJ9zTuRN/2uN8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ETjGLkuri1vf6mB4u+3s1hKfAozeCclWfPaf/NAZnxZQnZar0v2/rkWhfwzK7KSAR
 nqSFb8sUpQTj0SG5Qg2xAvJ+tpJj3Yd3VRAOz/3paWlgyvi+GTqEYflPp5zVGZ3i8G
 HPkqomD7yaJRSm4W1sU8gg//ACzCmDBFFf+2ISR4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200504125414eucas1p102cc8208190adf70a6c931a13d161dcb~L1GwSbGfN1173511735eucas1p1a;
 Mon,  4 May 2020 12:54:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id F9.D2.60679.67010BE5; Mon,  4
 May 2020 13:54:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200504125413eucas1p23d4a2a1b9f3ffec973914228b0533d04~L1Gv5j4lt2227522275eucas1p2j;
 Mon,  4 May 2020 12:54:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200504125413eusmtrp1b5c04b81695495550a5353122370e17a~L1Gv4zLML2497724977eusmtrp1W;
 Mon,  4 May 2020 12:54:13 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-9d-5eb010768123
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 45.06.07950.57010BE5; Mon,  4
 May 2020 13:54:13 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200504125412eusmtip2bd50e632461d52dfe361e3017e4a4c43~L1GvAWra40241002410eusmtip2H;
 Mon,  4 May 2020 12:54:12 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/21] drm: i915: fix sg_table nents vs. orig_nents
 misuse for dmabuf objects
Date: Mon,  4 May 2020 14:53:44 +0200
Message-Id: <20200504125359.5678-6-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200504125359.5678-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSWUwTURSGc2c60wEZHArKFY2YJioQBUFIRkGi0Zh51MQHYgQtMmGxLdBh
 EXwQxIVUQDYjAmJZIjtlCyCLSFkKKTRsIaioVCABY9GETdGgDKP49p3//uf8595cApV0Yg5E
 qDKKVSllciluKWrq+2E8GkPVBhxLLiLoVOMAQtflaDH6d1MGSo+vfMXp8spehM5Lb0BoTac3
 XTqmBXRHIUIvj5sQun5mAqPHWvNxurrnvZju+jaL0Z25E+LTO5mqgirAdKxqRExx+wLCNK9O
 Y0zBwEXm40M9wjSU3GbebcygTNZkKWDa3iTgTFpjBWCW6vdfsLps6RPEykNjWJWb7zXLkLZp
 Ix6Rt+dm4WgDlgCSd6mBBQEpTzjS1IfxLKHKAOw2k2pgucnLAD4efAWEYgnAOuOyWA2IrY7m
 9HhBLwVQ87If3+7QjyQBfhROuUO1WY3zbEfdA7A/1Yo3oVQPCkc1E1smWyoQzqX2AX6qiDoI
 uwoieSQpH7iqixS2c4SVta9RXragTsGnqYf5KZB6K4aTdRpM8JyDhmc/EYFt4Wd9o1jgfdCQ
 lSISGpIANBmrxUKRAuDYnRwguLzhlHEd5xNQyhlqW90E+QwcWjejwoWt4aTZhpfRTcxsevJX
 JmHyfYngPgRz9TXbsV3Do6jADGzV1YuEx+0GsL3KKx045v7P0gBQAezZaE4RzHIeSjbWlZMp
 uGhlsOv1cEU92PxWhg39cgto/RWoAxQBpFak35I2QILJYrg4hQ5AApXakS13NyUySBYXz6rC
 r6qi5SynA3sJkdSePF604C+hgmVR7A2WjWBV/04RwsIhATjNG0769fRlOr9oc1Qo1bOPAuNL
 QVWs/nyY/9QwPVI2ZOgaUd9iLtSISw5w3Z4Zi+VJ5oREw5DXp0SP3oh552BEblys06xd8SzJ
 Sptec9Jlfx8szszdoTDZWp8wyeRnx6JsTFpydcW3Wxc796FdcSSMvJT/fCX7i4vFg932nFTE
 hcjcXVAVJ/sDtZ5v8lIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7qlAhviDNbv0LToPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSxmT9jMZLFgv7XF8svrGS32LmSy+HLlIZPFpsfXWC0u75rDZrH2
 yF12i4MfnrBa7J91jd2B32PNvDWMHnu/LWDxWLznJZPH9m8PWD3mnQz0uN99nMlj85J6j9v/
 HjN7TL6xnNFj980GNo++LasYPT5vkgvgidKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0
 No+1MjJV0rezSUnNySxLLdK3S9DL2P3gHFvBbMmKhZc2szYwdoh2MXJwSAiYSGyfUNXFyMUh
 JLCUUWL/vQ6WLkZOoLiMxMlpDawQtrDEn2tdbBBFnxglHl2czgySYBMwlOh6C5EQEehklJjW
 /ZEdJMEscIZZ4vcGbxBbWCBB4ktjPwvINhYBVYmD8wpBTF4BG4lvhwoh5stLrN5wgBkkzClg
 KzGzVx0kLCSQL3H36T+WCYx8CxgZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgRGz7ZjP7fs
 YOx6F3yIUYCDUYmHd8PX9XFCrIllxZW5hxglOJiVRHh3tACFeFMSK6tSi/Lji0pzUosPMZoC
 XTSRWUo0OR8Y2Xkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhh7
 br3cc0qS+dq6WtvIBdITq69fOKHrPX8L95raiLwluxRnHZl3aXOJ3JOn/YwfFtbnir6VXFGs
 Y3ClfTHzV756HuEtd8ysO5wtJwum2OeapH4Ilfz38b/0lIXXfTIWr3OLuaoud9uuzTpIIK58
 /p3VH5f2xbF+CE0QaN0jcP+I5rOSu58KDEOUWIozEg21mIuKEwFU8AbptAIAAA==
X-CMS-MailID: 20200504125413eucas1p23d4a2a1b9f3ffec973914228b0533d04
X-Msg-Generator: CA
X-RootMTR: 20200504125413eucas1p23d4a2a1b9f3ffec973914228b0533d04
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200504125413eucas1p23d4a2a1b9f3ffec973914228b0533d04
References: <20200504125017.5494-1-m.szyprowski@samsung.com>
 <20200504125359.5678-1-m.szyprowski@samsung.com>
 <CGME20200504125413eucas1p23d4a2a1b9f3ffec973914228b0533d04@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Robin Murphy <robin.murphy@arm.com>,
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
in include/linux/scatterlist.h.

This driver creatively uses sg_table->orig_nents to store the size of the
allocate scatterlist and ignores the number of the entries returned by
dma_map_sg function. The sg_table->orig_nents is (mis)used to properly
free the (over)allocated scatterlist.

This patch only fixes the sg_table->nents entries in the sg_table objects
exported by the dmabuf related functions, so the other drivers, which
might share buffers with i915 could rely on the nents and orig_nents
values.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v2 00/21] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/4/373
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       | 9 +++++----
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c | 5 +++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 7db5a79..98159df 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -48,9 +48,10 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
 		src = sg_next(src);
 	}
 
-	if (!dma_map_sg_attrs(attachment->dev,
-			      st->sgl, st->nents, dir,
-			      DMA_ATTR_SKIP_CPU_SYNC)) {
+	st->nents = dma_map_sg_attrs(attachment->dev,
+				     st->sgl, st->orig_nents, dir,
+				     DMA_ATTR_SKIP_CPU_SYNC);
+	if (!st->nents) {
 		ret = -ENOMEM;
 		goto err_free_sg;
 	}
@@ -74,7 +75,7 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attachment,
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(attachment->dmabuf);
 
 	dma_unmap_sg_attrs(attachment->dev,
-			   sg->sgl, sg->nents, dir,
+			   sg->sgl, sg->orig_nents, dir,
 			   DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sg);
 	kfree(sg);
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
index debaf7b..5723525 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
@@ -28,7 +28,8 @@ static struct sg_table *mock_map_dma_buf(struct dma_buf_attachment *attachment,
 		sg = sg_next(sg);
 	}
 
-	if (!dma_map_sg(attachment->dev, st->sgl, st->nents, dir)) {
+	st->nents = dma_map_sg(attachment->dev, st->sgl, st->orig_nents, dir);
+	if (!st->nents) {
 		err = -ENOMEM;
 		goto err_st;
 	}
@@ -46,7 +47,7 @@ static void mock_unmap_dma_buf(struct dma_buf_attachment *attachment,
 			       struct sg_table *st,
 			       enum dma_data_direction dir)
 {
-	dma_unmap_sg(attachment->dev, st->sgl, st->nents, dir);
+	dma_unmap_sg(attachment->dev, st->sgl, st->orig_nents, dir);
 	sg_free_table(st);
 	kfree(st);
 }
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
