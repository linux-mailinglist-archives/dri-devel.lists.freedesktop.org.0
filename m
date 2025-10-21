Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4374BBF5BEF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 12:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8182410E2E8;
	Tue, 21 Oct 2025 10:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kIGkpJlA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A519D10E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761041972;
 bh=Oq23yGZ/GtFdV1bxn1QAep1nMXJorSEThDKlDL/e8Ec=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kIGkpJlAeylMJRXzfCmSUMtS0keJbPqm8Z9JcspzOjrzHj46Er9JoxjYPE1fVI9q7
 H1XO4dqZDTAQwwOa5Vf8v6YziT5LVO05qpUi6IPaXJXKAmoPYpNO+X5kjgrxt/U249
 QEe11QEAQz8RpY/FDBm/m18V0bxJEN1miKxToZ935lhji3LE/PsxCgOSoQXkSE1drh
 0/ZNacYRTkyOe8lBz0bMJFh82bPxalZ3IkzR5G4oKpjGzFh6yQJoNHhXItyJ9fV0Y8
 dZhxEthXWlFqmjYFRoqMTD35idig58BL8W8sWVYAnAe+h1Y8aY+NWWOu79K3gLDL3w
 GuRwu8p2jwQbg==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 2F35217E1414;
 Tue, 21 Oct 2025 12:19:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 21 Oct 2025 13:19:18 +0300
Subject: [PATCH v3 5/5] drm/rockchip: dw_hdmi_qp: Add high color depth support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-rk3588-10bpc-v3-5-3d3eed00a6db@collabora.com>
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

Since both RK3576 and RK3588 SoCs are capable of handling 10 bpc color
depth, introduce a pair of new helpers to program the necessary
registers, as well as passing bpc at PHY configuration level.

Note max_bpc is unconditionally set to 10 before initializing the QP
bridge library, as there is no need to adjust it dynamically, i.e. per
SoC variant, for now.

While setting up .enc_init() callbacks of rockchip_hdmi_qp_ctrl_ops,
also replace the unnecessary whitespace chars before .irq_callback()
assignments.

Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 54 ++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index ac5ec697b9a2..ca3fa3965302 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -70,6 +70,12 @@
 #define RK3588_HDMI1_LEVEL_INT		BIT(24)
 #define RK3588_GRF_VO1_CON3		0x000c
 #define RK3588_GRF_VO1_CON6		0x0018
+#define RK3588_COLOR_DEPTH_MASK		GENMASK(7, 4)
+#define RK3588_8BPC			0x0
+#define RK3588_10BPC			0x6
+#define RK3588_COLOR_FORMAT_MASK	GENMASK(3, 0)
+#define RK3588_RGB			0x0
+#define RK3588_YUV420			0x3
 #define RK3588_SCLIN_MASK		BIT(9)
 #define RK3588_SDAIN_MASK		BIT(10)
 #define RK3588_MODE_MASK		BIT(11)
@@ -97,6 +103,7 @@ struct rockchip_hdmi_qp {
 
 struct rockchip_hdmi_qp_ctrl_ops {
 	void (*io_init)(struct rockchip_hdmi_qp *hdmi);
+	void (*enc_init)(struct rockchip_hdmi_qp *hdmi, struct rockchip_crtc_state *state);
 	irqreturn_t (*irq_callback)(int irq, void *dev_id);
 	irqreturn_t (*hardirq_callback)(int irq, void *dev_id);
 };
@@ -111,9 +118,16 @@ static struct rockchip_hdmi_qp *to_rockchip_hdmi_qp(struct drm_encoder *encoder)
 static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
 {
 	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
+	struct drm_crtc *crtc = encoder->crtc;
 
 	/* Unconditionally switch to TMDS as FRL is not yet supported */
 	gpiod_set_value(hdmi->enable_gpio, 1);
+
+	if (!crtc || !crtc->state)
+		return;
+
+	if (hdmi->ctrl_ops->enc_init)
+		hdmi->ctrl_ops->enc_init(hdmi, to_rockchip_crtc_state(crtc->state));
 }
 
 static int
@@ -126,16 +140,19 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 	union phy_configure_opts phy_cfg = {};
 	int ret;
 
-	if (hdmi->tmds_char_rate == conn_state->hdmi.tmds_char_rate)
+	if (hdmi->tmds_char_rate == conn_state->hdmi.tmds_char_rate &&
+	    s->output_bpc == conn_state->hdmi.output_bpc)
 		return 0;
 
 	phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
+	phy_cfg.hdmi.bpc = conn_state->hdmi.output_bpc;
 
 	ret = phy_configure(hdmi->phy, &phy_cfg);
 	if (!ret) {
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
 		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
 		s->output_type = DRM_MODE_CONNECTOR_HDMIA;
+		s->output_bpc = conn_state->hdmi.output_bpc;
 	} else {
 		dev_err(hdmi->dev, "Failed to configure phy: %d\n", ret);
 	}
@@ -371,15 +388,45 @@ static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 }
 
+static void dw_hdmi_qp_rk3576_enc_init(struct rockchip_hdmi_qp *hdmi,
+				       struct rockchip_crtc_state *state)
+{
+	u32 val;
+
+	if (state->output_bpc == 10)
+		val = FIELD_PREP_WM16(RK3576_COLOR_DEPTH_MASK, RK3576_10BPC);
+	else
+		val = FIELD_PREP_WM16(RK3576_COLOR_DEPTH_MASK, RK3576_8BPC);
+
+	regmap_write(hdmi->vo_regmap, RK3576_VO0_GRF_SOC_CON8, val);
+}
+
+static void dw_hdmi_qp_rk3588_enc_init(struct rockchip_hdmi_qp *hdmi,
+				       struct rockchip_crtc_state *state)
+{
+	u32 val;
+
+	if (state->output_bpc == 10)
+		val = FIELD_PREP_WM16(RK3588_COLOR_DEPTH_MASK, RK3588_10BPC);
+	else
+		val = FIELD_PREP_WM16(RK3588_COLOR_DEPTH_MASK, RK3588_8BPC);
+
+	regmap_write(hdmi->vo_regmap,
+		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
+		     val);
+}
+
 static const struct rockchip_hdmi_qp_ctrl_ops rk3576_hdmi_ctrl_ops = {
 	.io_init		= dw_hdmi_qp_rk3576_io_init,
-	.irq_callback	        = dw_hdmi_qp_rk3576_irq,
+	.enc_init		= dw_hdmi_qp_rk3576_enc_init,
+	.irq_callback		= dw_hdmi_qp_rk3576_irq,
 	.hardirq_callback	= dw_hdmi_qp_rk3576_hardirq,
 };
 
 static const struct rockchip_hdmi_qp_ctrl_ops rk3588_hdmi_ctrl_ops = {
 	.io_init		= dw_hdmi_qp_rk3588_io_init,
-	.irq_callback	        = dw_hdmi_qp_rk3588_irq,
+	.enc_init		= dw_hdmi_qp_rk3588_enc_init,
+	.irq_callback		= dw_hdmi_qp_rk3588_irq,
 	.hardirq_callback	= dw_hdmi_qp_rk3588_hardirq,
 };
 
@@ -472,6 +519,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 
 	plat_data.phy_ops = cfg->phy_ops;
 	plat_data.phy_data = hdmi;
+	plat_data.max_bpc = 10;
 
 	encoder = &hdmi->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);

-- 
2.51.0

