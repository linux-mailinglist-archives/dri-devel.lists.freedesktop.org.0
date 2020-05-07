Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22921C9400
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A936EA06;
	Thu,  7 May 2020 15:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2E16EA02
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:13 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j5so6837762wrq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rqs+YV72LLclcG14N4KwWkvlGdbHAqfHUUNjWdb/QIc=;
 b=ETlIFrPZCnE01FWmdEkohJ0YjP5yLvvKrPsJERSzql96w28IYT27x52H/ddu2WukZL
 tyyb92Sd8JBfDedN7lHu756y0JiE+VY+4BFL+Ez4Y6PBpjZR0LvXsl/SbpOTKTfjsntv
 NbDjlle3jVlEDSCLEso13RoyBkO46c7eG2uEsxsjT1fEGdeZ5nAqipWsgv0d0SHWQihJ
 IFkl/pQUX/g5MdLnjmwuD4WL+y6LkU6RYaUAJWbvoCmcIjClkQoFJ7mb7Oni7chvmlW8
 OzDjQjORShBoOIHVYcpyynMZ00gPKtdb8M1uIHJyOtS2nH02E1wKqbDUDgbnwtyw0Gqc
 ldgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rqs+YV72LLclcG14N4KwWkvlGdbHAqfHUUNjWdb/QIc=;
 b=RwAYXepFt9CnKamXGCSz2Aot6YN8Ve2CRfmNM9vaU/aDqLQJAaEed+ZAFI646z1wt4
 V4aGTr7BsgWksW3G7jwxVoVkjwSnDNUBjHPBJV6YWbN0T36UvZzb0zn5FGNKafB59u9O
 MzxkB77GFGavGUZ4qQYStg8TVnq45ho1i/jF5fAxwk+ct9Ezd8aPDI1Gsmdktr4GNi80
 BbLWVsx2DHBUuRiE13+STvP2YCiZoASFbpTPKWsU0n6ZH9EsrU06YqCklo2G14f0QJcG
 LKphh8CGqPbH3bJyYzR+qMHfrczKvcWKKTMPV/hVDoLT+XQ0qrmLoC24Fc2DJ4IjZ3Pt
 S9+w==
X-Gm-Message-State: AGi0PuY3/C8yvBv8WT+riZ+e69gBqTFluh2ZtxrLDbcrk1mV0nFayq9K
 p8IShy9AdjvuF5LA5ylXglHDVbxl
X-Google-Smtp-Source: APiQypIj8779oOC9fXdq+kj/pkfXIgetFUCSUjyyJ4k0BAhu9B8ZHZ/2afq/RNaywwhbmV5bREtNog==
X-Received: by 2002:adf:f282:: with SMTP id k2mr15200474wro.133.1588864271569; 
 Thu, 07 May 2020 08:11:11 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:10 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/36] drm/armada: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:00 +0100
Message-Id: <20200507150822.114464-15-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
 Russell King <linux@armlinux.org.uk>
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

Cc: Russell King <linux@armlinux.org.uk>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/armada/armada_crtc.c  |  8 ++++----
 drivers/gpu/drm/armada/armada_fb.c    |  4 ++--
 drivers/gpu/drm/armada/armada_fbdev.c |  6 +++---
 drivers/gpu/drm/armada/armada_gem.c   | 10 +++++-----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index c2b92acd1e9a..38dfaa46d306 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -710,13 +710,13 @@ static int armada_drm_crtc_cursor_set(struct drm_crtc *crtc,
 
 		/* Must be a kernel-mapped object */
 		if (!obj->addr) {
-			drm_gem_object_put_unlocked(&obj->obj);
+			drm_gem_object_put(&obj->obj);
 			return -EINVAL;
 		}
 
 		if (obj->obj.size < w * h * 4) {
 			DRM_ERROR("buffer is too small\n");
-			drm_gem_object_put_unlocked(&obj->obj);
+			drm_gem_object_put(&obj->obj);
 			return -ENOMEM;
 		}
 	}
