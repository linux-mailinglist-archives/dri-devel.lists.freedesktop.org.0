Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08D6C71CFD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 03:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91E210E6CA;
	Thu, 20 Nov 2025 02:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="BlVMdBy7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3D310E6CA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 02:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1763605438;
 bh=j1djG2TFE/CUEyP0COdHWqSO/caFFOIst9KD5pPTwfU=;
 h=From:To:Subject:Date:Message-Id;
 b=BlVMdBy7Ltf441wLnCmm0AVUXNNXTZ3ZWlUIy4BNh3+xUzTTU2XbgXzBhTOBz7Wu2
 ZpmUgkC19gH5rdC/0MfNQkHGjckdTMbO3qRrVnu2uO31Op6KBfZ97G1rG2UTs6Kv8d
 LobSEOUIwcV8KY6HToIkSajUDgB+GenvllqlBB88=
X-QQ-mid: zesmtpsz5t1763605436tb3e0b544
X-QQ-Originating-IP: xlc9ysITpbSHXMdJexYj64rNZJQOqI/N1w8Cl7S5hso=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 20 Nov 2025 10:23:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17663910937081771390
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
Subject: [PATCH v10 01/11] usb: typec: Add notifier functions
Date: Thu, 20 Nov 2025 10:23:33 +0800
Message-Id: <20251120022343.250-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OeWvpHj3+EsSv9xKSW9oV9ok1IEWWBRVoxF+28Qa+4hqt4fjLvBEJEKx
 v12u7Dg1aEMKBJLHFOyL9ZDXKwpSAoy5+Cgs6tCv2TfdfbjfBt5FStLDN/f6t41HDfeZK2Z
 Zo83614Y7R7P7aCzf9/cbznW+KFNgQ/OB5Ew/DZSY/gRdqaE6clzx1iSiZvKkzQXXRjG2eX
 TVR+fz4Iz0KVtqj/shfyJT+HfMIsXCPBQj9AcSVf4C7ceVrarxsYDELwdyZQMJK/40yGXgh
 HHUeXLN+GruVkt6/hqv2ZLY5lzAOAJZzP6+uyU1Cl9WvliSN5vtiPCAFKkJFBDyUCtH5joR
 DkGrTn9Dl6XmpnaGr+TaEBAWe+Fvjck3CyU0qPdDFuyNHjfML7/08PzLavZYk7KIuLCGDv0
 +6O4cd6XYafGlkFgn+GhMuxdv9ijD81pobFfb8gXrdUut2LkGAWBe8Ghi++huV3MLmLuu19
 nEsgrd+np/rgplqKyPaXftNNMxko2+TLCAwepwSGLeBxy/pYB8+dFquAWG2+OtCIKdnlWgd
 AV3NXxANYqbkanz+YWLIU5fz2OtRIrDBpqwHf0Ku0oKeOmVS1YVQS3scrD4KyET1fKdgLGU
 ouKGw1tRnIU9Cr6lRsSw/O0Ch5myL9SZjA9hm1khx1186KuXQAFYZ2p7Dcn5MBEXOZXl8kb
 J8DcsNJJm++9kqltJdT8hHMlgpQHxaRePZbFwGQADhRVwlPlkX7vkQH/ncFLRWkFJVZln+K
 Q1hYwWwXx2LIBG0JzoDwOfJ+X5RfW4LnI+UHUgd3ciZdZcGramjaeIXnEGJsDG0PTx5K7qM
 4NVOULjH0yPP4pOLEkmERoqJQ92prHflJwg5eoC0vXdDOeyMU+tuNds/nSODbh9keiBQTi3
 /eZ6P7xS+Vz/aC0fRLf1NYh9L7QPM49MqQ9icpbxA8s9BXatC2LDOF32V2hDvVohegwfzU4
 I10NGddqLhPWzgahsk8S1wZoInwm4h/uWzrEB/gKFqkuErIVth14IqEaOKQhxvbLBIxr66a
 MiUjpgPQ==
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

Some other part of kernel may want to know the event of typec bus.

This patch add common notifier function to notify these event.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v10:
- Notify TYPEC_ALTMODE_UNREGISTERED when altmode removed. 

Changes in v9:
- Remove redundant header files.

Changes in v8:
- Fix coding style.

 drivers/usb/typec/Makefile        |  2 +-
 drivers/usb/typec/bus.h           |  2 ++
 drivers/usb/typec/class.c         |  3 +++
 drivers/usb/typec/notify.c        | 23 +++++++++++++++++++++++
 include/linux/usb/typec_altmode.h |  9 +++++++++
 5 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/notify.c

diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 7a368fea61bc..20d09c5314d7 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC)		+= typec.o
-typec-y				:= class.o mux.o bus.o pd.o retimer.o
+typec-y				:= class.o mux.o notify.o bus.o pd.o retimer.o
 typec-$(CONFIG_ACPI)		+= port-mapper.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
index 643b8c81786d..820b59b6d434 100644
--- a/drivers/usb/typec/bus.h
+++ b/drivers/usb/typec/bus.h
@@ -26,6 +26,8 @@ struct altmode {
 	struct altmode			*plug[2];
 };
 
+void typec_notify_event(unsigned long event, void *data);
+
 #define to_altmode(d) container_of(d, struct altmode, adev)
 
 extern const struct bus_type typec_bus;
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9b2647cb199b..1ccf5385d559 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -600,6 +600,8 @@ typec_register_altmode(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	typec_notify_event(TYPEC_ALTMODE_REGISTERED, &alt->adev);
+
 	return &alt->adev;
 }
 
@@ -614,6 +616,7 @@ void typec_unregister_altmode(struct typec_altmode *adev)
 {
 	if (IS_ERR_OR_NULL(adev))
 		return;
+	typec_notify_event(TYPEC_ALTMODE_UNREGISTERED, adev);
 	typec_retimer_put(to_altmode(adev)->retimer);
 	typec_mux_put(to_altmode(adev)->mux);
 	device_unregister(&adev->dev);
diff --git a/drivers/usb/typec/notify.c b/drivers/usb/typec/notify.c
new file mode 100644
index 000000000000..9e50b54da359
--- /dev/null
+++ b/drivers/usb/typec/notify.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/notifier.h>
+
+#include "bus.h"
+
+static BLOCKING_NOTIFIER_HEAD(typec_notifier_list);
+
+int typec_altmode_register_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&typec_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(typec_altmode_register_notify);
+
+int typec_altmode_unregister_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&typec_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(typec_altmode_unregister_notify);
+
+void typec_notify_event(unsigned long event, void *data)
+{
+	blocking_notifier_call_chain(&typec_notifier_list, event, data);
+}
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index f7db3bd4c90e..59e20702504b 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -10,6 +10,7 @@
 #define MODE_DISCOVERY_MAX	6
 
 struct typec_altmode_ops;
+struct notifier_block;
 
 /**
  * struct typec_altmode - USB Type-C alternate mode device
@@ -77,6 +78,14 @@ int typec_altmode_notify(struct typec_altmode *altmode, unsigned long conf,
 const struct typec_altmode *
 typec_altmode_get_partner(struct typec_altmode *altmode);
 
+enum usb_typec_event {
+	TYPEC_ALTMODE_REGISTERED,
+	TYPEC_ALTMODE_UNREGISTERED,
+};
+
+int typec_altmode_register_notify(struct notifier_block *nb);
+int typec_altmode_unregister_notify(struct notifier_block *nb);
+
 /**
  * struct typec_cable_ops - Cable alternate mode operations vector
  * @enter: Operations to be executed with Enter Mode Command
-- 
2.51.1

