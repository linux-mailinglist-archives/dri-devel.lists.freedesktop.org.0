Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3308CA680
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 04:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642FC10E660;
	Tue, 21 May 2024 02:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107D810E215
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 02:58:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALdcEwi4Li8DdjEza142bOgMfxG11+YezloMr0iXhAdmiv9mx8652x7DJyFw/2BvGnUvygNpqs6fZrs5fUdsE2tGYMiuspgSBEaj4JMKnxcIrviVDoxYbfdAjGaLkVZ8jfIdfCyQ3NjT+y1+EEuP5PNIOeVL5Sg+rNnaG37GwsQfoWKQqBmUMwCaf28aCr/PA7hMD4LlwlUIsHH9TaMrHPsPBw9QMfKj3jpJiBXP6JUH4DBB0OgV7M3xh0AZLz30r8kLhQFY3tqgZa42R0f/SUHcIjve9fvy/sDcOsslNE7la01JSTyxBI6pwujRWiMPAGPoBbRgjvOwQ06clLV2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fw7zHDNSaeaHhDq6UHj6zwYm5NlE7ogweguqdhMtzw8=;
 b=N56ogKYwJPMejIPEOt26caIDVRN1Dh9pD5AxPPBVwjfn3yEcBKCAA26HbaTtryF+EIpsdpN6Y2g7Pmjfdi7QU8UhKIvnwhNOEbhumkKPIxJopbj0sB1fzLC9cd/u5lQxM6z2JutKlWvWHl377RRsrMlvGpXRGDMlEVQFtJAVwS5Gat8vDrah8IUe6NRt36Z/d1+oIqIlcygeDn9IYTDGH4rn2DlQeNh7JbkACWfA05jzdyXCZh59uijJ3mOwvQ0FuJGhQ9WTtaX9plE7CQgHC2Q0N7S6jC2Swp73QEWAUmcjzpWr991QXoFC4tQviWPGD7NuGPAneSEaBlYTpMl1tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) by ZQ0PR01MB1255.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 02:58:27 +0000
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 ([fe80::39be:8ed9:67b7:adc6]) by
 ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn ([fe80::39be:8ed9:67b7:adc6%6])
 with mapi id 15.20.7472.044; Tue, 21 May 2024 02:58:27 +0000
From: keith <keith.zhao@starfivetech.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 xingyu.wu@starfivetech.com, p.zabel@pengutronix.de,
 jack.zhu@starfivetech.com, shengyang.chen@starfivetech.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 keith.zhao@starfivetech.com
