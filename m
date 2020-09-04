Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C69325D9DF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B7E6E2F2;
	Fri,  4 Sep 2020 13:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6F16E2EC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:02 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133501euoutp017c19930db977672d0acfeee6706e2389~xmAeXN7aE0721507215euoutp01c
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:35:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200904133501euoutp017c19930db977672d0acfeee6706e2389~xmAeXN7aE0721507215euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226501;
 bh=8ianEPGg4Fj0mBOrYoviW1eRvGacK64D5+qLvfqX6cs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Swn//sbHJE7MhmY8WgRnLTnPYgtFyPKP7Gp80rduiRYurtlCt4Ruq4dB7KJqAsPX6
 bvJ7j8HzASO1leb5zRB19P9JM0IEpZBoTrdlhw+z8KZpTM2W5e9fBuAU0ivFAqRNjZ
 daEQmauqnd0aY80f3MCupr1fkTuv5l0FUyGhQ0hw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200904133500eucas1p1ae41c3c4948f784f6d3a773b51c1cd27~xmAeGUcdR0117201172eucas1p1s;
 Fri,  4 Sep 2020 13:35:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8D.01.06456.482425F5; Fri,  4
 Sep 2020 14:35:00 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6~xmAd086oh0694006940eucas1p2i;
 Fri,  4 Sep 2020 13:35:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904133500eusmtrp2113c0e9f6e103ab5048de0d1726d3b03~xmAd0KCpP0977009770eusmtrp2B;
 Fri,  4 Sep 2020 13:35:00 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-3f-5f52428412b4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 54.A0.06017.482425F5; Fri,  4
 Sep 2020 14:35:00 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133459eusmtip17d41314ad1ec08748b7c67e79b4bd95d~xmAdHYUiq1888418884eusmtip1S;
 Fri,  4 Sep 2020 13:34:59 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 11/30] drm: mediatek: use common helper for extracting
 pages array
Date: Fri,  4 Sep 2020 15:16:52 +0200
Message-Id: <20200904131711.12950-12-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRj22zk7Oy5Xx6n5YRdpaaKQd+qAoikGByqK/RApUpeeVNqmbGqp
 RKLLaqVmGcmwJSJ4z5y3vKzyrplWTnSR84L+SEWMvNVIzdNR+/fc3u95eflwRNjPdcDj5Im0
 Qi6RijA+2tjze+ikKlgc4akpdCezh/o5ZG1BDZcszs5Gya3GPIQcWV3CyPLKbg5Z9M6PXBmZ
 5pC6mVEuaWgpxEhD5hdAVneZeGSGyoc0TfShZPuPWe6ZA1SVtgpQ+rUilGrWmHiUruIBRjWt
 TXGpyYe9HKqu5A71bXMGoZ4aSwHV+jUdo3I3PKmc+gpALeuOXhJc5vtH09K4ZFrhERDJjx1f
 q0ETuvm3MtbVWDpYwtXAEoeEL9TOf+CoAR8XEmUALpiMGEtWAFRpJwFLlgFsHcvh7o7MjW0g
 rFEKYKluEOyNDJdt8pgURnhB9aIaY7AtcRfAvmwrJoQQbQgsbjGjjGFDhMGGthHAYJRwhi9y
 s7Y3wXEBEQBVTSFsmyOsfP0eYbDlttxQMMtl3oHEBA+ul5TvrBQC1yo2EBbbwPneeh6LD8Ot
 5pccdiATwOmhah5LHgFoyCgAbMoPjg+ZMaYZIVxhTYsHKwdBQ/HbfzIk9kPjojUjI9vwSeNz
 hJUF8H6WkE2fgJreV3u17Z+Hd9ahoEHfuHPTPADnykY5j4Gj5n9ZEQAVwJ5OUspiaKWXnL7p
 rpTIlEnyGPeoeJkObH+wgc3en2/A6vC1DkDgQGQlsAgURwi5kmRliqwDQBwR2QqCBwfChYJo
 SUoqrYiPUCRJaWUHOISjInuBT/HcVSERI0mkb9B0Aq3YdTm4pUM6SLXr6rAzBU+XfIzUwx77
 +piDLk7eTqrU/HMzeJvr1ML1iwu2oaeLys+KNQ7HLC3EF8L77Af1znHexitp3k2hfjpFoh+d
 bJVS4hHYXjt827zvV35WpDbNeA/vXPK3MZutwwQeIZ2nsvhudv7Hocun83+k6JEo37pn38WI
 LjZIL0KVsRIvN0ShlPwF/3/fkVwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xu7otTkHxBhtWi1r0njvJZLFxxnpW
 i0W9vSwW/7dNZLa48vU9m8XK1UeZLBbst7b4cuUhk8Wmx9dYLS7vmsNmcbn5IqPF2iN32S2a
 Wowt7t47wWJx8MMTVgd+jzXz1jB67P22gMVj56y77B6bVnWyeWz/9oDV4373cSaPzUvqPW7/
 e8zsMfnGckaP3Tcb2Dz6/xp49G1ZxejxeZNcAG+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
 iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsadb+tZCo5yVTR972JrYHzP0cXIySEhYCLx8vpf
 5i5GLg4hgaWMEo2Pn7BBJGQkTk5rYIWwhSX+XOtigyj6xCix/c8kRpAEm4ChRNdbiISIQCej
 xLTuj+wgDrPAMWaJjY/fM4NUCQuESbSvnsIEYrMIqErM7W8Dsjk4eAXsJFq2u0BskJdYveEA
 WDknUHjrjCdgm4UEbCU+zFnMMoGRbwEjwypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAeNp2
 7OeWHYxd74IPMQpwMCrx8DLYB8ULsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1
 +BCjKdBNE5mlRJPzgbGeVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mD
 U6qBcZJv3OajVXatrlKJHTE5R24bz9FYxf7X+Mi50sClz1+s51FctnSvR5x2ycbHc2zEBebM
 Vn7HKnttTuEGhewddr90klKfxM8KiLU5wxLln7BXblNk+NHcms/v8pdtYYgLvizVNvHHFD4W
 67X6vhkPZU5e94tSZOnzmTs5/0PBLNUv376JzI3WVGIpzkg01GIuKk4EAOitNhO9AgAA
X-CMS-MailID: 20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6
X-Msg-Generator: CA
X-RootMTR: 20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6@eucas1p2.samsung.com>
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
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
