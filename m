Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48AE7FB86B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1259B10E4BB;
	Tue, 28 Nov 2023 10:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E2D10E4B8;
 Tue, 28 Nov 2023 10:47:27 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 293DF21985;
 Tue, 28 Nov 2023 10:47:26 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D90CC13AE2;
 Tue, 28 Nov 2023 10:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id MG3tMz3FZWXpagAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Nov 2023 10:47:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 airlied@gmail.com, suijingfeng@loongson.cn
Subject: [PATCH 1/8] drm/plane-helper: Move drm_plane_helper_atomic_check()
 into udl
Date: Tue, 28 Nov 2023 11:45:17 +0100
Message-ID: <20231128104723.20622-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128104723.20622-1-tzimmermann@suse.de>
References: <20231128104723.20622-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++++++++++
X-Spam-Score: 12.09
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out1.suse.de; dkim=none;
 spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of tzimmermann@suse.de)
 smtp.mailfrom=tzimmermann@suse.de; 
 dmarc=fail reason="No valid SPF,
 No valid DKIM" header.from=suse.de (policy=none)
X-Rspamd-Queue-Id: 293DF21985
X-Spam-Flag: NO
X-Spam-Level: ************
X-Spamd-Result: default: False [12.09 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(4.60)[~all:c];
 RCVD_COUNT_THREE(0.00)[3]; MX_GOOD(-0.01)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,ffwll.ch,gmail.com,loongson.cn]; 
 FROM_EQ_ENVFROM(0.00)[]; R_DKIM_NA(2.20)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_SPAM_LONG(3.50)[1.000]; RCPT_COUNT_TWELVE(0.00)[12];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
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
Cc: dri-devel@lists.freedesktop.org, javierm@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The udl driver is the only caller of drm_plane_helper_atomic_check().
Move the function into the driver. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_plane_helper.c | 32 ------------------------------
 drivers/gpu/drm/udl/udl_modeset.c  | 19 ++++++++++++++++--
 include/drm/drm_plane_helper.h     |  2 --
 3 files changed, 17 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index 5e95089676ff8..7982be4b0306d 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -279,35 +279,3 @@ void drm_plane_helper_destroy(struct drm_plane *plane)
 	kfree(plane);
 }
 EXPORT_SYMBOL(drm_plane_helper_destroy);
-
-/**
- * drm_plane_helper_atomic_check() - Helper to check plane atomic-state
- * @plane: plane to check
- * @state: atomic state object
- *
- * Provides a default plane-state check handler for planes whose atomic-state
- * scale and positioning are not expected to change since the plane is always
- * a fullscreen scanout buffer.
- *
- * This is often the case for the primary plane of simple framebuffers. See
- * also drm_crtc_helper_atomic_check() for the respective CRTC-state check
- * helper function.
- *
- * RETURNS:
- * Zero on success, or an errno code otherwise.
- */
-int drm_plane_helper_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
-{
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
-	struct drm_crtc *new_crtc = new_plane_state->crtc;
-	struct drm_crtc_state *new_crtc_state = NULL;
-
-	if (new_crtc)
-		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
-
-	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
-						   DRM_PLANE_NO_SCALING,
-						   DRM_PLANE_NO_SCALING,
-						   false, false);
-}
-EXPORT_SYMBOL(drm_plane_helper_atomic_check);
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 40876bcdd79a4..7702359c90c22 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -21,7 +21,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -261,6 +260,22 @@ static const uint64_t udl_primary_plane_fmtmods[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+static int udl_primary_plane_helper_atomic_check(struct drm_plane *plane,
+						 struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
+
+	if (new_crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
+
+	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+
 static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						   struct drm_atomic_state *state)
 {
@@ -296,7 +311,7 @@ static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 
 static const struct drm_plane_helper_funcs udl_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = drm_plane_helper_atomic_check,
+	.atomic_check = udl_primary_plane_helper_atomic_check,
 	.atomic_update = udl_primary_plane_helper_atomic_update,
 };
 
diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
index 3a574e8cd22f4..75f9c4830564a 100644
--- a/include/drm/drm_plane_helper.h
+++ b/include/drm/drm_plane_helper.h
@@ -26,7 +26,6 @@
 
 #include <linux/types.h>
 
-struct drm_atomic_state;
 struct drm_crtc;
 struct drm_framebuffer;
 struct drm_modeset_acquire_ctx;
@@ -42,7 +41,6 @@ int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *cr
 int drm_plane_helper_disable_primary(struct drm_plane *plane,
 				     struct drm_modeset_acquire_ctx *ctx);
 void drm_plane_helper_destroy(struct drm_plane *plane);
-int drm_plane_helper_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state);
 
 /**
  * DRM_PLANE_NON_ATOMIC_FUNCS - Default plane functions for non-atomic drivers
-- 
2.43.0

