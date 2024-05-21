Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A57C8CA682
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 04:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C986A10E680;
	Tue, 21 May 2024 02:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2106.outbound.protection.partner.outlook.cn [139.219.17.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FED10E52C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 02:58:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSRP7vjQrMYm6PRNkVpAmQoyCh5dV6Xs8LfxKruJUacUDTE/p+TbZh6YqHsaEckbM9S8iHtrq4yQdm9qEYYr+6yigndFi3kUDyQ8zJ7tdOdsS0jzd/0yLaOEzJYtpd7ghzReFFeeJvmN3/Vvzz2wTSjeviZbQV3OdnXon1fH2k+w+1SwczEuTXurqbXRHuz1fac+jW76/v+WrHBVQZNMoTRmF6/VXgEOApuqjjTibdvrb/OzRPh8zuevxQim6E+klbgZwkDgV0K+QtgpNUdaLTuMhawaTbjnjhCK3OqkApbXzdrBPNhhufzPRQ5Eq5rlQNMsCM+Gla9U+P9KAYCOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkanxACpTfIFOqDB9PJsu6F6rwpEXlCbOXcNKMYl7AU=;
 b=GQgjTDXmnS/hCD0pksGGB61lqx8Cb+bE6oSrIeCWJVrOagVq21RpVb07oRjopDLsX5yX9//QGM7TIPNLa5sbmAFapFRf9Ucz+MBmxI85nIBx/UIIc/9gzHVlkgsYfwSAOAbNQFg9IcQAv3PspuW/4B10qj0UJuT9J5ZlB/Mag4YGiqjqR95tRN3VH9tYPag7Dp3BjGbXwo+KBycORb+FrV7pW2o38pnQiMCYq9SZ+BEpzBBmc+uFa2q7ZwawwrgJEX1x6lTzDAtoyW7thAX27FWlQ/pm1YAP/FK7PkVNQWZwp7fDSugkR0EsrZ2yit8YYTTkGF+drt4MGC6RzH+Pkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) by ZQ0PR01MB1128.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 21 May
 2024 02:58:35 +0000
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 ([fe80::39be:8ed9:67b7:adc6]) by
 ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn ([fe80::39be:8ed9:67b7:adc6%6])
 with mapi id 15.20.7472.044; Tue, 21 May 2024 02:58:35 +0000
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
Subject: [PATCH v4 09/10] drm/vs: Innosilicon HDMI support
Date: Tue, 21 May 2024 18:58:16 +0800
Message-Id: <20240521105817.3301-10-keith.zhao@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 22ab1e45-76b2-4aab-e552-08dc7941e835
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wZWpK/wlW5M0EabwC0YpGPmOAy702Ym3vpaeD5k/eS6FdkxsbrasXnJxkRSFd1wL41r90ov450nPv6HaXz3XN7wO8oO9AvXBnNrejtGrWyR7ii/JKVjiMNeQV2TgaDMQCI+ujMGFcYC97O6DPIqJcW1DK7SKXpe7QIGILEVpaZCz4wTV52Wcf4NLZHytYfBPmtC5a6YtBauUpU5F67L6bvXpEAF1rCBO2+jtiqbAm2+8k793J/Tus/sRRZITr1ui0BHaxou50WHSb1+I1JEYa30rzKY0CRfFzJ9/IqlEUUKhrAooSldM2t48qq2l0R8gOIOSOBuG5cEOY+2RVpgkvXXpSNxNlc3dVQRcOY9RrHt1GPOux1aSdOC3kw/D/U/AudHYuUYvxU/kH9k11+Jjhmmp8G+Su6rnYiPm47zN9H0iKtenW1owu1ZBmFXFwt0oTI4FURarNCigGLOU/DwEI8BDjwsiWt5pYDTzOsBQyD6QRevonMHRBj0/wV+dnJMevAI3URSUeH/qjLDTYkVZ5PjYkdGZ+KIuVEpq1bUW1b18UbzRjwOahhggAU0pTwd8wYJWl5TgCPNp8z3sqBSN9NWVsX0TvsQDX4G/5771H4DbOHNOYRbHHHzScf9kmrm8AQ8sU9y6IyCX/LZqmoFuVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(41320700004)(52116005)(7416005)(1800799015)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ppOXVrEYYka5dDmIUy2lYUsBfJvA9BvkBXW0u9xaKFo82Ig7XbnSbV4YB7u?=
 =?us-ascii?Q?ik8VfWsTFenbuQkmliHM91k0YIo5RExbRY9FLPKgpNO304r3JNiEJafn0SSs?=
 =?us-ascii?Q?JYpQlvRFpkofZpBZUxE9dxusd0KbQKUc1WS/FKwRVPTBZzj5DauC+9FHf5pA?=
 =?us-ascii?Q?C0bQrbq6NP0qUIZB9HRFuX8ofUAUbQvfp5UINhQqsvqC4zebOkJmSg9NQk3U?=
 =?us-ascii?Q?Adfr6Hh7QYthXv4xESW/aQPjbzkbShPdcZdafLDpHgV+3YlByBV09lKXGYTV?=
 =?us-ascii?Q?lNnAW6MrC9NnKg57tV9E9+w+mpwQxRNi2XUAGvpmurpOgaDqFsQ+5MrmtKU/?=
 =?us-ascii?Q?j4z1WHVMoku4+VM5F1TdMMrrfDWjndxdzZ8FF44Qiw0wGqLCN0syNaH0CFdM?=
 =?us-ascii?Q?7xopxVtwSaj5Bb1svUErmXZ/RYgGR+DPQEF02qzfdUfXGUoitFo8233d1eZS?=
 =?us-ascii?Q?12DNc+lAJPgLp3aft4iZr6e8P2ol77WXJMRp3J79N/QnhdjP1s7TMtIWUdzI?=
 =?us-ascii?Q?GhvCHdbeJQfIRpExmusJCewUQ1kcDqx6qlvFPh91sCEjAT38oIg8baZk3PVI?=
 =?us-ascii?Q?eIHxMuzQeCQr1wpVeQQI6L6h7bgtkumjqPkldqhufHfT/AnZKdHcIjpf1zwi?=
 =?us-ascii?Q?J7/0zCSnmucikW0k1TGK4oIcWhutjwvFiLsGwUcNGw73smKHESh/EQ8y2eKi?=
 =?us-ascii?Q?WPD4yONsfOZN8GCYrMgz1vLhNcCRRESgtyVaH44GNRTW54t1q5D/p9h3dfY/?=
 =?us-ascii?Q?MrK0ANRNdHV7Mw+5bx0No+GcJkOXl9tnL24QWFdRHZIlZ0uo3Bh5NsgLhrAn?=
 =?us-ascii?Q?En0dSvMIwtiAsoEYDh3/7Lk/MJuqGkNbzigfCx5JTHIBF5e2FKWWxBenW/hV?=
 =?us-ascii?Q?taqwKH5wh+wIdwjicRKlCcS1OTLWr6FyoZ9AlInnmeTXftNwHQnb/YqxbaST?=
 =?us-ascii?Q?3oImHp5qXo6fT7B7hF/9KpmKXCvnJFb+IyIXho5rODPy51jKR851pTKFeV8/?=
 =?us-ascii?Q?zidmfPKrbI07n8e83cZQ6xwy9f8CLPmLNNM5UXamRYGAfCX1PRPKTFkFlHgh?=
 =?us-ascii?Q?FgywmRX5QcBHF+5rkPdVMIY2V6htaJ/J7kCREOjgFpFKqIfdDq/RN6XMh88l?=
 =?us-ascii?Q?KHmfS+scvJAWJygKUNzqVSmjD9NmdzVGM1jqTqGSakttc8+475IiTRaTVOuR?=
 =?us-ascii?Q?JXKoQ23F3Tmn4PK1wO7UuG/IgPSidr9K9cORzXMMKowmWU04oKGuG1Kg02G8?=
 =?us-ascii?Q?pjZF9EvJ1D0O70JACxSJn0ulVsypwMcT+bVFbCDeo2Sz9lYusPZdwbW1TU8U?=
 =?us-ascii?Q?iVAciLIkrXHv/oI8CNphiCJmHYhA568+4xC9Egs41ovUZJyqvKx5i3JsCili?=
 =?us-ascii?Q?2dhNSQOU8QcXpuZkYclT2kG/XcWrCKZTxlFAKugvqsv7B/2vhMaq3nnwH1B2?=
 =?us-ascii?Q?mhgJKWb49NOe/faSSmi2zPL3IWGami89RhIzmZweas0+Rx1Upq1or+N3arv7?=
 =?us-ascii?Q?8jw/EM9dw8Hm+S9uwLNU38yDLw+mfeKj4XNZ5vFTloyWZfYlttDKJ8ibkbqb?=
 =?us-ascii?Q?sKBPso0fFByZt+hqW7i4pHrhlpI5DN+6s/gNRDng5/ssfiC5Sj5ZrDaCSCsF?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ab1e45-76b2-4aab-e552-08dc7941e835
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:58:35.6532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuF7H/xdgXAFcXNoIucvUK3TmFObl81klAVIXPcCr+o8dyw/DUSzdjryGMTcwijOflqssuGswhLP3zNANAa+ZsWO6SwBfi38h8y5P6lLgVw=
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

add inno hdmi driver which binds to vs display controller
and this driver uses the commom api from the inno hdmi

Signed-off-by: keith <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Kconfig           |  10 +
 drivers/gpu/drm/verisilicon/Makefile          |   1 +
 .../gpu/drm/verisilicon/inno_hdmi-starfive.c  | 481 ++++++++++++++++++
 .../gpu/drm/verisilicon/inno_hdmi-starfive.h  | 152 ++++++
 drivers/gpu/drm/verisilicon/vs_drv.c          |   4 +-
 drivers/gpu/drm/verisilicon/vs_drv.h          |   4 +
 6 files changed, 651 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.c
 create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.h

diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
index 2d733f93439e..228732d21e40 100644
--- a/drivers/gpu/drm/verisilicon/Kconfig
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -11,3 +11,13 @@ config DRM_VERISILICON_DC8200
 	  This driver provides VeriSilicon kernel mode
 	  setting and buffer management. It does not
 	  provide 2D or 3D acceleration.
+
+if DRM_VERISILICON_DC8200
+config DRM_INNO_STARFIVE_HDMI
+	bool "Starfive JH7110 specific extensions for Innosilicon HDMI"
+	select DRM_INNO_HDMI
+	help
+	  This selects support for StarFive SoC specific extensions
+	  for the Innosilicon HDMI driver. If you want to enable
+	  HDMI on JH7110 based SoC, you should select this option.
+endif
diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 88a07a308e31..2d02b4a3a567 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -6,4 +6,5 @@ vs_drm-objs := vs_dc_hw.o \
 		vs_crtc.o \
 		vs_drv.o
 
+vs_drm-$(CONFIG_DRM_INNO_STARFIVE_HDMI) += inno_hdmi-starfive.o
 obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/inno_hdmi-starfive.c b/drivers/gpu/drm/verisilicon/inno_hdmi-starfive.c
new file mode 100644
index 000000000000..f27b04ef5690
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/inno_hdmi-starfive.c
@@ -0,0 +1,481 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/component.h>
+#include <linux/i2c.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_of.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/bridge/inno_hdmi.h>
+#include <sound/hdmi-codec.h>
+
+#include "vs_drv.h"
+#include "inno_hdmi-starfive.h"
+
+enum hdmi_clk {
+	CLK_SYS = 0,
+	CLK_M,
+	CLK_B,
+	CLK_HDMI_NUM
+};
+
+struct pre_pll_config {
+	unsigned long pixclock;
+	unsigned long tmdsclock;
+	u8 prediv;
+	u16 fbdiv;
+	u8 tmds_div_a;
+	u8 tmds_div_b;
+	u8 tmds_div_c;
+	u8 pclk_div_a;
+	u8 pclk_div_b;
+	u8 pclk_div_c;
+	u8 pclk_div_d;
+	u8 vco_div_5_en;
+	u32 fracdiv;
+};
+
+struct post_pll_config {
+	unsigned long tmdsclock;
+	u8 prediv;
+	u16 fbdiv;
+	u8 postdiv;
+	u8 post_div_en;
+	u8 version;
+};
+
+struct stf_inno_hdmi {
+	struct drm_encoder	encoder;
+	struct inno_hdmi inno_hdmi;
+	struct clk_bulk_data clk_hdmi[CLK_HDMI_NUM];
+	struct reset_control *tx_rst;
+	int	nclks;
+	unsigned long tmds_rate;
+	struct pre_pll_config pre_cfg;
+	const struct post_pll_config *post_cfg;
+};
+
+static inline struct stf_inno_hdmi *to_starfive_inno_hdmi(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct stf_inno_hdmi, encoder);
+}
+
+static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
+{
+	struct stf_inno_hdmi *stf_hdmi = to_starfive_inno_hdmi(encoder);
+
+	return &stf_hdmi->inno_hdmi;
+}
+
+static const struct post_pll_config post_pll_cfg_table[] = {
+	{25200000, 1, 80, 13, 3, 1},
+	{27000000, 1, 40, 11, 3, 1},
+	{33750000, 1, 40, 11, 3, 1},
+	{49000000, 1, 20, 1, 3, 3},
+	{241700000, 1, 20, 1, 3, 3},
+	{297000000, 4, 20, 0, 0, 3},
+	{ /* sentinel */ }
+};
+
+static int starfive_hdmi_enable_clk_rst(struct device *dev, struct stf_inno_hdmi *stf_inno_hdmi)
+{
+	int ret;
+
+	ret = clk_bulk_prepare_enable(stf_inno_hdmi->nclks, stf_inno_hdmi->clk_hdmi);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	ret = reset_control_deassert(stf_inno_hdmi->tx_rst);
+	if (ret < 0) {
+		dev_err(dev, "failed to deassert tx_rst\n");
+		return ret;
+	}
+	return 0;
+}
+
+static void starfive_hdmi_disable_clk_rst(struct device *dev, struct stf_inno_hdmi *stf_inno_hdmi)
+{
+	int ret;
+
+	ret = reset_control_assert(stf_inno_hdmi->tx_rst);
+	if (ret < 0)
+		dev_err(dev, "failed to assert tx_rst\n");
+
+	clk_bulk_disable_unprepare(stf_inno_hdmi->nclks, stf_inno_hdmi->clk_hdmi);
+}
+
+static void starfive_hdmi_config_pll(struct stf_inno_hdmi *stf_inno_hdmi)
+{
+	u32 val;
+	struct inno_hdmi *hdmi;
+
+	hdmi = &stf_inno_hdmi->inno_hdmi;
+	u8 reg_1ad_value = stf_inno_hdmi->post_cfg->post_div_en ?
+			   stf_inno_hdmi->post_cfg->postdiv : 0x00;
+	u8 reg_1aa_value = stf_inno_hdmi->post_cfg->post_div_en ?
+			   0x0e : 0x02;
+
+	hdmi_writeb(hdmi, STF_INNO_PRE_PLL_CONTROL, STF_INNO_PRE_PLL_POWER_DOWN);
+	hdmi_writeb(hdmi, STF_INNO_POST_PLL_DIV_1,
+		    STF_INNO_POST_PLL_POST_DIV_ENABLE |
+		    STF_INNO_POST_PLL_REFCLK_SEL_TMDS |
+		    STF_INNO_POST_PLL_POWER_DOWN);
+	hdmi_writeb(hdmi, STF_INNO_PRE_PLL_DIV_1,
+		    STF_INNO_PRE_PLL_PRE_DIV(stf_inno_hdmi->pre_cfg.prediv));
+
+	val = STF_INNO_SPREAD_SPECTRUM_MOD_DISABLE | STF_INNO_SPREAD_SPECTRUM_MOD_DOWN;
+	if (!stf_inno_hdmi->pre_cfg.fracdiv)
+		val |= STF_INNO_PRE_PLL_FRAC_DIV_DISABLE;
+	hdmi_writeb(hdmi, STF_INNO_PRE_PLL_DIV_2,
+		    STF_INNO_PRE_PLL_FB_DIV_11_8(stf_inno_hdmi->pre_cfg.fbdiv) | val);
+	hdmi_writeb(hdmi, STF_INNO_PRE_PLL_DIV_3,
+		    STF_INNO_PRE_PLL_FB_DIV_7_0(stf_inno_hdmi->pre_cfg.fbdiv));
+	hdmi_writeb(hdmi, STF_INNO_PRE_PLL_DIV_4,
+		    STF_INNO_PRE_PLL_TMDSCLK_DIV_C(stf_inno_hdmi->pre_cfg.tmds_div_c) |
+		    STF_INNO_PRE_PLL_TMDSCLK_DIV_A(stf_inno_hdmi->pre_cfg.tmds_div_a) |
+		    STF_INNO_PRE_PLL_TMDSCLK_DIV_B(stf_inno_hdmi->pre_cfg.tmds_div_b));
+
+	if (stf_inno_hdmi->pre_cfg.fracdiv) {
+		hdmi_writeb(hdmi, STF_INNO_PRE_PLL_FRAC_DIV_L,
+			    STF_INNO_PRE_PLL_FRAC_DIV_7_0(stf_inno_hdmi->pre_cfg.fracdiv));
+		hdmi_writeb(hdmi, STF_INNO_PRE_PLL_FRAC_DIV_M,
+			    STF_INNO_PRE_PLL_FRAC_DIV_15_8(stf_inno_hdmi->pre_cfg.fracdiv));
+		hdmi_writeb(hdmi, STF_INNO_PRE_PLL_FRAC_DIV_H,
+			    STF_INNO_PRE_PLL_FRAC_DIV_23_16(stf_inno_hdmi->pre_cfg.fracdiv));
+	}
+
+	hdmi_writeb(hdmi, STF_INNO_PRE_PLL_DIV_5,
+		    STF_INNO_PRE_PLL_PCLK_DIV_A(stf_inno_hdmi->pre_cfg.pclk_div_a) |
+		    STF_INNO_PRE_PLL_PCLK_DIV_B(stf_inno_hdmi->pre_cfg.pclk_div_b));
+	hdmi_writeb(hdmi, STF_INNO_PRE_PLL_DIV_6,
+		    STF_INNO_PRE_PLL_PCLK_DIV_C(stf_inno_hdmi->pre_cfg.pclk_div_c) |
+		    STF_INNO_PRE_PLL_PCLK_DIV_D(stf_inno_hdmi->pre_cfg.pclk_div_d));
+
+	/*pre-pll power down*/
+	hdmi_modb(hdmi, STF_INNO_PRE_PLL_CONTROL, STF_INNO_PRE_PLL_POWER_DOWN, 0);
+
+	hdmi_modb(hdmi, STF_INNO_POST_PLL_DIV_2, STF_INNO_POST_PLL_Pre_DIV_MASK,
+		  STF_INNO_POST_PLL_PRE_DIV(stf_inno_hdmi->post_cfg->prediv));
+	hdmi_writeb(hdmi, STF_INNO_POST_PLL_DIV_3, stf_inno_hdmi->post_cfg->fbdiv & 0xff);
+	hdmi_writeb(hdmi, STF_INNO_POST_PLL_DIV_4, reg_1ad_value);
+	hdmi_writeb(hdmi, STF_INNO_POST_PLL_DIV_1, reg_1aa_value);
+}
+
+static void starfive_hdmi_tmds_driver_on(struct inno_hdmi *hdmi)
+{
+	hdmi_modb(hdmi, STF_INNO_TMDS_CONTROL,
+		  STF_INNO_TMDS_DRIVER_ENABLE, STF_INNO_TMDS_DRIVER_ENABLE);
+}
+
+static void starfive_hdmi_sync_tmds(struct inno_hdmi *hdmi)
+{
+	/*first send 0 to this bit, then send 1 and keep 1 into this bit*/
+	hdmi_writeb(hdmi, HDMI_SYNC, 0x0);
+	hdmi_writeb(hdmi, HDMI_SYNC, 0x1);
+}
+
+static void starfive_hdmi_phy_get_pre_pll_cfg(struct stf_inno_hdmi *hdmi)
+{
+	if (hdmi->tmds_rate > 30000000) {
+		hdmi->pre_cfg.pixclock = hdmi->tmds_rate;
+		hdmi->pre_cfg.tmdsclock = hdmi->tmds_rate;
+		hdmi->pre_cfg.prediv = 1;
+		hdmi->pre_cfg.fbdiv = hdmi->tmds_rate / 3000000;
+		hdmi->pre_cfg.tmds_div_a = 0;
+		hdmi->pre_cfg.tmds_div_b = 1;
+		hdmi->pre_cfg.tmds_div_c = 1;
+		hdmi->pre_cfg.pclk_div_a = 1;
+		hdmi->pre_cfg.pclk_div_b = 0;
+		hdmi->pre_cfg.pclk_div_c = 2;
+		hdmi->pre_cfg.pclk_div_d = 2;
+		hdmi->pre_cfg.vco_div_5_en = hdmi->tmds_rate % 3000000 ? 1 : 0;
+
+		if (hdmi->pre_cfg.vco_div_5_en) {
+			hdmi->pre_cfg.fracdiv = (hdmi->tmds_rate % 3000000) *
+						 0xffffff / 1000000;
+		}
+	} else {
+		hdmi->pre_cfg.pixclock = hdmi->tmds_rate;
+		hdmi->pre_cfg.tmdsclock = hdmi->tmds_rate;
+		hdmi->pre_cfg.prediv = 1;
+		hdmi->pre_cfg.fbdiv = hdmi->tmds_rate / 1000000;
+		hdmi->pre_cfg.tmds_div_a = 2;
+		hdmi->pre_cfg.tmds_div_b = 1;
+		hdmi->pre_cfg.tmds_div_c = 1;
+		hdmi->pre_cfg.pclk_div_a = 3;
+		hdmi->pre_cfg.pclk_div_b = 0;
+		hdmi->pre_cfg.pclk_div_c = 3;
+		hdmi->pre_cfg.pclk_div_d = 4;
+		hdmi->pre_cfg.vco_div_5_en = hdmi->tmds_rate % 1000000 ? 1 : 0;
+
+		if (hdmi->pre_cfg.vco_div_5_en) {
+			hdmi->pre_cfg.fracdiv = (hdmi->tmds_rate % 1000000) *
+						 0xffffff / 1000000;
+		}
+	}
+}
+
+static int starfive_hdmi_phy_clk_set_rate(struct stf_inno_hdmi *stf_inno_hdmi)
+{
+	stf_inno_hdmi->post_cfg = post_pll_cfg_table;
+
+	starfive_hdmi_phy_get_pre_pll_cfg(stf_inno_hdmi);
+
+	for (; stf_inno_hdmi->post_cfg->tmdsclock != 0; stf_inno_hdmi->post_cfg++)
+		if (stf_inno_hdmi->tmds_rate <= stf_inno_hdmi->post_cfg->tmdsclock)
+			break;
+
+	starfive_hdmi_config_pll(stf_inno_hdmi);
+
+	return 0;
+}
+
+static int starfive_hdmi_setup(struct inno_hdmi *hdmi,
+			       struct drm_display_mode *mode)
+{
+	struct stf_inno_hdmi *stf_inno_hdmi = dev_get_drvdata(hdmi->dev);
+	struct drm_display_info *display = &hdmi->connector.display_info;
+	int ret;
+	u32 val;
+
+	hdmi_modb(hdmi, STF_INNO_BIAS_CONTROL, STF_INNO_BIAS_ENABLE, STF_INNO_BIAS_ENABLE);
+	hdmi_writeb(hdmi, STF_INNO_RX_CONTROL, STF_INNO_RX_ENABLE);
+
+	stf_inno_hdmi->tmds_rate = mode->clock * 1000;
+	starfive_hdmi_phy_clk_set_rate(stf_inno_hdmi);
+
+	ret = readx_poll_timeout(readl_relaxed,
+				 hdmi->regs + (STF_INNO_PRE_PLL_LOCK_STATUS) * 0x04,
+				 val, val & 0x1, 1000, 100000);
+	if (ret < 0) {
+		dev_err(hdmi->dev, "failed to wait pre-pll lock\n");
+		return ret;
+	}
+
+	ret = readx_poll_timeout(readl_relaxed,
+				 hdmi->regs + (STF_INNO_POST_PLL_LOCK_STATUS) * 0x04,
+				 val, val & 0x1, 1000, 100000);
+	if (ret < 0) {
+		dev_err(hdmi->dev, "failed to wait post-pll lock\n");
+		return ret;
+	}
+
+	/*turn on LDO*/
+	hdmi_writeb(hdmi, STF_INNO_LDO_CONTROL, STF_INNO_LDO_ENABLE);
+	/*turn on serializer*/
+	hdmi_writeb(hdmi, STF_INNO_SERIALIER_CONTROL, STF_INNO_SERIALIER_ENABLE);
+
+	if (display->is_hdmi)
+		inno_hdmi_config_video_avi(hdmi, mode);
+
+	inno_hdmi_sys_power(hdmi, false);
+	inno_hdmi_config_video_timing(hdmi, mode);
+	inno_hdmi_sys_power(hdmi, true);
+
+	starfive_hdmi_tmds_driver_on(hdmi);
+	starfive_hdmi_sync_tmds(hdmi);
+
+	return 0;
+}
+
+static enum drm_mode_status
+starfive_hdmi_connector_mode_valid(struct drm_connector *connector, struct drm_display_mode *mode)
+{
+	int pclk = mode->clock * 1000;
+	bool valid = false;
+
+	if (pclk <= PIXCLOCK_4K_30FPS)
+		valid = true;
+
+	return (valid) ? MODE_OK : MODE_BAD;
+}
+
+static void starfive_hdmi_encoder_enable(struct drm_encoder *encoder,
+					 struct drm_atomic_state *state)
+{
+	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
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
+	starfive_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
+}
+
+static void starfive_hdmi_encoder_disable(struct drm_encoder *encoder,
+					  struct drm_atomic_state *state)
+{
+	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
+
+	inno_hdmi_sys_power(hdmi, false);
+}
+
+static int
+starfive_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	u8 vic = drm_match_cea_mode(mode);
+	struct inno_hdmi_connector_state *inno_conn_state = to_inno_hdmi_conn_state(conn_state);
+
+	struct vs_crtc_state *vs_crtc_state = to_vs_crtc_state(crtc_state);
+
+	vs_crtc_state->encoder_type = encoder->encoder_type;
+	vs_crtc_state->output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
+
+	if (vic == 6 || vic == 7 || vic == 21 || vic == 22 ||
+	    vic == 2 || vic == 3 || vic == 17 || vic == 18)
+		inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_601;
+	else
+		inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
+
+	inno_conn_state->enc_out_format = HDMI_COLORSPACE_RGB;
+	inno_conn_state->rgb_limited_range =
+		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED;
+
+	return  starfive_hdmi_connector_mode_valid(conn_state->connector,
+			&crtc_state->adjusted_mode) == MODE_OK ? 0 : -EINVAL;
+}
+
+static const struct drm_encoder_helper_funcs stf_inno_encoder_helper_funcs = {
+	.atomic_check   = starfive_hdmi_encoder_atomic_check,
+	.atomic_enable  = starfive_hdmi_encoder_enable,
+	.atomic_disable = starfive_hdmi_encoder_disable,
+};
+
+static int starfive_hdmi_get_clk_rst(struct device *dev, struct stf_inno_hdmi *stf_hdmi)
+{
+	int ret;
+
+	stf_hdmi->nclks = ARRAY_SIZE(stf_hdmi->clk_hdmi);
+
+	ret = devm_clk_bulk_get(dev, stf_hdmi->nclks, stf_hdmi->clk_hdmi);
+	if (ret) {
+		dev_err(dev, "Failed to get clk controls\n");
+		return ret;
+	}
+
+	stf_hdmi->tx_rst = devm_reset_control_get_by_index(dev, 0);
+	if (IS_ERR(stf_hdmi->tx_rst)) {
+		dev_err(dev, "failed to get tx_rst reset\n");
+		return PTR_ERR(stf_hdmi->tx_rst);
+	}
+
+	return 0;
+}
+
+static int starfive_hdmi_bind(struct device *dev, struct device *master,
+			      void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct drm_device *drm = dev_get_drvdata(master);
+	struct stf_inno_hdmi *stf_hdmi;
+	struct inno_hdmi *hdmi;
+	struct resource *iores;
+
+	int ret;
+	unsigned long long rate;
+
+	stf_hdmi = drmm_simple_encoder_alloc(drm, struct stf_inno_hdmi,
+					     encoder, DRM_MODE_ENCODER_TMDS);
+	hdmi = &stf_hdmi->inno_hdmi;
+
+	hdmi->dev = dev;
+	hdmi->plat_data = (struct inno_hdmi_plat_data *)of_device_get_match_data(dev);
+
+	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	hdmi->regs = devm_ioremap_resource(dev, iores);
+	if (IS_ERR(hdmi->regs))
+		return PTR_ERR(hdmi->regs);
+
+	ret = starfive_hdmi_get_clk_rst(dev, stf_hdmi);
+	if (ret < 0)
+		return ret;
+
+	ret = starfive_hdmi_enable_clk_rst(dev, stf_hdmi);
+	if (ret)
+		return ret;
+
+	rate = clk_get_rate(stf_hdmi->clk_hdmi[CLK_SYS].clk);
+	inno_hdmi_i2c_init(hdmi, rate);
+
+	ret = inno_hdmi_bind(drm, hdmi, &stf_hdmi->encoder);
+	if (ret)
+		goto err_disable_clk;
+
+	dev_set_drvdata(dev, stf_hdmi);
+
+	return 0;
+
+err_disable_clk:
+	starfive_hdmi_disable_clk_rst(dev, stf_hdmi);
+	return ret;
+}
+
+static void starfive_hdmi_unbind(struct device *dev, struct device *master, void *data)
+{
+	struct stf_inno_hdmi *stf_hdmi = dev_get_drvdata(dev);
+
+	struct inno_hdmi *hdmi = &stf_hdmi->inno_hdmi;
+
+	i2c_put_adapter(hdmi->ddc);
+	starfive_hdmi_disable_clk_rst(dev, stf_hdmi);
+}
+
+static const struct component_ops starfive_hdmi_ops = {
+	.bind	= starfive_hdmi_bind,
+	.unbind	= starfive_hdmi_unbind,
+};
+
+static int starfive_hdmi_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &starfive_hdmi_ops);
+}
+
+static int starfive_hdmi_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &starfive_hdmi_ops);
+
+	return 0;
+}
+
+static const struct inno_hdmi_plat_data stf_inno_info = {
+	.soc_type = STARFIVE_HDMI,
+	.mode_valid = starfive_hdmi_connector_mode_valid,
+	.helper_private = &stf_inno_encoder_helper_funcs,
+};
+
+static const struct of_device_id starfive_hdmi_dt_ids[] = {
+	{ .compatible = "starfive,jh7110-inno-hdmi", .data = &stf_inno_info,},
+	{},
+};
+MODULE_DEVICE_TABLE(of, starfive_hdmi_dt_ids);
+
+struct platform_driver starfive_hdmi_driver = {
+	.probe  = starfive_hdmi_probe,
+	.remove = starfive_hdmi_remove,
+	.driver = {
+		.name = "starfive-hdmi",
+		.of_match_table = starfive_hdmi_dt_ids,
+	},
+};
+
+MODULE_AUTHOR("StarFive Corporation");
+MODULE_DESCRIPTION("Starfive Specific INNO-HDMI Driver");
diff --git a/drivers/gpu/drm/verisilicon/inno_hdmi-starfive.h b/drivers/gpu/drm/verisilicon/inno_hdmi-starfive.h
new file mode 100644
index 000000000000..c64374208b58
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/inno_hdmi-starfive.h
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 StarFive Technology Co., Ltd.
+ */
+
+#ifndef __STARFIVE_HDMI_H__
+#define __STARFIVE_HDMI_H__
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
+#define HDMI_SYNC					0xce
+
+#define UPDATE(x, h, l)					FIELD_PREP(GENMASK(h, l), x)
+
+/* REG: 0x1a0 */
+#define STF_INNO_PRE_PLL_CONTROL			0x1a0
+#define STF_INNO_PCLK_VCO_DIV_5_MASK			BIT(1)
+#define STF_INNO_PCLK_VCO_DIV_5(x)			UPDATE(x, 1, 1)
+#define STF_INNO_PRE_PLL_POWER_DOWN			BIT(0)
+
+/* REG: 0x1a1 */
+#define STF_INNO_PRE_PLL_DIV_1				0x1a1
+#define STF_INNO_PRE_PLL_PRE_DIV_MASK			GENMASK(5, 0)
+#define STF_INNO_PRE_PLL_PRE_DIV(x)			UPDATE(x, 5, 0)
+
+/* REG: 0x1a2 */
+#define STF_INNO_PRE_PLL_DIV_2					0x1a2
+#define STF_INNO_SPREAD_SPECTRUM_MOD_DOWN		BIT(7)
+#define STF_INNO_SPREAD_SPECTRUM_MOD_DISABLE		BIT(6)
+#define STF_INNO_PRE_PLL_FRAC_DIV_DISABLE		UPDATE(3, 5, 4)
+#define STF_INNO_PRE_PLL_FB_DIV_11_8_MASK		GENMASK(3, 0)
+#define STF_INNO_PRE_PLL_FB_DIV_11_8(x)			UPDATE((x) >> 8, 3, 0)
+
+/* REG: 0x1a3 */
+#define STF_INNO_PRE_PLL_DIV_3				0x1a3
+#define STF_INNO_PRE_PLL_FB_DIV_7_0(x)			UPDATE(x, 7, 0)
+
+/* REG: 0x1a4*/
+#define STF_INNO_PRE_PLL_DIV_4				0x1a4
+#define STF_INNO_PRE_PLL_TMDSCLK_DIV_C_MASK		GENMASK(1, 0)
+#define STF_INNO_PRE_PLL_TMDSCLK_DIV_C(x)		UPDATE(x, 1, 0)
+#define STF_INNO_PRE_PLL_TMDSCLK_DIV_B_MASK		GENMASK(3, 2)
+#define STF_INNO_PRE_PLL_TMDSCLK_DIV_B(x)		UPDATE(x, 3, 2)
+#define STF_INNO_PRE_PLL_TMDSCLK_DIV_A_MASK		GENMASK(5, 4)
+#define STF_INNO_PRE_PLL_TMDSCLK_DIV_A(x)		UPDATE(x, 5, 4)
+
+/* REG: 0x1a5 */
+#define STF_INNO_PRE_PLL_DIV_5				0x1a5
+#define STF_INNO_PRE_PLL_PCLK_DIV_B_SHIFT		5
+#define STF_INNO_PRE_PLL_PCLK_DIV_B_MASK		GENMASK(6, 5)
+#define STF_INNO_PRE_PLL_PCLK_DIV_B(x)			UPDATE(x, 6, 5)
+#define STF_INNO_PRE_PLL_PCLK_DIV_A_MASK		GENMASK(4, 0)
+#define STF_INNO_PRE_PLL_PCLK_DIV_A(x)			UPDATE(x, 4, 0)
+
+/* REG: 0x1a6 */
+#define STF_INNO_PRE_PLL_DIV_6				0x1a6
+#define STF_INNO_PRE_PLL_PCLK_DIV_C_SHIFT		5
+#define STF_INNO_PRE_PLL_PCLK_DIV_C_MASK		GENMASK(6, 5)
+#define STF_INNO_PRE_PLL_PCLK_DIV_C(x)			UPDATE(x, 6, 5)
+#define STF_INNO_PRE_PLL_PCLK_DIV_D_MASK		GENMASK(4, 0)
+#define STF_INNO_PRE_PLL_PCLK_DIV_D(x)			UPDATE(x, 4, 0)
+
+/* REG: 0x1a9 */
+#define STF_INNO_PRE_PLL_LOCK_STATUS			0x1a9
+
+/* REG: 0x1aa */
+#define STF_INNO_POST_PLL_DIV_1				0x1aa
+#define STF_INNO_POST_PLL_POST_DIV_ENABLE		GENMASK(3, 2)
+#define STF_INNO_POST_PLL_REFCLK_SEL_TMDS		BIT(1)
+#define STF_INNO_POST_PLL_POWER_DOWN			BIT(0)
+#define STF_INNO_POST_PLL_FB_DIV_8(x)			UPDATE(((x) >> 8) << 4, 4, 4)
+
+/* REG:0x1ab */
+#define STF_INNO_POST_PLL_DIV_2				0x1ab
+#define STF_INNO_POST_PLL_Pre_DIV_MASK			GENMASK(5, 0)
+#define STF_INNO_POST_PLL_PRE_DIV(x)			UPDATE(x, 5, 0)
+
+/* REG: 0x1ac */
+#define STF_INNO_POST_PLL_DIV_3				0x1ac
+#define STF_INNO_POST_PLL_FB_DIV_7_0(x)			UPDATE(x, 7, 0)
+
+/* REG: 0x1ad */
+#define STF_INNO_POST_PLL_DIV_4				0x1ad
+#define STF_INNO_POST_PLL_POST_DIV_MASK			GENMASK(2, 0)
+#define STF_INNO_POST_PLL_POST_DIV_2			0x0
+#define STF_INNO_POST_PLL_POST_DIV_4			0x1
+#define STF_INNO_POST_PLL_POST_DIV_8			0x3
+
+/* REG: 0x1af */
+#define STF_INNO_POST_PLL_LOCK_STATUS			0x1af
+
+/* REG: 0x1b0 */
+#define STF_INNO_BIAS_CONTROL				0x1b0
+#define STF_INNO_BIAS_ENABLE				BIT(2)
+
+/* REG: 0x1b2 */
+#define STF_INNO_TMDS_CONTROL				0x1b2
+#define STF_INNO_TMDS_CLK_DRIVER_EN			BIT(3)
+#define STF_INNO_TMDS_D2_DRIVER_EN			BIT(2)
+#define STF_INNO_TMDS_D1_DRIVER_EN			BIT(1)
+#define STF_INNO_TMDS_D0_DRIVER_EN			BIT(0)
+#define STF_INNO_TMDS_DRIVER_ENABLE			(STF_INNO_TMDS_CLK_DRIVER_EN | \
+							 STF_INNO_TMDS_D2_DRIVER_EN | \
+							 STF_INNO_TMDS_D1_DRIVER_EN | \
+							 STF_INNO_TMDS_D0_DRIVER_EN)
+
+/* REG: 0x1b4 */
+#define STF_INNO_LDO_CONTROL				0x1b4
+#define STF_INNO_LDO_D2_EN				BIT(2)
+#define STF_INNO_LDO_D1_EN				BIT(1)
+#define STF_INNO_LDO_D0_EN				BIT(0)
+#define STF_INNO_LDO_ENABLE				(STF_INNO_LDO_D2_EN | \
+							 STF_INNO_LDO_D1_EN | \
+							 STF_INNO_LDO_D0_EN)
+
+/* REG: 0x1be */
+#define STF_INNO_SERIALIER_CONTROL			0x1be
+#define STF_INNO_SERIALIER_D2_EN			BIT(6)
+#define STF_INNO_SERIALIER_D1_EN			BIT(5)
+#define STF_INNO_SERIALIER_D0_EN			BIT(4)
+#define STF_INNO_SERIALIER_EN				BIT(0)
+
+#define STF_INNO_SERIALIER_ENABLE			(STF_INNO_SERIALIER_D2_EN | \
+							 STF_INNO_SERIALIER_D1_EN | \
+							 STF_INNO_SERIALIER_D0_EN | \
+							 STF_INNO_SERIALIER_EN)
+
+/* REG: 0x1cc */
+#define STF_INNO_RX_CONTROL				0x1cc
+#define STF_INNO_RX_EN					BIT(3)
+#define STF_INNO_RX_CHANNEL_2_EN			BIT(2)
+#define STF_INNO_RX_CHANNEL_1_EN			BIT(1)
+#define STF_INNO_RX_CHANNEL_0_EN			BIT(0)
+#define STF_INNO_RX_ENABLE				(STF_INNO_RX_EN | \
+							 STF_INNO_RX_CHANNEL_2_EN | \
+							 STF_INNO_RX_CHANNEL_1_EN | \
+							 STF_INNO_RX_CHANNEL_0_EN)
+
+/* REG: 0x1d1 */
+#define STF_INNO_PRE_PLL_FRAC_DIV_H			0x1d1
+#define STF_INNO_PRE_PLL_FRAC_DIV_23_16(x)		UPDATE((x) >> 16, 7, 0)
+/* REG: 0x1d2 */
+#define STF_INNO_PRE_PLL_FRAC_DIV_M			0x1d2
+#define STF_INNO_PRE_PLL_FRAC_DIV_15_8(x)		UPDATE((x) >> 8, 7, 0)
+/* REG: 0x1d3 */
+#define STF_INNO_PRE_PLL_FRAC_DIV_L			0x1d3
+#define STF_INNO_PRE_PLL_FRAC_DIV_7_0(x)		UPDATE(x, 7, 0)
+
+#define PIXCLOCK_4K_30FPS				297000000
+
+#endif /* __STARFIVE_HDMI_H__ */
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/verisilicon/vs_drv.c
index c22fd2199fe2..6f04102b05b3 100644
--- a/drivers/gpu/drm/verisilicon/vs_drv.c
+++ b/drivers/gpu/drm/verisilicon/vs_drv.c
@@ -609,7 +609,9 @@ static const struct component_master_ops vs_drm_ops = {
 };
 
 static struct platform_driver *drm_sub_drivers[] = {
-
+#ifdef CONFIG_DRM_INNO_STARFIVE_HDMI
+	&starfive_hdmi_driver,
+#endif
 };
 
 static struct component_match *vs_add_external_components(struct device *dev)
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/verisilicon/vs_drv.h
index d9f6efa7c8f9..c3c08ed5f8ac 100644
--- a/drivers/gpu/drm/verisilicon/vs_drv.h
+++ b/drivers/gpu/drm/verisilicon/vs_drv.h
@@ -90,4 +90,8 @@ to_vs_plane_state(struct drm_plane_state *state)
 	return container_of(state, struct vs_plane_state, base);
 }
 
+#ifdef CONFIG_DRM_INNO_STARFIVE_HDMI
+extern struct platform_driver starfive_hdmi_driver;
+#endif
+
 #endif /* __VS_DRV_H__ */
-- 
2.27.0

