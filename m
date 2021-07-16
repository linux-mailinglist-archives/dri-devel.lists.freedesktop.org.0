Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6970D3CB88D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA016E9A1;
	Fri, 16 Jul 2021 14:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7A96E9A0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:14:30 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 42-20020a9d012d0000b02904b98d90c82cso9980091otu.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AXY3KUSW9Nh3jlxZEN6OgRLzanV/GR5AneGVxHmy0Rg=;
 b=r+cVLEH/aj16esSSY8320ynVhgJFUXrrHAiGHoTI7jzmpgQ6366ANVYFnEZZqSJyCn
 Loh56/aBEYCJGGk/11Pqn17iAGrvCmtXrlvRP1vkRkpNybiQO0oFu5z7T6zClPTjGzJd
 Gl0rBOKCgpTpHHarRO306zBNaTZ7OsVrJ5SJ4YUFkYaHnLlDPiAb70P7mCXEZe6olw3C
 bHDHYC8jCu+r3DGp9hHKCY20yu3JpnIiTsMBcAH3FVAMLK35tQw8yHyYLY/NqKNj5LkX
 vXbeTwuT/gtDNhGvj9i8dURoU0AV6htrOzj+n415TBDBK9SK5bY4e+NsyfAsgu4YLY6M
 cPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AXY3KUSW9Nh3jlxZEN6OgRLzanV/GR5AneGVxHmy0Rg=;
 b=ew5ZjaSfnb26YctwPU9Eke9sjV3CzLkbIJeNV8N35CvAwJpsNVIZPa48AhtYfthEPH
 g6Nv6yLLmeJxtyMxVQHapWp3uuIjXa4i30gqo4s6B4+Dh99RiWh696rq7DS4gcAGyYPc
 h34dd+MoPgsMaadRT52wKwGK7q+xZeeBzFh6bTeHkBPH/8Yw8p+GErGUsPHgyCQVfv9N
 rNzBs7ws5tAMe5wzf75ouIEMJMvFq3Rb6/adYuocxMYQJm8P1tppb8tkHfvb/m7aVtNR
 Ngfes9/7QWBLLEN59+IbU8VIFE0mnd+Z0CAV5Lm6XdGegNNaQU6R2Fnbl/xW7p11UVnL
 MPjw==
X-Gm-Message-State: AOAM531mgQjsvYyiyvmMuaAov0tLKx3Vd+w0NA1huZoGxjK/1kn4w50M
 uwJ0ExIcn2grXj3J+C2kxtIjsw==
X-Google-Smtp-Source: ABdhPJzfl5DsR3wnWI5+Hqhq/6S+13EOtcvMSyPR6GbyBGa9l8KsGp8QNZYc73BfPvnlxRADBXZYWw==
X-Received: by 2002:a05:6830:2413:: with SMTP id
 j19mr8431560ots.332.1626444869694; 
 Fri, 16 Jul 2021 07:14:29 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id v42sm1852266ott.70.2021.07.16.07.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 07:14:29 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/i915/gem: Check object_can_migrate from object_migrate
Date: Fri, 16 Jul 2021 09:14:20 -0500
Message-Id: <20210716141426.1904528-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210716141426.1904528-1-jason@jlekstrand.net>
References: <20210716141426.1904528-1-jason@jlekstrand.net>
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

