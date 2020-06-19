Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC00200697
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C566EC6C;
	Fri, 19 Jun 2020 10:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763EC6EC71
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:03 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103702euoutp011590b41666c42db743d7053b15f0c7b2~Z66GHCcmv1836618366euoutp01b
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200619103702euoutp011590b41666c42db743d7053b15f0c7b2~Z66GHCcmv1836618366euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563022;
 bh=dgA8N0ViLqnC/QZEgzrc3l/K0+XnEV3AJx7m2vhhZ9o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PE4LzYrd6uUeRXWdQDMTvPW9GqCB6ekBU9J8Qoubhl8dQOzjiNqcV9zSmL8glBmeo
 Z3VrxMRzIU4yVUYeER6z/WG7WmAkMvm0RYHU5i8NcGkItj4uCx8g16SQh2o7irjg/w
 jYic7ujGMnDiKD/2vhagIskbRa5QW7Pt4w83WziA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200619103701eucas1p2e4008a7ddd1cda75ce7e7ff09ce39677~Z66Fnmrb81674116741eucas1p2F;
 Fri, 19 Jun 2020 10:37:01 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id E3.9D.05997.D459CEE5; Fri, 19
 Jun 2020 11:37:01 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103701eucas1p2323797b812f4d8c28e851aa80938a8dc~Z66FRTVYO1675016750eucas1p2B;
 Fri, 19 Jun 2020 10:37:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103701eusmtrp1774c5f529632baeace94574dc976e819~Z66FQf2tk0959609596eusmtrp19;
 Fri, 19 Jun 2020 10:37:01 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-df-5eec954da907
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 60.EA.06314.D459CEE5; Fri, 19
 Jun 2020 11:37:01 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103700eusmtip2d0ed865fa41b3cff8d1f2c9dc2e59af7~Z66Egh1F90302603026eusmtip2N;
 Fri, 19 Jun 2020 10:37:00 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 12/36] drm: mediatek: use common helper for extracting
 pages array
Date: Fri, 19 Jun 2020 12:36:12 +0200
Message-Id: <20200619103636.11974-13-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFKsWRmVeSWpSXmKPExsWy7djP87q+U9/EGby9p2HRe+4kk8XGGetZ
 LRb19rJY/N82kdniytf3bBYrVx9lsliw39riy5WHTBabHl9jtbi8aw6bxeXmi4wWa4/cZbdo
 ajG2uHvvBIvFwQ9PWB34PdbMW8PosffbAhaPnbPusntsWtXJ5rH92wNWj/vdx5k8Ni+p97j9
 7zGzx+Qbyxk9dt9sYPPo/2vg0bdlFaPH501yAbxRXDYpqTmZZalF+nYJXBldf3cwFzzgrLgx
 4TVzA+MUji5GTg4JAROJfRefs3cxcnEICaxglOi7cYMFwvnCKNG47wlU5jOjxMquN0wwLRMe
 tEElljNKHNt2lAmu5ee0fhaQKjYBQ4mut11sILaIQCujxIleHpAiZoE9zBKLdv0CKxIWCJfY
 MXkhWBGLgKrE1WcPwWxeATuJd1fuMUOsk5dYveEAmM0JFH/dcpAVZJCEwD12iX1dj1ghilwk
 Ti3aDHWfsMSr41vYIWwZidOTe1ggGpoZJR6eW8sO4fQwSlxumsEIUWUtcefcL6DVHED3aUqs
 36UPEXaUuPj4AxNIWEKAT+LGW0GQMDOQOWnbdGaIMK9ER5sQRLWaxKzj6+DWHrxwCep+D4ld
 mx4xQkJoIqPEwq+bmCcwys9CWLaAkXEVo3hqaXFuemqxUV5quV5xYm5xaV66XnJ+7iZGYAo7
 /e/4lx2Mu/4kHWIU4GBU4uF9EfI6Tog1say4MvcQowQHs5IIr9PZ03FCvCmJlVWpRfnxRaU5
 qcWHGKU5WJTEeY0XvYwVEkhPLEnNTk0tSC2CyTJxcEo1MLoe0VEs0vow/Yj62gNv/n7jV6/f
 uVLn+t0nW9ealazxtox8qyXIsfzR3MxZtU9uP18h4KfrUyapEywRb9dqUtyw4G+Vs1id/J+/
 x5g+T1Iws4mrm7N8UZf5HpVDFw8tYTqQ0f1b2VxFxrYnrU7kSNL6CT2RXD5zFcNCGMMaFb7G
 rt/BtfZMhxJLcUaioRZzUXEiAOfsqZNdAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xe7q+U9/EGezby2vRe+4kk8XGGetZ
 LRb19rJY/N82kdniytf3bBYrVx9lsliw39riy5WHTBabHl9jtbi8aw6bxeXmi4wWa4/cZbdo
 ajG2uHvvBIvFwQ9PWB34PdbMW8PosffbAhaPnbPusntsWtXJ5rH92wNWj/vdx5k8Ni+p97j9
 7zGzx+Qbyxk9dt9sYPPo/2vg0bdlFaPH501yAbxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpG
 JpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehldf3cwFzzgrLgx4TVzA+MUji5GTg4JAROJCQ/a
 2LsYuTiEBJYySrR8W80CkZCRODmtgRXCFpb4c62LDaLoE6PEqiUNbCAJNgFDia63EAkRgU5G
 iWndH8FGMQscY5bY+Pg9cxcjB4ewQKjEj6lSIA0sAqoSV589BGvmFbCTeHflHjPEBnmJ1RsO
 gNmcQPHXLQfBNgsJ2EosX/CeeQIj3wJGhlWMIqmlxbnpucWGesWJucWleel6yfm5mxiB8bTt
 2M/NOxgvbQw+xCjAwajEw/si5HWcEGtiWXFl7iFGCQ5mJRFep7On44R4UxIrq1KL8uOLSnNS
 iw8xmgIdNZFZSjQ5HxjreSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4
 OKUaGB3WVyc3PZl5bHXAA231uvZ716c8qFxcsv7wnCrnR1LmXxL3SzGxaD+t3ZoyITJYPty2
 p5nN3f53T2yxd0/pneBrWsEPW2pe/u5d1nzqnPu3FRGfZyReXmvOxJP7xmLCUYsV37b6JiUf
 jP1hvGK1ufAih+RdltvCP14+lrNJs7PB94W79dtkMSWW4oxEQy3mouJEAJFjdsu9AgAA
X-CMS-MailID: 20200619103701eucas1p2323797b812f4d8c28e851aa80938a8dc
X-Msg-Generator: CA
X-RootMTR: 20200619103701eucas1p2323797b812f4d8c28e851aa80938a8dc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103701eucas1p2323797b812f4d8c28e851aa80938a8dc
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103701eucas1p2323797b812f4d8c28e851aa80938a8dc@eucas1p2.samsung.com>
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
