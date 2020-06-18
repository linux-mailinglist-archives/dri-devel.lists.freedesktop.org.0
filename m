Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530381FF739
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7436EB72;
	Thu, 18 Jun 2020 15:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DA16EB70
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:22 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200618154020euoutp029823a09ae90f60b1c3cff805f6df4447~ZrZoojTLM1254412544euoutp02Y
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200618154020euoutp029823a09ae90f60b1c3cff805f6df4447~ZrZoojTLM1254412544euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592494820;
 bh=tj4USkT4mmzGAYtGQ+Hrc6tAZIJTZKbcemrdU4KaPkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=haU5ti1LmU0xmHa0cMtZynSQJ9ciaWxwITYsg5sSSIa4Wk96ml8Cblegp2iZzGMF4
 V3SZewgVKu6baiWcF7vRFVCmTJB6TKxYIILh/Bk0qsSUJd06zXYoLc1cvNiAceFtYh
 xPmfj+Novm8wDy5fEGQFGS11bmH+kXLDbVlVGgWE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200618154020eucas1p1fdd8a2f01d9531033041feeccd834b08~ZrZoTA22C0074000740eucas1p10;
 Thu, 18 Jun 2020 15:40:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 4D.CE.60679.4EA8BEE5; Thu, 18
 Jun 2020 16:40:20 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200618154020eucas1p2b1cc0b386396bd09b735cc9d06906082~ZrZn_Vnfu0608006080eucas1p2N;
 Thu, 18 Jun 2020 15:40:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200618154020eusmtrp297d2caa0103f91831151757ed2ca195a~ZrZn9Z2V40399203992eusmtrp2V;
 Thu, 18 Jun 2020 15:40:20 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-26-5eeb8ae4a465
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 76.EE.08375.4EA8BEE5; Thu, 18
 Jun 2020 16:40:20 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154019eusmtip1cdb1619afa0bc2257d86f26de1caacce~ZrZnRn8rQ0833608336eusmtip1O;
 Thu, 18 Jun 2020 15:40:19 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/36] drm: i915: fix common struct sg_table related issues
Date: Thu, 18 Jun 2020 17:39:30 +0200
Message-Id: <20200618153956.29558-10-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRjmPefs7Dhcnabg19UYXUgw0yK+KKKL0Yn6oWR/Is1ZJ5V06uay
 BZErLFspU0PFUpcF1szmdZoW2rwsM7VyDUUl04JMwsoVXbTlPGr/nvd5nvd7Hl4+hpS1iJYx
 scpkXqVUxMlpCWVp/9Xj/14/HrHpcu1KnNHdQeDKfLMIuyxZJLZ/n6Dx/bI2At80VBPY2LQd
 l/aaAT+5TWCn/R2Bq0YdItzbcIvG5a1DYvz0y3sRbipwiHct5h4UPQDuyQ8jxd15PEZwdT+G
 RVxRRyj39pqN4KrvXuAG/o6SXE5fKXCN/ak0l1ljAm6yalWI51HJjpN8XOwZXhWwM1ISU2Yq
 pBKNK84W29ekgs1HDx4MYregvl92sR4kjIy9B6jKYKSFwQmo/s/EnDIJ6M03Mzm/Yh3LBUEo
 BdR8JR0WVkxDA2K3i2YDkf6znnZjbzYN0LMMT7eJZFtJ9NroALfgxYagytoaQg8MQ7Fr0c8b
 W920lN2JXgzXz6X5orKK5lnsMcN32tJE7ncQ6xCjN66vlGAKRqWtFXPYC32y1YgFvAK5HhUT
 wsIlQO+6y8XCcB1Q78V8EFzb0WD3b9rdgmQ3IHNDgEDvRmMt07PlELsI9X1e4qbJGZhtySMF
 WorSL8sE9zpUYHu4EPv05eu5/hzKcTWRwoGyADV1NVIG8C34H2YEMIEPr1HHR/PqICWfslGt
 iFdrlNEbTyTEV8HM1+r8a3PWQ8NUlBVYBuSe0o9h4xEykeKMWhtvBcSQcm/pnq7OCJn0pEJ7
 jlclHFdp4ni1FZYzlNxHurlkLFzGRiuS+dM8n8ir5lWC8ViWCsf6I6uDzLr2slw9Tty2dnV+
 ybcjfUlXRwI1Lrw3Ji8l2BDlc37J86kPSc5rg6/kbYX3ZBpT8IH+ui6/CpFlUXNGaBq4LNZp
 6rBjv1YSUKk7xLlYXbZRm+48mLH+RRgdnjRSsM+7bnPzqYGBcemrSFW4X7t/sq6wZ6k5sxgM
 ckodowj0I1VqxT8EuuQBVgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xu7pPul7HGUxawGbRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlnMnrCZyWLBfmuL5ZfXM1rsXchk8eXKQyaLTY+vsVpc3jWHzWLt
 kbvsFgc/PGG12D/rGrsDv8eaeWsYPfZ+W8DisXjPSyaP7d8esHrMOxnocb/7OJPH5iX1Hrf/
 PWb2mHxjOaPH7psNbB59W1YxenzeJBfAE6VnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdo
 bB5rZWSqpG9nk5Kak1mWWqRvl6CXsXrVXJaCBTIV86+oNDAeF+9i5OSQEDCROPRyGiOILSSw
 lFFi5TIriLiMxMlpDawQtrDEn2tdbF2MXEA1nxglHrT2gyXYBAwlut5CJEQEOhklpnV/ZAdJ
 MAucYZb4vcEbxBYW8JN4NeM3UAMHB4uAqsSPKWYgYV4BO4kzD3YwQyyQl1i94QCYzQkUP328
 lRXiIFuJ5x/a2CYw8i1gZFjFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGD/bjv3cvIPx0sbg
 Q4wCHIxKPLwvQl7HCbEmlhVX5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++qDQntfgQoynQTROZ
 pUST84GxnVcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgTHw11z2
 6PCT685wfP8oXrLCl1lff1aXxvWdl0xc36+IELx6uOVGKOOJHZWak1y4d/daMj4NebTK8aep
 90Tu4CN8EW1qlVU7r1Xs61cTVVgi/Tnxxmm9E0wzIu6ufDHb52f8gbm6h5a7alh4Cr2c2KEQ
 EPS233VWD8ecg9P5d68/KbTMarFG010lluKMREMt5qLiRAAR+nxFtQIAAA==
