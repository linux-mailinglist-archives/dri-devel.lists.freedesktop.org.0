Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484711C50EB
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9ED6E58E;
	Tue,  5 May 2020 08:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025B06E57E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:32 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084631euoutp01d21d452dc6c359e57962592274de463a~MFXwsCM5u0326103261euoutp01h
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200505084631euoutp01d21d452dc6c359e57962592274de463a~MFXwsCM5u0326103261euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668391;
 bh=TWyjNbzcAqu4w5jR6CJEvjjAGbRJaCh1PCu4try6g44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mLoaz6u80wps/y4JbykU4nh4TLmkOV8emGNILG7nFKS7xgzolVN3MMfA3Rd+RomoB
 vjU/Xga/12Z2ZdpDFLauewsKLSFMGCmAK8rY4eCYqO3Kk1rlk/trhuZj4ue91saYUc
 CptKtWinGxA+GprP2q1QTGpUAs9G4D+wOLC1gPDM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200505084631eucas1p2ff09db1c335f96f84aa635e65beca1c3~MFXwWiVvO1349613496eucas1p2q;
 Tue,  5 May 2020 08:46:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 20.11.60698.7E721BE5; Tue,  5
 May 2020 09:46:31 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200505084630eucas1p2199401486591b681b84a4b24496295fb~MFXv_2LdP1349613496eucas1p2p;
 Tue,  5 May 2020 08:46:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084630eusmtrp1d4e2b4f85f2fa3b85a8291c81b5e1d8a~MFXv_MUvM0942309423eusmtrp1b;
 Tue,  5 May 2020 08:46:30 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-3b-5eb127e78af2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 0A.21.07950.6E721BE5; Tue,  5
 May 2020 09:46:30 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084630eusmtip1ab284a34c04f7bc07a3ec27e3b008a46~MFXvZpThe0580805808eusmtip19;
 Tue,  5 May 2020 08:46:30 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/25] drm: rockchip: fix common struct sg_table related
 issues
Date: Tue,  5 May 2020 10:46:01 +0200
Message-Id: <20200505084614.30424-12-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfyyUcRzH973nnucel9PjKN9RabddRfNr+uMpzWpr7fmnTUXFSl08wzg/
 7vyIrbJ+SlychQwT5vy6cDh2TWI4JTfDjCg/pzBjzsnvy3mi/96f9+f1+bw/++6LI/wm1BYP
 CY+mJeGiMAHGZas71nROv07W+Luu1fHIVN0XFlmTXYWSRnU6QvYbFjCyrKKdRRon5lAyT/6Q
 LGj2IJf7x1mkanIAJfs0uRi5NGZESGXbDw7ZsjiFXrCgKvMrAdW0UsCmGlbGUGr0tZZF1RY/
 poa3JxEqY1ABqI9DiRi1ldPMpmR15YBqGMhHKL3qmJe5H/d8IB0WEktLXDzvcYOn5qo5kfV2
 D77/VmOJYPFwMjDDIXEGbjS9QpMBF+cTpQB2zZawmGIZwJcToxhT6AHUNxqRvZGkjmmEaSgA
 rF6dZu+P1P7U7FIY4QaT55Mxk7YmngPYmWpu0giRicByw2WTtiK8YcaCcofHcTYhhO9LhSab
 R3jCQt0mxoTZw4rqz7srzXb8yd6R3YsgMcCBX9tmUNMsJC7BNIMPw1vBWW0dh9FHYFdGCpvh
 nwI4rlNymCIFwL4n2YChPOCIbh0zLUIIB1ilcWHsi7BuQwGY/RZwcN6SOd8CytVZCGPzYNIL
 PkOfgDnaD/uxLT29/xAKLsu9mddpB7BIuYamAfuc/1kFAJQDGzpGKg6ipe7hdJyzVCSWxoQH
 OQdEiFVg51N1bWsNjeDT5v1WQOBAYM67pa/y56OiWGm8uBVAHBFY80pWq/35vEBRfAItibgr
 iQmjpa3ADmcLbHjuhTN3+ESQKJoOpelIWrLXZeFmtomgs/+0p4NPVOmQrZsiwato9e21o7fn
 cqMO2CpPhYq2fJ5pNhXf8v54dJdd9Qg7dH3kLCE0XxJaH4+xkXsXuhx85Js23nUl040rW79p
 SO9NtCcU5+xjb2xuxwXI5DU9QZJBz7Rix3qZDeGqGnbivgtV+8WHLne/IS1lmVm+CyHcVQFb
 Gixyc0QkUtFfx8PWW1ADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xu7rP1DfGGUzqNLLoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSz+P3rNajF3Uq3Fgv3WFl+uPGSy2PT4GqvF5V1z2Cw+PfjPbLH2
 yF12i4MfnrA68HmsmbeG0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj980GNo+/
 s/azePRtWcXosf3aPGaPz5vkAnii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62M
 TJX07WxSUnMyy1KL9O0S9DKevN7AXrBVuuLWi21sDYwfxLoYOTkkBEwkOo49Y+5i5OIQEljK
 KNH9/D4rREJG4uS0BihbWOLPtS42iKJPjBK9U28zgSTYBAwlut5CJEQEOhklpnV/ZAdxmAXm
 MUssX3UYrEpYIEji7qU3QDYHB4uAqsTCFaogYV4BO4lF5/6wQWyQl1i94QAziM0JFH986Q5Y
 XEigUOLD+e+sExj5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMnm3Hfm7Zwdj1LvgQ
 owAHoxIP74av6+OEWBPLiitzDzFKcDArifAu+7EhTog3JbGyKrUoP76oNCe1+BCjKdBNE5ml
 RJPzgZGdVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBUUzl6rk/
 s19LXp615XHX5oVC+bKG5RM+pFcacDS0/lmmumzyxQf70muXbapwvzI9wXnifrkHzzZGbL+q
 /bSGdb3iY+27M55I/LrG3euSJB7MNPn6s+4z9549X75I0jZG9tr7LY//6upP25+5j+veb6US
 oWPl9avmPf+p0dBw9Vmwh9889fUtJ0uUWIozEg21mIuKEwE9GvK2tAIAAA==
