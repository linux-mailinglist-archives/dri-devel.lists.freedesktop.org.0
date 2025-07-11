Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E001B01846
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 11:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC6010EA09;
	Fri, 11 Jul 2025 09:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="j3xMyE/8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5a4eUiG2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j3xMyE/8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5a4eUiG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AC810E9F6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:40:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 534B81F74C;
 Fri, 11 Jul 2025 09:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752226856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/gNlFJbWxMfz4s3sOGjJWNay9kIJFjjHwUDE2gw+ezQ=;
 b=j3xMyE/8Lc9blAXBH1p0V2AXgQHAZdkA3klQ5uWJrUPRoCPmctWpxhoVHwzp2YxjBhEPDF
 RzsR04WKUtSs591x+4/IhWOhJXhNn0H8BwMCx6kdPDY9/UlxrkzXz+83w0tFF6XvWp4Uxw
 YJFMW+wU+OilYVaJPUXCzjA3ijmWOKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752226856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/gNlFJbWxMfz4s3sOGjJWNay9kIJFjjHwUDE2gw+ezQ=;
 b=5a4eUiG2DH/nvRKGuACZKoVeHOqfDG8mHm0ZD/onnKPdgxlFs4eBOc//TM+nqbEsREP5Do
 rb4M42FLT3h+bPDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752226856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/gNlFJbWxMfz4s3sOGjJWNay9kIJFjjHwUDE2gw+ezQ=;
 b=j3xMyE/8Lc9blAXBH1p0V2AXgQHAZdkA3klQ5uWJrUPRoCPmctWpxhoVHwzp2YxjBhEPDF
 RzsR04WKUtSs591x+4/IhWOhJXhNn0H8BwMCx6kdPDY9/UlxrkzXz+83w0tFF6XvWp4Uxw
 YJFMW+wU+OilYVaJPUXCzjA3ijmWOKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752226856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/gNlFJbWxMfz4s3sOGjJWNay9kIJFjjHwUDE2gw+ezQ=;
 b=5a4eUiG2DH/nvRKGuACZKoVeHOqfDG8mHm0ZD/onnKPdgxlFs4eBOc//TM+nqbEsREP5Do
 rb4M42FLT3h+bPDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CACF413918;
 Fri, 11 Jul 2025 09:40:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6IItMCfccGjbcAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Jul 2025 09:40:55 +0000
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
Subject: [PATCH 1/9] Revert "drm/framebuffer: Acquire internal references on
 GEM handles"
Date: Fri, 11 Jul 2025 11:35:16 +0200
Message-ID: <20250711093744.120962-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711093744.120962-1-tzimmermann@suse.de>
References: <20250711093744.120962-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-5.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,amd.com,linux-foundation.org,linux.intel.com,kernel.org,pengutronix.de,armlinux.org.uk,redhat.com,collabora.com,chromium.org,broadcom.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[20];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[etnaviv];
 FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLk1j8fm6pferx3phn9ndszqb3)];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -5.30
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

This reverts commit f6bfc9afc7510cb5e6fbe0a17c507917b0120280.

Not needed as we are going to revert commit 5307dce878d4 ("drm/gem:
Acquire references on GEM handles for framebuffers").

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_framebuffer.c            | 31 ++--------------
 drivers/gpu/drm/drm_gem.c                    | 38 ++++++++------------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 +++++----
 drivers/gpu/drm/drm_internal.h               |  2 +-
 include/drm/drm_framebuffer.h                |  7 ----
 5 files changed, 26 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 63a70f285cce..b781601946db 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -862,23 +862,11 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_free);
 int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 			 const struct drm_framebuffer_funcs *funcs)
 {
-	unsigned int i;
 	int ret;
-	bool exists;
 
 	if (WARN_ON_ONCE(fb->dev != dev || !fb->format))
 		return -EINVAL;
 
-	for (i = 0; i < fb->format->num_planes; i++) {
-		if (drm_WARN_ON_ONCE(dev, fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)))
-			fb->internal_flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
-		if (fb->obj[i]) {
-			exists = drm_gem_object_handle_get_if_exists_unlocked(fb->obj[i]);
-			if (exists)
-				fb->internal_flags |= DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
-		}
-	}
-
 	INIT_LIST_HEAD(&fb->filp_head);
 
 	fb->funcs = funcs;
@@ -887,7 +875,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
 				    false, drm_framebuffer_free);
 	if (ret)
-		goto err;
+		goto out;
 
 	mutex_lock(&dev->mode_config.fb_lock);
 	dev->mode_config.num_fb++;
@@ -895,16 +883,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 	mutex_unlock(&dev->mode_config.fb_lock);
 
 	drm_mode_object_register(dev, &fb->base);
-
-	return 0;
-
-err:
-	for (i = 0; i < fb->format->num_planes; i++) {
-		if (fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)) {
-			drm_gem_object_handle_put_unlocked(fb->obj[i]);
-			fb->internal_flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
-		}
-	}
+out:
 	return ret;
 }
 EXPORT_SYMBOL(drm_framebuffer_init);
