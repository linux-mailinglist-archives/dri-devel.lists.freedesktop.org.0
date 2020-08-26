Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1751252728
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85E56EA11;
	Wed, 26 Aug 2020 06:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F596EA03
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:46 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063545euoutp011a58df35fd3c4a50348734ab5fcd068d~uve13DuRW2035120351euoutp01R
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200826063545euoutp011a58df35fd3c4a50348734ab5fcd068d~uve13DuRW2035120351euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423745;
 bh=RMBhG1Fw6ugPclokWBJRv00vV8Qg1yQmDHqJxe7Y93k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PKaN8Mt9QModFWcEUWlluZ3FVlR9AY1Eot8Hn6bF3l3KipPNn9efH4x6yQdgsH8uG
 /sZeMO045PbeQP6avg0ouFxKgWYXDyE2row9gJ2Qj7e97sWs/ohh3fT783TW3ri0O2
 hgVrIrWs+GUvnTTvIME3msJnegKacwEWR4aoruJk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200826063544eucas1p2892e06b5f27fd3ac175767a0187bfecd~uve1TIyss0404404044eucas1p2o;
 Wed, 26 Aug 2020 06:35:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 17.BD.05997.0C2064F5; Wed, 26
 Aug 2020 07:35:44 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063544eucas1p230abe33c28618e82608c5b40eb50fa87~uve00eZKb0398803988eucas1p22;
 Wed, 26 Aug 2020 06:35:44 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826063544eusmtrp1cc29caedff01a18f8127ae3390732c5d~uve0zvtIk1167511675eusmtrp1K;
 Wed, 26 Aug 2020 06:35:44 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-e8-5f4602c0fa83
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5F.D0.06314.0C2064F5; Wed, 26
 Aug 2020 07:35:44 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063543eusmtip2c16dfa5c1225eec61b01617e9c56a325~uve0EBA_s0302303023eusmtip21;
 Wed, 26 Aug 2020 06:35:43 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 27/32] staging: tegra-vde: fix common struct sg_table
 related issues
