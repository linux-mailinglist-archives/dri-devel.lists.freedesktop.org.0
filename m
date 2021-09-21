Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0F2413528
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688D46E998;
	Tue, 21 Sep 2021 14:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4906E998
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 14:17:04 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q26so39604060wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 07:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QKTzUiIslopLihKMv00bRn1BvdaTo9yXPswlnaQZN5Q=;
 b=mCk3EnSTBVUkGyheg+o6ZULz1TmBXi/9sCFnGE2uiYFCaQ50/PFGUo0a9ehrY6NIIX
 PMc3jEYAmadvLYTNGGGk5a5HyDna7yDaWur1nKW2FhFYdylPhsiXMMFKGjNcNMiwiZo0
 CfnmiI4KIRzQMnWsUUlXS9GacR8GdP5Z1DwJT2Lc2Pz4DX97+AqCOZYZMFONSzuBTArx
 YXZSVRh1WdGE+NPamUchGFL1dkxELEEjuNPJNQQWdI+7KkDuXYntrwSsbho3mCCTDiW/
 J727AL13pp4tsq4nwveYP9oS2YIsOukxq6+PkW5uEMTKeeCKwjezDmIpwpwX3gfAGQUE
 Vzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QKTzUiIslopLihKMv00bRn1BvdaTo9yXPswlnaQZN5Q=;
 b=wnQwArw/P4Yyq/w+5kirgoteNuI/z/ahWuNN3ZhFZyxrHLsqoP2l7WtabKu7X8AQGF
 n+TuCHR1b3oY6Sc53wOK2zUo3lX1nic2cfhpG2Nsi30hGA+rrbWsVfXN399QTqJqf8cm
 42ChX8i1s6ON/DXDmO20kOM46jwmAh6KLMknPWq0CmhPYMyxI8aWx1l7eIh5SUSdPkW/
 R7pgzdKLcBFwdeQrtasXYuQMzPIFDHgze6s+E1DV8PAT0NcmWQqc+qfOb9aVFo2VdFDn
 H56yt7Ud1pCsmmWeuMvGC+xhvWFUcV/l1N/PPnQcz/WkTOAoTThLoR9Ns7kLERgM7Uxc
 T7PQ==
X-Gm-Message-State: AOAM533UyTjdIT4vaeZLd5iwpq2wC9VscSzjc1/9916HcQr3qa0ILY22
 bbeCML2gDiCae95wjmqO2Lz00g==
X-Google-Smtp-Source: ABdhPJylEmqk77m/NewpkXVpwop/ZqyU2zfHF5e+BAqMJZucUYLK6CN86GqT9aW9R3MGDrnR/LcIzQ==
X-Received: by 2002:adf:ea90:: with SMTP id s16mr35463301wrm.235.1632233822270; 
 Tue, 21 Sep 2021 07:17:02 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:19bb:c937:2c91:f02])
 by smtp.gmail.com with ESMTPSA id
 c15sm20573379wrc.83.2021.09.21.07.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 07:17:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/3] drm/omap: add crtc transparency key property
