Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7976C2526F1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0F86E9F8;
	Wed, 26 Aug 2020 06:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCE86E9F8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063528euoutp0113f949bde0990a325bba834529e304a7~uvemDiVGu1716617166euoutp01T
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200826063528euoutp0113f949bde0990a325bba834529e304a7~uvemDiVGu1716617166euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423728;
 bh=1Hig8DSaUQrSWNGiVEYKJYaWSxEcAqEZHyfhwOgJEQc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T0xH1esPq11vJvvaMmbxa+HqC7mLMNKCxdjMbXhMVYpU8hS7/y4FOKxG6fRCiMeVx
 w6kLtfhFRlUJlgCQ+c9UVA5x+DAdX6C3TRUR28GKAxjvgfgyZyh4FwNbDd8e77fi4S
 rufcE5kcdqioUnTtI+Hj6U42jNgV3Nln6KzAosI8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200826063528eucas1p17aee62b7c9f7ab73d0c399539d8dfa51~uvelzGFPf1480714807eucas1p1I;
 Wed, 26 Aug 2020 06:35:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id BE.9D.05997.0B2064F5; Wed, 26
 Aug 2020 07:35:28 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200826063527eucas1p1d68954adf1c25e1d760b92ca0845ab48~uveli2xBH1474114741eucas1p1b;
 Wed, 26 Aug 2020 06:35:27 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200826063527eusmtrp29179cc95e6c3d2559c9d36bf123c17bc~uveliI-NV0396003960eusmtrp2f;
 Wed, 26 Aug 2020 06:35:27 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-b3-5f4602b0cec5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 59.43.06017.FA2064F5; Wed, 26
 Aug 2020 07:35:27 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063527eusmtip2a6650922ead90b48834553f5ca67743c~uvek3IQJF0302303023eusmtip2t;
 Wed, 26 Aug 2020 06:35:27 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 01/32] drm: prime: add common helper to check scatterlist
 contiguity
Date: Wed, 26 Aug 2020 08:32:45 +0200
Message-Id: <20200826063316.23486-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfSxVcRjH+51zz7nHnavTZfyGZbuVVctrNWcjS6Wd9U/a2lpvuHLGFZfu
 QV7aSGO58l7zUuNm5paXvFNkIVwmalHkLcLIS8jL0kROB/33eb7f7/N79jz7EaikATMm5IpA
 RqmQ+UpxkaCqZbXTogQ562Y99klAxXe2IVRpejFGbVQlo1T38hxOPS9oRij1G3tqqXsEocpG
 P2NUV80TnCpqGhRSTxcqBVRMbB5GNcyPYVTFTDJ2Uo8uzCoEdN2KWkCX5cfidPXKMEZntV2g
 v8ZpEbo8N4LuXx9F6dReDaBrv0TidEJFPqDL28PpxbK9LuIrIgdPxlcezCitHN1F3kOVg8KA
 KZOQ8oVRYST4aagCBAHJYzBxwkQFRISEfAZgRbwG8MUSgKnjfQhfLAK4MN6Ebne8/uOhAjqb
 ugbAuIKQnYa8qG8YZ+CkDVTNqnCODchoAFvjdbkQSqpRuLoYAzhDn7wMU97+EnAsIA/ApvEf
 /3QxeQJ29dchHEPSDBaU1KMc65COUBuXiHMPQXJICJMe5wj50BlYHfsO41kfTmkrtnRTuPEq
 G+Eb7gE40lkk5IsHAHZFpQM+ZQ8HOn/j3G4oeQgW11jxshNc7RkT8ivrwd7ZPZyMbmJKVdrW
 JcTwfoyET5vDTO2LnbENHz6iPNPwUWQfyl8rGcCpKjYJmGX+n6UGIB8YMUGsnxfD2iqY25as
 zI8NUnhZ3vD3KwObH6t9Xbv0EtSseTQCkgBSXbEad3aTYLJgNtSvEUAClRqIT3W0u0rEnrLQ
 MEbp76YM8mXYRmBCCKRG4qM5369LSC9ZIHOTYQIY5baLEDrGkcA1wjc62cpHVmtnlD3tLp/D
 6piZtIEmW8/Gcxm5KXOtlteW1abBLiKLsY4SnYT6ieniUM34wF31xbaidvtSoY857rx/eLeW
 su+Te8iHXWImmx374vWPHL+zqyes/6rhvlS3h9YH7cIznDSTl3KRxfnyKIX72nnlrdGRlqL3
 px0GpALWW2ZzGFWysr8cNXMKVAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xe7rrmdziDdbu07HoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12i4Uft7JYtHUuY7U4
 +OEJq8WWNxNZHfg81sxbw+ix99sCFo9NqzrZPLZ/e8DqMe9koMf97uNMHpuX1Hvc/veY2WPy
 jeWMHrtvNrB59G1Zxeix+XS1x+dNcgG8UXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG
 5rFWRqZK+nY2Kak5mWWpRfp2CXoZ97beZS94JV2x+eNj9gbGT2JdjBwcEgImEnv+JnUxcnEI
 CSxllDi1/QpbFyMnUFxG4uS0BlYIW1jiz7UuNoiiT4wS1/68YQJJsAkYSnS9hUiICHQySkzr
 /sgO4jALrGCWeLVvLgtIlbBAuETr+1VgNouAqsSRp+8YQWxeAVuJy7f3MkGskJdYveEAM4jN
 KWAncby7H+wMIaCa02tnME9g5FvAyLCKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMIq2Hfu5
 ZQdj17vgQ4wCHIxKPLwL2FzjhVgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI
 0RToqInMUqLJ+cAIzyuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnV
 wDj7tHTzR4aF/mJCEQv2+KwujBFvv/LoS3nZ9dwHmss9drBt+NTfxDb534f3PyuPBjSruXhw
 al9fuNriRw7/N62tC/bb8nFEGl7KPSJzkLvpx2penbLlNu0PNWfdZGUqeHCzeW7A8zUHLq8L
 mNp0+Vqw+J/+RqW0Gbv11i3/cdFva8pu1uQyj9NKLMUZiYZazEXFiQBDcb39uAIAAA==
