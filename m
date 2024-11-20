Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129369D33A2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 07:35:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C13810E39D;
	Wed, 20 Nov 2024 06:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2099.outbound.protection.partner.outlook.cn [139.219.17.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A7910E39C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 06:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OB6YWciTzikfotso/eYbMHfr9iY6/eR+h40VdcYjyK1WhFEqC8y73q8zOs3q/SgDNT1IgiIGGiEb5tEI0zFUW8fDHmdC19Jxhn2bjcG7StiZHOuQD/7wqrHnVeL8gleVenRO3C0zlwJjsj8vHZrvzCMaxC8gPiwcRkoPJVHheAAPxyem817X1/F+hUIzNFZ7+RdIIyuwRE1B+I9Ip6IhdmUSJKn7sKmN+33G9MrsAsWaepEKnf2Htx4sbdFUk+UichCaNQpoKAGhr74NJqJYgPwSIUxotQmYgbLDXeWVwZjEt7tmJpWxp4Sosjfgv5chobBF1SxlvPxB0Qru/6dT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqM6ntSl4veeoRqNEUszbjGXrqVjXYlAoA9Ir7wO2uE=;
 b=ayEcU5WIKn1xeFxqcJ9ZM3bQsLh7XNxdq/IbM82k0lXLTyhuGjbt2pVDINy9ph00HcKbzfc0aqIYsJfEEQ8z4jId2HFE0l5DdegbxZvyKjNhdM/bpLD0aY2+WW2BoaxpJl9Mwoy105JxAfoCeAOneTRjXtNgeexyxv8Jo7l83q3ZZgBq/IlOodQX7WqDVv4MzLb9s8OyQs1unQfd+kdQwRLIz+qFG6NcWwZMuJfZrjLuVV2Xl7aBH7wKMAroeTtIThqB4G4A4PVyXQNF6rgzcYYvNIytl7+Ucn2KIzAHNpjzMt/y7vh3Os26e3mmLiIWwOSTs+Sjwxfn6Qy8Zg4hdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6) by NTZPR01MB1100.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 06:20:32 +0000
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 ([fe80::512d:38d7:ed9f:dfbe]) by
 NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn ([fe80::512d:38d7:ed9f:dfbe%4])
 with mapi id 15.20.8158.023; Wed, 20 Nov 2024 06:20:31 +0000
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
Subject: [PATCH v5 7/9] drm/vs: Add VS Plane API
Date: Wed, 20 Nov 2024 14:18:46 +0800
Message-Id: <20241120061848.196754-8-keith.zhao@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2f00cf77-3bdb-46ac-7a15-08dd092b6f71
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|41320700013|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: 3q5XL3hSlmnDOU6Uoc3Ga6Ul+J62Mt6xGeWBhP6xJ2QBXtQgvTTPsByZHIcumLmpEAAF7uToubRd1htYkrlV1x4JvwxfDVwMth0q41draPLkHmYzSnMnBAu+55LsPUah/MB9/5EOK/oET33yO+uuxps1irdmW5RolO43lBg/X2r1s7oHZnPspVymaAIlVFtRMtbuGR+LFUqmIT2Xsiwoi1A7fh6aCBVPeQ1do3NF3YofynY3a9PmpziHjr9NiRXm/kNe0IDLl+stSgCtTaiMmk+UxFsawhpnkshdUUApWbzf3XOp8NwBbpl8tr+TAgcms6fNlGNgf4KNKqLYEq7wwqbM8eR0r5yV1SIkKIDymO9PU7KML+4eRvB0AUVBPCnEDwS2vr5xwyIRk4Lni7RxfwQf0DSLF4M6nFdYs7XS6frXAtycpN9DnHNk5AAZIRAh+wtT3NQQnW5aaIso79J+h/XPZlReVmQy8JvUAHRlvfKzwwJVY1MWAcJGtj5QcNelRArkiw0HQgOHxsCpSHa7RsNW+cXtpbEzLRAz3Cl7F/y+ANoz7uITqI/eZEwVfUfUl71q8LzJ2zucCkZAAOAkhMhHRArN84UUVDyhFqq5iu1+XMPhNDmLUPalhisuZ/ri
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(41320700013)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5LEIF6yvKnWIcLMeFFfr8HaXP9EY4p0qVH0mJ9qQTGRijXW5/msB7I6txeMT?=
 =?us-ascii?Q?Pu8VSRgzp+fpA4y6/tufyy08BOO8VHEX5v1HP0xVRDBQGkB2mBqomEyEeIwb?=
 =?us-ascii?Q?2tJ/WChJ8NCpDsGBhGValFH1DYQwDzLjLu82SegP8on4Bj9NMNpJgOpHK997?=
 =?us-ascii?Q?gsHtDggeuxZYc8pod2N4lmSs5GTBKuNQo4lwqQzPrCXAqdZM6I4P2wgdtflz?=
 =?us-ascii?Q?HNutO3kaHBQZxTjHTfRX6E93w07lUeFpoVBkgOyBYIPTdM8MnLQ5hYANUPhc?=
 =?us-ascii?Q?SZ88z6ADH9/qqIUi2CWAqfMSPIg9oyCV/alCRLhxl4heQn/qhatOM1KGKDA2?=
 =?us-ascii?Q?ZMJHtLcMOoKIm9yZRGX47U8HsLUIT9B4M0ypmwnjfEugvFaAIXiE4Mq2BEBJ?=
 =?us-ascii?Q?eql4sI0yCajdjvnO9aIQzKqf19BPqM2mBbk/miObFEhfZc4yWqmMjBXonIFD?=
 =?us-ascii?Q?/4Hi2Vm4ZX90/LYManWM22kSgUi2bGv1Jx9tPoJmWKC3u5nLxlA1ypywXZMS?=
 =?us-ascii?Q?E4tBZAPz98h3j6rRv+sKO+dqrPsU04CoibaOTzTeLf0OZ0uoepNL1crB9FA4?=
 =?us-ascii?Q?cQc/PJ27jjEqtDnmDAeB7dky9/29gmnyyfob9dzwGcInjqk5BEiwMhjNua/6?=
 =?us-ascii?Q?mnICQY9PF4OTqFUOQsZhB4QWASr8kLAKLRbCj4afV5gMDDfKTiBrGC3eBKx3?=
 =?us-ascii?Q?qMSfTTHvi8IxVSK6GdsGgwu09Mg9GLqaPce6VD1mADws+QR5WfCrsl10zfma?=
 =?us-ascii?Q?RzdnjjZDb08Nd+f7KfYrMzzB2VaaeTwtYmI3RVmfAqXvPvR55tLo1/LYAdlf?=
 =?us-ascii?Q?2EESaci8lBqtAjRuMjaW4lxTs6OXN7LlyUYqwUH4iHQGnr+6HS5h8KBqBChq?=
 =?us-ascii?Q?O3kJ73hMJzUuk8rFTyUbptj8gURduHjGFYHAYCx9oh0oa9KpQH1bPo++s1WN?=
 =?us-ascii?Q?+pKWe2rR51t1NMHJdbSSRtE45fp5hnD+belqJS5dND89o6JJRw1qH8/XCY4a?=
 =?us-ascii?Q?dBwvMM5suPHyKDhXyeTaOKJaOU4eTR4pF9qtRyGrVwqfBwZhaUv0iJTZmlHY?=
 =?us-ascii?Q?uNF+3OchrmvvwO+FCGwFpHmU+tudUDqtk2k/GLkWOs0vVVt1whSA+Xo9foaO?=
 =?us-ascii?Q?RFIYRRaKgpokDqv4h4JNn3CcdBT33958IK71emkXCfQ2LbRtNPJZDqrLnMTk?=
 =?us-ascii?Q?rMg8uuti+h+mS0dlVkIe9h0ydU+zw2fasvdUjuIGsgvGgdguZA1smdT3m1CR?=
 =?us-ascii?Q?QYB7kZ1ybLA5zhS5nPglTkNObO/yCOZW0HRBNIzXy/7Wk+/CKRWIdSGI9/pG?=
 =?us-ascii?Q?5HnYr8FzeCgqmQaC7FLp8zyF9gijNIqUf2sA8MG2UX41ikgNQlln9pnQsQ2z?=
 =?us-ascii?Q?MEWoTor8sSJ+ADTQyE73QkB+VtxtoXMIXwFFesCDK+l/oEnw+vOfH2KsHzIo?=
 =?us-ascii?Q?JwudBtQrbYMUYCsDVwFI0/6Kl3CBeXaXJYOe8lyUOm4gOqu6pFm6s/5Pw7vH?=
 =?us-ascii?Q?qpR9BFEpPGB/TbTPQPFi1x2qJtxjXG6BAwJF1Eszlgt8wv8cUjm2+jW/LEiL?=
 =?us-ascii?Q?s+BMRCnTk8DnKjz/NzJmfM1y3iCNVedwbD9H5de+8ZChkK+DTTkMZWfEzlcy?=
 =?us-ascii?Q?qA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f00cf77-3bdb-46ac-7a15-08dd092b6f71
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 06:20:31.5861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFb+TDAwunqe7DozjwDFecyqaBr81sEli46f0RxqsAAv5ryzpMaSfHic0WRN8K1gA8DMlSgNprbaWWpsVNPqMQBOZv81lq0n6/rB1Z3ekfc=
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

