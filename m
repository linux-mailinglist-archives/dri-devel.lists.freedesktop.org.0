Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6DF8CA684
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 04:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C12410EA7F;
	Tue, 21 May 2024 02:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2106.outbound.protection.partner.outlook.cn [139.219.17.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA7710E465
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 02:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwQKgxlszXQIjm1CJ559Tyb9amWP6JCSrXPOISMBaExvR1IfFTBoJCQqTa3+Hjg+8ou30oTYWYXivss9cjLjgjj+1TPsvAdcwb1LlPVQTIOglMq96gCpeRsjLksy+lPVn01QmqxfyCWWe9l1EMaWwOcSgjyAvKhIKGqhYAdbRYBNEkiXcYKMD3SGAft/kalhLi5Sf5xLPzFCw4+5PyyOaaKD5Vy2Bf7bFcEXe8RlHXcNcq/sd8TJtTrseK45b/io0eVGTRi0r+1l39CmnhBxrvcyUNEkExItFIQEwQTPjpyTqYfoELwkgYUckBG749xYW8kasNZshM6LyOY503amRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImRJqOjUKRUALgJH4yL5SYVCqs+ZZF49yWn6rduhMTM=;
 b=k3rfaZ9utWQrg3qoKf3hpHg4vZi3JF3krkbUDX8On7jS/1JZeJKlp2oOgJ1Akom5LvV1YTKeBJFRP+sjI/7tNJctuf0Xbo4zHyxktl3LSfIYmsIxE6pidIOYa3QAOzdpExZSvC7E53gRdSM2YXkg5ssa/njn6lQ8ABN9+hNUlUAai3cngMS8nlOO0zWzT+sMuawaX2KMXb1D+vlrxjhz7PeOiw6ToQAfZqIkSnLzg9VLEU5FkilbQnCCABCGizJArB3Br780seOe3hNmmKBN9lTJpQ/nebSB+GAMTfz9JKOMzM5/Kx2jR0wqA+0XZBtRXILYu2beBXB9jm0IDdVeSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) by ZQ0PR01MB1128.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 21 May
 2024 02:58:36 +0000
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 ([fe80::39be:8ed9:67b7:adc6]) by
 ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn ([fe80::39be:8ed9:67b7:adc6%6])
 with mapi id 15.20.7472.044; Tue, 21 May 2024 02:58:36 +0000
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
Subject: [PATCH v4 10/10] drm/vs: add simple dsi encoder
Date: Tue, 21 May 2024 18:58:17 +0800
Message-Id: <20240521105817.3301-11-keith.zhao@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1047:EE_|ZQ0PR01MB1128:EE_
X-MS-Office365-Filtering-Correlation-Id: ee1c1c63-5995-4f54-43ec-08dc7941e8e0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X+anbPRpR4G3glKdGF5S/M0uZdIxmF63ePgLHKxPOa2Quk6oCxbZ4atbTvJB0XkF6ldl8UEftCE695qhgGmWiJXjk2mhkZ/pbxUI2BDy8ukRePZEK3A0bQg2qOL1pNOQOMposbiZWy4ZUsUkdXtwuB7AlyM8n3oceB+E9xX3yXfp1NRGI4Qn5QHH1kt2WW1Xk8OGWd2YuFBzo+htofe91QqIH1PhNfL/5tgFniNHH5xSFlsXLbE6MrxqvgCsEppH9qpo26Zyv2XHII/XzqL0GDm9bIk0LACa1/XOgeyvnU4rxXE+zF+SKIWbrpLeUSfbGTmObeVztKZli7M0RavpbSnMkbgk31ESE4qFcoi4nQ3YRYbvUg6Q0h1OQrKBIXer82PdoVRjTeKbyoSwwAZkJRb2lB4N5H41A2TSUYeyQCUCJmBTLgBJJ8GgdL59KURcNgrEU0N5vM2lc2LgE4QVUWweJr6AsyaacejJ18VyqjD6YLxIY11KQ1cEU6kdv1JNnye3ySl0rJ/DxxUHc8H7MenAhYNJ84Njt/80W1hrj2AZYEzFM919GORlNxBb3FpPqnuBQ7BuxzEsYRgfwkJ40F/1vniRLwa+cnFkZd0cJVGfjBUrxnOpXRrVWvV2z73c4JI/+aoe0Afu+PPxVy/V5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(41320700004)(52116005)(7416005)(1800799015)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PODdSKnexI6aBQ2l46x+jGk9ocxa41YJNpuOkoq8yeLMgz+I/NCVLZoqRx1O?=
 =?us-ascii?Q?18Vbt+82tY0IBe7k1Vf4rYaqA80yLeusXCbZfYUL50PVkQZrgx5sc669Fj6w?=
 =?us-ascii?Q?0Mc4T8Q6NTanEbpBy94MruNDwdFrdz+L6V+mkh15YhUCujbOzcnBNqsD25jK?=
 =?us-ascii?Q?GASIDHF2OuPshSGumQkKMc0VqEfHYqNJGbPqJjBoS2wYksvanZe4HhDpXPR3?=
 =?us-ascii?Q?wb1i/W44YYvXQ4aFEPwr0HTWSguVQd60qZuXRuSiKghyRm9aJIsM3HtkSeWr?=
 =?us-ascii?Q?fVFK7A/MkGwFZ+4+g7xLg7tFNr9FfKTXXJKbxuN9FLU2Q5WkJHXHcL+x6FFC?=
 =?us-ascii?Q?zOKa/lX6SOcxeuFzGCW4rMbnowJgewQRQzNbKXGfxt8GKENvEy94WClsU3u5?=
 =?us-ascii?Q?nzqQW5K/pFKXbTjq4Gc/+4Wm8QNtSGBPGaK2L9eNbWZSLsGZU830hX9XAp4l?=
 =?us-ascii?Q?9NOMs2K0c++kAacCFkeGP/f+4AJChT+OVTFyiGSlSs45ncoWNc8Wa1aCFdzA?=
 =?us-ascii?Q?KPcG4C6x58uhjHnacAW377arQflGd5Yv5vd/rVL3aMMmLUmNhDkM6ZKQ+7Ei?=
 =?us-ascii?Q?elip8s4S0G4xiY/T/urS5gnABsxCyAp/CsNq0yLTOJR2c8Sb4ELO9o4S03dZ?=
 =?us-ascii?Q?aRWElYLqbcpKDCYN5KyWxycrZ+VwFRTvAhnviFyEAlPbDY7oTBpXoWBvW1f4?=
 =?us-ascii?Q?EteEKhd29HZujUcSkt6eOlacBRXC/Z5g0nfHaSgPbT5L9BSejyuWcFV5O2ew?=
 =?us-ascii?Q?0G5W7yN4nQEX2MQk0J89ygWR783uRnovA20QAKPIEKmVK1ya4Y4cfRuqKSoO?=
 =?us-ascii?Q?L/dZ7EPCWnlFcDcusY99uIgCTiCEKMbp9zoEwqAnIxAroMvqP1zyyL0cLwYN?=
 =?us-ascii?Q?VHdEjJt3vylzp0EuuTUYNy6f6QTcFZ3zYfQRQFtfkANbJxGs3MYaREB+0Oms?=
 =?us-ascii?Q?Noa51vxwhxqoNaBgZjlOo2cZcOp1FlXUrrFDgQFge+ag2YUDeNWcBiljP1O9?=
 =?us-ascii?Q?udiydsRkFXTDT3UXeXsGbtktGG/D2D0hBl/LGKEK5cyz5kZgn5qv/l2KqCiv?=
 =?us-ascii?Q?yhKgXSx2/B2Hh8xioD8iTP2n8Gwdnaso8UxopHKLelozH8P+krobDBWAm6QL?=
 =?us-ascii?Q?kVCkgaaS5bO14r6dCku0iIQCUWXDBfRC6wWCWeVlL4neI0UKOEMkTNzsilTl?=
 =?us-ascii?Q?8HOe+lm3K+hZXsrMdVCY74OYMrTTcwXF3sPoCaGTW1Z6VlQjQNCdERHrpqP2?=
 =?us-ascii?Q?/00SwS2Uw81XJzrQ9mv4SpdFR3ZztSIEd3K2cBeKPk7oUoXRUBrSlLUuKnWn?=
 =?us-ascii?Q?lZT9VRD2gcAg+PNFHJ62Oyrv6AqnIM29zsuwd5LnkompEn86GkVWQtiix/31?=
 =?us-ascii?Q?TlwcLkxD5IMJNqdBX/2RpOLuHWid3OGs5STdIxTmh7sf8OR6hkblDSN1WJP6?=
 =?us-ascii?Q?8lWhBFXhjmAahXmZ0itPIR1IWJgXm7ls8ByjGODB7VKR8UY4txDgxmJGwTVD?=
 =?us-ascii?Q?rgtkdkQGFGWr/sWj29XAeeb1GQwd3iea0kZiuWjersANfbPk91c3Ri85D4Sd?=
 =?us-ascii?Q?RE0YjoP5x8fbKoj5jn+cVuYY+meqItlApOGYL5iDmZ9pPA1Wket7AwUdjGlk?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1c1c63-5995-4f54-43ec-08dc7941e8e0
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:58:36.7699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMRyhVvmRJxHiiRYTM4Poz0em0d2Zurn1A80bYQ6TFvm4Dgz+8wVPLjerPhTbQx3dnTaAz1uHpTnEUFsO6XPUZQdi8l82ToHXvoTpOYKNmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1128
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

