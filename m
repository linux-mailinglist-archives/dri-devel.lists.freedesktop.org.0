Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EECCB54F561
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 12:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA51311A7B4;
	Fri, 17 Jun 2022 10:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C4111A77E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:32:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8D73321D63;
 Fri, 17 Jun 2022 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655461950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJKxTomsempmwmS18VMBwvUuhcDf+wdGhQP+ThSJP24=;
 b=RsX1/ZVZ+YOMate5qM14qUTfNcXyA4bCxaKEgJHoUsGv7xVWbELCwR6oLYbgMEBRAUkOnm
 aPm8D2On4tnIXxeLVSN3h0vF2xim82xo7ylhuTv4H7YWczygJv0f/L8Fjksd1VHqLKC2FZ
 s7/9v6poBqnuFa0diGY//Kk8ck8MHTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655461950;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJKxTomsempmwmS18VMBwvUuhcDf+wdGhQP+ThSJP24=;
 b=+1sJiRibADyo2kZbrQ6tNjAvF360w5SqyMc+zbwnkGBF17KScQE1QeAMFEOwblv2s8UQY+
 bSk/E68+cr9LXqDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58D811348F;
 Fri, 17 Jun 2022 10:32:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OFSqFD5YrGKeSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jun 2022 10:32:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, javierm@redhat.com,
 noralf@tronnes.org, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Subject: [PATCH 1/3] drm/atomic-helper: Add helper
 drm_atomic_helper_check_crtc_state()
Date: Fri, 17 Jun 2022 12:32:24 +0200
Message-Id: <20220617103226.25617-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220617103226.25617-1-tzimmermann@suse.de>
References: <20220617103226.25617-1-tzimmermann@suse.de>
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

Add drm_atomic_helper_check_crtc_state(), which contains tests common
to many CRTCs. The first added test verifies that an enabled CRTC has
at least one enabled primary plane.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_atomic_helper.c | 55 +++++++++++++++++++++++++++++
 include/drm/drm_atomic_helper.h     |  2 ++
 2 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 987e4b212e9f..329d8a3c3d65 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -875,6 +875,61 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 }
 EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);
 
+/**
+ * drm_atomic_helper_check_crtc_state() - Check CRTC state for validity
+ * @crtc_state: CRTC state to check
+ * @can_disable_primary_planes: can the CRTC be enabled without a primary plane?
+ *
+ * Checks that a desired CRTC update is valid. Drivers that provide
+ * their own CRTC handling rather than helper-provided implementations may
+ * still wish to call this function to avoid duplication of error checking
+ * code.
+ *
+ * Note that @can_disable_primary_planes only tests if the CRTC can be
+ * enabled without a primary plane. To test if a primary plane can be updated
+ * without a CRTC, use drm_atomic_helper_check_plane_state() in the plane's
+ * atomic check.
+ *
+ * RETURNS:
+ * Zero if update appears valid, error code on failure
+ */
+int drm_atomic_helper_check_crtc_state(struct drm_crtc_state *crtc_state,
+				       bool can_disable_primary_planes)
+{
+	struct drm_device *dev = crtc_state->crtc->dev;
+	struct drm_atomic_state *state = crtc_state->state;
+
+	if (!crtc_state->enable)
+		return 0;
+
+	/* needs at least one primary plane to be enabled */
+	if (!can_disable_primary_planes) {
+		bool has_primary_plane = false;
+		struct drm_plane *plane;
+
+		drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
+			struct drm_plane_state *plane_state;
+
+			if (plane->type != DRM_PLANE_TYPE_PRIMARY)
+				continue;
+			plane_state = drm_atomic_get_plane_state(state, plane);
+			if (IS_ERR(plane_state))
+				return PTR_ERR(plane_state);
+			if (plane_state->fb && plane_state->crtc) {
+				has_primary_plane = true;
+				break;
+			}
+		}
+		if (!has_primary_plane) {
+			drm_dbg_kms(dev, "Cannot enable CRTC without a primary plane.\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_check_crtc_state);
+
 /**
  * drm_atomic_helper_check_planes - validate state object for planes changes
  * @dev: DRM device
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 4045e2507e11..2a0b17842402 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -46,6 +46,8 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					int max_scale,
 					bool can_position,
 					bool can_update_disabled);
+int drm_atomic_helper_check_crtc_state(struct drm_crtc_state *crtc_state,
+				       bool can_disable_primary_plane);
 int drm_atomic_helper_check_planes(struct drm_device *dev,
 			       struct drm_atomic_state *state);
 int drm_atomic_helper_check(struct drm_device *dev,
-- 
2.36.1

