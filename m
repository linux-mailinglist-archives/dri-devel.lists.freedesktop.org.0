Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A193C3A03
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 05:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E796EB7B;
	Sun, 11 Jul 2021 03:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AA66EB7B
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 03:53:45 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id s23so3964628oij.0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 20:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bURp8YWsykp4eeoAap5lajmnCegKkM+xjz+GDJJ/KpQ=;
 b=ux2cNZZQG5pktSubFWeH4F30Nc9iltZ2fVuIWPWZQqmhZLDjEyulpH0l2e7kWJJMAF
 +39TVrv3h9Uecirt66yvywU3lo0jGIQzR6L/8H4kKkigD8I1xKSlXowgbQdljxgkPuNs
 3XY5nWZ93KMSay8wayuK1Rze3soKqO7AmVQ534Agqrci3HrpXEK9hdgdyuS2a2SjA2j0
 N6aalLf9Dz5lLIJqQQL/bZDWMdk7PH/7NE0QN7f8U3h3KaRYDo9PxzQU4QTqgXNgJXO1
 Kdq05QmYZ/d2Bm7XtqbuEDAYg4/CGn8Qdm0WRujU9IUuwyvNCZbwK+kXZ4mS0bBl8E9z
 m4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bURp8YWsykp4eeoAap5lajmnCegKkM+xjz+GDJJ/KpQ=;
 b=mcEWeBZ/fymFe1Rw2zasq/bQ2KrF8i+bvYFuQKjVQLHOlpVkqeCK/BG5MmYAUB1N+H
 zV+1Bnc+Cv5KWH0IZHNjsnTpMqqMUvZuszLhriF3R0h+drGcJN7Nx4ilqud7Wxtfj4fi
 JkBwkJklqY3ySAA2lg2U3dzFqj41AynYziHhLRP9VPvO/5IWbjxW8ZQCtYQRLnXLlRdV
 ljSWwDujpf7f0AF4b1wbFIxA9YKrUON/vLTBvIFgZPDIIwuyLUlbm1wT2jVbYsNBonQP
 aFsC2BzmsyEBIKqJrHN96Wfka08xP/CLc+7CN419bQbA0MTZanxdfAn6/KjdRxCA65Vd
 TT4w==
X-Gm-Message-State: AOAM5330CybmC0Ud371Ih152400cMJ+SBZBq+yHGWD29z0DiXZWSp4qh
 Rr10fXd0AUtTUndO1Kr1guRAuQ==
X-Google-Smtp-Source: ABdhPJzRdy7mI4ex3LH8jYFZpmWbbeweZ1z+hmjtLPtpv+jLnBfdAHH7JrN+xEBC4QHCzIHyMEp6TQ==
X-Received: by 2002:a05:6808:683:: with SMTP id
 k3mr34261776oig.171.1625975625000; 
 Sat, 10 Jul 2021 20:53:45 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id a11sm2310188otr.48.2021.07.10.20.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 20:53:44 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915: Remove allow_alloc from i915_gem_object_get_sg*
Date: Sat, 10 Jul 2021 22:53:34 -0500
Message-Id: <20210711035336.803025-4-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711035336.803025-1-jason@jlekstrand.net>
References: <20210711035336.803025-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts the rest of 0edbb9ba1bfe ("drm/i915: Move cmd parser
pinning to execbuffer").  Now that the only user of i915_gem_object_get_sg
without allow_alloc has been removed, we can drop the parameter.  This
portion of the revert was broken into its own patch to aid review.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Jon Bloomfield <jon.bloomfield@intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 10 +++++-----
 drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 20 ++++----------------
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c       |  2 +-
 4 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index d423d8cac4f26..1603ed90d9c13 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -341,22 +341,22 @@ struct scatterlist *
 __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 			 struct i915_gem_object_page_iter *iter,
 			 unsigned int n,
-			 unsigned int *offset, bool allow_alloc, bool dma);
+			 unsigned int *offset, bool dma);
 
 static inline struct scatterlist *
 i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 		       unsigned int n,
-		       unsigned int *offset, bool allow_alloc)
+		       unsigned int *offset)
 {
-	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset, allow_alloc, false);
+	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset, false);
 }
 
 static inline struct scatterlist *
 i915_gem_object_get_sg_dma(struct drm_i915_gem_object *obj,
 			   unsigned int n,
-			   unsigned int *offset, bool allow_alloc)
+			   unsigned int *offset)
 {
-	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset, allow_alloc, true);
+	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset, true);
 }
 
 struct page *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index f2f850e31b8ed..40cad2655b637 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -467,7 +467,7 @@ __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 			 struct i915_gem_object_page_iter *iter,
 			 unsigned int n,
 			 unsigned int *offset,
-			 bool allow_alloc, bool dma)
+			 bool dma)
 {
 	struct scatterlist *sg;
 	unsigned int idx, count;
@@ -489,9 +489,6 @@ __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 	if (n < READ_ONCE(iter->sg_idx))
 		goto lookup;
 
-	if (!allow_alloc)
-		goto manual_lookup;
-
 	mutex_lock(&iter->lock);
 
 	/* We prefer to reuse the last sg so that repeated lookup of this
@@ -541,16 +538,7 @@ __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 	if (unlikely(n < idx)) /* insertion completed by another thread */
 		goto lookup;
 
-	goto manual_walk;
-
-manual_lookup:
-	idx = 0;
-	sg = obj->mm.pages->sgl;
-	count = __sg_page_count(sg);
-
-manual_walk:
-	/*
-	 * In case we failed to insert the entry into the radixtree, we need
+	/* In case we failed to insert the entry into the radixtree, we need
 	 * to look beyond the current sg.
 	 */
 	while (idx + count <= n) {
@@ -597,7 +585,7 @@ i915_gem_object_get_page(struct drm_i915_gem_object *obj, unsigned int n)
 
 	GEM_BUG_ON(!i915_gem_object_has_struct_page(obj));
 
-	sg = i915_gem_object_get_sg(obj, n, &offset, true);
+	sg = i915_gem_object_get_sg(obj, n, &offset);
 	return nth_page(sg_page(sg), offset);
 }
 
@@ -623,7 +611,7 @@ i915_gem_object_get_dma_address_len(struct drm_i915_gem_object *obj,
 	struct scatterlist *sg;
 	unsigned int offset;
 
-	sg = i915_gem_object_get_sg_dma(obj, n, &offset, true);
+	sg = i915_gem_object_get_sg_dma(obj, n, &offset);
 
 	if (len)
 		*len = sg_dma_len(sg) - (offset << PAGE_SHIFT);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 6589411396d3f..f253b11e9e367 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -589,7 +589,7 @@ static unsigned long i915_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
 
 	GEM_WARN_ON(bo->ttm);
 
-	sg = __i915_gem_object_get_sg(obj, &obj->ttm.get_io_page, page_offset, &ofs, true, true);
+	sg = __i915_gem_object_get_sg(obj, &obj->ttm.get_io_page, page_offset, &ofs, true);
 
 	return ((base + sg_dma_address(sg)) >> PAGE_SHIFT) + ofs;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 20e46b8433248..9d445ad9a3422 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -1494,7 +1494,7 @@ intel_partial_pages(const struct i915_ggtt_view *view,
 	if (ret)
 		goto err_sg_alloc;
 
-	iter = i915_gem_object_get_sg_dma(obj, view->partial.offset, &offset, true);
+	iter = i915_gem_object_get_sg_dma(obj, view->partial.offset, &offset);
 	GEM_BUG_ON(!iter);
 
 	sg = st->sgl;
-- 
2.31.1

