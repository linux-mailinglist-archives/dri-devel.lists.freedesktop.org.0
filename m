Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A4EAC4076
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64B110E317;
	Mon, 26 May 2025 13:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IQ/J0Z16";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wZXYvk+O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IQ/J0Z16";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wZXYvk+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A87610E30A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:30:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E3D881FE09;
 Mon, 26 May 2025 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748266204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z4yPUxYm+yphhRygbIkS48YWAk1L+U7yioNX98D0suc=;
 b=IQ/J0Z16+QJPqOk4dQlsvheplMMddHtQMUgho+1nW8VrV354kqvYr7qa9FfZdZEeoRlWSi
 rBhrD9AIMRxdJmpXlugYjp5REZQr8IuX9Ej3C5x72s/jcViA9jfWmOHYJKrxEsyIYDBhhu
 ogXnk0igE6L0sAZzi95pprJpz+MKILs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748266204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z4yPUxYm+yphhRygbIkS48YWAk1L+U7yioNX98D0suc=;
 b=wZXYvk+O77HYwFPvl0Fy6Kt2oT+OqLhQ6hXaNzuF0xub8pLscD5R1IV68JQ2jRxc64FyPR
 GScwyMDGN4oUTtCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748266204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z4yPUxYm+yphhRygbIkS48YWAk1L+U7yioNX98D0suc=;
 b=IQ/J0Z16+QJPqOk4dQlsvheplMMddHtQMUgho+1nW8VrV354kqvYr7qa9FfZdZEeoRlWSi
 rBhrD9AIMRxdJmpXlugYjp5REZQr8IuX9Ej3C5x72s/jcViA9jfWmOHYJKrxEsyIYDBhhu
 ogXnk0igE6L0sAZzi95pprJpz+MKILs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748266204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z4yPUxYm+yphhRygbIkS48YWAk1L+U7yioNX98D0suc=;
 b=wZXYvk+O77HYwFPvl0Fy6Kt2oT+OqLhQ6hXaNzuF0xub8pLscD5R1IV68JQ2jRxc64FyPR
 GScwyMDGN4oUTtCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB78013984;
 Mon, 26 May 2025 13:30:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4HqkKNxsNGgTOQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 26 May 2025 13:30:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, dmitry.osipenko@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/4] drm/gem-vram: Un-export pin helpers
Date: Mon, 26 May 2025 15:25:19 +0200
Message-ID: <20250526132634.531789-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526132634.531789-1-tzimmermann@suse.de>
References: <20250526132634.531789-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.20
X-Spamd-Result: default: False [0.20 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.989]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[collabora.com,gmail.com,ffwll.ch,kernel.org,linux.intel.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,collabora.com:email,suse.de:email,suse.de:mid];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

There are no external callers of the gem-vram pin helpers. Hence
unexport them.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 42 ++-------------------------
 include/drm/drm_gem_vram_helper.h     |  2 --
 2 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index c73480d31836..ead50fef5e7d 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -88,11 +88,6 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  * drmm_vram_helper_init() is a managed interface that installs a
  * clean-up handler to run during the DRM device's release.
  *
- * For drawing or scanout operations, rsp. buffer objects have to be pinned
- * in video RAM. Call drm_gem_vram_pin() with &DRM_GEM_VRAM_PL_FLAG_VRAM or
- * &DRM_GEM_VRAM_PL_FLAG_SYSTEM to pin a buffer object in video RAM or system
- * memory. Call drm_gem_vram_unpin() to release the pinned object afterwards.
- *
  * A buffer object that is pinned in video RAM has a fixed address within that
  * memory region. Call drm_gem_vram_offset() to retrieve this value. Typically
  * it's used to program the hardware's scanout engine for framebuffers, set
@@ -299,30 +294,7 @@ static int drm_gem_vram_pin_locked(struct drm_gem_vram_object *gbo,
 	return 0;
 }
 
-/**
- * drm_gem_vram_pin() - Pins a GEM VRAM object in a region.
- * @gbo:	the GEM VRAM object
- * @pl_flag:	a bitmask of possible memory regions
- *
- * Pinning a buffer object ensures that it is not evicted from
- * a memory region. A pinned buffer object has to be unpinned before
- * it can be pinned to another region. If the pl_flag argument is 0,
- * the buffer is pinned at its current location (video RAM or system
- * memory).
- *
- * Small buffer objects, such as cursor images, can lead to memory
- * fragmentation if they are pinned in the middle of video RAM. This
- * is especially a problem on devices with only a small amount of
- * video RAM. Fragmentation can prevent the primary framebuffer from
- * fitting in, even though there's enough memory overall. The modifier
- * DRM_GEM_VRAM_PL_FLAG_TOPDOWN marks the buffer object to be pinned
- * at the high end of the memory region to avoid fragmentation.
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag)
+static int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag)
 {
 	int ret;
 
@@ -334,7 +306,6 @@ int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag)
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_gem_vram_pin);
 
 static void drm_gem_vram_unpin_locked(struct drm_gem_vram_object *gbo)
 {
@@ -343,15 +314,7 @@ static void drm_gem_vram_unpin_locked(struct drm_gem_vram_object *gbo)
 	ttm_bo_unpin(&gbo->bo);
 }
 
-/**
- * drm_gem_vram_unpin() - Unpins a GEM VRAM object
- * @gbo:	the GEM VRAM object
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
+static int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 {
 	int ret;
 
@@ -364,7 +327,6 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_gem_vram_unpin);
 
 /**
  * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 00830b49a3ff..2dd42bed679d 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -94,8 +94,6 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						unsigned long pg_align);
 void drm_gem_vram_put(struct drm_gem_vram_object *gbo);
 s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
-int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
-int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map);
 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
 			 struct iosys_map *map);
-- 
2.49.0

