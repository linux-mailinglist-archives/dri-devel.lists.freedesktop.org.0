Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C00868F23
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A91810F298;
	Tue, 27 Feb 2024 11:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kblU8tOZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7KM2S6o6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kblU8tOZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7KM2S6o6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D297310EFC2;
 Tue, 27 Feb 2024 11:39:05 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4589C1FD32;
 Tue, 27 Feb 2024 11:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZhpexdtq3jGJbP+IJX68/UEnHSK3IwjaHqz8Fz/q1A=;
 b=kblU8tOZ3PYJA4zXZXdp//NImlifI/3qHZCi+TFaR6AUD4QaZ1dmUEAr6aD+MCbeHZOe0I
 duMQdyIWEuV9foT3egR+gTtazVjbZjIwReDqUZTHCHozOA8cQQThasQIxtwnP2pwRTKStC
 E2TdbQZuGFxaZxWaGTY1vj9m+yqyhvo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033944;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZhpexdtq3jGJbP+IJX68/UEnHSK3IwjaHqz8Fz/q1A=;
 b=7KM2S6o6GVR34LBh0j6hthdqrQBiULwGGf8SYxdmifypl2JBd77LuIU3bXz759jvFoC96K
 anc8cdEKnN8LEABg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZhpexdtq3jGJbP+IJX68/UEnHSK3IwjaHqz8Fz/q1A=;
 b=kblU8tOZ3PYJA4zXZXdp//NImlifI/3qHZCi+TFaR6AUD4QaZ1dmUEAr6aD+MCbeHZOe0I
 duMQdyIWEuV9foT3egR+gTtazVjbZjIwReDqUZTHCHozOA8cQQThasQIxtwnP2pwRTKStC
 E2TdbQZuGFxaZxWaGTY1vj9m+yqyhvo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033944;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZhpexdtq3jGJbP+IJX68/UEnHSK3IwjaHqz8Fz/q1A=;
 b=7KM2S6o6GVR34LBh0j6hthdqrQBiULwGGf8SYxdmifypl2JBd77LuIU3bXz759jvFoC96K
 anc8cdEKnN8LEABg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7872413ABC;
 Tue, 27 Feb 2024 11:39:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id sIcGHNfJ3WVMUQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:39:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com,
 sumit.semwal@linaro.org, dmitry.osipenko@collabora.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/13] drm/fbdev-generic: Fix locking with
 drm_client_buffer_vmap_local()
Date: Tue, 27 Feb 2024 11:14:57 +0100
Message-ID: <20240227113853.8464-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
References: <20240227113853.8464-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kblU8tOZ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7KM2S6o6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLo3wgn6xaqcdyw4c639zmwwtu)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[30]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -1.51
X-Rspamd-Queue-Id: 4589C1FD32
X-Spam-Flag: NO
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

Temporarily lock the fbdev buffer object during updates to prevent
memory managers from evicting/moving the buffer. Moving a buffer
object while update its content results in undefined behaviour.

Fbdev-generic updates its buffer object from a shadow buffer. Gem-shmem
and gem-dma helpers do not move buffer objects, so they are safe to be
used with fbdev-generic. Gem-vram and qxl are based on TTM, but pin
buffer objects are part of the vmap operation. So both are also safe
to be used with fbdev-generic.

Amdgpu and nouveau do not pin or lock the buffer object during an
update. Their TTM-based memory management could move the buffer object
while the update is ongoing.

The new vmap_local and vunmap_local helpers hold the buffer object's
reservation lock during the buffer update. This prevents moving the
buffer object on all memory managers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c        | 68 +++++++++++++++++++++++++----
 drivers/gpu/drm/drm_fbdev_generic.c |  4 +-
 drivers/gpu/drm/drm_gem.c           | 12 +++++
 include/drm/drm_client.h            | 10 +++++
 include/drm/drm_gem.h               |  3 ++
 5 files changed, 87 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 9403b3f576f7b..2cc81831236b5 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -304,6 +304,66 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
 	return ERR_PTR(ret);
 }
 
