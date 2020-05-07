Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C321C940D
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818686EA11;
	Thu,  7 May 2020 15:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9066EA0F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:27 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z8so6860056wrw.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gvsOrERe5VqtaG3Jw0obe3hC/Y/lcOojm1W25BBC1kY=;
 b=oEBriUAcg+Diuq4m42xUNTN38++WIkwZnSfUHjI2I9AysS2hhKjbPvSxWWEEVJlIXR
 evvNk4jJG0nQLToS2tbJQFY6RlBK8A8rssloWZsQ6X4/HivdPLh2Nmg29yAnR3kHWyDy
 OgVM98X0DTH72LgkRcPxqaYXK4MfmuLGoe8A0ksPvvuSTfMDh869o+7uJE7m966ONZer
 xLyntfxk5tIT7VoRJJg3z0KdUP2lbP2b//wNUFnRh/rmQB6H494fwU1OF0zcgcWMXKLp
 2HTIUVr95OXGfErGXeTS5qT5fz+MVzC3kW30Ov47iLvQup+i5rG7T3/aVRFCIV9XqHij
 cQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gvsOrERe5VqtaG3Jw0obe3hC/Y/lcOojm1W25BBC1kY=;
 b=AORqJurTBR0Uix50KDMKBzHyzlJnmmz/9WFX1Z/xA/CXNdd56aw1350xB/gdxM/cej
 SlHEwtZLc3Z5XXLTaRUdY1gi8wYJdo1qHPN1FKEvWxUySaI6Kbzwjg+DapAqyJVkl6Ts
 hqh4AgHS/SiYlrjkc5sw+AXJYEIres8wXkx3gg2PCUoMNMgci0dwBe3na71De/JQh/8k
 0LPqn4bHSycHnZVciZjK8QojrAoQJZiQeX+vyjVpZxR3uU8ilgudG6PGJJnwlaVpPgiw
 jwdDVo7DyegkMvYN/2lD4i381XzEza4dXaPUTOTCQO83mit94WkgYUVPf2UX74wAR1OD
 +mYA==
X-Gm-Message-State: AGi0PuaX1JUwSyEDQfxIk51RBtB9e5rFfDM+SdckFUuMQwKNiZkHtF1f
 hEaskRaqAgQxH9qx1vKpdWHNWIIz
X-Google-Smtp-Source: APiQypKccAf4AUZojs7O25xiJwxTcigf6QtLfSLg3vnRjf35mPZPV9yeFvGIowuuFShyvqW8e/S3Ew==
X-Received: by 2002:adf:afdb:: with SMTP id y27mr15036781wrd.323.1588864285556; 
 Thu, 07 May 2020 08:11:25 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:24 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 24/36] drm/omapdrm: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:10 +0100
Message-Id: <20200507150822.114464-25-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 emil.l.velikov@gmail.com
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

Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c   | 2 +-
 drivers/gpu/drm/omapdrm/omap_fb.c    | 2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c   | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index cdafd7ef1c32..242d28281784 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -503,7 +503,7 @@ static int ioctl_gem_info(struct drm_device *dev, void *data,
 	args->size = omap_gem_mmap_size(obj);
 	args->offset = omap_gem_mmap_offset(obj);
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 9aeab81dfb90..05f30e2618c9 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -326,7 +326,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
 
 error:
 	while (--i >= 0)
-		drm_gem_object_put_unlocked(bos[i]);
+		drm_gem_object_put(bos[i]);
 
 	return fb;
 }
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 09a84919ef73..3f6cfc24fb64 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -140,7 +140,7 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 		/* note: if fb creation failed, we can't rely on fb destroy
 		 * to unref the bo:
 		 */
-		drm_gem_object_put_unlocked(fbdev->bo);
+		drm_gem_object_put(fbdev->bo);
 		ret = PTR_ERR(fb);
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index d08ae95ecc0a..d0d12d5dd76c 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -629,7 +629,7 @@ int omap_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 
 	*offset = omap_gem_mmap_offset(obj);
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 fail:
 	return ret;
@@ -1348,7 +1348,7 @@ int omap_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	}
 
 	/* drop reference from allocate - handle holds it now */
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
