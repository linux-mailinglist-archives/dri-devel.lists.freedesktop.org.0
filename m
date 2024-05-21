Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521908CA67C
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 04:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2579610E52C;
	Tue, 21 May 2024 02:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2106.outbound.protection.partner.outlook.cn [139.219.17.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E70F10E228
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 02:58:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Poyf+Cu75sIK8pyVfbXwJ8VN1zgJhhA4f3hO7dI8keNDkEzm6T24Jjx/A9apgS9tIRajWE0wRRQ9h5IO3SIuShIKfNb+lFyEWvltv7Te13hejGaDBTxF5UP30t0gF1xmLN3eWsaUuGC4fB2QzMYpLKV1/ILW0HqsHkB5XGqgaNUuh/XwEtIEmOqFd50Q9YCgrZ/vWlIZhphkFI3pCFONqQ4+S1mD6fkmlTH1u1Zgkb9lL/WZYURedi2T+Z0u4tF0Molt/yyPP8nQhOcd4HBABM8k2xLtBeL7FzMh8vvDcpQUgi3LMiCLKQqioOqWenOpLWX1ooCfSE3LGrf0sYGAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFrygtI1BCGEewVkP9fmPC8AE5wzJFZ2jbPDfi3E2f0=;
 b=C/WIKgrandmjF6yJGhztuDOp5f+YyH5QfVkfavRsUR3IVyc4SYkMukiRPY71zLYhxDBq4rnoUwfRJDzIere9o0yZEiK42XutedkN89bHxxc6Ci4NQyuNFVrIQumne8dc+IoVwOtjVLj6zD5rTFI0VOaJEHMiJHdw6HxIv3VJcjk9HKvw5LlHFYFW5cpyEXmV3ScG4LmGmox1yF5qyzZapMpFU/9+Dt7p4/pQxiIx9mm/DSIaw+U1AeLe36le7TRfxqnIoR+haBxXMlG9SFsGI010qJa8N4jS9OwkJ6N4TnWKqerErK5Kqnkjxoe9FSmfk53vkaHR2AlmbxljjmLBxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) by ZQ0PR01MB1128.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 21 May
 2024 02:58:33 +0000
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 ([fe80::39be:8ed9:67b7:adc6]) by
 ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn ([fe80::39be:8ed9:67b7:adc6%6])
 with mapi id 15.20.7472.044; Tue, 21 May 2024 02:58:33 +0000
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
Subject: [PATCH v4 07/10] drm/vs: add ctrc fun
Date: Tue, 21 May 2024 18:58:14 +0800
Message-Id: <20240521105817.3301-8-keith.zhao@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5f8686af-1db6-41ac-4c08-08dc7941e6d8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sYJmhHDbFhxdupu8bGo/sSEEV7VhfLSEIY/V5uAzuZ7BppLsvEkde90V5TBfhsAi/Fp1S4qDMz3AX904osCjC6ajIwRrRREvjEew9zuKV7OJZcP51DgQ+8AC/V2TBSlcVclab1oMi4Ra13wPK2f1Gu/tCjYke8YGWY6LgL3VmbsfHqWnhj3Hr5u2XBrybVWFUYuCNjgjg3/gQqdxs+sdK5uzLX3d3mblSOYN8xm1waEIOnmc0xUog6RbMHeIgRIKq92AYB93p4BFu6HzrwjGbm8EjEqMAquXMk4dETqi51MJpevqWYumdcml5Ib4anFQe5K8GVv+hZw1g67M8rcVL3fXRE68tJ1/1DAIhrvcwxGCAxpkdkn/XFaQ72GMID1ORE2jb4gzMo+Zu+YmNbvalaofriUboI99PwZFKvVv2+f2kujnGJqYSnmNAC0gToFMd1XkhyiGunnSkZFfG3KHsfyYlsiuVKtkVusr+zIf56Uq4vDxVwX0CGj9S5sn2QD8w84swyKbEXxHNmzGF5Bydxb4x0hnvymPnGg81iApHRJFbGn7VodGqKMgArHxDZ0sbzRY105q/RRjI9DxkL/Z7jMJCe4TaArrgpziEYD+hGcc9wGFiZYvLAazmQBXFCYuGQWE8v9QPInxGUtScAKPgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(41320700004)(52116005)(7416005)(1800799015)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pUXU3+OSC5pFeweOB3HNTRsyOclwSXskNZZ2zHNZDtb9AfrJpZmTiyQgtoNw?=
 =?us-ascii?Q?9HT8C8zlRppI6bk64zmwpisJYBYgJqGpTKhLoU0a+cyRl4lMDoHg9jeHX3he?=
 =?us-ascii?Q?WpXPSYT+Yb6ir8TSTZ0RD9LI5wFUPvg/hzJcqOKj9UCVsxIK2C1KLCBCWMGt?=
 =?us-ascii?Q?zpag2AKkMGaD34oxJIANVl5RUFrUmOjClcbA1RE1R06nXg7FVnHG6DBeysSx?=
 =?us-ascii?Q?oPNpWulxOulOUPNJu/RYUjIBUEOe9aMvmLENIvv+c+xnoZLzZ++6cOVX7/gm?=
 =?us-ascii?Q?c6/YEjf9oLxqm3rxgmvOA5eFaO/DAixhfuStJa0k0HAsZNAJiMe0JWmDdaqo?=
 =?us-ascii?Q?c/ZQOauCN9+pUNdLHZyK4mcaXmMhvgZHq0NHtB+2IIWGvoazL0vUfnYhFS0h?=
 =?us-ascii?Q?KGNCVQjX5hsflN2mI1qXoNH5TpjtnS7rKdzJ7SkZJc2t8DtT1YgGF3qhAPMl?=
 =?us-ascii?Q?HajNkOH/MOsAabF4L14fnE7XsrGW/LJDYrXivylAWf+n6RYXPr2uiLHkKsEK?=
 =?us-ascii?Q?S1DEmvv3cN5FZ8pSAq/4C6bfWm+2yc7TQDPLf9u9CIpTSnmgxPTsdtiNm20n?=
 =?us-ascii?Q?1qfhb/OkfBizwF5I0GTsFP2wIhX39VvPmUoX6/gQV9/miAG90wBG52ml+OYa?=
 =?us-ascii?Q?ETXUrIbFA2fxes9HZ2MgqaoIfeYG98NRWTvS49fp8H8IVDSeX5wriGcK2mBy?=
 =?us-ascii?Q?Ap7aQpsQ1uoh7n15M12oAKTOFrl5VEO06lrPUn8sv3SYFYvKD4xaKn0mUWBN?=
 =?us-ascii?Q?o2apXJXNyElpEiaKYP07HsEaZ9ryVIQ7E34NsufCgE9cYMDKt1/2fhC25Ab6?=
 =?us-ascii?Q?EjdcEt2ETeS1nWN8Jq2k8IWq+25G9bR6Se9kQiVdEXfVpKAcOoJqNIgMi1oF?=
 =?us-ascii?Q?9XSZpHTB/vv2CZi0DZL/q5qH7K1KBYO42h3q9S3r1uFzwDLOh2TpVJUuWIDD?=
 =?us-ascii?Q?3sBmXm9Neu5wjZ3xVFQnpPsYFrTCCpzBaqO6zSoQjzK0qZ4JB73Avd4k1f5a?=
 =?us-ascii?Q?iRbENL/MrU92w7TaSj/c8k0GcuGUNHKp5hZTNonGIhn1HBBeTryulJxiTNhB?=
 =?us-ascii?Q?HgIXZYC6xZSPL0+Mz0Ah9QGJ7Cp3li3cRNLNau82oZwWFp+LrWfB8uZVINFN?=
 =?us-ascii?Q?xQh2AXBzvYjjMf5jnZsjWUkBSDI/Lnl8Xwdrk3S844X8c37kqt7L+Gn9P+r3?=
 =?us-ascii?Q?I9Rim63VrdsdmIkBFieP71SJeG1E28NTDCpiQfEhsGo149wdRrjjgl+/LPQ6?=
 =?us-ascii?Q?2oj2towjFEXlGeVyN8Pn77J5I6bvm3Y8h8dCuOPXECBbS8byZXhuIjGpxUWf?=
 =?us-ascii?Q?hfMuJbpahMNVNI2bMft5V28Z3u9E/KKM88k8vGAhDKzmxxp68CKoJtnrGcl+?=
 =?us-ascii?Q?gYg0XUx/21UKf21+5HfgVX9/LnnA8gn2Ld0q9J3XFE2VSExDhlyN0j6qbtJV?=
 =?us-ascii?Q?4vy3dGgiVxKMP3Oqnk15PNvTzEFZcDD6e0005nKkKr9pYczdi4INFMUUN2Dn?=
 =?us-ascii?Q?Hx+VIukcuOaMhpQMHWcdmQ3KQbW43nBUf2HzDkpUE/LBBdzjsTKwyiAmPA1C?=
 =?us-ascii?Q?DDCoioC5TKOoUPqrKs83sj3ZKPn0649Fh4jd8VTWp1fPVsZ7lMrKyjvMRm7B?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8686af-1db6-41ac-4c08-08dc7941e6d8
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:58:33.3375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyMIkt9DJLTPYoL7mjzNUV0tu4Az8vAuA28BECwnkH79NjgtRNKa2C1KfFH+6FYx7RUEpH82XRpsMuNi/X9VdBBZdouTuo9YraNunHIGhIc=
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

