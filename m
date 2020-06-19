Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29B92006AA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE536EC78;
	Fri, 19 Jun 2020 10:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77C06EC6F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:16 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103715euoutp0250cbfa7999a6c1df6dfe93b42a8acb56~Z66SmG1CT2414024140euoutp02M
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200619103715euoutp0250cbfa7999a6c1df6dfe93b42a8acb56~Z66SmG1CT2414024140euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563035;
 bh=RMBhG1Fw6ugPclokWBJRv00vV8Qg1yQmDHqJxe7Y93k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eS9XS1GW8iDugjgH85Zq2VIEXYFnUiVAtSr3whwJaqABUF5Bq/tii2YyKEqcpmht3
 CWIN69bGM3gua45w3GUxKUNns47yXIyyCDfXPvez1+wT1rQqSYk8OJXmOyBENmFTPS
 Qj0gphunlZ7QBWBd3QpsozJ8yEWwpOqJSKWND4ow=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200619103715eucas1p2ad1ec44f1b69aa83e98bc848af6927ee~Z66SSagFB3081930819eucas1p2t;
 Fri, 19 Jun 2020 10:37:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 9C.9C.06318.B559CEE5; Fri, 19
 Jun 2020 11:37:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200619103714eucas1p18db6efd1a380fc0bdb16174ee85036fa~Z66R5XCac0493704937eucas1p18;
 Fri, 19 Jun 2020 10:37:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103714eusmtrp1f60c74a1fbb850448d1cac3b7fb23832~Z66R4rTjx1007310073eusmtrp1D;
 Fri, 19 Jun 2020 10:37:14 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-88-5eec955b3ef3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id EF.EA.06314.A559CEE5; Fri, 19
 Jun 2020 11:37:14 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103713eusmtip26f278a5ab64dc87293551fc5392692d2~Z66RB0RDS0246802468eusmtip2l;
 Fri, 19 Jun 2020 10:37:13 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 31/36] staging: tegra-vde: fix common struct sg_table
 related issues
Date: Fri, 19 Jun 2020 12:36:31 +0200
Message-Id: <20200619103636.11974-32-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSe0hTURzu7D52Hc5u0/BYkTAwKdIye5wozCLoQBEFRVSk3fKm0qax66Mi
 yNKyqZOeVKtkrYdvV8vUllqzfJSm5ivNrMTsbS915CNr27X67/t9v+/j+36HwxCKd9QUJjIq
 htdEcSolLSOLqoYa/Lae+RwyN7ncBenqH0nQzXMmCv0uOkGg0rphKcr93gNQy+BXGiVeMdEo
 O7dSggz3lqAkvZFEAy3dEmTuaaNQs+UijdJu3KaQdkBPo/yHXVJ03TwqQdZvbyg0ZMkgg91x
 XkYewC/LH5C4zGYg8R19lxSbc7Q0Lra9pvC9S3lS/Cq1WoJvXT2IO8d6CHyqPRPgux0JNNYl
 fqFxemEOwP3m6esmbpEtDeNVkXG8Zk7QdllEY7qJ2PN24t6Ea1sTQIY8BbgwkJ0PR8qrCAdW
 sFkAllQsTgEyOx4AsFRbQItDP4Bd/b30X4e1oYEUF5kAGrNeUv8sNsMzqUNFswEwpS/F6fBg
 jwBYo3N1YIKtI2Hdz0AHdmc3w/bKDKeGZH3g49PPnV45GwTrTtooMc0b5t647+znYuc/JVmd
 YZDVMfCa9jwhilbCvtb0cYM7/FhdKBXxNFh7Ko0UDYkAdtfnS8UhDcDmw+eAqFoCX9QP22sw
 9nozockyR6SXw94Pl4GDhqwbbO+bJB7gBk8WnSVEWg6PHVWI6hlQX13wL9ba2DReDUPrC7NU
 fKATAF4Yy6aPA2/9/zADADnAk48V1OG8EBjFx/sLnFqIjQr33xmtNgP796sdqx4sAeWjOyoA
 ywClq/z9hk8hCoqLE/apKwBkCKWHfMWT2hCFPIzbt5/XRIdqYlW8UAGmMqTSUx5o/LBNwYZz
 Mfxunt/Da/5uJYzLlASgpvx2PbCcbZTp1QVGV595eE388EK685BHc8nU1oi1yyxar7vbwoN9
 Cze1GZMnPw0rM/lsDFzl9sq3Izp+UbH3+pEf+SqDvy1yacnl1b7xxE4utMmjJrZBLw/y+6U5
 PnvaggP1K8N+1zzSNSVVKVTR797mDXQLBZ9nefkcnpA6yBFKUojgAmYRGoH7A/SHOch6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xe7pRU9/EGfR1G1n0njvJZLFxxnpW
 i//bJjJb7Dnzi91i9cfHjBZXvr5ns2hevJ7NYuXqo0wWC/ZbW7TMWsRi8eXKQyaLTY+vsVpc
 3jWHzaJnw1ZWi84vs9gs1h65y26xbNMfJouDH56wWvzcNY/FQdhjzbw1jB739h1m8dj7bQGL
 x85Zd9k9Nq3qZPPY/u0Bq8f+uWvYPe53H2fy2Lyk3uP2v8fMHpNvLGf02H2zgc2jt/kdm0ff
 llWMHp83yQXwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJal
 FunbJehlXOhbz1zwjL+iYWl0A+M83i5GTg4JAROJg+fPs4DYQgJLGSVOn/GAiMtInJzWwAph
 C0v8udbF1sXIBVTziVFi2YxtzCAJNgFDia63EAkRgU5GiWndH9lBHGaBGywSc7d8AHI4OIQF
 wiWmXXMCaWARUJU4NeUWO4jNK2AncWbSN6gN8hKrNxwAG8oJFH/dcpAV4iJbieUL3jNPYORb
 wMiwilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzAWtx37uXkH46WNwYcYBTgYlXh4X4S8jhNi
 TSwrrsw9xCjBwawkwut09nScEG9KYmVValF+fFFpTmrxIUZToKMmMkuJJucD00ReSbyhqaG5
 haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQbG+EXGBwvK983/t677hEFoT4dW
 j0jMvrcd9zV2rCn6vHTTY6Mdq3TX6M724XY+blp5P6f2DZ+Of9pcxTsBc/o7TnmdZ1m4w1WO
 n4nz+wyNtxWfu7+FSN+yzVpwdN17v+LTD5MN7m+aueHlxLo0H5EnT9rjfuyvtb7arOysYKfp
 sWleUmn8rKynSizFGYmGWsxFxYkAiNRTk9sCAAA=
X-CMS-MailID: 20200619103714eucas1p18db6efd1a380fc0bdb16174ee85036fa
X-Msg-Generator: CA
X-RootMTR: 20200619103714eucas1p18db6efd1a380fc0bdb16174ee85036fa
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103714eucas1p18db6efd1a380fc0bdb16174ee85036fa
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103714eucas1p18db6efd1a380fc0bdb16174ee85036fa@eucas1p1.samsung.com>
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
