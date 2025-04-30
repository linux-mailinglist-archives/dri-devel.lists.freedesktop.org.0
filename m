Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1BCAA4072
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E3310E684;
	Wed, 30 Apr 2025 01:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="au8ZDvt+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EBF10E684;
 Wed, 30 Apr 2025 01:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chBQvLPoEnAAoClD8gFo3/Y4IFfxPPDFGIo3p91DMJG8OGtWP5MWKGr8eloYE59pLdjeECfv6TR6ho9c1xSczBx2K2Elw8hbK5Fz17WtjdyLvz0v0pkumYycshVCcg02Dyj+k2eBBFkZuky+ZdvP3IpwdWMK3rwodtn8AEApUjRK7xPhU2T2MhU98eqYdl4XLj2hj1qBgjNaTzZ9fOxxnqJVtJjzaaA3ogAtIppvV/R9N4mT1Aq/XUsFRLd+Y1mtuAyx2tbrtgbdizcilZnx3nsy2Pn/yrbFZ85VLvBgXG62UaQDLEYg0wj9WD5jRK0AmA6EnicsvhfoU4D6B7QqdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjkfnUlxhTC8osSsteD9C3ttjN8pkjPzCHnrFse5pKw=;
 b=XbFz8aMel3vrS8F1FkXEalcljLpeGYI6fJgYUCXx/kTxCxTbQutKYq8XPYpi7KeY1Is+tJDM3lZJ91meXoOczTdk2RHuWqCb33lL7Iy2CahpHWKZWZzu7vmJNhWGm4HnEzLLbOS+oNWaSUFcUEVwxkP17Mw6pTX1kGeXghTRA2KR493+jGTr8Q62Kdg6dKRdh2L8QEgzSDSji6VwhqKpiw1QQYyo3HlsmSbHl9HrAtvLuH8HUYgT2hSg8WNfw26wz9fFzX9xW0AyxI7G/+AzDJGqrKY6xOi3aAfiIpMLboLhbz8Sgs3Ybyg3p5gRLn39nTmZnZz7n7qTDV7xlSADmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjkfnUlxhTC8osSsteD9C3ttjN8pkjPzCHnrFse5pKw=;
 b=au8ZDvt+tlFP3vOvy4EvnaWdmfSGTnoJIA79UTook7Jboago++srzmGUpGViBMhIj1ws9SgBq1EmI7UUZ57l83A2Bs2EudhNykF/jQK6Mf0RREF1ZjIdHKk+4LgAw8nmpCrdccncnFsUvleeo2USElaJ230VtNw7s3Bdvl/zT0I=
Received: from BN0PR04CA0170.namprd04.prod.outlook.com (2603:10b6:408:eb::25)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:20:42 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::5c) by BN0PR04CA0170.outlook.office365.com
 (2603:10b6:408:eb::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Wed,
 30 Apr 2025 01:20:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:20:42 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:20:38 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 36/43] drm/colorop: Add mutliplier type
Date: Tue, 29 Apr 2025 19:11:06 -0600
Message-ID: <20250430011115.223996-37-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|CH2PR12MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e7436a-e621-4c8b-dc31-08dd87853971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wonsOhQzRc1B6G40n+GvRUd3xX56baa7mD5FIbZE0eTE5loDPyn1t3JjMBg7?=
 =?us-ascii?Q?124nUwVMHJTzKW2SzLveUBvWwSMZC1rfC6qN3FBB7Na5WS+obQhoKCyQCQLN?=
 =?us-ascii?Q?JRccy189db2d/7JgWtdAm/mKaB+41+83rh3w6dzHWWnATL9EkPQjIu0SKuad?=
 =?us-ascii?Q?HK5NFUYcB1PAH45kDvXdlgswmSyzQwRe7nFvQZNnpJHTmTXwZYPAR764D6tG?=
 =?us-ascii?Q?ctxFA1k27ZbqYV4svFifgNve8YhVrRXbDx7TiCCOCS20udUXKdsmGzzQeVOS?=
 =?us-ascii?Q?ML9LDf5jBk7GxRhq7UojtKD0tXQCtun2MDmfesXG2xkPz67VAJzhpjPPjMYl?=
 =?us-ascii?Q?ki8gaAEjR1o53CfvDBP3Z6suPLvoDQfgmKSk8IISf8wyqO7dD7qd9b9BXYXG?=
 =?us-ascii?Q?CuLBRpFOqugdmvl5wKyJ+tQaVJ+/K6AMsH03Ut2rNTodY8whuKLSUxy9jEko?=
 =?us-ascii?Q?4ggBvr0ZYSMp/VlJ4TAMzv1k2yzU6DOqgq0mydZHJOayY8WRSR04Y5BXFOwb?=
 =?us-ascii?Q?zQFzuM1/Gs/sU8OjQ8/VYCXvj58WnViLA0CREcTEBTnqQuiXLax8MkzG1Kdh?=
 =?us-ascii?Q?wjbyozEJmb7D6UqIl3DYXB75EoMh1PRQPE8jnBdmqPfKqahk2yjn+6iqwjFj?=
 =?us-ascii?Q?OvayGhORFoMYyjgCSqC8nsmWJcZ52+TILnAMxlmEPgumvQMlvBVX5KSqwQ/H?=
 =?us-ascii?Q?Cjy/6R85OsbPqkTD4YwIVRb0PVaqvoCxtVoRGOfvGrqGR4unfku2NIKxK+yO?=
 =?us-ascii?Q?wkhqA88j1oE3fQXI8GA6dolC2Gz+dHo3NTz+118XAAtFMgwMAyKk09h/R40Z?=
 =?us-ascii?Q?Qa2cSTefap8e5MpQ/Jbg/8fus6RBIyqijlwfyFHsCKrn3aRF0JERCjkUELmO?=
 =?us-ascii?Q?BsB+nysfkpuFXB4ZpNUpitwt+YAEdX83Kxu5Iq/BRChft+SalgzkXuypzZmn?=
 =?us-ascii?Q?ezeaaALMVsI6ocJ+JS+DR+K693z8Bx+5BIzF5HWHBY0IUoS0aeM7gfslb3lZ?=
 =?us-ascii?Q?ZzSgphepZXvaL+CDHG9PZSKm0FJOS1DzUF2dXI9l0IDZ/bHFQpjbbWGO4HAu?=
 =?us-ascii?Q?h6QnVtK+PUo/4r8bAZxZpS+G+YsF+DVRfc/xs7D8oy4kONcs6apqLjim4gMG?=
 =?us-ascii?Q?+cZCYg84TlI/hOWRpFb5LH+sGL2nMsx1J1aXaO2JZwYtH4Y1GS1FyyDXrDQZ?=
 =?us-ascii?Q?BFE7SRKwfxOdn8qOOyFWILdaJb72NB6wotppSOof3M6F+l734AD7VGZAbCx8?=
 =?us-ascii?Q?GOS2ivEBhed2KCoZK01j/7/kvdDRFy8in9y5u4DPcnPRbqpn9o3ywdjR8oD+?=
 =?us-ascii?Q?csVSV4qytLQ+/GimIlNq6pllFDnhKUqD5OejuvoILIxa0xAEywVKD7GtA9LG?=
 =?us-ascii?Q?3+Bj4kM6baTc8uskYTeCKxqguCqg/5nhev6RdWZ1KHHaZm1IB0xX4Dz+ISNj?=
 =?us-ascii?Q?dKg2MmseG+DpjWuXv+4nWQu/WDQvIlQp/YFuuMycxppYUmlmSUwpScgp76HS?=
 =?us-ascii?Q?jVlRhxrYY5M/zcBDYSLC1rpbiBj35lKQD7Xd?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:20:42.0364 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e7436a-e621-4c8b-dc31-08dd87853971
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230
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

