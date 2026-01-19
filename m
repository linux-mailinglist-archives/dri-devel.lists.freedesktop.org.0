Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9CD39FFF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8A810E379;
	Mon, 19 Jan 2026 07:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="JLwCtCs5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-usa2.onexmail.com (smtp-usa2.onexmail.com [35.173.142.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D773A10E379
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1768808046;
 bh=R2+PAKy3j90tO2/aruykNQqG1CqbsF2c64m7OhVP2Wo=;
 h=From:To:Subject:Date:Message-Id;
 b=JLwCtCs5DtAW5cAYZiWvKJZGOG5OplkHRiiTQSxZHhNgYAtqzdySVBO2ppr/O3q1z
 j/jM+U0iYKhf2PK1RjvQPKWV5Q15WnO5cvxURpJ9ic+9ySVrdCGaOGmtXgOQSLnwdD
 dbGJ8A9mCzWdG/BAlZDaBQFtI1rge4koWJh4vfKI=
X-QQ-mid: esmtpsz17t1768807916td2cc47e5
X-QQ-Originating-IP: 3ssUqBNd2o2Knol46BpVfLFCjgBvfw+ahn46Z46w9Z8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 19 Jan 2026 15:31:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 924543254067491200
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v14 6/9] drm/rockchip: cdn-dp: Support handle lane info
 without extcon
Date: Mon, 19 Jan 2026 15:30:57 +0800
Message-Id: <20260119073100.143-7-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MVbvI5amSZ2YcLIzxUIrBzKbeXwSVSMKxiEzsA6dGvNwUwuJDMNr1eU+
 DWQuZfTvsix0NTXcGPJArZvsHaL7KBUuZ07hGQTsHNjHrSWRJpac+SX7DHRsrAt8RjIkC59
 QVtfqPBBf1F264Wpiq0s0PNj3by2s4jRaib7uCCLOLykI1Gz8iwUiauZJP7PwxFZOBvhZGr
 PfkObAI7rID0WtVu2YNlKdch95+6eHT6tZjLbbfb3N+AQ/ISrtDGzLQpdKygzKYszeXUsLa
 Y0aIh8TLo/JouIE+5UNHkZVeQbDpb8JIvulSmf9TVkgKMRc5Yq0wJCLDg2iA1wjXC+mUKaX
 zvYkQPmRA6fqiSe2WJBAS3U31BDd6WaqPX2B8xbZPri+Vma1czTRFgeV5aDMxY8foG6hMZA
 oMnxJoCVginxyYQoQSnCpyQJoVga4K9rI24vTsObwBKOZT+ZtzGw9+4XJn2yqEoPMSjKTKQ
 G2fftZw+lekbbpWTSCwPAC+4t+P1lgYQC82j4SzcMjPnkIUYZgeRdC2bDDUIWxIycr4EAIe
 GNRF3tlhEmOPL7hebv6s7YV9f/6zytFUyGslAcDJAX1r5jyGh0uEnrw6CPpBt1kO/7Zeula
 62cdogRS+bTukEHtw9DHw1QfpvRkJOYVDtqnjXL6pc3Qmn0sb6honr22gySTqE42aN59eYJ
 hkJX8i9pxTrTM2FvPZqWDUcFy1AAwJ8++UjPRTCK0MsodZpJX/QMQ9fU1YEDudya+QnXsHn
 EV5E+vlULzl6abLOcR2979fB5mM2j7UiG1TJoKsZMLtiOl5jIH71Biwys8V5geJ0rfvlLuJ
 DLxqds7nC9c66IdmyKiE5W2BVAZbkTwIWmYC/Clkgel6PZWf8/1ut/2yGkK0/Cyasko0oCy
 kShze33ojXIGZZRlD/SFmy2qQGhcPtbWTlMFIC/4k1gpElainQjs/cW/w+txsi/qEVjbbEv
 81Ap9hg97/1mc7Xib+294EmNie8gP0CzrckuFmqGOgSWRcLtXvN2fwtd+MINw8qKb+Ohu3d
 5bGOKGKynNAzQ+1LU0z6Jk/sU/nlhbAy8HpfzlPR3ECpawJt6MJBr9Eg1RoZA=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This patch add support for get PHY lane info without help of extcon.

There is no extcon needed if the Type-C controller is present. In this
case, the lane info can be get from PHY instead of extcon.

The extcon device should still be supported if Type-C controller is
not present.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v5)

Changes in v4:
- Remove cdn_dp_hpd_notify().

(no changes since v3)

Changes in v2:
- Ignore duplicate HPD events.
---

 drivers/gpu/drm/rockchip/cdn-dp-core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b7e3f5dcf8d5..1e27301584a4 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -156,6 +156,9 @@ static int cdn_dp_get_port_lanes(struct cdn_dp_port *port)
 	int dptx;
 	u8 lanes;
 
+	if (!edev)
+		return phy_get_bus_width(port->phy);
+
 	dptx = extcon_get_state(edev, EXTCON_DISP_DP);
 	if (dptx > 0) {
 		extcon_get_property(edev, EXTCON_DISP_DP,
@@ -219,7 +222,7 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 	 * some docks need more time to power up.
 	 */
 	while (time_before(jiffies, timeout)) {
-		if (!extcon_get_state(port->extcon, EXTCON_DISP_DP))
+		if (port->extcon && !extcon_get_state(port->extcon, EXTCON_DISP_DP))
 			return false;
 
 		if (!cdn_dp_get_sink_count(dp, &sink_count))
@@ -385,11 +388,14 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
 		goto err_power_on;
 	}
 
-	ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
-				  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
-	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "get property failed\n");
-		goto err_power_on;
+	property.intval = 0;
+	if (port->extcon) {
+		ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
+					  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
+		if (ret) {
+			DRM_DEV_ERROR(dp->dev, "get property failed\n");
+			goto err_power_on;
+		}
 	}
 
 	port->lanes = cdn_dp_get_port_lanes(port);
@@ -1028,6 +1034,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
+		if (!port->extcon)
+			continue;
+
 		port->event_nb.notifier_call = cdn_dp_pd_event;
 		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
 						    EXTCON_DISP_DP,
@@ -1120,14 +1129,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
 		    PTR_ERR(phy) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
 
-		if (IS_ERR(extcon) || IS_ERR(phy))
+		if (IS_ERR(phy) || PTR_ERR(extcon) != -ENODEV)
 			continue;
 
 		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 		if (!port)
 			return -ENOMEM;
 
-		port->extcon = extcon;
+		port->extcon = IS_ERR(extcon) ? NULL : extcon;
 		port->phy = phy;
 		port->dp = dp;
 		port->id = i;
-- 
2.51.1