+/**
+ * drm_client_buffer_vmap_local - Map DRM client buffer into address space
+ * @buffer: DRM client buffer
+ * @map_copy: Returns the mapped memory's address
+ *
+ * This function maps a client buffer into kernel address space. If the
+ * buffer is already mapped, it returns the existing mapping's address.
+ *
+ * Client buffer mappings are not ref'counted. Each call to
+ * drm_client_buffer_vmap_local() should be closely followed by a call to
+ * drm_client_buffer_vunmap_local(). See drm_client_buffer_vmap() for
+ * long-term mappings.
+ *
+ * The returned address is a copy of the internal value. In contrast to
+ * other vmap interfaces, you don't need it for the client's vunmap
+ * function. So you can modify it at will during blit and draw operations.
+ *
+ * Returns:
+ *	0 on success, or a negative errno code otherwise.
+ */
+int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
+				 struct iosys_map *map_copy)
+{
+	struct drm_gem_object *gem = buffer->gem;
+	struct iosys_map *map = &buffer->map;
+	int ret;
+
+	drm_gem_lock(gem);
+
+	ret = drm_gem_vmap(gem, map);
+	if (ret)
+		goto err_drm_gem_vmap_unlocked;
+	*map_copy = *map;
+
+	return 0;
+
+err_drm_gem_vmap_unlocked:
+	drm_gem_unlock(gem);
+	return 0;
+}
+EXPORT_SYMBOL(drm_client_buffer_vmap_local);
+
+/**
+ * drm_client_buffer_vunmap_local - Unmap DRM client buffer
+ * @buffer: DRM client buffer
+ *
+ * This function removes a client buffer's memory mapping established
+ * with drm_client_buffer_vunmap_local(). Calling this function is only
+ * required by clients that manage their buffer mappings by themselves.
+ */
+void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer)
+{
+	struct drm_gem_object *gem = buffer->gem;
+	struct iosys_map *map = &buffer->map;
+
+	drm_gem_vunmap(gem, map);
+	drm_gem_unlock(gem);
+}
+EXPORT_SYMBOL(drm_client_buffer_vunmap_local);
+
 /**
  * drm_client_buffer_vmap - Map DRM client buffer into address space
  * @buffer: DRM client buffer
@@ -331,14 +391,6 @@ drm_client_buffer_vmap(struct drm_client_buffer *buffer,
 	struct iosys_map *map = &buffer->map;
 	int ret;
 
-	/*
-	 * FIXME: The dependency on GEM here isn't required, we could
-	 * convert the driver handle to a dma-buf instead and use the
-	 * backend-agnostic dma-buf vmap support instead. This would
-	 * require that the handle2fd prime ioctl is reworked to pull the
-	 * fd_install step out of the driver backend hooks, to make that
-	 * final step optional for internal users.
-	 */
 	ret = drm_gem_vmap_unlocked(buffer->gem, map);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index d647d89764cb9..be357f926faec 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -197,14 +197,14 @@ static int drm_fbdev_generic_damage_blit(struct drm_fb_helper *fb_helper,
 	 */
 	mutex_lock(&fb_helper->lock);
 
-	ret = drm_client_buffer_vmap(buffer, &map);
+	ret = drm_client_buffer_vmap_local(buffer, &map);
 	if (ret)
 		goto out;
 
 	dst = map;
 	drm_fbdev_generic_damage_blit_real(fb_helper, clip, &dst);
 
-	drm_client_buffer_vunmap(buffer);
+	drm_client_buffer_vunmap_local(buffer);
 
 out:
 	mutex_unlock(&fb_helper->lock);
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index e0f80c6a7096f..d4bbc5d109c8b 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1227,6 +1227,18 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 }
 EXPORT_SYMBOL(drm_gem_vunmap);
 
+void drm_gem_lock(struct drm_gem_object *obj)
+{
+	dma_resv_lock(obj->resv, NULL);
+}
+EXPORT_SYMBOL(drm_gem_lock);
+
+void drm_gem_unlock(struct drm_gem_object *obj)
+{
+	dma_resv_unlock(obj->resv);
+}
+EXPORT_SYMBOL(drm_gem_unlock);
+
 int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	int ret;
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index d47458ecdac46..bc0e66f9c4251 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -141,6 +141,13 @@ struct drm_client_buffer {
 
 	/**
 	 * @gem: GEM object backing this buffer
+	 *
+	 * FIXME: The dependency on GEM here isn't required, we could
+	 * convert the driver handle to a dma-buf instead and use the
+	 * backend-agnostic dma-buf vmap support instead. This would
+	 * require that the handle2fd prime ioctl is reworked to pull the
+	 * fd_install step out of the driver backend hooks, to make that
+	 * final step optional for internal users.
 	 */
 	struct drm_gem_object *gem;
 
@@ -159,6 +166,9 @@ struct drm_client_buffer *
 drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
 void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
 int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
+int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
+				 struct iosys_map *map_copy);
+void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer);
 int drm_client_buffer_vmap(struct drm_client_buffer *buffer,
 			   struct iosys_map *map);
 void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 2ebec3984cd44..bae4865b2101a 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -527,6 +527,9 @@ struct page **drm_gem_get_pages(struct drm_gem_object *obj);
 void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
 		bool dirty, bool accessed);
 
+void drm_gem_lock(struct drm_gem_object *obj);
+void drm_gem_unlock(struct drm_gem_object *obj);
+
 int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
 void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
 
-- 
2.43.2

