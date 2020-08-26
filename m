Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928B725272B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEAE6EA0F;
	Wed, 26 Aug 2020 06:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416BC6EA0A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:39 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063537euoutp0209531848035b97d6f385047f2d7e792a~uveu_iiW-1511215112euoutp02U
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200826063537euoutp0209531848035b97d6f385047f2d7e792a~uveu_iiW-1511215112euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423738;
 bh=Xz5Z61X+A6u/FrMD8ciD40ug8xujs/WBHWVc8ZYxDIk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kxfw5LQqbscH9OS4T8DqP+mQ2eczTgxb/qcn46n/wvZsQNbgcBXNi21WR52Y+nQTX
 yFix7yFVsvWXRvjIJTSRCOeitt4a+46gZ9co/sJl5UjdL8Mf9vZc3hN7C54iNXds//
 FtWfIV0c71QaDoXx+GfAKSVgoBAPMcuUxcd5f298=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200826063537eucas1p136ab8e9b3264dbfa54eb4f93d3546818~uveuo2RVu1478314783eucas1p1c;
 Wed, 26 Aug 2020 06:35:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 9F.AD.05997.9B2064F5; Wed, 26
 Aug 2020 07:35:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200826063537eucas1p1462d4761c8eb6d762fe5ea0fbd3b6e3b~uveuV-lbG1942019420eucas1p1t;
 Wed, 26 Aug 2020 06:35:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826063537eusmtrp152c96356b8271c4f15f3f216299ac3ec~uveuVWek81167511675eusmtrp1B;
 Wed, 26 Aug 2020 06:35:37 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-cf-5f4602b9c337
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E5.D0.06314.9B2064F5; Wed, 26
 Aug 2020 07:35:37 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063536eusmtip225a50614f20e5520d7b433fd13c9606c~uvetwvLfs0091500915eusmtip2I;
 Wed, 26 Aug 2020 06:35:36 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 16/32] drm: rockchip: use common helper for a scatterlist
 contiguity check
