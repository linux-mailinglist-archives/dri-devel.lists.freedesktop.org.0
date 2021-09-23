Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3752C4158D5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 09:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75376ECEB;
	Thu, 23 Sep 2021 07:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5D06ECE6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 07:07:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i23so14279537wrb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4PMS3EsUME0yXf2wLvBhrQWzVpCL17iuqXFXZ3vBBGU=;
 b=hxnkdMrp/zCZbfmK/ZpCTr4ZvDNcRAcLxpMTC0tZOK2Nc0tHIECQTEENMafOC/zLKt
 NMZnCuz/UD8GlaTjDGlMuweVUU8VOZ6M5Y0lYAGgyXO8NMgZkSDd4jBhieZUslTgN9yc
 U89amw5vZ8JRM2fzKry0KNZjPYfAwq8qTE/YYe3P3fB5HAvUDRYTvRn2pDgvW7j8TJcI
 dSTLU4UhVphkf1bx/5NXiCXvmtzSrGWzxD8QkgyQTjaTc3xK9FDebnZMUK1SxHBzUqzA
 nDY9+PJU47DQ7wXMEFXkkTpZKBsQLilMih19smSXPun866JglBIICDCsCdgOD7HP/P17
 2dIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4PMS3EsUME0yXf2wLvBhrQWzVpCL17iuqXFXZ3vBBGU=;
 b=iJYSV1lFshQZhIQKaaKIClckhUsFsFOxJt0NhGEweYNG1N0MZ08qFsHrtAkpIZYckl
 /so1E89ImCSJ9wjSho5/6jxBH1BEU0OBZJZ2RYzT6UTlr9yQZnlynSFRxHchLsS+G4er
 cMMH8CaeKTBXiU9AbWWIdTy3/nP+OQf5vArNwYxOUsCjA5RbXECYP5BYB9geoboL3Fqf
 N5wTQeOKD0C8A8Bb0zTj4AcfC2pZT7PIYJLTZtG+LLk0dDPqjgPeozxfsdiLYEloREhh
 TXUTldNPg/Org+Bz5Eg19N3wnYnF3RQI2QfAZIPyUl0VonRA4336pFk/iX7e2S32XUaH
 Hl5w==
X-Gm-Message-State: AOAM5323OB4MP+8UqlLQDcOtiliYKJ0dsrR0sJ0NX25jdTlUDWhG/I5V
 Gf8xpk97sCrdBtHNMTXZ1LNczg==
X-Google-Smtp-Source: ABdhPJy+VHRxQjQATb+jYkzmG8h26CDN11px9sSgv57dZ833thRPpO+aVzUegA/K7WmJ+BvE4Tl2WQ==
X-Received: by 2002:a05:600c:19cb:: with SMTP id
 u11mr2713543wmq.185.1632380831031; 
 Thu, 23 Sep 2021 00:07:11 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:74cf:b054:76f4:7692])
 by smtp.gmail.com with ESMTPSA id d2sm4380357wrc.32.2021.09.23.00.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 00:07:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 8/8] drm/omap: Add a 'right overlay' to plane state
