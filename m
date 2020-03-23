Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D62719071F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C276E447;
	Tue, 24 Mar 2020 08:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8274D6E3EC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 18:51:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d198so578271wmd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 11:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iFazG1803l4g7qpG7od+GGJimmRIlwyCpH2igH1JJ6I=;
 b=WktGipkP6zH/Sv1zW+aoMama1H3pecr0/5Cm2QpJAYIJmEkOqP1rc1QlhnxFVgUbXe
 jL1uJIwKS87WmEQfGSInTWfyHK2Y6xdnAPi3JGSO19XeLFrCrbPvSMmyw7ypg0ttBI0f
 AomTDJv1htXXjswGOiLsVgaSJwdaAolkmTYN0QYU6wYE4XxiRulxI1IV5cAv0kCX54zh
 HT1nfe6HfxIfn4ij/pwlM2i3/Jeo0pMaqbSz92Zz4gUEoxkWQL1RHfsPsqq+DL0lqtTH
 aF2DAnaNTrGvg58b7dWs/5SCB28mCvfwGH4bbZE0x0yrA9EkEyl1bXmNCE+BCcJb9rcA
 8p0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iFazG1803l4g7qpG7od+GGJimmRIlwyCpH2igH1JJ6I=;
 b=sQyvrDUvG16g03nTJCfRUQTK1wV2nU+VKbEq9SmFZLOUNe/UC0yoPjs0n3huSqhbdB
 SvgG8p+WCPDoETAX2aJlm6kQR5chQoJZP3yhChRyBWGeSaRUtS8XMqOoJApf1t323LvT
 w0fW2Hv5XUelxWGY+UnSbiSQMV58sOuhi0mjV+Cf+wAiyQQpolX6g6Pvlys+961KSuu6
 vZI7Aj0h9hkFiHHlsIPWFhwk98NQEOLKZBHFGsPXJnVy+J5bN7knTDfiFv64UQKjGwGC
 De7cb4a16CIQhYgYtSpq4P8YynZF3D6VjXKKHH0ISgeeU222Pr3MR7vDq/iVVtoZA4X3
 7vwQ==
X-Gm-Message-State: ANhLgQ3Ul/Tx6MdK0/VC5ZhxaacJx/Z8SfCvXNT+GkXVqnHXDK+2iwR9
 DaaEoo8zVU9fBPjCoDIVl47YF+OiZWg=
X-Google-Smtp-Source: ADFU+vuplllaxcVPBOoDFrWnoggMmf/UtEwjhCQqLfXPmqEUW74ZprCPPFduuK53xURboPKkrPaAEg==
X-Received: by 2002:a7b:c359:: with SMTP id l25mr769094wmj.149.1584989489760; 
 Mon, 23 Mar 2020 11:51:29 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id o26sm574111wmc.33.2020.03.23.11.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 11:51:29 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/prime: correct logic for mapping sg to arrays
Date: Mon, 23 Mar 2020 18:51:10 +0000
Message-Id: <20200323185111.135713-1-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:09:16 +0000
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