X-CMS-MailID: 20200505084630eucas1p2199401486591b681b84a4b24496295fb
X-Msg-Generator: CA
X-RootMTR: 20200505084630eucas1p2199401486591b681b84a4b24496295fb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084630eucas1p2199401486591b681b84a4b24496295fb
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084630eucas1p2199401486591b681b84a4b24496295fb@eucas1p2.samsung.com>
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

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of the entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. A common mistake was to ignore a result
of the dma_map_sg function and don't use the sg_table->orig_nents at all.

To avoid such issues, lets use common dma-mapping wrappers operating
directly on the struct sg_table objects and adjust references to the
nents and orig_nents respectively.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v3 00/25] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/5/187
---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 0d18846..9df7d7d 100644
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
+	for_each_sg(rk_obj->sgt->sgl, s, rk_obj->sgt->orig_nents, i)
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
+					  DMA_BIDIRECTIONAL);
 		}
 		drm_prime_gem_destroy(obj, rk_obj->sgt);
 	} else {
@@ -493,15 +492,14 @@ static unsigned long rockchip_sg_get_contiguous_size(struct sg_table *sgt,
 			struct sg_table *sg,
 			struct rockchip_gem_object *rk_obj)
 {
-	int count = dma_map_sg(drm->dev, sg->sgl, sg->nents,
-			       DMA_BIDIRECTIONAL);
-	if (!count)
-		return -EINVAL;
+	int err = dma_map_sgtable(drm->dev, sg, DMA_BIDIRECTIONAL);
+	if (err)
+		return err;
 
-	if (rockchip_sg_get_contiguous_size(sg, count) < attach->dmabuf->size) {
+	if (rockchip_sg_get_contiguous_size(sg, sg->nents) <
+	    attach->dmabuf->size) {
 		DRM_ERROR("failed to map sg_table to contiguous linear address.\n");
-		dma_unmap_sg(drm->dev, sg->sgl, sg->nents,
-			     DMA_BIDIRECTIONAL);
+		dma_unmap_sgtable(drm->dev, sg, DMA_BIDIRECTIONAL);
 		return -EINVAL;
 	}
 
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
