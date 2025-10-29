Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78041C189C9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADE210E700;
	Wed, 29 Oct 2025 07:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="WfsLwyq4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E9510E6FC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1761722101;
 bh=FJMoyZ1t1YeDBw7c8GChVfEptGd+0NATOX776m3g0j4=;
 h=From:To:Subject:Date:Message-Id;
 b=WfsLwyq4FS8wSfAryEYVifdG9ybxMh9BxPhlWhlLPJ9Ws9+Zg1Tp1HgRBHfWE7Iyb
 BtJZIxFXnP94bPr2p4bz8Lnxfwdsx0GUv3AK4dyJMdjyJXlRzAGMfRr1vFYXr0VCi2
 hW0MQQjpYofYNPWUvI7h1oEG4iUxxMbaKJaMbJ68=
X-QQ-mid: zesmtpsz6t1761722098t70ec4185
X-QQ-Originating-IP: nrXTS2MjCDfq0/Rdag/r96GHT70yO64qGAp8vt7JiO8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 29 Oct 2025 15:14:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 238686505024682894
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
Subject: [PATCH v8 03/10] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
Date: Wed, 29 Oct 2025 15:14:28 +0800
Message-Id: <20251029071435.88-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: Non7B45eNO9BaBSoFlGwoRXV2OmWn8KRiK6uYLn7ywxwE29wtMwDJyZm
 2tT/HRL+JM2WLApvGJbwkfcsC9zCQon0VkgP10jWshukESwmPnN9S4NQvG64PWBwIluI4lp
 XQsedcX688J25pN1JvD0wH35e+57B4h6Kmi6Zn/mhBWoy1tzclPEoL0PwTD7F8weUbo/xwq
 0HKmEWEv5xLwAH1UFvc1GfmSUqpoZNVJf5sl/FrvV2HOp3vvSoW1A7yNBcx4napbicgjYK6
 n5OM3PagBifX4lCB+xxrc7SL1KWK50p81vObqQZwjibKjkhA3J0/aeRRJKe04c483grXjpB
 y2DyDZ/SlyBxZK+zwiCB5b63HLthB/UH/T9GyNLWJyyGZinFMTPcMZGqhZOMTZIDXd0ZtUA
 nDrlE4qm0xH6x/YkAcAIiDAkgI4rRZx8IQ9Ljjx4UHIvujRiOcuXuBnd7ufOx+jKKR0r7T9
 cGO/EycjO/hQGXdNRwCBMuRaBr3a/PbNHrfMgK5/i//EnS0Oh1MXz2rZ8KAh+Kg1Ton4LVN
 Dv4Uj9F+J5GOG3WbmwJPrXf+Iy68Nn2fR149pm5vFNXwEiN6XXpx0LHaR6XwqFCrXEBfJi6
 wf4ORP9DXPj9vQewD8RfRx0L25cnvD3WYSy2m6Ux50SQ6h5aN1iVv6kOsGnivF/YGYVYOSR
 oQtp+XnnwvE503ypzAFcE62tkNq2sQLW7uD29KD74Qn+Fji3jo09gQEe1mK+en/7Mid2+mh
 FE7v8TaPZXbsGjWOe0x12aMpbrlo0IHUQNQX4VtmJyT4qvOyalujhwbdfernR81j5JK/vSt
 K+BkK9tqKxJuZnoXcfmTtgB4mClTWPWf3i9iAZOmH8BQFQWO4Nzrt67kU5aaFRsFBspT4i0
 wkkP5Aqg7orzWKNlgBvFTidtL6LyHw9bF0IDFOoOJX1ipD/KIpHRlog+CxXQ9jCbIIutAqZ
 3CY1Ca0caTNJLibEDS0qitMhp+0pwRy/5LKaps1g1iWsQKU/x0RA/HCUI3EIICgSpIFpRXI
 mk0Wpg65QMsjHJK2g0CFIYaILTi1WoPzz22laIjg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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

