Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 760972006A4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0D86EC73;
	Fri, 19 Jun 2020 10:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722AD6EC6A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:10 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103709euoutp01fbf8a5ead2d6a2ec0313a0ba88ac0e86~Z66MkXhBD1836418364euoutp01n
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200619103709euoutp01fbf8a5ead2d6a2ec0313a0ba88ac0e86~Z66MkXhBD1836418364euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563029;
 bh=JYSuV/X7Iq6Np2NNRKIL4EU8XZWM2woWhDUr1+VfApo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=imFDpD0mfOjAwu7LhzDF3dK25XcCTCsX+MNxwallHxAZ0U3nK3t4n2DCJewyvdYgA
 V6zUuxYkiV4KjSEjzZHCAUkI/ADBGMFoRsnDIhlSxRpDGf92pbKu89CeFUvK12SrN2
 pGXyKxUsKYadbyCiNh74SiZITe++mfW1fHqA596M=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200619103708eucas1p25d569a3ec93e3c5820c85efc4a2a9704~Z66MU8EqH1691016910eucas1p2A;
 Fri, 19 Jun 2020 10:37:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 99.9D.05997.4559CEE5; Fri, 19
 Jun 2020 11:37:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103708eucas1p230ca99e915e759bc0e93cd844c91b311~Z66MCvAPT2888828888eucas1p2p;
 Fri, 19 Jun 2020 10:37:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103708eusmtrp1d5e2caf48e4b7e049f4152b025863c12~Z66MCGLp40949709497eusmtrp1d;
 Fri, 19 Jun 2020 10:37:08 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-f7-5eec9554b36b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A1.1B.06017.4559CEE5; Fri, 19
 Jun 2020 11:37:08 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103707eusmtip28e525a8905d6ccea6dc0ac791343f768~Z66LbZHa70244902449eusmtip2q;
 Fri, 19 Jun 2020 10:37:07 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 23/36] drm: vmwgfx: fix common struct sg_table related
 issues
Date: Fri, 19 Jun 2020 12:36:23 +0200
Message-Id: <20200619103636.11974-24-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djP87ohU9/EGXw8aWzRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVq8OXKM0eLyrjlsFmuP3GW3OPjhCavF
 6k5HB16PNfPWMHrs/baAxWP7twesHve7jzN5bF5S73H732Nmj8k3ljN67L7ZwObRt2UVo8fn
 TXIe7+a/ZQvgjuKySUnNySxLLdK3S+DKaG5uYC+YIF7xufcLSwPjIuEuRk4OCQETibN7drF2
 MXJxCAmsYJRYt+8JlPOFUeLEj2Y2COczo0TD48/sMC2X7u2HqlrOKLFy+x2Elr0L17CCVLEJ
 GEp0ve1iA7FFBFqBZvXygBQxC/xlkrj0eBJYkbBAkMSvPZ1AYzk4WARUJfr3gh3FK2An8fzh
 WSaIbfISqzccYAaxOYHir1sOgi2TEDjELjH7yFMWiCIXiVMHnrNB2MISr45vgTpVRuL05B4W
 iIZmRomH59ayQzg9jBKXm2YwQlRZS9w594sN5ApmAU2J9bv0IcKOEhsvLmYGCUsI8EnceCsI
 EmYGMidtmw4V5pXoaBOCqFaTmHV8HdzagxcuMUPYHhJvN9xihATQRGAwvlrHOoFRfhbCsgWM
 jKsYxVNLi3PTU4uN8lLL9YoTc4tL89L1kvNzNzECU9Ppf8e/7GDc9SfpEKMAB6MSD++LkNdx
 QqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EKM3BoiTOa7zoZayQQHpiSWp2
 ampBahFMlomDU6qBUXzDgxrL+tsNZbF3ngoHGsnNvWNc3l97f7ennFFX3Vqx94LyNXN/B8Zk
 W0aKXTcSb1N4yNqWFF1mc4Q7Nbk7vjvaJmDmlun7FmqVmu8LVpyptmOec8S0aa0yl4pme3vr
 ztyiualVvKmo76Jr6E2VvNnpfFcjH9TMXeRtwMq749PcWYbP9ZiVWIozEg21mIuKEwESs3Y4
 SQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsVy+t/xe7ohU9/EGWz5oWTRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVq8OXKM0eLyrjlsFmuP3GW3OPjhCavF
 6k5HB16PNfPWMHrs/baAxWP7twesHve7jzN5bF5S73H732Nmj8k3ljN67L7ZwObRt2UVo8fn
 TXIe7+a/ZQvgjtKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxL
 LdK3S9DLaG5uYC+YIF7xufcLSwPjIuEuRk4OCQETiUv39rN2MXJxCAksZZQ4/+c4K0RCRuLk
 tAYoW1jiz7UuNoiiT4wSB49OAEuwCRhKdL2FSIgIdDJKTOv+yA6SYBZoZpY4/7IWxBYWCJD4
 fOQ1UJyDg0VAVaJ/L9hmXgE7iecPzzJBLJCXWL3hADOIzQkUf91yEGy+kICtxPIF75knMPIt
 YGRYxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERgn24793LKDsetd8CFGAQ5GJR7eFyGv44RY
 E8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEU6KaJzFKiyfnAGM4riTc0NTS3
 sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cC4qkHoZszCrXx6FiotsSyN85rr
 vrvFyJyboNofei/6rl7Cuztv44JdZ5/1maWT+qVYuGqii6T85yqGDe/r1+y1X9xi0u5RtkNk
 gXHDZ4tJrn8zO5oTOVdUyH6On1Ty6NOCgyy3X0Zx75tgPvGd3r4vC9bMmGo6TZ5rr8uLRUtu
 6LE4KCYwdVorsRRnJBpqMRcVJwIAJj6XtakCAAA=
