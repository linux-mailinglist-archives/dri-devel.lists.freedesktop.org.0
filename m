Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE521CF0B4
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E921F6E8E4;
	Tue, 12 May 2020 09:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B22B6E8F0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090129euoutp021211bce5900e5f460bdeb40ac99de5d5~OPF0xwm780455404554euoutp02W
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200512090129euoutp021211bce5900e5f460bdeb40ac99de5d5~OPF0xwm780455404554euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274089;
 bh=PaSShSxED90KNxpkYwSSyeOdX5YGDnfxv6ZgggLohKM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HlpOu2agtIybvI3HLIueyCoSu+kngj8sOtrWM6TYFEOyC/lETKjAlQUQ/VI3HHjxP
 ZjebVFktGGawQ/7yG2jGcZFt5cNZCKly+Zb3wvLW5AFWfZ4v/Ci7yiENOWLGFq/fQ0
 cXwFcYqbzGQO6XcbQVmLDpkLALIOLVMqnEU1psWc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200512090129eucas1p24cc34b311be1ae013d327669187046bb~OPF0f_jp-2660626606eucas1p2j;
 Tue, 12 May 2020 09:01:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id D7.32.60679.9E56ABE5; Tue, 12
 May 2020 10:01:29 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090128eucas1p11ee8a5e72ca37dc6b3e8a07ea094bab6~OPF0Dgdh-0904609046eucas1p1B;
 Tue, 12 May 2020 09:01:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200512090128eusmtrp2067652dfbf86e4fac8989d6cb30584c6~OPF0CF46z0472504725eusmtrp2c;
 Tue, 12 May 2020 09:01:28 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-dc-5eba65e994db
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D0.55.08375.8E56ABE5; Tue, 12
 May 2020 10:01:28 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090128eusmtip162274653ef501091a87861f9e14ac8b1~OPFzbUefC1257212572eusmtip1y;
 Tue, 12 May 2020 09:01:27 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 35/38] rapidio: fix common struct sg_table related issues