X-CMS-MailID: 20200618154020eucas1p2b1cc0b386396bd09b735cc9d06906082
X-Msg-Generator: CA
X-RootMTR: 20200618154020eucas1p2b1cc0b386396bd09b735cc9d06906082
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154020eucas1p2b1cc0b386396bd09b735cc9d06906082
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154020eucas1p2b1cc0b386396bd09b735cc9d06906082@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Robin Murphy <robin.murphy@arm.com>,
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

This driver creatively uses sg_table->orig_nents to store the size of the
allocated scatterlist and ignores the number of the entries returned by
dma_map_sg function. The sg_table->orig_nents is (mis)used to properly
free the (over)allocated scatterlist.

This patch only introduces the common DMA-mapping wrappers operating
directly on the struct sg_table objects to the dmabuf related functions,
so the other drivers, which might share buffers with i915 could rely on
the properly set nents and orig_nents values.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       | 11 +++--------
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c |  7 +++----
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 2679380159fc..8a988592715b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -48,12 +48,9 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
 		src = sg_next(src);
 	}
 
-	if (!dma_map_sg_attrs(attachment->dev,
-			      st->sgl, st->nents, dir,
-			      DMA_ATTR_SKIP_CPU_SYNC)) {
-		ret = -ENOMEM;
+	ret = dma_map_sgtable(attachment->dev, st, dir, DMA_ATTR_SKIP_CPU_SYNC);
+	if (ret)
 		goto err_free_sg;
-	}
 
 	return st;
 
@@ -73,9 +70,7 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attachment,
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(attachment->dmabuf);
 
-	dma_unmap_sg_attrs(attachment->dev,
-			   sg->sgl, sg->nents, dir,
-			   DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_sgtable(attachment->dev, sg, dir, DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sg);
 	kfree(sg);
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
index debaf7b18ab5..be30b27e2926 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
@@ -28,10 +28,9 @@ static struct sg_table *mock_map_dma_buf(struct dma_buf_attachment *attachment,
 		sg = sg_next(sg);
 	}
 
-	if (!dma_map_sg(attachment->dev, st->sgl, st->nents, dir)) {
-		err = -ENOMEM;
+	err = dma_map_sgtable(attachment->dev, st, dir, 0);
+	if (err)
 		goto err_st;
-	}
 
 	return st;
 
@@ -46,7 +45,7 @@ static void mock_unmap_dma_buf(struct dma_buf_attachment *attachment,
 			       struct sg_table *st,
 			       enum dma_data_direction dir)
 {
-	dma_unmap_sg(attachment->dev, st->sgl, st->nents, dir);
+	dma_unmap_sgtable(attachment->dev, st, dir, 0);
 	sg_free_table(st);
 	kfree(st);
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
