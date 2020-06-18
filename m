Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5F41FF76A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1AA6EB8E;
	Thu, 18 Jun 2020 15:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878F16EB92
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:40 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200618154039euoutp0206f50697a5fd67fc6f1d0eb3319b1096~ZrZ50bpxt1354913549euoutp02S
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200618154039euoutp0206f50697a5fd67fc6f1d0eb3319b1096~ZrZ50bpxt1354913549euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592494839;
 bh=bUR0gkYnHY2yGJNGlfsLKjT3FPrFZZ3Z2LsLuxLZIzE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qc9xM290EInWEc6qOa+aAiUjmqO3epRnOrc6nSHKgDev3t4LN1k4W5tu8cp34nabm
 EbLBhXwwEgR9vg3caaX12Yd3RRi4t14YhzqOP3rbft79xPrudkTSZkrvLVsHu3/DMa
 hYK4ZgDNP7wl2mquyDG44tghLtdaOQJWPJflaL9w=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200618154039eucas1p27f22f2881645b0769b94b16a5159f94d~ZrZ5oBFp40608806088eucas1p20;
 Thu, 18 Jun 2020 15:40:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 61.70.60698.6FA8BEE5; Thu, 18
 Jun 2020 16:40:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154038eucas1p1acd4fcdd183de4c19c4004778527a755~ZrZ5UdJYA1545815458eucas1p1o;
 Thu, 18 Jun 2020 15:40:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200618154038eusmtrp12e800f642df656361881d213119aff1b~ZrZ5Ty4wZ2230622306eusmtrp1W;
 Thu, 18 Jun 2020 15:40:38 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-54-5eeb8af69cde
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 76.F9.07950.6FA8BEE5; Thu, 18
 Jun 2020 16:40:38 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154038eusmtip19632174da7f25d0e928d6533f76216c7~ZrZ4ojlkT0833608336eusmtip1V;
 Thu, 18 Jun 2020 15:40:38 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 35/36] videobuf2: use sgtable-based scatterlist wrappers
Date: Thu, 18 Jun 2020 17:39:56 +0200
Message-Id: <20200618153956.29558-36-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSfSxVYRzuPeeec8+9uXW6bN6htLtVqy0y2s7GRMXO1h+ppbU+cOPsMp/d
 g6g/ssR0XUYUSTGZb7ldopFEcUXdiBpJiLXrW7vubczIcaj/nt/z/J49z+/dS6DSLsyGCImI
 ZpQR8jAZLhbUdyzpD5tV035HFtvdqDT9e4R6nluDUWv1mSjVb5rHqfLKdoTqfTgsoApbXKnF
 /jGE0o5/xai+xnycUmteYFT1u2EhVaJdQajs2SUh1bowgXnspKueVAG62VwooLUVd3G6wTyK
 0SOpOoSuLb5FD62Oo3TWQCmgmwYTcHp8eRKn0+sqAG3U7qG7TEahj+Si2C2ICQuJZZSO7gHi
 4Lo7TVjU4zNxmYNvsQRQc0IFRAQkXWBxeg+iAmJCSpYBWNo/gfPDIoDjw29QfjACaNIX4FuW
 0aFZAS+UAvjDYEA4YcNyf8aDwzjpBFWzqg2DFZkEYGeaBYdRsgaFRVUkhy3JU/CVqVfIYQG5
 D36YasU4LCHdYbN5ZjPMHlZquBYiQrTOd+uSMC4Ykj+FUFOWg/JLJ2FnKm+GpCWc0tUJeWwH
 u7PUAt6QCOCYvlrID2oA+27nAn7LFX7XL6/HEev1DsKaRkee9oSGri8oR0NyBxyY3cUfsAPe
 q8/ZpCUwJVnKb++Hebpn/2Jbez5vVqPh4iezkH+sTADzH7ShGcA+739YIQAVwJqJYcMVDOsc
 wVx3YOXhbEyEwiEwMlwL1n9Y96rO9BK8XrnaBkgCyCwkhnPTflJMHsvGh7cBSKAyK8nxj91+
 UkmQPP4Go4z0V8aEMWwbsCUEMmuJc9HkFSmpkEczoQwTxSi3VIQQ2SQAu8Cg6NSGuaXta1bO
 GeLzjnp1cHCKZvqaxne+ExObygfYuJLQZH3OseUDigxRbs82URwYS3Qe7Ajx81ww7vVHjK4t
 BbWI+GbcJR8W9QLFj5xqn9p7H+2w/TZy+QJ6einAxScxg7I/W9ArBnO/e3u8s2ki0Xd385+W
 X/Neah+ZgA2WOx1Claz8LxjfRMVdAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xu7rful7HGZzepmvRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMllcnHmXxWLBfmuLL1ceMllsenyN1eLyrjlsFj0btrJarD1yl91i
 2aY/TBZT3v5ktzj44QmrA7/HmnlrGD32flvA4rFpVSebx/ZvD1g97ncfZ/LYvKTe4/a/x8we
 k28sZ/TYfbOBzePxr5dsHn1bVjF6fN4k53Hq62f2AN4oPZui/NKSVIWM/OISW6VoQwsjPUNL
 Cz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYwtLbtZC+YGVky8eZi1gXG9cxcjJ4eEgInE
 g9tvWboYuTiEBJYySmy79JwFIiEjcXJaAyuELSzx51oXG0TRJ6Cin8/ZQRJsAoYSXW8hEiIC
 nYwS07o/soM4zAI7mSX2337KCFIlLOAtsefrRbAOFgFViTOvDoKN5RWwk9j77Q0bxAp5idUb
 DjCD2JxA8dPHW8FqhARsJZ5/aGObwMi3gJFhFaNIamlxbnpusZFecWJucWleul5yfu4mRmBU
 bTv2c8sOxq53wYcYBTgYlXh4X4S8jhNiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+fFFp
 TmrxIUZToKMmMkuJJucDIz6vJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwf
 EwenVAPjjl8WdSqe5595zjmo+Enw/Pe537TWvbJ7HvXl0bednWmh3OHLm9tSMyKe+WyW36Gm
 Y9gXZ/rh7gxNBpEtEwzllrMeW3dCakl9z/VSZZX8aYzhqmf9NphnHOq8dcfyRHOJq5Xxn5fK
 3/5ve6HgdUj62e6UH8/VQsUWuDXbLnF7/TLiwYq/YlcUlFiKMxINtZiLihMB19SdncACAAA=
