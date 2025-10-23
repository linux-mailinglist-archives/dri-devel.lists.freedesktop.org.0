Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD576BFF041
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 05:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A6410E1E1;
	Thu, 23 Oct 2025 03:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="uXHdB1hX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA6210E1E1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 03:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1761190384;
 bh=z3Z+FuiRydfa9KXtfzUasAoRXAzbkbbUPpgJYhzIq0U=;
 h=From:To:Subject:Date:Message-Id;
 b=uXHdB1hXuNcZwDRZ26TjsSVpLm3TYE0qfeXRy8LuQNNqXtoD1gt40LJsJ+jgaPvbu
 b3wqNzwhN/VNVrzZ5l6LfmFdMQlb3dwT7iNYYfKi+5vrnpDLHdOfxoKeIN7MLHfEwh
 vyZmOdT4AH+cwT8vJrxiBzNQb3b38ZX3xrH6kQMA=
X-QQ-mid: esmtpsz16t1761190226t700443f6
X-QQ-Originating-IP: CR3cgQmOsWIwA9RJdPHoa1hKzkyO00I9vsk6MHfqamI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 23 Oct 2025 11:30:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8850868920315239972
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
Subject: [PATCH v7 1/9] usb: typec: Add notifier functions
Date: Thu, 23 Oct 2025 11:30:01 +0800
Message-Id: <20251023033009.90-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251023033009.90-1-kernel@airkyi.com>
References: <20251023033009.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MuF+DMKUphDyaOkPxQeIp8/8UjaViT3n453XqSB5xGDI0ImuizAT7FXg
 C8yazzAtINz0h+7pMJRloLDwwXQbN2ZGz2eYrWyIBd828xUN77rS6Dkvb9Kz+PH8tnjVwAc
 bOkcG8mUMGXLyhtPGBdg/8Jd4E5dIeNYl0X+NshNO9T4JSOh41K9/vedI8PTGzUsMoewHUR
 LLE4FBno89oG99xpxhS338w0G9gmhbnG8hbc8jmeiLFsqpbz+eh/8PeboPr05F/JPahuzMX
 wk9pC6WujAXlL4Fld/BlgZ+EFB4tgHVcEK0Jg4ODD5cuPvn3MvwLKY38krOY5P8ocX8Q7o+
 43WxdyHGsT4snoxysxcsPFrmkP6LkRQhfw9zM35vpkdiLvHFsItNv70ew9VYruAEXYIUqKX
 YKH4YfI9AKCWiZSa5D98vYS7E/9e7OvaqTNLudsCECASXq/Sv85jpYBTKQZeWugE5+i3cbr
 YQTbL9IYx1FYUWsQMpk+Ng7Wv70CdpXGbFImO8Waok/GxdTz+KrgacPmY85Dx3axZdqqvua
 sQV2C07iUd4N26V/dCLLX4kov8wBCLGdCmT+0Y/aec7XJj+6EYob+18CK/2SM/hEwUfua3U
 C5vaB/HouXDvkfuoSWiDKZLUzBFE9VmmAupU8BQAwyAz2k083avOgITOAhn59Gy9UU7KMvG
 Biwl9g5yO8ywecQx683oiAX73z2dBHyrtN75YH86piHhQ96F0NYAnyn960cXSyPItkPcYz3
 lHdIGwnuWFt+ORUkdxL8zM/NgDg5CU6hvmw9xxxp+d9j/I/4JX1jwbhIKgbKEAyMlUUL0kk
 ox4chOUhj88Cmvs5x7fGAp4AFvtBfkhDrVhfVC2pWs6YyAvuDkgB+xm9CwHOnqFxcoTBWDr
 P7W9bdLIStVUkI6dN/Cz884uXa6rrUWdOQr4EZduWi5v6+KPYeZDJ2bClSNYVIsNSusbFak
 LWD6Adlz0arvMq2NiEP5isLMtEj4cB3ogtCRHIqXqSh/xNJ+86oxZYs/Ce5pLVYCd97c=
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

Some other part of kernel may want to know the event of typec bus.

This patch add common notifier function to notify these event.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/usb/typec/Makefile       |  2 +-
 drivers/usb/typec/class.c        |  3 +++
 drivers/usb/typec/notify.c       | 22 ++++++++++++++++++++++
 include/linux/usb/typec_notify.h | 17 +++++++++++++++++
 4 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/notify.c
 create mode 100644 include/linux/usb/typec_notify.h

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
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..11c80bc59cda 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -13,6 +13,7 @@
 #include <linux/string_choices.h>
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_notify.h>
 #include <linux/usb/typec_retimer.h>
 #include <linux/usb.h>
 
@@ -600,6 +601,8 @@ typec_register_altmode(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	typec_notify_event(TYPEC_ALTMODE_REGISTERED, &alt->adev);
+
 	return &alt->adev;
 }
 
diff --git a/drivers/usb/typec/notify.c b/drivers/usb/typec/notify.c
new file mode 100644
index 000000000000..4ae14dd1f461
--- /dev/null
+++ b/drivers/usb/typec/notify.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/notifier.h>
+#include <linux/usb/typec_notify.h>
+
+static BLOCKING_NOTIFIER_HEAD(typec_notifier_list);
+
+int typec_register_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&typec_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(typec_register_notify);
+
+int typec_unregister_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&typec_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(typec_unregister_notify);
+
+void typec_notify_event(unsigned long event, void *data)
+{
+	blocking_notifier_call_chain(&typec_notifier_list, event, data);
+}
diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
new file mode 100644
index 000000000000..a3f1f3b3ae47
--- /dev/null
+++ b/include/linux/usb/typec_notify.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __USB_TYPEC_NOTIFY
+#define __USB_TYPEC_NOTIFY
+
+#include <linux/notifier.h>
+
+enum usb_typec_event {
+	TYPEC_ALTMODE_REGISTERED
+};
+
+int typec_register_notify(struct notifier_block *nb);
+int typec_unregister_notify(struct notifier_block *nb);
+
+void typec_notify_event(unsigned long event, void *data);
+
+#endif /* __USB_TYPEC_NOTIFY */
-- 
2.49.0