add crtc funs and helper funs

Signed-off-by: keith <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile  |   3 +-
 drivers/gpu/drm/verisilicon/vs_crtc.c | 241 ++++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_crtc.h |  17 ++
 3 files changed, 260 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 1c593b943261..26a43ca0fd36 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -2,6 +2,7 @@
 
 vs_drm-objs := vs_dc_hw.o \
 		vs_modeset.o \
-		vs_plane.o
+		vs_plane.o \
+		vs_crtc.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/verisilicon/vs_crtc.c
new file mode 100644
index 000000000000..ea7640a63c28
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ *
+ */
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "vs_crtc.h"
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
+	id = to_vs_display_id(dc, crtc);
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
+	id = to_vs_display_id(dc, crtc);
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
+	id = to_vs_display_id(dc, crtc);
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
+	id = to_vs_display_id(dc, crtc);
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
+	dc_hw_enable_shadow_register(dc, false);
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
index 000000000000..b1e588bb780d
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_crtc.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_CRTC_H__
+#define __VS_CRTC_H__
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+
+#include "vs_drv.h"
+
+struct vs_crtc *vs_crtc_create(struct drm_device *drm_dev,
+			       struct vs_dc_info *info);
+
+#endif /* __VS_CRTC_H__ */
-- 
2.27.0