@@ -724,7 +724,7 @@ static int armada_drm_crtc_cursor_set(struct drm_crtc *crtc,
 	if (dcrtc->cursor_obj) {
 		dcrtc->cursor_obj->update = NULL;
 		dcrtc->cursor_obj->update_data = NULL;
-		drm_gem_object_put_unlocked(&dcrtc->cursor_obj->obj);
+		drm_gem_object_put(&dcrtc->cursor_obj->obj);
 	}
 	dcrtc->cursor_obj = obj;
 	dcrtc->cursor_w = w;
@@ -760,7 +760,7 @@ static void armada_drm_crtc_destroy(struct drm_crtc *crtc)
 	struct armada_private *priv = crtc->dev->dev_private;
 
 	if (dcrtc->cursor_obj)
-		drm_gem_object_put_unlocked(&dcrtc->cursor_obj->obj);
+		drm_gem_object_put(&dcrtc->cursor_obj->obj);
 
 	priv->dcrtc[dcrtc->num] = NULL;
 	drm_crtc_cleanup(&dcrtc->crtc);
diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
index 426ca383d696..b87c71703c85 100644
--- a/drivers/gpu/drm/armada/armada_fb.c
+++ b/drivers/gpu/drm/armada/armada_fb.c
@@ -129,12 +129,12 @@ struct drm_framebuffer *armada_fb_create(struct drm_device *dev,
 		goto err;
 	}
 
-	drm_gem_object_put_unlocked(&obj->obj);
+	drm_gem_object_put(&obj->obj);
 
 	return &dfb->fb;
 
  err_unref:
-	drm_gem_object_put_unlocked(&obj->obj);
+	drm_gem_object_put(&obj->obj);
  err:
 	DRM_ERROR("failed to initialize framebuffer: %d\n", ret);
 	return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index f2dc371bd8e5..0c4601275507 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -51,13 +51,13 @@ static int armada_fbdev_create(struct drm_fb_helper *fbh,
 
 	ret = armada_gem_linear_back(dev, obj);
 	if (ret) {
-		drm_gem_object_put_unlocked(&obj->obj);
+		drm_gem_object_put(&obj->obj);
 		return ret;
 	}
 
 	ptr = armada_gem_map_object(dev, obj);
 	if (!ptr) {
-		drm_gem_object_put_unlocked(&obj->obj);
+		drm_gem_object_put(&obj->obj);
 		return -ENOMEM;
 	}
 
@@ -67,7 +67,7 @@ static int armada_fbdev_create(struct drm_fb_helper *fbh,
 	 * A reference is now held by the framebuffer object if
 	 * successful, otherwise this drops the ref for the error path.
 	 */
-	drm_gem_object_put_unlocked(&obj->obj);
+	drm_gem_object_put(&obj->obj);
 
 	if (IS_ERR(dfb))
 		return PTR_ERR(dfb);
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 976685f2939e..8005614d2e6b 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -256,7 +256,7 @@ int armada_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 	/* drop reference from allocate - handle holds it now */
 	DRM_DEBUG_DRIVER("obj %p size %zu handle %#x\n", dobj, size, handle);
  err:
-	drm_gem_object_put_unlocked(&dobj->obj);
+	drm_gem_object_put(&dobj->obj);
 	return ret;
 }
 
@@ -288,7 +288,7 @@ int armada_gem_create_ioctl(struct drm_device *dev, void *data,
 	/* drop reference from allocate - handle holds it now */
 	DRM_DEBUG_DRIVER("obj %p size %zu handle %#x\n", dobj, size, handle);
  err:
-	drm_gem_object_put_unlocked(&dobj->obj);
+	drm_gem_object_put(&dobj->obj);
 	return ret;
 }
 
@@ -305,13 +305,13 @@ int armada_gem_mmap_ioctl(struct drm_device *dev, void *data,
 		return -ENOENT;
 
 	if (!dobj->obj.filp) {
-		drm_gem_object_put_unlocked(&dobj->obj);
+		drm_gem_object_put(&dobj->obj);
 		return -EINVAL;
 	}
 
 	addr = vm_mmap(dobj->obj.filp, 0, args->size, PROT_READ | PROT_WRITE,
 		       MAP_SHARED, args->offset);
-	drm_gem_object_put_unlocked(&dobj->obj);
+	drm_gem_object_put(&dobj->obj);
 	if (IS_ERR_VALUE(addr))
 		return addr;
 
@@ -366,7 +366,7 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 	}
 
  unref:
-	drm_gem_object_put_unlocked(&dobj->obj);
+	drm_gem_object_put(&dobj->obj);
 	return ret;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
