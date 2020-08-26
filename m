Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67010252736
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32256EA15;
	Wed, 26 Aug 2020 06:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF036EA0C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:46 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063545euoutp014f413e86787769e616a647af99e0f650~uve2G2rar2035120351euoutp01S
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200826063545euoutp014f413e86787769e616a647af99e0f650~uve2G2rar2035120351euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423745;
 bh=uHaHrVj9uEjHIe4StK4tJYVPskphxegmYKiq5klM8TA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GF0XVZPpiUXrTF0UXfKg4eTpjVkqSO8GPhtlWoFBBpF+opblWYWTfDtYCs4h2H+M9
 YSadWlLKgEfxmOGP6JfKtX2bBScvchyWz0IwnaCa5LP8Hul9GnsQjmLrv6zQH8AUrx
 PR9wEfkCrCeTAne5MdSYGH4gvYA+hYF9N+E43mNY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200826063545eucas1p23e973a046c1118d2848630fbbf80ac8d~uve1w86Aw0398703987eucas1p2p;
 Wed, 26 Aug 2020 06:35:45 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 58.BD.05997.1C2064F5; Wed, 26
 Aug 2020 07:35:45 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200826063544eucas1p15980885bbdbc43e35f350f228994bee7~uve1Yp4IX1480314803eucas1p1t;
 Wed, 26 Aug 2020 06:35:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200826063544eusmtrp2fb3d8e5660340ba67abfec026186393b~uve1YAfVx0466204662eusmtrp2g;
 Wed, 26 Aug 2020 06:35:44 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-eb-5f4602c1993e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AC.53.06017.0C2064F5; Wed, 26
 Aug 2020 07:35:44 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063544eusmtip20c68027087fa433706e7ee60ee2698a4~uve0ycNPa0092300923eusmtip2T;
 Wed, 26 Aug 2020 06:35:44 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 28/32] misc: fastrpc: fix common struct sg_table related
 issues
Date: Wed, 26 Aug 2020 08:33:12 +0200
Message-Id: <20200826063316.23486-29-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLKsWRmVeSWpSXmKPExsWy7djP87oHmdziDQ61cVr0njvJZPF30jF2
 i40z1rNa/N82kdniytf3bBbNi9ezWaxcfZTJYsF+a4svVx4yWWx6fI3V4vKuOWwWa4/cZbc4
 +OEJqwOvx5p5axg9fv+axOix99sCFo/t3x6weuyfu4bd4373cSaPzUvqPW7/e8zsMfnGckaP
 3Tcb2Dz6tqxi9Pi8SS6AJ4rLJiU1J7MstUjfLoEro+3sfdaCKwIV17/fZWlg/MDbxcjJISFg
 IrF4xx3mLkYuDiGBFYwSaz/dYoJwvjBKrFz8kA3C+cwoMf9uIwtMy57nU6CqljNKnP1xgx2u
 5e+KS8wgVWwChhJdb7vYQGwRgVZGiRO9PCBFzAKvmCTmzelkBUkIC4RInDx8DayBRUBVomUi
 RJxXwE7i5MQJ7BDr5CVWbzgAVsMJFD/e3Q92k4TAKXaJ6XtXM0MUuUgcevGKDcIWlnh1fAtU
 s4zE/53zmSAamhklHp5byw7h9DBKXG6awQhRZS1x59wvoG4OoPs0Jdbv0ocIO0pcmPSfBSQs
 IcAnceOtIEiYGcictG06M0SYV6KjTQiiWk1i1vF1cGsPXrgEdZqHxPEFP6HhOJFR4sLJKywT
 GOVnISxbwMi4ilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzBRnf53/MsOxl1/kg4xCnAw
 KvHwLmBzjRdiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+fFFpTmrxIUZpDhYlcV7jRS9j
 hQTSE0tSs1NTC1KLYLJMHJxSDYwcjaaBfdVx2hfyK7vfTuy98fbeA2ae5bEK3w58DZedZ29V
 OuOytvvmO+mcXA1pa5o/HJtR1b0wX9x006HoRbF356549FbdZX2h+Ns3Hd3aemfbH4kKmS1L
 3pDjo7LsSVnqmoquM1unNn+MdhCY9VQn5V5MVlz3t3eFr1VtROT+zG1kN0qsfqXEUpyRaKjF
 XFScCADsbkboUAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsVy+t/xe7oHmNziDbYe0bfoPXeSyeLvpGPs
 FhtnrGe1+L9tIrPFla/v2SyaF69ns1i5+iiTxYL91hZfrjxkstj0+BqrxeVdc9gs1h65y25x
 8MMTVgdejzXz1jB6/P41idFj77cFLB7bvz1g9dg/dw27x/3u40wem5fUe9z+95jZY/KN5Ywe
 u282sHn0bVnF6PF5k1wAT5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
 TUpqTmZZapG+XYJeRtvZ+6wFVwQqrn+/y9LA+IG3i5GTQ0LARGLP8ylMILaQwFJGiU07mSHi
 MhInpzWwQtjCEn+udbF1MXIB1XxilNh2/wxYA5uAoUTXW4iEiEAno8S07o/sIA6zwCcmiSPX
 TrOBVAkLBEksP7sUbCyLgKpEy8ROsLG8AnYSJydOYIdYIS+xesMBsBpOoPjx7n42iJNsJU6v
 ncE8gZFvASPDKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMCo2Xbs55YdjF3vgg8xCnAwKvHw
 LmBzjRdiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+fFFpTmrxIUZToKMmMkuJJucDIzqv
 JN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVANjf2aO2lyrHUKqn2Y1
 XT4jKsxWLPiRY+4S9pd8i1+WxsfKsYVHOq+1PR8cfIfvr9qMyEnxuh+09N5vD1nfov55i+l8
 Ba8TbYU6gb2TGsx/XBXR/npO7tLXsDdm5YU/Z//RDQjcEN1yaGnTF68VP033HXucW3bx7+e9
 6pc8lzpZ/poVKZY3u/KREktxRqKhFnNRcSIAobSgz7ACAAA=
X-CMS-MailID: 20200826063544eucas1p15980885bbdbc43e35f350f228994bee7
X-Msg-Generator: CA
X-RootMTR: 20200826063544eucas1p15980885bbdbc43e35f350f228994bee7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063544eucas1p15980885bbdbc43e35f350f228994bee7
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063544eucas1p15980885bbdbc43e35f350f228994bee7@eucas1p1.samsung.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
---
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7939c55daceb..9d6867749316 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -518,7 +518,7 @@ fastrpc_map_dma_buf(struct dma_buf_attachment *attachment,
 
 	table = &a->sgt;
 
-	if (!dma_map_sg(attachment->dev, table->sgl, table->nents, dir))
+	if (!dma_map_sgtable(attachment->dev, table, dir, 0))
 		return ERR_PTR(-ENOMEM);
 
 	return table;
@@ -528,7 +528,7 @@ static void fastrpc_unmap_dma_buf(struct dma_buf_attachment *attach,
 				  struct sg_table *table,
 				  enum dma_data_direction dir)
 {
-	dma_unmap_sg(attach->dev, table->sgl, table->nents, dir);
+	dma_unmap_sgtable(attach->dev, table, dir, 0);
 }
 
 static void fastrpc_release(struct dma_buf *dmabuf)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
