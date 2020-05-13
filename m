Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB751D1522
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715006EA35;
	Wed, 13 May 2020 13:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C295A6EA2D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:06 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133305euoutp0242266c18e47ebcd45d5e9d2972ffab5d~OmcP9ygFU3223232232euoutp02r
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200513133305euoutp0242266c18e47ebcd45d5e9d2972ffab5d~OmcP9ygFU3223232232euoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376785;
 bh=z9EfuvXz29SpoaO1u1hYDnS9A8CwqyxmFLAoV9YTbmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XZ0IpuNP5wzwn3mMAnVTxWuYUIIsunV5e5uYxZg6/XE8qjJ1ftGOSJXv+EaVdMnAH
 1LrFle6YW1WaXxYLKuuFN219jUE6pDg6DOdbRRRHRnMsgvAZKr9Fi55sH2cMnpKJ3m
 x8OLZI6sGRwEP/Rv8Ah77AmRY2is3vbW8jOaLFbY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200513133305eucas1p1aa1760055cdc49ff4321a57d67227f93~OmcPsFhgG0876608766eucas1p1z;
 Wed, 13 May 2020 13:33:05 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 47.C5.61286.117FBBE5; Wed, 13
 May 2020 14:33:05 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200513133304eucas1p2d24ddf9d7d60aad254486010db86e6bc~OmcPXj3u32581325813eucas1p2L;
 Wed, 13 May 2020 13:33:04 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133304eusmtrp19607ff2c6360b25ea2a6dfa1ac9ca55e~OmcPWzvCN1049110491eusmtrp1F;
 Wed, 13 May 2020 13:33:04 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-43-5ebbf7113423
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C7.37.07950.017FBBE5; Wed, 13
 May 2020 14:33:04 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133304eusmtip15529af41e9a69e66f77087c52417587e~OmcOpSeCB0741507415eusmtip1h;
 Wed, 13 May 2020 13:33:04 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/38] drm: i915: fix common struct sg_table related issues
Date: Wed, 13 May 2020 15:32:19 +0200
Message-Id: <20200513133245.6408-12-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRjHec/Z2c6Gq+MUfVFTWBQkObMSTliR0IdDhei3irJWHqblVDbv
 Ui2Hdy3Lwktms4SlzpY6VFzLprOlxrxMh5pmoiQKonktEW3zmH37Pf8Lz8vDi6MCI+aBR8XE
 07IYcbSQzWM1ff7T6+e8rg8/pu7gkQWWLoSsL9Fi5HbTE5QcXF1gk9W1nQj5orARIVVtQaTa
 qgWkoRIhVwYnEbJhyoaR1tZyNllnGueQxsVpjGwrs3HO7ac0FRpAGdZULOrNh1mEal77gVEV
 XWHURJ4ZoRqrHlDftqZQqmhYDSj9iIJNPdLVAGq5wTvU6SrvdAQdHZVIy/zP3uRFlhamxlkP
 JA91b6AKMA1zAY5D4iQ0WFi5gIcLiLcAKkZKEGZYAXBz6RfGDMsA5myO2h3uTiPbquQ4WECo
 AWzRHN1rzBZbdkJsIgDmzueyHexKZAD4pcDJEUIJEwoHVDbgMFyIUKj6ubrDLOIQtLY0Yw7m
 E2fgQrWWzWzzgbXvP6EO5tr1ubG2ncdCwsaBWb+fYUzoPHxetr3LLnDOrOMw7AV7ivJ3C0oA
 Jy11HGbIB9CaXgKYVBAcs2ywHedAiSNQ2+rPyMFQ/zIfYa60Dw7POztk1I5Pm4pRRubD7EwB
 kz4My8zv9tYa+wZ2IxQcmopjDtQB4MMqI1YIfMr+71IBUAPc6QS5VELLA2LoJJFcLJUnxEhE
 t2OlDcD+sXq2zEstYHXgVjsgcCB04pOj+nABJk6Up0jbAcRRoSs/RGuX+BHilFRaFntDlhBN
 y9uBJ84SuvNPvJ69LiAk4nj6Lk3H0bJ/LoJzPRSgqTjdreq+oTMh0BpWqulpNHK3TN2qyylF
 nvWv0rKu9eVV1sbytJG66Kz4nI/HhSzbeMjFqJryGZNUcu9Slu8FY3JbWmY/N/jKks48UeFG
 JIV8zYCaRFGE/tTQdK/YoB/i9n5/3D9TPrKZZFn0UuIvlYXe60GiwT6//sDtOweFLHmkOMAX
 lcnFfwHtUAIcVAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xu7oC33fHGfx6YGrRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlnMnrCZyWLBfmuL5ZfXM1rsXchk8eXKQyaLTY+vsVpc3jWHzWLt
 kbvsFgc/PGG12D/rGrsDv8eaeWsYPfZ+W8DisXjPSyaP7d8esHrMOxnocb/7OJPH5iX1Hrf/
 PWb2mHxjOaPH7psNbB59W1YxenzeJBfAE6VnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdo
 bB5rZWSqpG9nk5Kak1mWWqRvl6CXMXNCVcFl2Yqrp34xNzA+kehi5OSQEDCR6LjczN7FyMUh
 JLCUUaJr+mQWiISMxMlpDawQtrDEn2tdbBBFnxgl/m6fxASSYBMwlOh6C5EQEehklJjW/ZEd
 JMEscIZZ4vcGbxBbWMBP4u+Op2BxFgFVics7toNN5RWwlXi/cj0bxAZ5idUbDjCD2JxA8Vd3
 9oNdISSQL7F38T62CYx8CxgZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgTG0LZjP7fsYOx6
 F3yIUYCDUYmH1+LW7jgh1sSy4srcQ4wSHMxKIrx+64FCvCmJlVWpRfnxRaU5qcWHGE2BjprI
 LCWanA+M77ySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYxb56gI
 9O9/bBOxiKkz5qeT7eWWpau46w4+WX5aXMmzczFr5a6L/DdL3i7srNyyZ4LLLYXjU4UUfi+8
 sCWzqfPC2ZXbtnk7cn201meVKlv8P+QXd36wDEN0WeTXw0brn/zZtHDJe/OrLdW7xC5Pzr1y
 qYKbVUnLpqpChZHx0KtfDU5MW86Z3TuqxFKckWioxVxUnAgAkBX5ZrcCAAA=
X-CMS-MailID: 20200513133304eucas1p2d24ddf9d7d60aad254486010db86e6bc
X-Msg-Generator: CA
X-RootMTR: 20200513133304eucas1p2d24ddf9d7d60aad254486010db86e6bc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133304eucas1p2d24ddf9d7d60aad254486010db86e6bc
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133304eucas1p2d24ddf9d7d60aad254486010db86e6bc@eucas1p2.samsung.com>
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
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       | 11 +++--------
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c |  7 +++----
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 7db5a79..6c67810 100644
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
index debaf7b..be30b27 100644
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
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
