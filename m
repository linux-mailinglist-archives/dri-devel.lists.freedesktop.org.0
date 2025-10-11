Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C9BCEEDC
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 05:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F72310E080;
	Sat, 11 Oct 2025 03:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="JkeTkQVJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B18A10E080
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 03:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1760153569;
 bh=FwncydjEpKrZABF7OX/m91T9YSWh4FrlMTek2hhLtmc=;
 h=From:To:Subject:Date:Message-Id;
 b=JkeTkQVJfWRMCN73FLwmBC71qF57zgcovHWz7tmQD8MJdTPuiD89psIkiyqqvQVgO
 gqaUCWpbD175zvwlidJVU9JND3aUbrqZzkSiaGGWSxTOAVsUe0/GPJGk0Zii8OVeo3
 m/nvYm3YBdFzwK77PgXTZgGL/0P+8UYAcLo4wfOo=
X-QQ-mid: zesmtpgz4t1760153567t933226b5
X-QQ-Originating-IP: pzI+jTj2UtCmWD2N0Oeh+IAPExt3pVROubErMs+KBy4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 11 Oct 2025 11:32:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8809100551469140614
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
Subject: [PATCH v5 1/8] usb: typec: Add default HPD device when register
 DisplayPort altmode
Date: Sat, 11 Oct 2025 11:32:26 +0800
Message-Id: <20251011033233.97-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251011033233.97-1-kernel@airkyi.com>
References: <20251011033233.97-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OKKvvo6f47/bSIfBKw0PRfi64vrIs77dEVCmCp+x9wHp/6XpIojwCkJn
 lpn39sS8P3cXB8f4BOsnqcHdsk+ukyltOD+grxVGqUy/B0ejK3ORKQavB5odAmI/ycvZaXE
 rTrGJrvra3lIGNsvEXyX1dhWGpw1SPFpbR+pwLsQxKoCJdQx8KOb7jTH2iOK1TEkAaDUGRr
 KVQvuQs/Dz181T5mVqkmGUiQAzOnl2YPtufq8kF4QDLZbEf0S/0Hs68tM3VQ699oOPsK7Xn
 YiK3XuUbpVBCYKbuJdaHP7UDo6A9C6MLAyFnwANgkI41e5Sbd2QAuVbyCa9olEMjusoRgJO
 nKCq3iNgHpgXPB1nKXx+KcJEGD2y3i8aq/LGf2MCbSo3H/wEgpHl/DCb9HurbsvZjmVE0xK
 K5OPq/cvp/HCVKcSsxKq/u4GZHkBWor9U9f7W0qiu6N0sy5TyCA/P0VxKS0GDgBbmPvvegE
 /ZGYNSgrJbqQ9rO1eHJvURp3wDKO3wW2txoNVSmt49i/FPdCm2fd4BhM9uO+FtLFCIGvXB4
 OR1mhdAW+XVYQjS6sGThnRKpLxeVKx9ZiSS6ZdKv0rjV5ucTK94iXaIwdRpzSgvCD8Q4Msa
 7Cl/Cpwwg4MY99r8zy2GU4MOuZjVRm7yJXcJBiDlp2wF0zY1CzeRoB3YQ9DbxRMb7yITVqI
 8JTut0t8dWKM/eSxfZ46sct8oqx/3N5lj3WPqKSyqdjGDzg/QC+FiVuPjgBODmdqRZv2WIU
 uHKZS9FsYj4bOkteaaGu0I8p6v4Qanf6GcvHUIr/gHYoz7ax6jBEfBJGwZxdVt/pRCp83ps
 4BoiJcplkXZdBhNEfvW7bcJT9GKfb9VR0CTtZ56u7Noa5DhR0JUfuw/iCVIeO/s9cVCBcqF
 nROzIPsI/DHYsVYK35nPH7GWpeF+FEOIvdbRgjTpa7MH5UZ9qFCS83gRmK3HxDQaNY0v8Bo
 ZxMJPHedSkaxCtHI+RQ1VKGraxWSJTv79TzPfuCak+X7/2g==
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

Add default DRM AUX HPD bridge device when register DisplayPort
altmode. That makes it redundant for each Type-C driver to implement
a similar registration process in embedded scenarios.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v5:
- Remove the calls related to `drm_aux_hpd_bridge_notify()`.
- Place the helper functions in the same compilation unit.
- Add more comments about parent device.

 drivers/usb/typec/class.c         | 26 ++++++++++++++++++++++++++
 include/linux/usb/typec_altmode.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..e9d7772d1a8f 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -8,14 +8,18 @@
 
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 #include <linux/usb/pd_vdo.h>
+#include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_retimer.h>
 #include <linux/usb.h>
 
+#include <drm/bridge/aux-bridge.h>
+
 #include "bus.h"
 #include "class.h"
 #include "pd.h"
@@ -538,6 +542,21 @@ const struct device_type typec_altmode_dev_type = {
 	.release = typec_altmode_release,
 };
 
+static void dp_altmode_hpd_device_register(struct typec_altmode *alt)
+{
+	if (alt->svid != USB_TYPEC_DP_SID)
+		return;
+
+	/*
+	 * alt->dev.parent->parent : USB-C controller device
+	 * alt->dev.parent         : USB-C connector device
+	 */
+	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
+						  to_of_node(alt->dev.parent->fwnode));
+	if (IS_ERR(alt->hpd_dev))
+		alt->hpd_dev = NULL;
+}
+
 static struct typec_altmode *
 typec_register_altmode(struct device *parent,
 		       const struct typec_altmode_desc *desc)
@@ -600,6 +619,13 @@ typec_register_altmode(struct device *parent,
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