Subject: [PATCH v4 02/10] drm/bridge: add common api for inno hdmi
Date: Tue, 21 May 2024 18:58:09 +0800
Message-Id: <20240521105817.3301-3-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240521105817.3301-1-keith.zhao@starfivetech.com>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::29) To ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1047:EE_|ZQ0PR01MB1255:EE_
X-MS-Office365-Filtering-Correlation-Id: fde06dff-31ec-4c0f-6a89-08dc7941e37a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|41320700004|1800799015|7416005|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 8tSDE7KQLrPdDGNVsL0dYaXcM1nzS1sDAc62mimRMpaMa/1OKKdplkUX5lQLW+3VWLZtNRsIej+jeDKOXpqSIKDdkWFzS5fZPE1znzOva4fJikqhUWDa4e43/53lZKJwi5PHH3LiK2kixXTjlR8a0xfl4qAQdl3hQLWtL8OrZuaxROEGQbfMV6qIZGgkV3xhtEmo2GWmesFCcmPBR8RNAPBCM67Hu+U//bBmpeN4fNRrGYKcDdhazQgRuH6eRoP7Jro1xAAzy7weaV67sX9P7XQfmzTy9TpkAR+dUtKLQNEWvl9tKf9CQIPStQ2huwOYMyv3NQ44YbS9gR4iqJroyN6GLF8Pqr6RYnEUVmrbJttmlutQMkiPTxm5kumREmRbmDpjXXgBSzYrUExcdNl9oQDxuVUoYuvA6H73s17pRUEDaoGly29rpa7xzAd7o2kHy6HKb626c53a6KplNhQtq8T4IVyx3K5L3wzRFiyINl8zb8tc6HxW13XeKx5hgYzvTs1CqXReSdQXZs2b6qDfQsdXbF9/Tgay2oaGm6gLJiRvHpU8w6FUQSZCFFLDKvEpnpa+w1IGlbGsLfiXdlXdjw8GQLUGlGP0EMpO2579XPXNaVtyjWhMPq06580Fhyv5Q+XbGL8FELFaQpFHqX46Tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(366007)(41320700004)(1800799015)(7416005)(52116005)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YddRQ+BPx9dqhcf2U0h6TgO7HffHR1OTDHJrMXq8As4ElJPN8SOs7/jZ+BUr?=
 =?us-ascii?Q?q3K8jqB2OP5JbgCUWvsEFKe3PNZXrSHA2hemFJ508ttXF2JI33IzV/liRWQX?=
 =?us-ascii?Q?H/tO119gHFztnr8SS7BRQvnlQG/k5n+o0hlb98gVCXNXzwoB+BlmPlJbRBWn?=
 =?us-ascii?Q?n/YtUhjmxZDtu2RFE7+DrRHXlIimehMXCJU+UbODKQDk9ZIv6N2fyh4+ZW+J?=
 =?us-ascii?Q?uJq+vhTp4yL99JZfDIYShJBOmlXCDWDjkYDguPo3rWtK0H0V9Sssly+nfh5N?=
 =?us-ascii?Q?0olRvJ0fu6Rt7zvNmmcoiuyMOkfe8iIwNqNR4u/M7F9johu9YalPoRNJTzuE?=
 =?us-ascii?Q?cNPxSQf4fqBIpIRb3G5etk7XhbANpz/pDSdzt1eDf6lzNI2KdxUgtRE46l2H?=
 =?us-ascii?Q?vmq9Ddk0btSTwA3es0U4V06ZDv2Nc1t3jKi4woJZE9FU8K69XOVa8mg7Aqj3?=
 =?us-ascii?Q?2d1bvhb8AYkNSxkI/PJ8EfHiE0ZdNFKL6l8aWw7V733YKFG9UqMpiFMjNweE?=
 =?us-ascii?Q?sUlDvtHN00Fz08UdDreYdZ5eg/jcOPy2YmYTUOlCpUzWJPJFwnv8AKdscsri?=
 =?us-ascii?Q?FW242xnG7+ugGndWvK7POrMybrH583HIJBGqwc39aKulivVOEJ/YOq1FaG/b?=
 =?us-ascii?Q?omSCjaabR9PsEqdKQn2FXJYKuIE/OGY+9Sra0m2Pl/13hBpxaTomhKJJLlAA?=
 =?us-ascii?Q?1vjTnh5qbhoo+ktFBqEHiLVTlHm/Q2vv4VY9xONOWXrWBnST+8atkZseaS3j?=
 =?us-ascii?Q?sXvMP00jJwCOZ1nT7vhmJMqE5CNTrhiQNlWSkL2vEmCovibwzCjB+HE18bfd?=
 =?us-ascii?Q?sU19sHqce0VclToKOVnJsZAk5GHMyiXEZXlzpCA/ErHbgdbK6u3ciIYwK4aZ?=
 =?us-ascii?Q?59Q8ZFM9P4dO6sIHeFgO0P0hX3IE4VTE7NkNs3FzPnTspgwq40PdC3BkQWZU?=
 =?us-ascii?Q?PfbK9pO9rsRpLigjA4ZCqYRcHFBJHddWDMDrIX9YGC9gFcloUpVfo0xXArvz?=
 =?us-ascii?Q?pTH1LVnmPGD3J4BSIDLkVX2GU3a8JOJK6VpmIxDCNDMSBmuPfGMXgjS8Iiqt?=
 =?us-ascii?Q?WMUepMECyZMrwqLwKyhGTF0wuvmm6Rp5R4khdMhk3cTizZPKvrzSLmnk0GEK?=
 =?us-ascii?Q?gF26dyVT75aXks5olbzp6Bzr24D3eh39kDIxK9Qe+ns6bUMrVU+cV7uYfaeq?=
 =?us-ascii?Q?HWSPiYSg7Bu37abNsYsfmr5/DDEn/buhX5Kz9RNZEsXo+jlzEqSir4v6MT5I?=
 =?us-ascii?Q?fuwldybSO1FQ64odaAF3lowWLit7rJtBazm1xp+bpT5HJaIQi99tyuipV5tm?=
 =?us-ascii?Q?ZWfsDFr8bUpkCndRc4TIT14wiRoyyeWKJUQlSISvZC1iVXO+NBh613oz8UDw?=
 =?us-ascii?Q?2PxkrGIPVDO5AG6EsQFvCQvyJ4m7/5hKHxdd+/b1qaEuLvGkOJ8rPVYZIHM/?=
 =?us-ascii?Q?YP3FRDtEVNeruW2EO97DZINo1xLsupvWSN3jwNpeC4Kq4nMDUS5GCnJlLg4x?=
 =?us-ascii?Q?Z/i4kvENnubn6vbslaXOdpSDyNYeNMeMz++c5WoF5IB32nej2+SKu//pgG1m?=
 =?us-ascii?Q?4Aw6/FE3diabruqCi/s0Jzah4T6snhVABXEg3pZHEZC4PaVOz+sHndNocgDU?=
 =?us-ascii?Q?Iw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde06dff-31ec-4c0f-6a89-08dc7941e37a
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:58:27.7462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woSGgMTPJGHa7YycTil/0aVAbaJESHQulkW0pHtTLPbvdSp+Mf6DlH7cMdAC4QIn60UrDltwVmVa56SUKNxf21Q+uh+T3fBsnElNQsPh7qU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1255
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

Add INNO common api so that it can be used by vendor
drivers which implement vendor specific extensions to Innosilicon HDMI.