Date: Thu, 23 Sep 2021 09:07:01 +0200
Message-Id: <20210923070701.145377-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923070701.145377-1-narmstrong@baylibre.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18742;
 i=narmstrong@baylibre.com; 
 h=from:subject; bh=+661j1zEvtnPsQWVJxVE4D5iAlVcnnSzmTVhaUnKJeQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhTCcigKd8NpYUe5LxbQdysXRRqUlvbRHszGL0OwN5
 1QVBnVWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUwnIgAKCRB33NvayMhJ0UDKD/
 48G39msyg+6hkP2+AYsP+MKh43ZwCiIOeqlNdlsIDu+AmaherC4FKeuLWH03m2l9fgbHaJuztYaAX4
 XzsOtrt22uKi9kBzLv+VKX5QKLoREW4Dc++2A4QIIQNHyPyVmd68HSmFmD6pEENw/wC3CaBeN3i80X
 pAafl7j39lV+tHRG+uJbR6QALvQ9J/LLIog6/ld7d7vq3vN3mQz+KsO27uph4viN7iy5SKGTo1QNcw
 jmNbmcYR5cvMHoVhbyZZuZLQn5wIsk/3VWwkRHvl1iwAAdgQHWIRH24nHakbNEY8k3NHv4DmuJhNTA
 tHl86IgnbMfHXlLbWRfC9Fx/Xa4k/+l7GwSWUNtXJRzP32B2jsbYXlqy96HT8Kjkd8SptxtpB3Si/M
 qjaSRZr8pqK4nXqms14IB4zsKU6+WmGyzweXqiqT8EQj9hqTbt5urYeFHC9aTSH7ZajemcrH1C74yn
 v9j+bENP8/Id3fOV43zS0dPZuo73OwgGyDMUBZcb2ySyY9u6ePAFXHx1Jki7JyQFNoYi5XdSxIAfED
 Ge2RXlCeKSLtxYHv735Jid9Vj2gqOMXdnhXeoD731Wu63VYZUOHn7lnjGvXtFbguQ6L7utYhnCLxbe
 +N2qYS0DJ8+n6mDhUFp3c3cxO+KjUzxYOtdbNsXXpdeIqRzm0+xrmO1XKCEw==
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
 drivers/gpu/drm/omapdrm/omap_drv.c     |  91 +++++++++++++++++-
 drivers/gpu/drm/omapdrm/omap_fb.c      |  33 ++++++-
 drivers/gpu/drm/omapdrm/omap_fb.h      |   4 +-
 drivers/gpu/drm/omapdrm/omap_overlay.c |  31 +++++-
 drivers/gpu/drm/omapdrm/omap_overlay.h |   3 +-
 drivers/gpu/drm/omapdrm/omap_plane.c   | 127 +++++++++++++++++++++++--
 drivers/gpu/drm/omapdrm/omap_plane.h   |   1 +
 7 files changed, 276 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index c7912374d393..f088b6313950 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -117,6 +117,95 @@ static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
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
@@ -124,7 +213,7 @@ static const struct drm_mode_config_helper_funcs omap_mode_config_helper_funcs =
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
index f1a23c2203aa..a4f4be008bd5 100644
--- a/drivers/gpu/drm/omapdrm/omap_overlay.c
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
@@ -63,12 +63,14 @@ omap_plane_find_free_overlay(struct drm_device *dev,
 
 int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 			u32 caps, u32 fourcc, u32 crtc_mask,
-			struct omap_hw_overlay **overlay)
+			struct omap_hw_overlay **overlay,
+			struct omap_hw_overlay **r_overlay)
 {
 	struct omap_drm_private *priv = s->dev->dev_private;
 	struct omap_global_state *new_global_state, *old_global_state;
 	struct drm_plane **overlay_map;
-	struct omap_hw_overlay *ovl;
+	struct omap_hw_overlay *ovl, *r_ovl;
+	u32 save_possible_crtcs;
 
 	new_global_state = omap_get_global_state(s);
 	if (IS_ERR(new_global_state))
@@ -90,12 +92,37 @@ int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 		if (!ovl)
 			return -ENOMEM;
 
+		/* in case we need to backtrack */
+		save_possible_crtcs = ovl->possible_crtcs;
+
 		ovl->possible_crtcs = crtc_mask;
 		overlay_map[ovl->idx] = plane;
 		*overlay = ovl;
 
+		if (r_overlay) {
+			r_ovl = omap_plane_find_free_overlay(s->dev,
+							     overlay_map,
+							     caps, fourcc,
+							     crtc_mask);
+			if (!r_ovl) {
+				ovl->possible_crtcs = save_possible_crtcs;
+				overlay_map[ovl->idx] = NULL;
+				*overlay = NULL;
+				return -ENOMEM;
+			}
+
+			r_ovl->possible_crtcs = crtc_mask;
+			overlay_map[r_ovl->idx] = plane;
+			*r_overlay = r_ovl;
+		}
+
 		DBG("%s: assign to plane %s caps %x on crtc %x",
 		    (*overlay)->name, plane->name, caps, crtc_mask);
+
+		if (r_overlay) {
+			DBG("%s: assign to right of plane %s caps %x on crtc %x",
+			    (*r_overlay)->name, plane->name, caps, crtc_mask);
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.h b/drivers/gpu/drm/omapdrm/omap_overlay.h
index d5033ee481c2..a800468511f1 100644
--- a/drivers/gpu/drm/omapdrm/omap_overlay.h
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.h
@@ -30,7 +30,8 @@ int omap_hwoverlays_init(struct omap_drm_private *priv);
 void omap_hwoverlays_destroy(struct omap_drm_private *priv);
 int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 			u32 caps, u32 fourcc, u32 crtc_mask,
-			struct omap_hw_overlay **overlay);
+			struct omap_hw_overlay **overlay,
+			struct omap_hw_overlay **r_overlay);
 void omap_overlay_release(struct drm_atomic_state *s,
 			  struct drm_plane *plane,
 			  struct omap_hw_overlay *overlay);
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index badbafeb3402..13bfda7305e9 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -24,6 +24,7 @@ struct omap_plane_state {
 	struct drm_plane_state base;
 
 	struct omap_hw_overlay *overlay;
+	struct omap_hw_overlay *r_overlay;  /* right overlay */
 };
 
 #define to_omap_plane(x) container_of(x, struct omap_plane, base)
