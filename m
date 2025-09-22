Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE58B8EB07
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 03:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB25810E16B;
	Mon, 22 Sep 2025 01:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="OXdzJ6AZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 502 seconds by postgrey-1.36 at gabe;
 Mon, 22 Sep 2025 01:29:45 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA3F10E16B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 01:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1758504580;
 bh=LOGwnycc8Wj8KsW4WQRnp4T1oakm2MKzkiW7+jimOy4=;
 h=From:To:Subject:Date:Message-Id;
 b=OXdzJ6AZqS3bBLH8e0LnmkS3BMwrKe7MrHjHxOzcCk7FU/oOQjKGaR/dO+npXZe3j
 Ts7MTeoV3oA+E0a/XE+bfu8RQz8S4QMkkumiGlLw97/L1bMspgTo3+L0AEm6gFXBJE
 ZFELnBHPz7Vtt3a/FxNfX+4xyjo+m/kzKPViuMZI=
X-QQ-mid: zesmtpgz1t1758504052td7dec9e0
X-QQ-Originating-IP: s3BHummt2O6hkB4Do51eRbWReEkBQZAIDj91AtlHJKk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 22 Sep 2025 09:20:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2496768016836932
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
Subject: [PATCH v4 1/7] usb: typec: Add default HPD device when register
 DisplayPort altmode
Date: Mon, 22 Sep 2025 09:20:33 +0800
Message-Id: <20250922012039.323-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250922012039.323-1-kernel@airkyi.com>
References: <20250922012039.323-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MZQHZNohqAr1d4b3kIdpe+C4sr2v02+KydlclYn3kPXkX9QWriwA44sZ
 tl6NjNtKounHPNhLPSgaBIec2LFNh3ZmJJtulRIlkzvCdAwxI5u3RspZ/EMJMZmzDZ6s+JK
 Us4iS1f3K21HNGZbVeTdh3ugbmCFdUHxqR85ZysIWazqHwUb6jo/a0gZPfEHlFxbFrHz8UD
 I8WzgpWaGSTdAi/CgA1KhpfPk0qKKQWBdhbz9sai/J2Ip7JDa6txxuKC3XP3UHQX9iqxdqt
 0f6vZOIGljM75WywhPC8iBEs18/t6NM8EP82XyUBp6eU8+L7CrLRAqUYadN2bb+JdB1gNks
 C64UQoNCcYsMAlU/yS4rcfY3cOwXuqqpT5j9Cw4m0xJpHW+I0QNTUw/TepDP9YusbA26q0j
 W+JFXZPPGhAPA+u7PXAeBAI7ae9uJAEi6rlUJ0vi2AroTXruDhGrm4CcsT/TW6T+kLyVHq7
 7Rd0D56UiB9hOcsuTvCB4nKZHkKc6F3yRq1h7jxoFeSty6c6zoS/Z/jrwjaZuwPDCrBkjTs
 zDuv/P+0PlcuCE4CQvdkpmnUcb4sm9HYKil0XR225xIqzEdVTuPnDp8JFqmHLOEYGQhccFQ
 l0wr5XGmemBzfu69c7h7j9CRIbOx3D8+zBlzL+NA6YwRz0VwJhwPjb0trMByPnvfacB0Sa0
 Oy2gY+8jzEqwA+X5TFfh5aiVeMIFyvUfJAagvBK277oxbWOhBBGBUX7m9dJKUlmUz+ncMjG
 4ZcsscGqxsE70Gr6ZfgPmFtyK/7EsCxxRQxhT1XV9ma9c85lsLpg0mbpr0n7uBwjojQbQQE
 +qh9vlOK2RhfJeKWgFOGR5fwSHynsDSpDdu89SPwvl3IfF5J+EoevaJlPa5EyHV427SwsvK
 gKHoNXL2qzWcdMBu+/E3hc3wqERWB9debQVmNRyUwf49s2SueY1OJSseiitEK4wLSYYK7wm
 SUK6sd+acr/gosoIG5X/R3WLzyMT70RcoQ2Fszg0M8eqXFQ==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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