Signed-off-by: keith <keith.zhao@starfivetech.com>
---
 MAINTAINERS                                   |   2 +
 drivers/gpu/drm/bridge/Kconfig                |   2 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/innosilicon/Kconfig    |   6 +
 drivers/gpu/drm/bridge/innosilicon/Makefile   |   2 +
 .../gpu/drm/bridge/innosilicon/inno-hdmi.c    | 587 ++++++++++++++++++
 .../gpu/drm/bridge/innosilicon/inno-hdmi.h    |  97 +++
 include/drm/bridge/inno_hdmi.h                |  69 ++
 8 files changed, 766 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/innosilicon/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/innosilicon/Makefile
 create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
 create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h
 create mode 100644 include/drm/bridge/inno_hdmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8881652bb8b6..cf2d66f88a83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7155,6 +7155,8 @@ S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/starfive/
+F:	drivers/gpu/drm/bridge/innosilicon/
+F:	include/drm/bridge/inno_hdmi.h
 
 DRM DRIVER FOR SYNAPTICS R63353 PANELS
 M:	Michael Trimarchi <michael@amarulasolutions.com>
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c621be1a99a8..59fcdb810125 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -415,6 +415,8 @@ source "drivers/gpu/drm/bridge/cadence/Kconfig"
 
 source "drivers/gpu/drm/bridge/imx/Kconfig"
 
+source "drivers/gpu/drm/bridge/innosilicon/Kconfig"
+
 source "drivers/gpu/drm/bridge/synopsys/Kconfig"
 
 endmenu
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 7df87b582dca..cca7400566b2 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -40,4 +40,5 @@ obj-$(CONFIG_DRM_ITE_IT66121) += ite-it66121.o
 obj-y += analogix/
 obj-y += cadence/
 obj-y += imx/
+obj-y += innosilicon/
 obj-y += synopsys/