add encoder to match cdns dsi driver

Signed-off-by: keith <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile        |   3 +-
 drivers/gpu/drm/verisilicon/vs_drv.c        |   1 +
 drivers/gpu/drm/verisilicon/vs_drv.h        |   1 +
 drivers/gpu/drm/verisilicon/vs_simple_enc.c | 190 ++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_simple_enc.h |  25 +++
 5 files changed, 219 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 2d02b4a3a567..c35ba9bd6f81 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -4,7 +4,8 @@ vs_drm-objs := vs_dc_hw.o \
 		vs_modeset.o \
 		vs_plane.o \
 		vs_crtc.o \
-		vs_drv.o
+		vs_drv.o \
+		vs_simple_enc.o
 
 vs_drm-$(CONFIG_DRM_INNO_STARFIVE_HDMI) += inno_hdmi-starfive.o
 obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/verisilicon/vs_drv.c
index 6f04102b05b3..2748d48f2c7e 100644
--- a/drivers/gpu/drm/verisilicon/vs_drv.c
+++ b/drivers/gpu/drm/verisilicon/vs_drv.c
@@ -612,6 +612,7 @@ static struct platform_driver *drm_sub_drivers[] = {
 #ifdef CONFIG_DRM_INNO_STARFIVE_HDMI
 	&starfive_hdmi_driver,
 #endif
+	&simple_encoder_driver,
 };
 
 static struct component_match *vs_add_external_components(struct device *dev)
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/verisilicon/vs_drv.h
index c3c08ed5f8ac..f3f0f170777d 100644
--- a/drivers/gpu/drm/verisilicon/vs_drv.h
+++ b/drivers/gpu/drm/verisilicon/vs_drv.h
@@ -17,6 +17,7 @@
 #include <drm/drm_managed.h>
 
 #include "vs_dc_hw.h"
