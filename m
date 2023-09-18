Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800627A4B15
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 16:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F3910E0AC;
	Mon, 18 Sep 2023 14:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9F810E0A8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 14:32:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9BA27B80EA0;
 Mon, 18 Sep 2023 14:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62728C32789;
 Mon, 18 Sep 2023 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695047529;
 bh=vGUOt9KcUO/z+qvU+mkl7UIBpqBXYYdyCaU0w8vD7zU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ohQ64hBuen7t2T3SdkUaYZ+OtRz/T/m5gYYm3HCeqLKImVzBUCAjnBbclXVoQ0CdP
 EMjazYl5Vyd67uo0yvJ7KK7BYrzLbNmUlWZqvwwnO7g3G0m4KEKj8Ck/YkBGeN+Z28
 4a+kf5ybkYpym+z8dIt+DuawU7Nc3H3/lKSlqFEb9XoXjDXi1zIZRL9AOB4ffJ1rF5
 3yTb/ObJDV00ofVXawPpXimD492MJLGCJ9FrCXe3wZOfPtntAM6fJBWpubC2OwGCu7
 7cl7IYZQLsJSQXsu486ZjUta/Qo3F50TF1e+xirkH9SdKomvVXRUpPlUmOuwViAnsl
 fsFtvXnrTabfg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/10] accel/habanalabs: fix SG table creation for dma-buf
 mapping
Date: Mon, 18 Sep 2023 17:31:52 +0300
Message-Id: <20230918143158.903207-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918143158.903207-1-ogabbay@kernel.org>
References: <20230918143158.903207-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

In some cases the calculated number of required entries for the dma-buf
SG table is wrong. For example, if the page size is larger than both the
dma max segment size of the importer device and from the exported side,
or if the exported size is part of a phys_pg_pack that is composed of
several pages.
In these cases, redundant entries will be added to the SG table.

