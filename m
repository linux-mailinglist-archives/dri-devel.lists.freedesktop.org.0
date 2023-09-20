Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A617A7A5B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F7510E486;
	Wed, 20 Sep 2023 11:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5C110E486
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:25:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 615171FF97;
 Wed, 20 Sep 2023 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695209111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4w2mmLKsTHwPsYyL7tyuZbkasiKl94xOLrwSFt+B/E=;
 b=L9D6SoHsJAFCBZgFXVzvPWGLkRv077oQep+YjdjKD23mGnN49y/K8o/I13WUl2wiI/8skQ
 cH90rYtWzg50U8Wu8fN3QBllodi6FTP3UsI5GTkV3H1xQOQ33JqnLjScH9QMBYT0o6he6V
 t57h50EjnWP+MFruwZ5zoxx7fdJGe1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695209111;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4w2mmLKsTHwPsYyL7tyuZbkasiKl94xOLrwSFt+B/E=;
 b=4ZaTo8KIZDr9v/zDqTM07omlwfvOO6lOsu2EPKMLDLrzZ22BwHz/rI3Hi3hGjA43F+8PHy
 uB/v2TbOlXkt8WCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29F8B1333E;
 Wed, 20 Sep 2023 11:25:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8JtlCZfWCmX3NwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Sep 2023 11:25:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH 4/8] drm/simpledrm: Preallocate xfrm buffer in plane's
 atomic_check
Date: Wed, 20 Sep 2023 13:10:16 +0200
Message-ID: <20230920112508.11770-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920112508.11770-1-tzimmermann@suse.de>
References: <20230920112508.11770-1-tzimmermann@suse.de>
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

Preallocate the xfrm buffer's storage in the plane's atomic_check
function if a format conversion will be necessary. Allows the update
to fail if no memory is available. Avoids the same allocation within
atomic_update, which may not fail.

Also inline drm_plane_helper_atomic_check() into the driver and thus
return early for invisible planes. Avoids memory allocation entirely
in this case.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 38 +++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 31fc32a00d0a5..8ccd95795ecc8 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -18,6 +18,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_format_helper.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
@@ -478,6 +479,41 @@ static const uint64_t simpledrm_primary_plane_format_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
+						       struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_framebuffer *new_fb = new_plane_state->fb;
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
+	struct drm_device *dev = plane->dev;
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
+	int ret;
+
+	if (new_crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
+
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+	else if (!new_plane_state->visible)
+		return 0;
+
+	if (new_fb->format != sdev->format) {
+		/* format conversion necessary; reserve buffer */
+		void *buf;
+
+		buf = drm_xfrm_buf_reserve(&sdev->xfrm, sdev->pitch, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
 static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 							 struct drm_atomic_state *state)
 {
@@ -534,7 +570,7 @@ static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plan
 
 static const struct drm_plane_helper_funcs simpledrm_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = drm_plane_helper_atomic_check,
+	.atomic_check = simpledrm_primary_plane_helper_atomic_check,
 	.atomic_update = simpledrm_primary_plane_helper_atomic_update,
 	.atomic_disable = simpledrm_primary_plane_helper_atomic_disable,
 };
-- 
2.42.0

