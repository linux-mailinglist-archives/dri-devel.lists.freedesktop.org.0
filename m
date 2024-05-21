Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA2D8CA679
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 04:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D024410E4F7;
	Tue, 21 May 2024 02:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2106.outbound.protection.partner.outlook.cn [139.219.17.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D69810E465
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 02:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4k37yqLATooloVufU9q1vQdK/5p06x6JQggI7qoEYdhHFpE+MooIr8IyaWaBaSe/PmwXzkW3IM1yY05QgQRuZbbNb5QXpUuOciDoeQmiRe+hrTBd4qA0nNNbkpS+fHAQ3aHNH6Ot70lCFPedPL6jJQw08pJGNBbneKC1s/AzJUg5CAzQdR9KMfociS8/kUx+gjHlbJEP4GJqqeB02W6AgqfPZxBni3oF5ezrH1Zw/B54QUggvixrhs7QFcO02UktdaSvOzTZghSet5W5XWBlkFsqO8r7Os77qQ/R7k4I9rLhW9bkcpeY/PAgSrhZ2VQG9C1J48zb2YroDe1ERkr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkFPBug7fAvc3Hc9QKfOTgfWdoMaeaBBl7zHyK5APLc=;
 b=JnvjWNaawuUrynWaDUzemP/N+3maA3cqI6DrxMCBx/p39NiEgN17IGIdIHvgC8u5tJf5hdUBFp0JFzf7tOu4EsMbrkzoGRIhpOMwi2zzoYsmbzlcU0BDeklN3UIZHjy4cag1Arh7lNZmNytI8JFLPeOlI0ILkWC9xcyLdUjqoemW/DJV0kqww8J9pjbZmZ80dBy8fOsHBQesylsYsR4vmHM7HE1p6ljCdNUpGynR10h5lgwUVR3051p73Rep6al5/WsXpQPHTQ61IsSxKPx8LlwHhvOO2tShzPr6PecEq65BZsFyR1L3vXTMbngZe2L8i5zmC/J4KVFBbtmc1fPpnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) by ZQ0PR01MB1128.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 21 May
 2024 02:58:32 +0000
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 ([fe80::39be:8ed9:67b7:adc6]) by
 ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn ([fe80::39be:8ed9:67b7:adc6%6])
 with mapi id 15.20.7472.044; Tue, 21 May 2024 02:58:32 +0000
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
Subject: [PATCH v4 06/10] drm/vs: add vs plane api
Date: Tue, 21 May 2024 18:58:13 +0800
Message-Id: <20240521105817.3301-7-keith.zhao@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4aca330b-e8c7-4baa-8519-08dc7941e629
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RbBW4JOV0jDrrEqtZaHmNAB+e8CJmD1bwJl/lkI9W0g4a4150689rR9LkwKatrbZ7519OZIMw+SHdZzJ5n+8Bz24o/hyGCbDxNxDpmq6bisqjrkwOJF7KS9b6HFPKkJunqD4eJRU9wNZ3sqC1lVPixscEq862iCZlWvjEIG1Tc9jmcUfckRn5CpSAKq0C6QAJTcPLF3UOb3sw8Fh7oxkLVoKENxde7UaPiTmFyR3xVrnyM9lUiubkdIsgg2tcZlH/MHboxp3SLI0onDq8sovILtoh0zJ8+MmXnRbnm4WouUlyt10SpVr+zXRPLqn+6tv39LLx9JGS1LYXfyMKeu4aHxDvLWEnTD0r4w1hSQJJ4js1cGZ5hD43JTu16NIaG/46AMFyvRq+zQHklUuok/ALAA6nFixdybfuVlrLiUO16zGadkfhv5f+kgTWiV2OL5udK7PmJHBbobrXDhMbEToU/4dWwjIiM9SlIF+gO5ZzdcMh5mqqHitBc2KkLCe2EGw7j49wrTvARFDejZpVIOn2UbIcrRVJiqLGP+XJaIjrg3z6DDvqejWYOBrI7CZBIsmzF6sj97zS6c2FjCrDoLL0Jb70gfwK9XGQncOGIFEy2sK1/5Aj0/S1strvn346HFc2izLnOztBJGtwGJkV5s7ZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(41320700004)(52116005)(7416005)(1800799015)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ntqESfK8k82UsGJbZMJdNvs+7DR8OBt771VVlOdaoq8qoRazrhnDD3BkmTW2?=
 =?us-ascii?Q?zghNMspWdVNNdEEeoCKx5uxWE6w6UgUD25RfXokBmDCwNbKFqMHCFItfO3yA?=
 =?us-ascii?Q?VbhGqYcpE6vkU2GorFzt1/AWrGHm4PRtQB349/+zdbqjHNXut2PngsTLAdLf?=
 =?us-ascii?Q?jcCex/T5q5wI2o/6RjG9SBpfB4ly3Z0uPq8VaAnW1LrykiEw8cDxyMRitVRp?=
 =?us-ascii?Q?Wh+rXruYK2kdp35ja+LghEZAicuKjkni2518xSAiXvq7MhmIRIZ+WK1DRBbk?=
 =?us-ascii?Q?mACzd1mzNqJRxxT8YHf6/Xs6Ok+z2j5M/UB8x/e9w0M/wixCOXh1IkD5m8PU?=
 =?us-ascii?Q?kClreJuNdd8C6+V6XbEljWG5zdrhuE4BhZBxC/rjNMXW1AMML1xRLuk1dGb3?=
 =?us-ascii?Q?Kiq8vxCQftZlOnY8Z9IpynheGh21OUe9Rme7AQS4Iozw7jVow/M3rY7uFCeR?=
 =?us-ascii?Q?/hqatPle8t8UnhCxx4G08J9ZrtS2q3yFMuQHsZ5YVTvNl/gEKduJhjaQ3Z+A?=
 =?us-ascii?Q?KeX7fJPYAfFHeObHv7Au9BUE6aHdVxIofVcce330BOfISWDjoe2UCOTrIsEJ?=
 =?us-ascii?Q?CAMm+nKHLEWCmM9wkgjBlaKCGVDvynQzMO0C/zCVBZwu1OxdWZqsvjnWQIYU?=
 =?us-ascii?Q?mVMDxUZy5LfLEFiPjtF0xMJsBylZ1rPibBE6cjCBSYcMrjipHE2AteS+WtIL?=
 =?us-ascii?Q?TPQsdiQXGpY7Op5iFEGHEvvDUqIQuvtccOLT4E5I6U5JM3IXgsjEEGqysRz0?=
 =?us-ascii?Q?9zASlVXTGIOoDbVGu12YphsIRptqN6mMgENM8qVuMCtA1GR6KsLWvvV7qkKc?=
 =?us-ascii?Q?Faqwoi3M8NSF6FP6Hturt13BiVG4X5SnYGCor2De6L8Kdc1EloZW3TY8bIBu?=
 =?us-ascii?Q?NEz0ie7C3Q5GX4I8UOVZoDWXcPLrMPF3YW1P+IntQbs6bO1p4TyD9g/r2A1+?=
 =?us-ascii?Q?ZJYeUf0mw7zlLjf7GxPw3svdzOu1R1LDPADBsxcuyPPN/efipjW74btbTZIx?=
 =?us-ascii?Q?RuaenFOagYAcpQYD6+QFe5Me7HepW/11GPBl8C2VJQx5GL6w1oqdgXrFLo4A?=
 =?us-ascii?Q?eEmPqIE6cym4MaegIPpVK772FzT5C0htrqEt2Jox96a4bYOKqRFFbNXQt4nV?=
 =?us-ascii?Q?K984iQ6+Jf0J4Y+TjkHJeb9/2WnhU0wQ9pvvkmuaNrxO6f+Ed1zarLSKOn1X?=
 =?us-ascii?Q?yuCWS63k/5h+AKOF8sb1OJ6+NRwIUT97r5mX34aIiqA6A2AcNYIfod3oi/QJ?=
 =?us-ascii?Q?E3WDAzMO10ULvrj52Zo82ph+CLuyJmirx+fuxLyHUnE+76CYKuTX6ruY7W0Z?=
 =?us-ascii?Q?7Pd202aUpnWf90Z3jEVR/YZhPTQZiTBGoj/sKk6o7d697irFWITKW+vL6Pd8?=
 =?us-ascii?Q?yNM9C5G1fN8pfixIx9No+g2QuDsUavGg3QUZ8c/Q1Z8L1RJz9widP++6iVN8?=
 =?us-ascii?Q?krjLda2Fb3QktSPPrWdgjqNHRAUHyL3ZXHwnWdK/V1mOwCZx7e1urmcE0em5?=
 =?us-ascii?Q?3xaWrrtJXnYsYqbIoKVrpS9sPYNlIsI4GfTFwkcG/t9gXg3FNd9xfu0mZROz?=
 =?us-ascii?Q?duwYApzKIAshTGGK8vJPsbqzJcz4z5Sry6RBUVQkg90Z/UnBtCzw4/1PavEJ?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aca330b-e8c7-4baa-8519-08dc7941e629
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:58:32.2439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRCA/kseaVHpeCRkixBBNO74yRxIRWw/LZfFLrj2kXJbopAXpYkWluw6jCM+Y3X2g9LnZzUC9mPCUWRb6oGgr7mmcXeVVzHUAlpEMiMeE6I=
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

