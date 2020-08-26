Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D974D252727
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4E46EA0D;
	Wed, 26 Aug 2020 06:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F93B6E9FB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063538euoutp019826a3fb2314af1f0a2046b3194c8706~uvevYZXu-2034020340euoutp01H
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200826063538euoutp019826a3fb2314af1f0a2046b3194c8706~uvevYZXu-2034020340euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423738;
 bh=uRyWiAszaWTmT9aEcwSkw+b3g8jzvTahdvI0hzE+vrU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qjBX2sKEANbpTjEELL+iw+WxvWe2nMTwKLP8c7kHJjy+Udhw8rrzUnnHnpUVWE+LK
 b0CE6aINQRrzZhIMOP9gqPEWh83uaxZs75zeQXw2ae9UPlgTqciN0hzstJgFSij2Mk
 /nPVjUg1AbZhjq/fPnZFQN/HazLdnHxDS5PmlyVI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200826063538eucas1p130c03342b3f968e5ba15935b3d3b2846~uvevH9AAK1474114741eucas1p1j;
 Wed, 26 Aug 2020 06:35:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C0.BD.05997.AB2064F5; Wed, 26
 Aug 2020 07:35:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063537eucas1p2d9a362f619920ad84c46f36cd13ec362~uveu5z7t10402704027eucas1p2o;
 Wed, 26 Aug 2020 06:35:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826063537eusmtrp18354272b9bd79ea9e0ab3346ae6d40a0~uveu5Khce1091110911eusmtrp1d;
 Wed, 26 Aug 2020 06:35:37 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-d2-5f4602ba9b84
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 27.D0.06314.9B2064F5; Wed, 26
 Aug 2020 07:35:37 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063537eusmtip2377aced114f05b610537df16fe2b3f76~uveuVRx0Y0302303023eusmtip2z;
 Wed, 26 Aug 2020 06:35:37 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 17/32] drm: rockchip: fix common struct sg_table related
 issues
Date: Wed, 26 Aug 2020 08:33:01 +0200
Message-Id: <20200826063316.23486-18-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSWUwTURSGuTOd6UAoGQrKDaKYJpCALKI8jNQQNUrmhciDT0bFIpNChEI6
 gEKCIASXsklLhKASggjIIlsFUiTsFoOgyNYqSNmURYTIohAEKQP49p3//P89595cAhU2YbZE
 sCyCkcskISLcjFf7du2Dqwbx8T8+04ZTqT3vEKoquwKjtmozUKp/ZQGnXpZ2INTW+BxGPVPG
 UnlNYmq5fwyhqicGMapP8xSnfhm2UKq8fYRPtSxOYmcs6LLcMkA3rubx6LpVA0aPJmsRuqYg
 jv6yOYHSKl0RoBv08Tj9N6eJR6epSwBdN5iL0kvVR/zML5udDmRCgqMYubv3dbOgjiYlFp5+
 +Hbi+DoWD1RQAUwJSHrC15lfcQUwI4RkMYDDdZUYVywDWKXpRYwuIbkE4FSW9V7ic0chwpmK
 AJxb+M3bT0xPPOcbXTjpARXzCtzI1mQSgJ2p5kZGyccoLFnxMbIVeQl+u2/Y8fNIB6jXVwAj
 C0hvOKAuwLlp9rC0shk1sum2rk1O39kVkoN8WL+WuWs6Dxt6NwDHVnBWq+ZzbAe7VCk8LpAI
 4FhPOZ8rUgDsS8jeTYjhcM/69knE9npOsELjzslnYdrkBN8oQ9IC6uYtuQtYQGVtFsrJAvjg
 npBzO8Ic7av9sS0fP6Ec01CZqN19rQwAmyeHkEfAPuf/sDwASoANE8mGShn2hIy55cZKQtlI
 mdTtRlhoNdj+Vl2b2uV6oNkIaAUkAUTmgjz8gr8Qk0Sx0aGtABKoyFpwrrvrmlAQKImOYeRh
 /vLIEIZtBYcInshGcDJ/5qqQlEoimJsME87I97oIYWobD1IDlzvHqLhCIC2fVTocVVk3Tsmm
 D4hm786bBLjEyLxsTcJjY+vfDOTr3xe7Jn1v06U+8XooVXd5HbPTs+WW9qM1fkIH30VxwsFT
 P3VlYkWmxNHds0E1tHjxhVrc0KdoGRkIijfcaSvy1KW1G5y6XYdMDS7OvldwXXfkj8E/qyIe
 GyTxcEblrOQfAWXL91IDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7o7mdziDTY/NrHoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSz+P3rNajF3Uq3Fgv3WFl+uPGSy2PT4GqvF5V1z2Cw+PfjPbLH2
 yF12i4MfnrA68HmsmbeG0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj980GNo+/
 s/azePRtWcXosf3aPGaPz5vkAnii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62M
 TJX07WxSUnMyy1KL9O0S9DKO7p/EWtAvW9H86BdrA+NkiS5GTg4JAROJW0eXMXUxcnEICSxl
 lJhzYT8LREJG4uS0BlYIW1jiz7UuNhBbSOATo0T7ZE8Qm03AUKLrLUici0NEoJNRYlr3R3YQ
 h1lgHrPE8lWHmUCqhAWCJA5cmMUOYrMIqErcvLmeEcTmFbCTuLplCRvEBnmJ1RsOMIPYnEDx
 4939UNtsJU6vncE8gZFvASPDKkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMDo2Xbs5+YdjJc2
 Bh9iFOBgVOLhXcDmGi/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4ymQEdN
 ZJYSTc4HRnZeSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQbGeAf5
 RSmJ8R42xy48bnt30+fCmlU2x5v+XdlpnXNDtmg+86qKHqGtD1e/NZtx1J7bvG32hG7PlWsa
 d3o8z51ZuaS+0nhZ0FH/w6lvj+rHfJld/OJwrugKP8GV7++WT2uvnO3wJ2ZvksO/SNn5DmI8
 P59ezjkrd0pjMVfWQ4+d85fd6O94UJywRImlOCPRUIu5qDgRALOlfSi0AgAA
