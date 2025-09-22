Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB01B8EB10
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 03:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3764310E369;
	Mon, 22 Sep 2025 01:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="lzPSthQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 409 seconds by postgrey-1.36 at gabe;
 Mon, 22 Sep 2025 01:30:12 UTC
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77B610E369
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 01:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1758504609;
 bh=bU2sAmzXCR713CrWSoUTQXsce2x0+sMC5yQVrxIUCRM=;
 h=From:To:Subject:Date:Message-Id;
 b=lzPSthQ1TZ/0L9KO4nxeFZnXCmfIBycvShf+EfA0iH4DDV/UJE2y4re1BqpnY59ob
 bYpeEZ9JohDZ9vojQ3ayNy/g+wAu1qLUjeVlNgG2e4rtKzumfwNLOx0lWg7bs1/kWG
 86RIr0CWddt1CpXw1RXkAQ2QwpYjk/y36TatkozA=
X-QQ-mid: zesmtpgz1t1758504063t10fb6b9b
X-QQ-Originating-IP: DDHFghLsHmSB71st719yB2ojgwG4K8hbUJVFjP+vjd8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 22 Sep 2025 09:21:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17509678942044025662
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/7] drm/rockchip: cdn-dp: Support handle lane info without
 extcon
Date: Mon, 22 Sep 2025 09:20:36 +0800
Message-Id: <20250922012039.323-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250922012039.323-1-kernel@airkyi.com>
References: <20250922012039.323-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NakEBl84zUNhI/bl5diWmhJPRSe6uUocPWZilbg8zsXv0jF4oVghj9UQ
 mvHCU60HYDaFqApTy/eQ6JMR9CO5R3rDpQf6miQT/7SN/v0tQdI+I6EAqc08usi3a6IoUvs
 CdaQtNie+vXhjzf+FfIHY0dFRVi4iT83wpvFkh0b/ChgCBsaNGozZlB79RQ3yBGGEB9djEk
 NYWgsiFC+PevHDFxi9krrGAxGGT+Te5U6v+tM49lYU8qI3WiWHBU7jJlnqdHJjGFtthtRkJ
 41/o4kcfm7w3P+yZ52nse2ver5lMVuOW+cXKJ9+DnzbjED4P9q01MbgKyW8Wi4Lkj6g9Ycq
 NmXRmisvCQi3Vg3VfZ+OTHbpsd79K2u4wBQPwehusoMNyLhb/BtNIZW9BfUXd14u76Ro9Y/
 KZlzQp7nDJLSu6eNFQDlrV+0bdOXb0gBUhGaLqwfjoG6vpFcvHLxhlYPdbR1JUwPzOqH2vB
 Z5LmVSXD2CJTLDkQdRnTPkykik4rIR19Llu4ezQPjytcdDYPH3UNbknMiwcvZ/ggFWmMygz
 FNonJIl/iDSGc9SszZW26iyJOREdCXnk+aPeERVPzqMKLqjrSEFx5Mu1/ZAJAWpSKqyOnfp
 sFBCaFtPBg0KgTYYJfbczieNnYzeCermWxX0OKsPFS4seglPYnWQAGNHV4ut09/oIoV5tL9
 s4DACsre5wX1klNqVV3WPDdJgKR80K5LsUjiCjBSHmFqp44ghapg8GwIJFwMkyhREdtTB0b
 GiWQA0FunLeoEuURK/Wv7RjGmmdIk/rC7UAVVEUJmvSdBR3a7CssdVLEHYLv+hZTWtp3lRn
 4p+7ffZpEaqzalxiuhdAfbkqWMV8Oqkl6Snb1miw4g7Fm4EAtIGYkfriaYHSyq09Ea2jLYl
 P5Rfb4R0mYTx56YP0Ybk6wUpctrxhQ0p9JHUaQVB6cRAkrnsgJRtfXD7CjMAszEW3rY2t4y
 dkvx97kgyownVvcV8TkzmbXTmaWm10uamtGed0HCZRe8cTKtf21HyeVTA
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
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

Changes in v4:
- Remove cdn_dp_hpd_notify().

(no changes since v3)

Changes in v2:
- Ignore duplicate HPD events.

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
2.49.0

