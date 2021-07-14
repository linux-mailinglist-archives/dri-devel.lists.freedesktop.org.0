Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BC23C925E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 22:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89116E4FB;
	Wed, 14 Jul 2021 20:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB466E435
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 20:45:01 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id k20so3746013pgg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 13:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WxD8jkFdaGouGoVE3cXeriFduXctheMhbmK/8q8own8=;
 b=D6M1QID99Qoufyt8NYKwo3GHV33RP0r4f/uBuvbc8oZ6196wMdLBIk9NMDLw0dko4v
 P7aPKb1wQDSMA2QjdA92AvhjEmVPBaVRjl573gBrDMKe7//jXLkVJkkFyld6munmGX3t
 f6ClbnF6CM8PA8XSEUXnrU6y1hqAdjJrrGLUXtO2tu5HIqdjrIsVDBpHGEYB8pbjiLzL
 ci+Cejq/8bgaiDSERC0G6bIZfkItJkAzB6E1lp4gdqgk2W+bY9sM7zr5k8WE/OKkEEzx
 jwBl5D9XNUAdKhmWQ1YHZecM7ArZYkCSxEZM0bF3DIsK6Rpvzqkbo61/xa5CYyOrGTnh
 X3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WxD8jkFdaGouGoVE3cXeriFduXctheMhbmK/8q8own8=;
 b=CssYxdkEQbEOZ4n9YIHTORd7ZxCPbgniyK6io34GC98RdtweQ4G7pYNBlEIETBD+h3
 eSOo2oKqwh1i8qQbljpYZWdoKUMIpwY5Bd+29ROLMg5MLGYeObg/LOvGlSeVstN+HyDR
 hgF9Nq9neW+mlWCs43d5HZphOdpnzG/ioOqCNMyKpKP0kTrmfggn8u4xhI5+iMxK+qUE
 JjbHtjlRWivQhhiOZIh2gtdKrnU1Aay7lK6qZuvM2Y+A5BCcckSc7EJaOaerMbhfrk9P
 b96np2hsBX63D9UrQrsMAXopVt2iyo5wpSTxPM/1LVjdn8y59ttrRLeSEW8+bs9jlhiW
 OSkg==
X-Gm-Message-State: AOAM5333QLvuO0XtfQAmkKenEmhor/6xwNvnp4GKEYfg8LvL5zIem+m3
 8RPgjX7SnzWbiDFLNcLQHt5EgQ==
X-Google-Smtp-Source: ABdhPJxWBMUGIfnc2YtpIyM/Dh22HO6SxHDlgRW5o5eZ/tGMo/Nl+lK7r0jcUqhGB0XOWZdhq4SduA==
X-Received: by 2002:a63:786:: with SMTP id 128mr9471331pgh.48.1626295500972;
 Wed, 14 Jul 2021 13:45:00 -0700 (PDT)
Received: from omlet.com ([134.134.139.71])
 by smtp.gmail.com with ESMTPSA id p24sm4101375pgl.68.2021.07.14.13.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 13:45:00 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Check object_can_migrate from object_migrate
Date: Wed, 14 Jul 2021 15:44:52 -0500
Message-Id: <20210714204452.1481805-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
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
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c        |  8 +++-----
 drivers/gpu/drm/i915/gem/i915_gem_object.c        | 13 ++-----------
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c | 15 ---------------
 3 files changed, 5 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 3163f00554476..5d438b95826b9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -173,16 +173,14 @@ static int i915_gem_dmabuf_attach(struct dma_buf *dmabuf,
 	struct i915_gem_ww_ctx ww;
 	int err;
 
+	if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM))
+		return -EOPNOTSUPP;
+
 	for_i915_gem_ww(&ww, err, true) {
 		err = i915_gem_object_lock(obj, &ww);
 		if (err)
 			continue;
 
-		if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM)) {
-			err = -EOPNOTSUPP;
-			continue;
-		}
-
 		err = i915_gem_object_migrate(obj, &ww, INTEL_REGION_SMEM);
 		if (err)
 			continue;
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