X-CMS-MailID: 20200826063537eucas1p2d9a362f619920ad84c46f36cd13ec362
X-Msg-Generator: CA
X-RootMTR: 20200826063537eucas1p2d9a362f619920ad84c46f36cd13ec362
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063537eucas1p2d9a362f619920ad84c46f36cd13ec362
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063537eucas1p2d9a362f619920ad84c46f36cd13ec362@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
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
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 23 +++++++++------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 2970e534e2bb..cb50f2ba2e46 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -36,8 +36,8 @@ static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
 
 	rk_obj->dma_addr = rk_obj->mm.start;
 
-	ret = iommu_map_sg(private->domain, rk_obj->dma_addr, rk_obj->sgt->sgl,
-			   rk_obj->sgt->nents, prot);
+	ret = iommu_map_sgtable(private->domain, rk_obj->dma_addr, rk_obj->sgt,
+				prot);
 	if (ret < rk_obj->base.size) {
 		DRM_ERROR("failed to map buffer: size=%zd request_size=%zd\n",
 			  ret, rk_obj->base.size);
@@ -98,11 +98,10 @@ static int rockchip_gem_get_pages(struct rockchip_gem_object *rk_obj)
 	 * TODO: Replace this by drm_clflush_sg() once it can be implemented
 	 * without relying on symbols that are not exported.
 	 */
-	for_each_sg(rk_obj->sgt->sgl, s, rk_obj->sgt->nents, i)
+	for_each_sgtable_sg(rk_obj->sgt, s, i)
 		sg_dma_address(s) = sg_phys(s);
 
-	dma_sync_sg_for_device(drm->dev, rk_obj->sgt->sgl, rk_obj->sgt->nents,
-			       DMA_TO_DEVICE);
+	dma_sync_sgtable_for_device(drm->dev, rk_obj->sgt, DMA_TO_DEVICE);
 
 	return 0;
 
@@ -350,8 +349,8 @@ void rockchip_gem_free_object(struct drm_gem_object *obj)
 		if (private->domain) {
 			rockchip_gem_iommu_unmap(rk_obj);
 		} else {
-			dma_unmap_sg(drm->dev, rk_obj->sgt->sgl,
-				     rk_obj->sgt->nents, DMA_BIDIRECTIONAL);
+			dma_unmap_sgtable(drm->dev, rk_obj->sgt,
+					  DMA_BIDIRECTIONAL, 0);
 		}
 		drm_prime_gem_destroy(obj, rk_obj->sgt);
 	} else {
@@ -476,15 +475,13 @@ rockchip_gem_dma_map_sg(struct drm_device *drm,
 			struct sg_table *sg,
 			struct rockchip_gem_object *rk_obj)
 {
-	int count = dma_map_sg(drm->dev, sg->sgl, sg->nents,
-			       DMA_BIDIRECTIONAL);
-	if (!count)
-		return -EINVAL;
+	int err = dma_map_sgtable(drm->dev, sg, DMA_BIDIRECTIONAL, 0);
+	if (err)
+		return err;
 
 	if (drm_prime_get_contiguous_size(sg) < attach->dmabuf->size) {
 		DRM_ERROR("failed to map sg_table to contiguous linear address.\n");
-		dma_unmap_sg(drm->dev, sg->sgl, sg->nents,
-			     DMA_BIDIRECTIONAL);
+		dma_unmap_sgtable(drm->dev, sg, DMA_BIDIRECTIONAL, 0);
 		return -EINVAL;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
