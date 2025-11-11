Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3661C4D2D2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 11:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4699C10E04B;
	Tue, 11 Nov 2025 10:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="Kv7t9xPc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A1910E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 10:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1762858261;
 bh=3KVgbAMLqk9xskfSyH7zcOVwcHIfJ+/kd/q1XTa1m00=;
 h=From:To:Subject:Date:Message-Id;
 b=Kv7t9xPc+i3gbz2yVd3Qbs/FSj7Qefrvm0COEXtakt9i4Epi64P5JUA5eFxBuNx72
 eXBhrKar30zokvXuvwl5c46HqglaXoX0McsPel58+4eRfc0A89PmyIEqt5wXvywqtR
 Ca8PKcawlaAc+/6Z4AZvxH6vbXq4bhD5eG4rmFF8=
X-QQ-mid: zesmtpsz9t1762858252t9993007f
X-QQ-Originating-IP: QIEzzurO6Fp6z4rwWPRwhcxu3akUrwReXd3stTEf5Lk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 11 Nov 2025 18:50:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9719519489223886703
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v9 01/10] usb: typec: Add notifier functions
Date: Tue, 11 Nov 2025 18:50:31 +0800
Message-Id: <20251111105040.94-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251111105040.94-1-kernel@airkyi.com>
References: <20251111105040.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N0zPMTspoMafQdocF3oDrFAtcq1nd5Y6kaTZcX3zxteSgglfcqJzG7Jh
 ar1tPV1O2kzBZ6SwEAg0AflEJNA7lFQIS9tAc2mdfxP+3ORhe7Q10ihLeSz8CeMOlQMwekD
 87GcpjG25lzQbFV6DJPpp/jrofZpLs0iTg55bGZZHZdU4SvV3T4BGTeZR+XtEpWR5EfUJYZ
 W+kQjoHPNAYzciJXAf23Q/3mcVf0JaYBBgWh1NpxjpZ94MEwYGHEBpPo38Ni52CA94Zj92r
 32iUJwJBi4Yz3m0b/37zX9AF32/Rbl/qCpH2BNyfHPXmRkJmGs2Q0exrg/BBmHoWw9rcePw
 jU02Hk1yB185cDqixer7Rm3yOC2B28AWs0wEU+u6WG4ijlKzYLtQLknJrihZIYiBgFG42dG
 L3Ckp5p9miaE9op3rKV+QDyLX86gmm8MURq4IkEwOHcJoI+hubHewY1zn1zUzhuzSmw8prC
 4+DXC8cSfDjevoROGFSMKCV3ze042sLs1/qCWL6n8W28x2D24ce5KD80oYEW+Bw5I5xXwYB
 nyyftkIu9SzvMrCawADMBYHOy0H7VRmdS7LcSTKiNkOQjxuFHRazC9U9xmi/g15XZh3Y0cb
 hwhvvJBerIVIdIMMGW/FW28KJ1kmjUZMMZv4UELBhVw1H/Q7po9kMsWnI5BnHW8Y0NhDXXa
 bR1KqCswjjdLZwQZeerVlyzEOmMuiZJX/fGRv0CrOpRL+BlwdV1u6y2vjii2hN9Ug6qOGuP
 UxNad56wDq306aLswhxJ16+nDiqZJC2RrfCxHJ8QX1KlP4uNGhATxE629xcDJkUqTrBF9ZR
 9grjEuCiDEkrS+6MWrXEKF2COUnZNTFlpx3LL6fdHdFoPkvT9K9jiMU248cNWxeuyuFp7OO
 Fx3ApWf9tBc4D5GJSIvFUR/OHDY8aXNWsFf0bPnZbw1BH3B02yKCqjgFV2hN+u+W7MKoPre
 rmGVadVNmliPTJotCz6oQ8OTt8Ond5vP4u+tf01TyM5uh6PjyG6O+z9P7HxheBuyAjDU=
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

Some other part of kernel may want to know the event of typec bus.

This patch add common notifier function to notify these event.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v9:
- Remove redundant header files.

Changes in v8:
- Fix coding style.

 drivers/usb/typec/Makefile        |  2 +-
 drivers/usb/typec/bus.h           |  2 ++
 drivers/usb/typec/class.c         |  2 ++
 drivers/usb/typec/notify.c        | 23 +++++++++++++++++++++++
 include/linux/usb/typec_altmode.h |  9 +++++++++
 5 files changed, 37 insertions(+), 1 deletion(-)
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
index 9b2647cb199b..9d2aa3dd3f56 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -600,6 +600,8 @@ typec_register_altmode(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	typec_notify_event(TYPEC_ALTMODE_REGISTERED, &alt->adev);
+
 	return &alt->adev;
 }
 
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

