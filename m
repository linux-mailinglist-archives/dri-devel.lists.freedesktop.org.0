Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92650190245
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01466E435;
	Mon, 23 Mar 2020 23:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D00B6E435
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:53:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 65so2676025wrl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFazG1803l4g7qpG7od+GGJimmRIlwyCpH2igH1JJ6I=;
 b=ncea4iJ6ZtKSCXHzDSw5LFuIrTXIvW7JW49h/295di5U0KdGmtMiyLIeDU3jCxd7Zi
 8llHaJDgCjeDLd7NBOS89lB4ww9wxJ/d8TxzCgmw8aEdMFujHcvmFB7PgK+YmQfl6SvH
 F+LgK0xbJgIvhZsYKmozv8NijOPXpJmms0B8FVqHFf8IlibR3SQOyVjfMXQRDi7mG+Dl
 0kSaLH3EITXcE2pd6CK3i00RNY9MTs2jeKXl9E+1pqNbbDmDJdtKXZ+v88Y2u945G+9q
 p3QEFaVNfRCCo0q6ljZOClDmcFEguaSogYJfTYWEd6N9ssnoTvtirkCrFLnEOstRNjS5
 aa+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFazG1803l4g7qpG7od+GGJimmRIlwyCpH2igH1JJ6I=;
 b=TctmcdvOpIj0zEw+OMrH9D3KNwuX8EfUJLM1QdiqTESo4Z1w2RKjGOZ5JlolvrqszZ
 MVBsh2j5OcL5DPa9gEmnBGxFxUocDk/oAIuRkJoZ17A5jBmKxJbX6Ws42XwguRpVQNOD
 y///jvasGZjRgfbAlAnu5RRUZV6P+PWtByk/0HTGX78DJwuXUdDox7skPTN+ppeuAV3G
 qR5MLCUOraeMyHb8cDpdbGMKjQWHP0LJef7xqLloqHaY1dr/vNC5vLbA/JcCfpAIz7iu
 3MIqhNPCgZ/R18Q4n+aLrB1cJbUI7TyKE1JIG/O6d0gwmelQC0/3DhTuEXlvJ9BdNi1x
 bVSA==
X-Gm-Message-State: ANhLgQ0GTvZSDSnxzt4jUJcUlocqobd5J7W6S1S5e72UBv7KGeyhMskk
 BlKT03gOm3kjIdHNxgVNya2bIRxYEdA=
X-Google-Smtp-Source: ADFU+vseKDYOkRtip8uZ6p81B1VNcFYulb/+Ot4aGIYR+w7bbfukq7nN+NP7tGLY5tX2rT9hXeasMw==
X-Received: by 2002:adf:b307:: with SMTP id j7mr34222793wrd.128.1585007578464; 
 Mon, 23 Mar 2020 16:52:58 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id t1sm26729287wrq.36.2020.03.23.16.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:52:57 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/prime: correct logic for mapping sg to arrays
Date: Mon, 23 Mar 2020 23:51:36 +0000
Message-Id: <20200323235138.207442-2-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200323235138.207442-1-bigbeeshane@gmail.com>
References: <20200323205137.136530-1-bigbeeshane@gmail.com>
 <20200323235138.207442-1-bigbeeshane@gmail.com>
MIME-Version: 1.0
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
Cc: bigbeeshane@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previously drm_prime_sg_to_page_addr_arrays did not allow for
scatter-gather tables where the length had been reduced in a
dma_map.

This commit enables this via drm_prime_dma_sg_to_page_addr_arrays
while still keeping the original logic in place for tables that
that have not been through dma mapping

Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
---
 drivers/gpu/drm/drm_prime.c | 71 ++++++++++++++++++++++++++++++++-----
 include/drm/drm_prime.h     |  5 +++
 2 files changed, 67 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 86d9b0e45c8c..ed045043323e 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -943,21 +943,22 @@ struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_gem_prime_import);
 
