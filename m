Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F9F3BB824
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 09:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C047C89A9F;
	Mon,  5 Jul 2021 07:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736E7899F2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 07:46:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1B9DF1FE2F;
 Mon,  5 Jul 2021 07:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625471195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBMkpNBjCuDPGun9lxGyCQZ+Tr2bvOWoYvQ/VsWj8ag=;
 b=1xBs+pkC/lU0E0lVuOQsXltp4prA7T1egQOjz3g72KCg0eIaieLpzYiQPlYJDImNI/dCw4
 Nj3Zm6hN408beft3mUlXN8IoabY2XrEoSj6TyDa3OHV+8TnKtDxshGdCDXp5e1fuft3EtL
 mHqeNDQ5Aml4i75v5HusoJ0G7BtVNLs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625471195;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBMkpNBjCuDPGun9lxGyCQZ+Tr2bvOWoYvQ/VsWj8ag=;
 b=UAtf+jqnEJJVNFCG0Q2LMclWXGRuV2bU7fWbRFIJzkE5Wp6uy6A6WWuW50Ep2WsXYcA+n4
 mPt8LEfpyxGpHiCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF5AB13440;
 Mon,  5 Jul 2021 07:46:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oKyHNdq44mBNDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 07:46:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: melissa.srw@gmail.com, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH 2/4] drm/vkms: Inherit plane state from struct
 drm_shadow_plane_state
Date: Mon,  5 Jul 2021 09:46:31 +0200
Message-Id: <20210705074633.9425-3-tzimmermann@suse.de>
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

Subclass struct drm_shadow_plane_state for VKMS planes and update
all plane-state callbacks accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vkms/vkms_composer.c |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h      |  5 +++--
 drivers/gpu/drm/vkms/vkms_plane.c    | 16 ++++++++--------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e49523866e1d..3ade0df173d2 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -251,7 +251,7 @@ void vkms_composer_worker(struct work_struct *work)
 
 	if (crtc_state->num_active_planes >= 1) {
 		act_plane = crtc_state->active_planes[0];
-		if (act_plane->base.plane->type == DRM_PLANE_TYPE_PRIMARY)
+		if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)
 			primary_composer = act_plane->composer;
 	}
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index ac8c9c2fa4ed..7a76dccd7316 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -7,6 +7,7 @@
 
 #include <drm/drm.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_writeback.h>
 
@@ -33,7 +34,7 @@ struct vkms_composer {
  * @composer: data required for composing computation
  */
 struct vkms_plane_state {
-	struct drm_plane_state base;
+	struct drm_shadow_plane_state base;
 	struct vkms_composer *composer;
 };
 
@@ -111,7 +112,7 @@ struct vkms_device {
 	container_of(target, struct vkms_crtc_state, base)
 
 #define to_vkms_plane_state(target)\
-	container_of(target, struct vkms_plane_state, base)
+	container_of(target, struct vkms_plane_state, base.base)
 
 /* CRTC */
 int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 107521ace597..6ee4fa71bd87 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -40,17 +40,16 @@ vkms_plane_duplicate_state(struct drm_plane *plane)
 
 	vkms_state->composer = composer;
 
-	__drm_atomic_helper_plane_duplicate_state(plane,
-						  &vkms_state->base);
+	__drm_gem_duplicate_shadow_plane_state(plane, &vkms_state->base);
 
-	return &vkms_state->base;
+	return &vkms_state->base.base;
 }
 
 static void vkms_plane_destroy_state(struct drm_plane *plane,
 				     struct drm_plane_state *old_state)
 {
 	struct vkms_plane_state *vkms_state = to_vkms_plane_state(old_state);
-	struct drm_crtc *crtc = vkms_state->base.crtc;
+	struct drm_crtc *crtc = vkms_state->base.base.crtc;
 
 	if (crtc) {
 		/* dropping the reference we acquired in
@@ -63,7 +62,7 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
 	kfree(vkms_state->composer);
 	vkms_state->composer = NULL;
 
-	__drm_atomic_helper_plane_destroy_state(old_state);
+	__drm_gem_destroy_shadow_plane_state(&vkms_state->base);
 	kfree(vkms_state);
 }
 
@@ -71,8 +70,10 @@ static void vkms_plane_reset(struct drm_plane *plane)
 {
 	struct vkms_plane_state *vkms_state;
 
-	if (plane->state)
+	if (plane->state) {
 		vkms_plane_destroy_state(plane, plane->state);
+		plane->state = NULL; /* must be set to NULL here */
+	}
 
 	vkms_state = kzalloc(sizeof(*vkms_state), GFP_KERNEL);
 	if (!vkms_state) {
@@ -80,8 +81,7 @@ static void vkms_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
-	plane->state = &vkms_state->base;
-	plane->state->plane = plane;
+	__drm_gem_reset_shadow_plane(plane, &vkms_state->base);
 }
 
 static const struct drm_plane_funcs vkms_plane_funcs = {
-- 
2.32.0

