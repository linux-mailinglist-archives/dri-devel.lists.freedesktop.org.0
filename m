Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E85EF72D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 16:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B374B10E3AC;
	Thu, 29 Sep 2022 14:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC47510E3AC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 14:07:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 99B3E1F8B2;
 Thu, 29 Sep 2022 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664460435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YiFWg4Pmfo4LpBOA7ObrqGAy/L/wVbPJZijfHblVTcI=;
 b=15RSfvRFO9GtNxF1vmeh+EAx7P6N7BBQZHbPv44MLsPG/EnZwTj1ajBzQzcUDWKphCp1/9
 HcfFL+eyLSQtepdWc11d7cOGBQI/1E83oS8F5E/FYb3I+BfHzWif1KWRJMJBLVt+UeE24U
 eYVadZjn6MWfhi77O828Zp85yeeSgvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664460435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YiFWg4Pmfo4LpBOA7ObrqGAy/L/wVbPJZijfHblVTcI=;
 b=Sq6YkNatSLaPBKcqieHbUc4Dmo3SpZO7hJyh11zniHT0g9/BUhe002wgptZSrGqeoZz5W4
 OSn1EU9Jz5ULx3Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64BCC13A71;
 Thu, 29 Sep 2022 14:07:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id an23F5OmNWOLOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Sep 2022 14:07:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, daniel@ffwll.ch, airlied@gmail.com,
 ville.syrjala@linux.intel.com, daniel@fooishbar.org, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/atomic-helper: Don't allocated plane state in CRTC check
Date: Thu, 29 Sep 2022 16:07:14 +0200
Message-Id: <20220929140714.14794-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In drm_atomic_helper_check_crtc_state(), do not add a new plane state
to the global state if it does not exist already. Adding a new plane
state will results in overhead for the plane during the atomic-commit
step.

For the test in drm_atomic_helper_check_crtc_state() to succeed, it is
important that the CRTC has an enabled primary plane after the commit.
This can be a newly enabled plane or an already enabled plane. So if a
plane is not part of the commit, use the plane's existing state. The new
helper drm_atomic_get_next_plane_state() returns the correct instance.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: d6b9af1097fe ("drm/atomic-helper: Add helper drm_atomic_helper_check_crtc_state()")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_atomic_helper.c |  4 +---
 include/drm/drm_atomic.h            | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 98cc3137c062..463d4f3fa443 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -960,9 +960,7 @@ int drm_atomic_helper_check_crtc_state(struct drm_crtc_state *crtc_state,
 
 			if (plane->type != DRM_PLANE_TYPE_PRIMARY)
 				continue;
-			plane_state = drm_atomic_get_plane_state(state, plane);
-			if (IS_ERR(plane_state))
-				return PTR_ERR(plane_state);
+			plane_state = drm_atomic_get_next_plane_state(state, plane);
 			if (plane_state->fb && plane_state->crtc) {
 				has_primary_plane = true;
 				break;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 10b1990bc1f6..4006f2d459e3 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -623,6 +623,26 @@ drm_atomic_get_new_plane_state(struct drm_atomic_state *state,
 	return state->planes[drm_plane_index(plane)].new_state;
 }
 
+/**
+ * drm_atomic_get_next_plane_state - get plane state after atomic commit
+ * @state: global atomic state object
+ * @plane: plane to grab
+ *
+ * This function returns the plane state that the given plane will have
+ * after the atomic commit. This will be the new plane state if the plane
+ * is part of the global atomic state, or the current state otherwise.
+ */
+static inline struct drm_plane_state *
+drm_atomic_get_next_plane_state(struct drm_atomic_state *state,
+				struct drm_plane *plane)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+
+	if (plane_state)
+		return plane_state;
+	return plane->state;
+}
+
 /**
  * drm_atomic_get_existing_connector_state - get connector state, if it exists
  * @state: global atomic state object
-- 
2.37.3

