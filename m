Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FD51D4A1C
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3C26EC5D;
	Fri, 15 May 2020 09:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5B76EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:33 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id n5so1978385wmd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zo3GRMIgUgW0k33peBbf1+hk6O9D0vN3oHTJ7W8hmp8=;
 b=enGEsmtTrGzEWKERWmQ7KSv+1Yc+S+wfGYfKDdLmwAMP6QZmzQcQXW4PCsILrsRBc4
 zC3fmxMq2kGtkDgJsnmmkama2rEIPxZwum/uDjbGnBmCTk5ANnTxzUrV7eX0kAHc9eQ2
 vdG8yfY9+wWLfAev2UOOFB28KQnjXFb0a2i+lBdTLmuWgExpLb5rfAXY5lq/j2tr/Kys
 IN0zv81fSJ5tx2JT2nkMN7qF5ufCMpMaIyyRQKxRGvEX2sGYpzdCHmohsVVhhjaGiGE3
 YLoyL+EzKaTqC6uobMt1N2MB+6hI2e6WkiBjTz6VhjGAWJjH3uv6kBjkfiGENSkr3/e4
 9dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zo3GRMIgUgW0k33peBbf1+hk6O9D0vN3oHTJ7W8hmp8=;
 b=mcSicFkEjtidqFLYqokHE6IfVkaubeLHDlyKfJztT6pCCEMjg4mF7XyYBJ6i1PjIMw
 TQupYHK2faWplEO09Sa28zao6eqSw1aj2egq4GCHjoNcpxL4E1a+HhNuTXZ/vcyP+u4K
 ARNxYGP02s7g4EktUOMgXNB6wG42oXvF4qCldzKFpje0a6gBgUZQTIbdfAnKE2pms/rX
 EJKnCqeQA+SrPzWEFzO2juP+s36KGQ/mnYDS9iql5KnGrA5beFFwhxmTB0eq1KmuLIGr
 tk8BBOlE3x3Ox3sK5mU62pFehnHREJiU9Mc1bRKNYQopcoVZsscIT4+wJ4/Oo6JWh8KC
 bDtQ==
X-Gm-Message-State: AOAM533WUfxe7eSAOsRkc3C0VuhSpevyfmc8e7wpeN5KFi3PCrQpu1pr
 8hZf3FFsTVz2fqVtt/snEc7u2C65
X-Google-Smtp-Source: ABdhPJxkGyLYqUJb87cdbnuRbH2TZ6WDMH39nabrwM6O0m5T3XTFVYU7Qga1AntUJhCMcXKFzSdf9g==
X-Received: by 2002:a7b:c62a:: with SMTP id p10mr2912768wmk.143.1589536471903; 
 Fri, 15 May 2020 02:54:31 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:31 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 26/38] drm/omapdrm: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:06 +0100
Message-Id: <20200515095118.2743122-27-emil.l.velikov@gmail.com>
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
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
