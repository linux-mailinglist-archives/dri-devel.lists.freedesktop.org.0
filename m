Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0752583F12
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 14:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F69B2AB24;
	Thu, 28 Jul 2022 12:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626498FCE1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 12:41:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78B7233771;
 Thu, 28 Jul 2022 12:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659012066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hDyU3QwC02AUA19EV8KhzcAHUxDpwAfnzTGOuuE2KTw=;
 b=AvHBfWSxrVPMF2VNyFS99S79bQ77bAO6RRS7NwK28XzDIZejJgzdcsyos2EmrTYUTcKZz3
 EZIY7RrzC2vTlHovwNU60eyGhOviXxQKEvNQKVjC/wtI7PnoQxQ1I5ymzZRUiYKRkBgRy6
 QKDBFtRyztnIW6l7QOF5aeg5kmbchOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659012066;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hDyU3QwC02AUA19EV8KhzcAHUxDpwAfnzTGOuuE2KTw=;
 b=GQ+VyBBJ+lBefgTO3RcMssy1f6yrFL6Ly6Iet+NZPti7O+3tvzt/Lg9PCoC9hWbGdyBtgR
 +C2pX5RT7Xfpf6BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5290213A7E;
 Thu, 28 Jul 2022 12:41:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wDE8E+KD4mJwMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Jul 2022 12:41:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, sam@ravnborg.org, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 08/14] drm/mgag200: Set SCROFF in primary-plane code
Date: Thu, 28 Jul 2022 14:40:57 +0200
Message-Id: <20220728124103.30159-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728124103.30159-1-tzimmermann@suse.de>
References: <20220728124103.30159-1-tzimmermann@suse.de>
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

v3:
	* only flip SCROFF when enabling/disabling the plane (Jocelyn)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 35 +++++++++++++++-----------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index b524c1c5f032..22f15d4b4ff0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -549,7 +549,7 @@ static void mgag200_g200ev_set_hiprilvl(struct mga_device *mdev)
 
 static void mgag200_enable_display(struct mga_device *mdev)
 {
-	u8 seq0, seq1, crtcext1;
+	u8 seq0, crtcext1;
 
 	RREG_SEQ(0x00, seq0);
 	seq0 |= MGAREG_SEQ0_SYNCRST |
@@ -563,12 +563,6 @@ static void mgag200_enable_display(struct mga_device *mdev)
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
@@ -577,7 +571,7 @@ static void mgag200_enable_display(struct mga_device *mdev)
 
 static void mgag200_disable_display(struct mga_device *mdev)
 {
-	u8 seq0, seq1, crtcext1;
+	u8 seq0, crtcext1;
 
 	RREG_SEQ(0x00, seq0);
 	seq0 &= ~MGAREG_SEQ0_SYNCRST;
@@ -590,12 +584,6 @@ static void mgag200_disable_display(struct mga_device *mdev)
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
@@ -673,6 +661,7 @@ static void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
+	u8 seq1;
 
 	if (!fb)
 		return;
@@ -685,11 +674,27 @@ static void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
 	mgag200_set_offset(mdev, fb);
+
+	if (!old_plane_state->crtc && plane_state->crtc) { // enabling
+		RREG_SEQ(0x01, seq1);
+		seq1 &= ~MGAREG_SEQ1_SCROFF;
+		WREG_SEQ(0x01, seq1);
+		msleep(20);
+	}
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
2.37.1

