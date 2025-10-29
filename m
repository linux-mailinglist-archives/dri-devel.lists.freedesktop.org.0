Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B540CC189C3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2121310E6FE;
	Wed, 29 Oct 2025 07:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="axDSjnoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7404310E6FC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1761722091;
 bh=j2j9WA1trqT3vAVw/jd1rQawmJe4KSEvtc97hT+jsmc=;
 h=From:To:Subject:Date:Message-Id;
 b=axDSjnoMzuC5X6IKwC9o8L+YT8jloY/jdQraAGDAwFUMaGnjlNLYOJirtVl6qZZMj
 KneCijyldkDE7fIj9+2B5ZIO+YkhaGeOAIMhQqG3eo8f3ddXdiIzVbfcZnKqBQRTEj
 9dpvZ6nagLyzIzSQCBE/WfKsv90ZVTNJhy0lwi0g=
X-QQ-mid: zesmtpsz6t1761722089t7ff69d0c
X-QQ-Originating-IP: 7bQdVQ9oUX34jRxfdd7Wtzl35M8B8aqczAbGIlIcToY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 29 Oct 2025 15:14:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 376849328953314141
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
Subject: [PATCH v8 01/10] usb: typec: Add notifier functions
Date: Wed, 29 Oct 2025 15:14:26 +0800
Message-Id: <20251029071435.88-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MjqaYNLY8QZGIpmhSyWql8me1d5OxWxLDL4l4EY/xytzQsP2bDcsJWMt
 49n8ST3h+nN0tPnp1cxviRfuOfbgBmdWy+/hy5YZ3jSgKY3dsUAR3393FgGroGshRWi+nSD
 +OcO90YAQWoOhyV3VuW6G9femXmqzYHnKNQytoLtnQwlvl2TiUy/xPwH44PcrgFWMnT3rXz
 bVWEqUmBcKXUDbo7nMaYbjWqgXDXeM01N6xqbxHaQ3v3p28kWEDyHEDLVjkGcf8/DnlxhqI
 PH68mbUb1+mhy0mgVYxTwcqA7Qtwx9Tni5dTDIf2LrZ50lCjcas7THoR2tJfiZ5UwpjICJ+
 tnZduuYp7U1yaSzw3ZDY5ZRKgcwGj4/jnblrjELDykEdh+mOtQO5DkWzFc05+lnTRh+Bbp6
 J2LAKv98Seg6CSCuMvZv6yWkZXlJ++csPj1YivMvL2tVu1jhfOwjtyqecPGx7LJ1lH6z4i1
 YOKjECb8140Ugw/c8eqCu1onEupANpLfjiZa0ULJ8aRAuz+kA+kkLgYn8l92bYnWe9J93EN
 tLD6RC8+t1Y6mT0z9LeJ4V5qg34LDHODStS28IEefDVda4tX+NWbOkaCykv9LaNkCTj54Hr
 GZi671WHSuRneXDpZuqUh6I3cTOwsYSj2L5MiixFYuTm1HbFbm1UVTrvMOpqywjFp389geM
 n1VaiuGgqmeO/k7fHx4F0Sc6OAC407IhzI/389SOsaNuJ+02KllOEWwJAW/fA2Mr7AYTE07
 Oog5lplwnUlfrBqCGIsfV/45LFLKxBYckhWcmnmbkqEod6oVNgyQD279QKxJ6Ga9blkWEl9
 GAYeeZc5+etZAY9KwWsGaX3Oyf0C/YDoV6gcgHsQdWHZMURiRO+cJJw5Y6zeJSpA0puJxZA
 /+S7w0Bd8hE6g2kfBoyjWUODYCZHGmjmZXqMF21N9q67X3r/zTAs7n5d56MNYTtIIfHtud/
 U86yulE2M359yC5hhMBPrUJrRru3RbeXeROxvtwJjfYbgcSjLZfrsJIdtdHQXkHCV4d4=
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

Changes in v8:
- Fix coding style.

 drivers/usb/typec/Makefile       |  2 +-
 drivers/usb/typec/bus.h          |  2 ++
 drivers/usb/typec/class.c        |  3 +++
 drivers/usb/typec/notify.c       | 24 ++++++++++++++++++++++++
 include/linux/usb/typec_notify.h | 16 ++++++++++++++++
 5 files changed, 46 insertions(+), 1 deletion(-)
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
index 9b2647cb199b..51e971bc68d1 100644
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
index 000000000000..0a14d3ae224e
--- /dev/null
+++ b/drivers/usb/typec/notify.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/notifier.h>
+#include <linux/usb/typec_notify.h>
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
diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
new file mode 100644
index 000000000000..f3a7b5f5b05b
--- /dev/null
+++ b/include/linux/usb/typec_notify.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __USB_TYPEC_NOTIFY
+#define __USB_TYPEC_NOTIFY
+
+#include <linux/notifier.h>
+
+enum usb_typec_event {
+	TYPEC_ALTMODE_REGISTERED,
+	TYPEC_ALTMODE_UNREGISTERED,
+};
+
+int typec_altmode_register_notify(struct notifier_block *nb);
+int typec_altmode_unregister_notify(struct notifier_block *nb);
+
+#endif /* __USB_TYPEC_NOTIFY */
-- 
2.49.0