@@ -981,12 +960,6 @@ EXPORT_SYMBOL(drm_framebuffer_unregister_private);
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = fb->dev;
-	unsigned int i;
-
-	for (i = 0; i < fb->format->num_planes; i++) {
-		if (fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i))
-			drm_gem_object_handle_put_unlocked(fb->obj[i]);
-	}
 
 	mutex_lock(&dev->mode_config.fb_lock);
 	list_del(&fb->head);
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 6a44351e58b7..3a99e4a5d303 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -224,34 +224,23 @@ static void drm_gem_object_handle_get(struct drm_gem_object *obj)
 }
 
 /**
- * drm_gem_object_handle_get_if_exists_unlocked - acquire reference on user-space handle, if any
+ * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
  * @obj: GEM object
  *
- * Acquires a reference on the GEM buffer object's handle. Required to keep
- * the GEM object alive. Call drm_gem_object_handle_put_if_exists_unlocked()
- * to release the reference. Does nothing if the buffer object has no handle.
- *
- * Returns:
- * True if a handle exists, or false otherwise
+ * Acquires a reference on the GEM buffer object's handle. Required
+ * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
+ * to release the reference.
  */
-bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj)
+void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
 
 	guard(mutex)(&dev->object_name_lock);
 
-	/*
-	 * First ref taken during GEM object creation, if any. Some
-	 * drivers set up internal framebuffers with GEM objects that
-	 * do not have a GEM handle. Hence, this counter can be zero.
-	 */
-	if (!obj->handle_count)
-		return false;
-
+	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
 	drm_gem_object_handle_get(obj);
-
-	return true;
 }
+EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
 
 /**
  * drm_gem_object_handle_free - release resources bound to userspace handles
@@ -284,7 +273,7 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
 }
 
 /**
- * drm_gem_object_handle_put_unlocked - releases reference on user-space handle
+ * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
  * @obj: GEM object
  *
  * Releases a reference on the GEM buffer object's handle. Possibly releases
@@ -295,14 +284,14 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	bool final = false;
 
-	if (drm_WARN_ON(dev, READ_ONCE(obj->handle_count) == 0))
+	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
 		return;
 
 	/*
-	 * Must bump handle count first as this may be the last
-	 * ref, in which case the object would disappear before
-	 * we checked for a name.
-	 */
+	* Must bump handle count first as this may be the last
+	* ref, in which case the object would disappear before we
+	* checked for a name
+	*/
 
 	mutex_lock(&dev->object_name_lock);
 	if (--obj->handle_count == 0) {
@@ -315,6 +304,7 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	if (final)
 		drm_gem_object_put(obj);
 }
+EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
 
 /*
  * Called at device or object close to release the file's
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 618ce725cd75..c60d0044d036 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -100,7 +100,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
 	unsigned int i;
 
 	for (i = 0; i < fb->format->num_planes; i++)
-		drm_gem_object_put(fb->obj[i]);
+		drm_gem_object_handle_put_unlocked(fb->obj[i]);
 
 	drm_framebuffer_cleanup(fb);
 	kfree(fb);
@@ -183,8 +183,10 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 		if (!objs[i]) {
 			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
 			ret = -ENOENT;
-			goto err_gem_object_put;
+			goto err_gem_object_handle_put_unlocked;
 		}
+		drm_gem_object_handle_get_unlocked(objs[i]);
+		drm_gem_object_put(objs[i]);
 
 		min_size = (height - 1) * mode_cmd->pitches[i]
 			 + drm_format_info_min_pitch(info, i, width)
@@ -194,22 +196,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 			drm_dbg_kms(dev,
 				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
 				    objs[i]->size, min_size, i);
-			drm_gem_object_put(objs[i]);
+			drm_gem_object_handle_put_unlocked(objs[i]);
 			ret = -EINVAL;
-			goto err_gem_object_put;
+			goto err_gem_object_handle_put_unlocked;
 		}
 	}
 
 	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
 	if (ret)
-		goto err_gem_object_put;
+		goto err_gem_object_handle_put_unlocked;
 
 	return 0;
 
-err_gem_object_put:
+err_gem_object_handle_put_unlocked:
 	while (i > 0) {
 		--i;
-		drm_gem_object_put(objs[i]);
+		drm_gem_object_handle_put_unlocked(objs[i]);
 	}
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index e79c3c623c9a..f921cc73f8b8 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -161,7 +161,7 @@ void drm_sysfs_lease_event(struct drm_device *dev);
 
 /* drm_gem.c */
 int drm_gem_init(struct drm_device *dev);
-bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj);
+void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
 void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
 int drm_gem_handle_create_tail(struct drm_file *file_priv,
 			       struct drm_gem_object *obj,
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index 38b24fc8978d..668077009fce 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -23,7 +23,6 @@
 #ifndef __DRM_FRAMEBUFFER_H__
 #define __DRM_FRAMEBUFFER_H__
 
-#include <linux/bits.h>
 #include <linux/ctype.h>
 #include <linux/list.h>
 #include <linux/sched.h>
@@ -101,8 +100,6 @@ struct drm_framebuffer_funcs {
 		     unsigned num_clips);
 };
 
-#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i)	BIT(0u + (_i))
-
 /**
  * struct drm_framebuffer - frame buffer object
  *
@@ -191,10 +188,6 @@ struct drm_framebuffer {
 	 * DRM_MODE_FB_MODIFIERS.
 	 */
 	int flags;
-	/**
-	 * @internal_flags: Framebuffer flags like DRM_FRAMEBUFFER_HAS_HANDLE_REF.
-	 */
-	unsigned int internal_flags;
 	/**
 	 * @filp_head: Placed on &drm_file.fbs, protected by &drm_file.fbs_lock.
 	 */
-- 
2.50.0

