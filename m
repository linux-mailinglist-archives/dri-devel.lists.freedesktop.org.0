Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65873CA2861
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF84010E859;
	Thu,  4 Dec 2025 06:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="eeMnGU3j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432AE10E857
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1764829891;
 bh=9oGlaHNtIhbTx7QkJKVpo4Ol7UjzU3rpuzSq9kjRP4w=;
 h=From:To:Subject:Date:Message-Id;
 b=eeMnGU3jK8jtn9w8UQOkBCGqSy2kaUb2KZDynNxn5Gk9u87Zuu0fRZWtHflPr2pXa
 eGdJMVVrlyDoeCdqG9FxKIgYYzsb4vIl/eQ3KMmOl1FiPDDtiYnwVSACWiYIf+lsIX
 tF8coF75Py/S/8Xp2QOH6qLFaqXrj8PcpA9kf7IM=
X-QQ-mid: esmtpsz21t1764829888t35ff679a
X-QQ-Originating-IP: kpCg3rmbDMu7YW/T8tSReERndLggkBplSug+8Go0WqA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 04 Dec 2025 14:31:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17088035227337033504
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
Subject: [RESEND PATCH v11 02/11] usb: typec: Export typec bus and typec
 altmode device type
Date: Thu,  4 Dec 2025 14:31:00 +0800
Message-Id: <20251204063109.104-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mo8ayuSLF3j9QxrZKtGk6kKkW/H+u39FFu7es7peju+Vts8wBr0hUV+3
 N29zGWHkJfBV69U3GKlDPBv1ItUf8BWF10zjDUyDeaT7JNFEWMiKAZIgVgZpyUg3/eWK2Qi
 RaMlKeekZfGu8n4bDlUEZBq/cKD1t/z+rhiJTyBSoGIsdP6cn/Nykuzqc6NtcHqrzM8uDj6
 CPKbEGUNO1oDyQfmskjsTcQ+MU4rasi2uoIAVUOvxGRMQyPKRKhxdcYcpUncgL4DfLaYIDu
 QjkOHhpCvPPOKtkft2jpERXO7eQoU0SkusZoIk3TrVylFpAGBtCgC+JFLqA18ZwPpkVuJFt
 bl1GCOaVf79BHXENSgs7nfcM2yZrJUJl67AbqauExJc2pVXXBMWkYkBGO7j+xYFy9pJraMO
 vq0mE99bwlBHe7BDPeZ8ViJWj0n9u4U7B0YFS8No7ZRIpFNh1rNTKZrLFTFNHFNqnl6TMzk
 Xo2F0ysYvsNCGZPGX1vMk9vBeNHVcCGq4g9Yt46UEDz67VqmrGJnG9k5DP33lmGjPolnnU4
 eERFPSexlCdTdbwmvxUKEIv4rAYl8uRSR9FD+yXQgarsOdEmJ3eFXila72wy/6mGv01AJxx
 HLZHmlsq34+aoegzmKZhrrIeYDy3iSXb34He41qMAsm96uRtj6w1N0DnikatGJBiSMd0hEE
 qTX+2nawJsIAs4g2zSFolScQT7fv9Xa/p6vj13dj+N+3W2IyG0T/mMTUZTxgY/Z5Fax7A8O
 /E1ogTziceJOhUo8LS3G4OasH0NoAhg/EQNYHnGhxbgjIcYSISIw3wiPZa9ZnI0AZmdjy9N
 OeSk4YxCb0RqV7bGp1GvYmKtrJuHNCqGTTW3pJY0hkqWz6mtqNdNpC/DpNwQhOAqLgiUVMB
 bmMMBL1yT6tQzesGaLVbkoZQMIKEexYiDK1JT/ecMXlSLD2/u2VUNwvE/oBFL8EmaOoCZrC
 PnTmb3cfWy+q787DO6cwbhJSv9Sd6G8Px2opgkIRF0KTmM4CL7zulMyvCc4TVUOK/rAU=
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

