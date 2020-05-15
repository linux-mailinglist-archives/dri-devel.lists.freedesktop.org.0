Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA611D4A03
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B58C6EC43;
	Fri, 15 May 2020 09:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B9F6EC3E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i15so2753234wrx.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=58auif6URxwzpvANMDQsAuUmxd1R8EWV4uHUiihpz2k=;
 b=BEr8TyK6w1C3XnaaBo4uTyCxpwx2Y/O3wl7OkU5VaI5pfHU2qo6VQpotbq9dGRgkN8
 mYwCkmDx/dffKBxB1QG4CXTRxt5gNe5P1QMSTPh28SBS9ZZjA1pC43HFlZCayepaYgVB
 TwLj3+gv+UpRGY7mylPH+vjTOocPXVhkG3uz7XsFEMaqc5dLHMXTRlNihOfXqfn4LIBN
 k+K93kRZU+0A11wtpS94wl5toPQ9ujoE3nC8YyGzWFPSVfu36fS1SJxKAz2dGViJG0ut
 Z4ANQx/mM1zrb1LIvzKKLGbD6Jsy8J2tQ47uKqD8VMigeS5wjdY3SA+ILwHMIuVDRcpB
 EaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=58auif6URxwzpvANMDQsAuUmxd1R8EWV4uHUiihpz2k=;
 b=OXhJLhzrthIzWycBpXy2r67Y1208+s7Dul1MGZYqNdDoFSSUpAWzawI3vNF/96KL9B
 PWTpiDudsd/T0EeJbFUwi6sXOOz314R+V00y0ZPgjzv9yTIl21XxdzcIM8xULPPBCM8C
 LgA1oQw75hn6TsKImnNib9s2GLzor3IJUVNMS8G2E0xWcGNvbj8bSRzHG/MExN79xVUF
 K1GiK7uGLceD3dR08NscW9RwS6xmm0T3k7dSQzLAkR6ZQTJZlp3uoMj3k39RIYlaiV/x
 sUhTQYNMUlu67g7YCr4QBhoT25CoLWi0y8t8racY9pB+wDbMo/8jeabwwuVYQModJXDA
 gYJA==
X-Gm-Message-State: AOAM5331ii2zNNYlhJMXLGfLXDC1oxWXm8mgAd8HIhOR2sTyUIwOBfV9
 R/gNQIvf9TOE8zZtH5GmEu3rqdET
X-Google-Smtp-Source: ABdhPJxETSC9+4HLu3ZVDDmu7XJixMvTOvIeSjmMtYtO4ocODr3X1v3KMepytcr/07ydvVgoCgLJxA==
X-Received: by 2002:a5d:444c:: with SMTP id x12mr3283414wrr.406.1589536463221; 
 Fri, 15 May 2020 02:54:23 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:22 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 19/38] drm/gma500: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:50:59 +0100
Message-Id: <20200515095118.2743122-20-emil.l.velikov@gmail.com>
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
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
