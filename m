Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6C61C50E2
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388D86E575;
	Tue,  5 May 2020 08:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA256E563
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:29 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084628euoutp02eec721276e2b5b14a32c2b249ce91496~MFXt8ugW82636226362euoutp02Q
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200505084628euoutp02eec721276e2b5b14a32c2b249ce91496~MFXt8ugW82636226362euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668388;
 bh=CPIvg9DJBsHomFhaYMeKmW3jnKNL9oo3n4aUE2S6eCA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G9XEfwm0jU+q55OQW8YsmG3Fx9YZN+2+irujaO7iunvLffpUgEsKlMQ+te0vgOTsC
 2/JtCSEFYlY9FfkQFF/FsfIgrCAZfelWdVAUI8Mw8/Ah1MQt7eFy2DB7xwBIRhN6co
 61uuzBOPRy3x5gsx6iZqrJEkXXGboIlyM2/esg10=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200505084628eucas1p10e8d07790bd21dca4b43534d0a702244~MFXtrfBvf2430324303eucas1p17;
 Tue,  5 May 2020 08:46:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3C.01.60698.4E721BE5; Tue,  5
 May 2020 09:46:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084627eucas1p199eed52198b4409da1fa8e2256f5bb62~MFXtQFxhC2423024230eucas1p15;
 Tue,  5 May 2020 08:46:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084627eusmtrp17da4e92b7e55c6d0d9bbcf02396b2e1a~MFXtPTOPv0942309423eusmtrp1R;
 Tue,  5 May 2020 08:46:27 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-30-5eb127e46587
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F4.14.08375.3E721BE5; Tue,  5
 May 2020 09:46:27 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084627eusmtip11b18811493c682f5d5ad483359babc32~MFXsmhYsG0686606866eusmtip1I;
 Tue,  5 May 2020 08:46:27 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/25] drm: i915: fix common struct sg_table related issues
Date: Tue,  5 May 2020 10:45:56 +0200
Message-Id: <20200505084614.30424-7-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRjHe8/Zzs7Wlqep+GaWMUgpUBP7cMi0JD8cCMqKIqLUmYdpeWPH
 WRrp0ixbXlYLvCRjZbi8zlteMy9pcy7U1NTIMlEsMzHyQomtnMfs2//5Pf/n+T+8vDgqbuM6
 4uFRsbQ8ShohwQSc2le/etwmXSsD973U2pMZPSaErMwxcMk/tfdQcnBxDiOLSjoR8qG6GiF1
 Ld6kfsAAyOZHCLkwOI6QVRNDXHKgMR8jyzo+8Mi275NcsiVviHfYhirVlgKqeUnHoQqeTyNU
 3dInLqU1naDG7hoRqvpJEvXeMoFSmhE9oJreKTEqs6YYUPNVOwOE5wQHQ+mI8Dha7uEbLAib
 mlPzYvq2XR1vKkSVoMJeBfg4JPbDwbQOTAUEuJh4CmCe/g7KFgsAaup/r3fmASxe1PJUAF8b
 6c69xHL9Ks81cTYmUoqGuda9GOEJVbMqzKrtiFQAuzKEVhNKdKCwXzcErA1bIgAmG16jVs0h
 dsPZrC5gTRARPlDdm8je5wxLKlrXLHzCF070j2Is/8iDX5bi2YP8YbZZymJb+NVYw2O1EzRr
 0tdug0QKgOM9ZTy2SAdwIDkHsC5vONqzjFkXocQeaGj0YLEfzEr+hrL7t8CR2a1WjK7K+7XZ
 61gE026JWbcLzDOWb8S29fWjrKZg949uHvs8nQCmqjWYGjjn/Q/TAVAMHGgFEymjGa8o+oo7
 I41kFFEy94vRkVVg9WOZLcbFevBiJaQdEDiQCEVn5w2BYq40jomPbAcQRyV2osKfFYFiUag0
 PoGWRwfJFRE00w624xyJg8jr8fQFMSGTxtKXaTqGlv/rIjjfUQlsAOIvCPV5mxMsqWl1rz3d
 NZNkafhcgL7Z7OZ389CkIQg/esC2sWk2OIZ7/NiYUmDutTmi672Oet3Y1XCy+5SHSdgwxc/v
 Ww50KlLzV+oKFmrmGndUKjJn6tyM+sRnLp3nTeFnHiR4K53lcaU+w7fLZSt2FuC6SRaSOMhQ
 1ywSDhMm9dyLyhnpX7GPxbFUAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xu7qP1TfGGVxYYGTRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlnMnrCZyWLBfmuL5ZfXM1rsXchk8eXKQyaLTY+vsVpc3jWHzWLt
 kbvsFgc/PGG12D/rGrsDv8eaeWsYPfZ+W8DisXjPSyaP7d8esHrMOxnocb/7OJPH5iX1Hrf/
 PWb2mHxjOaPH7psNbB59W1YxenzeJBfAE6VnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdo
 bB5rZWSqpG9nk5Kak1mWWqRvl6CX8ez9BPaCC5IVD3cvY25g3CDaxcjBISFgInFqZlYXIxeH
 kMBSRolrLztYuxg5geIyEienNUDZwhJ/rnWxQRR9YpRYcvgaG0iCTcBQoustREJEoJNRYlr3
 R3aQBLPAGWaJ3xu8QWxhAT+Jnjk3GUFsFgFVibf9JxhBNvMK2EpMOF8HsUBeYvWGA8wgNqeA
 ncTjS3fA5gsJFEp8OP+ddQIj3wJGhlWMIqmlxbnpucWGesWJucWleel6yfm5mxiBEbTt2M/N
 OxgvbQw+xCjAwajEwxvxeX2cEGtiWXFl7iFGCQ5mJRHeZT82xAnxpiRWVqUW5ccXleakFh9i
 NAW6aSKzlGhyPjC680riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1
 MGZtX787T2vOhHfvpxXOT/t69Hxfd7jH/i9c4VENia6Wf09+vP5vw7U6uyVszT1X3oT1h+XH
 bwjqz1q0mWfhsePs2Sc8PD5b2WaWu6feFJM68ni2v80Xz/R1RXrJnNahJ25NfPeDfc4Bk0yv
 jm++mY0LVxyXqlD5MCtwMu+FoHX3uueJnJ9db6TEUpyRaKjFXFScCACtogsvtgIAAA==
