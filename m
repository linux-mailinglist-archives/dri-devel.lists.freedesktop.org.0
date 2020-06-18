Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B121FF74E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3638C6EB7B;
	Thu, 18 Jun 2020 15:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365666EB72
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:24 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200618154022euoutp01f33239db43b1185de9eba717712ff5f4~ZrZqYpX5k1835418354euoutp01B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200618154022euoutp01f33239db43b1185de9eba717712ff5f4~ZrZqYpX5k1835418354euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592494822;
 bh=dgA8N0ViLqnC/QZEgzrc3l/K0+XnEV3AJx7m2vhhZ9o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LHn85sMeOO4rmyR3Hovjkzb7mH+Rj8Cgl1aUWkKSKUkFmRhqzylAo1GfJWXu5Sj3P
 J5IsGY75/GDOxtAN6qedWvEV2RZyROny6xiO8OGxfjMdc3sxU5DknBiFga3LrzoZPa
 WzcsL9Y6ASWmVO9xXxfh/zIV7BPHBw/QoeWOyl7k=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200618154022eucas1p1cc2c3555a8b3a71e30ddd163b7e2b4df~ZrZqLudAu1755717557eucas1p1G;
 Thu, 18 Jun 2020 15:40:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E2.1F.61286.6EA8BEE5; Thu, 18
 Jun 2020 16:40:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154022eucas1p1a8136b9677ac6a98ac47a3154ab0c763~ZrZp8yY471545815458eucas1p1S;
 Thu, 18 Jun 2020 15:40:22 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200618154022eusmtrp29f126925ca53016633b0dde40b5af358~ZrZp8GBKM0370403704eusmtrp2h;
 Thu, 18 Jun 2020 15:40:22 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-cb-5eeb8ae62003
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 79.EE.08375.6EA8BEE5; Thu, 18
 Jun 2020 16:40:22 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154021eusmtip160203d7d536539124d9640b161f7055a~ZrZpQHKd80744107441eusmtip1z;
 Thu, 18 Jun 2020 15:40:21 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 12/36] drm: mediatek: use common helper for extracting
 pages array
Date: Thu, 18 Jun 2020 17:39:33 +0200
Message-Id: <20200618153956.29558-13-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBKsWRmVeSWpSXmKPExsWy7djP87rPul7HGXR+lrXoPXeSyWLjjPWs
 Fot6e1ks/m+byGxx5et7NouVq48yWSzYb23x5cpDJotNj6+xWlzeNYfN4nLzRUaLtUfusls0
 tRhb3L13gsXi4IcnrA78HmvmrWH02PttAYvHzll32T02repk89j+7QGrx/3u40wem5fUe9z+
 95jZY/KN5Yweu282sHn0/zXw6NuyitHj8ya5AN4oLpuU1JzMstQifbsEroyuvzuYCx5wVtyY
 8Jq5gXEKRxcjJ4eEgInEqrZ/7F2MXBxCAisYJY60L2WGcL4wSlyZOw/K+cwoMfPaXcYuRg6w
 lj+7xEG6hQSWA8X/qsI1zDqykx0kwSZgKNH1tosNxBYRaGWUONHLA1LELLCHWWLRrl8sIAlh
 gXCJbwf2MYPYLAKqEjfvzgGzeQXsJN41bmGFuE9eYvWGA2BxTqD46eOtrCCDJATusUu8WdnP
 BFHkIrGxeysLhC0s8er4FnYIW0bi/875TBANzYwSD8+tZYdwehglLjfNYISospa4c+4XG8hv
 zAKaEut36UOEHSXmru1gh3iZT+LGW0GQMDOQOWnbdGaIMK9ER5sQRLWaxKzj6+DWHrxwiRnC
 9pDo27OKBRJCExkl+n/OY53AKD8LYdkCRsZVjOKppcW56anFhnmp5XrFibnFpXnpesn5uZsY
 genr9L/jn3Ywfr2UdIhRgINRiYfXIfx1nBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lj
 i0pzUosPMUpzsCiJ8xovehkrJJCeWJKanZpakFoEk2Xi4JRqYFR8cF6nkPvzhOVht76vNyvP
 7nZbX6W+pya7Vdjoe+Qvr+aJ982Mcy2UuC7+3cRW8ex3T8upF9sYzPTWWOy0zjf/F2ywIF9X
 TfHKpCUP6mLCpm0+Gpu+dI9Pg/k3lyeGNb/0d54wafpht2TPW6WVZ+S0BDcc8S/Vv3dtwoOy
 NtMl0lcZf+ckvFFiKc5INNRiLipOBAB33GSmWwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xu7rPul7HGfS957XoPXeSyWLjjPWs
 Fot6e1ks/m+byGxx5et7NouVq48yWSzYb23x5cpDJotNj6+xWlzeNYfN4nLzRUaLtUfusls0
 tRhb3L13gsXi4IcnrA78HmvmrWH02PttAYvHzll32T02repk89j+7QGrx/3u40wem5fUe9z+
 95jZY/KN5Yweu282sHn0/zXw6NuyitHj8ya5AN4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0j
 E0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYyuvzuYCx5wVtyY8Jq5gXEKRxcjB4eEgInEn13i
 XYycHEICSxklDrwvBbElBGQkTk5rYIWwhSX+XOti62LkAqr5xCgxcTWIw8nBJmAo0fUWIiEi
 0MkoMa37IzuIwyxwjFli4+P3zCBVwgKhEk/mHgPrYBFQlbh5dw5YnFfATuJd4xaoFfISqzcc
 AItzAsVPH29lhTjJVuL5hza2CYx8CxgZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgRG07Zj
 PzfvYLy0MfgQowAHoxIP74uQ13FCrIllxZW5hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUkt
 PsRoCnTURGYp0eR8YKTnlcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+Lg
 lGpgtLr0dOdTd/EVLFnJyjVRC/5uXLvcdPKfH9+Wuy2cZnp/m4VsBpuLwFox7rn/e9/Ye/8z
 y5f/+SP3iut55ssvnd+xOezSmPm+JIv3srOC8PlzSjfueS1zXt2yYkHB78cGXvs1k1++fNnz
 6Yb6RkELZ501u85LlTeZNW7zSwu4oX1K5lNk7s3LykosxRmJhlrMRcWJAI8Nqhm8AgAA
X-CMS-MailID: 20200618154022eucas1p1a8136b9677ac6a98ac47a3154ab0c763
X-Msg-Generator: CA
X-RootMTR: 20200618154022eucas1p1a8136b9677ac6a98ac47a3154ab0c763
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154022eucas1p1a8136b9677ac6a98ac47a3154ab0c763
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154022eucas1p1a8136b9677ac6a98ac47a3154ab0c763@eucas1p1.samsung.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use common helper for converting a sg_table object into struct
page pointer array.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 3654ec732029..0583e557ad37 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -233,9 +233,7 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
 {
 	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
 	struct sg_table *sgt;
-	struct sg_page_iter iter;
 	unsigned int npages;
-	unsigned int i = 0;
 
 	if (mtk_gem->kvaddr)
 		return mtk_gem->kvaddr;
@@ -249,11 +247,8 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
 	if (!mtk_gem->pages)
 		goto out;
 
-	for_each_sg_page(sgt->sgl, &iter, sgt->orig_nents, 0) {
-		mtk_gem->pages[i++] = sg_page_iter_page(&iter);
-		if (i > npages)
-			break;
-	}
+	drm_prime_sg_to_page_addr_arrays(sgt, mtk_gem->pages, NULL, npages);
+
 	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
 			       pgprot_writecombine(PAGE_KERNEL));
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
