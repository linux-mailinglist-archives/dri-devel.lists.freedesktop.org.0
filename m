Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98205399036
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 18:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA426ED09;
	Wed,  2 Jun 2021 16:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E916ED07
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 16:41:57 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id t8so2691773pgb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6J11+TRz4xSiqtAkfWPvGSwXkHbCelwyhdSPC20SmuY=;
 b=x4F1zZUl4lQFTJ8Ve0GzTjut4ZHiD9sMPvKBMXikmu8cwd1xoCgNjAExIRsl1hjA7R
 q4EfSjteuOx5sTImbGyHBW5aBm0I7D3mKwfHzmQbOqm4YE3NNsLWM7fmbIkfiw0g1Msu
 VAcBkCUxc3KUgGPWOdhFWcu7zv1+kIda/2tWiCL79xek1iEZdn+oOf+D7DQRB2VdkeHo
 VjNZ0jUwA4719ds9jbVSIiMByUjn1u9NiJ7Iqu2PP8ui/tQlEiHQ3mkmUeG+CMKvrDHW
 YR9hY+/JnurKAIriTXi+wbsgHemP/mv64EljFOl1kS1k7hZ8iT6qFPvJLEJUuXtxFupZ
 +zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6J11+TRz4xSiqtAkfWPvGSwXkHbCelwyhdSPC20SmuY=;
 b=cABog7yfSL885QHPgfuZfiHyha+Uoqn1FwAbrN21SUfljAY6IgJN7WQl2vkdaEFAF1
 ZGHR/SpWvv0iALKBE3/HyR2I4W4+Kp+Lgxf+S1fCB2rZeXhe0wFmpg0J/LqStwLhl2gR
 DPzEwPyYbDIZtRqXeHaSLHlXOq+41PWY2XwwOEc5lQwg7GUawMqJ5nH2w0QOxl499O+B
 PmgLk2suQEtl9CKMuNKO5EDwUCN3zW6bXZUFy7p94eqMekwcq4g9UHJh3mZ9giws4MUR
 pKmsYqBshvKX73ZMOKIlmyItJPaneUuc3bTdUWbe0golSyrlGWUhgxiODbadvUVCIKlQ
 JxFg==
X-Gm-Message-State: AOAM533O/YLGiccETLM3JsC4VedW3rs5f7bjvoA4Gn4YFAnZtTjw0q3W
 uZcCVV9//HqVKNehFymDNhi/gjuakJXBpw==
X-Google-Smtp-Source: ABdhPJx8uyGdXslGdWaI9yy5B0OpdY42vjRNhXfKqEQqwHG5RZPOiGwBcRUnxVurEvJ0f9//VCLTWA==
X-Received: by 2002:aa7:8b4f:0:b029:2bd:ea13:c4b4 with SMTP id
 i15-20020aa78b4f0000b02902bdea13c4b4mr27494320pfd.48.1622652116478; 
 Wed, 02 Jun 2021 09:41:56 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id h6sm75803pjs.15.2021.06.02.09.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 09:41:56 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915: Remove allow_alloc from i915_gem_object_get_sg*
Date: Wed,  2 Jun 2021 11:41:46 -0500
Message-Id: <20210602164149.391653-3-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602164149.391653-1-jason@jlekstrand.net>
References: <20210602164149.391653-1-jason@jlekstrand.net>
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
Cc: Jon Bloomfield <jon.bloomfield@intel.com>,
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
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 10 +++++-----
 drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 21 ++++-----------------
 drivers/gpu/drm/i915/gt/intel_ggtt.c       |  2 +-
 3 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 2ebd79537aea9..329d848f3ff6d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -339,22 +339,22 @@ struct scatterlist *
 __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 			 struct i915_gem_object_page_iter *iter,
 			 unsigned int n,
-			 unsigned int *offset, bool allow_alloc);
+			 unsigned int *offset);
 
 static inline struct scatterlist *
 i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 		       unsigned int n,
-		       unsigned int *offset, bool allow_alloc)
+		       unsigned int *offset)
 {
-	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset, allow_alloc);
+	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset);
 }
 
 static inline struct scatterlist *
 i915_gem_object_get_sg_dma(struct drm_i915_gem_object *obj,
 			   unsigned int n,
-			   unsigned int *offset, bool allow_alloc)
+			   unsigned int *offset)
 {
-	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset, allow_alloc);
+	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset);
 }
 
 struct page *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 7361971c177dd..19eb1b03ceedc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -466,8 +466,7 @@ struct scatterlist *
 __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 			 struct i915_gem_object_page_iter *iter,
 			 unsigned int n,
-			 unsigned int *offset,
-			 bool allow_alloc)
+			 unsigned int *offset)
 {
 	const bool dma = iter == &obj->mm.get_dma_page;
 	struct scatterlist *sg;
@@ -489,9 +488,6 @@ __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 	if (n < READ_ONCE(iter->sg_idx))
 		goto lookup;
 
-	if (!allow_alloc)
-		goto manual_lookup;
-
 	mutex_lock(&iter->lock);
 
 	/* We prefer to reuse the last sg so that repeated lookup of this
@@ -541,16 +537,7 @@ __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
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
@@ -597,7 +584,7 @@ i915_gem_object_get_page(struct drm_i915_gem_object *obj, unsigned int n)
 
 	GEM_BUG_ON(!i915_gem_object_has_struct_page(obj));
 
-	sg = i915_gem_object_get_sg(obj, n, &offset, true);
+	sg = i915_gem_object_get_sg(obj, n, &offset);
 	return nth_page(sg_page(sg), offset);
 }
 
@@ -623,7 +610,7 @@ i915_gem_object_get_dma_address_len(struct drm_i915_gem_object *obj,
 	struct scatterlist *sg;
 	unsigned int offset;
 
-	sg = i915_gem_object_get_sg_dma(obj, n, &offset, true);
+	sg = i915_gem_object_get_sg_dma(obj, n, &offset);
 
 	if (len)
 		*len = sg_dma_len(sg) - (offset << PAGE_SHIFT);
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 35069ca5d7deb..bd4bcef42d619 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -1481,7 +1481,7 @@ intel_partial_pages(const struct i915_ggtt_view *view,
 	if (ret)
 		goto err_sg_alloc;
 
-	iter = i915_gem_object_get_sg_dma(obj, view->partial.offset, &offset, true);
+	iter = i915_gem_object_get_sg_dma(obj, view->partial.offset, &offset);
 	GEM_BUG_ON(!iter);
 
 	sg = st->sgl;
-- 
2.31.1

