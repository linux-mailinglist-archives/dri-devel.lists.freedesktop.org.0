Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17106C90949
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 03:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F5610E8A9;
	Fri, 28 Nov 2025 02:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="sUnH9D1v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6578410E8A9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 02:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1764295668;
 bh=9oGlaHNtIhbTx7QkJKVpo4Ol7UjzU3rpuzSq9kjRP4w=;
 h=From:To:Subject:Date:Message-Id;
 b=sUnH9D1vszxzWxHqUqcGMD/u9ZJRzXKZ/OzTTKMba/GpP781neRRNBG5dgVcl7PM+
 F0e1nV4DfcOUCkPEFQU4qY/wlL+mDBGY1TwcADsXvlRv+Rafze31qz2VISSk9wLUBP
 6pvdEpI2A9ybp2ODjSrKrq0aIP6jmckCohwI3pPU=
X-QQ-mid: esmtpsz21t1764295465t7596bef1
X-QQ-Originating-IP: s57CgJLpnxFBXEh8PABts4Hm4Tdr1U3366rUMeJac1Y=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 28 Nov 2025 10:04:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4342192847076017711
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
Subject: [PATCH v11 02/11] usb: typec: Export typec bus and typec altmode
 device type
Date: Fri, 28 Nov 2025 10:03:56 +0800
Message-Id: <20251128020405.90-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NT9b64/RmY6NGAK1f+8S/uejkBQIQVMqpSjrp5PMoGGs3Gh2+zVE9o4F
 FpAeIHSROrlL+KBSUqZ2cZwfhAkHnMeRWN/EJZyVIqZftKVn1pPsykoxn//GArcdIeIxaNO
 ffXfzWdMIgK21hll84j4uqojXS/l1fn9cM0MwfvPUF4oXvtL7nxyn2PnwScouoh2Per5UAZ
 muiw4L9muQxUA3e4QYNL1gbpyz3/r1tn2GHCdr86V9rQTc9ZaJMAlYBKkyHX3B1e63glrX4
 pqLbBnoVpX4H70LM5j0ZGZY6Cj8JlBLDnPvFHsCcLQs+3Re1onta2MPkUaSTyzQE0oBDNmZ
 6S5cqdFy181+cctNBU/+qK1fq8+/aQ0QLKcG6E4upjR4EdRTrGEeO4RlWfu+JUMjBRne7Y/
 NKg63pDNwURpKgOvsHw7LA/jEnwViumyXItklXpnc2VhTzljPOCQ4IkkSURzGSBvBll0xsj
 7nvc/hx2DccviAAO0Ua2f2Xn78M+rgTi7bmnh+dMuV+xs2Qa1AFn6eEWB0N1XrorE8UiP57
 JvI5AvMMHldDgl2aVxsX/Jp4evOHI6XtwJRKsvx7KKDderS3qKIcvCiTpXTSkVW5LxNooQl
 Xc5zfi2uQRGvNwC4pRgw14H8Xd6byMIBxIjlrEPsnGKCho0eELQjCGkaiZjYKYygsjv7KAl
 6W4bgNYRDf0OQiBDTrFXN7mWzpOJSa5NpZ93RmojV83n5D8M3yN75IQyfd4Qubo8N4KAqIQ
 RMlxuVg2r02meN+uCdFgUaRnF//CIvP0qFZ1hoCBnCJY1buMHeZaO5F+rcHcuDmptsu75M1
 E7oQEE5EGTJGqHVyf0Lhh1ZfkaibytqDlTdNF5UDQTEx7VKDq+OKwSbY3FNyan/oXMqnr/y
 0XOdKvFtsf42Gyr84ggxb7IqyaCB5qxZB1K1YvnlLQwRoAIUTGnLDXfBZmLQ0nZHvDwxwbZ
 k//4VKhz2OM2KiH5LFWjQPXi6TCwi50K13QyNm8C2Na4tuNKtuvO30on8lSq8Q3/ycGituc
 sqWJfv/A==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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