This introduces a new drm_colorop_type: DRM_COLOROP_MULTIPLIER.

It's a simple multiplier to all pixel values. The value is
specified via a S31.32 fixed point provided via the
"MULTIPLIER" property.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v7:
 - Modify size_property to lut_size_property

 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_colorop.c     | 33 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 16 +++++++++++++++
 include/uapi/drm/drm_mode.h       | 11 +++++++++++
 5 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 1dda90554e46..907ca790689f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -800,6 +800,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	case DRM_COLOROP_CTM_3X4:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
+	case DRM_COLOROP_MULTIPLIER:
+		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 0cd250db3981..a7f1d75bb4ea 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -739,6 +739,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->multiplier_property) {
+		state->multiplier = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
 							  property, val);
@@ -764,6 +766,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->multiplier_property) {
+		*val = state->multiplier;
 	} else if (property == colorop->lut_size_property) {
 		*val = colorop->lut_size;
 	} else if (property == colorop->data_property) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 6c87f5b9f7f9..a3cf62c5e263 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -66,6 +66,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 	{ DRM_COLOROP_1D_LUT, "1D LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
+	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -327,6 +328,37 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
 }
 EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
 
+/**
+ * drm_plane_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @return zero on success, -E value on failure
+ */
+int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+				struct drm_plane *plane)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER);
+	if (ret)
+		return ret;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC, "MULTIPLIER", 0, U64_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->multiplier_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->multiplier_property, 0);
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_mult_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -418,6 +450,7 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
 	[DRM_COLOROP_1D_LUT] = "1D LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
+	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 52e965577bd8..888184aef7a0 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -146,6 +146,13 @@ struct drm_colorop_state {
 	 */
 	enum drm_colorop_curve_1d_type curve_1d_type;
 
+	/**
+	 * @multiplier:
+	 *
+	 * Multiplier to 'gain' the plane. Format is S31.32 sign-magnitude.
+	 */
+	uint64_t multiplier;
+
 	/**
 	 * @data:
 	 *
@@ -273,6 +280,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @multiplier_property:
+	 *
+	 * Multiplier property for plane gain
+	 */
+	struct drm_property *multiplier_property;
+
 	/**
 	 * @lut_size_property:
 	 *
@@ -330,6 +344,8 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 					struct drm_plane *plane, uint32_t lut_size);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane);
+int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+				struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index dde250dd7a51..fa5e1ddaf4f0 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -919,6 +919,17 @@ enum drm_colorop_type {
 	 * | B |   | 8  9  10 12 |   | B |
 	 */
 	DRM_COLOROP_CTM_3X4,
+
+	/**
+	 * @DRM_COLOROP_MULTIPLIER:
+	 *
+	 * enum string "Multiplier"
+	 *
+	 * A simple multiplier, applied to all color values. The
+	 * multiplier is specified as a S31.32 via the MULTIPLIER
+	 * property.
+	 */
+	DRM_COLOROP_MULTIPLIER,
 };
 
 /**
-- 
2.43.0

