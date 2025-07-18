Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7EEB09B54
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 08:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3083310E877;
	Fri, 18 Jul 2025 06:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="RpS8TksA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4E710E00C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 06:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1752820005;
 bh=RN1WwuxpO4LBAyRHMTh9poQETUIZdvEm0QRwkE/4D2M=;
 h=From:To:Subject:Date:Message-Id;
 b=RpS8TksAxjb6jspQd0B4zCfRJJtN0ihOu8shADmm53LJVk/9H4Uew8mc47AhMKdNJ
 1ZkfdVgejPRUQA1uPzSJxKp/Pv54v6RYNjMJrDKzRiTfnwFEvsUZrFK+oRjM6l0RdZ
 It92WHiyocdTDPbtWLSrBxcicJ+/qijWRzINRhcM=
X-QQ-mid: zesmtpgz7t1752819996t97191eb6
X-QQ-Originating-IP: kzXOt25riktyxVYSJcZnz65OhKPsh6RSYah7TO6HhiY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 18 Jul 2025 14:26:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10748363964261664298
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/rockchip: cdn-dp: Support handle lane info and HPD
 without extcon
Date: Fri, 18 Jul 2025 14:26:17 +0800
Message-Id: <20250718062619.99-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250718062619.99-1-kernel@airkyi.com>
References: <20250718062619.99-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: M4UlvagBawrD93O/q+mOx2k20dFCvhqd6BEyr87user6UVl0wnQuatcm
 EXjvrGjWZ+Kfl+Mq6TdKq8wofV4fUb/RoqHtqAqWq5YjpQm/igcun+uMAoTd5aAoYLzLdqY
 eal4LAhdg9wzdJ1rvYdKgiTJ0oSRgpc5YmQPB/Fd07G5Qhmry06vGc4/0H8hZgCFfO6cYDE
 wjqjiiZ6H+0p7ZeR4po/bSpTR1aEPrN44oOIRDxOw8W1UPVLjCBwlzWrC4Uh1i/RI195VpE
 t1V9ACe5rvhAJgCHGI8AO+V2Dpc2Ll8sg3MaP4LI9sxe61dSDzdHzao01VZhqw+cB5mkZ+k
 advazdJeGid2VAnA6hK6V0p0qk5S/IbLAhBruPexoeDrmxTprYn8Yh7PP68GOOlpBPI97nI
 6i7zAdYA468WSmPTvvXfLT+yCa1Rsfa/thUPWHXikU5D2G57xC8taCpr8QSf9zJnaWhk8LK
 6+ID48h1e+7zKR7u1dlb9GigpciDO4XxnYHJ7z2U3oXViwTqGl3gy2VPdsFJJ2/KN+EsTBo
 WfG3KZ04dqNfancgaTELPj6muEhsueUI0B7LSdEKTxn5kOfa/v40gDzxmxXnG5+SpklmKku
 XEfUPAtldRs56CbSkRCd/Q4t5lciVX/oLhcRcpXm5daMwsSl5yuDZiuyIx/0eM9xdM6r3Mj
 6pULTKJKSEmMXnLZhVbmg2ZeQPFw8UPu8N46aN+0OPbAVTDs7JZeG2fHovQG6+IYDn0zeHZ
 GN5e0ZeYnu6G9LDVU72cNCp2GRrOLTmTrRHM94IdNdSsbrOj4O5k4tltjKlfYWSQncKK266
 Y8oqrjnAFNg74yDapkRpiaATxMn5PVg7XSaq27KlvHJ1ScABNY90Sf0sQqnxT2o66jLHDbj
 W5H5e9iPY0+3Gbz/bt6w5RQ2WvNrYn2gm4Gr9d+0vUJT3MVKOeBkQ0vNeu4lPTx2rX1vgA7
 A9e9vNl2KMKL2Mwq/gkiEg0luzWLwUa60oq5bDSW+E1NEm96D9p9VM/ZqN5NQb8033GyvsH
 uEIClVBg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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

