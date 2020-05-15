Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 764141D4A01
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EA56EC3D;
	Fri, 15 May 2020 09:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB4E6EC37
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:21 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d207so13467063wmd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tbvgcgkzORSo0eJN5X1CBpl4ptTJHT4taFqxeXu2zWg=;
 b=dlxaXdIZYgsKFuoob89jMzOspwGGWf0T5XGgk5Z+wv7QmAAifmDwqmVhdDxr4iI3Hp
 4zq4/etSiZgG9U4UWLe0WamGLFWhenSVYcu4riUoG40LAVPusgdoskZSTdM8FvPayRXk
 /1UtcByNH751r0NBWUFLqW4CHcDtb35LkcEoyO+5D9HQryIAHoWW/hiL+otzGNsR7u71
 HkzQKfv/mloyjefMPrMpw67V5+5vbbSWvQbALoSxvU0i7NXwsgt9iRFS6QegGJaejE60
 G/4I/qslWztff6w2P6q6RlSYjMAyC6x5NmlrmSpnq/UOAWgIy2mO8CmxqcLlPageqGtN
 8wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tbvgcgkzORSo0eJN5X1CBpl4ptTJHT4taFqxeXu2zWg=;
 b=Zlujp21IwsXZtCv7fWNG1YLUtRAZWtWRiZNkF36t5g331kf9gWIfTsJeEkz2LCTQuV
 P69Jse/PcedzBh2E19aruO2nxOxmYXVcy0eWqR5n1M/A5X7Qpn3Uf2BM7Zdx/Vuwsoww
 6OVnNhWLezltYo8HT3+FYI+/w+uOvZcappnsfd2Ku9LA3KIX0Ervb9jfuzzO16SWZv2M
 a9qiXMM8oO69e9+MODpmb0FtBjcqzWtyAOur78CqPFbd+9tJiO8o7IejA9JijepbLHzk
 5yrMKCWSCVxy0uhGrvxKzaYBQAtzy9WzdTUXiKfQqRu5zsTNS6IzHHmJbQ6wICLWjaZS
 MsMA==
X-Gm-Message-State: AOAM532ABPSzJmRc71MnHq/dOdO23cuo5H/sC/QUxitt2eczg54m6eTi
 98jK4VKZh+8H/+vFVvMU5MqMviRr
X-Google-Smtp-Source: ABdhPJyuJIhqxRIizGivbu09ouNf1vnXXPVLuGO724EUPW6Np14pd+iKmEzo5Cb8GVq0bnsLNXmJDA==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr3098019wmk.168.1589536460094; 
 Fri, 15 May 2020 02:54:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:19 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/38] drm/armada: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:50:56 +0100
Message-Id: <20200515095118.2743122-17-emil.l.velikov@gmail.com>
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
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
