Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F1AB0184D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 11:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EAC10EA0C;
	Fri, 11 Jul 2025 09:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFA210EA0A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:41:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D96F61F787;
 Fri, 11 Jul 2025 09:40:56 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58ECC1388B;
 Fri, 11 Jul 2025 09:40:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sCZbFCjccGjbcAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Jul 2025 09:40:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com,
 torvalds@linux-foundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 kraxel@redhat.com, christian.gmeiner@gmail.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/9] Revert "drm/gem: Acquire references on GEM handles for
 framebuffers"
Date: Fri, 11 Jul 2025 11:35:17 +0200
Message-ID: <20250711093744.120962-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711093744.120962-1-tzimmermann@suse.de>
References: <20250711093744.120962-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 TAGGED_RCPT(0.00)[etnaviv]
X-Rspamd-Queue-Id: D96F61F787
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
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

This reverts commit 5307dce878d4126e1b375587318955bd019c3741.

We're going to revert the dma-buf handle back to separating dma_buf
and import_attach->dmabuf in struct drm_gem_object. Hence revert this
fix for it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem.c                    | 44 ++------------------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++---
 drivers/gpu/drm/drm_internal.h               |  2 -
 3 files changed, 11 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 3a99e4a5d303..db44c40e307f 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -213,35 +213,6 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
 }
 EXPORT_SYMBOL(drm_gem_private_object_fini);
 
-static void drm_gem_object_handle_get(struct drm_gem_object *obj)
-{
-	struct drm_device *dev = obj->dev;
-
-	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
-
-	if (obj->handle_count++ == 0)
-		drm_gem_object_get(obj);
-}
-
-/**
- * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
- * @obj: GEM object
- *
- * Acquires a reference on the GEM buffer object's handle. Required
- * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
- * to release the reference.
- */
-void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
-{
-	struct drm_device *dev = obj->dev;
-
-	guard(mutex)(&dev->object_name_lock);
-
-	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
-	drm_gem_object_handle_get(obj);
-}
-EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
-
 /**
  * drm_gem_object_handle_free - release resources bound to userspace handles
  * @obj: GEM object to clean up.
@@ -272,14 +243,8 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
 	}
 }
 
-/**
- * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
- * @obj: GEM object
- *
- * Releases a reference on the GEM buffer object's handle. Possibly releases
- * the GEM buffer object and associated dma-buf objects.
- */
-void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
+static void
+drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
 	bool final = false;
@@ -304,7 +269,6 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	if (final)
 		drm_gem_object_put(obj);
 }
-EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
 
 /*
  * Called at device or object close to release the file's
@@ -429,8 +393,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
 	int ret;
 
 	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
-
-	drm_gem_object_handle_get(obj);
+	if (obj->handle_count++ == 0)
+		drm_gem_object_get(obj);
 
 	/*
 	 * Get the user-visible handle using idr.  Preload and perform
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index c60d0044d036..618ce725cd75 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -100,7 +100,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
 	unsigned int i;
 
 	for (i = 0; i < fb->format->num_planes; i++)
-		drm_gem_object_handle_put_unlocked(fb->obj[i]);
+		drm_gem_object_put(fb->obj[i]);
 
 	drm_framebuffer_cleanup(fb);
 	kfree(fb);
@@ -183,10 +183,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 		if (!objs[i]) {
 			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
 			ret = -ENOENT;
-			goto err_gem_object_handle_put_unlocked;
+			goto err_gem_object_put;
 		}
-		drm_gem_object_handle_get_unlocked(objs[i]);
-		drm_gem_object_put(objs[i]);
 
 		min_size = (height - 1) * mode_cmd->pitches[i]
 			 + drm_format_info_min_pitch(info, i, width)
@@ -196,22 +194,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 			drm_dbg_kms(dev,
 				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
 				    objs[i]->size, min_size, i);
-			drm_gem_object_handle_put_unlocked(objs[i]);
+			drm_gem_object_put(objs[i]);
 			ret = -EINVAL;
-			goto err_gem_object_handle_put_unlocked;
+			goto err_gem_object_put;
 		}
 	}
 
 	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
 	if (ret)
-		goto err_gem_object_handle_put_unlocked;
+		goto err_gem_object_put;
 
 	return 0;
 
-err_gem_object_handle_put_unlocked:
+err_gem_object_put:
 	while (i > 0) {
 		--i;
-		drm_gem_object_handle_put_unlocked(objs[i]);
+		drm_gem_object_put(objs[i]);
 	}
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index f921cc73f8b8..9078504e789c 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -161,8 +161,6 @@ void drm_sysfs_lease_event(struct drm_device *dev);
 
 /* drm_gem.c */
 int drm_gem_init(struct drm_device *dev);
-void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
-void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
 int drm_gem_handle_create_tail(struct drm_file *file_priv,
 			       struct drm_gem_object *obj,
 			       u32 *handlep);
-- 
2.50.0

