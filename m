Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7CFBBCE3C
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 01:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8602A10E3B3;
	Sun,  5 Oct 2025 23:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pP20Wmir";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C0F10E2D1
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 23:55:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D1B091FBC;
 Mon,  6 Oct 2025 01:54:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1759708464;
 bh=5iq9Aj5coQvJO210KAv+MUcPJZvSNxLS8xs01EChgI0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pP20Wmir0FbCWvKBGwg0Luw4IlbeCOnT1kkrATzJBVVEEXAHr2HiUn+BC5hr1VM8F
 uFMcTe2Nm+LlLoDsGSO9k7lKkZF4hgEDvvJg/DDrYVLiynPYBtDv3ZTYomhwbZDozP
 ZJJjOhs72bdK2ekOFuW5HNfEhhGPGRNzXMu/jjNY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Alexey Charkov <alchark@gmail.com>, Algea Cao <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Cenk Uluisik <cenk.uluisik@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Muhammed Efe Cetin <efectn@6tel.net>,
 Ondrej Jirman <megi@xff.cz>, Rob Herring <robh@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH v2 3/5] drm/rockchip: dw_hdmi_qp: Fixup usage of enable_gpio
 member in main struct
Date: Mon,  6 Oct 2025 02:55:39 +0300
Message-ID: <20251005235542.1017-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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

From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

The name of the enable_gpio member in struct rockchip_hdmi_qp is too
generic, as initially "borrowed" from downstream BSP code.  Moreover,
this hasn't been really in use so far, since there is neither a DT
providing an "enable-gpios" property to any of the "hdmi" nodes, nor a
binding documenting it.

The actual purpose of this GPIO line is to control the level shifters
for the HDMI TX data lines when switching between TMDS and FRL operating
modes, i.e. asserted for the former and deasserted for the latter.

A previous patch introduced the "tmds-enable-gpios" property of the
RK3588 HDMI TX Controller binding, hence pass the updated string to
devm_gpiod_get_optional() and rename the struct member accordingly.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 4e7794aa2dde..329a69a548bd 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -91,7 +91,7 @@ struct rockchip_hdmi_qp {
 	struct rockchip_encoder encoder;
 	struct dw_hdmi_qp *hdmi;
 	struct phy *phy;
-	struct gpio_desc *enable_gpio;
+	struct gpio_desc *tmds_enable_gpio;
 	struct delayed_work hpd_work;
 	int port_id;
 	const struct rockchip_hdmi_qp_ctrl_ops *ctrl_ops;
@@ -117,7 +117,7 @@ static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
 	unsigned long long rate;
 
 	/* Unconditionally switch to TMDS as FRL is not yet supported */
-	gpiod_set_value(hdmi->enable_gpio, 1);
+	gpiod_set_value(hdmi->tmds_enable_gpio, 1);
 
 	if (crtc && crtc->state) {
 		rate = drm_hdmi_compute_mode_clock(&crtc->state->adjusted_mode,
@@ -508,11 +508,11 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (ret < 0)
 		return dev_err_probe(hdmi->dev, ret, "Failed to get clocks\n");
 
-	hdmi->enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
-						    GPIOD_OUT_HIGH);
-	if (IS_ERR(hdmi->enable_gpio))
-		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->enable_gpio),
-				     "Failed to request enable GPIO\n");
+	hdmi->tmds_enable_gpio = devm_gpiod_get_optional(hdmi->dev, "tmds-enable",
+							 GPIOD_OUT_HIGH);
+	if (IS_ERR(hdmi->tmds_enable_gpio))
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->tmds_enable_gpio),
+				     "Failed to request TMDS enable GPIO\n");
 
 	hdmi->phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
 	if (IS_ERR(hdmi->phy))
-- 
Regards,

Laurent Pinchart

