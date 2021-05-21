Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 291F638C2C0
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 11:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA38D6F5E8;
	Fri, 21 May 2021 09:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533A56F5F0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:10:10 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so6759194wmg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dMeLF7kT4UQPFLtQVHJE6PS1qX9wTDyU6376bcIucAI=;
 b=RLakhlcHyt3I/wcj3B6z7LFOmXn1l8r2J8Hbn/L4JWqZ6j7UYSlNusDupSOn7GGoUi
 JW9YCD6qHIHVh4hVUYgEQK46+FyuvPcQgMFcLS48Pe/+nNFu5sIjgMMJ/iNdfdz//rpF
 ptjLnQLP+PUPw2uVDIZzcjXG8JWfDKFx0fxII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dMeLF7kT4UQPFLtQVHJE6PS1qX9wTDyU6376bcIucAI=;
 b=joSHBGhiS3zYkR0yT2QbbzRFRmC3ylfjT/RHtoNHATiQ1e/GD7M7CV7K7zw+o4Y5DO
 DM61KaVLtjaCfeXl0ymJvH1BYOHjvDbck7XPv6DOjJrTokYpf5rPgZ7WgxCfHq3nipHx
 6W+nsJuYIH+soytPPmuMMH8ypDXWUJzZjc8nnEBTySI/PzkrCXkfB+/3QpiWbibEbBDp
 jo4zUeGg//HoGhMh3ETqLl3tVSKHWhzvmaUsQ63Sqn+vCS3s5gfDKH7st40xd79CBNFP
 Qi34uc6Mz7TeIzyxDtEbuDFzrpbXXSfzBKsJ1obuQFtmkz1HeulEnhOsLCi1uWk+GxFK
 efjw==
X-Gm-Message-State: AOAM530P4Rwc8H1gKD/d9c3bmzCDevc5JjO0SbkHnRFqR6hPTx7PhiOv
 4/Bmj5O56WAzgNYL/1wLSYchwO4kur81vw==
X-Google-Smtp-Source: ABdhPJyWC2U/yGRdS9Lbn6EqOeocePAWnkhvm2L8orby4UrbSfEaxjsZ2O3eV85M0v0JAgUBuuh/sw==
X-Received: by 2002:a1c:f618:: with SMTP id w24mr7660460wmc.93.1621588209087; 
 Fri, 21 May 2021 02:10:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y2sm13589457wmq.45.2021.05.21.02.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 02:10:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/11] drm/atomic-helper: make drm_gem_plane_helper_prepare_fb
 the default
Date: Fri, 21 May 2021 11:09:53 +0200
Message-Id: <20210521090959.1663703-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
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
index a005c5a0ba46..2d825c81e9fd 100644
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
index f3a4b47b3986..4e727261dca5 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1178,8 +1178,11 @@ struct drm_plane_helper_funcs {
 	 * equivalent functionality should be implemented through private
 	 * members in the plane structure.
 	 *
-	 * Drivers which always have their buffers pinned should use
-	 * drm_gem_plane_helper_prepare_fb() for this hook.
+	 * For GEM drivers who neither have a @prepare_fb not @cleanup_fb hook
+	 * set drm_gem_plane_helper_prepare_fb() is called automatically to
+	 * implement this. Other drivers which need additional plane processing
+	 * can call drm_gem_plane_helper_prepare_fb() from their @prepare_fb
+	 * hook.
 	 *
 	 * The helpers will call @cleanup_fb with matching arguments for every
 	 * successful call to this hook.
-- 
2.31.0

