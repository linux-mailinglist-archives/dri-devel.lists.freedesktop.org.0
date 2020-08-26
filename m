Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C93252714
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FB06EA04;
	Wed, 26 Aug 2020 06:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E50B6E9FB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:34 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063533euoutp02ffed02fd0495d065cc2ec63b1e5751bc~uveqo0_gs1512715127euoutp02H
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200826063533euoutp02ffed02fd0495d065cc2ec63b1e5751bc~uveqo0_gs1512715127euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423733;
 bh=tj4USkT4mmzGAYtGQ+Hrc6tAZIJTZKbcemrdU4KaPkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dUTjsC+lWGgje3l0CYUc5fZrHc0hvnmwedA17C19fTQFJawLlTv6ckJhlUBM0rcAS
 S1VEHPOuivr4qb+V9DjCRBDuk2wqsnBDGJVK1EyyB6sVf90kMdJvyBYpgXPLLTuNBE
 HfGxW0sqawpXcOi1j4UDd01BpKoXi0+srGYmGG2E=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200826063532eucas1p19599f3f76a90b38968292c91fdd010a2~uveqGviFR1480714807eucas1p1R;
 Wed, 26 Aug 2020 06:35:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 74.AD.05997.4B2064F5; Wed, 26
 Aug 2020 07:35:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063532eucas1p2a9e0215f483104d45af0560d5dbfa8e0~uvep1PGWJ1927919279eucas1p28;
 Wed, 26 Aug 2020 06:35:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200826063532eusmtrp224e4f6d526159f7efce29882b84f4645~uvep0ik9A0466204662eusmtrp2F;
 Wed, 26 Aug 2020 06:35:32 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-c3-5f4602b4b8d4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AF.43.06017.4B2064F5; Wed, 26
 Aug 2020 07:35:32 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063531eusmtip23e0bc3de6df1e0ce7711e0325ad7623a~uvepOdmJC0091500915eusmtip2H;
 Wed, 26 Aug 2020 06:35:31 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 08/32] drm: i915: fix common struct sg_table related issues
Date: Wed, 26 Aug 2020 08:32:52 +0200
Message-Id: <20200826063316.23486-9-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSeUgUURzHeTM7s6O4Oq6CL5XEJQMtNStowpSUkumPSoOITtty8D7YVUtF
 Mstr1TwqErV103LNXdPUzCOvTVvFtE1tUbLDI2gLM/AgO7QdR+u/z+/7/X3f9/F4BCp8jtkS
 oVGxjCRKHCHCTXlNL5ZfuTYifoE75GXbqNyhfoR6XFSLUatNBSg1ujiHUw9VvQhVkt+AUIpO
 T0o5Uguo9nsItTA6iVD103qMGmktxamannd8qvv7DEZ1Fuv5+y1otVwN6PYlBY+ueGZA6KdL
 HzFa3h9Af8jWInTD/Sv025VplL45pgR023gKTt9orAb0fP1mf7NTpvuCmIjQeEbi7n3eNERV
 fZcXo7C/XDa6JQVobWTAhIDkbvgrMxWTAVNCSFYB2Kv6yuOGBQCLMjoQbpgHcDq9EtuILOpq
 Uc5QAjizWoqwxlpkfNCcZZz0gLJZGc6yNZkGYF+uGRtAyR4UDiv0gDWsSH/4Y6xijXmkE5zK
 r15rEJBe8LNeyePaHKCqrgtl2YT0htrsPJw9CJJ6PtQ+SMO5pQNwpjAXcGwFv2gb+Rzbw9WW
 MoQLXANwcqiGzw05AI6kFq0nPOHE0E/jSYTxfs6wttWdk31gje46xsqQNIdjs5asjBqxsOkO
 yskCmJku5La3wmLto3+13bphlGMajs7lrL9pgbH1UyaaDxyK/5cpAKgGNkycNDKYke6MYi65
 ScWR0rioYLeL0ZH1wPi1Bla0C82g9fcFDSAJIDITKPCDgUJMHC9NiNQASKAia4Hv4MA5oSBI
 nJDISKIDJXERjFQD7AieyEawq9xwVkgGi2OZcIaJYSQbLkKY2KaAMNliZZKsy74vQxU0MZ6o
 tFTEZbdV2XvPi6wD2t4IhMSt4+LXrpO67X7HniQGZJafyMlKnlZX+pxOLjqjntpkcDQ5YoHm
 ufScTDd0OP8JV9odPXy1JGgw392RTPJzcqDkHV51mqxDez3eh83q7ErMbit9Ndrmby/b9jRa
 O0uWW0Q8aYjYwwWVSMV/AXf9lk1WAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xe7pbmNziDa4flrToPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSxmT9jMZLFgv7XF8svrGS32LmSy+HLlIZPFpsfXWC0u75rDZrH2
 yF12i4MfnrBa7J91jd2B32PNvDWMHnu/LWDxWLznJZPH9m8PWD3mnQz0uN99nMlj85J6j9v/
 HjN7TL6xnNFj980GNo++LasYPT5vkgvgidKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0
 No+1MjJV0rezSUnNySxLLdK3S9DLWL1qLkvBApmK+VdUGhiPi3cxcnJICJhIfL2wnhnEFhJY
 yigx/3gwRFxG4uS0BlYIW1jiz7Uuti5GLqCaT4wSD45cZAJJsAkYSnS9hUiICHQySkzr/sgO
 kmAWOMMs8XuDdxcjB4ewgJ/E115dkDCLgKrEowmrwIbyCthKvLi2nAVigbzE6g0HwI7gFLCT
 ON7dzwZxkK3E6bUzmCcw8i1gZFjFKJJaWpybnltspFecmFtcmpeul5yfu4kRGD/bjv3csoOx
 613wIUYBDkYlHt4FbK7xQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAp0
 1ERmKdHkfGBs55XEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYLzy
 tpxdIrv678HNR059CnxmLlCpLfdOfbFzmYVIe8WNpY9v2RzgDRIXF3GdbPaIf45B13wr9ymt
 b8Luzt280kxBc3riycP3CldzHFBgfbM+h5FV8ZfKnXlLy3iLEn2Z3i4QWSKcqNK575qAfWPt
 25I5vF905+00NI21yg6TcM6vrtzUGK4YosRSnJFoqMVcVJwIAMZZ58e1AgAA
X-CMS-MailID: 20200826063532eucas1p2a9e0215f483104d45af0560d5dbfa8e0
X-Msg-Generator: CA
X-RootMTR: 20200826063532eucas1p2a9e0215f483104d45af0560d5dbfa8e0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063532eucas1p2a9e0215f483104d45af0560d5dbfa8e0
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063532eucas1p2a9e0215f483104d45af0560d5dbfa8e0@eucas1p2.samsung.com>
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
