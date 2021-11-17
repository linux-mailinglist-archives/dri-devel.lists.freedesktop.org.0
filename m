Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AC045486C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C346E4B1;
	Wed, 17 Nov 2021 14:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284F66E491
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:19:44 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u1so4985848wru.13
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QPpWi6BwPx2mscCj65VKGDwuScaYCJ38/JnfAWsKtWA=;
 b=nJ1IGc7Ce8BzNwzC03cZxMSWnP0omMpEkkN/vysetw4X1xf8HI1GYDRHtM0Sk6sY8t
 rb6pUPvoBmbIRhqZAWE0q7pjzxW+efwfjRFndQSls53lgSgKwR3E9mFdkz4nm56Hc9hd
 Q99tiCVKo4dT1lZp+snra2gzZLLBtdFALlWhdNPchQXJ7sHFzg4u4YD/fhcQwW+7VgVn
 Hju3jvIpwVMaEaQ3G3j0QaIf6pBAy0cChDFsS8aLXqQMpG7+F6qMReM1nDhXKOvp1SrW
 PJuwoGyjvzd45MSjj3VAdXUaJm/7GQKVMTGGyXlUomJbRDtDcpHfLCMZ7TCEl8xq8BuB
 RmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QPpWi6BwPx2mscCj65VKGDwuScaYCJ38/JnfAWsKtWA=;
 b=Uzztzjs7M/e6/Um60N6SCgpRse7WSWik6lqaUg/xPT3vQHiQdpsCfluvLyq6jqNGyg
 O3pxt9GhvRcH+xSmOTtadVxNpBCY8bg7ft0hW5Aod10EbRG9Y1H9jVr8IxX1LtEY297u
 MmQZVJas2IHs4B2bO48f3/Mo7kU8QAkj6OhL4As2EAvL/Xi0YzgAvls/u9baQaAzuCId
 50bamUDuYvFSBVcjGZ7qY8cqTYgzOUF0aG6GyknJtTUnbeA892RaZ8AfhVpt7sfxLsOW
 xSvKhohr3fBypLDRVpto1E5eg9/Hov6zRzDjhokeAHNFLDoD+LtxSgH8uj0Mz8pPKmLW
 1YMg==
X-Gm-Message-State: AOAM533MMR9CiqOJb4FQikwA8f/FIk5RAe39Fx9UeVa1fTxYDEK4aoxX
 TsDHYqgNwA7d5qEyoONpp8dJkg==
X-Google-Smtp-Source: ABdhPJy/37kC0ngGwIZLyC8Dv6gu+zwPo38T+7PnRBcz4r5W1DlGtjtFrRLmB21G0QKZMvM53AGsvA==
X-Received: by 2002:a5d:4492:: with SMTP id j18mr21256967wrq.397.1637158782387; 
 Wed, 17 Nov 2021 06:19:42 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f98b:434c:566c:492d])
 by smtp.gmail.com with ESMTPSA id o10sm33803wri.15.2021.11.17.06.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 06:19:41 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Subject: [PATCH v7 9/9] drm/omap: Add a 'right overlay' to plane state
Date: Wed, 17 Nov 2021 15:19:28 +0100
Message-Id: <20211117141928.771082-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117141928.771082-1-narmstrong@baylibre.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18783;
 i=narmstrong@baylibre.com; 
 h=from:subject; bh=29wscSk13dUIY++8rw7N2jgrpwm2DqCcLw9Je5vimkQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhlQ9M+kYNmtrzBUBtYIYyuzF6Bqdh1Hl2TsypdMap
 Ht/3VXyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYZUPTAAKCRB33NvayMhJ0UFSD/
 9L1pFQrg8DWVxikubWb2lkD3zJ+440I1vtb2BPiwqCBcMW5Tj/GQ9bjh3kN/O3xCzDUtojg1cl23R+
 3mH3BkFZyZTPf9fwqVLSnToCc6V/o62CsW+r4eoHeQ2PPxpeH6vA0ebKk532RbBR31ijp4lHCDI8Fj
 184LCQBHORR9Alqg4bvl/RfoXpcQVw05Szaj9BxgRc1SP6ufQn9tUULyQlCHZ4gI4UL2MbtFvhYcn5
 QImahQtvzvhViPQe1RVQeRMrfGxG6mIavrhQH1VEFRM+IzALmawr6AqtwofXcx0fzRtEn4/aUmWy8B
 M854HAiZQNMBhEqT66K5m6b6GZygR9yuA7YiYezdaTRpdRhv3yW4T0TsMBez5qqO6D8D/kMCmne7UI
 stvHLnj5tJov5rKEG9yTjC5yMLmkcTcit/LhFIyKhLbosI3DhM6yOZlm/Br6TWyTWbLgJT+3kB/3e9
 20T7RyclXl+kqcjqOZHbjGvhElrXbP3GbILyhi+tZ/NjjM68lZMB7QLBvzzW29X0ZdysYU6XvtdjPq
 4Kw96u2G/lfGVVC39w4ko2qAa/LTZ0YwBPMzfUIu1FBosJW5LTmn8X3IRFuHuFt/YzCyfkGIegyPrW
 vzulf0uKjNW9udGVDOAKJBTFdq7NSW5m3HVjNrg3vNr4rsaMWVW+czExoXOg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Benoit Parrot <bparrot@ti.com>