X-CMS-MailID: 20200505084627eucas1p199eed52198b4409da1fa8e2256f5bb62
X-Msg-Generator: CA
X-RootMTR: 20200505084627eucas1p199eed52198b4409da1fa8e2256f5bb62
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084627eucas1p199eed52198b4409da1fa8e2256f5bb62
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084627eucas1p199eed52198b4409da1fa8e2256f5bb62@eucas1p1.samsung.com>
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

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of the entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h.

This driver creatively uses sg_table->orig_nents to store the size of the
allocate scatterlist and ignores the number of the entries returned by
dma_map_sg function. The sg_table->orig_nents is (mis)used to properly
free the (over)allocated scatterlist.

This patch only introduces common dma-mapping wrappers operating directly
on the struct sg_table objects to the dmabuf related functions, so the
other drivers, which might share buffers with i915 could rely on the
properly set nents and orig_nents values.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v3 00/25] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/5/187
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       | 13 +++++--------
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c |  7 +++----
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 7db5a79..7e8583e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -48,12 +48,10 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
 		src = sg_next(src);
 	}
 
-	if (!dma_map_sg_attrs(attachment->dev,
-			      st->sgl, st->nents, dir,
-			      DMA_ATTR_SKIP_CPU_SYNC)) {
-		ret = -ENOMEM;
+	ret = dma_map_sgtable_attrs(attachment->dev, st, dir,
+				    DMA_ATTR_SKIP_CPU_SYNC);
+	if (ret)
 		goto err_free_sg;
-	}
 
 	return st;
 
@@ -73,9 +71,8 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attachment,
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(attachment->dmabuf);
 
-	dma_unmap_sg_attrs(attachment->dev,
-			   sg->sgl, sg->nents, dir,
-			   DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_sgtable_attrs(attachment->dev, sg, dir,
+				DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sg);
 	kfree(sg);
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
index debaf7b..756cb76 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
@@ -28,10 +28,9 @@ static struct sg_table *mock_map_dma_buf(struct dma_buf_attachment *attachment,
 		sg = sg_next(sg);
 	}
 
-	if (!dma_map_sg(attachment->dev, st->sgl, st->nents, dir)) {
-		err = -ENOMEM;
+	err = dma_map_sgtable(attachment->dev, st, dir);
+	if (err)
 		goto err_st;
-	}
 
 	return st;
 
@@ -46,7 +45,7 @@ static void mock_unmap_dma_buf(struct dma_buf_attachment *attachment,
 			       struct sg_table *st,
 			       enum dma_data_direction dir)
 {
-	dma_unmap_sg(attachment->dev, st->sgl, st->nents, dir);
+	dma_unmap_sgtable(attachment->dev, st, dir);
 	sg_free_table(st);
 	kfree(st);
 }
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