diff --git a/drivers/gpu/drm/bridge/innosilicon/Kconfig b/drivers/gpu/drm/bridge/innosilicon/Kconfig
new file mode 100644
index 000000000000..73dbed3b1c4d
--- /dev/null
+++ b/drivers/gpu/drm/bridge/innosilicon/Kconfig
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DRM_INNO_HDMI
+	tristate
+	help
+	  Support the common interface which is part of the INNO
+	  Designware HDMI block.
diff --git a/drivers/gpu/drm/bridge/innosilicon/Makefile b/drivers/gpu/drm/bridge/innosilicon/Makefile
new file mode 100644
index 000000000000..3b3a961ab9fb
--- /dev/null
+++ b/drivers/gpu/drm/bridge/innosilicon/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_DRM_INNO_HDMI) += inno-hdmi.o
diff --git a/drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c b/drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
new file mode 100644
index 000000000000..2378ce06a876
--- /dev/null
+++ b/drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
@@ -0,0 +1,587 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
+ *    Zheng Yang <zhengyang@rock-chips.com>
+ *    Yakir Yang <ykk@rock-chips.com>
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/irq.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/hdmi.h>
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+
+#include <drm/bridge/inno_hdmi.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "inno-hdmi.h"
+
+struct inno_hdmi_i2c {
+	struct i2c_adapter adap;
+
+	u8 ddc_addr;
+	u8 segment_addr;
+
+	struct mutex lock; /* For i2c operation. */
+	struct completion cmp;
+};
+
+struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
+{
+	return container_of(connector, struct inno_hdmi, connector);
+}
+EXPORT_SYMBOL_GPL(connector_to_inno_hdmi);
+
+u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
+{
+	return readl_relaxed(hdmi->regs + (offset) * 0x04);
+}
+EXPORT_SYMBOL_GPL(hdmi_readb);
+
+void hdmi_writeb(struct inno_hdmi *hdmi, u16 offset, u32 val)
+{
+	writel_relaxed(val, hdmi->regs + (offset) * 0x04);
+}
+EXPORT_SYMBOL_GPL(hdmi_writeb);
+
+void hdmi_modb(struct inno_hdmi *hdmi, u16 offset, u32 msk, u32 val)
+{
+	u8 temp = hdmi_readb(hdmi, offset) & ~msk;
+
+	temp |= val & msk;
+	hdmi_writeb(hdmi, offset, temp);
+}
+EXPORT_SYMBOL_GPL(hdmi_modb);
+
+void inno_hdmi_i2c_init(struct inno_hdmi *hdmi, unsigned long long rate)
+{
+	unsigned long long ddc_bus_freq = rate >> 2;
+
+	do_div(ddc_bus_freq, HDMI_SCL_RATE);
+
+	hdmi_writeb(hdmi, DDC_BUS_FREQ_L, ddc_bus_freq & 0xFF);
+	hdmi_writeb(hdmi, DDC_BUS_FREQ_H, (ddc_bus_freq >> 8) & 0xFF);
+
+	/* Clear the EDID interrupt flag and mute the interrupt */
+	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, 0);
+	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_i2c_init);
+
+void inno_hdmi_sys_power(struct inno_hdmi *hdmi, bool enable)
+{
+	if (enable)
+		hdmi_modb(hdmi, HDMI_SYS_CTRL, m_POWER, v_PWR_ON);
+	else
+		hdmi_modb(hdmi, HDMI_SYS_CTRL, m_POWER, v_PWR_OFF);
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_sys_power);
+
+static enum drm_connector_status
+inno_hdmi_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+
+	return (hdmi_readb(hdmi, HDMI_STATUS) & m_HOTPLUG) ?
+		connector_status_connected : connector_status_disconnected;
+}
+
+static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
+{
+	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+	const struct drm_edid *drm_edid;
+	int ret = 0;
+
+	if (!hdmi->ddc)
+		return 0;
+
+	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc);
+	drm_edid_connector_update(connector, drm_edid);
+	ret = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
+
+	return ret;
+}
+
+static enum drm_mode_status
+inno_hdmi_connector_mode_valid(struct drm_connector *connector, struct drm_display_mode *mode)
+{
+	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+
+	const struct inno_hdmi_plat_data *pdata = hdmi->plat_data;
+	enum drm_mode_status mode_status = MODE_OK;
+
+	if (pdata->mode_valid)
+		mode_status = pdata->mode_valid(connector, mode);
+
+	return mode_status;
+}
+
+static void
+inno_hdmi_connector_destroy_state(struct drm_connector *connector,
+				  struct drm_connector_state *state)
+{
+	struct inno_hdmi_connector_state *inno_conn_state =
+						to_inno_hdmi_conn_state(state);
+
+	__drm_atomic_helper_connector_destroy_state(&inno_conn_state->base);
+	kfree(inno_conn_state);
+}
+
+static void inno_hdmi_connector_reset(struct drm_connector *connector)
+{
+	struct inno_hdmi_connector_state *inno_conn_state;
+
+	if (connector->state) {
+		inno_hdmi_connector_destroy_state(connector, connector->state);
+		connector->state = NULL;
+	}
+
+	inno_conn_state = kzalloc(sizeof(*inno_conn_state), GFP_KERNEL);
+	if (!inno_conn_state)
+		return;
+
+	__drm_atomic_helper_connector_reset(connector, &inno_conn_state->base);
+
+	inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
+	inno_conn_state->enc_out_format = HDMI_COLORSPACE_RGB;
+	inno_conn_state->rgb_limited_range = false;
+}
+
+static struct drm_connector_state *
+inno_hdmi_connector_duplicate_state(struct drm_connector *connector)
+{
+	struct inno_hdmi_connector_state *inno_conn_state;
+
+	if (WARN_ON(!connector->state))
+		return NULL;
+
+	inno_conn_state = kmemdup(to_inno_hdmi_conn_state(connector->state),
+				  sizeof(*inno_conn_state), GFP_KERNEL);
+
+	if (!inno_conn_state)
+		return NULL;
+
+	__drm_atomic_helper_connector_duplicate_state(connector,
+						      &inno_conn_state->base);
+
+	return &inno_conn_state->base;
+}
+
+static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.detect = inno_hdmi_connector_detect,
+	.reset = inno_hdmi_connector_reset,
+	.atomic_duplicate_state = inno_hdmi_connector_duplicate_state,
+	.atomic_destroy_state = inno_hdmi_connector_destroy_state,
+};
+
+static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
+	.get_modes = inno_hdmi_connector_get_modes,
+	.mode_valid = inno_hdmi_connector_mode_valid,
+};
+
+static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi,
+			      struct drm_encoder *encoder)
+{
+	struct device *dev = hdmi->dev;
+	const struct inno_hdmi_plat_data *pdata = hdmi->plat_data;
+
+	if (RK3128_HDMI == pdata->soc_type || RK3036_HDMI == pdata->soc_type)
+		drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
+
+	/*
+	 * If we failed to find the CRTC(s) which this encoder is
+	 * supposed to be connected to, it's because the CRTC has
+	 * not been registered yet.  Defer probing, and hope that
+	 * the required CRTC is added later.
+	 */
+	if (encoder->possible_crtcs == 0)
+		return -EPROBE_DEFER;
+
+	drm_encoder_helper_add(encoder, pdata->helper_private);
+
+	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
+
+	drm_connector_helper_add(&hdmi->connector,
+				 &inno_hdmi_connector_helper_funcs);
+
+	drmm_connector_init(drm, &hdmi->connector,
+			    &inno_hdmi_connector_funcs,
+			    DRM_MODE_CONNECTOR_HDMIA,
+			    hdmi->ddc);
+
+	drm_connector_attach_encoder(&hdmi->connector, encoder);
+
+	return 0;
+}
+
+static irqreturn_t inno_hdmi_i2c_irq(struct inno_hdmi *hdmi)
+{
+	struct inno_hdmi_i2c *i2c = hdmi->i2c;
+	u8 stat;
+
+	stat = hdmi_readb(hdmi, HDMI_INTERRUPT_STATUS1);
+	if (!(stat & m_INT_EDID_READY))
+		return IRQ_NONE;
+
+	/* Clear HDMI EDID interrupt flag */
+	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);
+
+	complete(&i2c->cmp);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t inno_hdmi_hardirq(int irq, void *dev_id)
+{
+	struct inno_hdmi *hdmi = dev_id;
+	irqreturn_t ret = IRQ_NONE;
+	u8 interrupt;
+
+	if (hdmi->i2c)
+		ret = inno_hdmi_i2c_irq(hdmi);
+
+	interrupt = hdmi_readb(hdmi, HDMI_STATUS);
+	if (interrupt & m_INT_HOTPLUG) {
+		hdmi_modb(hdmi, HDMI_STATUS, m_INT_HOTPLUG, m_INT_HOTPLUG);
+		ret = IRQ_WAKE_THREAD;
+	}
+
+	return ret;
+}
+
+static irqreturn_t inno_hdmi_irq(int irq, void *dev_id)
+{
+	struct inno_hdmi *hdmi = dev_id;
+
+	drm_helper_hpd_irq_event(hdmi->connector.dev);
+
+	return IRQ_HANDLED;
+}
+
+static int inno_hdmi_i2c_read(struct inno_hdmi *hdmi, struct i2c_msg *msgs)
+{
+	int length = msgs->len;
+	u8 *buf = msgs->buf;
+	int ret;
+
+	ret = wait_for_completion_timeout(&hdmi->i2c->cmp, HZ / 10);
+	if (!ret)
+		return -EAGAIN;
+
+	while (length--)
+		*buf++ = hdmi_readb(hdmi, HDMI_EDID_FIFO_ADDR);
+
+	return 0;
+}
+
+static int inno_hdmi_i2c_write(struct inno_hdmi *hdmi, struct i2c_msg *msgs)
+{
+	/*
+	 * The DDC module only support read EDID message, so
+	 * we assume that each word write to this i2c adapter
+	 * should be the offset of EDID word address.
+	 */
+	if (msgs->len != 1 || (msgs->addr != DDC_ADDR && msgs->addr != DDC_SEGMENT_ADDR))
+		return -EINVAL;
+
+	reinit_completion(&hdmi->i2c->cmp);
+
+	if (msgs->addr == DDC_SEGMENT_ADDR)
+		hdmi->i2c->segment_addr = msgs->buf[0];
+	if (msgs->addr == DDC_ADDR)
+		hdmi->i2c->ddc_addr = msgs->buf[0];
+
+	/* Set edid fifo first addr */
+	hdmi_writeb(hdmi, HDMI_EDID_FIFO_OFFSET, 0x00);
+
+	/* Set edid word address 0x00/0x80 */
+	hdmi_writeb(hdmi, HDMI_EDID_WORD_ADDR, hdmi->i2c->ddc_addr);
+
+	/* Set edid segment pointer */
+	hdmi_writeb(hdmi, HDMI_EDID_SEGMENT_POINTER, hdmi->i2c->segment_addr);
+
+	return 0;
+}
+
+static int inno_hdmi_i2c_xfer(struct i2c_adapter *adap,
+			      struct i2c_msg *msgs, int num)
+{
+	struct inno_hdmi *hdmi = i2c_get_adapdata(adap);
+	struct inno_hdmi_i2c *i2c = hdmi->i2c;
+	int i, ret = 0;
+
+	mutex_lock(&i2c->lock);
+
+	/* Clear the EDID interrupt flag and unmute the interrupt */
+	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, m_INT_EDID_READY);
+	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);
+
+	for (i = 0; i < num; i++) {
+		DRM_DEV_DEBUG(hdmi->dev,
+			      "xfer: num: %d/%d, len: %d, flags: %#x\n",
+			      i + 1, num, msgs[i].len, msgs[i].flags);
+
+		if (msgs[i].flags & I2C_M_RD)
+			ret = inno_hdmi_i2c_read(hdmi, &msgs[i]);
+		else
+			ret = inno_hdmi_i2c_write(hdmi, &msgs[i]);
+
+		if (ret < 0)
+			break;
+	}
+
+	if (!ret)
+		ret = num;
+
+	/* Mute HDMI EDID interrupt */
+	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, 0);
+
+	mutex_unlock(&i2c->lock);
+
+	return ret;
+}
+
+static u32 inno_hdmi_i2c_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm inno_hdmi_algorithm = {
+	.master_xfer	= inno_hdmi_i2c_xfer,
+	.functionality	= inno_hdmi_i2c_func,
+};
+
+static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
+{
+	struct i2c_adapter *adap;
+	struct inno_hdmi_i2c *i2c;
+	int ret;
+
+	i2c = devm_kzalloc(hdmi->dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&i2c->lock);
+	init_completion(&i2c->cmp);
+
+	adap = &i2c->adap;
+	adap->owner = THIS_MODULE;
+	adap->dev.parent = hdmi->dev;
+	adap->dev.of_node = hdmi->dev->of_node;
+	adap->algo = &inno_hdmi_algorithm;
+	strscpy(adap->name, "Inno HDMI", sizeof(adap->name));
+	i2c_set_adapdata(adap, hdmi);
+
+	ret = i2c_add_adapter(adap);
+	if (ret) {
+		dev_warn(hdmi->dev, "cannot add %s I2C adapter\n", adap->name);
+		devm_kfree(hdmi->dev, i2c);
+		return ERR_PTR(ret);
+	}
+
+	hdmi->i2c = i2c;
+
+	DRM_DEV_INFO(hdmi->dev, "registered %s I2C bus driver\n", adap->name);
+
+	return adap;
+}
+
+int inno_hdmi_bind(struct drm_device *drm, struct inno_hdmi *hdmi, struct drm_encoder	*encoder)
+{
+	int ret, irq;
+	struct platform_device *pdev = to_platform_device(hdmi->dev);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		ret = irq;
+		return ret;
+	}
+
+	hdmi->ddc = inno_hdmi_i2c_adapter(hdmi);
+	if (IS_ERR(hdmi->ddc)) {
+		ret = PTR_ERR(hdmi->ddc);
+		hdmi->ddc = NULL;
+		return ret;
+	}
+
+	ret = inno_hdmi_register(drm, hdmi, encoder);
+	if (ret)
+		goto err_put_adapter;
+
+	/* Unmute hotplug interrupt */
+	hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_INT_HOTPLUG(1));
+
+	ret = devm_request_threaded_irq(hdmi->dev, irq, inno_hdmi_hardirq,
+					inno_hdmi_irq, IRQF_SHARED,
+					dev_name(hdmi->dev), hdmi);
+	if (ret)
+		goto err_put_adapter;
+
+	return ret;
+err_put_adapter:
+	i2c_put_adapter(hdmi->ddc);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_bind);
+
+static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
+				    enum hdmi_infoframe_type type)
+{
+	struct drm_connector *connector = &hdmi->connector;
+
+	if (type != HDMI_INFOFRAME_TYPE_AVI) {
+		drm_err(connector->dev,
+			"Unsupported infoframe type: %u\n", type);
+		return;
+	}
+
+	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
+}
+
+static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
+				  union hdmi_infoframe *frame, enum hdmi_infoframe_type type)
+{
+	struct drm_connector *connector = &hdmi->connector;
+	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
+	ssize_t rc, i;
+
+	if (type != HDMI_INFOFRAME_TYPE_AVI) {
+		drm_err(connector->dev,
+			"Unsupported infoframe type: %u\n", type);
+		return 0;
+	}
+
+	inno_hdmi_disable_frame(hdmi, type);
+
+	rc = hdmi_infoframe_pack(frame, packed_frame,
+				 sizeof(packed_frame));
+	if (rc < 0)
+		return rc;
+
+	for (i = 0; i < rc; i++)
+		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
+			    packed_frame[i]);
+
+	return 0;
+}
+
+int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi, struct drm_display_mode *mode)
+{
+	struct drm_connector *connector = &hdmi->connector;
+	struct drm_connector_state *conn_state = connector->state;
+	struct inno_hdmi_connector_state *inno_conn_state =
+					to_inno_hdmi_conn_state(conn_state);
+	union hdmi_infoframe frame;
+	int rc;
+
+	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
+						      &hdmi->connector,
+						      mode);
+	if (rc) {
+		inno_hdmi_disable_frame(hdmi, HDMI_INFOFRAME_TYPE_AVI);
+		return rc;
+	}
+
+	if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV444)
+		frame.avi.colorspace = HDMI_COLORSPACE_YUV444;
+	else if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV422)
+		frame.avi.colorspace = HDMI_COLORSPACE_YUV422;
+	else
+		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
+
+	if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_RGB) {
+		drm_hdmi_avi_infoframe_quant_range(&frame.avi,
+						   connector, mode,
+						   inno_conn_state->rgb_limited_range ?
+						   HDMI_QUANTIZATION_RANGE_LIMITED :
+						   HDMI_QUANTIZATION_RANGE_FULL);
+	} else {
+		frame.avi.quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
+		frame.avi.ycc_quantization_range =
+			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
+	}
+
+	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_AVI);
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_config_video_avi);
+
+int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi, struct drm_display_mode *mode)
+{
+	int value;
+
+	/* Set detail external video timing polarity and interlace mode */
+	value = v_EXTERANL_VIDEO(1);
+	if (hdmi->plat_data->soc_type == STARFIVE_HDMI) {
+		value |= mode->flags & DRM_MODE_FLAG_PHSYNC ?
+			v_HSYNC_POLARITY_SF(1) : v_HSYNC_POLARITY_SF(0);
+		value |= mode->flags & DRM_MODE_FLAG_PVSYNC ?
+			v_VSYNC_POLARITY_SF(1) : v_VSYNC_POLARITY_SF(0);
+	} else {
+		value |= mode->flags & DRM_MODE_FLAG_PHSYNC ?
+			v_HSYNC_POLARITY(1) : v_HSYNC_POLARITY(0);
+		value |= mode->flags & DRM_MODE_FLAG_PVSYNC ?
+			v_VSYNC_POLARITY(1) : v_VSYNC_POLARITY(0);
+	}
+	value |= mode->flags & DRM_MODE_FLAG_INTERLACE ?
+	 v_INETLACE(1) : v_INETLACE(0);
+	hdmi_writeb(hdmi, HDMI_VIDEO_TIMING_CTL, value);
+
+	/* Set detail external video timing */
+	value = mode->htotal;
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HTOTAL_L, value & 0xFF);
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HTOTAL_H, (value >> 8) & 0xFF);
+
+	value = mode->htotal - mode->hdisplay;
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HBLANK_L, value & 0xFF);
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HBLANK_H, (value >> 8) & 0xFF);
+
+	value = mode->htotal - mode->hsync_start;
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDELAY_L, value & 0xFF);
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDELAY_H, (value >> 8) & 0xFF);
+
+	value = mode->hsync_end - mode->hsync_start;
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDURATION_L, value & 0xFF);
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDURATION_H, (value >> 8) & 0xFF);
+
+	value = mode->vtotal;
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VTOTAL_L, value & 0xFF);
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VTOTAL_H, (value >> 8) & 0xFF);
+
+	value = mode->vtotal - mode->vdisplay;
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VBLANK, value & 0xFF);
+
+	value = mode->vtotal - mode->vsync_start;
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VDELAY, value & 0xFF);
+
+	value = mode->vsync_end - mode->vsync_start;
+	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VDURATION, value & 0xFF);
+
+	if (hdmi->plat_data->soc_type == STARFIVE_HDMI)
+		return 0;
+
+	hdmi_writeb(hdmi, HDMI_PHY_PRE_DIV_RATIO, 0x1e);
+	hdmi_writeb(hdmi, HDMI_PHY_FEEDBACK_DIV_RATIO_LOW, 0x2c);
+	hdmi_writeb(hdmi, HDMI_PHY_FEEDBACK_DIV_RATIO_HIGH, 0x01);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_config_video_timing);
+
+MODULE_DESCRIPTION("INNO HDMI transmitter driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:inno-hdmi");
diff --git a/drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h b/drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h
new file mode 100644
index 000000000000..233077cfb136
--- /dev/null
+++ b/drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
+ *    Zheng Yang <zhengyang@rock-chips.com>
+ *    Yakir Yang <ykk@rock-chips.com>
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#ifndef __INNO_H__
+#define __INNO_H__
+
+#define DDC_SEGMENT_ADDR		0x30
+
+#define HDMI_SCL_RATE			(100 * 1000)
+#define DDC_BUS_FREQ_L			0x4b
+#define DDC_BUS_FREQ_H			0x4c
+
+#define HDMI_SYS_CTRL			0x00
+#define m_RST_ANALOG			(1 << 6)
+#define v_RST_ANALOG			(0 << 6)
+#define v_NOT_RST_ANALOG		(1 << 6)
+#define m_RST_DIGITAL			(1 << 5)
+#define v_RST_DIGITAL			(0 << 5)
+#define v_NOT_RST_DIGITAL		(1 << 5)
+#define m_REG_CLK_INV			(1 << 4)
+#define v_REG_CLK_NOT_INV		(0 << 4)
+#define v_REG_CLK_INV			(1 << 4)
+#define m_VCLK_INV			(1 << 3)
+#define v_VCLK_NOT_INV			(0 << 3)
+#define v_VCLK_INV			(1 << 3)
+#define m_REG_CLK_SOURCE		(1 << 2)
+#define v_REG_CLK_SOURCE_TMDS		(0 << 2)
+#define v_REG_CLK_SOURCE_SYS		(1 << 2)
+#define m_POWER				(1 << 1)
+#define v_PWR_ON			(0 << 1)
+#define v_PWR_OFF			(1 << 1)
+#define m_INT_POL			(1 << 0)
+#define v_INT_POL_HIGH			1
+#define v_INT_POL_LOW			0
+
+#define HDMI_VIDEO_TIMING_CTL		0x08
+#define v_HSYNC_POLARITY(n)		((n) << 3)
+#define v_VSYNC_POLARITY(n)		((n) << 2)
+#define v_VSYNC_POLARITY_SF(n)		((n) << 3)
+#define v_HSYNC_POLARITY_SF(n)		((n) << 2)
+#define v_INETLACE(n)			((n) << 1)
+#define v_EXTERANL_VIDEO(n)		((n) << 0)
+
+#define HDMI_VIDEO_EXT_HTOTAL_L		0x09
+#define HDMI_VIDEO_EXT_HTOTAL_H		0x0a
+#define HDMI_VIDEO_EXT_HBLANK_L		0x0b
+#define HDMI_VIDEO_EXT_HBLANK_H		0x0c
+#define HDMI_VIDEO_EXT_HDELAY_L		0x0d
+#define HDMI_VIDEO_EXT_HDELAY_H		0x0e
+#define HDMI_VIDEO_EXT_HDURATION_L	0x0f
+#define HDMI_VIDEO_EXT_HDURATION_H	0x10
+#define HDMI_VIDEO_EXT_VTOTAL_L		0x11
+#define HDMI_VIDEO_EXT_VTOTAL_H		0x12
+#define HDMI_VIDEO_EXT_VBLANK		0x13
+#define HDMI_VIDEO_EXT_VDELAY		0x14
+#define HDMI_VIDEO_EXT_VDURATION	0x15
+
+#define HDMI_EDID_SEGMENT_POINTER	0x4d
+#define HDMI_EDID_WORD_ADDR		0x4e
+#define HDMI_EDID_FIFO_OFFSET		0x4f
+#define HDMI_EDID_FIFO_ADDR		0x50
+
+#define HDMI_INTERRUPT_MASK1		0xc0
+#define HDMI_INTERRUPT_STATUS1		0xc1
+#define	m_INT_ACTIVE_VSYNC		(1 << 5)
+#define m_INT_EDID_READY		(1 << 2)
+
+#define HDMI_CONTROL_PACKET_BUF_INDEX	0x9f
+enum {
+	INFOFRAME_VSI = 0x05,
+	INFOFRAME_AVI = 0x06,
+	INFOFRAME_AAI = 0x08,
+};
+
+#define HDMI_CONTROL_PACKET_ADDR	0xa0
+#define HDMI_MAXIMUM_INFO_FRAME_SIZE	0x11
+
+#define HDMI_STATUS			0xc8
+#define m_HOTPLUG			(1 << 7)
+#define m_MASK_INT_HOTPLUG		(1 << 5)
+#define m_INT_HOTPLUG			(1 << 1)
+#define v_MASK_INT_HOTPLUG(n)		(((n) & 0x1) << 5)
+
+#define HDMI_PHY_FEEDBACK_DIV_RATIO_LOW		0xe7
+#define v_FEEDBACK_DIV_LOW(n)			((n) & 0xff)
+#define HDMI_PHY_FEEDBACK_DIV_RATIO_HIGH	0xe8
+#define v_FEEDBACK_DIV_HIGH(n)			((n) & 1)
+
+#define HDMI_PHY_PRE_DIV_RATIO		0xed
+#define v_PRE_DIV_RATIO(n)		((n) & 0x1f)
+
+#endif /* __INNO_H__ */
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
new file mode 100644
index 000000000000..bc865f5343ce
--- /dev/null
+++ b/include/drm/bridge/inno_hdmi.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#ifndef __INNO_COMMON_HDMI__
+#define __INNO_COMMON_HDMI__
+
+#include <drm/drm_connector.h>
+#include <drm/drm_encoder.h>
+
+struct inno_hdmi_connector_state {
+	struct drm_connector_state	base;
+	unsigned int			enc_out_format;
+	unsigned int			colorimetry;
+	bool				rgb_limited_range;
+};
+
+enum inno_hdmi_devtype {
+	RK3036_HDMI,
+	RK3128_HDMI,
+	STARFIVE_HDMI,
+};
+
+#define to_inno_hdmi_conn_state(conn_state) \
+	container_of_const(conn_state, struct inno_hdmi_connector_state, base)
+
+struct inno_hdmi_phy_config {
+	unsigned long pixelclock;
+	u8 pre_emphasis;
+	u8 voltage_level_control;
+};
+
+struct inno_hdmi_plat_data {
+	enum inno_hdmi_devtype soc_type;
+
+	/* Platform-specific mode validation*/
+	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
+					   struct drm_display_mode *mode);
+	/* Platform-specific encoder helper funcs*/
+	const struct drm_encoder_helper_funcs *helper_private;
+
+	/* Platform-specific phy_configs Optional*/
+	struct inno_hdmi_phy_config *phy_configs;
+	struct inno_hdmi_phy_config *default_phy_config;
+};
+
+struct inno_hdmi {
+	struct device *dev;
+	void __iomem *regs;
+
+	struct drm_connector	connector;
+	struct inno_hdmi_i2c	*i2c;
+	struct i2c_adapter	*ddc;
+	const struct inno_hdmi_plat_data *plat_data;
+};
+
+u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset);
+void hdmi_writeb(struct inno_hdmi *hdmi, u16 offset, u32 val);
+void hdmi_modb(struct inno_hdmi *hdmi, u16 offset, u32 msk, u32 val);
+
+struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector);
+void inno_hdmi_i2c_init(struct inno_hdmi *hdmi, unsigned long long rate);
+int inno_hdmi_bind(struct drm_device *drm, struct inno_hdmi *hdmi, struct drm_encoder *encoder);
+void inno_hdmi_sys_power(struct inno_hdmi *hdmi, bool enable);
+int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi, struct drm_display_mode *mode);
+int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi, struct drm_display_mode *mode);
+
+#endif /* __INNO_COMMON_HDMI__ */
-- 
2.27.0