If the drm_plane has a source width that's greater than the max width
supported by a single hw overlay, then we assign a 'r_overlay' to it in
omap_plane_atomic_check().

Both overlays should have the capabilities required to handle the source
framebuffer. The only parameters that vary between the left and right
hwoverlays are the src_w, crtc_w, src_x and crtc_x as we just even chop
the fb into left and right halves.

We also take care of not creating odd width size when dealing with YUV
formats.

Since both halves need to be 'appear' side by side the zpos is
recalculated when dealing with dual overlay cases so that the other
planes zpos is consistent.

Depending on user space usage it is possible that on occasion the number
of requested planes exceeds the numbers of overlays required to display
them. In that case a failure would be returned for the plane that cannot
be handled at that time. It is up to user space to make sure the H/W
resource are not over-subscribed.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c     |  98 ++++++++++++++++++++-
 drivers/gpu/drm/omapdrm/omap_fb.c      |  33 ++++++-
 drivers/gpu/drm/omapdrm/omap_fb.h      |   4 +-
 drivers/gpu/drm/omapdrm/omap_overlay.c |  23 ++++-
 drivers/gpu/drm/omapdrm/omap_overlay.h |   3 +-
 drivers/gpu/drm/omapdrm/omap_plane.c   | 117 +++++++++++++++++++++++--
 drivers/gpu/drm/omapdrm/omap_plane.h   |   1 +
 7 files changed, 267 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 44a9dcb3100c..2720a58ccd90 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -117,6 +117,102 @@ static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
 	dispc_runtime_put(priv->dispc);
 }
 
