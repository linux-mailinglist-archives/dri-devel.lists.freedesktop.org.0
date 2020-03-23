Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F3A18FFDC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 21:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED1A6E391;
	Mon, 23 Mar 2020 20:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E4A6E391
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 20:52:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a25so18914268wrd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 13:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFazG1803l4g7qpG7od+GGJimmRIlwyCpH2igH1JJ6I=;
 b=H8YnRaLDRe4VfYML4Qn8B4MehZ4sIGNMP+ouXx2Aeo2JznSole1UpEVKFLq/VgpFOA
 4bcJ3hXJ8VzLuTBW/Hd1NXXYPbkEKeyiPEhI2pc9CqkF6+t2Zz5cPNV+csP6omieiY0s
 A+gYTfm4hk7nOEuFpF+zd74oYN2EBYAVqSBMXWDCWGVehG1lgLzpbKk/5wDoM91mKaAH
 lFxGFDQydRl4h6szsJWF2fYBWAgQ58UQ9ogRj31BS3Etjm38uJi14Ow03FcWenDY9SW1
 HJebVn/dU17rkWubgDhJPtEYm/ryp+f9087oAYZfahd8ownxjHzBiVlJRmO4cEAXx8As
 bQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFazG1803l4g7qpG7od+GGJimmRIlwyCpH2igH1JJ6I=;
 b=U5+EAHZlGaFIiARJZwK/4TQWlj1eBeOAbBeGWg8FyuI41nl9E7gps48961oVANEPTF
 TWJuNtbuieSr+LAcWDOZPO5oO7vbDMszQOwFHiUzHeh7Basq1Lb++TaBGRhL2AFS44ZE
 yc8qw6Cq/Ow/AwRDe+tKP+DRz1Zcp9+LdGa3vC0dPpIirpbgs46gUUhVp1aCIxXEKqwY
 2+DyxcM2Y9fhbZQ1GLlkOUmVWXh4FhIRM8lfCAQh5cGJcQKZKMtekBf8eIuypDs17YUk
 6vjaE9LK6DHRqAoOVGRpCkv0CGy+WqtfVRXtGI+xXB5/4mjrNmAMDsnjHhDP3OA14ePk
 2I7w==
X-Gm-Message-State: ANhLgQ21KY/gfiws/ozcsW2I7SLth0K1YRj4lq7uIAvbkQsfssD6zCHW
 5Oz4xwDRrXMeYNitGh4IeV1w9UFasmQ=
X-Google-Smtp-Source: ADFU+vssDeGKhP6ByzEhc3VjyImPOsQGmt2gyYf5mQDkxco0LU7HF5308lbEmMgjRZaKcAmMGfrDgA==
X-Received: by 2002:adf:9b96:: with SMTP id d22mr34391445wrc.249.1584996719254; 
 Mon, 23 Mar 2020 13:51:59 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id f23sm1133315wmf.1.2020.03.23.13.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 13:51:58 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/prime: correct logic for mapping sg to arrays
Date: Mon, 23 Mar 2020 20:51:36 +0000
Message-Id: <20200323205137.136530-2-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200323205137.136530-1-bigbeeshane@gmail.com>
References: <20200323205137.136530-1-bigbeeshane@gmail.com>
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