X-CMS-MailID: 20200618154038eucas1p1acd4fcdd183de4c19c4004778527a755
X-Msg-Generator: CA
X-RootMTR: 20200618154038eucas1p1acd4fcdd183de4c19c4004778527a755
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154038eucas1p1acd4fcdd183de4c19c4004778527a755
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154038eucas1p1acd4fcdd183de4c19c4004778527a755@eucas1p1.samsung.com>
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
Cc: Pawel Osciak <pawel@osciak.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use recently introduced common wrappers operating directly on the struct
sg_table objects and scatterlist page iterators to make the code a bit
more compact, robust, easier to follow and copy/paste safe.

No functional change, because the code already properly did all the
scaterlist related calls.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../common/videobuf2/videobuf2-dma-contig.c   | 41 ++++++++-----------
 .../media/common/videobuf2/videobuf2-dma-sg.c | 32 ++++++---------
 .../common/videobuf2/videobuf2-vmalloc.c      | 12 ++----
 3 files changed, 34 insertions(+), 51 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index f4b4a7c135eb..ba01a8692d88 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -48,16 +48,15 @@ struct vb2_dc_buf {
 
 static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
 {
-	struct scatterlist *s;
 	dma_addr_t expected = sg_dma_address(sgt->sgl);
-	unsigned int i;
+	struct sg_dma_page_iter dma_iter;
 	unsigned long size = 0;
 
-	for_each_sg(sgt->sgl, s, sgt->nents, i) {
-		if (sg_dma_address(s) != expected)
+	for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
+		if (sg_page_iter_dma_address(&dma_iter) != expected)
 			break;
-		expected = sg_dma_address(s) + sg_dma_len(s);
-		size += sg_dma_len(s);
+		expected += PAGE_SIZE;
+		size += PAGE_SIZE;
 	}
 	return size;
 }
@@ -99,8 +98,7 @@ static void vb2_dc_prepare(void *buf_priv)
 	if (!sgt || buf->db_attach)
 		return;
 
-	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
-			       buf->dma_dir);
+	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
 }
 
 static void vb2_dc_finish(void *buf_priv)
@@ -112,7 +110,7 @@ static void vb2_dc_finish(void *buf_priv)
 	if (!sgt || buf->db_attach)
 		return;
 
-	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
+	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
 }
 
 /*********************************************/
@@ -273,8 +271,8 @@ static void vb2_dc_dmabuf_ops_detach(struct dma_buf *dbuf,
 		 * memory locations do not require any explicit cache
 		 * maintenance prior or after being used by the device.
 		 */
-		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
-				   attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
+		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
+				  DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sgt);
 	kfree(attach);
 	db_attach->priv = NULL;
@@ -299,8 +297,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
 
 	/* release any previous cache */
 	if (attach->dma_dir != DMA_NONE) {
-		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
-				   attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
+		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
+				  DMA_ATTR_SKIP_CPU_SYNC);
 		attach->dma_dir = DMA_NONE;
 	}
 
@@ -308,9 +306,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
 	 * mapping to the client with new direction, no cache sync
 	 * required see comment in vb2_dc_dmabuf_ops_detach()
 	 */
-	sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
-				      dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
-	if (!sgt->nents) {
+	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir,
+			    DMA_ATTR_SKIP_CPU_SYNC)) {
 		pr_err("failed to map scatterlist\n");
 		mutex_unlock(lock);
 		return ERR_PTR(-EIO);
@@ -423,8 +420,8 @@ static void vb2_dc_put_userptr(void *buf_priv)
 		 * No need to sync to CPU, it's already synced to the CPU
 		 * since the finish() memop will have been called before this.
 		 */
-		dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
-				   buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
+		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
+				  DMA_ATTR_SKIP_CPU_SYNC);
 		pages = frame_vector_pages(buf->vec);
 		/* sgt should exist only if vector contains pages... */
 		BUG_ON(IS_ERR(pages));
