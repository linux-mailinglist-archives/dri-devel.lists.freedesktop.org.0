Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EF320068B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF17F6EC6E;
	Fri, 19 Jun 2020 10:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A91A6EC5E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:36:57 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103656euoutp01b2e9ceda1ed2e01f4f9fc4bee9529fc3~Z66AVDPv21849718497euoutp01G
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:36:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200619103656euoutp01b2e9ceda1ed2e01f4f9fc4bee9529fc3~Z66AVDPv21849718497euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563016;
 bh=YKOPFau+7eOajVys2VcdaM8/YTWxp4RJo0pCPfpBcgk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nfqn+mfeX0Nt9+HmFGnbfkqhHXJxSWhqVolku2x5Boe8lRTpWWqgugD7BKIkA4xVd
 mTw/SFIP4arAqIpGYzJkrr3xf8/CmAc/KBu8c4aPCwQyAz+WHo0eQpEWQ2BwOtPtyA
 F6IuIIMcQKflfUwDF84oabYL9YfpseyEjsgtLKXU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200619103655eucas1p172c30596ee81baf79357a567e28e7db3~Z65--4fK10294402944eucas1p17;
 Fri, 19 Jun 2020 10:36:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id A9.9C.06456.7459CEE5; Fri, 19
 Jun 2020 11:36:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200619103655eucas1p1b01cbe67526e2b2f8254eb20ccac1858~Z65-dd0Gn0294102941eucas1p1E;
 Fri, 19 Jun 2020 10:36:55 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103655eusmtrp183e9c02e9925bcf6e12951e028d2c8aa~Z65-c1oV20959609596eusmtrp1t;
 Fri, 19 Jun 2020 10:36:55 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-39-5eec95475aca
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 5F.FA.06017.6459CEE5; Fri, 19
 Jun 2020 11:36:55 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103654eusmtip2b8e323334975574601bcbaf46c75e112~Z65_uto5t0244902449eusmtip2k;
 Fri, 19 Jun 2020 10:36:54 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 03/36] drm: core: fix common struct sg_table related issues
Date: Fri, 19 Jun 2020 12:36:03 +0200
Message-Id: <20200619103636.11974-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMKsWRmVeSWpSXmKPExsWy7djPc7ruU9/EGXQeVLLoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12i4Uft7JYtHUuY7U4
 +OEJq8WWNxNZHfg81sxbw+ix99sCFo9NqzrZPLZ/e8DqMe9koMf97uNMHpuX1Hvc/veY2WPy
 jeWMHrtvNrB59G1Zxeix+XS1x+dNcgG8UVw2Kak5mWWpRfp2CVwZT04nFOxVrdh++xprA+NU
 +S5GTg4JAROJv5Pes3UxcnEICaxglFh5aQYThPOFUeJF41NmCOczo8Tie5NYYVr2NP9gh0gs
 Z5TYPOMcK1zLhReb2ECq2AQMJbredoHZIgKtjBInenlAipgFFjBL/PzcxgiSEBYIkHg6dyM7
 iM0ioCpx+fIuFhCbV8BWYuOyRSwQ6+QlVm84wAxicwrYSbxuOQi2TULgGrvE1v7fTBBFLhJv
 m2YwQtjCEq+Ob2GHsGUkTk/uYYFoaGaUeHhuLTuE08MocRmuw1rizrlfQLdyAN2nKbF+lz6I
 KSHgKLF8qTqEySdx460gSDEzkDlp23RmiDCvREebEMQMNYlZx9fBbT144RIzhO0hcef2I2iY
 TmSUeP7vI8sERvlZCLsWMDKuYhRPLS3OTU8tNsxLLdcrTswtLs1L10vOz93ECExap/8d/7SD
 8eulpEOMAhyMSjy8DuGv44RYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iFGa
 g0VJnNd40ctYIYH0xJLU7NTUgtQimCwTB6dUA+O0WOEPVm+sa3m/54l+X/W1KOkRw8L4CSeT
 uKqcXXenHXCfWZz8qvzVYva2y4XvlfLdFvikKf98qLralqnSV7q782jF57Tvx/kWn1d7NyH4
 Ueoz3j3Tz5rNnVOWyJWs3Ln5Qeld9/b/Wi7i2uIyJ7Y69bbnVRT0cQkKT33q8ePkvmvi96vn
 b1ZiKc5INNRiLipOBAD7GP0RVgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xe7ruU9/EGczIsOg9d5LJYuOM9awW
 /7dNZLa48vU9m8XK1UeZLBbst7b4cuUhk8Wmx9dYLS7vmsNmsfbIXXaLhR+3sli0dS5jtTj4
 4QmrxZY3E1kd+DzWzFvD6LH32wIWj02rOtk8tn97wOox72Sgx/3u40wem5fUe9z+95jZY/KN
 5Yweu282sHn0bVnF6LH5dLXH501yAbxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbm
 sVZGpkr6djYpqTmZZalF+nYJehlPTicU7FWt2H77GmsD41T5LkZODgkBE4k9zT/Yuxi5OIQE
 ljJKnJxylB0iISNxcloDK4QtLPHnWhcbRNEnRonXD1eBFbEJGEp0vYVIiAh0MkpM6/4INopZ
 YAWzxKt9c1lAqoQF/CRWXv8D1sEioCpx+fIusDivgK3ExmWLWCBWyEus3nCAGcTmFLCTeN1y
 EGy1EFDN8gXvmScw8i1gZFjFKJJaWpybnltspFecmFtcmpeul5yfu4kRGEPbjv3csoOx613w
 IUYBDkYlHt4XIa/jhFgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RToqInM
 UqLJ+cD4ziuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwMi1elm/
 +GWrix98hL7v4L9sFb+E7drxlcuZTp428Clc/jE8SuxC/sWII1ft9ZOUZC8v2ma5hL/Hrejs
 s5h/rjprb4jPMPRerOjyqZ3DR3ChwDnuqy/miE5Ivsa2+XTHVdWnm6wXnJkw//gEHrmc3NOC
 ZwTssiZ7KLjfCVi1dKLAnK3nFvscac9TYinOSDTUYi4qTgQAPFPccrcCAAA=
