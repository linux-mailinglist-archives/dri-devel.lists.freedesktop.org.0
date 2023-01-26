Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595A167C891
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 11:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ACF10E1D1;
	Thu, 26 Jan 2023 10:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D7C10E2BF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 10:28:18 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so2943862wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 02:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TIyiIVceZpYGCfX6Jfi5IDPHDPBpB0+syI+sCSzTia4=;
 b=RbO/ikWdK43FRwYPhVRNL63SW81vrmN56iOODg9xjmRaP7IhRuLDyysmvTOaeJ8CIE
 ZCbEDUit2PyUvXMTwUouUzbL9igWWe8poFudmkacEfksphS+An0jDSEWRhQaM91lod8A
 ah4BQIzAf0a4QFPPCcDMHICj4Vv6fuIYeDEUnqkZHC7UaOjFS2+YOCsF96GDditHusy3
 qF1XLQiXCLnzd1Ut9ynrOslAZ7P4KkMtAUf5oVN5mTvozKnrlMc1Kbeq4+kXUg1MjM1D
 a/P4L2eNVw6usL+CAme10zI3y0/N8BM/O0+OTjvOFam59/ckR/GcHSy5ZF+e1/eBfDk/
 8V9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIyiIVceZpYGCfX6Jfi5IDPHDPBpB0+syI+sCSzTia4=;
 b=289Yts6w2UJAJWLuwBQf3fbii5+r3LemZYnlA7NAb1576CXlT8yZzr2XyAqGwF64Lx
 lTL5cmdXBxCVXyDKGLTByQG9NbSIUKTWlvRJj4yhjQGTv4I0iJJ3AZHZSbL4nFwOY7H9
 RfVj/VqhJOY8CS4macUsdiHf6bWHy2PiVggDr4QGhqBBVi6nSqn2HZ1HQzaETLBIOetx
 HuPnSQZLqMH/BLH31kRvJN0ERT6yu6IylMZk9ppnD/O7dGCeBYIcw3EjY/IlNYKCUIEE
 jw7MQdvrEcL1nV57FgCY7/sbyfi0fWiBUi031G2GmHL37zPE6iMAVDSsVJklxxfW3yt2
 +5AA==
X-Gm-Message-State: AFqh2kpeVf8fb+ZDuETnvt4Rc9D37Nvgz8FwsDy+7gzSjyWcbutPg7yF
 MmtJ7p3gTSN43ZjV8o3QV48=
X-Google-Smtp-Source: AMrXdXtq9Fc4BgcqBKRw/0L9dn9KlaHMZGCX2x2ndgwrtCWVLMFi9kQenl0G4uLdICbJDNd2uAyTfA==
X-Received: by 2002:a1c:4b09:0:b0:3db:f0a:8726 with SMTP id
 y9-20020a1c4b09000000b003db0f0a8726mr32165025wma.28.1674728897464; 
 Thu, 26 Jan 2023 02:28:17 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c2e9400b003d9862ec435sm1040807wmn.20.2023.01.26.02.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:28:17 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tzimmermann@suse.de, noralf@tronnes.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: remove dumb_destroy callback
Date: Thu, 26 Jan 2023 11:28:14 +0100
Message-Id: <20230126102814.8722-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126102814.8722-1-christian.koenig@amd.com>
References: <20230126102814.8722-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not used by any driver any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_dumb_buffers.c |  5 +----
 drivers/gpu/drm/drm_gem.c          |  7 -------
 drivers/gpu/drm/drm_internal.h     |  3 ---
 include/drm/drm_drv.h              | 19 -------------------
 4 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index ad17fa21cebb..70032bba1c97 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -139,10 +139,7 @@ int drm_mode_destroy_dumb(struct drm_device *dev, u32 handle,
 	if (!dev->driver->dumb_create)
 		return -ENOSYS;
 
-	if (dev->driver->dumb_destroy)
-		return dev->driver->dumb_destroy(file_priv, dev, handle);
-	else
-		return drm_gem_dumb_destroy(file_priv, dev, handle);
+	return drm_gem_handle_delete(file_priv, handle);
 }
 
 int drm_mode_destroy_dumb_ioctl(struct drm_device *dev,
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 59a0bb5ebd85..aa15c52ae182 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -336,13 +336,6 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_dumb_map_offset);
 
-int drm_gem_dumb_destroy(struct drm_file *file,
-			 struct drm_device *dev,
-			 u32 handle)
-{
-	return drm_gem_handle_delete(file, handle);
-}
-
 /**
  * drm_gem_handle_create_tail - internal functions to create a handle
  * @file_priv: drm file-private structure to register the handle for
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index ed2103ee272c..d7e023bbb0d5 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -178,9 +178,6 @@ void drm_gem_unpin(struct drm_gem_object *obj);
 int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 
-int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
-			 u32 handle);
-
 /* drm_debugfs.c drm_debugfs_crc.c */
 #if defined(CONFIG_DEBUG_FS)
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 1d76d0686b03..5b86bb7603e7 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -400,25 +400,6 @@ struct drm_driver {
 	int (*dumb_map_offset)(struct drm_file *file_priv,
 			       struct drm_device *dev, uint32_t handle,
 			       uint64_t *offset);
-	/**
-	 * @dumb_destroy:
-	 *
-	 * This destroys the userspace handle for the given dumb backing storage buffer.
-	 * Since buffer objects must be reference counted in the kernel a buffer object
-	 * won't be immediately freed if a framebuffer modeset object still uses it.
-	 *
-	 * Called by the user via ioctl.
-	 *
-	 * The default implementation is drm_gem_dumb_destroy(). GEM based drivers
-	 * must not overwrite this.
-	 *
-	 * Returns:
-	 *
-	 * Zero on success, negative errno on failure.
-	 */
-	int (*dumb_destroy)(struct drm_file *file_priv,
-			    struct drm_device *dev,
-			    uint32_t handle);
 
 	/** @major: driver major number */
 	int major;
-- 
2.34.1