+static int drm_atomic_state_normalized_zpos_cmp(const void *a, const void *b)
+{
+	const struct drm_plane_state *sa = *(struct drm_plane_state **)a;
+	const struct drm_plane_state *sb = *(struct drm_plane_state **)b;
+
+	if (sa->normalized_zpos != sb->normalized_zpos)
+		return sa->normalized_zpos - sb->normalized_zpos;
+	else
+		return sa->plane->base.id - sb->plane->base.id;
+}
+
+/*
+ * This replaces the drm_atomic_normalize_zpos to handle the dual overlay case.
+ *
+ * Since both halves need to be 'appear' side by side the zpos is
+ * recalculated when dealing with dual overlay cases so that the other
+ * planes zpos is consistent.
+ */
+static int omap_atomic_update_normalize_zpos(struct drm_device *dev,
+					     struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_state, *new_state;
+	struct drm_plane *plane;
+	int c, i, n, inc;
+	int total_planes = dev->mode_config.num_total_plane;
+	struct drm_plane_state **states;
+	int ret = 0;
+
+	states = kmalloc_array(total_planes, sizeof(*states), GFP_KERNEL);
+	if (!states)
+		return -ENOMEM;
+
+	for_each_oldnew_crtc_in_state(state, crtc, old_state, new_state, c) {
+		if (old_state->plane_mask == new_state->plane_mask &&
+		    !new_state->zpos_changed)
+			continue;
+
+		/* Reset plane increment and index value for every crtc */
+		n = 0;
+
+		/*
+		 * Normalization process might create new states for planes
+		 * which normalized_zpos has to be recalculated.
+		 */
+		drm_for_each_plane_mask(plane, dev, new_state->plane_mask) {
+			struct drm_plane_state *plane_state =
+				drm_atomic_get_plane_state(new_state->state,
+							   plane);
+			if (IS_ERR(plane_state)) {
+				ret = PTR_ERR(plane_state);
+				goto done;
+			}
+			states[n++] = plane_state;
+		}
+
+		sort(states, n, sizeof(*states),
+		     drm_atomic_state_normalized_zpos_cmp, NULL);
+
+		for (i = 0, inc = 0; i < n; i++) {
+			plane = states[i]->plane;
+
+			states[i]->normalized_zpos = i + inc;
+			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] updated normalized zpos value %d\n",
+					 plane->base.id, plane->name,
+					 states[i]->normalized_zpos);
+
+			if (is_omap_plane_dual_overlay(states[i]))
+				inc++;
+		}
+		new_state->zpos_changed = true;
+	}
+
+done:
+	kfree(states);
+	return ret;
+}
+
+static int omap_atomic_check(struct drm_device *dev,
+			     struct drm_atomic_state *state)
+{
+	int ret;
+
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	if (dev->mode_config.normalize_zpos) {
+		ret = omap_atomic_update_normalize_zpos(dev, state);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct drm_mode_config_helper_funcs omap_mode_config_helper_funcs = {
 	.atomic_commit_tail = omap_atomic_commit_tail,
 };
@@ -124,7 +220,7 @@ static const struct drm_mode_config_helper_funcs omap_mode_config_helper_funcs =
 static const struct drm_mode_config_funcs omap_mode_config_funcs = {
 	.fb_create = omap_framebuffer_create,
 	.output_poll_changed = drm_fb_helper_output_poll_changed,
-	.atomic_check = drm_atomic_helper_check,
+	.atomic_check = omap_atomic_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 190afc564914..895e66b08a81 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -131,7 +131,9 @@ static u32 drm_rotation_to_tiler(unsigned int drm_rot)
 /* update ovl info for scanout, handles cases of multi-planar fb's, etc.
  */
 void omap_framebuffer_update_scanout(struct drm_framebuffer *fb,
-		struct drm_plane_state *state, struct omap_overlay_info *info)
+		struct drm_plane_state *state,
+		struct omap_overlay_info *info,
+		struct omap_overlay_info *r_info)
 {
 	struct omap_framebuffer *omap_fb = to_omap_framebuffer(fb);
 	const struct drm_format_info *format = omap_fb->format;
@@ -218,6 +220,35 @@ void omap_framebuffer_update_scanout(struct drm_framebuffer *fb,
 	} else {
 		info->p_uv_addr = 0;
 	}
+
+	if (r_info) {
+		info->width /= 2;
+		info->out_width /= 2;
+
+		*r_info = *info;
+
+		if (fb->format->is_yuv) {
+			if (info->width & 1) {
+				info->width++;
+				r_info->width--;
+			}
+
+			if (info->out_width & 1) {
+				info->out_width++;
+				r_info->out_width--;
+			}
+		}
+
+		r_info->pos_x = info->pos_x + info->out_width;
+
+		r_info->paddr =	get_linear_addr(fb, format, 0,
+						x + info->width, y);
+		if (fb->format->format == DRM_FORMAT_NV12) {
+			r_info->p_uv_addr =
+				get_linear_addr(fb, format, 1,
+						x + info->width, y);
+		}
+	}
 }
 
 /* pin, prepare for scanout: */
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.h b/drivers/gpu/drm/omapdrm/omap_fb.h
index c0e19aed8220..b75f0b5ef1d8 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.h
+++ b/drivers/gpu/drm/omapdrm/omap_fb.h
@@ -26,7 +26,9 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 int omap_framebuffer_pin(struct drm_framebuffer *fb);
 void omap_framebuffer_unpin(struct drm_framebuffer *fb);
 void omap_framebuffer_update_scanout(struct drm_framebuffer *fb,
-		struct drm_plane_state *state, struct omap_overlay_info *info);
+		struct drm_plane_state *state,
+		struct omap_overlay_info *info,
+		struct omap_overlay_info *r_info);
 bool omap_framebuffer_supports_rotation(struct drm_framebuffer *fb);
 void omap_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
index afb2b44fdf86..10730c9b2752 100644
--- a/drivers/gpu/drm/omapdrm/omap_overlay.c
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
@@ -67,12 +67,13 @@ omap_plane_find_free_overlay(struct drm_device *dev, struct drm_plane *hwoverlay
  * next global overlay_map to be enabled when atomic transaction is valid.
  */
 int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
-			u32 caps, u32 fourcc, struct omap_hw_overlay **overlay)
+			u32 caps, u32 fourcc, struct omap_hw_overlay **overlay,
+			struct omap_hw_overlay **r_overlay)
 {
 	/* Get the global state of the current atomic transaction */
 	struct omap_global_state *state = omap_get_global_state(s);
 	struct drm_plane **overlay_map = state->hwoverlay_to_plane;
-	struct omap_hw_overlay *ovl;
+	struct omap_hw_overlay *ovl, *r_ovl;
 
 	ovl = omap_plane_find_free_overlay(s->dev, overlay_map, caps, fourcc);
 	if (!ovl)
@@ -81,8 +82,26 @@ int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 	overlay_map[ovl->idx] = plane;
 	*overlay = ovl;
 
+	if (r_overlay) {
+		r_ovl = omap_plane_find_free_overlay(s->dev, overlay_map,
+						     caps, fourcc);
+		if (!r_ovl) {
+			overlay_map[r_ovl->idx] = NULL;
+			*overlay = NULL;
+			return -ENOMEM;
+		}
+
+		overlay_map[r_ovl->idx] = plane;
+		*r_overlay = r_ovl;
+	}
+
 	DBG("%s: assign to plane %s caps %x", ovl->name, plane->name, caps);
 
+	if (r_overlay) {
+		DBG("%s: assign to right of plane %s caps %x",
+		    r_ovl->name, plane->name, caps);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.h b/drivers/gpu/drm/omapdrm/omap_overlay.h
index 38ca55e1e2d7..e36a43f35563 100644
--- a/drivers/gpu/drm/omapdrm/omap_overlay.h
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.h
@@ -28,7 +28,8 @@ struct omap_hw_overlay {
 int omap_hwoverlays_init(struct omap_drm_private *priv);
 void omap_hwoverlays_destroy(struct omap_drm_private *priv);
 int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
-			u32 caps, u32 fourcc, struct omap_hw_overlay **overlay);
+			u32 caps, u32 fourcc, struct omap_hw_overlay **overlay,
+			struct omap_hw_overlay **r_overlay);
 void omap_overlay_release(struct drm_atomic_state *s, struct omap_hw_overlay *overlay);
 void omap_overlay_update_state(struct omap_drm_private *priv, struct omap_hw_overlay *overlay);
 #endif /* __OMAPDRM_OVERLAY_H__ */
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 23b752d837a4..b35205c4e979 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -24,6 +24,7 @@ struct omap_plane_state {
 	struct drm_plane_state base;
 
 	struct omap_hw_overlay *overlay;
+	struct omap_hw_overlay *r_overlay;  /* right overlay */
 };
 
 #define to_omap_plane(x) container_of(x, struct omap_plane, base)
@@ -33,6 +34,13 @@ struct omap_plane {
 	enum omap_plane_id id;
 };
 
+bool is_omap_plane_dual_overlay(struct drm_plane_state *state)
+{
+	struct omap_plane_state *omap_state = to_omap_plane_state(state);
+
+	return !!omap_state->r_overlay;
+}
+
 static int omap_plane_prepare_fb(struct drm_plane *plane,
 				 struct drm_plane_state *new_state)
 {
@@ -61,16 +69,21 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 									   plane);
 	struct omap_plane_state *new_omap_state;
 	struct omap_plane_state *old_omap_state;
-	struct omap_overlay_info info;
-	enum omap_plane_id ovl_id;
+	struct omap_overlay_info info, r_info;
+	enum omap_plane_id ovl_id, r_ovl_id;
 	int ret;
+	bool dual_ovl;
 
 	new_omap_state = to_omap_plane_state(new_state);
 	old_omap_state = to_omap_plane_state(old_state);
 
+	dual_ovl = is_omap_plane_dual_overlay(new_state);
+
 	/* Cleanup previously held overlay if needed */
 	if (old_omap_state->overlay)
 		omap_overlay_update_state(priv, old_omap_state->overlay);
+	if (old_omap_state->r_overlay)
+		omap_overlay_update_state(priv, old_omap_state->r_overlay);
 
 	if (!new_omap_state->overlay) {
 		DBG("[PLANE:%d:%s] no overlay attached", plane->base.id, plane->name);
@@ -93,8 +106,11 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 	info.color_encoding = new_state->color_encoding;
 	info.color_range = new_state->color_range;
 
+	r_info = info;
+
 	/* update scanout: */
-	omap_framebuffer_update_scanout(new_state->fb, new_state, &info);
+	omap_framebuffer_update_scanout(new_state->fb, new_state, &info,
+					dual_ovl ? &r_info : NULL);
 
 	DBG("%s: %dx%d -> %dx%d (%d)",
 			new_omap_state->overlay->name, info.width, info.height,
@@ -102,6 +118,23 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 	DBG("%d,%d %pad %pad", info.pos_x, info.pos_y,
 			&info.paddr, &info.p_uv_addr);
 
+	if (dual_ovl) {
+		r_ovl_id = new_omap_state->r_overlay->id;
+		/*
+		 * If the current plane uses 2 hw planes the very next
+		 * zorder is used by the r_overlay so we just use the
+		 * main overlay zorder + 1
+		 */
+		r_info.zorder = info.zorder + 1;
+
+		DBG("%s: %dx%d -> %dx%d (%d)",
+		    new_omap_state->r_overlay->name,
+		    r_info.width, r_info.height,
+		    r_info.out_width, r_info.out_height, r_info.screen_width);
+		DBG("%d,%d %pad %pad", r_info.pos_x, r_info.pos_y,
+		    &r_info.paddr, &r_info.p_uv_addr);
+	}
+
 	/* and finally, update omapdss: */
 	ret = dispc_ovl_setup(priv->dispc, ovl_id, &info,
 			      omap_crtc_timings(new_state->crtc), false,
@@ -114,6 +147,21 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 	}
 
 	dispc_ovl_enable(priv->dispc, ovl_id, true);
+
+	if (dual_ovl) {
+		ret = dispc_ovl_setup(priv->dispc, r_ovl_id, &r_info,
+				      omap_crtc_timings(new_state->crtc), false,
+				      omap_crtc_channel(new_state->crtc));
+		if (ret) {
+			dev_err(plane->dev->dev, "Failed to setup plane right-overlay %s\n",
+				plane->name);
+			dispc_ovl_enable(priv->dispc, r_ovl_id, false);
+			dispc_ovl_enable(priv->dispc, ovl_id, false);
+			return;
+		}
+
+		dispc_ovl_enable(priv->dispc, r_ovl_id, true);
+	}
 }
 
 static void omap_plane_atomic_disable(struct drm_plane *plane,
@@ -139,6 +187,11 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
 
 	omap_overlay_update_state(priv, old_omap_state->overlay);
 	new_omap_state->overlay = NULL;
+
+	if (is_omap_plane_dual_overlay(old_state)) {
+		omap_overlay_update_state(priv, old_omap_state->r_overlay);
+		new_omap_state->r_overlay = NULL;
+	}
 }
 
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
@@ -154,6 +207,7 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 	struct omap_plane_state *omap_state = to_omap_plane_state(new_plane_state);
 	struct omap_global_state *omap_overlay_global_state;
 	struct drm_crtc_state *crtc_state;
+	bool new_r_hw_overlay = false;
 	bool new_hw_overlay = false;
 	u32 max_width, max_height;
 	struct drm_crtc *crtc;
@@ -196,7 +250,9 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 
 	if (!new_plane_state->visible) {
 		omap_overlay_release(state, omap_state->overlay);
+		omap_overlay_release(state, omap_state->r_overlay);
 		omap_state->overlay = NULL;
+		omap_state->r_overlay = NULL;
 		return 0;
 	}
 
@@ -213,8 +269,30 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 	if (new_plane_state->src_h > max_height || new_plane_state->crtc_h > height)
 		return -EINVAL;
 
-	if (new_plane_state->src_w > max_width || new_plane_state->crtc_w > width)
-		return -EINVAL;
+
+	if (new_plane_state->src_w > max_width || new_plane_state->crtc_w > width) {
+		bool is_fourcc_yuv = new_plane_state->fb->format->is_yuv;
+
+		if (is_fourcc_yuv && (((new_plane_state->src_w >> 16) / 2 & 1) ||
+				      new_plane_state->crtc_w / 2 & 1)) {
+			/*
+			 * When calculating the split overlay width
+			 * and it yield an odd value we will need to adjust
+			 * the indivual width +/- 1. So make sure it fits
+			 */
+			if (new_plane_state->src_w <= ((2 * width - 1) << 16) &&
+			    new_plane_state->crtc_w <= (2 * width - 1))
+				new_r_hw_overlay = true;
+			else
+				return -EINVAL;
+		} else {
+			if (new_plane_state->src_w <= (2 * max_width) &&
+			    new_plane_state->crtc_w <= (2 * width))
+				new_r_hw_overlay = true;
+			else
+				return -EINVAL;
+		}
+	}
 
 	if (new_plane_state->rotation != DRM_MODE_ROTATE_0 &&
 	    !omap_framebuffer_supports_rotation(new_plane_state->fb))
@@ -239,24 +317,44 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 			new_hw_overlay = true;
 	}
 
+	/*
+	 * check if we need two overlays and only have 1 or
+	 * if we had 2 overlays but will only need 1
+	 */
+	if ((new_r_hw_overlay && !omap_state->r_overlay) ||
+	    (!new_r_hw_overlay && omap_state->r_overlay))
+		new_hw_overlay = true;
+
 	if (new_hw_overlay) {
 		struct omap_hw_overlay *old_ovl = omap_state->overlay;
+		struct omap_hw_overlay *old_r_ovl = omap_state->r_overlay;
 		struct omap_hw_overlay *new_ovl = NULL;
+		struct omap_hw_overlay *new_r_ovl = NULL;
 
 		omap_overlay_release(state, old_ovl);
+		omap_overlay_release(state, old_r_ovl);
 
-		ret = omap_overlay_assign(state, plane, caps, fourcc, &new_ovl);
+		ret = omap_overlay_assign(state, plane, caps, fourcc, &new_ovl,
+					  new_r_hw_overlay ? &new_r_ovl : NULL);
 		if (ret) {
 			DBG("%s: failed to assign hw_overlay", plane->name);
 			omap_state->overlay = NULL;
+			omap_state->r_overlay = NULL;
 			return ret;
 		}
 
 		omap_state->overlay = new_ovl;
+		if (new_r_hw_overlay)
+			omap_state->r_overlay = new_r_ovl;
+		else
+			omap_state->r_overlay = NULL;
 	}
 
 	DBG("plane: %s overlay_id: %d", plane->name, omap_state->overlay->id);
 
+	if (omap_state->r_overlay)
+		DBG("plane: %s r_overlay_id: %d", plane->name, omap_state->r_overlay->id);
+
 	return 0;
 }
 
