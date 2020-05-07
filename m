Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D56201C93F7
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C2A6E9FE;
	Thu,  7 May 2020 15:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F49B6E9FE
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h9so6852802wrt.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ccn56cue/5SDl/5guAU3XdgN83fuYj8gkCqnbm2VHE=;
 b=quemt/TldHSZTBxORTJrKYgPKaWXSNPOgRMXIeA5k/mr3UQQM8sULZYNhk7bi5xpRM
 PQVPKPWyl27GYhCVqfJ1o39d+XAr1VaJv/k50xbYxQzWs2q2iSze6iJu0WVO2QGjKA4J
 FiDu88nL9QZDhIeZSK92Bt2WDwklp5JqSd1fK2r0F+dyXivxlnqev8XfT9H6cV9j810u
 FdjfhM0SOCSxU7IUUJVbSaWaRwX6tzt+1YHptRYVtkSlCCvgut9uhYFPKciXhLlGD5gz
 1aYJUgqldOLgJqB2gZyuzj7DQlFKDRogplLqzVJs+Wxujc7xEUaVWo1rcTHxSE1hYDD2
 gSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ccn56cue/5SDl/5guAU3XdgN83fuYj8gkCqnbm2VHE=;
 b=PrDQomEkuii3EeKD0Ipksz0UJPENjn2PTT0MVrIVdqVN9SvqenUloAv6YaDn9U3iHe
 FG5eTbxcFG+e4t+VsRgFLJHEKD4fhYpaKrlFMUtg9KStyI5lftK1KvuGmvMKEJYd56cK
 x7P67zDW4U8GDZ6GZ+T59FBPAZGSDYKfvpODtKqh+1NQoCkvTCMRL1RL5wPveLWEh4yV
 SpG53a1iuqLGK/A4Wsv5Fk7mciOMcRp/UQsL1YKgKsir8+w5Ru7pQB/qDowNxkK9yexM
 ZANcvadBXEohldZDZl7fuX4fo4iGQrHmYzlz4bOPufa/PJgfgzDZOynz//WS1aEIntwv
 b+hg==
X-Gm-Message-State: AGi0PubliryJ8CJybNeA7iXkeIMx30mVxf0KTc5xBGhhGbMHqIPvwtae
 ZGzAvsRV+Z1kSkZwAzrdwRaYEnAv
X-Google-Smtp-Source: APiQypLftgbO1SiVevVixgIzWQwMI/lviNX9kljAa1jXCfLVSJMUBA+/udtsnHN2qpaYpKeuljaT0g==
X-Received: by 2002:a05:6000:12cf:: with SMTP id
 l15mr15584074wrx.348.1588864263811; 
 Thu, 07 May 2020 08:11:03 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:02 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/36] drm/gem: fold drm_gem_object_put_unlocked and
 __drm_gem_object_put()
Date: Thu,  7 May 2020 16:07:55 +0100
Message-Id: <20200507150822.114464-10-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
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

With earlier patch we removed the normal overhead so now we can lift
the helper to the header, folding it __drm_object_put.

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/drm_gem.c                  | 19 -------------------
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 +-
 include/drm/drm_gem.h                      | 17 ++++-------------
 3 files changed, 5 insertions(+), 33 deletions(-)

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
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index ec2d24a60a76..7c877bea7b3a 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -364,27 +364,18 @@ static inline void drm_gem_object_get(struct drm_gem_object *obj)
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
+ * This releases a reference to @obj. Callers must not hold the
+ * &drm_device.struct_mutex lock when calling this function.
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