Date: Wed, 26 Aug 2020 08:33:00 +0200
Message-Id: <20200826063316.23486-17-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0zTUBzFc9u16+aG3SThRkHNDIomikM/VIfGF1ojGv1qIqNqBeI2cQUU
 E5CgEkUebhAloGSiBoUhOpDHVF5Rp0GngTnxQWTgjIITAxuKUZCmqN9+59z/ueefm0ugylZs
 NpFkSGGNBkanwqWihkfjz5c2I5u1y+s8C6h85xOEul1Si1GTDSaUcgWGcepG9UOEmuwfwqhL
 5gzK0qqh/C4PQtkG3BjVbb+IUyN9kyhV86BXTLV/+4CtC6Kt5VZA3x+ziOjGsT6Mfn/WgdB1
 V4/TbycGULqopxLQd19n4fTv0lYRXVBfBehGdzlKj9rm7pTtlkbvZ3VJaawxcm28NPHzpQqQ
 XC07OnjVjGWB69JcICEguRK6PU1ILpASSvI6gCN3bgFB+AHMv3cTFcQogL43V7C/kYIzJ6cj
 lQC+cnvRfxHT/QDCT+GkGub6cnGeg8lTAD7Ol/GMkudRWBXYzPMsUgs/ec9M3UoQIjIcBorn
 87acXAsLB9sQoWwerL7VhvIsmfIdZwtxvguSbjH0uby4MLQJdn8fBgLPgoOOerHAobCzKE8k
 BE4A6HHWiAWRB2B3dsl0QgPfOX/i/BYouRjW2iMFez2sdNvEvA3JINjjUwj7B0FzwwVUsOXw
 dI5SmF4ISx03/9W2v+hCBaZhaVPZ9JOaADyZMwHOgXml/8ssAFSBEDaV0yewXJSBPbKMY/Rc
 qiFh2b5DehuY+ladEw5/E7D/2tsBSAKoZHILHqNVYkwal67vAJBAVcHyDc8645Ty/Uz6MdZ4
 SGtM1bFcB5hDiFQh8hUVn/coyQQmhT3Issms8e8pQkhmZ4EDX1qcQ+M3Fl3cgEaEniteo7Jy
 8YcjwoZG8uxx5XmKbQfqTMUbPeoZS4d7Ymb6mZh01bjOuqol7Ojz9rLsLtlqg17e5e7+aP3x
 SfN1a1xX7A7XtdpVFzKLEsNDt9uS/WZvx9NdEiKjmGlRJBxLVis0L3tjbYHm/mh4OTMqdcsu
 lYhLZNRLUCPH/AEA06MOUgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7o7mdziDWad4bfoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSz+P3rNajF3Uq3Fgv3WFl+uPGSy2PT4GqvF5V1z2Cw+PfjPbLH2
 yF12i4MfnrA68HmsmbeG0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj980GNo+/
 s/azePRtWcXosf3aPGaPz5vkAnii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62M
 TJX07WxSUnMyy1KL9O0S9DJezl3EWLCap+LVkkmsDYwruLoYOTkkBEwk+jpbmLoYuTiEBJYy
 SrTvu8MIkZCRODmtgRXCFpb4c62LDaLoE6PExO5+dpAEm4ChRNdbiISIQCejxLTuj+wgDrPA
 PGaJ5asOM4FUCQvESsw+OI+li5GDg0VAVeLrFAWQMK+AnUT/qwNMEBvkJVZvOMAMYnMCxY93
 97OB2EICthKn185gnsDIt4CRYRWjSGppcW56brGhXnFibnFpXrpecn7uJkZg9Gw79nPzDsZL
 G4MPMQpwMCrx8C5gc40XYk0sK67MPcQowcGsJMLrdPZ0nBBvSmJlVWpRfnxRaU5q8SFGU6Cb
 JjJLiSbnAyM7ryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QDY6pJ
 4PbHJq+KZ+m+SnnrtnebdIjp30qNqRuU1l04sT7r+aZ55zI0U6MczpYda2zO+LrqCb+r2bQJ
 3HOdt5yu/rmg5DbHdObl3PZ8+vrFOWq3Ay0WfXuXszTlVd7d7nMuU/o9DbQmiPhkxuv6KyRm
 zZj7KEF+6gTvZye3f4h/cEjw57aYRL43/5VYijMSDbWYi4oTAc8Z7z+0AgAA
X-CMS-MailID: 20200826063537eucas1p1462d4761c8eb6d762fe5ea0fbd3b6e3b
X-Msg-Generator: CA
X-RootMTR: 20200826063537eucas1p1462d4761c8eb6d762fe5ea0fbd3b6e3b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063537eucas1p1462d4761c8eb6d762fe5ea0fbd3b6e3b
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063537eucas1p1462d4761c8eb6d762fe5ea0fbd3b6e3b@eucas1p1.samsung.com>
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

Use common helper for checking the contiguity of the imported dma-buf.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index b9275ba7c5a5..2970e534e2bb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -460,23 +460,6 @@ struct sg_table *rockchip_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	return sgt;
 }
 
-static unsigned long rockchip_sg_get_contiguous_size(struct sg_table *sgt,
-						     int count)
-{
-	struct scatterlist *s;
-	dma_addr_t expected = sg_dma_address(sgt->sgl);
-	unsigned int i;
-	unsigned long size = 0;
-
-	for_each_sg(sgt->sgl, s, count, i) {
-		if (sg_dma_address(s) != expected)
-			break;
-		expected = sg_dma_address(s) + sg_dma_len(s);
-		size += sg_dma_len(s);
-	}
-	return size;
-}
-
 static int
 rockchip_gem_iommu_map_sg(struct drm_device *drm,
 			  struct dma_buf_attachment *attach,
@@ -498,7 +481,7 @@ rockchip_gem_dma_map_sg(struct drm_device *drm,
 	if (!count)
 		return -EINVAL;
 
-	if (rockchip_sg_get_contiguous_size(sg, count) < attach->dmabuf->size) {
+	if (drm_prime_get_contiguous_size(sg) < attach->dmabuf->size) {
 		DRM_ERROR("failed to map sg_table to contiguous linear address.\n");
 		dma_unmap_sg(drm->dev, sg->sgl, sg->nents,
 			     DMA_BIDIRECTIONAL);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