Add default DRM AUX HPD bridge device when register DisplayPort
altmode. That makes it redundant for each Type-C driver to implement
a similar registration process in embedded scenarios.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/usb/typec/altmodes/displayport.c | 27 ++++++++++++++++++++++++
 drivers/usb/typec/altmodes/displayport.h |  2 ++
 drivers/usb/typec/class.c                |  8 +++++++
 include/linux/usb/typec_altmode.h        |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 1dcb77faf85d..e026dc6e5430 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -14,6 +14,7 @@
 #include <linux/property.h>
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_dp.h>
+#include <drm/bridge/aux-bridge.h>
 #include <drm/drm_connector.h>
 #include "displayport.h"
 
@@ -182,6 +183,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 				dp->pending_irq_hpd = true;
 		}
 	} else {
+		if (dp->port->hpd_dev)
+			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
+						  hpd ? connector_status_connected :
+							connector_status_disconnected);
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
 						hpd ? connector_status_connected :
 						      connector_status_disconnected);
@@ -206,6 +211,9 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 * configuration is complete to signal HPD.
 	 */
 	if (dp->pending_hpd) {
+		if (dp->port->hpd_dev)
+			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
+						  connector_status_connected);
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
 						connector_status_connected);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
@@ -391,6 +399,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.status = 0;
 			dp->data.conf = 0;
 			if (dp->hpd) {
+				if (dp->port->hpd_dev)
+					drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
+								  connector_status_disconnected);
 				drm_connector_oob_hotplug_event(dp->connector_fwnode,
 								connector_status_disconnected);
 				dp->hpd = false;
@@ -751,6 +762,18 @@ static const struct attribute_group *displayport_groups[] = {
 	NULL,
 };
 
+void dp_altmode_hpd_device_register(struct typec_altmode *alt)
+{
+	if (alt->svid != USB_TYPEC_DP_SID)
+		return;
+
+	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
+						  dev_of_node(alt->dev.parent->parent));
+	if (IS_ERR(alt->hpd_dev))
+		alt->hpd_dev = NULL;
+}
+EXPORT_SYMBOL_GPL(dp_altmode_hpd_device_register);
+
 int dp_altmode_probe(struct typec_altmode *alt)
 {
 	const struct typec_altmode *port = typec_altmode_get_partner(alt);
@@ -812,6 +835,10 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	cancel_work_sync(&dp->work);
 	typec_altmode_put_plug(dp->plug_prime);
 
+	if (dp->port->hpd_dev)
+		drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
+					  connector_status_disconnected);
+
 	if (dp->connector_fwnode) {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
 						connector_status_disconnected);
diff --git a/drivers/usb/typec/altmodes/displayport.h b/drivers/usb/typec/altmodes/displayport.h
index e120364da9fd..9f3483ec10fb 100644
--- a/drivers/usb/typec/altmodes/displayport.h
+++ b/drivers/usb/typec/altmodes/displayport.h
@@ -2,7 +2,9 @@
 #if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
 int dp_altmode_probe(struct typec_altmode *alt);
 void dp_altmode_remove(struct typec_altmode *alt);
+void dp_altmode_hpd_device_register(struct typec_altmode *alt);
 #else
 int dp_altmode_probe(struct typec_altmode *alt) { return -ENOTSUPP; }
 void dp_altmode_remove(struct typec_altmode *alt) { }
+void dp_altmode_hpd_device_register(struct typec_altmode *alt) { }
 #endif /* CONFIG_TYPEC_DP_ALTMODE */
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..95732b6d9a95 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -15,6 +15,7 @@
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_retimer.h>
 #include <linux/usb.h>
+#include "altmodes/displayport.h"
 
 #include "bus.h"
 #include "class.h"
@@ -600,6 +601,13 @@ typec_register_altmode(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	/*
+	 * It is too late to register the HPD device when the DisplayPort
+	 * altmode device becomes ready. If the current altmode is DP,
+	 * register a static HPD device.
+	 */
+	dp_altmode_hpd_device_register(&alt->adev);
+
 	return &alt->adev;
 }
 
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index b3c0866ea70f..acb0af1b9d5d 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -21,6 +21,7 @@ struct typec_altmode_ops;
  * @desc: Optional human readable description of the mode
  * @ops: Operations vector from the driver
  * @cable_ops: Cable operations vector from the driver.
+ * @hpd_dev: HPD device for DisplayPort
  */
 struct typec_altmode {
 	struct device			dev;
@@ -32,6 +33,7 @@ struct typec_altmode {
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
 	const struct typec_cable_ops	*cable_ops;
+	struct device			*hpd_dev;
 };
 
 #define to_typec_altmode(d) container_of(d, struct typec_altmode, dev)
-- 
2.49.0

