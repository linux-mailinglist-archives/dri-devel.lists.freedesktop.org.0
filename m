Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CCCA72745
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E8B10E7BB;
	Wed, 26 Mar 2025 23:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vYGfs1P5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2059.outbound.protection.outlook.com [40.107.95.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAB310E7B8;
 Wed, 26 Mar 2025 23:50:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgouPdse88B+vroqqUnS8HF4ItdqM3fyVnxTTQ57k/8VGMiZhuhwov0eErUe3vwSRb3KTs65uEuSCBMQQniNWg4MtyJjC/gXteAXGnyidIPExGlvQYnbGqhi6iumby4vM5oUXHbh1EVK+Grki5rDzieki6/0wg+A/Qou0EXnDN/yRAzCTuo8vUNDFh/OEa4n8U41dNNW9GfXH1mZqxZrgYh+O6YtFkotOPZAYQ51JR1fF3r3Y4v6NH8UbFfjsndOEGB7yn1PsMbKAhDfdP1V+BlIAomQwIgacySnKPFNZoupLJ4RJofy6v7RjUs6MOcuzdxbKsPZtgvCnXgiqXRfJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=be4yFRR40/kXcG0bLXhdewJMs0Hk8P8zwn2tDMWUouk=;
 b=hiqe+B0pccpaWxDIkI3rggX3L8ar/1HA+lHArcQTru1PWr0GIdNvYMUbf8Qxi0q6F3yUfGqyT9PMijyReuBARCFGCt9kVf4pB5mN6ZoxEDPmMIBAchj4+sdYqR2RJ/1u0LAKf2pkceQDXoSrAHf/7s9Q0B5BYE/nZ1vtwmpbOHmEGpHsb1i+Y1dH0hxydB7PMkp6qQvZVYoAFguGoqlV+KIH83u9beuBoKl+CWvBzBeLETzYvPhoD9XcSBQuoKstHtzoIYG/vBjfJfaM3vWDjW3YfcmPWVVlhMa5hhtjthz6b9R8ReN9zl1OkjNkEN9X31/a7fSws75fTRwcN3yVgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be4yFRR40/kXcG0bLXhdewJMs0Hk8P8zwn2tDMWUouk=;
 b=vYGfs1P5iHZrThLlLLM9EUu/UKzA0iI3tR9j96fKiavID+uwnwg0cxekCVhpU2B1Ft5JF32CV6HsGYnkIIkIJXA45vrbZ/slRJoaTovSEiGPkipToUa1ZwLkH43Ntc+LG0f3nzVF8Mu/Pk9+nsOTK8pmt4uFiAa5cGieZ7z9CCY=
Received: from DS7PR03CA0074.namprd03.prod.outlook.com (2603:10b6:5:3bb::19)
 by PH7PR12MB9103.namprd12.prod.outlook.com (2603:10b6:510:2f5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:49:59 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:5:3bb:cafe::62) by DS7PR03CA0074.outlook.office365.com
 (2603:10b6:5:3bb::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Wed,
 26 Mar 2025 23:49:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Wed, 26 Mar 2025 23:49:59 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:49:56 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 06/43] drm/colorop: Add 1D Curve subtype
Date: Wed, 26 Mar 2025 17:46:47 -0600
Message-ID: <20250326234748.2982010-7-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|PH7PR12MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d73c899-b53d-4fa5-e0fb-08dd6cc0eb5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NnXmhM6KcrFy15ewM/VAmKhb8CTbE2T7UKEgTmQSlwH2QFNqZlyI19o5v617?=
 =?us-ascii?Q?gBhYFumSkNdAs82S16am1+Rh4SNaro0BuD3VIoMW1CbkAHzeoxOmVFvMh6ts?=
 =?us-ascii?Q?RiF5qWbL7WloLj8dwIMf4C3tJ0iteMV7BEyEQImT96157TrQN3EcyHq36u7y?=
 =?us-ascii?Q?CRNk4/hqkgfQzIx+5VpG7vsCa2goZOQbu5Re8DXFrOsSFTe1a5L7uZtY2RzM?=
 =?us-ascii?Q?d/9Yc5MaVjom/ZVQIwqIby21NmiGRwW3yQ0h39Sf7I78EjxlhRt79WD16MZp?=
 =?us-ascii?Q?G3qv1C0cEzVFmPA1V2ldRyRFm9o0fKOyLEXhKa8VBQfcqKSXlCetw+Ag5JWd?=
 =?us-ascii?Q?Qa/OhlTEZE53kl7LjvwdZ3QxSEX5hE7HYIjMOnWhygGdMNQcZwdsL5hEyR1n?=
 =?us-ascii?Q?MsvimD2H+/PSeMYdELTs1CtbvyoSyJfFWhZVxXeD2qiQNS4jffBiWvuynuTU?=
 =?us-ascii?Q?GOrqFbBEGWUtm48cYcs4eq9dtE8aiB8dKBtpvLEMHc5cmIfBUi60kK8k7E3B?=
 =?us-ascii?Q?b71yJjmscZ0YtRLuwpXaxmDrSAgPhj/465wXl0FkPiZ2CYRTCYly6PWFU9NU?=
 =?us-ascii?Q?P4i4YdmoULf43zQ/kErZNMjzNCgdOMHbjVOiRNDQ5SV6e4ZYw9F6kivSD6nc?=
 =?us-ascii?Q?9jM5Ii/mq+ThLpSmjLcEq2nOqIpuWhN98X1JKli3e7iJppXeMcydx1Jzzr/+?=
 =?us-ascii?Q?ndzWyb0+tAyZzLaQeBo8O0sshIpkmK83FZX2sa691f90FSpZ1jOBzGN7tTIj?=
 =?us-ascii?Q?3rK8V5OPPyEJDgNjy0/NsuMXN4oh6uiMUma7p1b799yySXdjRRCoVmOg8wVg?=
 =?us-ascii?Q?5cseZghjAKMzQMhsfFWzso5A0rtpIw/0nHbbSCv/D6YZeePlhmb/WN/XFy4s?=
 =?us-ascii?Q?A+1o42oUMZ5GcMFboDvDIyJxhdUe72NzdjsbxSp3em6sj3fLy8h5AuNzjx0M?=
 =?us-ascii?Q?DO/CK2eWvMQ88v5MhTjEqudvZDRVZOEFeASMYWkIvqG89hRPo/fx3AePTzpx?=
 =?us-ascii?Q?Vzobf8ILiOEaiaRHT0yge3uW7KjvIdwMxvVEcniQQ26LHqieR9ay35+C/3Wb?=
 =?us-ascii?Q?WrgAWaB/5HBNp1QlUvIcSkrJ7LMlkiApaxq/onRWageuXaK8478bb/r31ErJ?=
 =?us-ascii?Q?77DKlZG7xAacYeR3nxW6cksj6X9ax9b5Ar/5ho6p/iA1/7/sLbjg45la3dG3?=
 =?us-ascii?Q?B0jz93l6gQOG8q9o/fM7v8VLxDgvgJVEAI1f7uS+Bbu3bbu84RNkGXKZlCmA?=
 =?us-ascii?Q?kxzU2KacZNAND1lkno0h5gcRBsTYJgabeXH2uUUsOZLyCIHmuhXVHXdkT3hG?=
 =?us-ascii?Q?YNwe++q8dL2H1leyCtmL9jHqsN+V2PM/MvnasEdtyModr2s8f9fS/+7k/0s2?=
 =?us-ascii?Q?EhCRwCJePYgrwXGcWsUYV0kbBi0wTzG7Du8jwvjcooPz4ZqP4su3glMxYGKs?=
 =?us-ascii?Q?Ag/MxGVomrTJSF8KW9H0ewL9gt3agw2VMRSeXv/VPUHUJ9TfXcyJe+vx2ytn?=
 =?us-ascii?Q?RvmiPlyCQgDb1ts=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:49:59.4216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d73c899-b53d-4fa5-e0fb-08dd6cc0eb5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9103
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

From: Harry Wentland <harry.wentland@amd.com>

Add a new drm_colorop with DRM_COLOROP_1D_CURVE with two subtypes:
DRM_COLOROP_1D_CURVE_SRGB_EOTF and DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF.

Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v5:
 - Add drm_get_colorop_curve_1d_type_name in header
 - Add drm_colorop_init
 - Set default curve
 - Add kernel docs

v4:
 - Use drm_colorop_curve_1d_type_enum_list to get name (Pekka)
 - Create separate init function for 1D curve
 - Pass supported TFs into 1D curve init function

 drivers/gpu/drm/drm_atomic_uapi.c |  18 ++--
 drivers/gpu/drm/drm_colorop.c     | 134 ++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         |  63 ++++++++++++++
 3 files changed, 210 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 5e8ce781fcd7..f75c987f8913 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -649,11 +649,17 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
 		struct drm_property *property, uint64_t val)
 {
-	drm_dbg_atomic(colorop->dev,
-			"[COLOROP:%d] unknown property [PROP:%d:%s]]\n",
-			colorop->base.id,
-			property->base.id, property->name);
-	return -EINVAL;
+	if (property == colorop->curve_1d_type_property) {
+		state->curve_1d_type = val;
+	} else {
+		drm_dbg_atomic(colorop->dev,
+			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
+			       colorop->base.id, colorop->type,
+			       property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static int
@@ -663,6 +669,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->type_property) {
 		*val = colorop->type;
+	} else if (property == colorop->curve_1d_type_property) {
+		*val = state->curve_1d_type;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 1459a28c7e7b..a42de0aa48e1 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -31,6 +31,123 @@
 
 #include "drm_crtc_internal.h"
 
+static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
+	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+};
+
+static const char * const colorop_curve_1d_type_names[] = {
+	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
+	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+};
+
+
+/* Init Helpers */
+
+static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
+			    struct drm_plane *plane, enum drm_colorop_type type)
+{
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property *prop;
+	int ret = 0;
+
+	ret = drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLOROP);
+	if (ret)
+		return ret;
+
+	colorop->base.properties = &colorop->properties;
+	colorop->dev = dev;
+	colorop->type = type;
+	colorop->plane = plane;
+
+	list_add_tail(&colorop->head, &config->colorop_list);
+	colorop->index = config->num_colorop++;
+
+	/* add properties */
+
+	/* type */
+	prop = drm_property_create_enum(dev,
+					DRM_MODE_PROP_IMMUTABLE,
+					"TYPE", drm_colorop_type_enum_list,
+					ARRAY_SIZE(drm_colorop_type_enum_list));
+
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->type_property = prop;
+
+	drm_object_attach_property(&colorop->base,
+				   colorop->type_property,
+				   colorop->type);
+
+	return ret;
+}
+
+/**
+ * drm_colorop_curve_1d_init - Initialize a DRM_COLOROP_1D_CURVE
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @supported_tfs: A bitfield of supported drm_colorop_curve_1d_init enum values,
+ *                 created using BIT(curve_type) and combined with the OR '|'
+ *                 operator.
+ * @return zero on success, -E value on failure
+ */
+int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane, u64 supported_tfs)
+{
+	struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
+	int i, len;
+
+	struct drm_property *prop;
+	int ret;
+
+	if (!supported_tfs) {
+		drm_err(dev,
+			"No supported TFs for new 1D curve colorop on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if ((supported_tfs & -BIT(DRM_COLOROP_1D_CURVE_COUNT)) != 0) {
+		drm_err(dev, "Unknown TF provided on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE);
+	if (ret)
+		return ret;
+
+	len = 0;
+	for (i = 0; i < DRM_COLOROP_1D_CURVE_COUNT; i++) {
+		if ((supported_tfs & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = colorop_curve_1d_type_names[i];
+		len++;
+	}
+
+	if (WARN_ON(len <= 0))
+		return -EINVAL;
+
+
+	/* initialize 1D curve only attribute */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CURVE_1D_TYPE",
+					enum_list, len);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->curve_1d_type_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->curve_1d_type_property,
+				   enum_list[0].type);
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_curve_1d_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -70,7 +187,16 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
 static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 				      struct drm_colorop *colorop)
 {
+	u64 val;
+
 	colorop_state->colorop = colorop;
+
+	if (colorop->curve_1d_type_property) {
+		drm_object_property_get_default_value(&colorop->base,
+						colorop->curve_1d_type_property,
+						&val);
+		colorop_state->curve_1d_type = val;
+	}
 }
 
 /**
@@ -114,3 +240,11 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 
 	return colorop_type_name[type];
 }
+
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_curve_1d_type_names)))
+		return "unknown";
+
+	return colorop_curve_1d_type_names[type];
+}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 9c9698545f63..fc1b2e0f33e0 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -31,6 +31,42 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_property.h>
 
+
+/**
+ * enum drm_colorop_curve_1d_type - type of 1D curve
+ *
+ * Describes a 1D curve to be applied by the DRM_COLOROP_1D_CURVE colorop.
+ */
+enum drm_colorop_curve_1d_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+	 *
+	 * enum string "sRGB EOTF"
+	 *
+	 * sRGB piece-wise electro-optical transfer function. Transfer
+	 * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
+	 * to H.273 TransferCharacteristics code point 13 with
+	 * MatrixCoefficients set to 0.
+	 */
+	DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+	 *
+	 * enum string "sRGB Inverse EOTF"
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_SRGB_EOTF
+	 */
+	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_COUNT:
+	 *
+	 * enum value denoting the size of the enum
+	 */
+	DRM_COLOROP_1D_CURVE_COUNT
+};
+
 /**
  * struct drm_colorop_state - mutable colorop state
  */
@@ -46,6 +82,13 @@ struct drm_colorop_state {
 	 * information.
 	 */
 
+	/**
+	 * @curve_1d_type:
+	 *
+	 * Type of 1D curve.
+	 */
+	enum drm_colorop_curve_1d_type curve_1d_type;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -127,6 +170,14 @@ struct drm_colorop {
 	 * this color operation. The type is enum drm_colorop_type.
 	 */
 	struct drm_property *type_property;
+
+	/**
+	 * @curve_1d_type_property:
+	 *
+	 * Sub-type for DRM_COLOROP_1D_CURVE type.
+	 */
+	struct drm_property *curve_1d_type_property;
+
 };
 
 #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
@@ -151,6 +202,9 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }
 
+int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane, u64 supported_tfs);
+
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
 
@@ -191,4 +245,13 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
  */
 const char *drm_get_colorop_type_name(enum drm_colorop_type type);
 
+/**
+ * drm_get_colorop_curve_1d_type_name - return a string for 1D curve type
+ * @type: 1d curve type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+
 #endif /* __DRM_COLOROP_H__ */
-- 
2.43.0

