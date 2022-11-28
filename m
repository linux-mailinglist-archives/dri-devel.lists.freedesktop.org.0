Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13AB63BAEE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 08:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD5910E052;
	Tue, 29 Nov 2022 07:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out-01.comm2000.it (smtp-out-01.comm2000.it [212.97.32.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5177B10E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 11:23:30 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-01.comm2000.it (Postfix) with ESMTPSA id 81A2E8434BE;
 Mon, 28 Nov 2022 12:23:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1669634607;
 bh=o1vqXSM72h+f8G6bBVWfHnJcH7nCL56jr3X5yawBKic=;
 h=From:To:Cc:Subject:Date;
 b=OgK1M/8nDln3IvgT8gEcscYiTgyaZyxpj0SYzsR31X1FbJXL+I8r1XTqaKin2j2vj
 aige0anNUtfyLnp6/0sE7cEh3ErP3cIPHU9nUcj+nMlOzlIaN+RSYyoZ5nwi8N+9ZP
 cr42dxw0ZrMh91/tBPB//w2vpi/7ohkLfUBhuMtFpMfz8o8ssnBaZ/ub5/pdz/42rK
 +iYAvYZ3JRrnAp/gcaAa0Ki9wNNXDH5X/pHp2v2nuRoL8IiOV37N/zsW5pbzMEURwA
 Nn9ZTToGGa13RXluquqEh+HaKp3UcKiHLy9lGyxQmOgjLqp0s0ijjx4AAHvgoEIbED
 GLCWaBFBLCDhA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Adrien Grassein <adrien.grassein@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drm/bridge: lt8912b: Add hot plug detection
Date: Mon, 28 Nov 2022 12:23:20 +0100
Message-Id: <20221128112320.25708-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 29 Nov 2022 07:48:28 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Enable hot plug detection when it is available on the HDMI port.
Without this connecting to a different monitor with incompatible timing
before the 10 seconds poll period will lead to a broken display output.

Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index a98efef0ba0e..5f0c9cd2a970 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -517,14 +517,27 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+{
+	struct lt8912 *lt = data;
+
+	if (lt->bridge.dev)
+		drm_helper_hpd_irq_event(lt->bridge.dev);
+}
+
 static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
 {
 	int ret;
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 	struct drm_connector *connector = &lt->connector;
 
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
-			    DRM_CONNECTOR_POLL_DISCONNECT;
+	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD) {
+		drm_bridge_hpd_enable(lt->hdmi_port, lt8912_bridge_hpd_cb, lt);
+		connector->polled = DRM_CONNECTOR_POLL_HPD;
+	} else {
+		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+				    DRM_CONNECTOR_POLL_DISCONNECT;
+	}
 
 	ret = drm_connector_init(bridge->dev, connector,
 				 &lt8912_connector_funcs,
@@ -578,6 +591,10 @@ static void lt8912_bridge_detach(struct drm_bridge *bridge)
 
 	if (lt->is_attached) {
 		lt8912_hard_power_off(lt);
+
+		if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
+			drm_bridge_hpd_disable(lt->hdmi_port);
+
 		drm_connector_unregister(&lt->connector);
 		drm_connector_cleanup(&lt->connector);
 	}
-- 
2.25.1

