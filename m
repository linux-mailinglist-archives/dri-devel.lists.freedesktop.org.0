Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335D3C71D0C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 03:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DB510E09D;
	Thu, 20 Nov 2025 02:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="Jj53iVYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A8910E09D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 02:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1763605447;
 bh=6190OwFbT9PTsW3kKLd3ukON7IhuHFcLiMCVWlPFG/w=;
 h=From:To:Subject:Date:Message-Id;
 b=Jj53iVYv6BuOwFCX7C8ZhHkCR77lbPsHcbbPWH0/79DPUMH4bMHS694y3dElUPDea
 r3YPSwQjqcJjrlkcW11P6YH9wklSqGKTI4nwpMYY72Tanvso7cwdpbm9HysnuFqvMp
 3qbnacS32bCOIq87hgB0k2bEIdKbUZYB82LtxG0k=
X-QQ-mid: zesmtpsz5t1763605445t5e65da5a
X-QQ-Originating-IP: yMXVAgeYNGkbnDLlHmM3QvLOvK3cAkWMNfw32dJmod4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 20 Nov 2025 10:24:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11576405309476374289
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
Subject: [PATCH v10 03/11] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
Date: Thu, 20 Nov 2025 10:23:35 +0800
Message-Id: <20251120022343.250-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MLP81OimLGh20QDXaXrfxtH33GjshwtPZK8buhII+VDKL9m3F3qRrrZ0
 MKbGTd6dnu+yHIREyuqQSXZUsx5Brp61w9d2lFxgzPuEpt1HMhUitY6tnhWv4oOlDDlZ9wM
 QHL6uWYIOZ7N8GY+yp0Rzul3nzpy98Mb2H5hQ+Kvi8GfR8gsFsRKDUzC4470uU0AO63IKlR
 a4t5eUdXePCmW5/CyUF1JbNiYGXckgZFfoF+3g4CSccoVywGhnggwCkeWyUYX0aXiRcKiWm
 D86Kk+33D7sl9rnYMk8+T9hD85YxzS1dPl1N73MIiycYR4JK0JeHH5U6rzfZBj8k2Db1u/7
 PQeNjBq4y49rBDCqC6Nk+WobFKmSD+F4wwSEeSMUlW6VLTOXhcp+cD0hWHBOHSnlsWkVcCz
 ODwmuXsVjdUdN9TGUZ0jS9HwOMg7n4TchWxuT91wZdscg9ibQd+FxLEbTeLzpUzC9NSKQ61
 Vezi0aDG+lxZVR9/D+ZcPmtcxq+elTJkj6tBzqzMFlQshkAWry+SGB0TaCGwKHEO7Z+Tb7m
 nCXppVzW0JUO6lkjOHpf+MrL4DvGLa3WM9RIOIcrhnaC2wAXeAYu1kS4adghB/YF62eL0ys
 AklMB0wZVt457RIa9a6sOZ4Ctz/BboL+zJANrqcEXaaE2TtMmX+xQ9EWLXR5+LaXv5CWXW1
 oavpjAUM8c3KF5gp75HrnKsJmQRAgE4dAT1jowfbG/KVC91ZEuuewyp46w6H43d+5EENsr8
 HFYb1Qk2rvBsYZKkdH+DzMC5VegHDgmCh/jdeLXy2BgMmRSi86+rzYHob12tjDo1U4mK8Pi
 ihdd5uxRm6/vllhVqBg+Xvaq4YMwsw++b+ciu6ayP7HDV0LPr+IBxYclWETv6nLkzsKPZBw
 LzbyPd0b9QENvS+rp6+rqsqJtWiEyt1NBJNWeQt2zMZZep7GBmCsbzHyN3607d6AOrDkw55
 jZVqzLu+HJgVYdcPp0hR0deLu4FtcLWvciq6pJhg2+i0joVxs3tyzFKR8/X47xkhIExFxLv
 7ov3AYNvSYuOsn9us7gzYhSW6VUHwSGZJLX7QRX5/XM/1yCUvy6hp01BoiGu9IPrNr7jZgC
 HvwgnilrNCF
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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

