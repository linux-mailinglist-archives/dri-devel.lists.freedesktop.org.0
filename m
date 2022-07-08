Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9247156B5B9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7AF1134DC;
	Fri,  8 Jul 2022 09:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AC210FBE9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:39:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 47D0E1FED8;
 Fri,  8 Jul 2022 09:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657273172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IM3P1fhWkxc+X00OzYO0g4An9L5JCiXi4rCo9L6UefM=;
 b=A6AyGQm0e+sCTmK86ZABThtQ4GKRr6Zpm5aQmTu1e5Vq69sp+M1RniVPcSUKALRAEO4y2o
 oAJKx/g1L1cl01F2yaR4mynUtVNYoRZ9VN4whNO2JDhik0z+daU5ajNlWdrlgxd9UxM06a
 vdlelsisMVZbmfF6ao1oeM0wsIvffbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657273172;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IM3P1fhWkxc+X00OzYO0g4An9L5JCiXi4rCo9L6UefM=;
 b=8BD65xYw+OyaO/nKSV05uqmJce9Nse6I1f2xg93JvtkFbV6ZlSyWyjSg46qqPhiXVIrQx6
 8fCRvXC5Q3YIbuAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 251FA13A7D;
 Fri,  8 Jul 2022 09:39:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eFg7CFT7x2J5TwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Jul 2022 09:39:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH 08/14] drm/mgag200: Set SCROFF in primary-plane code
Date: Fri,  8 Jul 2022 11:39:23 +0200
Message-Id: <20220708093929.4446-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708093929.4446-1-tzimmermann@suse.de>
References: <20220708093929.4446-1-tzimmermann@suse.de>
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

The SCROFF bit controls reading the primary plane's scanout buffer
from video memory. Set it from primary-plane code, instead of CRTC
code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 33 ++++++++++++++------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 39509dd84b23..789e02b8615f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -550,7 +550,7 @@ static void mgag200_g200ev_set_hiprilvl(struct mga_device *mdev)
 
 static void mgag200_enable_display(struct mga_device *mdev)
 {
-	u8 seq0, seq1, crtcext1;
+	u8 seq0, crtcext1;
 
 	RREG_SEQ(0x00, seq0);
 	seq0 |= MGAREG_SEQ0_SYNCRST |
@@ -564,12 +564,6 @@ static void mgag200_enable_display(struct mga_device *mdev)
 	mga_wait_vsync(mdev);
 	mga_wait_busy(mdev);
 
-	RREG_SEQ(0x01, seq1);
-	seq1 &= ~MGAREG_SEQ1_SCROFF;
-	WREG_SEQ(0x01, seq1);
-
-	msleep(20);
-
 	RREG_ECRT(0x01, crtcext1);
 	crtcext1 &= ~MGAREG_CRTCEXT1_VSYNCOFF;
 	crtcext1 &= ~MGAREG_CRTCEXT1_HSYNCOFF;
@@ -578,7 +572,7 @@ static void mgag200_enable_display(struct mga_device *mdev)
 
 static void mgag200_disable_display(struct mga_device *mdev)
 {
-	u8 seq0, seq1, crtcext1;
+	u8 seq0, crtcext1;
 
 	RREG_SEQ(0x00, seq0);
 	seq0 &= ~MGAREG_SEQ0_SYNCRST;
@@ -591,12 +585,6 @@ static void mgag200_disable_display(struct mga_device *mdev)
 	mga_wait_vsync(mdev);
 	mga_wait_busy(mdev);
 
-	RREG_SEQ(0x01, seq1);
-	seq1 |= MGAREG_SEQ1_SCROFF;
-	WREG_SEQ(0x01, seq1);
-
-	msleep(20);
-
 	RREG_ECRT(0x01, crtcext1);
 	crtcext1 |= MGAREG_CRTCEXT1_VSYNCOFF |
 		    MGAREG_CRTCEXT1_HSYNCOFF;
@@ -676,6 +664,7 @@ static void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
+	u8 seq1;
 
 	if (!fb)
 		return;
@@ -688,11 +677,25 @@ static void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
 	mgag200_set_offset(mdev, fb);
+
+	RREG_SEQ(0x01, seq1);
+	seq1 &= ~MGAREG_SEQ1_SCROFF;
+	WREG_SEQ(0x01, seq1);
+	msleep(20);
 }
 
 static void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 							struct drm_atomic_state *old_state)
-{ }
+{
+	struct drm_device *dev = plane->dev;
+	struct mga_device *mdev = to_mga_device(dev);
+	u8 seq1;
+
+	RREG_SEQ(0x01, seq1);
+	seq1 |= MGAREG_SEQ1_SCROFF;
+	WREG_SEQ(0x01, seq1);
+	msleep(20);
+}
 
 static const struct drm_plane_helper_funcs mgag200_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-- 
2.36.1