Date: Wed, 26 Aug 2020 08:33:11 +0200
Message-Id: <20200826063316.23486-28-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0iTURjmfHel1dcWebrQYN0wSjP7ccKSkorzJxD6lWW29ENFXbapXRBa
 mVm6WVZgzRzDectL2tJZKzOvs1wmaWVo5bCkktnFJSqmuT6zf8/zvJfneQ+HI6VD9HIuVpUk
 qFXKeAXjTVnbJl5sekLsjdjcot+I9J1PCXT3RhWNZqw5JHrkmGRR+Y9BgHp+fWNQmrmKQbfL
 WwlkaghC5w0FFHL3OAlkGXxNo27bLQbpqmtpdMltYFBlyzsWFVumCNT4/SONJmxGaqcMVxgr
 AH7/uJnC9WMmCj8wvGOxpewSg+vGBmjckF/B4g9ZdgLfKzyD+6YHSXyttwTgh2+1DNanjTA4
 u6YM4FHLqtBFYd7bo4T42BRB7R98xDumK7uKTBxadFJbdFALjJJM4MVBfissHs+hMoE3J+VL
 AWx+amZF4p4ljxxzlVEAp8+9miXc35EB6xFRLwGwLfsnMT/hcpaSnr0MHwAzXZmMBy/h0wFs
 1y/wYJJ3UNAxHuhZJOMPwLMT4R6Z4tfCi521tAdL+GA4fdNCivHksLz6yV/sNavbsy4zHi/I
 6znYPNVFi0274WTRCCNiGfxqr2FFvBJ2XNNR4kAagM7OSlYkOgC7z90AYlcQ7O+cZDyJSN4X
 Vtn8RXkXLOwrmLt4Iex1LRbzL4RXrbmkKEvgxQtSsXsdNNjvzNs2dr2cy4/h+/xaIL5PDoC2
 3GHiCpAb/puZACgDPkKyJiFa0GxRCSf8NMoETbIq2i/yWIIFzP6+jmm7+z6wTR1tAjwHFAsk
 JmZPhJRWpmhOJTQByJGKJZKQ5x2HpZIo5anTgvpYhDo5XtA0gRUcpfCRBBZ8CZfy0cokIU4Q
 EgX1vyrBeS3Xgpj15qDKEK8htrqi5ZBbBccjV1ywksvSV6tVkwFsRn3c79gB48PQQfMXmXx4
 jSSpMs2ZXujase3wTOzdLJ+S/ce7Rz93nwzz3SM31amCnYWlOrev/4jfj/ZU/eU1dFGc601q
 atT1PH5vZL9t3/qQMCt0hS+dwRnPrrYGyfM+5SooTYwyYAOp1ij/AKFVXqR5AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t/xe7oHmNziDS6s4rboPXeSyWLjjPWs
 Fv+3TWS22HPmF7vF6o+PGS2ufH3PZtG8eD2bxcrVR5ksFuy3tmiZtYjF4suVh0wWmx5fY7W4
 vGsOm0XPhq2sFp1fZrFZrD1yl91i2aY/TBYHPzxhtfi5ax6Lg7DHmnlrGD3u7TvM4rH32wIW
 j52z7rJ7bFrVyeax/dsDVo/9c9ewe9zvPs7ksXlJvcftf4+ZPSbfWM7osftmA5tHb/M7No++
 LasYPT5vkgvgj9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxL
 LdK3S9DLuNC3nrngGX9Fw9LoBsZ5vF2MHBwSAiYSD7YldDFycQgJLGWU2DrhMGsXIydQXEbi
 5LQGKFtY4s+1LjaIok+MEm//bWEDSbAJGEp0vYVIiAh0MkpM6/7IDuIwC9xgkZi75QM7SJWw
 QLjEt0tfwEaxCKhKdJzbCmbzCthJ/Ju5iRlihbzE6g0HwGxOoPjx7n6wDUICthKn185gnsDI
 t4CRYRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgNG479nPzDsZLG4MPMQpwMCrx8C5gc40X
 Yk0sK67MPcQowcGsJMLrdPZ0nBBvSmJlVWpRfnxRaU5q8SFGU6CjJjJLiSbnAxNFXkm8oamh
 uYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRvVlRlMqbdNDqxZGpRxo3tRV
 qTy9uuxX4RpuH2suy9XlvXfv1tkFbCtqvary57L5j3jzPfzmTQEbc/fb8l/7dnPRrRjtsvs9
 zq1dHEE34pQZfv5q1DlWcKxhy/6ICqOyFPMY26txJs+vak7iqRCLPfRsH6vmxN367+6aqV39
 JjSVY7ZAq+sEJZbijERDLeai4kQAKYI8btwCAAA=
X-CMS-MailID: 20200826063544eucas1p230abe33c28618e82608c5b40eb50fa87
X-Msg-Generator: CA
X-RootMTR: 20200826063544eucas1p230abe33c28618e82608c5b40eb50fa87
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063544eucas1p230abe33c28618e82608c5b40eb50fa87
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063544eucas1p230abe33c28618e82608c5b40eb50fa87@eucas1p2.samsung.com>
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
Cc: devel@driverdev.osuosl.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
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
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/iommu.c b/drivers/staging/media/tegra-vde/iommu.c
index 6af863d92123..adf8dc7ee25c 100644
--- a/drivers/staging/media/tegra-vde/iommu.c
+++ b/drivers/staging/media/tegra-vde/iommu.c
@@ -36,8 +36,8 @@ int tegra_vde_iommu_map(struct tegra_vde *vde,
 
 	addr = iova_dma_addr(&vde->iova, iova);
 
-	size = iommu_map_sg(vde->domain, addr, sgt->sgl, sgt->nents,
-			    IOMMU_READ | IOMMU_WRITE);
+	size = iommu_map_sgtable(vde->domain, addr, sgt,
+				 IOMMU_READ | IOMMU_WRITE);
 	if (!size) {
 		__free_iova(&vde->iova, iova);
 		return -ENXIO;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
