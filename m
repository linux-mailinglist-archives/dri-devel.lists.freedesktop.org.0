Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2DBB14AA1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 11:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD2F10E5F0;
	Tue, 29 Jul 2025 09:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="KkG2ySeh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A0710E5F0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1753779659;
 bh=RN1WwuxpO4LBAyRHMTh9poQETUIZdvEm0QRwkE/4D2M=;
 h=From:To:Subject:Date:Message-Id;
 b=KkG2ySehTeBQkOmAt5k0R0G0NtoKWFklOzK/saBy4xqKa4sCChrtgN94J7N5xFzrp
 c+GR9alQnc8GoIXC0vMY9Iv00LAMx1vrLZJa0cKv+fQJWgK/CMQ4bKz9SKGEyjQ06I
 fzPL0v6NBxA56RH4ieUKQAP6cSgHIF210+CbCdj4=
X-QQ-mid: zesmtpgz1t1753779650tbf9605c9
X-QQ-Originating-IP: HOYsq8iA7FlhH8Rvf76IYCZ9Rt5I5SBH31MTUBKXFD4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 29 Jul 2025 17:00:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18407573237461644155
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/5] drm/rockchip: cdn-dp: Support handle lane info and HPD
 without extcon
Date: Tue, 29 Jul 2025 17:00:30 +0800
Message-Id: <20250729090032.97-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250729090032.97-1-kernel@airkyi.com>
References: <20250729090032.97-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NNy5VkfPTUBB1aBU7kJ+xjDPayt1AIYaz0QiCOWf2xy80aMQ08Nyl71m
 13siKxWIvK/ee0aI3k6b5OwkPXiplWUcRfVJ1i/3x3rZfKOfNUU6hIpgedzvxrdv6ib4o2F
 4Dg7nYIToKWu/Uvdr+th/bC45+fKLQ0e77vk6DDRhFOOLSjzIRZjVRQfhBb9nMLt7Bipj0k
 sx8chqQWYFMNqgXBdP2wjuIFSAO14L7Vbr5YPkVUULkM3pRd7WlNI9VExPy5WEyuiegzKBB
 1us94CwyVHflMMqnUO8lHexOFD8jSf3s3tnbRWfTxGF/cfSexCMVD23tKgQLcni5eeJh0+/
 BTsnweVgI9UrDgmoLAlnkMwHbMnzFq48DIwBg6qki/MYJkaHC85/EueK5H9v/HAbTFhbPvu
 nBsLoemqVT8bukMZdnUtDsLovN2XFtYzH+tOZwPs1mdEGErEO1VojvV7CZqH1ouoI4syHe4
 iBc+wA5YUsrh3NjGSUHOyncQyxOs725AtZPMo7w85fXr+fsYj/QCrLCNsx+nZlLwRDf0Q2l
 XPhUb2s6tXMGTiHTfa5BndpqePnJirs1B8FGn+kHQIrPKCDOzi8fnnfbR742Nfc4CHVR3+L
 8OUu0a8tDuAmv5+2aaq8TkSTB44ytqssZQWq0NkGLDoK15z0EVoYazwbxoncgHpeQUxOvOz
 vpDVc2A2wFhBDjO+oNsgMc9yEBryaXZE9LqBlIIlAtAGWdq39j8WN7Vp1XY5PQ2CGNSpaXk
 51qUOVJRvlLTK9mXIXPyJe9gCD0xVxJe6pR2NzZvEhPFe8D9KbdX05DVBaJSSSoZXgbIRwt
 87AEkky5h507WPQIsit+jpxVZ2gvk86oZ3GdFZUeNxbBomzU/3y5Rpq7u2BVgqQv4NYZcUU
 9zmk6KzEI8a/m4nwoBml0eV4/BK7s+owv7E4rOvyDKydN7loVIETLgy5Ok7gHpqA9++jg6P
 TNETq5q7OZUIdYi7/obMHoLI1lGHGrAlO6d+6Xai8TJXXZtQyPNt9rrm353vmh5SkwSAUJ9
 D3eNfE60Kn1E5XXBwU
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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

This patch add support for get PHY lane info and handle HPD state
without help of extcon.

There is no extcon needed if the Type-C controller is present. In this
case, cdn_dp_hpd_notify() will handle HPD event from USB/DP combo PHY,
and the lane info can be get from PHY instead of extcon.

The extcon device should still be supported if Type-C controller is
not present.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v2:
- Ignore duplicate HPD events.

 drivers/gpu/drm/rockchip/cdn-dp-core.c | 37 ++++++++++++++++++++------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 24f6b3879f4b..b574b059b58d 100644
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
@@ -821,6 +827,17 @@ static int cdn_dp_audio_mute_stream(struct drm_connector *connector,
 	return ret;
 }
 
+static void cdn_dp_hpd_notify(struct drm_bridge *bridge,
+			      enum drm_connector_status status)
+{
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+	enum drm_connector_status last_status =
+		dp->connected ? connector_status_connected : connector_status_disconnected;
+
+	if (last_status != status)
+		schedule_work(&dp->event_work);
+}
+
 static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -831,6 +848,7 @@ static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
 	.atomic_disable = cdn_dp_bridge_atomic_disable,
 	.mode_valid = cdn_dp_bridge_mode_valid,
 	.mode_set = cdn_dp_bridge_mode_set,
+	.hpd_notify = cdn_dp_hpd_notify,
 
 	.dp_audio_prepare = cdn_dp_audio_prepare,
 	.dp_audio_mute_stream = cdn_dp_audio_mute_stream,
@@ -1028,6 +1046,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
+		if (!port->extcon)
+			continue;
+
 		port->event_nb.notifier_call = cdn_dp_pd_event;
 		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
 						    EXTCON_DISP_DP,
@@ -1120,14 +1141,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
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

