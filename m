Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A5C3B1E93
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 18:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC91389BF8;
	Wed, 23 Jun 2021 16:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C6489BF8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 16:22:07 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ji1so4927517ejc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 09:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FgdhS4tELlPempmr/LdEXDqeRzzRK223zJsLYPKb8gw=;
 b=Do/GX+54XG16yDfVYOFs8l/hA6TVNGkXCRrx6UfXULmtUmHtRsNZFVlPlJ6Z1QdekH
 s3/eYHRoVtAwFdf7NyqdMW4J2CAOL3YkoqOqjrh+xX85yYtHuZnXx8Rtxf9lgJ+DgqZ+
 h5lW2NSGpirNixcgD9zzla8Rx7hRh/cPCduuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FgdhS4tELlPempmr/LdEXDqeRzzRK223zJsLYPKb8gw=;
 b=SAk3Miu9rqZUxJ1Lt6WqOhwOF612uUJF4FvcCFhzn49XUSCk/Ov2rUH14FEnYzp9Fy
 EFzGvpWPD+1q8YtCn/rmRLkqqmaXZrq034mmZiSUo3LXBzNiWg5exJQXM3P7HKVIqCD6
 k7xgjkTqV2M99UBXBviy+VWMqV5t0iMwy8V2AEboYSXPzQ4bJt3BX6vubNEI9Cl5jpva
 MY/4dfGSR97vQqxcWvXrJnVmE/ou48/83TCMgE0Fo210DBUbwx7zzRFgOQjZgy4x1mVT
 oJ5B2JVjuPuzIhx8XMw3qcESnjbffQ1RPGbfFrrmOzaH3rabLAC8E1tm1NlaDJR5b65S
 BHDw==
X-Gm-Message-State: AOAM533v2vsz4+9icyDR6R3CkeOrMivxXIQa8cZ4FwUAwGkF5PwzfrJy
 w7z/N9cxUQSJG8bjQJMrMCnpDQ==
X-Google-Smtp-Source: ABdhPJwTI55MV8z500md73pyvl8eumOBKCVjb9EKVWmLnZhXrmurFHgHSXSgkpPeFxLfceGh4aGa1w==
X-Received: by 2002:a17:906:53c9:: with SMTP id
 p9mr853754ejo.419.1624465325953; 
 Wed, 23 Jun 2021 09:22:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m7sm97954ejo.95.2021.06.23.09.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 09:22:05 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/atomic-helper: make drm_gem_plane_helper_prepare_fb the
 default
Date: Wed, 23 Jun 2021 18:22:00 +0200
Message-Id: <20210623162200.3372056-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-8-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-8-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's a bunch of atomic drivers who don't do this quite correctly,
luckily most of them aren't in wide use or people would have noticed
the tearing.

By making this the default we avoid the constant audit pain and can
additionally remove a ton of lines from vfuncs for a bit more clarity
in smaller drivers.

While at it complain if there's a cleanup_fb hook but no prepare_fb
hook, because that makes no sense. I haven't found any driver which
violates this, but better safe than sorry.

Subsequent patches will reap the benefits.

v2: It's neither ... nor, not not (Sam)

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_atomic_helper.c      | 10 ++++++++++
 drivers/gpu/drm/drm_gem_atomic_helper.c  |  3 +++
 include/drm/drm_modeset_helper_vtables.h |  7 +++++--
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 531f2374b072..9f6c5f21c4d6 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -35,6 +35,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_self_refresh_helper.h>
@@ -2408,6 +2409,15 @@ int drm_atomic_helper_prepare_planes(struct drm_device *dev,
 			ret = funcs->prepare_fb(plane, new_plane_state);
 			if (ret)
 				goto fail;
+		} else {
+			WARN_ON_ONCE(funcs->cleanup_fb);
+
+			if (!drm_core_check_feature(dev, DRIVER_GEM))
+				continue;
+
+			ret = drm_gem_plane_helper_prepare_fb(plane, new_plane_state);
+			if (ret)
+				goto fail;
 		}
 	}
 
diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index a27135084ae5..bc9396f2a0ed 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -135,6 +135,9 @@
  * GEM based framebuffer drivers which have their buffers always pinned in
  * memory.
  *
+ * This function is the default implementation for GEM drivers of
+ * &drm_plane_helper_funcs.prepare_fb if no callback is provided.
+ *
  * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
  * explicit fencing in atomic modeset updates.
  */
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index f3a4b47b3986..fdfa9f37ce05 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1178,8 +1178,11 @@ struct drm_plane_helper_funcs {
 	 * equivalent functionality should be implemented through private
 	 * members in the plane structure.
 	 *
-	 * Drivers which always have their buffers pinned should use
-	 * drm_gem_plane_helper_prepare_fb() for this hook.
+	 * For GEM drivers who neither have a @prepare_fb nor @cleanup_fb hook
+	 * set drm_gem_plane_helper_prepare_fb() is called automatically to
+	 * implement this. Other drivers which need additional plane processing
+	 * can call drm_gem_plane_helper_prepare_fb() from their @prepare_fb
+	 * hook.
 	 *
 	 * The helpers will call @cleanup_fb with matching arguments for every
 	 * successful call to this hook.
-- 
2.32.0.rc2