Date: Tue, 21 Sep 2021 16:16:53 +0200
Message-Id: <20210921141654.66550-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921141654.66550-1-narmstrong@baylibre.com>
References: <20210921141654.66550-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6377; i=narmstrong@baylibre.com;
 h=from:subject; bh=4+XpwBDvQNvYsb0GsKGwtHNgM+J3P3z2VfHsFFdY2oM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhSeilnW37hks7upqmmFJF4Kp0P8StJu+0b03SiMYN
 +7joIeSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUnopQAKCRB33NvayMhJ0ZDwD/
 9f2Nv5Bx6XMB22HG+TbyfERDeqpzb2yC/N0go+BXl69Umj41l3erXKhjMCDbEOUT7jzOkleDtlvud5
 FrFprkRbTDQFzOfuROzkMpfQkoWkazDpzr2qpTJ+Aby77zEIIrTzHc+/irBFrBwkzVJ1pfXgp4ONuR
 6FqRlPZthl6FSOpbKx96l0arE2qWviIW9sv+70NKSPxeUG3kOvpwMS4mTm5yW9C8Z+lAeV0y2SVEva
 rOy+LJpvn7JIz1raoZuMK/jzdf65V5Eivp44h6iyoeLbZssbbaZ+OfXlui7i1AYFmQUMs9gB0/qbxl
 4kbJGVYZMcdrDpZUz594nY1nONDYIyrJpPl71XqLDqVXcGRlmlRPI4BDPefZIQcOHRwXk5UH59a28f
 EUYhGbSdgAfUa9AcpY+MvuOLtFdSsg4c3sYeyQtRnkrIXplIujoWiKW0/k4PDI10qe+bmM0tyug58E
 XzMfoiB3cpehpfoaKaRqVvP4uvHhVuynYSMqVp1q1tqZ2yT51UegxJDHDXax2emgZLgJHdHYFf/bMV
 P0PB9iOaEPMVCCVjF1SjF7iWFBNjUGPppBbJ7VaaCZAzea5TNW1hKxppzHoQUjM0omB1cYUdagtIea
 dRCXlKdrggWMJcvEeQ+GiHZp/XyzsJSappYJqc5vGT69qa5nP19pz/37dmuA==
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

From: Tomi Valkeinen <tomi.valkeinen@ti.com>

Add support for transparency keying.

User space must understand how the TCK works and needs to place the planes
to correct zpos. The generic zpos normalization in DRM however is going
to do normalization and might move the position of the planes which breaks
the TCK as planes are no longer in the position where application
deliberately placed them.

If the TCK is enabled for the crtc then use the zpos configured by the
application instead of the normalized positions and at the same time do a
sanity check against overlapping zpos.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 53 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/omapdrm/omap_drv.c  | 18 ++++++++++
 drivers/gpu/drm/omapdrm/omap_drv.h  |  2 ++
 3 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 4ba2d3e51b2b..d1fbbbaa3da8 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -26,6 +26,8 @@ struct omap_crtc_state {
 	bool manually_updated;
 
 	u32 default_color;
+	unsigned int trans_key_mode;
+	unsigned int trans_key;
 };
 
 #define to_omap_crtc(x) container_of(x, struct omap_crtc, base)
@@ -405,9 +407,25 @@ static void omap_crtc_write_crtc_properties(struct drm_crtc *crtc)
 	memset(&info, 0, sizeof(info));
 
 	info.default_color = omap_state->default_color;
-	info.trans_enabled = false;
 	info.partial_alpha_enabled = false;
 