+
 /**
  * drm_prime_sg_to_page_addr_arrays - convert an sg table into a page array
  * @sgt: scatter-gather table to convert
  * @pages: optional array of page pointers to store the page array in
  * @addrs: optional array to store the dma bus address of each page
  * @max_entries: size of both the passed-in arrays
+ * @sg_length: size of scatter-gather table
+ * @dma_mapped: if the supplied scatter-gather table has been dma mapped
  *
- * Exports an sg table into an array of pages and addresses. This is currently
- * required by the TTM driver in order to do correct fault handling.
- *
- * Drivers can use this in their &drm_driver.gem_prime_import_sg_table
- * implementation.
+ * Used internally to dri for both drm_prime_sg_to_page_addr_arrays and
+ * drm_prime_dma_sg_to_page_addr_arrays
  */
-int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
-				     dma_addr_t *addrs, int max_entries)
+static int drm_prime_sg_to_arrays(struct sg_table *sgt, struct page **pages,
+				     dma_addr_t *addrs, int max_entries,
+				     unsigned sg_length, bool dma_mapped)
 {
 	unsigned count;
 	struct scatterlist *sg;
@@ -966,8 +967,11 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
 	dma_addr_t addr;
 
 	index = 0;
-	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
-		len = sg->length;
+	for_each_sg(sgt->sgl, sg, sg_length, count) {
+		if (!dma_mapped)
+			len = sg->length;
+		else
+			len = sg_dma_len(sg);
 		page = sg_page(sg);
 		addr = sg_dma_address(sg);
 
@@ -987,8 +991,57 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
 	}
 	return 0;
 }
+
+
+/**
+ * drm_prime_sg_to_page_addr_arrays - convert an sg table into a page array
+ * @sgt: scatter-gather table to convert
+ * @pages: optional array of page pointers to store the page array in
+ * @addrs: optional array to store the dma bus address of each page
+ * @max_entries: size of both the passed-in arrays
+ *
+ * Exports an sg table into an array of pages and addresses. This is currently
+ * required by the TTM driver in order to do correct fault handling.
+ *
+ * Used in instances when sgt->nents is the true length of the scatter-gather
+ * table
+ *
+ * Drivers can use this in their &drm_driver.gem_prime_import_sg_table
+ * implementation.
+ */
+int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
+				     dma_addr_t *addrs, int max_entries)
+{
+    return drm_prime_sg_to_arrays(sgt, pages, addrs, max_entries, sgt->nents,
+					false);
+}
 EXPORT_SYMBOL(drm_prime_sg_to_page_addr_arrays);
 
+
+/**
+ * drm_prime_dma_sg_to_page_addr_arrays - convert an sg table into a page array
+ * @sgt: scatter-gather table to convert
+ * @pages: optional array of page pointers to store the page array in
+ * @addrs: optional array to store the dma bus address of each page
+ * @max_entries: size of both the passed-in arrays
+ * @sg_length: size of scatter-gather table (this has the potential to differ
+ *           from sgt->nents due to dma_mapping)
+ *
+ *
+ * Used in instances when sgt->nents is not a valid length of the scatter-gather
+ * table
+ */
+int drm_prime_dma_sg_to_page_addr_arrays(struct sg_table *sgt,
+					struct page **pages,
+					dma_addr_t *addrs, int max_entries,
+					unsigned sg_length)
+{
+    return drm_prime_sg_to_arrays(sgt, pages, addrs, max_entries, sg_length,
+					true);
+}
+EXPORT_SYMBOL(drm_prime_dma_sg_to_page_addr_arrays);
+
+
 /**
  * drm_prime_gem_destroy - helper to clean up a PRIME-imported GEM object
  * @obj: GEM object which was created from a dma-buf
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 9af7422b44cf..83fa7b28fc1f 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -104,5 +104,10 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg);
 int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
 				     dma_addr_t *addrs, int max_pages);
 
+int drm_prime_dma_sg_to_page_addr_arrays(struct sg_table *sgt,
+					struct page **pages,
+					dma_addr_t *addrs, int max_pages,
+					unsigned entries);
+
 
 #endif /* __DRM_PRIME_H__ */
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
