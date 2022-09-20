Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823B65BE7CB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 15:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2ED10E53E;
	Tue, 20 Sep 2022 13:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CACD10E53B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 13:56:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1F3CF21BB3;
 Tue, 20 Sep 2022 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663682182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icOrCD5X5EV4IrRL0T4R+ZbVSraMjCdGQOHCT6Jusig=;
 b=cf3ovlMCREispxE2UBJ2YdSHDub4EVF+ZLW2gZrEXsBOI3XWmXryBtjFfZs8hnW/WGZRhw
 c8rFA25xlFHm+dGmViNkxTgr9UyejDt8vL1fPV9JDDdV8FH1kisAzE8pm9ZdB5rGeApxgY
 KBfbYHlO/Ywe0ZcuJTWxHyJbzznXI9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663682182;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icOrCD5X5EV4IrRL0T4R+ZbVSraMjCdGQOHCT6Jusig=;
 b=aK0cKiU/zOEvDYK3navht0dmkcF7z8mYXvqwGjS2Iccw+UmipqXnq1ZdCuddc7dkN7EJpv
 fChptNzG+mRDuMDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E7EB51346B;
 Tue, 20 Sep 2022 13:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uKu5N4XGKWO9BgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Sep 2022 13:56:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robdclark@gmail.com, drawat.floss@gmail.com
Subject: [PATCH 4/5] drm/damage-helper: Do partial updates if framebuffer has
 not been changed
Date: Tue, 20 Sep 2022 15:56:18 +0200
Message-Id: <20220920135619.9209-5-tzimmermann@suse.de>
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

Set partial updates on a plane if the framebuffer has not been changed
on an atomic commit. If such a plane has damage clips, the driver will
use them; otherwise the update is effectively empty. Planes that change
their framebuffer still perform a full update.

This heuristic optimizes the case of setting a new framebuffer on a
plane. This would trigger a full update of all other planes. With the
new optimization, only the changed plane performs an update.

The commit adds the flag fb_changed to struct plane_state. Besides
the damage-handling code, drivers can look at the flag to determine
if they need to commit a plane's framebuffer settings.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_atomic_helper.c       |  3 +++
 drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
 drivers/gpu/drm/drm_damage_helper.c       | 19 +++++++++++++++----
 include/drm/drm_plane.h                   |  6 ++++++
 4 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ee5fea48b5cb..f19405fbee14 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -99,6 +99,9 @@ drm_atomic_helper_plane_changed(struct drm_atomic_state *state,
 
 		crtc_state->planes_changed = true;
 	}
+
+	if (old_plane_state->fb != plane_state->fb)
+		plane_state->fb_changed = true;
 }
 
 static int handle_conflicting_encoders(struct drm_atomic_state *state,
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 85b13c221bd8..94818fd4dd8f 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -339,6 +339,7 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 	state->commit = NULL;
 	state->fb_damage_clips = NULL;
 	state->fb_damage_partial_update = false;
+	state->fb_changed = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_duplicate_state);
 
diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index a603a3563c03..f43abf02df5b 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -97,11 +97,22 @@ void drm_atomic_helper_check_plane_damage(struct drm_atomic_state *state,
 		}
 	}
 
-	/*
-	 * Damage clips are a good indicator for partial updates.
-	 */
-	if (new_plane_state->fb_damage_clips)
+	if (new_plane_state->fb_damage_clips) {
+		/*
+		 * Damage clips are a good indicator for partial updates.
+		 */
 		partial_update = true;
+	} else if (!new_plane_state->fb_changed) {
+		/*
+		 * Also set a partial update if the framebuffer did not
+		 * change. Without damage clips set, this will effectively
+		 * not update the plane. The exception is with full modeset
+		 * operations, where we do full plane update even if the
+		 * framebuffer did not change. We already handled this case
+		 * earlier in the function.
+		 */
+		partial_update = true;
+	}
 
 out:
 	new_plane_state->fb_damage_partial_update = partial_update;
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 3ba91349d799..8c2d0a2eb760 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -229,6 +229,12 @@ struct drm_plane_state {
 	 */
 	bool visible;
 
+	/**
+	 * @fb_changed: @fb has been changed. Used by the atomic helpers and
+	 * drivers to steer the atomic commit control flow.
+	 */
+	bool fb_changed : 1;
+
 	/**
 	 * @scaling_filter:
 	 *
-- 
2.37.3

