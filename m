Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE29BFF065
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 05:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD0A10E2E2;
	Thu, 23 Oct 2025 03:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="P3s159fK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 393 seconds by postgrey-1.36 at gabe;
 Thu, 23 Oct 2025 03:37:52 UTC
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F268010E2E2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 03:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1761190665;
 bh=umNcsJfQXn20u9b8R1M4KUZg1ShG0gK3GbHIbkBThtI=;
 h=From:To:Subject:Date:Message-Id;
 b=P3s159fKatwQlWqFi19fsOSI2VK0oYAMRwvOzTzK9C2Jc69dEj4EqhT+sMpFgQfV3
 MLb7zcbNUI2B/e3Nx2aLR//hjv87gLTOIw/qGDn5hZJ0MsULzsm0ZUpc0jUZdDP13N
 Tg+/xxa1ZcO7/HEubMh6HtQu1dmtk3LGbyooEIa4=
X-QQ-mid: esmtpsz16t1761190231tebd0ea05
X-QQ-Originating-IP: lmB1WZeKvtf5VM4hJL0jYLeppT9A2VeZOLIbFh5pRJk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 23 Oct 2025 11:30:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18264625426006429648
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: [PATCH v7 2/9] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Thu, 23 Oct 2025 11:30:02 +0800
Message-Id: <20251023033009.90-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251023033009.90-1-kernel@airkyi.com>
References: <20251023033009.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NT9b64/RmY6NGAK1f+8S/ucoRZgVjT7UPTOnYRzrt+XurTC7dL2FI/ZL
 on7RBawxhnvJlLxp28tkxakUpdH1fJ53WADnUZk0yYETyYyw2XUFejz5QuSzDAU6wgKw0ET
 0APH6BBYFTFtcLq1KYYMAXq5I1gYId7pBCWhk2ykjShX8nZoghcQurLSzlyFQgItuPwekKn
 M3kfzziZJV9e6jJdwOBdxnrUmIcGzBgLYnqfLgJfBa9zMUEUa74XsXb+O09Ag+6ITlAEy0p
 2WzshmkdSbUVFQEuSSq+u6F1lICFPyWJ3XHa/uXd4jtnN+D42NSup+ipWsNix0uTEW8Gaha
 C91tC3hM1LwMv69REGJaqQD8lp2e11Rbn8V0a3ZZwWHXiC6SIlogrSGxEa6Vx0Ho/mXOo0t
 +qioC6SNApjrGbnQES4rdCJRKEsnuxc2ms905UbWgNsmiKfySn29Me21Z89devhgMZv9ey0
 iNhhidMT293tgWRHq7MOkHyagZrgMXrU9kG4Bvgovuwf2WSQ5fpELbYz4CRRQex8xsRlVHD
 8vIV1hlpCQw1ZDqOZ3W7FQuBOR16qtvpTBbvLjNfHDCS/DwxewsUfrBvwvMIGC0GgtSM9dI
 m9zG3mvbiuV47c61YTbaY7R121ibDRrbDV7nguNyfJItymRPkqZQXjndpJ9cg8TcK6inQia
 zeL4z4/HHSmqfwysz3wCd//a2z4dL2+sh3kRg82DiMG0REBmQE48gj4OWtFvsJ7tAfmOF3C
 g1amBBcSWiH4ZtGBfxCcElleh4ulYzgcca7cydtGeqTbRsDOHbfAvwnTDc2wZ3ey5Bj5Paj
 Q2s6XYqzTZqx2NdaIVkDMUTLmJJ2fnOlXvyGWPjlg+C+jnxPt8ztttQf0d/9iTBdVu0sAuY
 fAXHF5FZjoMI/+gx/lMtu1otEqEFY8fx64ETSd9jzndJlOYExhmE0PMaYjjhoakNNao3wwW
 eE04jgkNINGsveGN9Wg7I2gw9FLxm80Ihbr/sATDja492q1s1RZcUFHtkodFPyun6wvjyX2
 p9qxL7/938VlyixuC0SbIfd4I/AB4=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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

Several USB-C controller drivers have already implemented the DP HPD
bridge function provided by aux-hpd-bridge.c, but there are still
some USB-C controller driver that have not yet implemented it.

This patch implements a generic DP HPD bridge based on aux-hpd-bridge.c,
so that other USB-C controller drivers don't need to implement it again.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/bridge/Kconfig                | 11 ++++
 drivers/gpu/drm/bridge/Makefile               |  1 +
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 51 +++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index b9e0ca85226a..9f31540d3ad8 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -33,6 +33,17 @@ config DRM_AUX_HPD_BRIDGE
 menu "Display Interface Bridges"
 	depends on DRM && DRM_BRIDGE
 
+config DRM_AUX_TYPEC_DP_HPD_BRIDGE
+	tristate "TypeC DP HPD bridge"
+	depends on DRM_BRIDGE && OF && TYPEC
+	select DRM_AUX_HPD_BRIDGE
+	help
+	  Simple USB Type-C DP bridge that terminates the bridge chain and
+	  provides HPD support.
+
+	  If the USB-C controller driver has not implemented this and you need
+	  the DP HPD support, say "Y" or "m" here.
+
 config DRM_CHIPONE_ICN6211
 	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 245e8a27e3fc..e91736829167 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
 obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
+obj-$(CONFIG_DRM_AUX_TYPEC_DP_HPD_BRIDGE) += aux-hpd-typec-dp-bridge.o
 obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
new file mode 100644
index 000000000000..2235b7438fe9
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/of.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_notify.h>
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
+	if (alt->svid != USB_TYPEC_DP_SID)
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
+	typec_unregister_notify(&drm_typec_event_nb);
+}
+
+static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
+{
+	typec_register_notify(&drm_typec_event_nb);
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
2.49.0

