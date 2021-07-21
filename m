Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2A33D0F8E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 15:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDEE6EB36;
	Wed, 21 Jul 2021 13:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246436E846
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:30:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c15so2213630wrs.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 06:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ORhPItfkMHUiju+HLIzApTY9RhBe7pUyzlHN/iorEkY=;
 b=HsGpjM/KTxfUKKVUCpywVTiXGD1uyNH6hQu01j26tWbEllvcwN+dVQYJW1F2T+ciRs
 U8nwwfPdfn4jgx8bfsi62k+pPyjqgl3Uu7NQvpdTQzWPFzSBEpFtDVX1lgkHU5r7PGZF
 QW57tDSxPaBaWsIgjPSHJ/155Ss0H6xeK5vIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ORhPItfkMHUiju+HLIzApTY9RhBe7pUyzlHN/iorEkY=;
 b=ALPpX2TGuuc7QCvbz1XrwwYVhcVbTZtFwxz5kgW08F1g9Bd/QI2DkIAZTzVVa/QLaC
 9Jwcv3gGvdvAKxMUDUPKiK77blS1YMsLevN7N2yDDfGtBRXi2P0r5tHagIrZTCfSNw8H
 IIzT6ILxqn1oVMsyqRqHRVR3Fm24r33Fdgv5yW+NlP1MDxOT0NrtnW1x5pw63LCfWOCG
 M8OqmPHnIkQWUCrSRCOIzW2/cee9xgBJCrmopLYuYLXPucdyoy0gQtvbgQ/8zldK2riF
 mXxz/e4R1gXWyA/eA2JBJ1oVv6Dlak+jP4+y7pEtcpJcS9rQhyxBoPuQcDnYCDHqKSRk
 U+Eg==
X-Gm-Message-State: AOAM531eGyqb4AriQxzEBRU1xzHRNcCLNGzGSxx3vFQvcCocXhc/jD9j
 rbU4kSBJUC+YeRC2qhjZC7K1kgyL2tj4cA==
X-Google-Smtp-Source: ABdhPJxJJpAACdYy+t1JTf1gQNQ+DM1VmV+HM9GzTis6ajlcYCCaeNM5qGdtyJ4W6E7QEddJCVqeHA==
X-Received: by 2002:a5d:4e0d:: with SMTP id p13mr42754262wrt.372.1626874221789; 
 Wed, 21 Jul 2021 06:30:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l22sm4962624wmp.41.2021.07.21.06.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 06:30:21 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/plane: check that fb_damage is set up when used
Date: Wed, 21 Jul 2021 15:30:13 +0200
Message-Id: <20210721133014.3880922-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721133014.3880922-1-daniel.vetter@ffwll.ch>
References: <20210721133014.3880922-1-daniel.vetter@ffwll.ch>
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

There's two stages of manual upload/invalidate displays:
- just handling dirtyfb and uploading the entire fb all the time
- looking at damage clips

In the latter case we support it through fbdev emulation (with
fb_defio), atomic property, and with the dirtfy clip rects.

Make sure at least the atomic property is set up as the main official
interface for this. Ideally we'd also check that
drm_atomic_helper_dirtyfb() is used and that fbdev defio is set up,
but that's quite a bit harder to do. Ideas very much welcome.

From a cursor audit drivers seem to be getting this right mostly, but
better to make sure. At least no one is bypassing the accessor
function.

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
 drivers/gpu/drm/drm_plane.c | 42 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_plane.h     | 36 ++++---------------------------
 2 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index b373958ecb30..40f099c67a8d 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1397,6 +1397,48 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 	return ret;
 }
 
+/**
+ * drm_plane_get_damage_clips_count - Returns damage clips count.
+ * @state: Plane state.
+ *
+ * Simple helper to get the number of &drm_mode_rect clips set by user-space
+ * during plane update.
+ *
+ * Return: Number of clips in plane fb_damage_clips blob property.
+ */
+unsigned int
+drm_plane_get_damage_clips_count(const struct drm_plane_state *state)
+{
+	return (state && state->fb_damage_clips) ?
+		state->fb_damage_clips->length/sizeof(struct drm_mode_rect) : 0;
+}
+EXPORT_SYMBOL(drm_plane_get_damage_clips_count);
+
+/**
+ * drm_plane_get_damage_clips - Returns damage clips.
+ * @state: Plane state.
+ *
+ * Note that this function returns uapi type &drm_mode_rect. Drivers might want
+ * to use the helper functions drm_atomic_helper_damage_iter_init() and
+ * drm_atomic_helper_damage_iter_next() or drm_atomic_helper_damage_merged() if
+ * the driver can only handle a single damage region at most.
+ *
+ * Return: Damage clips in plane fb_damage_clips blob property.
+ */
+struct drm_mode_rect *
+drm_plane_get_damage_clips(const struct drm_plane_state *state)
+{
+	struct drm_mode_config *config = &state->plane->dev->mode_config;
+
+	/* check that drm_plane_enable_fb_damage_clips() was called */
+	WARN_ON_ONCE(!drm_mode_obj_find_prop_id(&state->plane->base,
+						config->prop_fb_damage_clips->base.id));
+
+	return (struct drm_mode_rect *)((state && state->fb_damage_clips) ?
+					state->fb_damage_clips->data : NULL);
+}
+EXPORT_SYMBOL(drm_plane_get_damage_clips);
+
 struct drm_property *
 drm_create_scaling_filter_prop(struct drm_device *dev,
 			       unsigned int supported_filters)
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 7f7d5148310c..a2684aab8372 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -897,39 +897,11 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
 
 bool drm_any_plane_has_format(struct drm_device *dev,
 			      u32 format, u64 modifier);
-/**
- * drm_plane_get_damage_clips_count - Returns damage clips count.
- * @state: Plane state.
- *
- * Simple helper to get the number of &drm_mode_rect clips set by user-space
- * during plane update.
- *
- * Return: Number of clips in plane fb_damage_clips blob property.
- */
-static inline unsigned int
-drm_plane_get_damage_clips_count(const struct drm_plane_state *state)
-{
-	return (state && state->fb_damage_clips) ?
-		state->fb_damage_clips->length/sizeof(struct drm_mode_rect) : 0;
-}
+unsigned int
+drm_plane_get_damage_clips_count(const struct drm_plane_state *state);
 
-/**
- * drm_plane_get_damage_clips - Returns damage clips.
- * @state: Plane state.
- *
- * Note that this function returns uapi type &drm_mode_rect. Drivers might want
- * to use the helper functions drm_atomic_helper_damage_iter_init() and
- * drm_atomic_helper_damage_iter_next() or drm_atomic_helper_damage_merged() if
- * the driver can only handle a single damage region at most.
- *
- * Return: Damage clips in plane fb_damage_clips blob property.
- */
-static inline struct drm_mode_rect *
-drm_plane_get_damage_clips(const struct drm_plane_state *state)
-{
-	return (struct drm_mode_rect *)((state && state->fb_damage_clips) ?
-					state->fb_damage_clips->data : NULL);
-}
+struct drm_mode_rect *
+drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
 int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 					     unsigned int supported_filters);
-- 
2.32.0

