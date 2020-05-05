Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03EA1C50F1
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AE86E59D;
	Tue,  5 May 2020 08:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B666E584
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:36 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084634euoutp01076bbec36afe5c8f93cc9bcb4fa4dab0~MFXzM9rHk0325703257euoutp01n
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200505084634euoutp01076bbec36afe5c8f93cc9bcb4fa4dab0~MFXzM9rHk0325703257euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668394;
 bh=rhbjcVyJciQI9BrVNHTHpqVxfzl3IrypYzdEF9vtEFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gs3+muHWzOnJts9lSetvJ6bgn64Zhsz/jR/l1q58EzGlQhGwtyq0Ce72lzz6fHQOi
 XaWS4q6a+RvTPfgN4Bk97soVLqHPWhRvf+PC+i3oICdonZxDJDYURedkEQjky/OKoK
 OfKQx+paiNaIxnhIPIPDjOEzFc6/znm5Ett02Bz8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200505084634eucas1p130922399efe589caaf1389d9ebaa05f6~MFXy7krN32432424324eucas1p1C;
 Tue,  5 May 2020 08:46:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 37.CF.61286.9E721BE5; Tue,  5
 May 2020 09:46:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084633eucas1p19798e1fb42c9430a93d668bc585e58da~MFXyp7kGd2423624236eucas1p17;
 Tue,  5 May 2020 08:46:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084633eusmtrp1fd8b72215c31bd7374169b1f06dbb9cd~MFXypSze20942509425eusmtrp1N;
 Tue,  5 May 2020 08:46:33 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-af-5eb127e99851
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7C.14.08375.9E721BE5; Tue,  5
 May 2020 09:46:33 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084633eusmtip14f22af47e0947852337ec2e00ed99015~MFXyHKj0e0580805808eusmtip1_;
 Tue,  5 May 2020 08:46:33 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/25] drm: host1x: fix common struct sg_table related
 issues
Date: Tue,  5 May 2020 10:46:06 +0200
Message-Id: <20200505084614.30424-17-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSWUwTURT1zXSmA1IcCwkv1UhsgiCyiPoxESGa+DFGPxSNAROKVUYglCUd
 dk0AAbVsUYmIDRIimwK1bEEosgpUIVRZBQEFERENiAJFMKItA/h37lneubl5BCqswUREQHAY
 Iw+WysS4Ka+6ffm147RtuWR/j/4wlaZ7hVDlWWqM+lt9B6X6Fr/j1JOSNoTKbXSlFvrGEapi
 YgCjejXZOKVYUOKUqnWUTzXPfcKoZU0O76iALs0pBXS9PpdH1ypH+fQz/RhGf0jRInRlfiw9
 vDqB0hmDRYCuG4rD6fSqYkDPV+w6vfWC6RFfRhYQwcid3S+a+g+3tyGhCzBqrLALxIE/FsnA
 hIDkIVg3O4smA1NCSD4G8EtlG+CGBQAzdQPryjyAS1MNvI3IePoAnxOKAExQF2Cbkdr2e4jR
 hZMuMHkmGTdiSzIJwJdpZkYTSn5EoOJtN2oULEgP2J+iAEbMI21gV8f7tQoB6Q7r8pYAV2cN
 S8qa1vwmBn6iZwQ3PgTJdj6cm5xAOdNxOPQwEeewBfyqreJzeCfszEjlcYEEAMd1Kj43pALY
 ez1rvcIVjuhWDGnCsN9eqNY4c/QxONLfgBlpSJrDwZntRho1wLvV91GOFsBbN4Scew9Uap9u
 1ja/6VlfjYa9tZr1O7YB+CC+AL8NrJX/y3IBKAZWTDgb5MewLsFMpBMrDWLDg/2cLocEVQDD
 f+pc1f6sAYs9l1oASQCxmcBzXi0RYtIINjqoBUACFVsKCn+VSYQCX2l0DCMP8ZGHyxi2Bewg
 eGIrwcFH095C0k8axgQyTCgj31ARwkQUB2S6XK+aH/FxU6KMQK1vgL9y8UxC47bQd2d1pzwk
 w6524FyM14qs1c08zWJyPFL1wtZuX1ModqV5xpHVnyw/oYrtnq2fta/JTlLXbtn9/LeXZ4fN
 zXy1wuc84lD47VrOyNJVV1FXHpF4QJ6gybTzTonSd4kwYk7x2c2hT5jmLBfzWH+piz0qZ6X/
 ALsGINZLAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsVy+t/xu7ov1TfGGWxYr2nRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzaLzyyw2i7VH7rJbHPzwhNXi
 5655LA68HmvmrWH02PttAYvHzll32T22f3vA6nG/+ziTx+Yl9R63/z1m9ph8Yzmjx+6bDWwe
 fVtWMXp83iQXwB2lZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZ
 llqkb5egl3H72FGmgi8SFQ+WnWVsYPwr3MXIySEhYCLxsO8aO4gtJLCUUeJCRzFEXEbi5LQG
 VghbWOLPtS62LkYuoJpPjBJXOz4zgyTYBAwlut5CJEQEOhklpnV/ZAdxmAVeMUl8+NPKCFIl
 LBAg0dR2BmwFi4CqxNlT91hAbF4BO4ndi78zQqyQl1i94QDYVE6g+ONLd9ggTiqU+HD+O+sE
 Rr4FjAyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAmNl27Gfm3cwXtoYfIhRgINRiYc34vP6
 OCHWxLLiytxDjBIczEoivMt+bIgT4k1JrKxKLcqPLyrNSS0+xGgKdNREZinR5HxgHOeVxBua
 GppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamCcqvhwo3506RkZraqqmA/z
 XQP8KsMdT+XOqyi4cM3g/qGT6zVtOjXU3IpD75yJrkrMEyjJFtT8K3IpdNKWP2yv3wamB0wv
 mHLK8IouQ7Cdx6qYeyEFXU4LLBsPBj1klFgfMd0x7FDNwgqnCR+eRF+OvnRXKN1AX17LdaeB
 31aZs8+vMK1x91JiKc5INNRiLipOBADU/IzZqwIAAA==
