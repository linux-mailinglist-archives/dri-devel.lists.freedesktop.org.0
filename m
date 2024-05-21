Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D2D8CA678
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 04:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD1910E228;
	Tue, 21 May 2024 02:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72D710E051
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 02:58:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ci08D7IUTqWZPlrjPlER646qHFWA7EPy0WGZv8ovit6cOJhggNhTOdZCaGdaeGtwJPARTcfFcTi/boTUL0SMl77KRE+K609IimUOew9Ma5TO4+Ev2y/KvZ135/b0y1RB+OEoJL4y16IbJOravIeVkA4neNj1zOGDSmtD4MLWwXOso9Xtq2LtCMGjueodtz1tz666Md33zCtl0S7RUZoGWKAnbitdqd8OJbEAUNxPw4iHCrRfDf+ah37ssP58TPLSSZaaxW6YaIquLyUymmNzpzz4T2NhxPLcZNmo6lncLmMuq3SJT0P3eXdwOctF7H1U6NJM3VW7DXOKmLykUy61Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtoJn6t7pvX80lMxrVsWfBiBB9KYSygPQjhD8HVQA3M=;
 b=J1CGecr5YKU7Wk3xFXB6zdoVaX2akjxdDNjyjeXjOMzwXg5LhCEO0F2qrG8kXuYo8F/DXVMKM8Gjbb3Puv+4KNzzQrnZhbDnPw5/4Wgd9W6fQd9WadhUnu2pW0BeG3n1pnjk7SRCXLNc+VkzjJTN1HIYsqD1XFF1Y8RgJLfS5FkE3qkd5QaJ+JAmGI0Mb+s72sPYI89NKyJNiTgpNNxjcXcGCApTYdooB2QEPgc01trzX8JNvZPNqiu/MPTWuhbWPjPNCsfqspT45YqOgldWgEkphtE4/Va/x/uB2UR3xsVFvjFS5g5R+y+prAjWKhfZfAmR9mwA67Gw97JpeVfSpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) by ZQ0PR01MB1255.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 02:58:28 +0000
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 ([fe80::39be:8ed9:67b7:adc6]) by
 ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn ([fe80::39be:8ed9:67b7:adc6%6])
 with mapi id 15.20.7472.044; Tue, 21 May 2024 02:58:28 +0000
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
Subject: [PATCH v4 03/10] drm/rockchip:hdmi: migrate to use inno-hdmi bridge
 driver
Date: Tue, 21 May 2024 18:58:10 +0800
Message-Id: <20240521105817.3301-4-keith.zhao@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: be952e03-a2ea-458e-3c23-08dc7941e428
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|41320700004|1800799015|7416005|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: RblV+Ix60hjj+OCxK44X4jK+tpZaw1qotgklFivwv51R+ih/KTVMADp+imRk+9lSTpyA9mdOWmjOceUuyue0A9va6kIs/f9KDxYpkdjJCzM8L5rrEm1paJ38zfeMGsnlNhGfilTmemIEb7b6s+sigCTgFBq/Su74dhxGirwtg7elRnJyZajr+I34obkQ1gKOEIzUNjwy/NA7aWomu57gtGr0p3eTU0i9XHI0FNjwlwf5jjRvEAUjvsnQbaU2GfY/Qd9QEBpLdDexkICnkYvHwaFu5S6kOQpozOJXRhHol9jpgPlCPWzx1+xM1UbNlGz2EGfkErceb7qpsNRtBYPfwQJZOxo/gJEB0GUWRjcbJUQiBsug5W2bPWGSsu/5C2UjYgVuvjeZoQSKvPXb/FMyR6O9pQcSwMbp+IU5fUSbYGAvWnvkGYbCxFORYxXsQQCpRnh9mJvmdASS+mH3PELIXAPMJR66oMVa5wbkvuL/BQqjrAgUFox0/RrmHPJpb+S1QVLOghpEif2pcPe8OwC4XsmdosTiYWumRKYU54wzvmHsdpVj6tKjY4vG0VwAdYxKHKCFc9Y44i0ttgNw3uDisNZNLqjeY4kO+wnXtNI3Ze69BOiOb7DgXNrdx9DMUwbeuZk4LEtUhrwHWXyzf2GIAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(366007)(41320700004)(1800799015)(7416005)(52116005)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bxJCVkwVEcOBWwXnEkfL9ysFRyEw2fKeJLdKu5jkIlfARfM1PWrRpTXTBYhh?=
 =?us-ascii?Q?qTvk9ALfGntl0UnFWYaNdu4QFdsd0NKmSxftEizLElKcrU96gBQd6pHXfOcg?=
 =?us-ascii?Q?ZSDtSbwaLwGNGtCLnOOJJJ4PWrFsbkQ6Kq0YPnHYAMgHuZtWLJDYAV5VAzXr?=
 =?us-ascii?Q?k6KKAhASHVNz0xxIC2ar74fvbYh2igg8yNuHvDACzsJVCG7RfH9xaDsc0t5k?=
 =?us-ascii?Q?yS2FcSLYN1eV9vx/1umcFx057e3kcN/5gQlHzaw4MTQ4OAOsZp+cuI7hdQBN?=
 =?us-ascii?Q?CePd5I6gxjEj2uxrkmGbcsLz8lrZgYXZXRYNunIi7sgg3jnEVPD6JKZ1oMf3?=
 =?us-ascii?Q?QV0gbVS6Th1Jq9pc8O2qG1Zz3BWJS/FY7isQGCuNkxd0KSgZ8WFRt9W67B1D?=
 =?us-ascii?Q?KEannAG13iezlA8Te5GVQy/gryTC0w1UNzlWw1hkErfDpdUpe+8RzM9WsWeA?=
 =?us-ascii?Q?rr8y9PcULUtpO5XeqC365NyOJ10IkLgKx7gEOpuIDR/HfkjRyTPFVkAaQPZ6?=
 =?us-ascii?Q?rcQgVOxnHr6Z42JENI58decsCChOunq0SccFS5QqUGrjL0GAaoE5JhAd8OoN?=
 =?us-ascii?Q?Wb2jPLy9UTsvu9U0bFiOp3Tvx66u+vRU7EOecZnm/exIlGg94o/Q91nNHkRV?=
 =?us-ascii?Q?XFsHqjswuFjHMogPC/SD3Uu1lCjdm774ttpRlAEzpHUWW4Og0Q0aH9sYg9pE?=
 =?us-ascii?Q?r0+i3PStDGqkjhP0mN1JVVDeNBq1ZtVqUZXaBLWdaGtnqDa5rQD1f5d7teRI?=
 =?us-ascii?Q?kKlggzgUXqVBRgMQmp6ue2Eagm9/655SthSygNslfheuqbQmhkByWJ5gmtGX?=
 =?us-ascii?Q?bsBUs6UPqfbRBzmHNEvyQlOK2lBqeYuJUV1mXRy3efRS+crEP5syOz33djwj?=
 =?us-ascii?Q?EsSAOz0JZClLIyWf5vO76w16/RgPIllm89g5rp7YO3zT7remEsgpMlcXgOXd?=
 =?us-ascii?Q?DWM4sh4vQDgn0CuE8voZx+gEb1IGaeQS/c6qt9aRZkn23Z5T2rH/mo1miKJo?=
 =?us-ascii?Q?Ch5dD4MhGjU50HGypfg6zOl636vkWFKYVlTLZfTVLfUjtJZFczj4tOJvVT56?=
 =?us-ascii?Q?9TGJTqg80g0tykNItc6WjK0HTMsZ67ZVdu0nHgidy2l0ju/906vYiQorgIKb?=
 =?us-ascii?Q?SA4oO/Fv3Pymc8FzpNeiS3axMKsiM9+PyzwIG/1mv8SDJux/Ysjj24EB3ebx?=
 =?us-ascii?Q?LRi3aUZGM3CIyb/MdpskUwq4ibN1M8hXIkgWwRqwYcKedypmMWqInfZEgWi9?=
 =?us-ascii?Q?KnA82hccLHJ6jqBrmH4T/W5fK8V5cP57CKvmVLFFfSVPa/sRsis/ehuRXouC?=
 =?us-ascii?Q?qljMtbkS1D8q+roSwurhCPQKAONdKzJw1JPBn2D6ZjFenDhz7FZHyBbAjyo1?=
 =?us-ascii?Q?ILUxXP8WnCXRhhDVduqSAHvVUaow3qVLsww6EOLk8QQ0V55WOwKEBAxZ93e7?=
 =?us-ascii?Q?GI/ssIeQcAZ8XMp0UD1bnioDqmkuAhlolnZuk6XUFcXRJt/onpl6YMdJRFDg?=
 =?us-ascii?Q?XGMQbu4l2a1ZwVNcXWM4XbYOaY5Ne9daCOOqylanWkxfBMD6hxfIzljrYcAo?=
 =?us-ascii?Q?jpo3Ro0J06z21g3GfL2xQ418PhoFpufCiasim2DvSWy5MFPsuVqU1ldcXNT9?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be952e03-a2ea-458e-3c23-08dc7941e428
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:58:28.8600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWltm+oc/WbKreqc8VzEq94Gp3c3O67jBpIO08r/5y+kkI1uJPH0YxVOkCLsI0Uc0rJ84ZHzmrMYGbDEgT3w9KpdmvsxOB5uVbzJCZuiMbM=
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

