Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D4C5BE7C3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 15:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F98E10E1BB;
	Tue, 20 Sep 2022 13:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C928810E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 13:56:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4ABBD1F8A4;
 Tue, 20 Sep 2022 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663682182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWpbxJdjZj3I6P/3PzojlhsAmqlcZnFowe531GaPw3o=;
 b=nhveMQoxrg7nhBwX2gViv+Zx68Fj1opzUH5xV3kieffGUGcQsH33lw2uIXQSwU9eAfIfOp
 YlF19dAFHUntfxc5YUa2CznjRgFPEwo1q8MPRC1EsKxJ5CHCGytDUvIAX6M4CwWnOtaGi4
 g3T+VcD8qsprJhLo4+mEfkFb7g9ArPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663682182;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWpbxJdjZj3I6P/3PzojlhsAmqlcZnFowe531GaPw3o=;
 b=i2LlIQw4N6YepfctQ3MJeOwWvLELe3SXfFSxwzgU6VyNdXJfRTFIgMH22YZWquFnNHzDvH
 5G4dcOrerklmsKAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 20B4413B11;
 Tue, 20 Sep 2022 13:56:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8JkeB4bGKWO9BgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Sep 2022 13:56:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robdclark@gmail.com, drawat.floss@gmail.com
Subject: [PATCH 5/5] drm/damage-helper: Avoid partial updates for DIRTYFB
 without damage
Date: Tue, 20 Sep 2022 15:56:19 +0200
Message-Id: <20220920135619.9209-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920135619.9209-1-tzimmermann@suse.de>
References: <20220920135619.9209-1-tzimmermann@suse.de>
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

Always do a full plane update when userspace sends a DIRTYFB ioctl
without damage information. Userspace not changing the framebuffer
or marking changed regions can easily be interpreted as if there was
no change at all. Therefore set the new fb_dirty flag on all plane's
with a dirty framebuffer and fallback to a full plane update if
necessary.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 1 +
 drivers/gpu/drm/drm_damage_helper.c       | 7 ++++---
 include/drm/drm_plane.h                   | 8 ++++++++
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 94818fd4dd8f..b7523d56b06f 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -340,6 +340,7 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 	state->fb_damage_clips = NULL;
 	state->fb_damage_partial_update = false;
 	state->fb_changed = false;
+	state->fb_dirty = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_duplicate_state);
 
diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index f43abf02df5b..e884987a944c 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -102,10 +102,10 @@ void drm_atomic_helper_check_plane_damage(struct drm_atomic_state *state,
 		 * Damage clips are a good indicator for partial updates.
 		 */
 		partial_update = true;
-	} else if (!new_plane_state->fb_changed) {
+	} else if (!new_plane_state->fb_changed && !new_plane_state->fb_dirty) {
 		/*
-		 * Also set a partial update if the framebuffer did not
-		 * change. Without damage clips set, this will effectively
+		 * Also set a partial update if the framebuffer or its content
+		 * did not change. Without damage clips set, this will effectively
 		 * not update the plane. The exception is with full modeset
 		 * operations, where we do full plane update even if the
 		 * framebuffer did not change. We already handled this case
@@ -214,6 +214,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
 			goto out;
 		}
 
+		plane_state->fb_dirty = true;
 		drm_property_replace_blob(&plane_state->fb_damage_clips,
 					  damage);
 	}
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 8c2d0a2eb760..2b22707eb116 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -235,6 +235,14 @@ struct drm_plane_state {
 	 */
 	bool fb_changed : 1;
 
+	/**
+	 * @fb_dirty: @fb's content has been marked as dirty. Used by the
+	 * atomic helpers and drivers to steer the atomic commit control flow.
+	 * The flag signals that the frambuffer's content has been changed even
+	 * if no damage clips have been installed.
+	 */
+	bool fb_dirty : 1;
+
 	/**
 	 * @scaling_filter:
 	 *
-- 
2.37.3

