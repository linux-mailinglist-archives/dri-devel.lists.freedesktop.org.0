Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D213D1D4A07
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F916EC44;
	Fri, 15 May 2020 09:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F906EC3C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:14 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h4so1665510wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64gLYirqv0dQ+6oXmKSs0A/wPzHi1OC+l9qUxVLvJNM=;
 b=KsrryXrm8AmMnHijI7MZT3+FevQXhSFlIUeGqmAAIma9dNQ6s3+wLeTojlvEc5+g93
 UB9k17LaQSc0/3TJVh4NU9nJ3DDhwJKlICZTe04boNrEoZJkwbD8mJYikJFbeajreGBd
 OEgu2JLW+q3SCqcrXjdIKUxi+6Xy4IgWksnk+JLRlnSAU/aSQBnG/ynv8HPumCeMK+eg
 kqFYqSKUUCY6jOpkHO/SO8hznsYbGRV+RYl0sdmPR721wJgQZhHOOFiBDILVa/pa346M
 6RDqKpDBa/bVhkpJovuYndJRwKAGo8zWuegz/2f59C8G8usASA9oVnbg5TO4p4Qj66Ac
 +7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64gLYirqv0dQ+6oXmKSs0A/wPzHi1OC+l9qUxVLvJNM=;
 b=hNqoOpsV0F/HwA/h9szz956261VhIgxeZk4M5IPDbtaI3GxlPxBPOR5lcLLeZehcnH
 99ALSQuJ6dt7DyFLl5b6DMVH0jElraz+1c/vo7g0bY6CBwrvfvk4UHYyEogYrTTi31fL
 vYTFzbiBPOj/riyxsiPd+bbnopUmmCMOUp95H9Ya2pOUL7Ip6diQ7E+2/p49XeIy4PGQ
 kN5ycVLuVseDs5Nv6V7wS3uo7KTQtAqyVJbfkx/Z+MIlyB7WnU51ScrxWZpy9ilMlawg
 Ea1y5xdUMWF9QDSJ7K7hx1hgiC42EbPxIPwBLadb+1yNhv7jxtg/SeCEzIM0yWTfyewJ
 YlHA==
X-Gm-Message-State: AOAM5330P45xpw8kANo9uHOeEAcF+qxMsYLOc4GgBc+HVQMMRaDgKhDE
 kJNs5bC8NNp1CHu5K88owMVz7uum
X-Google-Smtp-Source: ABdhPJxP7abb4ZvANeEw/bPXg/CS2FYYD7xbfzXezytHqY7rOgAWPVAgiSi4cgnEBQn9CcGW7bhfug==
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr2966451wmj.146.1589536452626; 
 Fri, 15 May 2020 02:54:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:12 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/38] drm/gem: fold drm_gem_object_put_unlocked and
 __drm_gem_object_put()
Date: Fri, 15 May 2020 10:50:50 +0100
Message-Id: <20200515095118.2743122-11-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

With earlier patch we removed the overhead so now we can lift the helper
into the header effectively folding it with __drm_object_put.

v2: drop struct_mutex references (Daniel)

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org> (v1)
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_gem.c                  | 19 -------------------
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 +-
 include/drm/drm_drv.h                      |  2 --
 include/drm/drm_gem.h                      | 16 +++-------------
 4 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index dab8763b2e73..599d5ff53b73 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -982,25 +982,6 @@ drm_gem_object_free(struct kref *kref)
 }
 EXPORT_SYMBOL(drm_gem_object_free);
 
-/**
- * drm_gem_object_put_unlocked - drop a GEM buffer object reference
- * @obj: GEM buffer object
- *
- * This releases a reference to @obj. Callers must not hold the
- * &drm_device.struct_mutex lock when calling this function.
- *
- * See also __drm_gem_object_put().
- */
-void
-drm_gem_object_put_unlocked(struct drm_gem_object *obj)
-{
-	if (!obj)
-		return;
-
-	kref_put(&obj->refcount, drm_gem_object_free);
-}
-EXPORT_SYMBOL(drm_gem_object_put_unlocked);
-
 /**
  * drm_gem_object_put - release a GEM buffer object reference
  * @obj: GEM buffer object
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 2faa481cc18f..41351cbf31b5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -105,7 +105,7 @@ __attribute__((nonnull))
 static inline void
 i915_gem_object_put(struct drm_i915_gem_object *obj)
 {
-	__drm_gem_object_put(&obj->base);
+	drm_gem_object_put_unlocked(&obj->base);
 }
 
 #define assert_object_held(obj) dma_resv_assert_held((obj)->base.resv)
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index e6eff508f687..bb924cddc09c 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -332,8 +332,6 @@ struct drm_driver {
 	 *
 	 * This is deprecated and should not be used by new drivers. Use
 	 * &drm_gem_object_funcs.free instead.
-	 * Compared to @gem_free_object this is not encumbered with
-	 * &drm_device.struct_mutex legacy locking schemes.
 	 */
 	void (*gem_free_object_unlocked) (struct drm_gem_object *obj);
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index ec2d24a60a76..c3bdade093ae 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -364,27 +364,17 @@ static inline void drm_gem_object_get(struct drm_gem_object *obj)
 }
 
 /**
- * __drm_gem_object_put - raw function to release a GEM buffer object reference
+ * drm_gem_object_put_unlocked - drop a GEM buffer object reference
  * @obj: GEM buffer object
  *
- * This function is meant to be used by drivers which are not encumbered with
- * &drm_device.struct_mutex legacy locking and which are using the
- * gem_free_object_unlocked callback. It avoids all the locking checks and
- * locking overhead of drm_gem_object_put() and drm_gem_object_put_unlocked().
- *
- * Drivers should never call this directly in their code. Instead they should
- * wrap it up into a ``driver_gem_object_put(struct driver_gem_object *obj)``
- * wrapper function, and use that. Shared code should never call this, to
- * avoid breaking drivers by accident which still depend upon
- * &drm_device.struct_mutex locking.
+ * This releases a reference to @obj.
  */
 static inline void
-__drm_gem_object_put(struct drm_gem_object *obj)
+drm_gem_object_put_unlocked(struct drm_gem_object *obj)
 {
 	kref_put(&obj->refcount, drm_gem_object_free);
 }
 
-void drm_gem_object_put_unlocked(struct drm_gem_object *obj);
 void drm_gem_object_put(struct drm_gem_object *obj);
 
 int drm_gem_handle_create(struct drm_file *file_priv,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
