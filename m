Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF939D339C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 07:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5024010E38E;
	Wed, 20 Nov 2024 06:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Wed, 20 Nov 2024 06:35:13 UTC
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2137.outbound.protection.partner.outlook.cn
 [139.219.146.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCFE10E38E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 06:35:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfZ2ieGFti3hq6GUhHGdn6jMq1ZJ1fUUOn6dUBi0hcGxlc01GHOaBGoz8xSgF9iz8nkybFFK5ic5jtflc0zuMS/4JKg0ElQpnb354AphYeexFerli068NjoTdw800Qlk+e6fvq0/6YX6rSwTJgpquZPdbPyMyQ6B2F+ZyxLFCICJX6SaQ+YyN4Y+ETC3WvgLH7WNjbU4hhZCIjQxKwNelq+p+m4NAtdZ7d1n+JHM9nMlgGr1JnIj+hizGglDVBTGhVZfziB54WvyUjDhTTOuuh802pmIBGEgDiByCNN1p2Xe8eJUu2EHMrU8YMZr5S0JOCYPJWiX6ZQ8BB6vI+/xmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QvqgOEFwFILp9e3g2cgmcUnhQRmbUaD0pNWqLgWRZI=;
 b=hB/iesJTDN+Qi4F0gl+QtPHLI8zYM+lgBEBKxWD2oYp8TKDVI3ULUitc8Z4I2LlMQC+7Gck8NZ6bFRth5BfWsAh0sPfMwLCyh0xWpOr/hEc7XcA8JGHlnHBJdVhvE8xy7DwgY2RXzhAIyv8CXmqaBlgMS+VzPJw/gwoRGuN7d3MpzxjhdHM/ZVELKO1F94RLM4zddPiwn+1gAT9WnN0oevQ7FWta1NkM/JR8dx9SKVd6zHjdyqIOWiCyqttehEVlbkicm5M7dFr2V2bZ7b3F6pCOBJEuYbNER51PoWdFPki4fjs5iQWffwbaAarGmcjrOyFkTKHcMzjPhiwezJThig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6) by NTZPR01MB1100.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 06:20:30 +0000
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 ([fe80::512d:38d7:ed9f:dfbe]) by
 NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn ([fe80::512d:38d7:ed9f:dfbe%4])
 with mapi id 15.20.8158.023; Wed, 20 Nov 2024 06:20:29 +0000
From: keith zhao <keith.zhao@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 william.qiu@starfivetech.com, xingyu.wu@starfivetech.com, kernel@esmil.dk,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 p.zabel@pengutronix.de, changhuang.liang@starfivetech.com,
 keith.zhao@starfivetech.com, jack.zhu@starfivetech.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/9] drm/vs: Add CRTC Functions