X-CMS-MailID: 20200619103655eucas1p1b01cbe67526e2b2f8254eb20ccac1858
X-Msg-Generator: CA
X-RootMTR: 20200619103655eucas1p1b01cbe67526e2b2f8254eb20ccac1858
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103655eucas1p1b01cbe67526e2b2f8254eb20ccac1858
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103655eucas1p1b01cbe67526e2b2f8254eb20ccac1858@eucas1p1.samsung.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
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
 drivers/gpu/drm/drm_cache.c            |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c | 14 +++++++++-----
 drivers/gpu/drm/drm_prime.c            | 11 ++++++-----
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 03e01b000f7a..0fe3c496002a 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -127,7 +127,7 @@ drm_clflush_sg(struct sg_table *st)
 		struct sg_page_iter sg_iter;
 
 		mb(); /*CLFLUSH is ordered only by using memory barriers*/
-		for_each_sg_page(st->sgl, &sg_iter, st->nents, 0)
+		for_each_sgtable_page(st, &sg_iter, 0)
 			drm_clflush_page(sg_page_iter_page(&sg_iter));
 		mb(); /*Make sure that all cache line entry is flushed*/
 
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 4b7cfbac4daa..47d8211221f2 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -126,8 +126,8 @@ void drm_gem_shmem_free_object(struct drm_gem_object *obj)
 		drm_prime_gem_destroy(obj, shmem->sgt);
 	} else {
 		if (shmem->sgt) {
-			dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
-				     shmem->sgt->nents, DMA_BIDIRECTIONAL);
+			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
+					  DMA_BIDIRECTIONAL, 0);
 			sg_free_table(shmem->sgt);
 			kfree(shmem->sgt);
 		}
@@ -424,8 +424,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_object *obj)
 
 	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
 
-	dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
-		     shmem->sgt->nents, DMA_BIDIRECTIONAL);
+	dma_unmap_sgtable(obj->dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
@@ -697,12 +696,17 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj)
 		goto err_put_pages;
 	}
 	/* Map the pages for use by the h/w. */
-	dma_map_sg(obj->dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret)
+		goto err_free_sgt;
 
 	shmem->sgt = sgt;
 
 	return sgt;
 
+err_free_sgt:
+	sg_free_table(sgt);
+	kfree(sgt);
 err_put_pages:
 	drm_gem_shmem_put_pages(shmem);
 	return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index b717e52e909e..d583d6545666 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -617,6 +617,7 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct sg_table *sgt;
+	int ret;
 
 	if (WARN_ON(dir == DMA_NONE))
 		return ERR_PTR(-EINVAL);
@@ -626,11 +627,12 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 	else
 		sgt = obj->dev->driver->gem_prime_get_sg_table(obj);
 
-	if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
-			      DMA_ATTR_SKIP_CPU_SYNC)) {
+	ret = dma_map_sgtable(attach->dev, sgt, dir,
+			      DMA_ATTR_SKIP_CPU_SYNC);
+	if (ret) {
 		sg_free_table(sgt);
 		kfree(sgt);
-		sgt = ERR_PTR(-ENOMEM);
+		sgt = ERR_PTR(ret);
 	}
 
 	return sgt;
@@ -652,8 +654,7 @@ void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 	if (!sgt)
 		return;
 
-	dma_unmap_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
-			   DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sgt);
 	kfree(sgt);
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
