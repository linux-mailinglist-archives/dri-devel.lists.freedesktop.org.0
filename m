Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C844AFB423
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9027A10E477;
	Mon,  7 Jul 2025 13:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gk7LV8Oz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SufhylUm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gk7LV8Oz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SufhylUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D65910E477
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 13:15:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EB7C51F390;
 Mon,  7 Jul 2025 13:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751894124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C1Dhfr+8pCD1IYHBaTcTmQM8ZHAUNKPJlBoJluMTmOM=;
 b=gk7LV8OzXH0xQwoYIU01XxQQwayccpL/ryS42+1w++X1XaLujOmtL9/NgK7XqCQYJtI/PQ
 yoMGOxcvrBUu+STibWUO1e+savkgMYHIoEzzlrIXUo+Gx7ehY66fUK2+pqyWizGNm/eooU
 bpENS39t5dgrJDVUehMxbgXYh72Q7eA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751894124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C1Dhfr+8pCD1IYHBaTcTmQM8ZHAUNKPJlBoJluMTmOM=;
 b=SufhylUm15tiX0SS4fZ5lnTwN4UyYrOtjrqQJQtsTsiB1111iwPhgck9Q4FK5TGasuC9ZI
 JxI0fs76hdhz+ECg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gk7LV8Oz;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SufhylUm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751894124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C1Dhfr+8pCD1IYHBaTcTmQM8ZHAUNKPJlBoJluMTmOM=;
 b=gk7LV8OzXH0xQwoYIU01XxQQwayccpL/ryS42+1w++X1XaLujOmtL9/NgK7XqCQYJtI/PQ
 yoMGOxcvrBUu+STibWUO1e+savkgMYHIoEzzlrIXUo+Gx7ehY66fUK2+pqyWizGNm/eooU
 bpENS39t5dgrJDVUehMxbgXYh72Q7eA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751894124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C1Dhfr+8pCD1IYHBaTcTmQM8ZHAUNKPJlBoJluMTmOM=;
 b=SufhylUm15tiX0SS4fZ5lnTwN4UyYrOtjrqQJQtsTsiB1111iwPhgck9Q4FK5TGasuC9ZI
 JxI0fs76hdhz+ECg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 737EF13757;
 Mon,  7 Jul 2025 13:15:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nrjKGmvIa2hgFgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Jul 2025 13:15:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: christian.koenig@amd.com, asrivats@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jean-christophe@guillain.net, superm1@kernel.org,
 satadru@gmail.com, bp@alien8.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Bert Karwatzki <spasswolf@web.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Subject: [PATCH v3] drm/framebuffer: Acquire internal references on GEM handles
Date: Mon,  7 Jul 2025 15:11:55 +0200
Message-ID: <20250707131224.249496-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[18]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_TO(0.00)[amd.com,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,guillain.net,alien8.de];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,web.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,suse.de,web.de,linaro.org,lists.linaro.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,linaro.org:email,suse.de:mid,suse.de:dkim,suse.de:email,intel.com:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: EB7C51F390
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
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

Acquire GEM handles in drm_framebuffer_init() and release them in
the corresponding drm_framebuffer_cleanup(). Ties the handle's
lifetime to the framebuffer. Not all GEM buffer objects have GEM
handles. If not set, no refcounting takes place. This is the case
for some fbdev emulation. This is not a problem as these GEM objects
do not use dma-bufs and drivers will not release them while fbdev
emulation is running. Framebuffer flags keep a bit per color plane
of which the framebuffer holds a GEM handle reference.

As all drivers use drm_framebuffer_init(), they will now all hold
dma-buf references as fixed in commit 5307dce878d4 ("drm/gem: Acquire
references on GEM handles for framebuffers").

In the GEM framebuffer helpers, restore the original ref counting
on buffer objects. As the helpers for handle refcounting are now
no longer called from outside the DRM core, unexport the symbols.

v3:
- don't mix internal flags with mode flags (Christian)
v2:
- track framebuffer handle refs by flag
- drop gma500 cleanup (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 5307dce878d4 ("drm/gem: Acquire references on GEM handles for framebuffers")
Reported-by: Bert Karwatzki <spasswolf@web.de>
Closes: https://lore.kernel.org/dri-devel/20250703115915.3096-1-spasswolf@web.de/
Tested-by: Bert Karwatzki <spasswolf@web.de>
Tested-by: Mario Limonciello <superm1@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/drm_framebuffer.c            | 31 ++++++++++++++--
 drivers/gpu/drm/drm_gem.c                    | 38 ++++++++++++--------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++-----
 drivers/gpu/drm/drm_internal.h               |  2 +-
 include/drm/drm_framebuffer.h                |  7 ++++
 5 files changed, 68 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index b781601946db..63a70f285cce 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -862,11 +862,23 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_free);
 int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 			 const struct drm_framebuffer_funcs *funcs)
 {
+	unsigned int i;
 	int ret;
+	bool exists;
 
 	if (WARN_ON_ONCE(fb->dev != dev || !fb->format))
 		return -EINVAL;
 
+	for (i = 0; i < fb->format->num_planes; i++) {
+		if (drm_WARN_ON_ONCE(dev, fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)))
+			fb->internal_flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
+		if (fb->obj[i]) {
+			exists = drm_gem_object_handle_get_if_exists_unlocked(fb->obj[i]);
+			if (exists)
+				fb->internal_flags |= DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
+		}
+	}
+
 	INIT_LIST_HEAD(&fb->filp_head);
 
 	fb->funcs = funcs;