X-CMS-MailID: 20200505084633eucas1p19798e1fb42c9430a93d668bc585e58da
X-Msg-Generator: CA
X-RootMTR: 20200505084633eucas1p19798e1fb42c9430a93d668bc585e58da
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084633eucas1p19798e1fb42c9430a93d668bc585e58da
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084633eucas1p19798e1fb42c9430a93d668bc585e58da@eucas1p1.samsung.com>
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
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of the entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. A common mistake was to ignore a result
of the dma_map_sg function and don't use the sg_table->orig_nents at all.

To avoid such issues, lets use common dma-mapping wrappers operating
directly on the struct sg_table objects and adjust references to the
nents and orig_nents respectively.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v3 00/25] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/5/187
---
 drivers/gpu/host1x/job.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index a10643a..850115e 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -166,11 +166,9 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 				goto unpin;
 			}
 
-			err = dma_map_sg(dev, sgt->sgl, sgt->nents, dir);
-			if (!err) {
-				err = -ENOMEM;
+			err = dma_map_sgtable(dev, sgt, dir);
+			if (err)
 				goto unpin;
-			}
 
 			job->unpins[job->num_unpins].dev = dev;
 			job->unpins[job->num_unpins].dir = dir;
@@ -217,7 +215,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		}
 
 		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
-			for_each_sg(sgt->sgl, sg, sgt->nents, j)
+			for_each_sg(sgt->sgl, sg, sgt->orig_nents, j)
 				gather_size += sg->length;
 			gather_size = iova_align(&host->iova, gather_size);
 
@@ -229,9 +227,9 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 				goto unpin;
 			}
 
-			err = iommu_map_sg(host->domain,
+			err = iommu_map_sgtable(host->domain,
 					iova_dma_addr(&host->iova, alloc),
-					sgt->sgl, sgt->nents, IOMMU_READ);
+					sgt, IOMMU_READ);
 			if (err == 0) {
 				__free_iova(&host->iova, alloc);
 				err = -EINVAL;
@@ -241,12 +239,9 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			job->unpins[job->num_unpins].size = gather_size;
 			phys_addr = iova_dma_addr(&host->iova, alloc);
 		} else if (sgt) {
-			err = dma_map_sg(host->dev, sgt->sgl, sgt->nents,
-					 DMA_TO_DEVICE);
-			if (!err) {
-				err = -ENOMEM;
+			err = dma_map_sgtable(host->dev, sgt, DMA_TO_DEVICE);
+			if (err)
 				goto unpin;
-			}
 
 			job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
 			job->unpins[job->num_unpins].dev = host->dev;
@@ -647,8 +642,7 @@ void host1x_job_unpin(struct host1x_job *job)
 		}
 
 		if (unpin->dev && sgt)
-			dma_unmap_sg(unpin->dev, sgt->sgl, sgt->nents,
-				     unpin->dir);
+			dma_unmap_sgtable(unpin->dev, sgt, unpin->dir);
 
 		host1x_bo_unpin(dev, unpin->bo, sgt);
 		host1x_bo_put(unpin->bo);
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