add plane funs and helper funs
add vs drm common struct and funs

Signed-off-by: keith <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile   |   3 +-
 drivers/gpu/drm/verisilicon/vs_drv.h   |  93 +++++
 drivers/gpu/drm/verisilicon/vs_plane.c | 487 +++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_plane.h |  26 ++
 4 files changed, 608 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 536091f37378..1c593b943261 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 vs_drm-objs := vs_dc_hw.o \
-		vs_modeset.o
+		vs_modeset.o \
+		vs_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/verisilicon/vs_drv.h
new file mode 100644
index 000000000000..d9f6efa7c8f9
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_drv.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
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
+#include <drm/drm_drv.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_managed.h>
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
+};
+
+static inline struct vs_drm_device *
+to_vs_drm_private(const struct drm_device *dev)
+{
+	return container_of(dev, struct vs_drm_device, base);
+}
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
+};
+
+static inline u8 to_vs_display_id(struct vs_dc *dc, struct drm_crtc *crtc)
+{
+	u8 panel_num = dc->hw.info->panel_num;
+	u32 index = drm_crtc_index(crtc);
+	int i;
+
+	for (i = 0; i < panel_num; i++) {
+		if (index == dc->crtc[i]->base.index)
+			return i;
+	}
+
+	return 0;
+}
+
+static inline struct vs_crtc_state *
+to_vs_crtc_state(struct drm_crtc_state *state)
+{
+	return container_of(state, struct vs_crtc_state, base);
+}
+
+struct vs_plane_state {
+	struct drm_plane_state base;
+	dma_addr_t dma_addr[DRM_FORMAT_MAX_PLANES];
+};
+
+struct vs_plane {
+	struct drm_plane base;
+	u8 id;
+};
+
+static inline struct vs_plane *to_vs_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct vs_plane, base);
+}
+
+static inline struct vs_plane_state *
+to_vs_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct vs_plane_state, base);
+}
+
+#endif /* __VS_DRV_H__ */
diff --git a/drivers/gpu/drm/verisilicon/vs_plane.c b/drivers/gpu/drm/verisilicon/vs_plane.c
new file mode 100644
index 000000000000..653f0ce72ed6
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_plane.c
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_plane_helper.h>
+
+#include "vs_plane.h"
+
+static void vs_plane_atomic_destroy_state(struct drm_plane *plane,
+					  struct drm_plane_state *state)
+{
+	struct vs_plane_state *vs_plane_state = to_vs_plane_state(state);
+
+	__drm_atomic_helper_plane_destroy_state(state);
+	kfree(vs_plane_state);
+}
+
+static void vs_plane_reset(struct drm_plane *plane)
+{
+	struct vs_plane_state *state;
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+
+	if (plane->state)
+		vs_plane_atomic_destroy_state(plane, plane->state);
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return;
+
+	state->base.zpos = vs_plane->id;
+	__drm_atomic_helper_plane_reset(plane, &state->base);
+}
+
+static struct drm_plane_state *
+vs_plane_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct vs_plane_state *state;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
+
+	return &state->base;
+}
+
+static bool vs_format_mod_supported(struct drm_plane *plane,
+				    u32 format,
+				    u64 modifier)
+{
+	int i;
+
+	/* We always have to allow these modifiers:
+	 * 1. Core DRM checks for LINEAR support if userspace does not provide modifiers.
+	 * 2. Not passing any modifiers is the same as explicitly passing INVALID.
+	 */
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		return true;
+
+	/* Check that the modifier is on the list of the plane's supported modifiers. */
+	for (i = 0; i < plane->modifier_count; i++) {
+		if (modifier == plane->modifiers[i])
+			break;
+	}
+
+	if (i == plane->modifier_count)
+		return false;
+
+	return true;
+}
+
+const struct drm_plane_funcs vs_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.reset			= vs_plane_reset,
+	.atomic_duplicate_state = vs_plane_atomic_duplicate_state,
+	.atomic_destroy_state	= vs_plane_atomic_destroy_state,
+	.format_mod_supported	= vs_format_mod_supported,
+};
+
+static unsigned char vs_get_plane_number(struct drm_framebuffer *fb)
+{
+	const struct drm_format_info *info;
+
+	if (!fb)
+		return 0;
+
+	info = drm_format_info(fb->format->format);
+	if (!info || info->num_planes > DRM_FORMAT_MAX_PLANES)
+		return 0;
+
+	return info->num_planes;
+}
+
+static bool vs_dc_mod_supported(const u64 *info_modifiers, u64 modifier)
+{
+	const u64 *mods;
+
+	if (!info_modifiers)
+		return false;
+
+	for (mods = info_modifiers; *mods != DRM_FORMAT_MOD_INVALID; mods++) {
+		if (*mods == modifier)
+			return true;
+	}
+
+	return false;
+}
+
+static int vs_primary_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
+	struct vs_dc *dc = &priv->dc;
+	struct drm_framebuffer *fb = new_state->fb;
+	const struct vs_plane_primary_info *primary_info;
+	struct drm_crtc_state *crtc_state;
+	int i;
+
+	if (!new_state->crtc || !new_state->fb)
+		return 0;
+	for (i = 0; i < dc->hw.info->primary_num; i++) {
+		primary_info = (struct vs_plane_primary_info *)&dc->hw.info->primary[i];
+		if (primary_info->id == to_vs_plane(plane)->id)
+			break;
+	}
+
+	primary_info = &dc->hw.info->primary[i];
+
+	if (fb->width < primary_info->min_width ||
+	    fb->width > primary_info->max_width ||
+	    fb->height < primary_info->min_height ||
+	    fb->height > primary_info->max_height)
+		drm_err_once(plane->dev, "buffer size may not support on plane%d.\n",
+			     to_vs_plane(plane)->id);
+
+	if (!vs_dc_mod_supported(primary_info->modifiers, fb->modifier)) {
+		drm_err(plane->dev, "unsupported modifier on plane%d.\n", to_vs_plane(plane)->id);
+		return -EINVAL;
+	}
+
+	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state, new_state->crtc);
+	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
+						   primary_info->min_scale,
+						   primary_info->max_scale,
+						   true, true);
+}
+
+static int vs_overlay_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
+	struct vs_dc *dc = &priv->dc;
+	struct drm_framebuffer *fb = new_state->fb;
+	const struct vs_plane_overlay_info *overlay_info;
+	struct drm_crtc_state *crtc_state;
+	int i;
+
+	if (!new_state->crtc || !new_state->fb)
+		return 0;
+
+	for (i = 0; i < dc->hw.info->overlay_num; i++) {
+		overlay_info = (struct vs_plane_overlay_info *)&dc->hw.info->overlay[i];
+		if (overlay_info->id == to_vs_plane(plane)->id)
+			break;
+	}
+
+	overlay_info = &dc->hw.info->overlay[i];
+
+	if (fb->width < overlay_info->min_width ||
+	    fb->width > overlay_info->max_width ||
+	    fb->height < overlay_info->min_height ||
+	    fb->height > overlay_info->max_height)
+		drm_err_once(plane->dev, "buffer size may not support on plane%d.\n",
+			     to_vs_plane(plane)->id);
+
+	if (!vs_dc_mod_supported(overlay_info->modifiers, fb->modifier)) {
+		drm_err(plane->dev, "unsupported modifier on plane%d.\n", to_vs_plane(plane)->id);
+		return -EINVAL;
+}
+
+	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state, new_state->crtc);
+	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
+						   overlay_info->min_scale,
+						   overlay_info->max_scale,
+						   true, true);
+}
+
+static int vs_cursor_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
+	struct vs_dc *dc = &priv->dc;
+	struct drm_framebuffer *fb = new_state->fb;
+	const struct vs_plane_cursor_info *cursor_info;
+	struct drm_crtc_state *crtc_state;
+	int i;
+
+	if (!new_state->crtc || !new_state->fb)
+		return 0;
+
+	for (i = 0; i < dc->hw.info->cursor_num; i++) {
+		cursor_info = (struct vs_plane_cursor_info *)&dc->hw.info->cursor[i];
+		if (cursor_info->id == to_vs_plane(plane)->id)
+			break;
+	}
+
+	cursor_info = &dc->hw.info->cursor[i];
+
+	if (fb->width < cursor_info->min_width ||
+	    fb->width > cursor_info->max_width ||
+	    fb->height < cursor_info->min_height ||
+	    fb->height > cursor_info->max_height)
+		drm_err_once(plane->dev, "buffer size may not support on plane%d.\n",
+			     to_vs_plane(plane)->id);
+
+	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state, new_state->crtc);
+	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   true, true);
+}
+
+static void vs_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
+
+	unsigned char i, num_planes, display_id, id;
+	u32 format;
+	bool is_yuv;
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+	struct vs_plane_state *plane_state = to_vs_plane_state(new_state);
+	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
+	struct vs_dc *dc = &priv->dc;
+
+	if (!new_state->fb || !new_state->crtc)
+		return;
+
+	drm_fb_dma_sync_non_coherent(plane->dev, old_state, new_state);
+
+	num_planes = vs_get_plane_number(new_state->fb);
+
+	for (i = 0; i < num_planes; i++) {
+		dma_addr_t dma_addr;
+
+		dma_addr = drm_fb_dma_get_gem_addr(new_state->fb, new_state, i);
+		plane_state->dma_addr[i] = dma_addr;
+	}
+
+	display_id = to_vs_display_id(dc, new_state->crtc);
+	format = new_state->fb->format->format;
+	is_yuv = new_state->fb->format->is_yuv;
+	id = vs_plane->id;
+
+	plane_hw_update_format_colorspace(dc, format, new_state->color_encoding, id, is_yuv);
+	if (new_state->visible)
+		plane_hw_update_address(dc, id, format, plane_state->dma_addr,
+					new_state->fb, &new_state->src);
+	plane_hw_update_format(dc, format, new_state->color_encoding, new_state->rotation,
+			       new_state->visible, new_state->zpos, id, display_id);
+	plane_hw_update_scale(dc, &new_state->src, &new_state->dst, id,
+			      display_id, new_state->rotation);
+	plane_hw_update_blend(dc, new_state->alpha, new_state->pixel_blend_mode,
+			      id, display_id);
+}
+
+static void vs_cursor_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
+	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
+	struct vs_dc *dc = &priv->dc;
+	unsigned char display_id;
+	u32 crtc_w, crtc_x, crtc_y;
+	s32 hotspot_x, hotspot_y;
+	dma_addr_t dma_addr;
+
+	display_id = to_vs_display_id(dc, new_state->crtc);
+
+	if (!new_state->fb || !new_state->crtc)
+		return;
+
+	drm_fb_dma_sync_non_coherent(new_state->fb->dev, old_state, new_state);
+	dma_addr = drm_fb_dma_get_gem_addr(new_state->fb, new_state, 0);
+	crtc_w = new_state->crtc_w;
+
+	if (new_state->crtc_x > 0) {
+		crtc_x = new_state->crtc_x;
+		hotspot_x = 0;
+	} else {
+		hotspot_x = -new_state->crtc_x;
+		crtc_x = 0;
+	}
+	if (new_state->crtc_y > 0) {
+		crtc_y = new_state->crtc_y;
+		hotspot_y = 0;
+	} else {
+		hotspot_y = -new_state->crtc_y;
+		crtc_y = 0;
+	}
+	dc_hw_update_cursor(&dc->hw, display_id, dma_addr, crtc_w, crtc_x,
+			    crtc_y, hotspot_x, hotspot_y);
+}
+
+static void vs_plane_atomic_disable(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
+	struct vs_dc *dc = &priv->dc;
+
+	dc_hw_disable_plane(dc, vs_plane->id);
+}
+
+static void vs_cursor_plane_atomic_disable(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
+	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
+	struct vs_dc *dc = &priv->dc;
+	unsigned char display_id;
+
+	display_id = to_vs_display_id(dc, old_state->crtc);
+	dc_hw_disable_cursor(&dc->hw, display_id);
+}
+
+const struct drm_plane_helper_funcs primary_plane_helpers = {
+	.atomic_check	= vs_primary_plane_atomic_check,
+	.atomic_update	= vs_plane_atomic_update,
+	.atomic_disable = vs_plane_atomic_disable,
+};
+
+const struct drm_plane_helper_funcs overlay_plane_helpers = {
+	.atomic_check	= vs_overlay_plane_atomic_check,
+	.atomic_update	= vs_plane_atomic_update,
+	.atomic_disable = vs_plane_atomic_disable,
+};
+
+const struct drm_plane_helper_funcs cursor_plane_helpers = {
+	.atomic_check	= vs_cursor_plane_atomic_check,
+	.atomic_update	= vs_cursor_plane_atomic_update,
+	.atomic_disable = vs_cursor_plane_atomic_disable,
+};
+
+struct vs_plane *vs_plane_primary_create(struct drm_device *drm_dev,
+					 struct vs_plane_primary_info *info,
+					 unsigned int layer_num,
+					 unsigned int possible_crtcs)
+{
+	struct vs_plane *plane;
+	int ret;
+
+	if (!info)
+		return NULL;
+
+	plane = drmm_universal_plane_alloc(drm_dev, struct vs_plane, base,
+					   possible_crtcs,
+					   &vs_plane_funcs,
+					   info->formats, info->num_formats,
+					   info->modifiers, DRM_PLANE_TYPE_PRIMARY,
+					   NULL);
+	if (IS_ERR(plane))
+		return ERR_CAST(plane);
+
+	drm_plane_helper_add(&plane->base, &primary_plane_helpers);
+
+	drm_plane_create_alpha_property(&plane->base);
+	drm_plane_create_blend_mode_property(&plane->base,
+					     BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					     BIT(DRM_MODE_BLEND_PREMULTI) |
+					     BIT(DRM_MODE_BLEND_COVERAGE));
+
+	if (info->color_encoding) {
+		ret = drm_plane_create_color_properties(&plane->base, info->color_encoding,
+							BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+							DRM_COLOR_YCBCR_BT709,
+							DRM_COLOR_YCBCR_LIMITED_RANGE);
+		if (ret)
+			return NULL;
+	}
+
+	if (info->rotation) {
+		ret = drm_plane_create_rotation_property(&plane->base,
+							 DRM_MODE_ROTATE_0,
+							 info->rotation);
+		if (ret)
+			return NULL;
+	}
+
+	ret = drm_plane_create_zpos_property(&plane->base, info->zpos, 0, layer_num - 1);
+	if (ret)
+		return NULL;
+
+	return plane;
+}
+
+struct vs_plane *vs_plane_overlay_create(struct drm_device *drm_dev,
+					 struct vs_plane_overlay_info *info,
+					 unsigned int layer_num,
+					 unsigned int possible_crtcs)
+{
+	struct vs_plane *plane;
+	int ret;
+
+	if (!info)
+		return NULL;
+
+	plane = drmm_universal_plane_alloc(drm_dev, struct vs_plane, base,
+					   possible_crtcs,
+					   &vs_plane_funcs,
+					   info->formats, info->num_formats,
+					   info->modifiers, DRM_PLANE_TYPE_OVERLAY,
+					   NULL);
+	if (IS_ERR(plane))
+		return ERR_CAST(plane);
+
+	drm_plane_helper_add(&plane->base, &overlay_plane_helpers);
+
+	drm_plane_create_alpha_property(&plane->base);
+	drm_plane_create_blend_mode_property(&plane->base,
+					     BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					     BIT(DRM_MODE_BLEND_PREMULTI) |
+					     BIT(DRM_MODE_BLEND_COVERAGE));
+
+	if (info->color_encoding) {
+		ret = drm_plane_create_color_properties(&plane->base, info->color_encoding,
+							BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+							DRM_COLOR_YCBCR_BT709,
+							DRM_COLOR_YCBCR_LIMITED_RANGE);
+		if (ret)
+			return NULL;
+	}
+
+	if (info->rotation) {
+		ret = drm_plane_create_rotation_property(&plane->base,
+							 DRM_MODE_ROTATE_0,
+							 info->rotation);
+		if (ret)
+			return NULL;
+	}
+
+	ret = drm_plane_create_zpos_property(&plane->base, info->zpos, 0, layer_num - 1);
+	if (ret)
+		return NULL;
+
+	return plane;
+}
+
+struct vs_plane *vs_plane_cursor_create(struct drm_device *drm_dev,
+					struct vs_plane_cursor_info *info,
+					unsigned int possible_crtcs)
+{
+	struct vs_plane *plane;
+	int ret;
+
+	if (!info)
+		return NULL;
+
+	plane = drmm_universal_plane_alloc(drm_dev, struct vs_plane, base,
+					   possible_crtcs,
+					   &vs_plane_funcs,
+					   info->formats, info->num_formats,
+					   NULL, DRM_PLANE_TYPE_CURSOR,
+					   NULL);
+	if (IS_ERR(plane))
+		return ERR_CAST(plane);
+
+	drm_plane_helper_add(&plane->base, &cursor_plane_helpers);
+
+	ret = drm_plane_create_zpos_immutable_property(&plane->base, info->zpos);
+	if (ret)
+		return NULL;
+
+	return plane;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
new file mode 100644
index 000000000000..0416146226a8
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_plane.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_PLANE_H__
+#define __VS_PLANE_H__
+
+#include <drm/drm_plane_helper.h>
+
+#include "vs_drv.h"
+
+struct vs_plane *vs_plane_primary_create(struct drm_device *drm_dev,
+					 struct vs_plane_primary_info *info,
+					 unsigned int layer_num,
+					 unsigned int possible_crtcs);
+
+struct vs_plane *vs_plane_overlay_create(struct drm_device *drm_dev,
+					 struct vs_plane_overlay_info *info,
+					 unsigned int layer_num,
+					 unsigned int possible_crtcs);
+
+struct vs_plane *vs_plane_cursor_create(struct drm_device *drm_dev,
+					struct vs_plane_cursor_info *info,
+					unsigned int possible_crtcs);
+#endif /* __VS_PLANE_H__ */
-- 
2.27.0