Modify the method that the number of entries is calculated, and the way
they are prepared.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/memory.c | 199 ++++++++++++-----------
 1 file changed, 104 insertions(+), 95 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index d0edbe4b4210..5c1e98e73a47 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1535,21 +1535,17 @@ static struct sg_table *alloc_sgt_from_device_pages(struct hl_device *hdev, u64
 						u64 page_size, u64 exported_size,
 						struct device *dev, enum dma_data_direction dir)
 {
-	u64 chunk_size, bar_address, dma_max_seg_size, cur_size_to_export, cur_npages;
-	struct asic_fixed_properties *prop;
-	int rc, i, j, nents, cur_page;
+	u64 dma_max_seg_size, curr_page, size, chunk_size, left_size_to_export, left_size_in_page,
+		left_size_in_dma_seg, device_address, bar_address;
+	struct asic_fixed_properties *prop = &hdev->asic_prop;
 	struct scatterlist *sg;
+	unsigned int nents, i;
 	struct sg_table *sgt;
+	bool next_sg_entry;
+	int rc;
 
-	prop = &hdev->asic_prop;
-
-	dma_max_seg_size = dma_get_max_seg_size(dev);
-
-	/* We would like to align the max segment size to PAGE_SIZE, so the
-	 * SGL will contain aligned addresses that can be easily mapped to
-	 * an MMU
-	 */
-	dma_max_seg_size = ALIGN_DOWN(dma_max_seg_size, PAGE_SIZE);
+	/* Align max segment size to PAGE_SIZE to fit the minimal IOMMU mapping granularity */
+	dma_max_seg_size = ALIGN_DOWN(dma_get_max_seg_size(dev), PAGE_SIZE);
 	if (dma_max_seg_size < PAGE_SIZE) {
 		dev_err_ratelimited(hdev->dev,
 				"dma_max_seg_size %llu can't be smaller than PAGE_SIZE\n",
@@ -1561,120 +1557,133 @@ static struct sg_table *alloc_sgt_from_device_pages(struct hl_device *hdev, u64
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
-	cur_size_to_export = exported_size;
+	/* Calculate the required number of entries for the SG table */
+	curr_page = 0;
+	nents = 1;
+	left_size_to_export = exported_size;
+	left_size_in_page = page_size;
+	left_size_in_dma_seg = dma_max_seg_size;
+	next_sg_entry = false;
+
+	while (true) {
+		size = min3(left_size_to_export, left_size_in_page, left_size_in_dma_seg);
+		left_size_to_export -= size;
+		left_size_in_page -= size;
+		left_size_in_dma_seg -= size;
+
+		if (!left_size_to_export)
+			break;
 
-	/* If the size of each page is larger than the dma max segment size,
-	 * then we can't combine pages and the number of entries in the SGL
-	 * will just be the
-	 * <number of pages> * <chunks of max segment size in each page>
-	 */
-	if (page_size > dma_max_seg_size) {
-		/* we should limit number of pages according to the exported size */
-		cur_npages = DIV_ROUND_UP_SECTOR_T(cur_size_to_export, page_size);
-		nents = cur_npages * DIV_ROUND_UP_SECTOR_T(page_size, dma_max_seg_size);
-	} else {
-		cur_npages = npages;
-
-		/* Get number of non-contiguous chunks */
-		for (i = 1, nents = 1, chunk_size = page_size ; i < cur_npages ; i++) {
-			if (pages[i - 1] + page_size != pages[i] ||
-					chunk_size + page_size > dma_max_seg_size) {
-				nents++;
-				chunk_size = page_size;
-				continue;
-			}
+		if (!left_size_in_page) {
+			/* left_size_to_export is not zero so there must be another page */
+			if (pages[curr_page] + page_size != pages[curr_page + 1])
+				next_sg_entry = true;
+
+			++curr_page;
+			left_size_in_page = page_size;
+		}
 
-			chunk_size += page_size;
+		if (!left_size_in_dma_seg) {
+			next_sg_entry = true;
+			left_size_in_dma_seg = dma_max_seg_size;
+		}
+
+		if (next_sg_entry) {
+			++nents;
+			next_sg_entry = false;
 		}
 	}
 
 	rc = sg_alloc_table(sgt, nents, GFP_KERNEL | __GFP_ZERO);
 	if (rc)
-		goto error_free;
-
-	cur_page = 0;
-
-	if (page_size > dma_max_seg_size) {
-		u64 size_left, cur_device_address = 0;
+		goto err_free_sgt;
 
-		size_left = page_size;
+	/* Prepare the SG table entries */
+	curr_page = 0;
+	device_address = pages[curr_page];
+	left_size_to_export = exported_size;
+	left_size_in_page = page_size;
+	left_size_in_dma_seg = dma_max_seg_size;
+	next_sg_entry = false;
 
-		/* Need to split each page into the number of chunks of
-		 * dma_max_seg_size
-		 */
-		for_each_sgtable_dma_sg(sgt, sg, i) {
-			if (size_left == page_size)
-				cur_device_address =
-					pages[cur_page] - prop->dram_base_address;
-			else
-				cur_device_address += dma_max_seg_size;
-
-			/* make sure not to export over exported size */
-			chunk_size = min3(size_left, dma_max_seg_size, cur_size_to_export);
-
-			bar_address = hdev->dram_pci_bar_start + cur_device_address;
-
-			rc = set_dma_sg(sg, bar_address, chunk_size, dev, dir);
-			if (rc)
-				goto error_unmap;
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		bar_address = hdev->dram_pci_bar_start + (device_address - prop->dram_base_address);
+		chunk_size = 0;
+
+		for ( ; curr_page < npages ; ++curr_page) {
+			size = min3(left_size_to_export, left_size_in_page, left_size_in_dma_seg);
+			chunk_size += size;
+			left_size_to_export -= size;
+			left_size_in_page -= size;
+			left_size_in_dma_seg -= size;
+
+			if (!left_size_to_export)
+				break;
+
+			if (!left_size_in_page) {
+				/* left_size_to_export is not zero so there must be another page */
+				if (pages[curr_page] + page_size != pages[curr_page + 1]) {
+					device_address = pages[curr_page + 1];
+					next_sg_entry = true;
+				}
+
+				left_size_in_page = page_size;
+			}
 
-			cur_size_to_export -= chunk_size;
+			if (!left_size_in_dma_seg) {
+				/*
+				 * Skip setting a new device address if already moving to a page
+				 * which is not contiguous with the current page.
+				 */
+				if (!next_sg_entry) {
+					device_address += chunk_size;
+					next_sg_entry = true;
+				}
+
+				left_size_in_dma_seg = dma_max_seg_size;
+			}
 
-			if (size_left > dma_max_seg_size) {
-				size_left -= dma_max_seg_size;
-			} else {
-				cur_page++;
-				size_left = page_size;
+			if (next_sg_entry) {
+				next_sg_entry = false;
+				break;
 			}
 		}
-	} else {
-		/* Merge pages and put them into the scatterlist */
-		for_each_sgtable_dma_sg(sgt, sg, i) {
-			chunk_size = page_size;
-			for (j = cur_page + 1 ; j < cur_npages ; j++) {
-				if (pages[j - 1] + page_size != pages[j] ||
-						chunk_size + page_size > dma_max_seg_size)
-					break;
-
-				chunk_size += page_size;
-			}
-
-			bar_address = hdev->dram_pci_bar_start +
-					(pages[cur_page] - prop->dram_base_address);
 
-			/* make sure not to export over exported size */
-			chunk_size = min(chunk_size, cur_size_to_export);
-			rc = set_dma_sg(sg, bar_address, chunk_size, dev, dir);
-			if (rc)
-				goto error_unmap;
+		rc = set_dma_sg(sg, bar_address, chunk_size, dev, dir);
+		if (rc)
+			goto err_unmap;
+	}
 
-			cur_size_to_export -= chunk_size;
-			cur_page = j;
-		}
+	/* There should be nothing left to export exactly after looping over all SG elements */
+	if (left_size_to_export) {
+		dev_err(hdev->dev,
+			"left size to export %#llx after initializing %u SG elements\n",
+			left_size_to_export, sgt->nents);
+		rc = -ENOMEM;
+		goto err_unmap;
 	}
 
-	/* Because we are not going to include a CPU list we want to have some
-	 * chance that other users will detect this by setting the orig_nents
-	 * to 0 and using only nents (length of DMA list) when going over the
-	 * sgl
+	/*
+	 * Because we are not going to include a CPU list, we want to have some chance that other
+	 * users will detect this when going over SG table, by setting the orig_nents to 0 and using
+	 * only nents (length of DMA list).
 	 */
 	sgt->orig_nents = 0;
 
 	return sgt;
 
-error_unmap:
+err_unmap:
 	for_each_sgtable_dma_sg(sgt, sg, i) {
 		if (!sg_dma_len(sg))
 			continue;
 
-		dma_unmap_resource(dev, sg_dma_address(sg),
-					sg_dma_len(sg), dir,
+		dma_unmap_resource(dev, sg_dma_address(sg), sg_dma_len(sg), dir,
 					DMA_ATTR_SKIP_CPU_SYNC);
 	}
 
 	sg_free_table(sgt);
 
-error_free:
+err_free_sgt:
 	kfree(sgt);
 	return ERR_PTR(rc);
 }
-- 
2.34.1

