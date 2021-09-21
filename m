Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D270E413529
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B3D6E99E;
	Tue, 21 Sep 2021 14:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CC96E99E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 14:17:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u15so39662448wru.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 07:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nAYhYOtljv3sKR69Z1ld7zhrPXbSYXbm9pU5Q7uYDg8=;
 b=3O2cO0UUhOwWc/ZGVhgR4m0GzP8beqjgLU7EM3PdnuKJ4yZCt5INVW8L/XqIc+mAJN
 +so/fEBys7cxZynQTGDvXg0vAVaw2WGyDnh2U4OhptOFv9yWhhIAzoyYmIOdcmeuJlwB
 OmaBKNOn/p8d+PHCTy0NT0+evxHFNfQBFvgpDrf3Y+INZRDneDx8OxqEjVG4W1illZLb
 u/R5pga0U4ELdOmnzBAie+64FOaQ4NP3uAH6gopt2OVj/Hgyn1pgw/odKDo96zganZZv
 lPJ8nsMX9D+rkHT8z6bH/7CdFjq1IthkhkfcibuMPCtwhjrDqc1wBe1+Eqrf8XbZ7CjB
 GU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nAYhYOtljv3sKR69Z1ld7zhrPXbSYXbm9pU5Q7uYDg8=;
 b=6+QOL+w+sjVpvS6Eco8XfZ0P2eXzcb77yh6tnSo2zgNpSQ3y011SF/bGzv5F3lOwQS
 ACCyz/BP26VrRiZWTLDxJYctCJ/ht72kfCTwF+gCarcZre6IkKVvpqG1AJmzqE7vqWn4
 40PLezC4wLnfq2i7NVOIey1EiU4UgJDBqv7RkOMk/8T/KZbQxssLREu0D7Xj8pO7r6KI
 NI64u/UdUcSqOHCZJmbA2UO5lq0GAHYSuKSkqmkuYIt2NzPfXMTW/lFYWqZY0OveSCCv
 vwX9ezKq1w/KQ3GhsYiwcw2nrqT6U8hXupK0kKwM/Vyxqqm1nWxnYxxQ30EYbhf1wFFa
 jpKg==
X-Gm-Message-State: AOAM5317FM5c6fcI5Kl4sT3e1zh9Lrss41MFzhHx/J6AhpvcR5QUiSIN
 9wrGAA8Od0c/F8pYDhfdgBGE3EZCg3Tnv5ms
X-Google-Smtp-Source: ABdhPJxBnLsc/rBKHK4t0KQIubNY1C6tlwqyLHwTEDRyM2PrO4BNVYBJuWkANBb6ewOQ+IXGOWZ57A==
X-Received: by 2002:a5d:440e:: with SMTP id z14mr5104794wrq.64.1632233823384; 
 Tue, 21 Sep 2021 07:17:03 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:19bb:c937:2c91:f02])
 by smtp.gmail.com with ESMTPSA id
 c15sm20573379wrc.83.2021.09.21.07.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 07:17:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/3] drm/omap: add alpha blender property
Date: Tue, 21 Sep 2021 16:16:54 +0200
Message-Id: <20210921141654.66550-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921141654.66550-1-narmstrong@baylibre.com>
References: <20210921141654.66550-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5181; i=narmstrong@baylibre.com;
 h=from:subject; bh=xSxrqKj2uaFJ56uvpTXcueCbdB/6tiKYytLm8zoamVk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhSeilyYzVVXmB7RfeQMnRsiqzzRMDQHswZvnFfxcw
 NREbsX6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUnopQAKCRB33NvayMhJ0U33D/
 9xfTmLPOvbgzU/NlWWQGBWn22636lZnKiCCegjq3UWLSPuZaIgWebvleT+npsVlok5bXUHGCcODUHL
 i45gZeKAVYZN3yLTF9aBHb1lSfcqzXqYar5VHBHasgjvP8UHDhoqopGO8N8jgj0yNoQY4notOwdr8H
 PXvTFriRbMobUDoZD2sVydZx/pBxH35q1tz+Wz4B8B1luMmRHzlAUs0w3vbVHBzx2+/IjARbWqOy9z
 1kLQj4D0oQf95lfky49EBlGsezQN9KIVfYeN2WnqtD0I1mMuoOEypXrLi8RrNk+FkSbix2zQvVpxXa
 sMNeJ6rjmmydGnFiQmWFD5se+aTi189ofRAptMrT0V3f+dtoM4+MgcUVYRwu/DGOQ99u7pnn6VcmAR
 zF0f+ivpnQsfv5Px3Y91tX4h8yaUCKuRVMjbJmZAAYPMl8byxXQyG6a+aGIO1FHAIZwmKO/H72kHFj
 DjhPbQPn2TD4KPHuNIAKW6JSs4j29uguO7BNI9zKFccgp/r8naeumQ4qkw8LvZF2560Xt6YjvBSY8w
 O69BYjGatLpprEtE8yXBTd/FvmDx45jZ+iBnST61FIgrmjx9JOa1+9alsj0PcuoMTco1f8JhrSQRE2
 Z85mFboG4YoSsapYxMH0k9DIPwhwt8TTXHvQ8SpiXrSyKLMGRQJUW5y/bhgA==
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

