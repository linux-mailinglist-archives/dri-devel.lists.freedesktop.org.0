Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3469808C98
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BBC10E911;
	Thu,  7 Dec 2023 15:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFAF10E90E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:51:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D39BECE2078;
 Thu,  7 Dec 2023 15:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23894C4166B;
 Thu,  7 Dec 2023 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964293;
 bh=LVnlQNCazjkGTqLwXxcrcuFECpSDdb3l2iMVIaIxEkM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PYzuZmZrQnHEvZyGXoFA8IpJAm9Cfip0jHXkFMHfNQnNZ+MGG/j1LkUlafkoxfJdb
 8FBE2ZNsveTQc1DK2pZAZl3DEhg6L5T3Rn7WQKHReIwcec/e9LngMM6rmsAqvtA/Ik
 xjCU3xFd4tfLkquRwhftxRjcPRxH2AV9LM7JP35RC8UIjrelPc5lKe1MRw/30FhqVk
 Xhm3V9CIkB3aonQEOqPKxvQoNhvrFzUxpl9MR5s0gVnRSqRczP3jzgV5p/U5H4dLG3
 N74gs34upRQxtM+Bpg0DBhf/a2uF9ib6YUDNX9mmboy/DgiX4qgJDKwfN/LgnUnobb
 E7lC92uLHUCeA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:50:06 +0100
Subject: [PATCH v5 43/44] drm/sun4i: hdmi: Consolidate atomic_check and
 mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-43-6538e19d634d@kernel.org>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4258; i=mripard@kernel.org;
 h=from:subject:message-id; bh=LVnlQNCazjkGTqLwXxcrcuFECpSDdb3l2iMVIaIxEkM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL9sn7fxh69z5/b2C3HFlidk209Utr59RmFJRmpEqJ
 W58Siupo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNZ6M/wm/3Py93ikS+218Uc
 9D1tduMPn7GC/sZiO3NVljtym9822zP8082eICTEYym7a77eyefJG61WdikYKzvOZxX0X3+nwuA
 dNwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

atomic_check and mode_valid do not check for the same things which can
lead to surprising result if the userspace commits a mode that didn't go
through mode_valid. Let's merge the two implementations into a function
called by both.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 74 +++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index c276d984da6b..b7cf369b1906 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -62,18 +62,6 @@ static int sun4i_hdmi_setup_avi_infoframes(struct sun4i_hdmi *hdmi,
 	return 0;
 }
 
-static int sun4i_hdmi_atomic_check(struct drm_encoder *encoder,
-				   struct drm_crtc_state *crtc_state,
-				   struct drm_connector_state *conn_state)
-{
-	struct drm_display_mode *mode = &crtc_state->mode;
-
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		return -EINVAL;
-
-	return 0;
-}
-
 static void sun4i_hdmi_disable(struct drm_encoder *encoder,
 			       struct drm_atomic_state *state)
 {
@@ -166,31 +154,61 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder,
 	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
 }
 
-static enum drm_mode_status sun4i_hdmi_mode_valid(struct drm_encoder *encoder,
-					const struct drm_display_mode *mode)
+static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs = {
+	.atomic_disable	= sun4i_hdmi_disable,
+	.atomic_enable	= sun4i_hdmi_enable,
+};
+
+static enum drm_mode_status
+sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
+				 const struct drm_display_mode *mode,
+				 unsigned long long clock)
 {
-	struct sun4i_hdmi *hdmi = drm_encoder_to_sun4i_hdmi(encoder);
-	unsigned long rate = mode->clock * 1000;
-	unsigned long diff = rate / 200; /* +-0.5% allowed by HDMI spec */
+	const struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
+	unsigned long diff = clock / 200; /* +-0.5% allowed by HDMI spec */
 	long rounded_rate;
 
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		return MODE_BAD;
+
 	/* 165 MHz is the typical max pixelclock frequency for HDMI <= 1.2 */
-	if (rate > 165000000)
+	if (clock > 165000000)
 		return MODE_CLOCK_HIGH;
-	rounded_rate = clk_round_rate(hdmi->tmds_clk, rate);
+
+	rounded_rate = clk_round_rate(hdmi->tmds_clk, clock);
 	if (rounded_rate > 0 &&
-	    max_t(unsigned long, rounded_rate, rate) -
-	    min_t(unsigned long, rounded_rate, rate) < diff)
+	    max_t(unsigned long, rounded_rate, clock) -
+	    min_t(unsigned long, rounded_rate, clock) < diff)
 		return MODE_OK;
+
 	return MODE_NOCLOCK;
 }
 
-static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs = {
-	.atomic_check	= sun4i_hdmi_atomic_check,
-	.atomic_disable	= sun4i_hdmi_disable,
-	.atomic_enable	= sun4i_hdmi_enable,
-	.mode_valid	= sun4i_hdmi_mode_valid,
-};
+static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
+					     struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc *crtc = conn_state->crtc;
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	enum drm_mode_status status;
+
+	status = sun4i_hdmi_connector_clock_valid(connector, mode,
+						  mode->clock * 1000);
+	if (status != MODE_OK)
+		return -EINVAL;
+
+	return 0;
+}
+
+static enum drm_mode_status
+sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
+				struct drm_display_mode *mode)
+{
+	return sun4i_hdmi_connector_clock_valid(connector, mode,
+						mode->clock * 1000);
+}
 
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
@@ -236,6 +254,8 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 }
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
+	.atomic_check	= sun4i_hdmi_connector_atomic_check,
+	.mode_valid	= sun4i_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };
 

-- 
2.43.0