X-CMS-MailID: 20200619103708eucas1p230ca99e915e759bc0e93cd844c91b311
X-Msg-Generator: CA
X-RootMTR: 20200619103708eucas1p230ca99e915e759bc0e93cd844c91b311
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103708eucas1p230ca99e915e759bc0e93cd844c91b311
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103708eucas1p230ca99e915e759bc0e93cd844c91b311@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
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
Acked-by: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index bf0bc4697959..861c383c9780 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -362,8 +362,7 @@ static void vmw_ttm_unmap_from_dma(struct vmw_ttm_tt *vmw_tt)
 {
 	struct device *dev = vmw_tt->dev_priv->dev->dev;
 
-	dma_unmap_sg(dev, vmw_tt->sgt.sgl, vmw_tt->sgt.nents,
-		DMA_BIDIRECTIONAL);
+	dma_unmap_sgtable(dev, &vmw_tt->sgt, DMA_BIDIRECTIONAL, 0);
 	vmw_tt->sgt.nents = vmw_tt->sgt.orig_nents;
 }
 
@@ -383,16 +382,8 @@ static void vmw_ttm_unmap_from_dma(struct vmw_ttm_tt *vmw_tt)
 static int vmw_ttm_map_for_dma(struct vmw_ttm_tt *vmw_tt)
 {
 	struct device *dev = vmw_tt->dev_priv->dev->dev;
-	int ret;
-
-	ret = dma_map_sg(dev, vmw_tt->sgt.sgl, vmw_tt->sgt.orig_nents,
-			 DMA_BIDIRECTIONAL);
-	if (unlikely(ret == 0))
-		return -ENOMEM;
 
-	vmw_tt->sgt.nents = ret;
-
-	return 0;
+	return dma_map_sgtable(dev, &vmw_tt->sgt, DMA_BIDIRECTIONAL, 0);
 }
 
 /**
@@ -449,10 +440,10 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 		if (unlikely(ret != 0))
 			goto out_sg_alloc_fail;
 
-		if (vsgt->num_pages > vmw_tt->sgt.nents) {
+		if (vsgt->num_pages > vmw_tt->sgt.orig_nents) {
 			uint64_t over_alloc =
 				sgl_size * (vsgt->num_pages -
-					    vmw_tt->sgt.nents);
+					    vmw_tt->sgt.orig_nents);
 
 			ttm_mem_global_free(glob, over_alloc);
 			vmw_tt->sg_alloc_size -= over_alloc;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