Date: Tue, 12 May 2020 11:00:55 +0200
Message-Id: <20200512090058.14910-35-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSeUgUURzm7ezMjuLauBq+zLKWihTStaIGDCkSnChQAqOErDEnlbzYUcsQ
 2tQs1qPUQrPQRbT1Nm93vfJWrK1cC0/UTMFzpVW7PNp1rP77jt/3vvd7PBwR1aM2eGBIOCMN
 oYPEmCm/pvOn5sgMo/aRKNJxMknTwyO/FA4gZHlGGUpu1qQgZP+KDiMLijp4pKLZhVzun+CR
 FZOfUVKrfomRJe2jAvLZ++8I2bL0FT0tpIqzigHVuKrgU6rMUQGVOB+HUrWr4yg1ltDFoypz
 71HDG5MIlTagBFT9oAyjkqsKAaWv2Otp5m16yo8JCoxkpE6u100DviV0oGFrlneqK9sEMjBI
 yIEJDonjsHY8F8iBKS4i8gHUlw8JOLIM4POGLIwjegBrtcPgb2SgLQfhDCWAyrxUntHYikwv
 IUaMEc5QviDHjNiKeABgd5KZESPEIg+26x2M2JK4AOdn07ayfOIg7CuY3CoQEq6wOnYS5crs
 YNHrN1tnmhj0sew1vrEYEhoBVMm1Am7IDc5qBjEOW8LZrqpt3RZuqrJ5XCAWwAlNiYAjiQBq
 YzK293GBI5pfhjRuuJ49LFM7cfIZ2PnqPjDKkDCHAwsW3ALmMLUmHeFkIXwUL+KmD8HMrtJ/
 tS0f+hAOU/BjU8P2K3YAmDsyJXgC7DL/lykAKATWTAQb7M+wR0OY244sHcxGhPg73ggNrgCG
 L9W70bVcB9Rrvq2AwIHYTCiRqHxEKB3JRgW3AogjYithXKBBEvrRUXcZaeg1aUQQw7aC3Thf
 bC08ljNzVUT40+HMLYYJY6R/XR5uYiMDT5eGJLqTM7E7Ljfr3ao9vKxjg/YkF8XnelmWeujm
 8nRYvoU3veh7+K2mMbpb53Bp2qbUf5fzi3SvAzNVP+ZOjO+0nc7pAVptjOTTys397Hrnxd8j
 nXGDqizbqboI+17Ppnf6qr5Gdyt3W6XTuX3rKVdWz8rIx+c3oj0fKumygkAxnw2gnR0QKUv/
 AXRmaSZOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsVy+t/xu7ovUnfFGSxs07DoPXeSyeLRqhvM
 FhtnrGe1+L9tIrPFla/v2SxWrj7KZLFgv7XFlysPmSw2Pb7GanF51xw2i7VH7rJbTD3/ndni
 4IcnrA68HmvmrWH02PttAYvHzll32T163rSwemz/9oDV4373cSaPzUvqPW7/e8zsMfnGckaP
 3Tcb2Dz6tqxi9Pi8SS6AJ0rPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
 JiU1J7MstUjfLkEv41P3UdaCP8IVWzcfZm9gvCnQxcjJISFgInHj8CLmLkYuDiGBpYwSy74s
 ZIRIyEicnNbACmELS/y51sUGUfSJUWLh7WVMIAk2AUOJrrcQCRGBTkaJad0f2UEcZoFvTBKT
 lt5iA6kSFvCRePNqMlgHi4CqxKWVj8FW8ArYSWxtfgy1Ql5i9YYDzCA2J1D8/vw/LCC2kECh
 xKOrb1kmMPItYGRYxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERg324793LyD8dLG4EOMAhyM
 Sjy8HUY744RYE8uKK3MPMUpwMCuJ8LZkAoV4UxIrq1KL8uOLSnNSiw8xmgIdNZFZSjQ5HxjT
 eSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGCuqJl6ZsD4idLut
 8wIfm538E1b6vdabIryozena/8pd/m2ro6Zrf7m15+yW5wcnulnaNc16lP3twQq3ph+Jb4S+
 +cz2XmzZcCLTYdq96PPqAX9/nLdf96Pn8fc/Qnk65d+eTDao2ODA1By069mxHTK7ywJUPzdV
 dWR+OFUkwl992uzzkbn/5W8psRRnJBpqMRcVJwIAQ0ag5LECAAA=
X-CMS-MailID: 20200512090128eucas1p11ee8a5e72ca37dc6b3e8a07ea094bab6
X-Msg-Generator: CA
X-RootMTR: 20200512090128eucas1p11ee8a5e72ca37dc6b3e8a07ea094bab6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090128eucas1p11ee8a5e72ca37dc6b3e8a07ea094bab6
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090128eucas1p11ee8a5e72ca37dc6b3e8a07ea094bab6@eucas1p1.samsung.com>
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
 David Airlie <airlied@linux.ie>, Alexandre Bounine <alex.bou9@gmail.com>,
 Matt Porter <mporter@kernel.crashing.org>, Robin Murphy <robin.murphy@arm.com>,
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
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
---
 drivers/rapidio/devices/rio_mport_cdev.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index 4029637..df7dba8 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -574,8 +574,7 @@ static void dma_req_free(struct kref *ref)
 	struct mport_cdev_priv *priv = req->priv;
 	unsigned int i;
 
-	dma_unmap_sg(req->dmach->device->dev,
-		     req->sgt.sgl, req->sgt.nents, req->dir);
+	dma_unmap_sgtable(req->dmach->device->dev, req->sgt, req->dir);
 	sg_free_table(&req->sgt);
 	if (req->page_list) {
 		for (i = 0; i < req->nr_pages; i++)
@@ -927,9 +926,8 @@ static int do_dma_request(struct mport_dma_req *req,
 				xfer->offset, xfer->length);
 	}
 
-	nents = dma_map_sg(chan->device->dev,
-			   req->sgt.sgl, req->sgt.nents, dir);
-	if (nents == 0) {
+	ret = dma_map_sgtable(chan->device->dev, req->sgt, dir);
+	if (ret) {
 		rmcd_error("Failed to map SG list");
 		ret = -EFAULT;
 		goto err_pg;
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
