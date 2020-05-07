Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D87C1C9402
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC31F6EA05;
	Thu,  7 May 2020 15:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881806EA05
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i15so6402391wrx.10
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SL/5h/DMnKIfKmE+t1FAI7PK2LsuOsoufYOkF4BN7q0=;
 b=CNjveCoG9oVrX44lujGaUjtGk0/JvRIWTrcTAo7lqdMVlDO6shlxLbwhbetuF2t5ss
 2ERF2RICf8piW2BmNCrGG0zT39XFXzoni07zNZOjEeZHgbZm6cZ99cNWh0yA2/igKCxi
 /4XVvTZnut4q0157yadr9np4OSMyqXh1Q3PaX1ogU/B2y3U8EOet5DspUi5gzrx6hUL/
 ltsOXvzC/m3UJbBwUhdmzf5DbGY9BxkpFmXdJgul8JdTpzNt27raROIjT1x0YpLuRjwX
 y/NiFIvBGm20n1sxVHBFEhF2sfwZ3GFstCXXaE4r+wYOVHS2Gfn6Q80vXBWuKkP4M0sW
 ZuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SL/5h/DMnKIfKmE+t1FAI7PK2LsuOsoufYOkF4BN7q0=;
 b=YBamTQy8E0ZOtiM0DW8kfBlSkNfNsAIGGWLDQGPDx5e2hqVPDgJPbQIExg1b5bVTXD
 +xKER5dnv4M4GFFYi5+Z+RaqxeLNHdqNpQaVGK/S92Lm78AffM2JYdj7fsER2Y6wA9+c
 e8zKdgP3DDU+mde9Bog0wMMs9L+vkFO3ywXzv68Gzo+Eve3IOGrolhomZjY8w6lNGrZ3
 YvC9YDUJWZ19UEVz6iG/qFWB3S6EDuRZ5/ntwIejNrE1UDcxn8HzGDyJYHl2m+6yqooT
 r79ZZZqkgD/8gKXZ9pIqzhTXGhxYeZ44uy0sCw6RUI2FoOPE8v/grS5v8mGtNOokbADZ
 lpNA==
X-Gm-Message-State: AGi0PuY5mtipYClsGqvmvKYNaSEK0bINQX4ql/mwMqIsho4hnmc5M580
 P3g2HgXwveB3H6q7X5jvIJqpleRf
X-Google-Smtp-Source: APiQypJWNO2E6qKca3C54UytyxZdxjXDBm79mj7mVZE5RFHoMWJCTKp0th+oECQ3fa8qqWx1x+wOMA==
X-Received: by 2002:a5d:414f:: with SMTP id c15mr15933009wrq.61.1588864275744; 
 Thu, 07 May 2020 08:11:15 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:15 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/36] drm/gma500: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:03 +0100
Message-Id: <20200507150822.114464-18-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/gma500/framebuffer.c | 2 +-
 drivers/gpu/drm/gma500/gem.c         | 2 +-
 drivers/gpu/drm/gma500/gma_display.c | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 23a78d755382..da02d7e8a8f5 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -491,7 +491,7 @@ static int psb_fbdev_destroy(struct drm_device *dev,
 	drm_framebuffer_cleanup(fb);
 
 	if (fb->obj[0])
-		drm_gem_object_put_unlocked(fb->obj[0]);
+		drm_gem_object_put(fb->obj[0]);
 	kfree(fb);
 
 	return 0;
diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 83ee86f70b89..f9c4b1d76f56 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -82,7 +82,7 @@ int psb_gem_create(struct drm_file *file, struct drm_device *dev, u64 size,
 		return ret;
 	}
 	/* We have the initial and handle reference but need only one now */
-	drm_gem_object_put_unlocked(&r->gem);
+	drm_gem_object_put(&r->gem);
 	*handlep = handle;
 	return 0;
 }
diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index 17f136985d21..3df6d6e850f5 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -351,7 +351,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 			gt = container_of(gma_crtc->cursor_obj,
 					  struct gtt_range, gem);
 			psb_gtt_unpin(gt);
-			drm_gem_object_put_unlocked(gma_crtc->cursor_obj);
+			drm_gem_object_put(gma_crtc->cursor_obj);
 			gma_crtc->cursor_obj = NULL;
 		}
 		return 0;
@@ -427,7 +427,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 	if (gma_crtc->cursor_obj) {
 		gt = container_of(gma_crtc->cursor_obj, struct gtt_range, gem);
 		psb_gtt_unpin(gt);
-		drm_gem_object_put_unlocked(gma_crtc->cursor_obj);
+		drm_gem_object_put(gma_crtc->cursor_obj);
 	}
 
 	gma_crtc->cursor_obj = obj;
@@ -435,7 +435,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 	return ret;
 
 unref_cursor:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 	return ret;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