The HPD function of Type-C DP is implemented through
drm_connector_oob_hotplug_event(). For embedded DP, it is required
that the DRM connector fwnode corresponds to the Type-C port fwnode.

To describe the relationship between the DP controller and the Type-C
port device, we usually using drm_bridge to build a bridge chain.

Now several USB-C controller drivers have already implemented the DP
HPD bridge function provided by aux-hpd-bridge.c, it will build a DP
HPD bridge on USB-C connector port device.

But this requires the USB-C controller driver to manually register the
HPD bridge. If the driver does not implement this feature, the bridge
will not be create.

So this patch implements a generic DP HPD bridge based on
aux-hpd-bridge.c. It will monitor Type-C bus events, and when a
Type-C port device containing the DP svid is registered, it will
create an HPD bridge for it without the need for the USB-C controller
driver to implement it.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

(no changes since v10)

Changes in v9:
- Remove the exposed DRM_AUX_HPD_BRIDGE option, and select
DRM_AUX_HPD_TYPEC_BRIDGE when it is available.
- Add more commit comment about problem background.

Changes in v8:
- Merge generic DP HPD bridge into one module.

 drivers/gpu/drm/bridge/Kconfig                | 10 ++++
 drivers/gpu/drm/bridge/Makefile               |  1 +
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 50 +++++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a250afd8d662..559487aa09a9 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -30,6 +30,16 @@ config DRM_AUX_HPD_BRIDGE
 	  Simple bridge that terminates the bridge chain and provides HPD
 	  support.
 
+if DRM_AUX_HPD_BRIDGE
+config DRM_AUX_HPD_TYPEC_BRIDGE
+	tristate
+	depends on TYPEC || !TYPEC
+	default TYPEC
+	help
+	  Simple bridge that terminates the bridge chain and provides HPD
+	  support. It build bridge on each USB-C connector device node.
+endif
+
 menu "Display Interface Bridges"
 	depends on DRM && DRM_BRIDGE
 
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index c7dc03182e59..a3a0393d2e72 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
 obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
+obj-$(CONFIG_DRM_AUX_HPD_TYPEC_BRIDGE) += aux-hpd-typec-dp-bridge.o
 obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
new file mode 100644
index 000000000000..9cb6a0cb0f0a
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/of.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+
+#include <drm/bridge/aux-bridge.h>
+
+static int drm_typec_bus_event(struct notifier_block *nb,
+			       unsigned long action, void *data)
+{
+	struct typec_altmode *alt = (struct typec_altmode *)data;
+
+	if (action != TYPEC_ALTMODE_REGISTERED)
+		goto done;
+
+	if (is_typec_partner(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
+		goto done;
+
+	/*
+	 * alt->dev.parent->parent : USB-C controller device
+	 * alt->dev.parent         : USB-C connector device
+	 */
+	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
+				   to_of_node(alt->dev.parent->fwnode));
+
+done:
+	return NOTIFY_OK;
+}
+
+static struct notifier_block drm_typec_event_nb = {
+	.notifier_call = drm_typec_bus_event,
+};
+
+static void drm_aux_hpd_typec_dp_bridge_module_exit(void)
+{
+	typec_altmode_unregister_notify(&drm_typec_event_nb);
+}
+
+static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
+{
+	typec_altmode_register_notify(&drm_typec_event_nb);
+
+	return 0;
+}
+
+module_init(drm_aux_hpd_typec_dp_bridge_module_init);
+module_exit(drm_aux_hpd_typec_dp_bridge_module_exit);
+
+MODULE_DESCRIPTION("DRM TYPEC DP HPD BRIDGE");
+MODULE_LICENSE("GPL");
-- 
2.51.1