@@ -875,7 +887,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
 				    false, drm_framebuffer_free);
 	if (ret)
-		goto out;
+		goto err;
 
 	mutex_lock(&dev->mode_config.fb_lock);
 	dev->mode_config.num_fb++;
@@ -883,7 +895,16 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 	mutex_unlock(&dev->mode_config.fb_lock);
 
 	drm_mode_object_register(dev, &fb->base);
-out:
+
+	return 0;
+
+err:
+	for (i = 0; i < fb->format->num_planes; i++) {
+		if (fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i)) {
+			drm_gem_object_handle_put_unlocked(fb->obj[i]);
+			fb->internal_flags &= ~DRM_FRAMEBUFFER_HAS_HANDLE_REF(i);
+		}
+	}
 	return ret;
 }
 EXPORT_SYMBOL(drm_framebuffer_init);
@@ -960,6 +981,12 @@ EXPORT_SYMBOL(drm_framebuffer_unregister_private);
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = fb->dev;
+	unsigned int i;
+
+	for (i = 0; i < fb->format->num_planes; i++) {
+		if (fb->internal_flags & DRM_FRAMEBUFFER_HAS_HANDLE_REF(i))
+			drm_gem_object_handle_put_unlocked(fb->obj[i]);
+	}
 
 	mutex_lock(&dev->mode_config.fb_lock);
 	list_del(&fb->head);
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index bc505d938b3e..41cdab6088ae 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -224,23 +224,34 @@ static void drm_gem_object_handle_get(struct drm_gem_object *obj)
 }
 
 /**
- * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
+ * drm_gem_object_handle_get_if_exists_unlocked - acquire reference on user-space handle, if any
  * @obj: GEM object
  *
- * Acquires a reference on the GEM buffer object's handle. Required
- * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
- * to release the reference.
+ * Acquires a reference on the GEM buffer object's handle. Required to keep
+ * the GEM object alive. Call drm_gem_object_handle_put_if_exists_unlocked()
+ * to release the reference. Does nothing if the buffer object has no handle.
+ *
+ * Returns:
+ * True if a handle exists, or false otherwise
  */
-void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
+bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
 
 	guard(mutex)(&dev->object_name_lock);
 
-	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
+	/*
+	 * First ref taken during GEM object creation, if any. Some
+	 * drivers set up internal framebuffers with GEM objects that
+	 * do not have a GEM handle. Hence, this counter can be zero.
+	 */
+	if (!obj->handle_count)
+		return false;
+
 	drm_gem_object_handle_get(obj);
+
+	return true;
 }
-EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
 
 /**
  * drm_gem_object_handle_free - release resources bound to userspace handles
@@ -273,7 +284,7 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
 }
 
 /**
- * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
+ * drm_gem_object_handle_put_unlocked - releases reference on user-space handle
  * @obj: GEM object
  *
  * Releases a reference on the GEM buffer object's handle. Possibly releases
@@ -284,14 +295,14 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	bool final = false;
 
-	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
+	if (drm_WARN_ON(dev, READ_ONCE(obj->handle_count) == 0))
 		return;
 
 	/*
-	* Must bump handle count first as this may be the last
-	* ref, in which case the object would disappear before we
-	* checked for a name
-	*/
+	 * Must bump handle count first as this may be the last
+	 * ref, in which case the object would disappear before
+	 * we checked for a name.
+	 */
 
 	mutex_lock(&dev->object_name_lock);
 	if (--obj->handle_count == 0) {
@@ -304,7 +315,6 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	if (final)
 		drm_gem_object_put(obj);
 }
-EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
 
 /*
  * Called at device or object close to release the file's
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
index f921cc73f8b8..e79c3c623c9a 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -161,7 +161,7 @@ void drm_sysfs_lease_event(struct drm_device *dev);
 
 /* drm_gem.c */
 int drm_gem_init(struct drm_device *dev);
-void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
+bool drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj);
 void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
 int drm_gem_handle_create_tail(struct drm_file *file_priv,
 			       struct drm_gem_object *obj,
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index 668077009fce..38b24fc8978d 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -23,6 +23,7 @@
 #ifndef __DRM_FRAMEBUFFER_H__
 #define __DRM_FRAMEBUFFER_H__
 
+#include <linux/bits.h>
 #include <linux/ctype.h>
 #include <linux/list.h>
 #include <linux/sched.h>
@@ -100,6 +101,8 @@ struct drm_framebuffer_funcs {
 		     unsigned num_clips);
 };
 
+#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i)	BIT(0u + (_i))
+
 /**
  * struct drm_framebuffer - frame buffer object
  *
@@ -188,6 +191,10 @@ struct drm_framebuffer {
 	 * DRM_MODE_FB_MODIFIERS.
 	 */
 	int flags;
+	/**
+	 * @internal_flags: Framebuffer flags like DRM_FRAMEBUFFER_HAS_HANDLE_REF.
+	 */
+	unsigned int internal_flags;
 	/**
 	 * @filp_head: Placed on &drm_file.fbs, protected by &drm_file.fbs_lock.
 	 */
-- 
2.50.0