Add the ROCKCHIP inno hdmi driver that uses the Inno DesignWare
HDMI TX bridge and remove the old separate one.

Signed-off-by: keith <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/rockchip/Kconfig              |    1 +
 drivers/gpu/drm/rockchip/Makefile             |    2 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c |  517 ++++++++
 .../{inno_hdmi.h => inno_hdmi-rockchip.h}     |   45 -
 drivers/gpu/drm/rockchip/inno_hdmi.c          | 1073 -----------------
 5 files changed, 519 insertions(+), 1119 deletions(-)
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 rename drivers/gpu/drm/rockchip/{inno_hdmi.h => inno_hdmi-rockchip.h} (85%)
 delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 1bf3e2829cd0..cc6cfd5a30d6 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -74,6 +74,7 @@ config ROCKCHIP_DW_MIPI_DSI
 
 config ROCKCHIP_INNO_HDMI
 	bool "Rockchip specific extensions for Innosilicon HDMI"
+	select DRM_INNO_HDMI
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the Innosilicon HDMI driver. If you want to enable
diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
index 3ff7b21c0414..4b2d0cba8db3 100644
--- a/drivers/gpu/drm/rockchip/Makefile
+++ b/drivers/gpu/drm/rockchip/Makefile
@@ -12,7 +12,7 @@ rockchipdrm-$(CONFIG_ROCKCHIP_ANALOGIX_DP) += analogix_dp-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_CDN_DP) += cdn-dp-core.o cdn-dp-reg.o
 rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI) += dw_hdmi-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI) += dw-mipi-dsi-rockchip.o
-rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) += inno_hdmi.o
+rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) += inno_hdmi-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_LVDS) += rockchip_lvds.o
 rockchipdrm-$(CONFIG_ROCKCHIP_RGB) += rockchip_rgb.o
 rockchipdrm-$(CONFIG_ROCKCHIP_RK3066_HDMI) += rk3066_hdmi.o
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
new file mode 100644
index 000000000000..69d0e913e13b
--- /dev/null
+++ b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
@@ -0,0 +1,517 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
+ *    Zheng Yang <zhengyang@rock-chips.com>
+ *    Yakir Yang <ykk@rock-chips.com>
+ */
+
+#include <linux/irq.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/hdmi.h>
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
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "rockchip_drm_drv.h"
+
+#include "inno_hdmi-rockchip.h"
+
+#define INNO_HDMI_MIN_TMDS_CLOCK  25000000U
+
+struct rk_inno_hdmi {
+	struct rockchip_encoder encoder;
+	struct inno_hdmi inno_hdmi;
+	struct clk *pclk;
+	struct clk *refclk;
+};
+
+static struct inno_hdmi *rk_encoder_to_inno_hdmi(struct drm_encoder *encoder)
+{
+	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
+	struct rk_inno_hdmi *rk_hdmi = container_of(rkencoder, struct rk_inno_hdmi, encoder);
+
+	return &rk_hdmi->inno_hdmi;
+}
+
+enum {
+	CSC_RGB_0_255_TO_ITU601_16_235_8BIT,
+	CSC_RGB_0_255_TO_ITU709_16_235_8BIT,
+	CSC_RGB_0_255_TO_RGB_16_235_8BIT,
+};
+
+static const char coeff_csc[][24] = {
+	/*
+	 * RGB2YUV:601 SD mode:
+	 *   Cb = -0.291G - 0.148R + 0.439B + 128
+	 *   Y  = 0.504G  + 0.257R + 0.098B + 16
+	 *   Cr = -0.368G + 0.439R - 0.071B + 128
+	 */
+	{
+		0x11, 0x5f, 0x01, 0x82, 0x10, 0x23, 0x00, 0x80,
+		0x02, 0x1c, 0x00, 0xa1, 0x00, 0x36, 0x00, 0x1e,
+		0x11, 0x29, 0x10, 0x59, 0x01, 0x82, 0x00, 0x80
+	},
+	/*
+	 * RGB2YUV:709 HD mode:
+	 *   Cb = - 0.338G - 0.101R + 0.439B + 128
+	 *   Y  = 0.614G   + 0.183R + 0.062B + 16
+	 *   Cr = - 0.399G + 0.439R - 0.040B + 128
+	 */
+	{
+		0x11, 0x98, 0x01, 0xc1, 0x10, 0x28, 0x00, 0x80,
+		0x02, 0x74, 0x00, 0xbb, 0x00, 0x3f, 0x00, 0x10,
+		0x11, 0x5a, 0x10, 0x67, 0x01, 0xc1, 0x00, 0x80
+	},
+	/*
+	 * RGB[0:255]2RGB[16:235]:
+	 *   R' = R x (235-16)/255 + 16;
+	 *   G' = G x (235-16)/255 + 16;
+	 *   B' = B x (235-16)/255 + 16;
+	 */
+	{
+		0x00, 0x00, 0x03, 0x6F, 0x00, 0x00, 0x00, 0x10,
+		0x03, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10,
+		0x00, 0x00, 0x00, 0x00, 0x03, 0x6F, 0x00, 0x10
+	},
+};
+
+static struct inno_hdmi_phy_config rk3036_hdmi_phy_configs[] = {
+	{  74250000, 0x3f, 0xbb },
+	{ 165000000, 0x6f, 0xbb },
+	{      ~0UL, 0x00, 0x00 }
+};
+
+static struct inno_hdmi_phy_config rk3128_hdmi_phy_configs[] = {
+	{  74250000, 0x3f, 0xaa },
+	{ 165000000, 0x5f, 0xaa },
+	{      ~0UL, 0x00, 0x00 }
+};
+
+static int inno_hdmi_find_phy_config(struct inno_hdmi *hdmi,
+				     unsigned long pixelclk)
+{
+	const struct inno_hdmi_phy_config *phy_configs = hdmi->plat_data->phy_configs;
+	int i;
+
+	for (i = 0; phy_configs[i].pixelclock != ~0UL; i++) {
+		if (pixelclk <= phy_configs[i].pixelclock)
+			return i;
+	}
+
+	DRM_DEV_DEBUG(hdmi->dev, "No phy configuration for pixelclock %lu\n",
+		      pixelclk);
+
+	return -EINVAL;
+}
+
+static void inno_hdmi_standby(struct inno_hdmi *hdmi)
+{
+	inno_hdmi_sys_power(hdmi, false);
+
+	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, 0x00);
+	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, 0x00);
+	hdmi_writeb(hdmi, HDMI_PHY_CHG_PWR, 0x00);
+	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
+};
+
+static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
+			       unsigned long mpixelclock)
+{
+	struct inno_hdmi_phy_config *phy_config;
+	int ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
+
+	if (ret < 0) {
+		phy_config = hdmi->plat_data->default_phy_config;
+		DRM_DEV_ERROR(hdmi->dev,
+			      "Using default phy configuration for TMDS rate %lu",
+			      mpixelclock);
+	} else {
+		phy_config = &hdmi->plat_data->phy_configs[ret];
+	}
+
+	inno_hdmi_sys_power(hdmi, false);
+
+	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, phy_config->pre_emphasis);
+	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, phy_config->voltage_level_control);
+	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
+	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x14);
+	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x10);
+	hdmi_writeb(hdmi, HDMI_PHY_CHG_PWR, 0x0f);
+	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x00);
+	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x01);
+
+	inno_hdmi_sys_power(hdmi, true);
+};
+
+static void inno_hdmi_reset(struct inno_hdmi *hdmi)
+{
+	u32 val;
+	u32 msk;
+
+	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_RST_DIGITAL, v_NOT_RST_DIGITAL);
+	udelay(100);
+
+	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_RST_ANALOG, v_NOT_RST_ANALOG);
+	udelay(100);
+
+	msk = m_REG_CLK_INV | m_REG_CLK_SOURCE | m_POWER | m_INT_POL;
+	val = v_REG_CLK_INV | v_REG_CLK_SOURCE_SYS | v_PWR_ON | v_INT_POL_HIGH;
+	hdmi_modb(hdmi, HDMI_SYS_CTRL, msk, val);
+
+	inno_hdmi_standby(hdmi);
+}
+
+static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
+{
+	struct drm_connector *connector = &hdmi->connector;
+	struct drm_connector_state *conn_state = connector->state;
+	struct inno_hdmi_connector_state *inno_conn_state =
+					to_inno_hdmi_conn_state(conn_state);
+	int c0_c2_change = 0;
+	int csc_enable = 0;
+	int csc_mode = 0;
+	int auto_csc = 0;
+	int value;
+	int i;
+
+	/* Input video mode is SDR RGB24bit, data enable signal from external */
+	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL1, v_DE_EXTERNAL |
+		    v_VIDEO_INPUT_FORMAT(VIDEO_INPUT_SDR_RGB444));
+
+	/* Input color hardcode to RGB, and output color hardcode to RGB888 */
+	value = v_VIDEO_INPUT_BITS(VIDEO_INPUT_8BITS) |
+		v_VIDEO_OUTPUT_COLOR(0) |
+		v_VIDEO_INPUT_CSP(0);
+	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL2, value);
+
+	if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_RGB) {
+		if (inno_conn_state->rgb_limited_range) {
+			csc_mode = CSC_RGB_0_255_TO_RGB_16_235_8BIT;
+			auto_csc = AUTO_CSC_DISABLE;
+			c0_c2_change = C0_C2_CHANGE_DISABLE;
+			csc_enable = v_CSC_ENABLE;
+
+		} else {
+			value = v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
+			hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
+
+			hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
+				  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
+				  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
+				  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
+			return 0;
+		}
+	} else {
+		if (inno_conn_state->colorimetry == HDMI_COLORIMETRY_ITU_601) {
+			if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV444) {
+				csc_mode = CSC_RGB_0_255_TO_ITU601_16_235_8BIT;
+				auto_csc = AUTO_CSC_DISABLE;
+				c0_c2_change = C0_C2_CHANGE_DISABLE;
+				csc_enable = v_CSC_ENABLE;
+			}
+		} else {
+			if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV444) {
+				csc_mode = CSC_RGB_0_255_TO_ITU709_16_235_8BIT;
+				auto_csc = AUTO_CSC_DISABLE;
+				c0_c2_change = C0_C2_CHANGE_DISABLE;
+				csc_enable = v_CSC_ENABLE;
+			}
+		}
+	}
+
+	for (i = 0; i < 24; i++)
+		hdmi_writeb(hdmi, HDMI_VIDEO_CSC_COEF + i,
+			    coeff_csc[csc_mode][i]);
+
+	value = v_SOF_DISABLE | csc_enable | v_COLOR_DEPTH_NOT_INDICATED(1);
+	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
+	hdmi_modb(hdmi, HDMI_VIDEO_CONTRL, m_VIDEO_AUTO_CSC |
+		  m_VIDEO_C0_C2_SWAP, v_VIDEO_AUTO_CSC(auto_csc) |
+		  v_VIDEO_C0_C2_SWAP(c0_c2_change));
+
+	return 0;
+}
+
+static int inno_hdmi_setup(struct inno_hdmi *hdmi,
+			   struct drm_display_mode *mode)
+{
+	struct drm_display_info *display = &hdmi->connector.display_info;
+	unsigned long mpixelclock = mode->clock * 1000;
+
+	/* Mute video and audio output */
+	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
+		  v_AUDIO_MUTE(1) | v_VIDEO_MUTE(1));
+
+	/* Set HDMI Mode */
+	hdmi_writeb(hdmi, HDMI_HDCP_CTRL,
+		    v_HDMI_DVI(display->is_hdmi));
+
+	inno_hdmi_config_video_timing(hdmi, mode);
+
+	inno_hdmi_config_video_csc(hdmi);
+
+	if (display->is_hdmi)
+		inno_hdmi_config_video_avi(hdmi, mode);
+
+	/*
+	 * When IP controller have configured to an accurate video
+	 * timing, then the TMDS clock source would be switched to
+	 * DCLK_LCDC, so we need to init the TMDS rate to mode pixel
+	 * clock rate, and reconfigure the DDC clock.
+	 */
+	inno_hdmi_i2c_init(hdmi, mpixelclock);
+
+	/* Unmute video and audio output */
+	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
+		  v_AUDIO_MUTE(0) | v_VIDEO_MUTE(0));
+
+	inno_hdmi_power_up(hdmi, mpixelclock);
+
+	return 0;
+}
+
+static enum drm_mode_status rk_inno_hdmi_connector_mode_valid(struct drm_connector *connector,
+							      struct drm_display_mode *mode)
+{
+	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+	struct rk_inno_hdmi *rk_hdmi = dev_get_drvdata(hdmi->dev);
+
+	unsigned long mpixelclk, max_tolerance;
+	long rounded_refclk;
+
+	/* No support for double-clock modes */
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		return MODE_BAD;
+
+	mpixelclk = mode->clock * 1000;
+
+	if (mpixelclk < INNO_HDMI_MIN_TMDS_CLOCK)
+		return MODE_CLOCK_LOW;
+
+	if (inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
+		return MODE_CLOCK_HIGH;
+
+	if (rk_hdmi->refclk) {
+		rounded_refclk = clk_round_rate(rk_hdmi->refclk, mpixelclk);
+		if (rounded_refclk < 0)
+			return MODE_BAD;
+
+		/* Vesa DMT standard mentions +/- 0.5% max tolerance */
+		max_tolerance = mpixelclk / 200;
+		if (abs_diff((unsigned long)rounded_refclk, mpixelclk) > max_tolerance)
+			return MODE_NOCLOCK;
+	}
+
+	return MODE_OK;
+}
+
+static void rk_inno_hdmi_encoder_enable(struct drm_encoder *encoder,
+					struct drm_atomic_state *state)
+{
+	struct inno_hdmi *hdmi = rk_encoder_to_inno_hdmi(encoder);
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+
+	conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
+	inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
+}
+
+static void rk_inno_hdmi_encoder_disable(struct drm_encoder *encoder,
+					 struct drm_atomic_state *state)
+{
+	struct inno_hdmi *hdmi = rk_encoder_to_inno_hdmi(encoder);
+
+	inno_hdmi_standby(hdmi);
+}
+
+static int
+rk_inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state)
+{
+	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	u8 vic = drm_match_cea_mode(mode);
+	struct inno_hdmi_connector_state *inno_conn_state =
+				   to_inno_hdmi_conn_state(conn_state);
+
+	s->output_mode = ROCKCHIP_OUT_MODE_P888;
+	s->output_type = DRM_MODE_CONNECTOR_HDMIA;
+
+	if (vic == 6 || vic == 7 ||
+	    vic == 21 || vic == 22 ||
+	    vic == 2 || vic == 3 ||
+	    vic == 17 || vic == 18)
+		inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_601;
+	else
+		inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
+
+	inno_conn_state->enc_out_format = HDMI_COLORSPACE_RGB;
+	inno_conn_state->rgb_limited_range =
+	   drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED;
+
+	return  rk_inno_hdmi_connector_mode_valid(conn_state->connector,
+			   &crtc_state->adjusted_mode) == MODE_OK ? 0 : -EINVAL;
+}
+
+static const struct drm_encoder_helper_funcs rk_inno_encoder_helper_funcs = {
+	.atomic_check   = rk_inno_hdmi_encoder_atomic_check,
+	.atomic_enable  = rk_inno_hdmi_encoder_enable,
+	.atomic_disable = rk_inno_hdmi_encoder_disable,
+};
+
+static int rk_inno_hdmi_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct drm_device *drm = data;
+	struct inno_hdmi *hdmi;
+	int ret;
+	struct rk_inno_hdmi *rk_hdmi;
+
+	rk_hdmi = devm_kzalloc(dev, sizeof(*rk_hdmi), GFP_KERNEL);
+	if (!rk_hdmi)
+		return -ENOMEM;
+	hdmi = &rk_hdmi->inno_hdmi;
+
+	hdmi->dev = dev;
+	hdmi->plat_data = (struct inno_hdmi_plat_data *)of_device_get_match_data(dev);
+
+	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hdmi->regs))
+		return PTR_ERR(hdmi->regs);
+
+	rk_hdmi->pclk = devm_clk_get(hdmi->dev, "pclk");
+	if (IS_ERR(rk_hdmi->pclk)) {
+		DRM_DEV_ERROR(hdmi->dev, "Unable to get HDMI pclk clk\n");
+		return PTR_ERR(rk_hdmi->pclk);
+	}
+
+	ret = clk_prepare_enable(rk_hdmi->pclk);
+	if (ret) {
+		DRM_DEV_ERROR(hdmi->dev,
+			      "Cannot enable HDMI pclk clock: %d\n", ret);
+		return ret;
+	}
+
+	rk_hdmi->refclk = devm_clk_get_optional(hdmi->dev, "ref");
+	if (IS_ERR(rk_hdmi->refclk)) {
+		DRM_DEV_ERROR(hdmi->dev, "Unable to get HDMI reference clock\n");
+		ret = PTR_ERR(rk_hdmi->refclk);
+		goto err_disable_pclk;
+	}
+
+	ret = clk_prepare_enable(rk_hdmi->refclk);
+	if (ret) {
+		DRM_DEV_ERROR(hdmi->dev,
+			      "Cannot enable HDMI reference clock: %d\n", ret);
+		goto err_disable_pclk;
+	}
+
+	inno_hdmi_reset(hdmi);
+	/*
+	 * When the controller isn't configured to an accurate
+	 * video timing and there is no reference clock available,
+	 * then the TMDS clock source would be switched to PCLK_HDMI,
+	 * so we need to init the TMDS rate to PCLK rate, and
+	 * reconfigure the DDC clock.
+	 */
+	if (rk_hdmi->refclk)
+		inno_hdmi_i2c_init(hdmi, clk_get_rate(rk_hdmi->refclk));
+	else
+		inno_hdmi_i2c_init(hdmi, clk_get_rate(rk_hdmi->pclk));
+
+	ret = inno_hdmi_bind(drm, hdmi, &rk_hdmi->encoder.encoder);
+	if (ret)
+		goto err_cleanup_hdmi;
+
+	dev_set_drvdata(dev, rk_hdmi);
+
+	return 0;
+
+err_cleanup_hdmi:
+	rk_hdmi->encoder.encoder.funcs->destroy(&rk_hdmi->encoder.encoder);
+	clk_disable_unprepare(rk_hdmi->refclk);
+err_disable_pclk:
+	clk_disable_unprepare(rk_hdmi->pclk);
+	return ret;
+}
+
+static void rk_inno_hdmi_unbind(struct device *dev, struct device *master, void *data)
+{
+	struct rk_inno_hdmi *rk_hdmi = dev_get_drvdata(dev);
+	struct inno_hdmi *hdmi = &rk_hdmi->inno_hdmi;
+
+	rk_hdmi->encoder.encoder.funcs->destroy(&rk_hdmi->encoder.encoder);
+	i2c_put_adapter(hdmi->ddc);
+	clk_disable_unprepare(rk_hdmi->refclk);
+	clk_disable_unprepare(rk_hdmi->pclk);
+}
+
+static const struct component_ops inno_hdmi_ops = {
+	.bind	= rk_inno_hdmi_bind,
+	.unbind	= rk_inno_hdmi_unbind,
+};
+
+static int inno_hdmi_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &inno_hdmi_ops);
+}
+
+static void inno_hdmi_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &inno_hdmi_ops);
+}
+
+static const struct inno_hdmi_plat_data rk3036_inno_info = {
+	.soc_type = RK3036_HDMI,
+	.mode_valid = rk_inno_hdmi_connector_mode_valid,
+	.helper_private = &rk_inno_encoder_helper_funcs,
+	.phy_configs = rk3036_hdmi_phy_configs,
+	.default_phy_config = &rk3036_hdmi_phy_configs[1],
+};
+
+static const struct inno_hdmi_plat_data rk3128_inno_info = {
+	.soc_type = RK3128_HDMI,
+	.mode_valid = rk_inno_hdmi_connector_mode_valid,
+	.helper_private = &rk_inno_encoder_helper_funcs,
+	.phy_configs = rk3128_hdmi_phy_configs,
+	.default_phy_config = &rk3128_hdmi_phy_configs[1],
+};
+
+static const struct of_device_id inno_hdmi_dt_ids[] = {
+	{ .compatible = "rockchip,rk3036-inno-hdmi",
+	  .data = &rk3036_inno_info,
+	},
+	{ .compatible = "rockchip,rk3128-inno-hdmi",
+	  .data = &rk3128_inno_info,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, inno_hdmi_dt_ids);
+
+struct platform_driver inno_hdmi_driver = {
+	.probe  = inno_hdmi_probe,
+	.remove_new = inno_hdmi_remove,
+	.driver = {
+		.name = "innohdmi-rockchip",
+		.of_match_table = inno_hdmi_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.h b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.h
similarity index 85%
rename from drivers/gpu/drm/rockchip/inno_hdmi.h
rename to drivers/gpu/drm/rockchip/inno_hdmi-rockchip.h
index a7edf3559e60..c90458d75378 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.h
+++ b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.h
@@ -8,12 +8,6 @@
 #ifndef __INNO_HDMI_H__
 #define __INNO_HDMI_H__
 
-#define DDC_SEGMENT_ADDR		0x30
-
-#define HDMI_SCL_RATE			(100*1000)
-#define DDC_BUS_FREQ_L			0x4b
-#define DDC_BUS_FREQ_H			0x4c
-
 #define HDMI_SYS_CTRL			0x00
 #define m_RST_ANALOG			(1 << 6)
 #define v_RST_ANALOG			(0 << 6)
@@ -98,26 +92,6 @@ enum {
 #define v_AUDIO_MUTE(n)			(n << 1)
 #define v_VIDEO_MUTE(n)			(n << 0)
 
-#define HDMI_VIDEO_TIMING_CTL		0x08
-#define v_HSYNC_POLARITY(n)		(n << 3)
-#define v_VSYNC_POLARITY(n)		(n << 2)
-#define v_INETLACE(n)			(n << 1)
-#define v_EXTERANL_VIDEO(n)		(n << 0)
-
-#define HDMI_VIDEO_EXT_HTOTAL_L		0x09
-#define HDMI_VIDEO_EXT_HTOTAL_H		0x0a
-#define HDMI_VIDEO_EXT_HBLANK_L		0x0b
-#define HDMI_VIDEO_EXT_HBLANK_H		0x0c
-#define HDMI_VIDEO_EXT_HDELAY_L		0x0d
-#define HDMI_VIDEO_EXT_HDELAY_H		0x0e
-#define HDMI_VIDEO_EXT_HDURATION_L	0x0f
-#define HDMI_VIDEO_EXT_HDURATION_H	0x10
-#define HDMI_VIDEO_EXT_VTOTAL_L		0x11
-#define HDMI_VIDEO_EXT_VTOTAL_H		0x12
-#define HDMI_VIDEO_EXT_VBLANK		0x13
-#define HDMI_VIDEO_EXT_VDELAY		0x14
-#define HDMI_VIDEO_EXT_VDURATION	0x15
-
 #define HDMI_VIDEO_CSC_COEF		0x18
 
 #define HDMI_AUDIO_CTRL1		0x35
@@ -202,14 +176,6 @@ enum {
 #define HDMI_AUDIO_CTS_M		0x46
 #define HDMI_AUDIO_CTS_L		0x47
 
-#define HDMI_DDC_CLK_L			0x4b
-#define HDMI_DDC_CLK_H			0x4c
-
-#define HDMI_EDID_SEGMENT_POINTER	0x4d
-#define HDMI_EDID_WORD_ADDR		0x4e
-#define HDMI_EDID_FIFO_OFFSET		0x4f
-#define HDMI_EDID_FIFO_ADDR		0x50
-
 #define HDMI_PACKET_SEND_MANUAL		0x9c
 #define HDMI_PACKET_SEND_AUTO		0x9d
 #define m_PACKET_GCP_EN			(1 << 7)
@@ -254,23 +220,12 @@ enum {
 #define m_HDMI_DVI			(1 << 1)
 #define v_HDMI_DVI(n)			(n << 1)
 
-#define HDMI_INTERRUPT_MASK1		0xc0
-#define HDMI_INTERRUPT_STATUS1		0xc1
-#define	m_INT_ACTIVE_VSYNC		(1 << 5)
-#define m_INT_EDID_READY		(1 << 2)
-
 #define HDMI_INTERRUPT_MASK2		0xc2
 #define HDMI_INTERRUPT_STATUS2		0xc3
 #define m_INT_HDCP_ERR			(1 << 7)
 #define m_INT_BKSV_FLAG			(1 << 6)
 #define m_INT_HDCP_OK			(1 << 4)
 
-#define HDMI_STATUS			0xc8
-#define m_HOTPLUG			(1 << 7)
-#define m_MASK_INT_HOTPLUG		(1 << 5)
-#define m_INT_HOTPLUG			(1 << 1)
-#define v_MASK_INT_HOTPLUG(n)		((n & 0x1) << 5)
-
 #define HDMI_COLORBAR                   0xc9
 
 #define HDMI_PHY_SYNC			0xce
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
deleted file mode 100644
index 3df2cfcf9998..000000000000
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ /dev/null
@@ -1,1073 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
- *    Zheng Yang <zhengyang@rock-chips.com>
- *    Yakir Yang <ykk@rock-chips.com>
- */
-
-#include <linux/irq.h>
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/err.h>
-#include <linux/hdmi.h>
-#include <linux/mod_devicetable.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/platform_device.h>
-
-#include <drm/drm_atomic.h>
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_edid.h>
-#include <drm/drm_of.h>
-#include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
-
-#include "rockchip_drm_drv.h"
-
-#include "inno_hdmi.h"
-
-#define INNO_HDMI_MIN_TMDS_CLOCK  25000000U
-
-struct inno_hdmi_phy_config {
-	unsigned long pixelclock;
-	u8 pre_emphasis;
-	u8 voltage_level_control;
-};
-
-struct inno_hdmi_variant {
-	struct inno_hdmi_phy_config *phy_configs;
-	struct inno_hdmi_phy_config *default_phy_config;
-};
-
-struct inno_hdmi_i2c {
-	struct i2c_adapter adap;
-
-	u8 ddc_addr;
-	u8 segment_addr;
-
-	struct mutex lock;
-	struct completion cmp;
-};
-
-struct inno_hdmi {
-	struct device *dev;
-
-	struct clk *pclk;
-	struct clk *refclk;
-	void __iomem *regs;
-
-	struct drm_connector	connector;
-	struct rockchip_encoder	encoder;
-
-	struct inno_hdmi_i2c *i2c;
-	struct i2c_adapter *ddc;
-
-	const struct inno_hdmi_variant *variant;
-};
-
-struct inno_hdmi_connector_state {
-	struct drm_connector_state	base;
-	unsigned int			enc_out_format;
-	unsigned int			colorimetry;
-	bool				rgb_limited_range;
-};
-
-static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
-{
-	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
-
-	return container_of(rkencoder, struct inno_hdmi, encoder);
-}
-
-static struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
-{
-	return container_of(connector, struct inno_hdmi, connector);
-}
-
-#define to_inno_hdmi_conn_state(conn_state) \
-	container_of_const(conn_state, struct inno_hdmi_connector_state, base)
-
-enum {
-	CSC_RGB_0_255_TO_ITU601_16_235_8BIT,
-	CSC_RGB_0_255_TO_ITU709_16_235_8BIT,
-	CSC_RGB_0_255_TO_RGB_16_235_8BIT,
-};
-
-static const char coeff_csc[][24] = {
-	/*
-	 * RGB2YUV:601 SD mode:
-	 *   Cb = -0.291G - 0.148R + 0.439B + 128
-	 *   Y  = 0.504G  + 0.257R + 0.098B + 16
-	 *   Cr = -0.368G + 0.439R - 0.071B + 128
-	 */
-	{
-		0x11, 0x5f, 0x01, 0x82, 0x10, 0x23, 0x00, 0x80,
-		0x02, 0x1c, 0x00, 0xa1, 0x00, 0x36, 0x00, 0x1e,
-		0x11, 0x29, 0x10, 0x59, 0x01, 0x82, 0x00, 0x80
-	},
-	/*
-	 * RGB2YUV:709 HD mode:
-	 *   Cb = - 0.338G - 0.101R + 0.439B + 128
-	 *   Y  = 0.614G   + 0.183R + 0.062B + 16
-	 *   Cr = - 0.399G + 0.439R - 0.040B + 128
-	 */
-	{
-		0x11, 0x98, 0x01, 0xc1, 0x10, 0x28, 0x00, 0x80,
-		0x02, 0x74, 0x00, 0xbb, 0x00, 0x3f, 0x00, 0x10,
-		0x11, 0x5a, 0x10, 0x67, 0x01, 0xc1, 0x00, 0x80
-	},
-	/*
-	 * RGB[0:255]2RGB[16:235]:
-	 *   R' = R x (235-16)/255 + 16;
-	 *   G' = G x (235-16)/255 + 16;
-	 *   B' = B x (235-16)/255 + 16;
-	 */
-	{
-		0x00, 0x00, 0x03, 0x6F, 0x00, 0x00, 0x00, 0x10,
-		0x03, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10,
-		0x00, 0x00, 0x00, 0x00, 0x03, 0x6F, 0x00, 0x10
-	},
-};
-
-static struct inno_hdmi_phy_config rk3036_hdmi_phy_configs[] = {
-	{  74250000, 0x3f, 0xbb },
-	{ 165000000, 0x6f, 0xbb },
-	{      ~0UL, 0x00, 0x00 }
-};
-
-static struct inno_hdmi_phy_config rk3128_hdmi_phy_configs[] = {
-	{  74250000, 0x3f, 0xaa },
-	{ 165000000, 0x5f, 0xaa },
-	{      ~0UL, 0x00, 0x00 }
-};
-
-static int inno_hdmi_find_phy_config(struct inno_hdmi *hdmi,
-				     unsigned long pixelclk)
-{
-	const struct inno_hdmi_phy_config *phy_configs =
-						hdmi->variant->phy_configs;
-	int i;
-
-	for (i = 0; phy_configs[i].pixelclock != ~0UL; i++) {
-		if (pixelclk <= phy_configs[i].pixelclock)
-			return i;
-	}
-
-	DRM_DEV_DEBUG(hdmi->dev, "No phy configuration for pixelclock %lu\n",
-		      pixelclk);
-
-	return -EINVAL;
-}
-
-static inline u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
-{
-	return readl_relaxed(hdmi->regs + (offset) * 0x04);
-}
-
-static inline void hdmi_writeb(struct inno_hdmi *hdmi, u16 offset, u32 val)
-{
-	writel_relaxed(val, hdmi->regs + (offset) * 0x04);
-}
-
-static inline void hdmi_modb(struct inno_hdmi *hdmi, u16 offset,
-			     u32 msk, u32 val)
-{
-	u8 temp = hdmi_readb(hdmi, offset) & ~msk;
-
-	temp |= val & msk;
-	hdmi_writeb(hdmi, offset, temp);
-}
-
-static void inno_hdmi_i2c_init(struct inno_hdmi *hdmi, unsigned long long rate)
-{
-	unsigned long long ddc_bus_freq = rate >> 2;
-
-	do_div(ddc_bus_freq, HDMI_SCL_RATE);
-
-	hdmi_writeb(hdmi, DDC_BUS_FREQ_L, ddc_bus_freq & 0xFF);
-	hdmi_writeb(hdmi, DDC_BUS_FREQ_H, (ddc_bus_freq >> 8) & 0xFF);
-
-	/* Clear the EDID interrupt flag and mute the interrupt */
-	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, 0);
-	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);
-}
-
-static void inno_hdmi_sys_power(struct inno_hdmi *hdmi, bool enable)
-{
-	if (enable)
-		hdmi_modb(hdmi, HDMI_SYS_CTRL, m_POWER, v_PWR_ON);
-	else
-		hdmi_modb(hdmi, HDMI_SYS_CTRL, m_POWER, v_PWR_OFF);
-}
-
-static void inno_hdmi_standby(struct inno_hdmi *hdmi)
-{
-	inno_hdmi_sys_power(hdmi, false);
-
-	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, 0x00);
-	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, 0x00);
-	hdmi_writeb(hdmi, HDMI_PHY_CHG_PWR, 0x00);
-	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
-};
-
-static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
-			       unsigned long mpixelclock)
-{
-	struct inno_hdmi_phy_config *phy_config;
-	int ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
-
-	if (ret < 0) {
-		phy_config = hdmi->variant->default_phy_config;
-		DRM_DEV_ERROR(hdmi->dev,
-			      "Using default phy configuration for TMDS rate %lu",
-			      mpixelclock);
-	} else {
-		phy_config = &hdmi->variant->phy_configs[ret];
-	}
-
-	inno_hdmi_sys_power(hdmi, false);
-
-	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, phy_config->pre_emphasis);
-	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, phy_config->voltage_level_control);
-	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
-	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x14);
-	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x10);
-	hdmi_writeb(hdmi, HDMI_PHY_CHG_PWR, 0x0f);
-	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x00);
-	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x01);
-
-	inno_hdmi_sys_power(hdmi, true);
-};
-
-static void inno_hdmi_reset(struct inno_hdmi *hdmi)
-{
-	u32 val;
-	u32 msk;
-
-	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_RST_DIGITAL, v_NOT_RST_DIGITAL);
-	udelay(100);
-
-	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_RST_ANALOG, v_NOT_RST_ANALOG);
-	udelay(100);
-
-	msk = m_REG_CLK_INV | m_REG_CLK_SOURCE | m_POWER | m_INT_POL;
-	val = v_REG_CLK_INV | v_REG_CLK_SOURCE_SYS | v_PWR_ON | v_INT_POL_HIGH;
-	hdmi_modb(hdmi, HDMI_SYS_CTRL, msk, val);
-
-	inno_hdmi_standby(hdmi);
-}
-
-static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
-				    enum hdmi_infoframe_type type)
-{
-	struct drm_connector *connector = &hdmi->connector;
-
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return;
-	}
-
-	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
-}
-
-static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
-				  union hdmi_infoframe *frame, enum hdmi_infoframe_type type)
-{
-	struct drm_connector *connector = &hdmi->connector;
-	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
-	ssize_t rc, i;
-
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
-
-	inno_hdmi_disable_frame(hdmi, type);
-
-	rc = hdmi_infoframe_pack(frame, packed_frame,
-				 sizeof(packed_frame));
-	if (rc < 0)
-		return rc;
-
-	for (i = 0; i < rc; i++)
-		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
-			    packed_frame[i]);
-
-	return 0;
-}
-
-static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
-				      struct drm_display_mode *mode)
-{
-	struct drm_connector *connector = &hdmi->connector;
-	struct drm_connector_state *conn_state = connector->state;
-	struct inno_hdmi_connector_state *inno_conn_state =
-					to_inno_hdmi_conn_state(conn_state);
-	union hdmi_infoframe frame;
-	int rc;
-
-	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
-						      &hdmi->connector,
-						      mode);
-	if (rc) {
-		inno_hdmi_disable_frame(hdmi, HDMI_INFOFRAME_TYPE_AVI);
-		return rc;
-	}
-
-	if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV444)
-		frame.avi.colorspace = HDMI_COLORSPACE_YUV444;
-	else if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV422)
-		frame.avi.colorspace = HDMI_COLORSPACE_YUV422;
-	else
-		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
-
-	if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_RGB) {
-		drm_hdmi_avi_infoframe_quant_range(&frame.avi,
-						   connector, mode,
-						   inno_conn_state->rgb_limited_range ?
-						   HDMI_QUANTIZATION_RANGE_LIMITED :
-						   HDMI_QUANTIZATION_RANGE_FULL);
-	} else {
-		frame.avi.quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
-		frame.avi.ycc_quantization_range =
-			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
-	}
-
-	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_AVI);
-}
-
-static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
-{
-	struct drm_connector *connector = &hdmi->connector;
-	struct drm_connector_state *conn_state = connector->state;
-	struct inno_hdmi_connector_state *inno_conn_state =
-					to_inno_hdmi_conn_state(conn_state);
-	int c0_c2_change = 0;
-	int csc_enable = 0;
-	int csc_mode = 0;
-	int auto_csc = 0;
-	int value;
-	int i;
-
-	/* Input video mode is SDR RGB24bit, data enable signal from external */
-	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL1, v_DE_EXTERNAL |
-		    v_VIDEO_INPUT_FORMAT(VIDEO_INPUT_SDR_RGB444));
-
-	/* Input color hardcode to RGB, and output color hardcode to RGB888 */
-	value = v_VIDEO_INPUT_BITS(VIDEO_INPUT_8BITS) |
-		v_VIDEO_OUTPUT_COLOR(0) |
-		v_VIDEO_INPUT_CSP(0);
-	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL2, value);
-
-	if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_RGB) {
-		if (inno_conn_state->rgb_limited_range) {
-			csc_mode = CSC_RGB_0_255_TO_RGB_16_235_8BIT;
-			auto_csc = AUTO_CSC_DISABLE;
-			c0_c2_change = C0_C2_CHANGE_DISABLE;
-			csc_enable = v_CSC_ENABLE;
-
-		} else {
-			value = v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
-			hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
-
-			hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
-				  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
-				  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
-				  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
-			return 0;
-		}
-	} else {
-		if (inno_conn_state->colorimetry == HDMI_COLORIMETRY_ITU_601) {
-			if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV444) {
-				csc_mode = CSC_RGB_0_255_TO_ITU601_16_235_8BIT;
-				auto_csc = AUTO_CSC_DISABLE;
-				c0_c2_change = C0_C2_CHANGE_DISABLE;
-				csc_enable = v_CSC_ENABLE;
-			}
-		} else {
-			if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV444) {
-				csc_mode = CSC_RGB_0_255_TO_ITU709_16_235_8BIT;
-				auto_csc = AUTO_CSC_DISABLE;
-				c0_c2_change = C0_C2_CHANGE_DISABLE;
-				csc_enable = v_CSC_ENABLE;
-			}
-		}
-	}
-
-	for (i = 0; i < 24; i++)
-		hdmi_writeb(hdmi, HDMI_VIDEO_CSC_COEF + i,
-			    coeff_csc[csc_mode][i]);
-
-	value = v_SOF_DISABLE | csc_enable | v_COLOR_DEPTH_NOT_INDICATED(1);
-	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
-	hdmi_modb(hdmi, HDMI_VIDEO_CONTRL, m_VIDEO_AUTO_CSC |
-		  m_VIDEO_C0_C2_SWAP, v_VIDEO_AUTO_CSC(auto_csc) |
-		  v_VIDEO_C0_C2_SWAP(c0_c2_change));
-
-	return 0;
-}
-
-static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
-					 struct drm_display_mode *mode)
-{
-	int value;
-
-	/* Set detail external video timing polarity and interlace mode */
-	value = v_EXTERANL_VIDEO(1);
-	value |= mode->flags & DRM_MODE_FLAG_PHSYNC ?
-		 v_HSYNC_POLARITY(1) : v_HSYNC_POLARITY(0);
-	value |= mode->flags & DRM_MODE_FLAG_PVSYNC ?
-		 v_VSYNC_POLARITY(1) : v_VSYNC_POLARITY(0);
-	value |= mode->flags & DRM_MODE_FLAG_INTERLACE ?
-		 v_INETLACE(1) : v_INETLACE(0);
-	hdmi_writeb(hdmi, HDMI_VIDEO_TIMING_CTL, value);
-
-	/* Set detail external video timing */
-	value = mode->htotal;
-	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HTOTAL_L, value & 0xFF);
-	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HTOTAL_H, (value >> 8) & 0xFF);
-
-	value = mode->htotal - mode->hdisplay;
-	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HBLANK_L, value & 0xFF);
-	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HBLANK_H, (value >> 8) & 0xFF);
-
-	value = mode->htotal - mode->hsync_start;
-	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDELAY_L, value & 0xFF);
-	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDELAY_H, (value >> 8) & 0xFF);
-
-	value = mode->hsync_end - mode->hsync_start;
-	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDURATION_L, value & 0xFF);
-	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDURATION_H, (value >> 8) & 0xFF);
-
-	value = mode->vtotal;
-	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VTOTAL_L, value & 0xFF);
-	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VTOTAL_H, (value >> 8) & 0xFF);
-
-	value = mode->vtotal - mode->vdisplay;
-	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VBLANK, value & 0xFF);
-
-	value = mode->vtotal - mode->vsync_start;
-	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VDELAY, value & 0xFF);
-
-	value = mode->vsync_end - mode->vsync_start;
-	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VDURATION, value & 0xFF);
-
-	hdmi_writeb(hdmi, HDMI_PHY_PRE_DIV_RATIO, 0x1e);
-	hdmi_writeb(hdmi, HDMI_PHY_FEEDBACK_DIV_RATIO_LOW, 0x2c);
-	hdmi_writeb(hdmi, HDMI_PHY_FEEDBACK_DIV_RATIO_HIGH, 0x01);
-
-	return 0;
-}
-
-static int inno_hdmi_setup(struct inno_hdmi *hdmi,
-			   struct drm_display_mode *mode)
-{
-	struct drm_display_info *display = &hdmi->connector.display_info;
-	unsigned long mpixelclock = mode->clock * 1000;
-
-	/* Mute video and audio output */
-	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
-		  v_AUDIO_MUTE(1) | v_VIDEO_MUTE(1));
-
-	/* Set HDMI Mode */
-	hdmi_writeb(hdmi, HDMI_HDCP_CTRL,
-		    v_HDMI_DVI(display->is_hdmi));
-
-	inno_hdmi_config_video_timing(hdmi, mode);
-
-	inno_hdmi_config_video_csc(hdmi);
-
-	if (display->is_hdmi)
-		inno_hdmi_config_video_avi(hdmi, mode);
-
-	/*
-	 * When IP controller have configured to an accurate video
-	 * timing, then the TMDS clock source would be switched to
-	 * DCLK_LCDC, so we need to init the TMDS rate to mode pixel
-	 * clock rate, and reconfigure the DDC clock.
-	 */
-	inno_hdmi_i2c_init(hdmi, mpixelclock);
-
-	/* Unmute video and audio output */
-	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
-		  v_AUDIO_MUTE(0) | v_VIDEO_MUTE(0));
-
-	inno_hdmi_power_up(hdmi, mpixelclock);
-
-	return 0;
-}
-
-static enum drm_mode_status inno_hdmi_display_mode_valid(struct inno_hdmi *hdmi,
-							 struct drm_display_mode *mode)
-{
-	unsigned long mpixelclk, max_tolerance;
-	long rounded_refclk;
-
-	/* No support for double-clock modes */
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		return MODE_BAD;
-
-	mpixelclk = mode->clock * 1000;
-
-	if (mpixelclk < INNO_HDMI_MIN_TMDS_CLOCK)
-		return MODE_CLOCK_LOW;
-
-	if (inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
-		return MODE_CLOCK_HIGH;
-
-	if (hdmi->refclk) {
-		rounded_refclk = clk_round_rate(hdmi->refclk, mpixelclk);
-		if (rounded_refclk < 0)
-			return MODE_BAD;
-
-		/* Vesa DMT standard mentions +/- 0.5% max tolerance */
-		max_tolerance = mpixelclk / 200;
-		if (abs_diff((unsigned long)rounded_refclk, mpixelclk) > max_tolerance)
-			return MODE_NOCLOCK;
-	}
-
-	return MODE_OK;
-}
-
-static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
-				     struct drm_atomic_state *state)
-{
-	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
-	struct drm_connector_state *conn_state;
-	struct drm_crtc_state *crtc_state;
-
-	conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
-	if (WARN_ON(!conn_state))
-		return;
-
-	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
-	if (WARN_ON(!crtc_state))
-		return;
-
-	inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
-}
-
-static void inno_hdmi_encoder_disable(struct drm_encoder *encoder,
-				      struct drm_atomic_state *state)
-{
-	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
-
-	inno_hdmi_standby(hdmi);
-}
-
-static int
-inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
-			       struct drm_crtc_state *crtc_state,
-			       struct drm_connector_state *conn_state)
-{
-	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
-	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
-	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	u8 vic = drm_match_cea_mode(mode);
-	struct inno_hdmi_connector_state *inno_conn_state =
-					to_inno_hdmi_conn_state(conn_state);
-
-	s->output_mode = ROCKCHIP_OUT_MODE_P888;
-	s->output_type = DRM_MODE_CONNECTOR_HDMIA;
-
-	if (vic == 6 || vic == 7 ||
-	    vic == 21 || vic == 22 ||
-	    vic == 2 || vic == 3 ||
-	    vic == 17 || vic == 18)
-		inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_601;
-	else
-		inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
-
-	inno_conn_state->enc_out_format = HDMI_COLORSPACE_RGB;
-	inno_conn_state->rgb_limited_range =
-		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED;
-
-	return  inno_hdmi_display_mode_valid(hdmi,
-				&crtc_state->adjusted_mode) == MODE_OK ? 0 : -EINVAL;
-}
-
-static struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
-	.atomic_check	= inno_hdmi_encoder_atomic_check,
-	.atomic_enable	= inno_hdmi_encoder_enable,
-	.atomic_disable	= inno_hdmi_encoder_disable,
-};
-
-static enum drm_connector_status
-inno_hdmi_connector_detect(struct drm_connector *connector, bool force)
-{
-	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
-
-	return (hdmi_readb(hdmi, HDMI_STATUS) & m_HOTPLUG) ?
-		connector_status_connected : connector_status_disconnected;
-}
-
-static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
-{
-	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
-	const struct drm_edid *drm_edid;
-	int ret = 0;
-
-	if (!hdmi->ddc)
-		return 0;
-
-	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
-	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
-
-	return ret;
-}
-
-static enum drm_mode_status
-inno_hdmi_connector_mode_valid(struct drm_connector *connector,
-			       struct drm_display_mode *mode)
-{
-	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
-
-	return  inno_hdmi_display_mode_valid(hdmi, mode);
-}
-
-static void inno_hdmi_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
-static void
-inno_hdmi_connector_destroy_state(struct drm_connector *connector,
-				  struct drm_connector_state *state)
-{
-	struct inno_hdmi_connector_state *inno_conn_state =
-						to_inno_hdmi_conn_state(state);
-
-	__drm_atomic_helper_connector_destroy_state(&inno_conn_state->base);
-	kfree(inno_conn_state);
-}
-
-static void inno_hdmi_connector_reset(struct drm_connector *connector)
-{
-	struct inno_hdmi_connector_state *inno_conn_state;
-
-	if (connector->state) {
-		inno_hdmi_connector_destroy_state(connector, connector->state);
-		connector->state = NULL;
-	}
-
-	inno_conn_state = kzalloc(sizeof(*inno_conn_state), GFP_KERNEL);
-	if (!inno_conn_state)
-		return;
-
-	__drm_atomic_helper_connector_reset(connector, &inno_conn_state->base);
-
-	inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
-	inno_conn_state->enc_out_format = HDMI_COLORSPACE_RGB;
-	inno_conn_state->rgb_limited_range = false;
-}
-
-static struct drm_connector_state *
-inno_hdmi_connector_duplicate_state(struct drm_connector *connector)
-{
-	struct inno_hdmi_connector_state *inno_conn_state;
-
-	if (WARN_ON(!connector->state))
-		return NULL;
-
-	inno_conn_state = kmemdup(to_inno_hdmi_conn_state(connector->state),
-				  sizeof(*inno_conn_state), GFP_KERNEL);
-
-	if (!inno_conn_state)
-		return NULL;
-
-	__drm_atomic_helper_connector_duplicate_state(connector,
-						      &inno_conn_state->base);
-
-	return &inno_conn_state->base;
-}
-
-static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = inno_hdmi_connector_detect,
-	.destroy = inno_hdmi_connector_destroy,
-	.reset = inno_hdmi_connector_reset,
-	.atomic_duplicate_state = inno_hdmi_connector_duplicate_state,
-	.atomic_destroy_state = inno_hdmi_connector_destroy_state,
-};
-
-static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
-	.get_modes = inno_hdmi_connector_get_modes,
-	.mode_valid = inno_hdmi_connector_mode_valid,
-};
-
-static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
-{
-	struct drm_encoder *encoder = &hdmi->encoder.encoder;
-	struct device *dev = hdmi->dev;
-
-	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
-
-	/*
-	 * If we failed to find the CRTC(s) which this encoder is
-	 * supposed to be connected to, it's because the CRTC has
-	 * not been registered yet.  Defer probing, and hope that
-	 * the required CRTC is added later.
-	 */
-	if (encoder->possible_crtcs == 0)
-		return -EPROBE_DEFER;
-
-	drm_encoder_helper_add(encoder, &inno_hdmi_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
-
-	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
-
-	drm_connector_helper_add(&hdmi->connector,
-				 &inno_hdmi_connector_helper_funcs);
-	drm_connector_init_with_ddc(drm, &hdmi->connector,
-				    &inno_hdmi_connector_funcs,
-				    DRM_MODE_CONNECTOR_HDMIA,
-				    hdmi->ddc);
-
-	drm_connector_attach_encoder(&hdmi->connector, encoder);
-
-	return 0;
-}
-
-static irqreturn_t inno_hdmi_i2c_irq(struct inno_hdmi *hdmi)
-{
-	struct inno_hdmi_i2c *i2c = hdmi->i2c;
-	u8 stat;
-
-	stat = hdmi_readb(hdmi, HDMI_INTERRUPT_STATUS1);
-	if (!(stat & m_INT_EDID_READY))
-		return IRQ_NONE;
-
-	/* Clear HDMI EDID interrupt flag */
-	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);
-
-	complete(&i2c->cmp);
-
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t inno_hdmi_hardirq(int irq, void *dev_id)
-{
-	struct inno_hdmi *hdmi = dev_id;
-	irqreturn_t ret = IRQ_NONE;
-	u8 interrupt;
-
-	if (hdmi->i2c)
-		ret = inno_hdmi_i2c_irq(hdmi);
-
-	interrupt = hdmi_readb(hdmi, HDMI_STATUS);
-	if (interrupt & m_INT_HOTPLUG) {
-		hdmi_modb(hdmi, HDMI_STATUS, m_INT_HOTPLUG, m_INT_HOTPLUG);
-		ret = IRQ_WAKE_THREAD;
-	}
-
-	return ret;
-}
-
-static irqreturn_t inno_hdmi_irq(int irq, void *dev_id)
-{
-	struct inno_hdmi *hdmi = dev_id;
-
-	drm_helper_hpd_irq_event(hdmi->connector.dev);
-
-	return IRQ_HANDLED;
-}
-
-static int inno_hdmi_i2c_read(struct inno_hdmi *hdmi, struct i2c_msg *msgs)
-{
-	int length = msgs->len;
-	u8 *buf = msgs->buf;
-	int ret;
-
-	ret = wait_for_completion_timeout(&hdmi->i2c->cmp, HZ / 10);
-	if (!ret)
-		return -EAGAIN;
-
-	while (length--)
-		*buf++ = hdmi_readb(hdmi, HDMI_EDID_FIFO_ADDR);
-
-	return 0;
-}
-
-static int inno_hdmi_i2c_write(struct inno_hdmi *hdmi, struct i2c_msg *msgs)
-{
-	/*
-	 * The DDC module only support read EDID message, so
-	 * we assume that each word write to this i2c adapter
-	 * should be the offset of EDID word address.
-	 */
-	if ((msgs->len != 1) ||
-	    ((msgs->addr != DDC_ADDR) && (msgs->addr != DDC_SEGMENT_ADDR)))
-		return -EINVAL;
-
-	reinit_completion(&hdmi->i2c->cmp);
-
-	if (msgs->addr == DDC_SEGMENT_ADDR)
-		hdmi->i2c->segment_addr = msgs->buf[0];
-	if (msgs->addr == DDC_ADDR)
-		hdmi->i2c->ddc_addr = msgs->buf[0];
-
-	/* Set edid fifo first addr */
-	hdmi_writeb(hdmi, HDMI_EDID_FIFO_OFFSET, 0x00);
-
-	/* Set edid word address 0x00/0x80 */
-	hdmi_writeb(hdmi, HDMI_EDID_WORD_ADDR, hdmi->i2c->ddc_addr);
-
-	/* Set edid segment pointer */
-	hdmi_writeb(hdmi, HDMI_EDID_SEGMENT_POINTER, hdmi->i2c->segment_addr);
-
-	return 0;
-}
-
-static int inno_hdmi_i2c_xfer(struct i2c_adapter *adap,
-			      struct i2c_msg *msgs, int num)
-{
-	struct inno_hdmi *hdmi = i2c_get_adapdata(adap);
-	struct inno_hdmi_i2c *i2c = hdmi->i2c;
-	int i, ret = 0;
-
-	mutex_lock(&i2c->lock);
-
-	/* Clear the EDID interrupt flag and unmute the interrupt */
-	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, m_INT_EDID_READY);
-	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);
-
-	for (i = 0; i < num; i++) {
-		DRM_DEV_DEBUG(hdmi->dev,
-			      "xfer: num: %d/%d, len: %d, flags: %#x\n",
-			      i + 1, num, msgs[i].len, msgs[i].flags);
-
-		if (msgs[i].flags & I2C_M_RD)
-			ret = inno_hdmi_i2c_read(hdmi, &msgs[i]);
-		else
-			ret = inno_hdmi_i2c_write(hdmi, &msgs[i]);
-
-		if (ret < 0)
-			break;
-	}
-
-	if (!ret)
-		ret = num;
-
-	/* Mute HDMI EDID interrupt */
-	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, 0);
-
-	mutex_unlock(&i2c->lock);
-
-	return ret;
-}
-
-static u32 inno_hdmi_i2c_func(struct i2c_adapter *adapter)
-{
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
-}
-
-static const struct i2c_algorithm inno_hdmi_algorithm = {
-	.master_xfer	= inno_hdmi_i2c_xfer,
-	.functionality	= inno_hdmi_i2c_func,
-};
-
-static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
-{
-	struct i2c_adapter *adap;
-	struct inno_hdmi_i2c *i2c;
-	int ret;
-
-	i2c = devm_kzalloc(hdmi->dev, sizeof(*i2c), GFP_KERNEL);
-	if (!i2c)
-		return ERR_PTR(-ENOMEM);
-
-	mutex_init(&i2c->lock);
-	init_completion(&i2c->cmp);
-
-	adap = &i2c->adap;
-	adap->owner = THIS_MODULE;
-	adap->dev.parent = hdmi->dev;
-	adap->dev.of_node = hdmi->dev->of_node;
-	adap->algo = &inno_hdmi_algorithm;
-	strscpy(adap->name, "Inno HDMI", sizeof(adap->name));
-	i2c_set_adapdata(adap, hdmi);
-
-	ret = i2c_add_adapter(adap);
-	if (ret) {
-		dev_warn(hdmi->dev, "cannot add %s I2C adapter\n", adap->name);
-		devm_kfree(hdmi->dev, i2c);
-		return ERR_PTR(ret);
-	}
-
-	hdmi->i2c = i2c;
-
-	DRM_DEV_INFO(hdmi->dev, "registered %s I2C bus driver\n", adap->name);
-
-	return adap;
-}
-
-static int inno_hdmi_bind(struct device *dev, struct device *master,
-				 void *data)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *drm = data;
-	struct inno_hdmi *hdmi;
-	const struct inno_hdmi_variant *variant;
-	int irq;
-	int ret;
-
-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
-
-	hdmi->dev = dev;
-
-	variant = of_device_get_match_data(hdmi->dev);
-	if (!variant)
-		return -EINVAL;
-
-	hdmi->variant = variant;
-
-	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(hdmi->regs))
-		return PTR_ERR(hdmi->regs);
-
-	hdmi->pclk = devm_clk_get(hdmi->dev, "pclk");
-	if (IS_ERR(hdmi->pclk)) {
-		DRM_DEV_ERROR(hdmi->dev, "Unable to get HDMI pclk clk\n");
-		return PTR_ERR(hdmi->pclk);
-	}
-
-	ret = clk_prepare_enable(hdmi->pclk);
-	if (ret) {
-		DRM_DEV_ERROR(hdmi->dev,
-			      "Cannot enable HDMI pclk clock: %d\n", ret);
-		return ret;
-	}
-
-	hdmi->refclk = devm_clk_get_optional(hdmi->dev, "ref");
-	if (IS_ERR(hdmi->refclk)) {
-		DRM_DEV_ERROR(hdmi->dev, "Unable to get HDMI reference clock\n");
-		ret = PTR_ERR(hdmi->refclk);
-		goto err_disable_pclk;
-	}
-
-	ret = clk_prepare_enable(hdmi->refclk);
-	if (ret) {
-		DRM_DEV_ERROR(hdmi->dev,
-			      "Cannot enable HDMI reference clock: %d\n", ret);
-		goto err_disable_pclk;
-	}
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto err_disable_clk;
-	}
-
-	inno_hdmi_reset(hdmi);
-
-	hdmi->ddc = inno_hdmi_i2c_adapter(hdmi);
-	if (IS_ERR(hdmi->ddc)) {
-		ret = PTR_ERR(hdmi->ddc);
-		hdmi->ddc = NULL;
-		goto err_disable_clk;
-	}
-
-	/*
-	 * When the controller isn't configured to an accurate
-	 * video timing and there is no reference clock available,
-	 * then the TMDS clock source would be switched to PCLK_HDMI,
-	 * so we need to init the TMDS rate to PCLK rate, and
-	 * reconfigure the DDC clock.
-	 */
-	if (hdmi->refclk)
-		inno_hdmi_i2c_init(hdmi, clk_get_rate(hdmi->refclk));
-	else
-		inno_hdmi_i2c_init(hdmi, clk_get_rate(hdmi->pclk));
-
-	ret = inno_hdmi_register(drm, hdmi);
-	if (ret)
-		goto err_put_adapter;
-
-	dev_set_drvdata(dev, hdmi);
-
-	/* Unmute hotplug interrupt */
-	hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_INT_HOTPLUG(1));
-
-	ret = devm_request_threaded_irq(dev, irq, inno_hdmi_hardirq,
-					inno_hdmi_irq, IRQF_SHARED,
-					dev_name(dev), hdmi);
-	if (ret < 0)
-		goto err_cleanup_hdmi;
-
-	return 0;
-err_cleanup_hdmi:
-	hdmi->connector.funcs->destroy(&hdmi->connector);
-	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-err_put_adapter:
-	i2c_put_adapter(hdmi->ddc);
-err_disable_clk:
-	clk_disable_unprepare(hdmi->refclk);
-err_disable_pclk:
-	clk_disable_unprepare(hdmi->pclk);
-	return ret;
-}
-
-static void inno_hdmi_unbind(struct device *dev, struct device *master,
-			     void *data)
-{
-	struct inno_hdmi *hdmi = dev_get_drvdata(dev);
-
-	hdmi->connector.funcs->destroy(&hdmi->connector);
-	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-
-	i2c_put_adapter(hdmi->ddc);
-	clk_disable_unprepare(hdmi->refclk);
-	clk_disable_unprepare(hdmi->pclk);
-}
-
-static const struct component_ops inno_hdmi_ops = {
-	.bind	= inno_hdmi_bind,
-	.unbind	= inno_hdmi_unbind,
-};
-
-static int inno_hdmi_probe(struct platform_device *pdev)
-{
-	return component_add(&pdev->dev, &inno_hdmi_ops);
-}
-
-static void inno_hdmi_remove(struct platform_device *pdev)
-{
-	component_del(&pdev->dev, &inno_hdmi_ops);
-}
-
-static const struct inno_hdmi_variant rk3036_inno_hdmi_variant = {
-	.phy_configs = rk3036_hdmi_phy_configs,
-	.default_phy_config = &rk3036_hdmi_phy_configs[1],
-};
-
-static const struct inno_hdmi_variant rk3128_inno_hdmi_variant = {
-	.phy_configs = rk3128_hdmi_phy_configs,
-	.default_phy_config = &rk3128_hdmi_phy_configs[1],
-};
-
-static const struct of_device_id inno_hdmi_dt_ids[] = {
-	{ .compatible = "rockchip,rk3036-inno-hdmi",
-	  .data = &rk3036_inno_hdmi_variant,
-	},
-	{ .compatible = "rockchip,rk3128-inno-hdmi",
-	  .data = &rk3128_inno_hdmi_variant,
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(of, inno_hdmi_dt_ids);
-
-struct platform_driver inno_hdmi_driver = {
-	.probe  = inno_hdmi_probe,
-	.remove_new = inno_hdmi_remove,
-	.driver = {
-		.name = "innohdmi-rockchip",
-		.of_match_table = inno_hdmi_dt_ids,
-	},
-};
-- 
2.27.0