+#include "vs_simple_enc.h"
 
 /*@pitch_alignment: buffer pitch alignment required by sub-devices.*/
 struct vs_drm_device {
diff --git a/drivers/gpu/drm/verisilicon/vs_simple_enc.c b/drivers/gpu/drm/verisilicon/vs_simple_enc.c
new file mode 100644
index 000000000000..d0b1755d77d2
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_simple_enc.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ */
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_of.h>
+
+#include "vs_crtc.h"
+#include "vs_simple_enc.h"
+
+static const struct simple_encoder_priv dsi_priv = {
+	.encoder_type = DRM_MODE_ENCODER_DSI
+};
+
+static inline struct vs_simple_encoder *to_simple_encoder(struct drm_encoder *enc)
+{
+	return container_of(enc, struct vs_simple_encoder, encoder);
+}
+
+static int encoder_parse_dt(struct device *dev)
+{
+	struct vs_simple_encoder *simple = dev_get_drvdata(dev);
+	unsigned int args[2];
+
+	simple->dss_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+								  "starfive,syscon",
+								  2, args);
+
+	if (IS_ERR(simple->dss_regmap)) {
+		return dev_err_probe(dev, PTR_ERR(simple->dss_regmap),
+				     "getting the regmap failed\n");
+	}
+
+	simple->offset = args[0];
+	simple->mask = args[1];
+
+	return 0;
+}
+
+static void vs_encoder_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
+{
+	struct vs_simple_encoder *simple = to_simple_encoder(encoder);
+
+	regmap_update_bits(simple->dss_regmap, simple->offset, simple->mask, simple->mask);
+}
+
+static int vs_encoder_atomic_check(struct drm_encoder *encoder,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	struct vs_crtc_state *vs_crtc_state = to_vs_crtc_state(crtc_state);
+	struct drm_connector *connector = conn_state->connector;
+	int ret = 0;
+
+	vs_crtc_state->encoder_type = encoder->encoder_type;
+	if (connector->display_info.num_bus_formats)
+		vs_crtc_state->output_fmt = connector->display_info.bus_formats[0];
+	else
+		vs_crtc_state->output_fmt = MEDIA_BUS_FMT_FIXED;
+
+	switch (vs_crtc_state->output_fmt) {
+	case MEDIA_BUS_FMT_FIXED:
+	case MEDIA_BUS_FMT_RGB565_1X16:
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		ret = 0;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	/* If MEDIA_BUS_FMT_FIXED, set it to default value */
+	if (vs_crtc_state->output_fmt == MEDIA_BUS_FMT_FIXED)
+		vs_crtc_state->output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
+
+	return ret;
+}
+
+static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
+	.atomic_check = vs_encoder_atomic_check,
+	.atomic_enable = vs_encoder_atomic_enable,
+};
+
+static int vs_encoder_bind(struct device *dev, struct device *master, void *data)
+{
+	struct drm_device *drm_dev = data;
+	struct vs_simple_encoder *simple = dev_get_drvdata(dev);
+	struct drm_encoder *encoder;
+	struct drm_bridge *bridge;
+	int ret;
+
+	encoder = &simple->encoder;
+
+	ret = drmm_encoder_init(drm_dev, encoder, NULL, simple->priv->encoder_type, NULL);
+	if (ret)
+		return ret;
+
+	drm_encoder_helper_add(encoder, &encoder_helper_funcs);
+
+	encoder->possible_crtcs =
+			drm_of_find_possible_crtcs(drm_dev, dev->of_node);
+
+	/* output port is port1*/
+	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(bridge)) {
+		if (PTR_ERR(bridge) == -ENODEV) {
+			bridge = NULL;
+			return 0;
+		}
+
+		return PTR_ERR(bridge);
+	}
+
+	return drm_bridge_attach(encoder, bridge, NULL, 0);
+}
+
+static const struct component_ops encoder_component_ops = {
+	.bind = vs_encoder_bind,
+};
+
+static int vs_encoder_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vs_simple_encoder *simple;
+	int ret;
+
+	simple = devm_kzalloc(dev, sizeof(*simple), GFP_KERNEL);
+	if (!simple)
+		return -ENOMEM;
+
+	simple->priv = of_device_get_match_data(dev);
+
+	simple->dev = dev;
+
+	dev_set_drvdata(dev, simple);
+
+	ret = encoder_parse_dt(dev);
+	if (ret)
+		return ret;
+
+	return component_add(dev, &encoder_component_ops);
+}
+
+static int vs_encoder_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	component_del(dev, &encoder_component_ops);
+	dev_set_drvdata(dev, NULL);
+
+	return 0;
+}
+
+static const struct of_device_id simple_encoder_dt_match[] = {
+	{ .compatible = "starfive,dsi-encoder", .data = &dsi_priv},
+	{},
+};
+MODULE_DEVICE_TABLE(of, simple_encoder_dt_match);
+
+struct platform_driver simple_encoder_driver = {
+	.probe = vs_encoder_probe,
+	.remove = vs_encoder_remove,
+	.driver = {
+		.name = "vs-simple-encoder",
+		.of_match_table = of_match_ptr(simple_encoder_dt_match),
+	},
+};
+
+MODULE_DESCRIPTION("Simple Encoder Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/verisilicon/vs_simple_enc.h b/drivers/gpu/drm/verisilicon/vs_simple_enc.h
new file mode 100644
index 000000000000..73e356bfeb2c
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_simple_enc.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_SIMPLE_ENC_H_
+#define __VS_SIMPLE_ENC_H_
+
+#include <drm/drm_encoder.h>
+
+struct simple_encoder_priv {
+	unsigned char encoder_type;
+};
+
+struct vs_simple_encoder {
+	struct drm_encoder encoder;
+	struct device *dev;
+	const struct simple_encoder_priv *priv;
+	struct regmap *dss_regmap;
+	unsigned int offset;
+	unsigned int mask;
+};
+
+extern struct platform_driver simple_encoder_driver;
+#endif /* __VS_SIMPLE_ENC_H_ */
-- 
2.27.0

