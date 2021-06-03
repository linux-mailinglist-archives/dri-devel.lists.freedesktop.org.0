Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7774539A4DB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 17:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BF56F4B8;
	Thu,  3 Jun 2021 15:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3C16F4B7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 15:40:40 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so5697089pjp.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 08:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ISJVvStMAR7Z60QZoYOnA+cgPbsN3FkGO0+5Gj/UFns=;
 b=La1zBKRpRqXwWJ2ibhGrpAyOTr+gPfu0AGUF0zix3njs/44yrzT0KhZv2ItHY6vlQB
 br0Yw77SA1tqEH9UYSr5yDvkk1WPkq8h+BvGD5dJ7kDq3B6Y3FwIuXcL938moJrsTntO
 khmShN+1frpmwgNaD1EL+kIpL3ZOF1UQ7MyK9YX2Nh6Elzu4Avrx+jSQfHbBrizPiYWu
 TkexhLHf9VuXPAFiA7qH7Y2HZCvoczXLdR67SnJgBcdbWnnSS4KzTfcp1CTzBxJog3xn
 b8I3sg1scI+AEFYGt1sAk8LGl0+3BTCxJdXu0gLYBWDE0mxW8yfUQw3QSnXSM7f0OOTx
 rHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ISJVvStMAR7Z60QZoYOnA+cgPbsN3FkGO0+5Gj/UFns=;
 b=YVhVTUo+h1pptjnPld9J9y9WC+3Y3ZSZ+Fxu/yAxuedcR0AEtVE+qfnnp0Y65JWo3e
 zU6b4dJyw4X7RD68E1i22GVJ3/RC9s6wEvzLpbL8kWHs03Hi+II+mFQCKlNNmeSwbG7m
 VGYk3n0DKGXEVvtaJmdBOgT29ht2b72ELGX7HUhKP/7aItNZXOHHR289bMu8wSAmhAiy
 BmaXFnmzhENtg88Dc2YooUy+wodmf79GEE1i65bHYG79RZ//0N4Mo0fx0LXWixOKUhBt
 qLsPZq2sF2WkpdsksfvlalfNdFSF9efOnBY/Q9QXV1K3SM84u4tAPOsThFXaJ6C9FREp
 v1Dw==
X-Gm-Message-State: AOAM530b8rfPc0D1Jp7tDuO7CCrlgWpXf8PIVQ37GZ+6q7t7ep7aa3as
 PagbPa4EiWV1HEN+5mpcfVcYcw==
X-Google-Smtp-Source: ABdhPJyfBAVxYAYGiZ9QgnjgfEpd9spDvcZl51O0uXY06e49Npl6ddcjP6f4BBhw/VXJSdr7VplptQ==
X-Received: by 2002:a17:90a:af8b:: with SMTP id
 w11mr576389pjq.228.1622734839686; 
 Thu, 03 Jun 2021 08:40:39 -0700 (PDT)
Received: from omlet.lan ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id mp21sm2681789pjb.50.2021.06.03.08.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:40:39 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915: Remove allow_alloc from i915_gem_object_get_sg*
Date: Thu,  3 Jun 2021 10:40:25 -0500
Message-Id: <20210603154027.594906-4-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603154027.594906-1-jason@jlekstrand.net>
References: <20210603154027.594906-1-jason@jlekstrand.net>
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
index 6444e097016da..f234bd5bf22fc 100644
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
@@ -490,9 +489,6 @@ __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 	if (n < READ_ONCE(iter->sg_idx))
 		goto lookup;
 
-	if (!allow_alloc)
-		goto manual_lookup;
-
 	mutex_lock(&iter->lock);
 
 	/* We prefer to reuse the last sg so that repeated lookup of this
@@ -542,16 +538,7 @@ __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
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
@@ -598,7 +585,7 @@ i915_gem_object_get_page(struct drm_i915_gem_object *obj, unsigned int n)
 
 	GEM_BUG_ON(!i915_gem_object_has_struct_page(obj));
 
-	sg = i915_gem_object_get_sg(obj, n, &offset, true);
+	sg = i915_gem_object_get_sg(obj, n, &offset);
 	return nth_page(sg_page(sg), offset);
 }
 
@@ -624,7 +611,7 @@ i915_gem_object_get_dma_address_len(struct drm_i915_gem_object *obj,
 	struct scatterlist *sg;
 	unsigned int offset;
 
-	sg = i915_gem_object_get_sg_dma(obj, n, &offset, true);
+	sg = i915_gem_object_get_sg_dma(obj, n, &offset);
 
 	if (len)
 		*len = sg_dma_len(sg) - (offset << PAGE_SHIFT);
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 10c23a749a950..46c98887f17e3 100644
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