X-CMS-MailID: 20200826063527eucas1p1d68954adf1c25e1d760b92ca0845ab48
X-Msg-Generator: CA
X-RootMTR: 20200826063527eucas1p1d68954adf1c25e1d760b92ca0845ab48
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063527eucas1p1d68954adf1c25e1d760b92ca0845ab48
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063527eucas1p1d68954adf1c25e1d760b92ca0845ab48@eucas1p1.samsung.com>
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

It is a common operation done by DRM drivers to check the contiguity
of the DMA-mapped buffer described by a scatterlist in the
sg_table object. Let's add a common helper for this operation.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 23 +++------------------
 drivers/gpu/drm/drm_prime.c          | 31 ++++++++++++++++++++++++++++
 include/drm/drm_prime.h              |  2 ++
 3 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 822edeadbab3..59b9ca207b42 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -471,26 +471,9 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 {
 	struct drm_gem_cma_object *cma_obj;
 
-	if (sgt->nents != 1) {
-		/* check if the entries in the sg_table are contiguous */
-		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
-		struct scatterlist *s;
-		unsigned int i;
-
-		for_each_sg(sgt->sgl, s, sgt->nents, i) {
-			/*
-			 * sg_dma_address(s) is only valid for entries
-			 * that have sg_dma_len(s) != 0
-			 */
-			if (!sg_dma_len(s))
-				continue;
-
-			if (sg_dma_address(s) != next_addr)
-				return ERR_PTR(-EINVAL);
-
-			next_addr = sg_dma_address(s) + sg_dma_len(s);
-		}
-	}
+	/* check if the entries in the sg_table are contiguous */
+	if (drm_prime_get_contiguous_size(sgt) < attach->dmabuf->size)
+		return ERR_PTR(-EINVAL);
 
 	/* Create a CMA GEM buffer. */
 	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 1693aa7c14b5..4ed5ed1f078c 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -825,6 +825,37 @@ struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_page
 }
 EXPORT_SYMBOL(drm_prime_pages_to_sg);
 
+/**
+ * drm_prime_get_contiguous_size - returns the contiguous size of the buffer
+ * @sgt: sg_table describing the buffer to check
+ *
+ * This helper calculates the contiguous size in the DMA address space
+ * of the the buffer described by the provided sg_table.
+ *
+ * This is useful for implementing
+ * &drm_gem_object_funcs.gem_prime_import_sg_table.
+ */
+unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt)
+{
+	dma_addr_t expected = sg_dma_address(sgt->sgl);
+	struct scatterlist *sg;
+	unsigned long size = 0;
+	int i;
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		unsigned int len = sg_dma_len(sg);
+
+		if (!len)
+			break;
+		if (sg_dma_address(sg) != expected)
+			break;
+		expected += len;
+		size += len;
+	}
+	return size;
+}
+EXPORT_SYMBOL(drm_prime_get_contiguous_size);
+
 /**
  * drm_gem_prime_export - helper library implementation of the export callback
  * @obj: GEM object to export
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 9af7422b44cf..47ef11614627 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -92,6 +92,8 @@ struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_page
 struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 				     int flags);
 
+unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt);
+
 /* helper functions for importing */
 struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 						struct dma_buf *dma_buf,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
