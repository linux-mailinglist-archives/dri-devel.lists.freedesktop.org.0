Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73204698083
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4D710EB24;
	Wed, 15 Feb 2023 16:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6093410EB14
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17890339A3;
 Wed, 15 Feb 2023 16:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgfwC4HTlECoV8bLgLGrSLYiHXhh0M9Td1f5HdAONmY=;
 b=v6Oj3weR/sdlY5Gw6FqpBh26tEvy+tVIoyf+D+N488SSZRmbWumUA0L779LoYuiuX7hp5e
 oPEkQ7OYAbm84chXAIep/kjs3QUEKg5OPQNHDDuCbXRKb8lFmT/ReA9M+OOlvQdTcy3aZH
 yLpIKP/cILPwpk11j4/kI/KEiXRHfxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477729;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgfwC4HTlECoV8bLgLGrSLYiHXhh0M9Td1f5HdAONmY=;
 b=UtYf68N4LlEW+U82nQHR6s9nYB2Ayas/RypHSXdc4sLNp8GI+Mtnv4k6wvoMjZkkIDvwqV
 y2EY9HZzx0quf0BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD5AA134BA;
 Wed, 15 Feb 2023 16:15:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SBCmKSAF7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 13/17] drm/cirrus: Test mode against video-memory size in
 device-wide mode_valid
Date: Wed, 15 Feb 2023 17:15:13 +0100
Message-Id: <20230215161517.5113-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215161517.5113-1-tzimmermann@suse.de>
References: <20230215161517.5113-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test a display mode against the available amount of video memory in
struct drm_mode_config_funcs.mode_valid, which cirrus implements in
cirrus_mode_config_mode_valid(). This helper tests display modes against
device-wide limits. Remove the now-obsolete per-CRTC test.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index c2d7bb775629..6c2be39d79a5 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -419,15 +419,6 @@ static const struct drm_plane_funcs cirrus_primary_plane_funcs = {
 	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
-static enum drm_mode_status cirrus_crtc_helper_mode_valid(struct drm_crtc *crtc,
-							  const struct drm_display_mode *mode)
-{
-	if (cirrus_check_size(mode->hdisplay, mode->vdisplay, NULL) < 0)
-		return MODE_BAD;
-
-	return MODE_OK;
-}
-
 static int cirrus_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
@@ -462,7 +453,6 @@ static void cirrus_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs cirrus_crtc_helper_funcs = {
-	.mode_valid = cirrus_crtc_helper_mode_valid,
 	.atomic_check = cirrus_crtc_helper_atomic_check,
 	.atomic_enable = cirrus_crtc_helper_atomic_enable,
 };
@@ -555,8 +545,21 @@ static int cirrus_pipe_init(struct cirrus_device *cirrus)
 /* ------------------------------------------------------------------ */
 /* cirrus framebuffers & mode config				      */
 
+static enum drm_mode_status cirrus_mode_config_mode_valid(struct drm_device *dev,
+							  const struct drm_display_mode *mode)
+{
+	const struct drm_format_info *format = drm_format_info(DRM_FORMAT_XRGB8888);
+	uint64_t pitch = drm_format_info_min_pitch(format, 0, mode->hdisplay);
+
+	if (pitch * mode->vdisplay > CIRRUS_VRAM_SIZE)
+		return MODE_MEM;
+
+	return MODE_OK;
+}
+
 static const struct drm_mode_config_funcs cirrus_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create_with_dirty,
+	.mode_valid = cirrus_mode_config_mode_valid,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
-- 
2.39.1

