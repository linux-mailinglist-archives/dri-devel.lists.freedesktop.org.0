Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCA2690D38
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5BB10EB2A;
	Thu,  9 Feb 2023 15:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83A610E20D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 15:41:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6759A3763F;
 Thu,  9 Feb 2023 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675957270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a0sW0sk1bF24mD6WoKzz5Ym0vymRE4dvpBxtBJdeiCo=;
 b=JLS1ExCZeYOO6DTQt18h7jtaZGqUn2CLcJm7NUSd/pSL6OtSs4vmRTWh162+w4Nl96A4O9
 X0W2pdFvYmXPXws3CgUKxm0sww5i0vnqayszUmE7Nuj5CSKQ4NbUzRHJ5XyWMhQZ5cgr7c
 WDqxFMvAinqiq6r0ZvA+6P5U1lwin0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675957270;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a0sW0sk1bF24mD6WoKzz5Ym0vymRE4dvpBxtBJdeiCo=;
 b=t4u1HRPn3EBWusuV2LXHxeaSdQA7RMhB2jX2D0FHydbkNu31q1RRhk9mjsEiPUw+3xp+By
 CELmjwzPnB1A8LAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3DA641339E;
 Thu,  9 Feb 2023 15:41:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sChVDhYU5WM5PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 15:41:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, jyri.sarha@iki.fi,
 tomba@kernel.org
Subject: [PATCH 4/6] drm/mgag200: Implement struct
 drm_plane_helper_funcs.atomic_enable
Date: Thu,  9 Feb 2023 16:41:05 +0100
Message-Id: <20230209154107.30680-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209154107.30680-1-tzimmermann@suse.de>
References: <20230209154107.30680-1-tzimmermann@suse.de>
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

Enable the primary plane for mgag200 hardware via atomic_enable.
Atomic helpers invoke this callback only when the plane becomes
active.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  3 +++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 19 ++++++++++++-------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 9e604dbb8e44..57c7edcab602 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -375,12 +375,15 @@ int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
 					      struct drm_atomic_state *new_state);
 void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						struct drm_atomic_state *old_state);
+void mgag200_primary_plane_helper_atomic_enable(struct drm_plane *plane,
+						struct drm_atomic_state *state);
 void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 						 struct drm_atomic_state *old_state);
 #define MGAG200_PRIMARY_PLANE_HELPER_FUNCS \
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS, \
 	.atomic_check = mgag200_primary_plane_helper_atomic_check, \
 	.atomic_update = mgag200_primary_plane_helper_atomic_update, \
+	.atomic_enable = mgag200_primary_plane_helper_atomic_enable, \
 	.atomic_disable = mgag200_primary_plane_helper_atomic_disable
 
 #define MGAG200_PRIMARY_PLANE_FUNCS \
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 47e86eadb239..0f2dd26755df 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -501,7 +501,6 @@ void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
-	u8 seq1;
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
@@ -511,13 +510,19 @@ void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
 	mgag200_set_offset(mdev, fb);
+}
 
-	if (!old_plane_state->crtc && plane_state->crtc) { // enabling
-		RREG_SEQ(0x01, seq1);
-		seq1 &= ~MGAREG_SEQ1_SCROFF;
-		WREG_SEQ(0x01, seq1);
-		msleep(20);
-	}
+void mgag200_primary_plane_helper_atomic_enable(struct drm_plane *plane,
+						struct drm_atomic_state *state)
+{
+	struct drm_device *dev = plane->dev;
+	struct mga_device *mdev = to_mga_device(dev);
+	u8 seq1;
+
+	RREG_SEQ(0x01, seq1);
+	seq1 &= ~MGAREG_SEQ1_SCROFF;
+	WREG_SEQ(0x01, seq1);
+	msleep(20);
 }
 
 void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
-- 
2.39.1