This commit introduces plane functions and helper functions
for the VS DRM subsystem, enhancing support for managing
display planes and their configurations.

Signed-off-by: keith zhao <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile   |   3 +-
 drivers/gpu/drm/verisilicon/vs_plane.c | 358 +++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_plane.h |  27 ++
 3 files changed, 387 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 37f6a4db2a12..1a0e46f38ae8 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -2,6 +2,7 @@
 
 vs_drm-objs := vs_dc_hw.o \
 	       vs_modeset.o \
-	       vs_crtc.o
+	       vs_crtc.o \
+	       vs_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/vs_plane.c b/drivers/gpu/drm/verisilicon/vs_plane.c
new file mode 100644
index 000000000000..ba47d0185fc6
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_plane.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) VeriSilicon Holdings Co., Ltd.
+ */
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_plane_helper.h>
+
+#include "vs_plane.h"
+#include "vs_drv.h"
+#include "vs_crtc.h"
+
+static inline struct vs_plane_state *
+to_vs_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct vs_plane_state, base);
+}
+
+static inline struct vs_plane *to_vs_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct vs_plane, base);
+}
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
+
+	if (plane->state)
+		vs_plane_atomic_destroy_state(plane, plane->state);
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return;
+
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
+static const struct drm_plane_funcs vs_plane_funcs = {
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
+static bool vs_dc_mod_supported(const struct vs_plane_info *vs_info, u64 modifier)
+{
+	const u64 *mods;
+
+	if (vs_info->type == DRM_PLANE_TYPE_CURSOR)
+		return 0;
+
+	if (!vs_info->data->modifiers)
+		return false;
+
+	for (mods = vs_info->data->modifiers; *mods != DRM_FORMAT_MOD_INVALID; mods++) {
+		if (*mods == modifier)
+			return true;
+	}
+
+	return false;
+}
+
+static int vs_common_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
+	struct vs_dc *dc = &priv->dc;
+	struct drm_framebuffer *fb = new_state->fb;
+	const struct vs_plane_info *plane_info;
+	struct drm_crtc_state *crtc_state;
+
+	if (!new_state->crtc || !new_state->fb)
+		return 0;
+
+	plane_info = (struct vs_plane_info *)&dc->hw.info->info[to_vs_plane(plane)->id];
+
+	if (fb->width < plane_info->data->min_width ||
+	    fb->width > plane_info->data->max_width ||
+	    fb->height < plane_info->data->min_height ||
+	    fb->height > plane_info->data->max_height)
+		drm_err_once(plane->dev, "buffer size may not support on plane%d.\n",
+			     to_vs_plane(plane)->id);
+
+	if (!vs_dc_mod_supported(plane_info, fb->modifier)) {
+		drm_err(plane->dev, "unsupported modifier on plane%d.\n", to_vs_plane(plane)->id);
+		return -EINVAL;
+	}
+
+	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state, new_state->crtc);
+	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
+						   plane_info->data->min_scale,
+						   plane_info->data->max_scale,
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
+	display_id = to_vs_display_id(new_state->crtc);
+	format = new_state->fb->format->format;
+	is_yuv = new_state->fb->format->is_yuv;
+	id = vs_plane->id;
+
+	dc_plane_hw_update_format_colorspace(dc, format, new_state->color_encoding, id, is_yuv);
+	if (new_state->visible)
+		dc_plane_hw_update_address(dc, id, format, plane_state->dma_addr,
+					   new_state->fb, &new_state->src);
+	dc_plane_hw_update_format(dc, format, new_state->color_encoding, new_state->rotation,
+				  new_state->visible, new_state->zpos, id, display_id);
+	dc_plane_hw_update_scale(dc, &new_state->src, &new_state->dst, id,
+				 display_id, new_state->rotation);
+	dc_plane_hw_update_blend(dc, new_state->alpha, new_state->pixel_blend_mode,
+				 id, display_id);
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
+	display_id = to_vs_display_id(new_state->crtc);
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
+	display_id = to_vs_display_id(old_state->crtc);
+	dc_hw_disable_cursor(&dc->hw, display_id);
+}
+
+static const struct drm_plane_helper_funcs vs_primary_plane_helpers = {
+	.atomic_check	= vs_common_plane_atomic_check,
+	.atomic_update	= vs_plane_atomic_update,
+	.atomic_disable = vs_plane_atomic_disable,
+};
+
+static const struct drm_plane_helper_funcs vs_overlay_plane_helpers = {
+	.atomic_check	= vs_common_plane_atomic_check,
+	.atomic_update	= vs_plane_atomic_update,
+	.atomic_disable = vs_plane_atomic_disable,
+};
+
+static const struct drm_plane_helper_funcs vs_cursor_plane_helpers = {
+	.atomic_check	= vs_common_plane_atomic_check,
+	.atomic_update	= vs_cursor_plane_atomic_update,
+	.atomic_disable = vs_cursor_plane_atomic_disable,
+};
+
+struct vs_plane *vs_plane_create(struct drm_device *drm_dev,
+				 struct vs_plane_info *info,
+				 unsigned int layer_num,
+				 unsigned int possible_crtcs)
+{
+	struct vs_plane *plane;
+	const struct vs_plane_data *data = info->data;
+	int ret;
+
+	if (!info)
+		return NULL;
+
+	plane = drmm_universal_plane_alloc(drm_dev, struct vs_plane, base,
+					   possible_crtcs,
+					   &vs_plane_funcs,
+					   data->formats, data->num_formats,
+					   data->modifiers, info->type,
+					   NULL);
+	if (IS_ERR(plane))
+		return ERR_CAST(plane);
+
+	if (info->type == DRM_PLANE_TYPE_PRIMARY)
+		drm_plane_helper_add(&plane->base, &vs_primary_plane_helpers);
+	else if (info->type == DRM_PLANE_TYPE_OVERLAY)
+		drm_plane_helper_add(&plane->base, &vs_overlay_plane_helpers);
+	else
+		drm_plane_helper_add(&plane->base, &vs_cursor_plane_helpers);
+
+	if (data->blend_mode) {
+		ret = drm_plane_create_alpha_property(&plane->base);
+		if (ret)
+			return NULL;
+
+		ret = drm_plane_create_blend_mode_property(&plane->base,
+							   BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+							   BIT(DRM_MODE_BLEND_PREMULTI) |
+							   BIT(DRM_MODE_BLEND_COVERAGE));
+		if (ret)
+			return NULL;
+	}
+
+	if (data->color_encoding) {
+		ret = drm_plane_create_color_properties(&plane->base, data->color_encoding,
+							BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+							DRM_COLOR_YCBCR_BT709,
+							DRM_COLOR_YCBCR_LIMITED_RANGE);
+		if (ret)
+			return NULL;
+	}
+
+	if (data->rotation) {
+		ret = drm_plane_create_rotation_property(&plane->base,
+							 DRM_MODE_ROTATE_0,
+							 data->rotation);
+		if (ret)
+			return NULL;
+	}
+
+	if (data->zpos != 255) {
+		ret = drm_plane_create_zpos_property(&plane->base, data->zpos, 0, layer_num - 1);
+		if (ret)
+			return NULL;
+	} else {
+		ret = drm_plane_create_zpos_immutable_property(&plane->base, data->zpos);
+		if (ret)
+			return NULL;
+	}
+
+	return plane;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
new file mode 100644
index 000000000000..60d45b69e30a
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_plane.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_PLANE_H__
+#define __VS_PLANE_H__
+
+#include <drm/drm_plane.h>
+
+struct vs_plane_info;
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
+struct vs_plane *vs_plane_create(struct drm_device *drm_dev,
+				 struct vs_plane_info *info,
+				 unsigned int layer_num,
+				 unsigned int possible_crtcs);
+#endif /* __VS_PLANE_H__ */
-- 
2.34.1

