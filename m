Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FA0577E9C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 11:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D1811BABE;
	Mon, 18 Jul 2022 09:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5214C1124FE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 09:27:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 797CB37428;
 Mon, 18 Jul 2022 09:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658136476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOK1Jtsofo9S2aJKz5WhPzfI6ANHoPVVAZFwEfPYEmY=;
 b=lp35ZN7kz7uYGoPCcc5fUyo2VaLJ4/lVNFjWUsCoQfNjDh0RVNVTsdQbU1rdYZI+ScwNuU
 vZDJUWFWjcroE/AkrQk1bxysGe1l+HDFWMwhyko3nMeMehAbvy8NTRdBf37GkuO0kICL7r
 Mz+pMvO/ZLcffQY8Djp5QhhiTm2hJlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658136476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOK1Jtsofo9S2aJKz5WhPzfI6ANHoPVVAZFwEfPYEmY=;
 b=MGSrPF5ws/o8cVlipoKGn8pvrqUDVk6q7QBh132RgNII+uu53CY+j94FtSkuCg5rlT8bVd
 dgmTOZmkTjKzZuDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5425C13AB4;
 Mon, 18 Jul 2022 09:27:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EAe3E5wn1WJ6LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 09:27:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, airlied@redhat.com, airlied@linux.ie,
 jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH v2 08/14] drm/mgag200: Set SCROFF in primary-plane code
Date: Mon, 18 Jul 2022 11:27:47 +0200
Message-Id: <20220718092753.9598-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718092753.9598-1-tzimmermann@suse.de>
References: <20220718092753.9598-1-tzimmermann@suse.de>
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
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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