Date: Wed, 20 Nov 2024 14:18:45 +0800
Message-Id: <20241120061848.196754-7-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241120061848.196754-1-keith.zhao@starfivetech.com>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0059.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::26) To NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB1050:EE_|NTZPR01MB1100:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b71d83b-1b2d-41d4-4766-08dd092b6e33
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|41320700013|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: BwQCtfGLIvPLh/D+ujP2azse10aBj7j577b1Q8O4hBDANuVp/hP7NL1q+RmGuhENgsJwqBfZ/3LBnik4oeErEOSN2wJgPlBjLcmSHxg8RKlUxFGzN40SiP7UirYUHf/LdjmlOc0x5sxSKyF1srQosai3dNFAmCNFBjXyW1LWCtDV6mIeKqo0Kmj0mpN4iQERIYQowWYriwwF/H5VLl7QvFg7yzQuyyUTbF6OUsAKrni9ivK1ppsXmMlM7nZCqBtpoLXsBJ/7KHCWOB/vsAzQqP1e5IBm1Q9hzIInifTGGmbro2B0wfM2wdnY5l/KvQWq98ZZL4m4hhYrxJUMHh98VKbTnLUgijDFpzY3hA1tRz9skU4YzWJ9mHR9MzgR/Xyzw+c8SEW1UZai/lXKWSDEPgzy1X/otWIs9iA3f4Z36ibcAQr4rD/VnqFQCoier5PQq/NaP8QJr3OrZtCla9FJGL6rh3SVoa5quYHWbeZpYFS2ktGwuit+UKpXg8QePlnz57eMguWaK3Gaemoh4ugRgEhSDnTqq6fG39WO8ra31GwaiuFkkTPz6XfPtzLoKi7k5qvFyJMXohsinzWWT6hSYcASGPS6CIpo0ltNMd7SzXFd+qnsordEFjE1/L5VvfSu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(41320700013)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yjp/m742qWH7Iumods98zC7FZmM186DfekbZkStzQ6VhDJ7adTMSo/qrt1o/?=
 =?us-ascii?Q?So6n1QK870VosRyTLwjmKamHpQH5vzwFJD2TUppbSZoUN9Mj7VgclTiE3Dfw?=
 =?us-ascii?Q?Ile89xNBwimhBSmIbFXY4AoPHNCBdnG2bDsHKUlB6qJDpV4Jru73TYwfkrrq?=
 =?us-ascii?Q?man4WA74/7P+W5wcjdNnScIqpTT4Li5Gbw6q54vRM2Ml+hqLkLGBD8PGY0fE?=
 =?us-ascii?Q?M2coY21RlknI6unIxcWinyrSgfoDVQaSn0GTc8OLsstXOR8tq/RI7MACheBt?=
 =?us-ascii?Q?75mnzTiaCmqGyYsExrk7rWgFF4o16f+ShP7i77xy5+IgmI0rxJ6fIoIqobN5?=
 =?us-ascii?Q?i6XKwdb904euZYehFwlwnWU3G14WGLGCn6yUVu2AkSSKX1q/CEZY/1d22s7V?=
 =?us-ascii?Q?bANYLSTJ9g3JwSo9hmI3kBvR7syMKXZjG0yOWal1WSUs80ElJGnM6uBNn+TR?=
 =?us-ascii?Q?tAg1W+W6u+hvFCJ4bss9BkObOpBZ7isF6Ar8Qy4AYKHx9m951I5W4d8cjsVm?=
 =?us-ascii?Q?YTEcnLtk7Q8AkTo0ZGPP3P103tMothScbC9Am8GIL9p1qOUR0dUXlraiT6t9?=
 =?us-ascii?Q?lnaK0Pq3FsSylL1NgXdb5HDJRnL2QcGtX+60/gdWC9gZoTsPnxNeBVrQV5Hx?=
 =?us-ascii?Q?FZvOLcTBUWF6XoaayD+tp6FoJ2RH9g3TqxjpPei6SSjPMloQtlwj9+Nb0wqz?=
 =?us-ascii?Q?6IA2vpqWhHQrCLi9GC4EEc4Q7jJe5iqQHiMwtZyYVdC6AoK0bodjiqEVLyOf?=
 =?us-ascii?Q?XsDIxHw5U8hk836jbnswE/awqzl6OAIFGQLDkUa9PU7vma4Mbt9B3Nb/mV7J?=
 =?us-ascii?Q?0AO/VdZAZELv4lGDn1D7A4nlc9VfVs+OX5d1P642KZZ6LvXrgQXQA6dnStli?=
 =?us-ascii?Q?DzkyHhcHVE/qK1ihGdjLQxLwhWhev+oyw6S3QQuLa4GSmofIQHR6XlX8ih31?=
 =?us-ascii?Q?J/zXYNS4YJH+UN/1I4OvzV4TICOkpVXH3aVoh3z5oQZxy6upJxdCY71WVcSS?=
 =?us-ascii?Q?MIjHNZ8u3thI22C74pttgVbM7TBSSXQxzsozVoY9OY/YiCzXhc/n9yiBJuD/?=
 =?us-ascii?Q?8ufbQ7IhRKR3+Gu4+JGq2ARMOZ5/nyb3w+2/8DcduFu1lSY07kNTjC/85QaS?=
 =?us-ascii?Q?O0Yhg+hgdrnG0x6R+NN6EZ2J/UP2CH5rhwnFWIHuAdqCfR0Zhee3P9BhZMOA?=
 =?us-ascii?Q?C8uPxcv7cuFuJYRKMfUykAfIjW5lchIzi0znMPkNdXQsfYYvn+yr5NkVBuzt?=
 =?us-ascii?Q?ojLaWDzFmLmumS7m7PtW/RMfLoI7kscUS3d4GLtbkFRnUYSibvFjbYR9lhiw?=
 =?us-ascii?Q?3FeBLAj93VtWGYJjSp0Enb4H5uwSigFpEUohYArjsLgKNZ8x0ki6bQqV6iuE?=
 =?us-ascii?Q?9zgJtR2Mo6VSs9U5gwvjAPta8YxsJW0F47YpFpRIutY1HZq6WweGYAnUGtu+?=
 =?us-ascii?Q?MyOqGQugqYahZcDtzIlzpldigpU1Zql2CkBmlmf+KwcbSaO3SuSMd07us3Zv?=
 =?us-ascii?Q?yJ3m39bKhksEPX2ORj5irLpND4lqJ2FICHU5p/wIA68n5dUaUtx2lbdogTjW?=
 =?us-ascii?Q?O2oEm47s1yKI63CrqbT8lj1lvyRfG5lysXwnE7LkNhLJMZ3kOEnJmdCtEUKe?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b71d83b-1b2d-41d4-4766-08dd092b6e33
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 06:20:29.4975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoHDp3eefj+ztlKQAhyzlEkxX9Gf71+ptPVlc7Mnb1o7abHfnBgk+IaoVl992K8yk5C+OjJ8kAMneRtNJLbZzR4eE8lwArFRQoLXgEJFclM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1100
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

