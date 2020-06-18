Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148261FF75F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D2D6E433;
	Thu, 18 Jun 2020 15:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9068B6EB6E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:28 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200618154027euoutp016ce2a160312eedd22c1c1a2ea016a520~ZrZupT_2c1845318453euoutp019
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200618154027euoutp016ce2a160312eedd22c1c1a2ea016a520~ZrZupT_2c1845318453euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592494827;
 bh=Xz5Z61X+A6u/FrMD8ciD40ug8xujs/WBHWVc8ZYxDIk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tC6UEjuKXNLSomqGjoEMK8w3W1gK8t6jjjsDBvf2C5Mn3pjdvL5lm3mQeS+RI6OWH
 VEeQXGRiy3b/S8UlEfqJul/del29S9PvIA6uPutMqBDr2THZVqs0GvrHSy9cxVtECV
 o9DWG+Is3oCxtrUBDHKPPpc1ZwnjPsA+Qy+tf1W4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200618154027eucas1p146034164d01a03da01714b7775571575~ZrZucqgf01949419494eucas1p1C;
 Thu, 18 Jun 2020 15:40:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 85.1F.61286.AEA8BEE5; Thu, 18
 Jun 2020 16:40:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200618154026eucas1p27589d4e89563b89eb27459cf9743c7b4~ZrZttEmh70501005010eucas1p2h;
 Thu, 18 Jun 2020 15:40:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200618154026eusmtrp1b90595c5c8a06a0bc99d6c76c8ffe717~ZrZtsY_KS2169821698eusmtrp1f;
 Thu, 18 Jun 2020 15:40:26 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-d7-5eeb8aeae3d1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 98.E9.07950.AEA8BEE5; Thu, 18
 Jun 2020 16:40:26 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154025eusmtip1c83939d4801dd13c007ecd453f01f5fd~ZrZtDwou00742307423eusmtip1T;
 Thu, 18 Jun 2020 15:40:25 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 18/36] drm: rockchip: use common helper for a scatterlist
 contiguity check
Date: Thu, 18 Jun 2020 17:39:39 +0200
Message-Id: <20200618153956.29558-19-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfUhTURjGO7v3bnNsdtskjxYqg75RkzQuKaZScQ2E/jKxnK28TGubsqlp
 EA1DiaWmrqaIzg8kbWqayRTLTMuWrabNMawMvwrR+RF+hUWuzav13+99zvuc530Ph43wuzFv
 doo8nVLIxVIhk4Ma3qyb/e1qu+iophQQBeYBBvGkrAUjHIZihLCuLjKJR439DMIxaceIypKb
 RHVPKLFinWAQbVM2jBjuqmASS+MOhGh+/ZVF9P74hkW4k026JkB2r1WjZMfaOEaO3TUyyKd1
 t8gvG1MIqRmpB+SzTyom+ae8ByUL2/WA7LDpEHK5zeccN54TlkRJUzIpRWD4JU7yTGUtSGvk
 Zs3WlWAq0MBRAzc2xIPhtK2N4WI+3gDg6ACqBhwnrwDYXTq5VSwDuPB5DGw7LO86UdpRD6Bt
 6CrNTkeN2tfFTDwIqufVTBd74LkAvi3guhjBtQjUr55xsQBPhB0LIywXo/g+6Ghv2mQeHg4/
 vtKidJYvbGx9ibjYzambjLmYayCIW1gwp8vOpJtOwVrd2pZBAGeN7Sya90KTJh+lDbcBnDA3
 s+giH8DhnLKtdULhqPmX8ya2c7xDsKUrkJYjYc2Dnk0Z4u5wZH4XvYA7LDGUIrTMg3fy+HT3
 flhufPwvtnfIgtBMQov6N0I/YjGAppEmpAj4lv8PqwZADzypDKVMQimD5NT1AKVYpsyQSwKu
 pMragPNTmTaMS51g1XK5D+BsIOTyIs7bRXxMnKnMlvUByEaEHryoDyYRn5ckzr5BKVITFRlS
 StkH9rBRoSfvWO1MAh+XiNOpaxSVRim2TxlsN28VCO13+N2rTT0eWxgyZ7Nqyk6zFiVLVeui
 YGnB/QlZ2AkvlmHgp/lgkXbQ/0DHkaiLqti42CysVVtSevaCVlCVVxmjy4z2CtGp3/tFn5z3
 NFjHNUtJkfFR6XEvvovXzdU++ueru1uiHwoMaNXcTsdsoVQ/KEqI2SGdDpsfCq7IF6LKZHHQ
 YUShFP8FLcLImlADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xu7qvul7HGWz6LmDRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMln8f/Sa1WLupFqLBfutLb5cechksenxNVaLy7vmsFl8evCf2WLt
 kbvsFgc/PGF14PNYM28No8febwtYPLZ/e8Dqcb/7OJPH5iX1Hrf/PWb2mHxjOaPH7psNbB5/
 Z+1n8ejbsorRY/u1ecwenzfJBfBE6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZ
 mSrp29mkpOZklqUW6dsl6GW8nLuIsWA1T8WrJZNYGxhXcHUxcnJICJhIXDq1g6WLkYtDSGAp
 o8SyezvYIRIyEienNbBC2MISf651sUEUfWKU+Nu0khkkwSZgKNH1FiIhItDJKDGt+yM7iMMs
 MI9ZYvmqw0wgVcICsRIbnq4As1kEVCX+b1kDtoJXwE7i4uFpLBAr5CVWbzgANpUTKH76eCvY
 aiEBW4nnH9rYJjDyLWBkWMUoklpanJueW2ykV5yYW1yal66XnJ+7iREYP9uO/dyyg7HrXfAh
 RgEORiUe3hchr+OEWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIjRFOioicxS
 osn5wNjOK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXA2LH0943k
 JS7xDQ5O3EveuBoUBu1t+zv7yJ8DaV8f7d1l9Etu/XWttd4bA+/Yu8y2VsgQylQ5WsaeWqrH
 oRLYxd8drHmCz+K4Ts/DlfPSPk7VEyzQthOcN+W+4ez6pH3/G+M/mj//Fv9gqUHr/RczZ99J
 3+u2PuVa8IPqKRWLpP4ee7E1JLbcU4mlOCPRUIu5qDgRAI6ky061AgAA
X-CMS-MailID: 20200618154026eucas1p27589d4e89563b89eb27459cf9743c7b4
X-Msg-Generator: CA
X-RootMTR: 20200618154026eucas1p27589d4e89563b89eb27459cf9743c7b4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154026eucas1p27589d4e89563b89eb27459cf9743c7b4
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154026eucas1p27589d4e89563b89eb27459cf9743c7b4@eucas1p2.samsung.com>
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