Add support to enable/disable alpha blender on DSS3.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c   |  4 ++--
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  2 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c   | 10 +++++++++-
 drivers/gpu/drm/omapdrm/omap_drv.c    |  5 +++++
 drivers/gpu/drm/omapdrm/omap_drv.h    |  1 +
 5 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 5619420cc2cc..ca05d608e44a 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -2995,7 +2995,7 @@ void dispc_mgr_setup(struct dispc_device *dispc,
 				info->trans_key);
 	dispc_mgr_enable_trans_key(dispc, channel, info->trans_enabled);
 	dispc_mgr_enable_alpha_fixed_zorder(dispc, channel,
-			info->partial_alpha_enabled);
+			info->alpha_blender_enabled);
 	if (dispc_has_feature(dispc, FEAT_CPR)) {
 		dispc_mgr_enable_cpr(dispc, channel, info->cpr_enable);
 		dispc_mgr_set_cpr_coef(dispc, channel, &info->cpr_coefs);
@@ -4588,7 +4588,7 @@ static const struct dispc_errata_i734_data {
 	.mgri = {
 		.default_color = 0,
 		.trans_enabled = false,
-		.partial_alpha_enabled = false,
+		.alpha_blender_enabled = false,
 		.cpr_enable = false,
 	},
 	.lcd_conf = {
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 040d5a3e33d6..6988459f267c 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -175,7 +175,7 @@ struct omap_overlay_manager_info {
 	u32 trans_key;
 	bool trans_enabled;
 
-	bool partial_alpha_enabled;
+	bool alpha_blender_enabled;
 
 	bool cpr_enable;
 	struct omap_dss_cpr_coefs cpr_coefs;
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index d1fbbbaa3da8..fbcc092399dd 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -28,6 +28,7 @@ struct omap_crtc_state {
 	u32 default_color;
 	unsigned int trans_key_mode;
 	unsigned int trans_key;
+	bool alpha_blender_enabled;
 };
 
 #define to_omap_crtc(x) container_of(x, struct omap_crtc, base)
@@ -407,7 +408,6 @@ static void omap_crtc_write_crtc_properties(struct drm_crtc *crtc)
 	memset(&info, 0, sizeof(info));
 
 	info.default_color = omap_state->default_color;
-	info.partial_alpha_enabled = false;
 
 	info.trans_key = omap_state->trans_key;
 
@@ -426,6 +426,8 @@ static void omap_crtc_write_crtc_properties(struct drm_crtc *crtc)
 		break;
 	}
 
+	info.alpha_blender_enabled = omap_state->alpha_blender_enabled;
+
 	if (crtc->state->ctm) {
 		struct drm_color_ctm *ctm = crtc->state->ctm->data;
 
@@ -731,6 +733,8 @@ static int omap_crtc_atomic_set_property(struct drm_crtc *crtc,
 		omap_state->trans_key_mode = val;
 	else if (property == priv->trans_key_prop)
 		omap_state->trans_key = val;
+	else if (property == priv->alpha_blender_prop)
+		omap_state->alpha_blender_enabled = !!val;
 	else
 		return -EINVAL;
 
@@ -755,6 +759,8 @@ static int omap_crtc_atomic_get_property(struct drm_crtc *crtc,
 		*val = omap_state->trans_key_mode;
 	else if (property == priv->trans_key_prop)
 		*val = omap_state->trans_key;
+	else if (property == priv->alpha_blender_prop)
+		*val = omap_state->alpha_blender_enabled;
 	else
 		return -EINVAL;
 
@@ -799,6 +805,7 @@ omap_crtc_duplicate_state(struct drm_crtc *crtc)
 
 	state->trans_key_mode = current_state->trans_key_mode;
 	state->trans_key = current_state->trans_key;
+	state->alpha_blender_enabled = current_state->alpha_blender_enabled;
 
 	return &state->base;
 }
@@ -846,6 +853,7 @@ static void omap_crtc_install_properties(struct drm_crtc *crtc)
 	drm_object_attach_property(obj, priv->background_color_prop, 0);
 	drm_object_attach_property(obj, priv->trans_key_mode_prop, 0);
 	drm_object_attach_property(obj, priv->trans_key_prop, 0);
+	drm_object_attach_property(obj, priv->alpha_blender_prop, 0);
 }
 
 /* initialize crtc */
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index adf99b60b2e0..92e459c67eff 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -225,6 +225,11 @@ static int omap_modeset_init_properties(struct drm_device *dev)
 	if (!priv->trans_key_prop)
 		return -ENOMEM;
 
+	priv->alpha_blender_prop =
+		drm_property_create_bool(dev, 0, "alpha_blender");
+	if (!priv->alpha_blender_prop)
+		return -ENOMEM;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index 6a882b213e2f..38ec1e0eab8a 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -77,6 +77,7 @@ struct omap_drm_private {
 	struct drm_property *background_color_prop;
 	struct drm_property *trans_key_mode_prop;
 	struct drm_property *trans_key_prop;
+	struct drm_property *alpha_blender_prop;
 
 	/* irq handling: */
 	spinlock_t wait_lock;		/* protects the wait_list */
-- 
2.25.1