+	info.trans_key = omap_state->trans_key;
+
+	switch (omap_state->trans_key_mode) {
+	case 0:
+	default:
+		info.trans_enabled = false;
+		break;
+	case 1:
+		info.trans_enabled = true;
+		info.trans_key_type = OMAP_DSS_COLOR_KEY_GFX_DST;
+		break;
+	case 2:
+		info.trans_enabled = true;
+		info.trans_key_type = OMAP_DSS_COLOR_KEY_VID_SRC;
+		break;
+	}
+
 	if (crtc->state->ctm) {
 		struct drm_color_ctm *ctm = crtc->state->ctm->data;
 
@@ -584,6 +602,7 @@ static int omap_crtc_atomic_check(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
+	const struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc_state);
 	struct drm_plane_state *pri_state;
 
 	if (crtc_state->color_mgmt_changed && crtc_state->degamma_lut) {
@@ -594,6 +613,25 @@ static int omap_crtc_atomic_check(struct drm_crtc *crtc,
 			return -EINVAL;
 	}
 
+	if (omap_state->trans_key_mode) {
+		struct drm_plane *plane;
+		struct drm_plane_state *plane_state;
+		u32 zpos_mask = 0;
+
+		drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
+			plane_state =
+				drm_atomic_get_plane_state(crtc_state->state, plane);
+			if (IS_ERR(plane_state))
+				return PTR_ERR(plane_state);
+
+			if (zpos_mask & BIT(plane_state->zpos))
+				return -EINVAL;
+
+			zpos_mask |= BIT(plane_state->zpos);
+			plane_state->normalized_zpos = plane_state->zpos;
+		}
+	}
+
 	pri_state = drm_atomic_get_new_plane_state(state,
 						   crtc->primary);
 	if (pri_state) {
@@ -689,6 +727,10 @@ static int omap_crtc_atomic_set_property(struct drm_crtc *crtc,
 		plane_state->zpos = val;
 	else if (property == priv->background_color_prop)
 		omap_state->default_color = val;
+	else if (property == priv->trans_key_mode_prop)
+		omap_state->trans_key_mode = val;
+	else if (property == priv->trans_key_prop)
+		omap_state->trans_key = val;
 	else
 		return -EINVAL;
 
@@ -709,6 +751,10 @@ static int omap_crtc_atomic_get_property(struct drm_crtc *crtc,
 		*val = omap_state->zpos;
 	else if (property == priv->background_color_prop)
 		*val = omap_state->default_color;
+	else if (property == priv->trans_key_mode_prop)
+		*val = omap_state->trans_key_mode;
+	else if (property == priv->trans_key_prop)
+		*val = omap_state->trans_key;
 	else
 		return -EINVAL;
 
@@ -751,6 +797,9 @@ omap_crtc_duplicate_state(struct drm_crtc *crtc)
 
 	state->default_color = current_state->default_color;
 
+	state->trans_key_mode = current_state->trans_key_mode;
+	state->trans_key = current_state->trans_key;
+
 	return &state->base;
 }
 
@@ -795,6 +844,8 @@ static void omap_crtc_install_properties(struct drm_crtc *crtc)
 	struct omap_drm_private *priv = dev->dev_private;
 
 	drm_object_attach_property(obj, priv->background_color_prop, 0);
+	drm_object_attach_property(obj, priv->trans_key_mode_prop, 0);
+	drm_object_attach_property(obj, priv->trans_key_prop, 0);
 }
 
 /* initialize crtc */
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 48ebd1689601..adf99b60b2e0 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -195,6 +195,12 @@ static int omap_modeset_init_properties(struct drm_device *dev)
 	struct omap_drm_private *priv = dev->dev_private;
 	unsigned int num_planes = dispc_get_num_ovls(priv->dispc);
 
+	static const struct drm_prop_enum_list trans_key_mode_list[] = {
+		{ 0, "disable"},
+		{ 1, "gfx-dst"},
+		{ 2, "vid-src"},
+	};
+
 	priv->zorder_prop = drm_property_create_range(dev, 0, "zorder", 0,
 						      num_planes - 1);
 	if (!priv->zorder_prop)
@@ -207,6 +213,18 @@ static int omap_modeset_init_properties(struct drm_device *dev)
 	if (!priv->background_color_prop)
 		return -ENOMEM;
 
+	priv->trans_key_mode_prop =
+		drm_property_create_enum(dev, 0, "trans-key-mode",
+					 trans_key_mode_list,
+					 ARRAY_SIZE(trans_key_mode_list));
+	if (!priv->trans_key_mode_prop)
+		return -ENOMEM;
+
+	priv->trans_key_prop =
+		drm_property_create_range(dev, 0, "trans-key", 0, 0xffffff);
+	if (!priv->trans_key_prop)
+		return -ENOMEM;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index ed69ae78ae89..6a882b213e2f 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -75,6 +75,8 @@ struct omap_drm_private {
 
 	/* crtc properties */
 	struct drm_property *background_color_prop;
+	struct drm_property *trans_key_mode_prop;
+	struct drm_property *trans_key_prop;
 
 	/* irq handling: */
 	spinlock_t wait_lock;		/* protects the wait_list */
-- 
2.25.1