@@ -521,9 +518,8 @@ static void *vb2_dc_get_userptr(struct device *dev, unsigned long vaddr,
 	 * No need to sync to the device, this will happen later when the
 	 * prepare() memop is called.
 	 */
-	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
-				      buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
-	if (sgt->nents <= 0) {
+	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
+			    DMA_ATTR_SKIP_CPU_SYNC)) {
 		pr_err("failed to map scatterlist\n");
 		ret = -EIO;
 		goto fail_sgt_init;
@@ -545,8 +541,7 @@ static void *vb2_dc_get_userptr(struct device *dev, unsigned long vaddr,
 	return buf;
 
 fail_map_sg:
-	dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
-			   buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
 
 fail_sgt_init:
 	sg_free_table(sgt);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 92072a08af25..6ddf953efa11 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -142,9 +142,8 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
 	 * No need to sync to the device, this will happen later when the
 	 * prepare() memop is called.
 	 */
-	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
-				      buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
-	if (!sgt->nents)
+	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
+			    DMA_ATTR_SKIP_CPU_SYNC)) {
 		goto fail_map;
 
 	buf->handler.refcount = &buf->refcount;
@@ -180,8 +179,8 @@ static void vb2_dma_sg_put(void *buf_priv)
 	if (refcount_dec_and_test(&buf->refcount)) {
 		dprintk(1, "%s: Freeing buffer of %d pages\n", __func__,
 			buf->num_pages);
-		dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
-				   buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
+		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
+				  DMA_ATTR_SKIP_CPU_SYNC);
 		if (buf->vaddr)
 			vm_unmap_ram(buf->vaddr, buf->num_pages);
 		sg_free_table(buf->dma_sgt);
@@ -202,8 +201,7 @@ static void vb2_dma_sg_prepare(void *buf_priv)
 	if (buf->db_attach)
 		return;
 
-	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
-			       buf->dma_dir);
+	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
 }
 
 static void vb2_dma_sg_finish(void *buf_priv)
@@ -215,7 +213,7 @@ static void vb2_dma_sg_finish(void *buf_priv)
 	if (buf->db_attach)
 		return;
 
-	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
+	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
 }
 
 static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
@@ -258,9 +256,8 @@ static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
 	 * No need to sync to the device, this will happen later when the
 	 * prepare() memop is called.
 	 */
-	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
-				      buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
-	if (!sgt->nents)
+	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
+			    DMA_ATTR_SKIP_CPU_SYNC)) {
 		goto userptr_fail_map;
 
 	return buf;
@@ -286,8 +283,7 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
 
 	dprintk(1, "%s: Releasing userspace buffer of %d pages\n",
 	       __func__, buf->num_pages);
-	dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir,
-			   DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
 	if (buf->vaddr)
 		vm_unmap_ram(buf->vaddr, buf->num_pages);
 	sg_free_table(buf->dma_sgt);
@@ -410,8 +406,7 @@ static void vb2_dma_sg_dmabuf_ops_detach(struct dma_buf *dbuf,
 
 	/* release the scatterlist cache */
 	if (attach->dma_dir != DMA_NONE)
-		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
-			attach->dma_dir);
+		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir);
 	sg_free_table(sgt);
 	kfree(attach);
 	db_attach->priv = NULL;
@@ -436,15 +431,12 @@ static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
 
 	/* release any previous cache */
 	if (attach->dma_dir != DMA_NONE) {
-		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
-			attach->dma_dir);
+		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir);
 		attach->dma_dir = DMA_NONE;
 	}
 
 	/* mapping to the client with new direction */
-	sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
-				dma_dir);
-	if (!sgt->nents) {
+	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
 		pr_err("failed to map scatterlist\n");
 		mutex_unlock(lock);
 		return ERR_PTR(-EIO);
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index c66fda4a65e4..bf5ac63a5742 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -229,7 +229,7 @@ static int vb2_vmalloc_dmabuf_ops_attach(struct dma_buf *dbuf,
 		kfree(attach);
 		return ret;
 	}
-	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+	for_each_sgtable_sg(sgt, sg, i) {
 		struct page *page = vmalloc_to_page(vaddr);
 
 		if (!page) {
@@ -259,8 +259,7 @@ static void vb2_vmalloc_dmabuf_ops_detach(struct dma_buf *dbuf,
 
 	/* release the scatterlist cache */
 	if (attach->dma_dir != DMA_NONE)
-		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
-			attach->dma_dir);
+		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
 	sg_free_table(sgt);
 	kfree(attach);
 	db_attach->priv = NULL;
@@ -285,15 +284,12 @@ static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
 
 	/* release any previous cache */
 	if (attach->dma_dir != DMA_NONE) {
-		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
-			attach->dma_dir);
+		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
 		attach->dma_dir = DMA_NONE;
 	}
 
 	/* mapping to the client with new direction */
-	sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
-				dma_dir);
-	if (!sgt->nents) {
+	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
 		pr_err("failed to map scatterlist\n");
 		mutex_unlock(lock);
 		return ERR_PTR(-EIO);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