This commit adds CRTC functions and helper functions
to the VS DRM subsystem,
enhancing support for display management and configurations.

Signed-off-by: keith zhao <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile  |   3 +-
 drivers/gpu/drm/verisilicon/vs_crtc.c | 241 ++++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_crtc.h |  42 +++++
 drivers/gpu/drm/verisilicon/vs_drv.h  |  41 +++++
 4 files changed, 326 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 842867dad4cb..37f6a4db2a12 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 vs_drm-objs := vs_dc_hw.o \
-	       vs_modeset.o
+	       vs_modeset.o \
+	       vs_crtc.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/verisilicon/vs_crtc.c
new file mode 100644
index 000000000000..45ce28960e27
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) VeriSilicon Holdings Co., Ltd.
+ *
+ */
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_print.h>
+
+#include "vs_crtc.h"
+#include "vs_drv.h"
+
+static void vs_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+					 struct drm_crtc_state *state)
+{
+	__drm_atomic_helper_crtc_destroy_state(state);
+	kfree(to_vs_crtc_state(state));
+}
+
+static void vs_crtc_reset(struct drm_crtc *crtc)
+{
+	struct vs_crtc_state *state;
+
+	if (crtc->state)
+		vs_crtc_atomic_destroy_state(crtc, crtc->state);
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return;
+
+	__drm_atomic_helper_crtc_reset(crtc, &state->base);
+}
+
+static struct drm_crtc_state *
+vs_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct vs_crtc_state *old_state;
+	struct vs_crtc_state *state;
+
+	if (!crtc->state)
+		return NULL;
+
+	old_state = to_vs_crtc_state(crtc->state);
+
+	state = kmemdup(old_state, sizeof(*old_state), GFP_KERNEL);
+		if (!state)
+			return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
+
+	return &state->base;
+}
+
+static int vs_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct vs_drm_device *priv = to_vs_drm_private(crtc->dev);
+	struct vs_dc *dc = &priv->dc;
+
+	dc_hw_enable_interrupt(&dc->hw);
+
+	return 0;
+}
+
+static void vs_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct vs_drm_device *priv = to_vs_drm_private(crtc->dev);
+	struct vs_dc *dc = &priv->dc;
+
+	dc_hw_disable_interrupt(&dc->hw);
+}
+
+static const struct drm_crtc_funcs vs_crtc_funcs = {
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.reset			= vs_crtc_reset,
+	.atomic_duplicate_state = vs_crtc_atomic_duplicate_state,
+	.atomic_destroy_state	= vs_crtc_atomic_destroy_state,
+	.enable_vblank		= vs_crtc_enable_vblank,
+	.disable_vblank		= vs_crtc_disable_vblank,
+};
+
+static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
+				  struct drm_atomic_state *state)
+{
+	struct vs_drm_device *priv = to_vs_drm_private(crtc->dev);
+	struct vs_dc *dc = &priv->dc;
+
+	struct vs_crtc_state *crtc_state = to_vs_crtc_state(crtc->state);
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	int id;
+
+	id = to_vs_display_id(crtc);
+	if (crtc_state->encoder_type == DRM_MODE_ENCODER_DSI) {
+		dc_hw_set_out(&dc->hw, OUT_DPI, id);
+		clk_set_rate(priv->clks[7].clk, mode->clock * 1000);
+		clk_set_parent(priv->clks[5].clk, priv->clks[7].clk);
+	} else {
+		dc_hw_set_out(&dc->hw, OUT_DP, id);
+		clk_set_parent(priv->clks[4].clk, priv->clks[6].clk);
+	}
+
+	dc_hw_enable(&dc->hw, id, mode, crtc_state->encoder_type, crtc_state->output_fmt);
+
+	enable_irq(priv->irq);
+
+	drm_crtc_vblank_on(crtc);
+}
+
+static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
+				   struct drm_atomic_state *state)
+{
+	struct vs_drm_device *priv = to_vs_drm_private(crtc->dev);
+	struct vs_dc *dc = &priv->dc;
+	int id;
+
+	drm_crtc_vblank_off(crtc);
+
+	disable_irq(priv->irq);
+
+	id = to_vs_display_id(crtc);
+	dc_hw_disable(&dc->hw, id);
+
+	if (crtc->state->event && !crtc->state->active) {
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+		spin_unlock_irq(&crtc->dev->event_lock);
+	}
+}
+
+static void vs_dc_set_gamma(struct vs_dc *dc, struct drm_crtc *crtc,
+			    struct drm_color_lut *lut, unsigned int size)
+{
+	u16 i, r, g, b;
+	u8 bits, id;
+
+	if (size != dc->hw.info->gamma_size) {
+		drm_err(crtc->dev, "gamma size does not match!\n");
+		return;
+	}
+
+	id = to_vs_display_id(crtc);
+
+	bits = dc->hw.info->gamma_bits;
+	for (i = 0; i < size; i++) {
+		r = drm_color_lut_extract(lut[i].red, bits);
+		g = drm_color_lut_extract(lut[i].green, bits);
+		b = drm_color_lut_extract(lut[i].blue, bits);
+		dc_hw_update_gamma(&dc->hw, id, i, r, g, b);
+
+		if (i >= dc->hw.info->gamma_size)
+			return;
+
+		dc->hw.gamma[id].gamma[i][0] = r;
+		dc->hw.gamma[id].gamma[i][1] = g;
+		dc->hw.gamma[id].gamma[i][2] = b;
+	}
+}
+
+static void vs_crtc_atomic_begin(struct drm_crtc *crtc,
+				 struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state,
+									  crtc);
+
+	struct drm_property_blob *blob = new_state->gamma_lut;
+	struct drm_color_lut *lut;
+	struct vs_drm_device *priv = to_vs_drm_private(crtc->dev);
+	struct vs_dc *dc = &priv->dc;
+	u8 id;
+
+	dc_hw_enable_shadow_register(dc, false);
+
+	id = to_vs_display_id(crtc);
+	if (new_state->color_mgmt_changed) {
+		if (blob && blob->length) {
+			lut = blob->data;
+			vs_dc_set_gamma(dc, crtc, lut,
+					blob->length / sizeof(*lut));
+			dc_hw_enable_gamma(&dc->hw, id, true);
+		} else {
+			dc_hw_enable_gamma(&dc->hw, id, false);
+		}
+	}
+}
+
+static void vs_crtc_atomic_flush(struct drm_crtc *crtc,
+				 struct drm_atomic_state *state)
+{
+	struct drm_pending_vblank_event *event = crtc->state->event;
+	struct vs_drm_device *priv = to_vs_drm_private(crtc->dev);
+	struct vs_dc *dc = &priv->dc;
+
+	if (event) {
+		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_arm_vblank_event(crtc, event);
+		crtc->state->event = NULL;
+		spin_unlock_irq(&crtc->dev->event_lock);
+	}
+
+	dc_hw_enable_shadow_register(dc, true);
+}
+
+static const struct drm_crtc_helper_funcs vs_crtc_helper_funcs = {
+	.atomic_check = drm_crtc_helper_atomic_check,
+	.atomic_enable	= vs_crtc_atomic_enable,
+	.atomic_disable = vs_crtc_atomic_disable,
+	.atomic_begin	= vs_crtc_atomic_begin,
+	.atomic_flush	= vs_crtc_atomic_flush,
+};
+
+struct vs_crtc *vs_crtc_create(struct drm_device *drm_dev,
+			       struct vs_dc_info *info)
+{
+	struct vs_crtc *crtc;
+	int ret;
+
+	if (!info)
+		return NULL;
+
+	crtc = drmm_crtc_alloc_with_planes(drm_dev, struct vs_crtc, base, NULL,
+					   NULL, &vs_crtc_funcs,
+					   info->name ? info->name : NULL);
+
+	drm_crtc_helper_add(&crtc->base, &vs_crtc_helper_funcs);
+
+	if (info->gamma_size) {
+		ret = drm_mode_crtc_set_gamma_size(&crtc->base,
+						   info->gamma_size);
+		if (ret)
+			return NULL;
+
+		drm_crtc_enable_color_mgmt(&crtc->base, 0, false,
+					   info->gamma_size);
+	}
+
+	return crtc;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.h b/drivers/gpu/drm/verisilicon/vs_crtc.h
new file mode 100644
index 000000000000..58aa7a77d94e
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_crtc.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_CRTC_H__
+#define __VS_CRTC_H__
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+
+#include "vs_type.h"
+
+struct vs_crtc_state {
+	struct drm_crtc_state base;
+
+	u32 output_fmt;
+	u8 encoder_type;
+	u8 bpp;
+};
+
+struct vs_crtc {
+	struct drm_crtc base;
+	struct device *dev;
+	u8 index;
+};
+
+static inline u8 to_vs_display_id(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct vs_crtc, base)->index;
+}
+
+struct vs_crtc *vs_crtc_create(struct drm_device *drm_dev,
+			       struct vs_dc_info *info);
+
+static inline struct vs_crtc_state *
+to_vs_crtc_state(struct drm_crtc_state *state)
+{
+	return container_of(state, struct vs_crtc_state, base);
+}
+
+#endif /* __VS_CRTC_H__ */
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/verisilicon/vs_drv.h
new file mode 100644
index 000000000000..dc6efb093205
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_drv.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_DRV_H__
+#define __VS_DRV_H__
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/reset.h>
+
+#include <drm/drm_fourcc.h>
+
+#include "vs_dc_hw.h"
+
+/*@pitch_alignment: buffer pitch alignment required by sub-devices.*/
+struct vs_drm_device {
+	struct drm_device base;
+	unsigned int pitch_alignment;
+	/* clocks */
+	unsigned int clk_count;
+	struct clk_bulk_data	*clks;
+	struct reset_control	*rsts;
+	struct vs_dc dc;
+	int irq;
+	struct regmap *dc_syscon_regmap;
+};
+
+static inline struct vs_drm_device *
+to_vs_drm_private(const struct drm_device *dev)
+{
+	return container_of(dev, struct vs_drm_device, base);
+}
+
+#ifdef CONFIG_DRM_INNO_STARFIVE_HDMI
+extern struct platform_driver starfive_hdmi_driver;
+#endif
+
+#endif /* __VS_DRV_H__ */
-- 
2.34.1