@@ -34,6 +35,13 @@ struct omap_plane {
 	const char *name;
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
@@ -63,15 +71,20 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
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
 	omap_overlay_disable(old_state->state, plane, old_omap_state->overlay);
+	omap_overlay_disable(old_state->state, plane,
+			     old_omap_state->r_overlay);
 
 	if (!new_omap_state->overlay) {
 		DBG("[PLANE:%d:%s] overlay_id: ??? (%p)", plane->base.id, plane->name,
@@ -95,8 +108,11 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
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
@@ -104,18 +120,50 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 	DBG("%d,%d %pad %pad", info.pos_x, info.pos_y,
 			&info.paddr, &info.p_uv_addr);
 
+	if (dual_ovl) {
+		r_ovl_id = new_omap_state->r_overlay->overlay_id;
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
 			      omap_crtc_channel(new_state->crtc));
 	if (ret) {
-		dev_err(plane->dev->dev, "Failed to setup plane %s\n",
+		dev_err(plane->dev->dev, "Failed to setup plane1 %s\n",
 			omap_plane->name);
 		dispc_ovl_enable(priv->dispc, ovl_id, false);
 		return;
 	}
 
 	dispc_ovl_enable(priv->dispc, ovl_id, true);
+
+	if (dual_ovl) {
+		ret = dispc_ovl_setup(priv->dispc, r_ovl_id, &r_info,
+				      omap_crtc_timings(new_state->crtc), false,
+				      omap_crtc_channel(new_state->crtc));
+		if (ret) {
+			dev_err(plane->dev->dev, "Failed to setup plane2 %s\n",
+				omap_plane->name);
+			dispc_ovl_enable(priv->dispc, r_ovl_id, false);
+			dispc_ovl_enable(priv->dispc, ovl_id, false);
+			return;
+		}
+
+		dispc_ovl_enable(priv->dispc, r_ovl_id, true);
+	}
 }
 
 static void omap_plane_atomic_disable(struct drm_plane *plane,
@@ -140,6 +188,11 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
 
 	omap_overlay_disable(old_state->state, plane, old_omap_state->overlay);
 	new_omap_state->overlay = NULL;
+	if (is_omap_plane_dual_overlay(old_state)) {
+		omap_overlay_disable(old_state->state, plane,
+				     old_omap_state->r_overlay);
+		new_omap_state->r_overlay = NULL;
+	}
 }
 
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
@@ -158,6 +211,8 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 	u32 fourcc;
 	u32 caps = 0;
 	bool new_hw_overlay = false;
+	bool new_r_hw_overlay = false;
+	bool is_fourcc_yuv = false;
 	int min_scale, max_scale;
 	int ret;
 	struct drm_crtc_state *crtc_state;
@@ -187,9 +242,31 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 	if (new_plane_state->src_h > height_fp || new_plane_state->crtc_h > height)
 		return -EINVAL;
 
-	if (new_plane_state->src_w > width_fp || new_plane_state->crtc_w > width)
-		return -EINVAL;
-
+	if (new_plane_state->fb)
+		is_fourcc_yuv = new_plane_state->fb->format->is_yuv;
+
+	if (new_plane_state->src_w > width_fp || new_plane_state->crtc_w > width) {
+		if (is_fourcc_yuv &&
+		    (((new_plane_state->src_w >> 16) / 2 & 1) ||
+		     new_plane_state->crtc_w / 2 & 1)) {
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
+			if (new_plane_state->src_w <= (2 * width_fp) &&
+			    new_plane_state->crtc_w <= (2 * width))
+				new_r_hw_overlay = true;
+			else
+				return -EINVAL;
+		}
+	}
 
 	/*
 	 * Note: these are just sanity checks to filter out totally bad scaling
@@ -239,32 +316,55 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 						fourcc))
 				new_hw_overlay = true;
 		}
+		/*
+		 * check if we need two overlays and only have 1 or
+		 * if we had 2 overlays but will only need 1
+		 */
+		if ((new_r_hw_overlay && !omap_state->r_overlay) ||
+		    (!new_r_hw_overlay && omap_state->r_overlay))
+			new_hw_overlay = true;
 
 		if (new_hw_overlay) {
 			struct omap_hw_overlay *old_ovl = omap_state->overlay;
+			struct omap_hw_overlay *old_r_ovl =
+						omap_state->r_overlay;
 			struct omap_hw_overlay *new_ovl = NULL;
+			struct omap_hw_overlay *new_r_ovl = NULL;
 
 			omap_overlay_release(state, plane, old_ovl);
+			omap_overlay_release(state, plane, old_r_ovl);
 
 			ret = omap_overlay_assign(state, plane, caps,
-						  fourcc, crtc_mask, &new_ovl);
+						  fourcc, crtc_mask, &new_ovl,
+						  new_r_hw_overlay ?
+						  &new_r_ovl : NULL);
 			if (ret) {
 				DBG("%s: failed to assign hw_overlay(s)!",
 				    plane->name);
 				omap_state->overlay = NULL;
+				omap_state->r_overlay = NULL;
 				return ret;
 			}
 
 			omap_state->overlay = new_ovl;
+			if (new_r_hw_overlay)
+				omap_state->r_overlay = new_r_ovl;
+			else
+				omap_state->r_overlay = NULL;
 		}
 	} else {
 		omap_overlay_release(state, plane, omap_state->overlay);
+		omap_overlay_release(state, plane, omap_state->r_overlay);
 		omap_state->overlay = NULL;
+		omap_state->r_overlay = NULL;
 	}
 
 	if (omap_state->overlay)
 		DBG("plane: %s overlay_id: %d", plane->name,
 		    omap_state->overlay->overlay_id);
+	if (omap_state->r_overlay)
+		DBG("plane: %s r_overlay_id: %d", plane->name,
+		    omap_state->r_overlay->overlay_id);
 
 	return 0;
 }
@@ -370,6 +470,17 @@ static void omap_plane_atomic_print_state(struct drm_printer *p,
 		drm_printf(p, "\t\tpossible_crtcs=0x%x\n",
 			   omap_state->overlay->possible_crtcs);
 	}
+
+	drm_printf(p, "\tr_overlay=%s\n", omap_state->r_overlay ?
+					  omap_state->r_overlay->name : "(null)");
+	if (omap_state->r_overlay) {
+		drm_printf(p, "\t\tidx=%d\n", omap_state->r_overlay->idx);
+		drm_printf(p, "\t\toverlay_id=%d\n",
+			   omap_state->r_overlay->overlay_id);
+		drm_printf(p, "\t\tcaps=0x%x\n", omap_state->r_overlay->caps);
+		drm_printf(p, "\t\tpossible_crtcs=0x%x\n",
+			   omap_state->r_overlay->possible_crtcs);
+	}
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

