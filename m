Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309FA6BCB08
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF35D10E085;
	Thu, 16 Mar 2023 09:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8467C10E085;
 Thu, 16 Mar 2023 09:37:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F75121A34;
 Thu, 16 Mar 2023 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678959460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P4+45yeX6O3jYCED5icjNwbPHNm60O7jIw8RP90qA8M=;
 b=a+G1WrAptWuuZpVPBwm56/W1G1bDlsMPpPoVntvaD8Qbn8GVhhXwXvEq2pQNF1l4+tpe3J
 G2VZuXCcYjBrFcB4POssnFaJFUPn8dJiomNxFuCtyk/vPSL8oe0Oz/ld8Zy0qWBLj1oJec
 HbD/VPkiantighzRFYLt2PUGVJgVBmU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678959460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P4+45yeX6O3jYCED5icjNwbPHNm60O7jIw8RP90qA8M=;
 b=7qmWv9OwyiK9uyjakxWE9upi4MZSEU+y7T9mIZB22j17bbnJo+IQughzl9ac1ZnNLJWg3T
 DrYJvOsnCdrxS6CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2665133E0;
 Thu, 16 Mar 2023 09:37:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mKoyOmPjEmSORwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Mar 2023 09:37:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH 01/10] drm/radeon: Move radeon_align_pitch() next to
 dumb-buffer helpers
Date: Thu, 16 Mar 2023 10:37:29 +0100
Message-Id: <20230316093738.28866-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316093738.28866-1-tzimmermann@suse.de>
References: <20230316093738.28866-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move radeon_align_pitch() next to its caller in the dumb-buffer
code. Removes the only dependency on the radeon's fbdev source file
that is not related to fbdev emulation. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon.h      |  2 ++
 drivers/gpu/drm/radeon/radeon_fb.c   | 25 -------------------------
 drivers/gpu/drm/radeon/radeon_gem.c  | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon_mode.h |  2 --
 4 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index d19a4b1c1a8f..8afb03bbce29 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -530,6 +530,8 @@ struct radeon_gem {
 
 extern const struct drm_gem_object_funcs radeon_gem_object_funcs;
 
+int radeon_align_pitch(struct radeon_device *rdev, int width, int cpp, bool tiled);
+
 int radeon_gem_init(struct radeon_device *rdev);
 void radeon_gem_fini(struct radeon_device *rdev);
 int radeon_gem_object_create(struct radeon_device *rdev, unsigned long size,
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index c4807f0c43bc..bbb0de2196d3 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -87,31 +87,6 @@ static const struct fb_ops radeonfb_ops = {
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
 };
 
-
-int radeon_align_pitch(struct radeon_device *rdev, int width, int cpp, bool tiled)
-{
-	int aligned = width;
-	int align_large = (ASIC_IS_AVIVO(rdev)) || tiled;
-	int pitch_mask = 0;
-
-	switch (cpp) {
-	case 1:
-		pitch_mask = align_large ? 255 : 127;
-		break;
-	case 2:
-		pitch_mask = align_large ? 127 : 31;
-		break;
-	case 3:
-	case 4:
-		pitch_mask = align_large ? 63 : 15;
-		break;
-	}
-
-	aligned += pitch_mask;
-	aligned &= ~pitch_mask;
-	return aligned * cpp;
-}
-
 static void radeonfb_destroy_pinned_object(struct drm_gem_object *gobj)
 {
 	struct radeon_bo *rbo = gem_to_radeon_bo(gobj);
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 261fcbae88d7..bdc5af23f005 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -822,6 +822,30 @@ int radeon_gem_op_ioctl(struct drm_device *dev, void *data,
 	return r;
 }
 
+int radeon_align_pitch(struct radeon_device *rdev, int width, int cpp, bool tiled)
+{
+	int aligned = width;
+	int align_large = (ASIC_IS_AVIVO(rdev)) || tiled;
+	int pitch_mask = 0;
+
+	switch (cpp) {
+	case 1:
+		pitch_mask = align_large ? 255 : 127;
+		break;
+	case 2:
+		pitch_mask = align_large ? 127 : 31;
+		break;
+	case 3:
+	case 4:
+		pitch_mask = align_large ? 63 : 15;
+		break;
+	}
+
+	aligned += pitch_mask;
+	aligned &= ~pitch_mask;
+	return aligned * cpp;
+}
+
 int radeon_mode_dumb_create(struct drm_file *file_priv,
 			    struct drm_device *dev,
 			    struct drm_mode_create_dumb *args)
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 3a59d016e8cd..63724ecb8d1b 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -952,8 +952,6 @@ void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id);
 
 void radeon_crtc_handle_flip(struct radeon_device *rdev, int crtc_id);
 
-int radeon_align_pitch(struct radeon_device *rdev, int width, int bpp, bool tiled);
-
 int radeon_atom_pick_dig_encoder(struct drm_encoder *encoder, int fe_idx);
 void radeon_atom_release_dig_encoder(struct radeon_device *rdev, int enc_idx);
 #endif
-- 
2.39.2

