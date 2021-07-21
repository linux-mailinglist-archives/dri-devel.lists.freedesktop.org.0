Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8207C3D0F8C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 15:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A5B6E846;
	Wed, 21 Jul 2021 13:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4786E846
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:30:22 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c12so2218767wrt.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IyxeG2tnI2CH5gM4uZUs6gMfP+rEQXF6ng29QO5KRzc=;
 b=MeWDqUfn8NArFKRmYa5B3q5JAZQLVYFhhJBfQVfIRBSYyMe1wfi4cMHwlJxEH6nhq2
 fR5ynA4F6S9sC67T8pJ+RGU+s/SjECINcx3FQeX4W4Hm6ZFzrmhCEINeJJY8YAFcb59e
 nr3he5Oc5jTXPmWzMG4X0LzOyUEkyhNmJWlHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IyxeG2tnI2CH5gM4uZUs6gMfP+rEQXF6ng29QO5KRzc=;
 b=s3UuJ6rUKiXW1DLIJ0u3Sj/W4wWWTPkTh7jgSQPYTaYQ7FQvvAMlbqPjJ6EQLIBJEY
 0xsSgO2lt7rxc71gtJOJWBDa66AJPnAycnuciVCTBjyZNIYBcfgEEdKWeeQse8BG19bL
 sCpF+Qnr/RTMEHsUrlIWzGUMQT+D8AAVk4ATe29E/tdOio28QlfxgUE0/9u8OTW8m8Fl
 axTzYyhEJdfACYMWOHOhrtpkacfsRGKWL/MbYLb/vEWDJ4X+NYobDZuoJ5SjF1GY+X12
 hMuqv5cZMAhPkQs7XhLMgp/hsGk8GYmMjAYRAsLXLzB+2fa2hY8iaL/W/BqPwUQRUq/x
 aaqQ==
X-Gm-Message-State: AOAM5336f1rFU3v3lVICvxv5wlAdCoGt+hNQxGsPHdxp5D98kO/j5E3X
 iVID7UL0OqZwjkjfByAtHTdupFNkZalzJQ==
X-Google-Smtp-Source: ABdhPJxVbshTi8NLVspnlyjvcQgn/GOhfr71SqeDmEMHvQPIDEPtvpY6nTCavvLNo/FS0SASgY3Z1Q==
X-Received: by 2002:a5d:64e8:: with SMTP id g8mr44658834wri.140.1626874220920; 
 Wed, 21 Jul 2021 06:30:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l22sm4962624wmp.41.2021.07.21.06.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 06:30:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/plane: remove drm_helper_get_plane_damage_clips
Date: Wed, 21 Jul 2021 15:30:12 +0200
Message-Id: <20210721133014.3880922-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's not used. Drivers should instead use the helpers anyway.

Currently both vbox and i915 hand-roll this and it's not the greatest.
vbox looks buggy, and i915 does a bit much that helpers would take
care of I think.

Also improve the kerneldocs while we're at it.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_damage_helper.c |  2 +-
 include/drm/drm_damage_helper.h     | 17 -----------------
 include/drm/drm_plane.h             | 10 +++++++---
 include/drm/drm_rect.h              |  3 +++
 4 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index 3a4126dc2520..eb69b7123af5 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -282,7 +282,7 @@ drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
 	if (!state || !state->crtc || !state->fb || !state->visible)
 		return;
 
-	iter->clips = drm_helper_get_plane_damage_clips(state);
+	iter->clips = (struct drm_rect *)drm_plane_get_damage_clips(state);
 	iter->num_clips = drm_plane_get_damage_clips_count(state);
 
 	/* Round down for x1/y1 and round up for x2/y2 to catch all pixels */
diff --git a/include/drm/drm_damage_helper.h b/include/drm/drm_damage_helper.h
index 40c34a5bf149..1ae8bce6a5ce 100644
--- a/include/drm/drm_damage_helper.h
+++ b/include/drm/drm_damage_helper.h
@@ -82,21 +82,4 @@ bool drm_atomic_helper_damage_merged(const struct drm_plane_state *old_state,
 				     struct drm_plane_state *state,
 				     struct drm_rect *rect);
 
-/**
- * drm_helper_get_plane_damage_clips - Returns damage clips in &drm_rect.
- * @state: Plane state.
- *
- * Returns plane damage rectangles in internal &drm_rect. Currently &drm_rect
- * can be obtained by simply typecasting &drm_mode_rect. This is because both
- * are signed 32 and during drm_atomic_check_only() it is verified that damage
- * clips are inside fb.
- *
- * Return: Clips in plane fb_damage_clips blob property.
- */
-static inline struct drm_rect *
-drm_helper_get_plane_damage_clips(const struct drm_plane_state *state)
-{
-	return (struct drm_rect *)drm_plane_get_damage_clips(state);
-}
-
 #endif
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 1294610e84f4..7f7d5148310c 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -186,6 +186,9 @@ struct drm_plane_state {
 	 * since last plane update) as an array of &drm_mode_rect in framebuffer
 	 * coodinates of the attached framebuffer. Note that unlike plane src,
 	 * damage clips are not in 16.16 fixed point.
+	 *
+	 * See drm_plane_get_damage_clips() and
+	 * drm_plane_get_damage_clips_count() for accessing these.
 	 */
 	struct drm_property_blob *fb_damage_clips;
 
@@ -914,9 +917,10 @@ drm_plane_get_damage_clips_count(const struct drm_plane_state *state)
  * drm_plane_get_damage_clips - Returns damage clips.
  * @state: Plane state.
  *
- * Note that this function returns uapi type &drm_mode_rect. Drivers might
- * instead be interested in internal &drm_rect which can be obtained by calling
- * drm_helper_get_plane_damage_clips().
+ * Note that this function returns uapi type &drm_mode_rect. Drivers might want
+ * to use the helper functions drm_atomic_helper_damage_iter_init() and
+ * drm_atomic_helper_damage_iter_next() or drm_atomic_helper_damage_merged() if
+ * the driver can only handle a single damage region at most.
  *
  * Return: Damage clips in plane fb_damage_clips blob property.
  */
diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
index 39f2deee709c..6f6e19bd4dac 100644
--- a/include/drm/drm_rect.h
+++ b/include/drm/drm_rect.h
@@ -39,6 +39,9 @@
  * @x2: horizontal ending coordinate (exclusive)
  * @y1: vertical starting coordinate (inclusive)
  * @y2: vertical ending coordinate (exclusive)
+ *
+ * Note that this must match the layout of struct drm_mode_rect or the damage
+ * helpers like drm_atomic_helper_damage_iter_init() break.
  */
 struct drm_rect {
 	int x1, y1, x2, y2;
-- 
2.32.0