The DRM may want to register a notifier on the typec bus to know when
a typec altmode device is added, and distinguish between different
types of typec altmode device.

Export these things.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v11:
- Also export typec bus.
- Add more detailed comments.

(no changes since v9)

 drivers/usb/typec/bus.c           |  1 +
 drivers/usb/typec/bus.h           | 10 ----------
 drivers/usb/typec/class.c         |  3 +++
 include/linux/usb/typec.h         |  3 +++
 include/linux/usb/typec_altmode.h |  8 ++++++++
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index a33da7f458a5..e84b134a3381 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -569,3 +569,4 @@ const struct bus_type typec_bus = {
 	.probe = typec_probe,
 	.remove = typec_remove,
 };
+EXPORT_SYMBOL_GPL(typec_bus);
diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
index b58e131450d1..7df5deb1dd3a 100644
--- a/drivers/usb/typec/bus.h
+++ b/drivers/usb/typec/bus.h
@@ -5,7 +5,6 @@
 
 #include <linux/usb/typec_altmode.h>
 
-struct bus_type;
 struct typec_mux;
 struct typec_retimer;
 
@@ -28,13 +27,4 @@ struct altmode {
 
 #define to_altmode(d) container_of(d, struct altmode, adev)
 
-extern const struct bus_type typec_bus;
-extern const struct device_type typec_port_altmode_dev_type;
-extern const struct device_type typec_plug_altmode_dev_type;
-extern const struct device_type typec_partner_altmode_dev_type;
-
-#define is_typec_port_altmode(dev) ((dev)->type == &typec_port_altmode_dev_type)
-#define is_typec_plug_altmode(dev) ((dev)->type == &typec_plug_altmode_dev_type)
-#define is_typec_partner_altmode(dev) ((dev)->type == &typec_partner_altmode_dev_type)
-
 #endif /* __USB_TYPEC_ALTMODE_H__ */
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index d6b88317f8a4..c4ff4310ff58 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -537,18 +537,21 @@ const struct device_type typec_port_altmode_dev_type = {
 	.groups = typec_altmode_groups,
 	.release = typec_altmode_release,
 };
+EXPORT_SYMBOL_GPL(typec_port_altmode_dev_type);
 
 const struct device_type typec_plug_altmode_dev_type = {
 	.name = "typec_plug_alternate_mode",
 	.groups = typec_altmode_groups,
 	.release = typec_altmode_release,
 };
+EXPORT_SYMBOL_GPL(typec_plug_altmode_dev_type);
 
 const struct device_type typec_partner_altmode_dev_type = {
 	.name = "typec_partner_alternate_mode",
 	.groups = typec_altmode_groups,
 	.release = typec_altmode_release,
 };
+EXPORT_SYMBOL_GPL(typec_partner_altmode_dev_type);
 
 static struct typec_altmode *
 typec_register_altmode(struct device *parent,
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 309251572e2e..c6fd46902fce 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -20,12 +20,15 @@ struct typec_port;
 struct typec_altmode_ops;
 struct typec_cable_ops;
 
+struct bus_type;
 struct fwnode_handle;
 struct device;
 
 struct usb_power_delivery;
 struct usb_power_delivery_desc;
 
+extern const struct bus_type typec_bus;
+
 enum typec_port_type {
 	TYPEC_PORT_SRC,
 	TYPEC_PORT_SNK,
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index f7db3bd4c90e..9197a4637a93 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -9,6 +9,14 @@
 
 #define MODE_DISCOVERY_MAX	6
 
+extern const struct device_type typec_port_altmode_dev_type;
+extern const struct device_type typec_plug_altmode_dev_type;
+extern const struct device_type typec_partner_altmode_dev_type;
+
+#define is_typec_port_altmode(dev) ((dev)->type == &typec_port_altmode_dev_type)
+#define is_typec_plug_altmode(dev) ((dev)->type == &typec_plug_altmode_dev_type)
+#define is_typec_partner_altmode(dev) ((dev)->type == &typec_partner_altmode_dev_type)
+
 struct typec_altmode_ops;
 
 /**
-- 
2.51.1

