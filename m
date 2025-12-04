Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7117ACA28DC
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EF910E84C;
	Thu,  4 Dec 2025 06:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="T82g+2zM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Thu, 04 Dec 2025 06:36:56 UTC
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F2510E84C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1764830213;
 bh=RCoApW58uwU2PDY/YzjUBVlUXFHY8idxqTE/wHC6S8g=;
 h=From:To:Subject:Date:Message-Id;
 b=T82g+2zMHmeVoK7KDy1GxTZMOVJN6Yg2f7tyAzVHIAUCJZJY9sOSqNepvVRLhUuzh
 3Gg+Mn8CTP5b9foQd5rzik5fhWanImAr6TRvcWn9hoedTJsr3r664Vhtn0cQg1kICk
 tCgWF48UTDIT/lnEARp8omrsBjiC386rPKawdDQw=
X-QQ-mid: esmtpsz21t1764829897t315fc6bd
X-QQ-Originating-IP: 8xj2EBC2OrSdr2vMc6zndzxvKdFt5qIneZrq+PewvGw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 04 Dec 2025 14:31:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17481815092374181840
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
Subject: [RESEND PATCH v11 04/11] drm/bridge: aux: Add
 drm_aux_bridge_register_from_node()
Date: Thu,  4 Dec 2025 14:31:02 +0800
Message-Id: <20251204063109.104-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MKzYG8XJzx27v8Wno56Jlu1H7IM6N3zdsX60g1kLvFF7Ynxlq8pxEwhX
 Xs+EhjwSzni5a97Im7V50/1F1M8XCNApQyoz2vMA9im/PVAepmGVPMMyKbB8/3XWs697nq0
 AU+KCTzVhVTDXIf8PL6CgfbxDVgAU64OEjZ0LVivuuyuZZEABQ60ha3qt+yULbypTjjwGPO
 5K2PeJjZqQV7lNEa6SiNiNpHggmY+TH/Med7sXgo1+9P5sfw7gtRBWsddCRfI8V5nivo1MC
 g4aQfJVdOl5T0iKmL/i2Or04vw65rc3ZzmgBQkESWVy5ZYAEJQ6ymKl73pPZQyBGLSf9G/c
 r82o8xID/hZxsTIaJqDlC/lyARWuGIFV1uhuFxottSYqHU0PqQyiK+YQivFFE35no6YJx3b
 WL/UekB8tnckIa+vqAJlIVhcWqn/z5tCG0fJVqI5BvvFJwLxKSTZURUIXBJI1hO6A9izIWV
 u8YjJdWdeeN7q3Tf1bz+Rnm+FskSfT8XIxW6hrjE8MpSlXa4ynie4x+lVQSprcuatqQzcB8
 muP3yLsKIDfWhXdp5DhN0i6dOVTkZRTH/4Oay3KWURyCFnTY5ds4G1ep0wiQA9H9LkFwDFa
 A+Ut0anIgMCFqDnweowi5Y7qZTQi4g1/HWYa/T4K7Zxa5cU6qh0uuxoT17q/+N/X6UrIVHX
 6zgbeluXwTooVDSVEU1R4ZAGX+HJvj0tXGizdEDm4AjAmFFJtZoYhv+7SYgVhE3xKqtCI0u
 mMfGQqE4m1328yj4mK7gN82aLjI2TGvcVl+4sJs1tO7ZNnOSFKYKjaXM3B96r3wLqfNAQkz
 9tTlzV4cdiw5RswcxyVp9x7xrhJdLFch9yzmt72YbBuwFRnEITam3nfYC2EPsejUoVdIR9A
 AFXvQTmtWGLiHrP24j+97UywDKWQ+7aw9e74Lrzde/WayDdVg28+KhwWA+tUvLbXq03IQJP
 70gRxm1tJHltMtOXpr66tvP4VJuyPvNuLyqzOzzyn6w6/Lh7TEj648Pr4ZXiBwV/shAPWOq
 pYKBvtMA==
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

The drm_aux_bridge_register() uses the device->of_node as the
bridge->of_node.

This patch adds drm_aux_bridge_register_from_node() to allow
specifying the of_node corresponding to the bridge.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---

(no changes since v11)

 drivers/gpu/drm/bridge/aux-bridge.c | 24 ++++++++++++++++++++++--
 include/drm/bridge/aux-bridge.h     |  6 ++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index b3e4cdff61d6..52dff4601c2d 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -35,6 +35,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
 /**
  * drm_aux_bridge_register - Create a simple bridge device to link the chain
  * @parent: device instance providing this bridge
+ * @np: device node pointer corresponding to this bridge instance
  *
  * Creates a simple DRM bridge that doesn't implement any drm_bridge
  * operations. Such bridges merely fill a place in the bridge chain linking
@@ -42,7 +43,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
  *
  * Return: zero on success, negative error code on failure
  */
-int drm_aux_bridge_register(struct device *parent)
+int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
 {
 	struct auxiliary_device *adev;
 	int ret;
@@ -62,7 +63,10 @@ int drm_aux_bridge_register(struct device *parent)
 	adev->dev.parent = parent;
 	adev->dev.release = drm_aux_bridge_release;
 
-	device_set_of_node_from_dev(&adev->dev, parent);
+	if (np)
+		device_set_node(&adev->dev, of_fwnode_handle(np));
+	else
+		device_set_of_node_from_dev(&adev->dev, parent);
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {
@@ -80,6 +84,22 @@ int drm_aux_bridge_register(struct device *parent)
 
 	return devm_add_action_or_reset(parent, drm_aux_bridge_unregister_adev, adev);
 }
+EXPORT_SYMBOL_GPL(drm_aux_bridge_register_from_node);
+
+/**
+ * drm_aux_bridge_register - Create a simple bridge device to link the chain
+ * @parent: device instance providing this bridge
+ *
+ * Creates a simple DRM bridge that doesn't implement any drm_bridge
+ * operations. Such bridges merely fill a place in the bridge chain linking
+ * surrounding DRM bridges.
+ *
+ * Return: zero on success, negative error code on failure
+ */
+int drm_aux_bridge_register(struct device *parent)
+{
+	return drm_aux_bridge_register_from_node(parent, NULL);
+}
 EXPORT_SYMBOL_GPL(drm_aux_bridge_register);
 
 struct drm_aux_bridge_data {
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..7dd1f17a1354 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -13,11 +13,17 @@ struct auxiliary_device;
 
 #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
 int drm_aux_bridge_register(struct device *parent);
+int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np);
 #else
 static inline int drm_aux_bridge_register(struct device *parent)
 {
 	return 0;
 }
+
+static inline int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
+{
+	return 0;
+}
 #endif
 
 #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
-- 
2.51.1

