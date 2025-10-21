Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28047BF5BE2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 12:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A6B10E2F2;
	Tue, 21 Oct 2025 10:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="J2MW1bF2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3950010E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 10:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761041970;
 bh=s3C57jE/RyRY0ojZyNVm3JP0AqGDocSnepbywENMmxA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=J2MW1bF2jnDtDz2TXt69m4xCKV49c0rajPIZ/8IoOPaw7/xzDGcbrBDJI3AH7hYNW
 m4Skcc48Omg5ucJNp67+TljntOI5e5Lxx0a7ZKea/w6mv21leIQmLvE7WEeKOD4Vhk
 xAmTtsutwq9Q6UInX1mLLXYsvGQtvV0anLs2K1gQYanFqRKgfty7G2d8NoAwYdstaO
 NXHowjCKF6HBAeaMm43a8opDWYyN1nSaiz7xG7DFgZZfLhHSqm/jvAQwQF5B3svM9n
 gT87s9ZxxauaxNRifVctU43DiS6q+05dy1sNkoQaEviSbGKqJD0mU7nLDm+qkhxS4k
 Lb2Oo6y7EvAHQ==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id A147017E1407;
 Tue, 21 Oct 2025 12:19:30 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 21 Oct 2025 13:19:16 +0300
Subject: [PATCH v3 3/5] drm/rockchip: dw_hdmi_qp: Switch to phy_configure()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-rk3588-10bpc-v3-3-3d3eed00a6db@collabora.com>
References: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
In-Reply-To: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
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
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.3
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

Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 37 +++++++++++++-------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 931343b072ad..04e18dd9102a 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/phy/phy-hdmi.h>
 #include <linux/regmap.h>
 #include <linux/workqueue.h>
 
@@ -96,6 +97,7 @@ struct rockchip_hdmi_qp {
 	struct delayed_work hpd_work;
 	int port_id;
 	const struct rockchip_hdmi_qp_ctrl_ops *ctrl_ops;
+	unsigned long long tmds_char_rate;
 };
 
 struct rockchip_hdmi_qp_ctrl_ops {
@@ -114,24 +116,9 @@ static struct rockchip_hdmi_qp *to_rockchip_hdmi_qp(struct drm_encoder *encoder)
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
@@ -139,12 +126,26 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
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
2.51.0