Changes in v8:
- Merge generic DP HPD bridge into one module.

 drivers/gpu/drm/bridge/Kconfig                |  5 +-
 drivers/gpu/drm/bridge/Makefile               |  8 +++-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 23 ++++++++-
 drivers/gpu/drm/bridge/aux-hpd-bridge.h       | 13 +++++
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 47 +++++++++++++++++++
 5 files changed, 93 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.h
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a250afd8d662..17257b223a28 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -23,13 +23,16 @@ config DRM_AUX_BRIDGE
 	  build bridges chain.
 
 config DRM_AUX_HPD_BRIDGE
-	tristate
+	tristate "AUX HPD bridge support"
 	depends on DRM_BRIDGE && OF
 	select AUXILIARY_BUS
 	help
 	  Simple bridge that terminates the bridge chain and provides HPD
 	  support.
 
+	  Specifically, if you want a default Type-C DisplayPort HPD bridge for
+	  each port of the Type-C controller, say Y here.
+
 menu "Display Interface Bridges"
 	depends on DRM && DRM_BRIDGE
 
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index c7dc03182e59..2998937444bc 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,6 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
-obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
+
+hpd-bridge-y := aux-hpd-bridge.o
+ifneq ($(CONFIG_TYPEC),)
+hpd-bridge-y += aux-hpd-typec-dp-bridge.o
+endif
+obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += hpd-bridge.o
+
 obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 2e9c702c7087..11ad6dc776c7 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -12,6 +12,8 @@
 #include <drm/drm_bridge.h>
 #include <drm/bridge/aux-bridge.h>
 
+#include "aux-hpd-bridge.h"
+
 static DEFINE_IDA(drm_aux_hpd_bridge_ida);
 
 struct drm_aux_hpd_bridge_data {
@@ -204,7 +206,26 @@ static struct auxiliary_driver drm_aux_hpd_bridge_drv = {
 	.id_table = drm_aux_hpd_bridge_table,
 	.probe = drm_aux_hpd_bridge_probe,
 };
-module_auxiliary_driver(drm_aux_hpd_bridge_drv);
+
+static int drm_aux_hpd_bridge_mod_init(void)
+{
+	int ret;
+
+	ret = auxiliary_driver_register(&drm_aux_hpd_bridge_drv);
+	if (ret)
+		return ret;
+
+	return drm_aux_hpd_typec_dp_bridge_init();
+}
+
+static void drm_aux_hpd_bridge_mod_exit(void)
+{
+	drm_aux_hpd_typec_dp_bridge_exit();
+	auxiliary_driver_unregister(&drm_aux_hpd_bridge_drv);
+}
+
+module_init(drm_aux_hpd_bridge_mod_init);
+module_exit(drm_aux_hpd_bridge_mod_exit);
 
 MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
 MODULE_DESCRIPTION("DRM HPD bridge");
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.h b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
new file mode 100644
index 000000000000..69364731c2f1
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef AUX_HPD_BRIDGE_H
+#define AUX_HPD_BRIDGE_H
+
+#if IS_REACHABLE(CONFIG_TYPEC)
+int drm_aux_hpd_typec_dp_bridge_init(void);
+void drm_aux_hpd_typec_dp_bridge_exit(void);
+#else
+static inline int drm_aux_hpd_typec_dp_bridge_init(void) { return 0; }
+static inline void drm_aux_hpd_typec_dp_bridge_exit(void) { }
+#endif /* IS_REACHABLE(CONFIG_TYPEC) */
+
+#endif /* AUX_HPD_BRIDGE_H */
diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
new file mode 100644
index 000000000000..6f2a1fca0fc5
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/of.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_notify.h>
+
+#include <drm/bridge/aux-bridge.h>
+
+#include "aux-hpd-bridge.h"
+
+#if IS_REACHABLE(CONFIG_TYPEC)
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
+int drm_aux_hpd_typec_dp_bridge_init(void)
+{
+	return typec_altmode_register_notify(&drm_typec_event_nb);
+}
+
+void drm_aux_hpd_typec_dp_bridge_exit(void)
+{
+	typec_altmode_unregister_notify(&drm_typec_event_nb);
+}
+#endif
-- 
2.49.0

