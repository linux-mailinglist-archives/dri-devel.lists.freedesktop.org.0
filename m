Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB253D17AD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 22:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB3C6EB44;
	Wed, 21 Jul 2021 20:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57D36E9C9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 20:13:51 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 j8-20020a17090aeb08b0290173bac8b9c9so585415pjz.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AXY3KUSW9Nh3jlxZEN6OgRLzanV/GR5AneGVxHmy0Rg=;
 b=IV9bT+aKuDgO9XpGOUgVG6zmOp1QIjPFHph/0arltomEvXMUpBwZukna+PfomAEDsS
 tZ1SCmAS6ALLJpSDdEY2MOOlhCCwJrMUvVyXee6ALM7BWiPMpyy1UnIQdrWQ0NNmuGDQ
 PXJiYH6K4J5S0W2katyBqRP2Yp8P/UMK6KQS4I/VXNhE3PFRnb118Fn1xNucdrPNwRE1
 0tnOvFDQKWfkx2mD5HmQGGuQVw9YoGe575kKXrKapZOnYxqKtQORtQAiKLnAkMP5fkhp
 ellXu6CkjVvrqB/SqvzpAaJ7uIAzyqT4W4GKaKfH6JpdEU6GMlmW0Dh5bqe+1NJlmGKV
 Aalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AXY3KUSW9Nh3jlxZEN6OgRLzanV/GR5AneGVxHmy0Rg=;
 b=nhxIiCr4Q81pAFHG58vA5SkyZOnsaoyJCIwJzBxeJynO+W2nV6SiP7vV47a0NOjfP/
 XsePqhGRH6j1RHisTaF/rOVuKAQw1oa+F8+ZL9rXzRR5Zd9hJcL/U2Mv8cpg0TmgYnUo
 T10ST/wMkn5BF9t6dAqW1QRSLPuWLfIl7vbXgsXvwOtlyk/G50A9+7IYxNGYHwlzwHHw
 bOPm4D/f4gyKqMv7jN1tbxcPDVwkcLxut21Gx2+o5uQbrZx8UffP7XgjexUQdxpTw/bx
 gti7pP1vIv2Qlig5jZl7qcPXeVsyKGJpRt8KQWv+f7XhL0msnfK0in4QXnV8Wh+yF/bn
 RgXA==
X-Gm-Message-State: AOAM532Fu61UgzjllgQ7QfkNsxo6tdTwSrYX5CWm2HP0w/JdYLtPy6sV
 Wey5HIAK6jVxYJ5vWRmGs8WcrQ==
X-Google-Smtp-Source: ABdhPJyZkOf1OwwQ3cJ8PquNbDgeb6ro/Hnr2LijQpHRGr9p5WXYYdfNjNsAKbljmN/i9p0ZLoLKqQ==
X-Received: by 2002:a65:6118:: with SMTP id z24mr37494419pgu.325.1626898431230; 
 Wed, 21 Jul 2021 13:13:51 -0700 (PDT)
Received: from omlet.com ([134.134.137.82])
 by smtp.gmail.com with ESMTPSA id h24sm28777439pfn.180.2021.07.21.13.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:13:50 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/i915/gem: Check object_can_migrate from object_migrate
Date: Wed, 21 Jul 2021 15:13:37 -0500
Message-Id: <20210721201343.2962674-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721201343.2962674-1-jason@jlekstrand.net>
References: <20210721201343.2962674-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't roll them together entirely because there are still a couple
cases where we want a separate can_migrate check.  For instance, the
display code checks that you can migrate a buffer to LMEM before it
accepts it in fb_create.  The dma-buf import code also uses it to do an
early check and return a different error code if someone tries to attach
a LMEM-only dma-buf to another driver.

However, no one actually wants to call object_migrate when can_migrate
has failed.  The stated intention is for self-tests but none of those
actually take advantage of this unsafe migration.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel@ffwll.ch>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c        | 13 ++-----------
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c | 15 ---------------
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 9da7b288b7ede..f2244ae09a613 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -584,12 +584,6 @@ bool i915_gem_object_can_migrate(struct drm_i915_gem_object *obj,
  * completed yet, and to accomplish that, i915_gem_object_wait_migration()
  * must be called.
  *
- * This function is a bit more permissive than i915_gem_object_can_migrate()
- * to allow for migrating objects where the caller knows exactly what is
- * happening. For example within selftests. More specifically this
- * function allows migrating I915_BO_ALLOC_USER objects to regions
- * that are not in the list of allowable regions.
- *
  * Note: the @ww parameter is not used yet, but included to make sure
  * callers put some effort into obtaining a valid ww ctx if one is
  * available.
@@ -616,11 +610,8 @@ int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
 	if (obj->mm.region == mr)
 		return 0;
 
-	if (!i915_gem_object_evictable(obj))
-		return -EBUSY;
-
-	if (!obj->ops->migrate)
-		return -EOPNOTSUPP;
+	if (!i915_gem_object_can_migrate(obj, id))
+		return -EINVAL;
 
 	return obj->ops->migrate(obj, mr);
 }
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
index 0b7144d2991ca..28a700f08b49a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -61,11 +61,6 @@ static int igt_create_migrate(struct intel_gt *gt, enum intel_region_id src,
 		if (err)
 			continue;
 
-		if (!i915_gem_object_can_migrate(obj, dst)) {
-			err = -EINVAL;
-			continue;
-		}
-
 		err = i915_gem_object_migrate(obj, &ww, dst);
 		if (err)
 			continue;
@@ -114,11 +109,6 @@ static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
 		return err;
 
 	if (i915_gem_object_is_lmem(obj)) {
-		if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM)) {
-			pr_err("object can't migrate to smem.\n");
-			return -EINVAL;
-		}
-
 		err = i915_gem_object_migrate(obj, ww, INTEL_REGION_SMEM);
 		if (err) {
 			pr_err("Object failed migration to smem\n");
@@ -137,11 +127,6 @@ static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
 		}
 
 	} else {
-		if (!i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM)) {
-			pr_err("object can't migrate to lmem.\n");
-			return -EINVAL;
-		}
-
 		err = i915_gem_object_migrate(obj, ww, INTEL_REGION_LMEM);
 		if (err) {
 			pr_err("Object failed migration to lmem\n");
-- 
2.31.1