@@ -344,6 +442,7 @@ omap_plane_atomic_duplicate_state(struct drm_plane *plane)
 	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
 
 	state->overlay = current_state->overlay;
+	state->r_overlay = current_state->r_overlay;
 
 	return &state->base;
 }
@@ -359,6 +458,12 @@ static void omap_plane_atomic_print_state(struct drm_printer *p,
 			   omap_state->overlay->caps);
 	else
 		drm_printf(p, "\toverlay=None\n");
+	if (omap_state->r_overlay)
+		drm_printf(p, "\tr_overlay=%s (caps=0x%x)\n",
+			   omap_state->r_overlay->name,
+			   omap_state->r_overlay->caps);
+	else
+		drm_printf(p, "\tr_overlay=None\n");
 }
 
 static int omap_plane_atomic_set_property(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.h b/drivers/gpu/drm/omapdrm/omap_plane.h
index 0c28fe8ffa20..a9a33e12722a 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.h
+++ b/drivers/gpu/drm/omapdrm/omap_plane.h
@@ -22,5 +22,6 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 		u32 possible_crtcs);
 void omap_plane_install_properties(struct drm_plane *plane,
 		struct drm_mode_object *obj);
+bool is_omap_plane_dual_overlay(struct drm_plane_state *state);
 
 #endif /* __OMAPDRM_PLANE_H__ */
-- 
2.25.1

