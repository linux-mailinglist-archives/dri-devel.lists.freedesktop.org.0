Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5981698084
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386EA10EB23;
	Wed, 15 Feb 2023 16:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CA410EB1A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A837339A4;
 Wed, 15 Feb 2023 16:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7I5MfF11ud5D261yH0s5T+3bBpyxJvygQrUk7F9YTRw=;
 b=ZO5W9vun+atawyeqvjx1FRhg2hZkh0RM0x4jEiYMh52WzELO5VhkvDDQpohK4Os7FWKnPl
 9i2e3IFOxLQ3rpj4sfTPOGJEoGJlUBsWKF+NO8/obutiRnQUrUEBONyMmzmP9aM7qDpSOq
 DfOomrtTLtDHodAaRpru8fRuLfMvv2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477729;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7I5MfF11ud5D261yH0s5T+3bBpyxJvygQrUk7F9YTRw=;
 b=kEDwPgXen3eY7JkPgtj6SJjqbrtl4HvKSxBUtJDbWl0swFb4lTDdJtgkQgEH2H2OR7rN3a
 q/vM2CwPRBCDqGBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2BE05134BA;
 Wed, 15 Feb 2023 16:15:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WJmvCSEF7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 14/17] drm/cirrus: Inline cirrus_check_size() into
 primary-plane atomic_check
Date: Wed, 15 Feb 2023 17:15:14 +0100
Message-Id: <20230215161517.5113-15-tzimmermann@suse.de>
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

Inline the framebuffer size check into the primary plane's atomic_check
cirrus_primary_plane_atomic_check(). No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 6c2be39d79a5..8a1ae94d9106 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -317,21 +317,6 @@ static void cirrus_pitch_set(struct cirrus_device *cirrus,
 	cirrus_set_start_address(cirrus, 0);
 }
 
-static int cirrus_check_size(int width, int height,
-			     struct drm_framebuffer *fb)
-{
-	int pitch = width * 2;
-
-	if (fb)
-		pitch = cirrus_pitch(fb);
-
-	if (pitch > CIRRUS_MAX_PITCH)
-		return -EINVAL;
-	if (pitch * height > CIRRUS_VRAM_SIZE)
-		return -EINVAL;
-	return 0;
-}
-
 /* ------------------------------------------------------------------ */
 /* cirrus display pipe						      */
 
@@ -354,6 +339,7 @@ static int cirrus_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	struct drm_crtc *new_crtc = new_plane_state->crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
 	int ret;
+	unsigned int pitch;
 
 	if (new_crtc)
 		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
@@ -367,7 +353,15 @@ static int cirrus_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	else if (!new_plane_state->visible)
 		return 0;
 
-	return cirrus_check_size(fb->width, fb->height, fb);
+	pitch = cirrus_pitch(fb);
+
+	/* validate size constraints */
+	if (pitch > CIRRUS_MAX_PITCH)
+		return -EINVAL;
+	else if (pitch * fb->height > CIRRUS_VRAM_SIZE)
+		return -EINVAL;
+
+	return 0;
 }
 
 static void cirrus_primary_plane_helper_atomic_update(struct drm_plane *plane,
-- 
2.39.1

