Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA93BB826
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 09:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C5D899F2;
	Mon,  5 Jul 2021 07:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38F1899F2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 07:46:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84B8B22658;
 Mon,  5 Jul 2021 07:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625471195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zH0JDqoIdYuIhv3IuplfsziZtWh9JeJJTYCczzmFgWk=;
 b=2IrA5oe98lwIaTAUGUrmuktMr78Okuxq6SZPXgcZfpITzCLIPYyjNkeLCGcQGrw6wdv3+B
 bm6yQSwsTOMMIbyfqsgqpl7pBGLYOVOdwCAk+6NIrhfu09cowQM6VZYntl2kGjtamGtu1B
 7pVyvWhyO+ARno+PuXpnlaQ956MM82A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625471195;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zH0JDqoIdYuIhv3IuplfsziZtWh9JeJJTYCczzmFgWk=;
 b=08cgwFKjyMul9fSFrkwC+deHJswfLQacv3SoUjUuvw3eqefaNE79l9Y3bQmqxRORlx3AUW
 ol9drdw2+4xsIDCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 51A2D13440;
 Mon,  5 Jul 2021 07:46:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0KgFE9u44mBNDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 07:46:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: melissa.srw@gmail.com, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH 4/4] drm/vkms: Use dma-buf mapping from shadow-plane state for
 composing
Date: Mon,  5 Jul 2021 09:46:33 +0200
Message-Id: <20210705074633.9425-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705074633.9425-1-tzimmermann@suse.de>
References: <20210705074633.9425-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Store the shadow-buffer mapping's address in struct vkms_composer and
use the value when composing the output. It's the same value as stored
in the GEM SHMEM BO, but frees the composer code from its dependency
on GEM SHMEM.

Using struct dma_buf_map is how framebuffer access is supposed to be.
The long-term plan is to perform all framebuffer access via struct
dma_buf_map and avoid the details of accessing I/O and system memory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 24 +++++++++++-------------
 drivers/gpu/drm/vkms/vkms_drv.h      |  1 +
 drivers/gpu/drm/vkms/vkms_plane.c    |  3 +++
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 3ade0df173d2..ead8fff81f30 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -6,7 +6,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "vkms_drv.h"
@@ -154,24 +153,21 @@ static void compose_plane(struct vkms_composer *primary_composer,
 			  struct vkms_composer *plane_composer,
 			  void *vaddr_out)
 {
-	struct drm_gem_object *plane_obj;
-	struct drm_gem_shmem_object *plane_shmem_obj;
 	struct drm_framebuffer *fb = &plane_composer->fb;
+	void *vaddr;
 	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
 
-	plane_obj = drm_gem_fb_get_obj(&plane_composer->fb, 0);
-	plane_shmem_obj = to_drm_gem_shmem_obj(plane_obj);
-
-	if (WARN_ON(!plane_shmem_obj->vaddr))
+	if (WARN_ON(dma_buf_map_is_null(&primary_composer->map[0])))
 		return;
 
+	vaddr = plane_composer->map[0].vaddr;
+
 	if (fb->format->format == DRM_FORMAT_ARGB8888)
 		pixel_blend = &alpha_blend;
 	else
 		pixel_blend = &x_blend;
 
-	blend(vaddr_out, plane_shmem_obj->vaddr, primary_composer,
-	      plane_composer, pixel_blend);
+	blend(vaddr_out, vaddr, primary_composer, plane_composer, pixel_blend);
 }
 
 static int compose_active_planes(void **vaddr_out,
@@ -180,21 +176,23 @@ static int compose_active_planes(void **vaddr_out,
 {
 	struct drm_framebuffer *fb = &primary_composer->fb;
 	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
-	struct drm_gem_shmem_object *shmem_obj = to_drm_gem_shmem_obj(gem_obj);
+	const void *vaddr;
 	int i;
 
 	if (!*vaddr_out) {
-		*vaddr_out = kzalloc(shmem_obj->base.size, GFP_KERNEL);
+		*vaddr_out = kzalloc(gem_obj->size, GFP_KERNEL);
 		if (!*vaddr_out) {
 			DRM_ERROR("Cannot allocate memory for output frame.");
 			return -ENOMEM;
 		}
 	}
 
-	if (WARN_ON(!shmem_obj->vaddr))
+	if (WARN_ON(dma_buf_map_is_null(&primary_composer->map[0])))
 		return -EINVAL;
 
-	memcpy(*vaddr_out, shmem_obj->vaddr, shmem_obj->base.size);
+	vaddr = primary_composer->map[0].vaddr;
+
+	memcpy(*vaddr_out, vaddr, gem_obj->size);
 
 	/* If there are other planes besides primary, we consider the active
 	 * planes should be in z-order and compose them associatively:
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 7a76dccd7316..8c731b6dcba7 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -23,6 +23,7 @@
 struct vkms_composer {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
+	struct dma_buf_map map[4];
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 8fbbd148163d..8a56fbf572b0 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -97,6 +97,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct vkms_plane_state *vkms_plane_state;
+	struct drm_shadow_plane_state *shadow_plane_state;
 	struct drm_framebuffer *fb = new_state->fb;
 	struct vkms_composer *composer;
 
@@ -104,11 +105,13 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 		return;
 
 	vkms_plane_state = to_vkms_plane_state(new_state);
+	shadow_plane_state = &vkms_plane_state->base;
 
 	composer = vkms_plane_state->composer;
 	memcpy(&composer->src, &new_state->src, sizeof(struct drm_rect));
 	memcpy(&composer->dst, &new_state->dst, sizeof(struct drm_rect));
 	memcpy(&composer->fb, fb, sizeof(struct drm_framebuffer));
+	memcpy(&composer->map, &shadow_plane_state->map, sizeof(composer->map));
 	drm_framebuffer_get(&composer->fb);
 	composer->offset = fb->offsets[0];
 	composer->pitch = fb->pitches[0];
-- 
2.32.0

