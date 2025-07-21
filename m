Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13948B0C9DA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 19:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C829110E584;
	Mon, 21 Jul 2025 17:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AzketAWr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3609710E29A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 17:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753119557;
 bh=+NxwCSFikgeHnVstlsL75xTEJJOsmcejblMGw0MIuuM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AzketAWr2NbCHyuLcFl2Ql2VVzoOaz10vVWNSg9qWu/tyCjDG/VOtYrLLA2MtGYAY
 dctOAXCBMuWyI80OK/JBRp9oZ8K7/DKwVmfX5bF8xiDbYgPLQYDGFi9KN9dm/7T/cS
 dbB1/nOY8Cq3oE8xY9I2UUhOLb9KvK7WJd3OvcH6B4YcVCAAx58nT0ja9U4QA9t/F4
 t6fUhVknTJWbPVKvHp5nQ9lPDcV5CeZxkLl3b2Q0H3vC6Qg3LNFhiJTt09BqsMRxcB
 hDSA843EZ88QSpjz5j/guqUVSIxRoz20+go/4x1kGmE4LbzZ4NeEMnlTwPfHqv2q52
 fFg7I04JvS8SQ==
Received: from localhost (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id C647017E1301;
 Mon, 21 Jul 2025 19:39:17 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 21 Jul 2025 20:39:06 +0300
Subject: [PATCH 3/5] drm/rockchip: dw_hdmi_qp: Switch to phy_configure()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-rk3588-10bpc-v1-3-e95a4abcf482@collabora.com>
References: <20250721-rk3588-10bpc-v1-0-e95a4abcf482@collabora.com>
In-Reply-To: <20250721-rk3588-10bpc-v1-0-e95a4abcf482@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

Stop relying on phy_set_bus_width() based workaround to setup the TMDS
character rate and, instead, use the recently introduced HDMI PHY
configuration API.  This is also a prerequisite to enable high color
depth and FRL support.

Additionally, move the logic to ->atomic_check() callback where the
current mode rate is already provided by the connector state.  As a
matter of fact this is actually necessary to ensure the link rate is
configured before VOP2 attempts to use the PHY PLL as a DCLK source in
vop2_crtc_atomic_enable().  The rationale is to restrict any changes of
the PHY rate via CCF and, instead, prefer the PHY configuration API for
this purpose.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 37 +++++++++++++-------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 7d531b6f4c098c6c548788dad487ce4613a2f32b..b2dd29347338d58640387adb2b455cc1558d4272 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/phy/phy-hdmi.h>
 #include <linux/regmap.h>
 #include <linux/workqueue.h>
 
@@ -95,6 +96,7 @@ struct rockchip_hdmi_qp {
 	struct delayed_work hpd_work;
 	int port_id;
 	const struct rockchip_hdmi_qp_ctrl_ops *ctrl_ops;
+	unsigned long long tmds_char_rate;
 };
 
 struct rockchip_hdmi_qp_ctrl_ops {
@@ -113,24 +115,9 @@ static struct rockchip_hdmi_qp *to_rockchip_hdmi_qp(struct drm_encoder *encoder)
 static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
 {
 	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
-	struct drm_crtc *crtc = encoder->crtc;
-	unsigned long long rate;
 
 	/* Unconditionally switch to TMDS as FRL is not yet supported */
 	gpiod_set_value(hdmi->enable_gpio, 1);
-
-	if (crtc && crtc->state) {
-		rate = drm_hdmi_compute_mode_clock(&crtc->state->adjusted_mode,
-						   8, HDMI_COLORSPACE_RGB);
-		/*
-		 * FIXME: Temporary workaround to pass pixel clock rate
-		 * to the PHY driver until phy_configure_opts_hdmi
-		 * becomes available in the PHY API. See also the related
-		 * comment in rk_hdptx_phy_power_on() from
-		 * drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
-		 */
-		phy_set_bus_width(hdmi->phy, div_u64(rate, 100));
-	}
 }
 
 static int
@@ -138,12 +125,26 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
 {
+	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
 	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
+	union phy_configure_opts phy_cfg = {};
+	int ret;
 
-	s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
-	s->output_type = DRM_MODE_CONNECTOR_HDMIA;
+	if (hdmi->tmds_char_rate == conn_state->hdmi.tmds_char_rate)
+		return 0;
 
-	return 0;
+	phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
+
+	ret = phy_configure(hdmi->phy, &phy_cfg);
+	if (!ret) {
+		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
+		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
+		s->output_type = DRM_MODE_CONNECTOR_HDMIA;
+	} else {
+		dev_err(hdmi->dev, "Failed to configure phy: %d\n", ret);
+	}
+
+	return ret;
 }
 
 static const struct

-- 
2.50.0

