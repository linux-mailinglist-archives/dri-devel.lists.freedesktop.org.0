Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DC5AA407C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F5910E6A0;
	Wed, 30 Apr 2025 01:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ue0AqdAV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A253910E69F;
 Wed, 30 Apr 2025 01:21:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0hbOFdq2q0z7Id8JwZvyp5/n9IsdSsgjD/4gi3DAyAJkg+ZIrlbc4MwBX4CxILgWruN3BF2vfN6nORPcXgAl8c/GqtX6IgapvOKVx7UVnpJhYP7ovrA8U3O3fRyURG/1V8+bh7jNawtSm+30zej1Ag4cZZXLhayZXRzQGVGfElFky7OeuX96iE9a9Dqq7Nk6EHbyQYmmDYw6oH0nSH6FWXQxxjVDyhzhOmk7bwgV7pvINGSArNT0tqwO0jFGi07nHCRJ8FAQNCLbSShvo/PRxzanOfTX8qul/Chn+ary6JQSf3D70woYQ81/PVGNHS5nxAOIDE/H/LOvKgVdiJQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fcYWHahChFUbs3vXvXhvgnBw/1IvPJzgnHDVmlVV9M=;
 b=SFoHZ7OAT5jnrmfIsVTJGMRXA9irf9VeICsi7NBg0rDucm+lWzTijvZ8Pslyl+5QIeeC0sL0lzPU0oI42zcFeYSg9HhNzUBZ2gy9AJu7vSTvh7mYbkB1qGxI1LM3zLD1PAZAzioBWHKIwJ68gh9XtdXHalee2vszrrb6RMgAc0BgIjBr7xFYj4K7ndCoRVnm+2mXDOwTEmrjSKAcNjHSrp/lmb4lRg6GyU5C5j2iiDaQxq+yGYYAGgt675K6knqwGQfSooXTSdCBSscguNuDRvpGkCw4koyCanrIHd7XVtCETMDgHGuiz7nw2xC+0TR8wT1qQ4x+rfNsBGBN96jcKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fcYWHahChFUbs3vXvXhvgnBw/1IvPJzgnHDVmlVV9M=;
 b=Ue0AqdAVju/GIZMGUWoTFvzeWn7nsFmfubnRgRvHfw9a+zep0UVO8zn9lOylmYwivvaIt660WMd3iJoPTLObuS5ELBFWrISQ5gvzGseJeaV+xH2buEa6qkaOwhPto4UojmA6GVTM8RK4Fi5b6t+nA7sh8nGpnZqUSfxws+umJzU=
Received: from BN1PR12CA0005.namprd12.prod.outlook.com (2603:10b6:408:e1::10)
 by MW4PR12MB7118.namprd12.prod.outlook.com (2603:10b6:303:213::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 30 Apr
 2025 01:21:55 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:e1:cafe::73) by BN1PR12CA0005.outlook.office365.com
 (2603:10b6:408:e1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 01:21:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:21:55 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:21:51 -0500
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
Subject: [PATCH V9 41/43] drm/colorop: Add 3D LUT support to color pipeline
Date: Tue, 29 Apr 2025 19:11:11 -0600
Message-ID: <20250430011115.223996-42-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|MW4PR12MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: d349d968-26d1-44ea-0ad0-08dd878564f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vM0woU5rPn3YtTvlt8kghFSlqEcZaNSu00msprI6Ak/QJO6Z0ZOd2P3pryvM?=
 =?us-ascii?Q?I6zSIIo71tMsgNVH+zR3pNQ7WsDYSN0dezs+4j6WsaKxqzs+tSiJqmBnNmpB?=
 =?us-ascii?Q?oiNT4KFE+VCoWK73p2fevvAnbXKMPYpNlWT2fP8Fr+1L8o/S754i3ugTRT0Q?=
 =?us-ascii?Q?bAfI++D8Y3lsusQHMOilcf+r8NlWaXM0/jc+o3Y9i30/jjGm8JyBSRSSvkqz?=
 =?us-ascii?Q?hjTRZ3zb9eId81A9B3qPdW0WJHeEtlINEzmAnB0ts8R5M++GRciRF+FhdWjU?=
 =?us-ascii?Q?7KT2M7d2awoqCE4FwfDmzUZJHZ685/lGnkjmRdMy97sZjP0pKBUvBy6zNhJ5?=
 =?us-ascii?Q?rUeI8f8/44tWn4sETYXcXM25doqKpMPgNN1PgDerZBFRHa0qdO1Vpt4B4D7q?=
 =?us-ascii?Q?LXgQUCOkeJTBxo0Cp4qWbPZXQi64VJbnp6DzePXVNfV3FLtxqw+HpVDa4gX8?=
 =?us-ascii?Q?B+PeZUsYJDBYJ76RI2uayA2MvE2nsAHMArF+3Y4nPh3QPulSRArmlJkmopy7?=
 =?us-ascii?Q?7ny1ocQMmLPKn5AWypcdu4wtgPaI8cGOUpQIlDd/ECuW9mUEm8MsY0Lnj5Gw?=
 =?us-ascii?Q?1ZdhFKg+U461K9wZj+m4rGUmZawGTJ5cxiqifQXllTCSwcWhBMN/+6nRyLjd?=
 =?us-ascii?Q?QYSYuBOWWagbDqEMyd8cwL4UFYNf4AtoFu5/WEdXYmcxYoIOAli2F6AV5x3u?=
 =?us-ascii?Q?bUHrm4yEdbDrP8gMbSurnMBlLHwqcawalH3KMI+Tuu02/TgJhwfK+JrDm7EG?=
 =?us-ascii?Q?S8b6broQjkJd3IL3vdlm3Xzg70kGfOrY+MwM475NpyqN4011zvfRbigB/j4Y?=
 =?us-ascii?Q?NuiAR8iptt20bKCeq3HKjsZQhP/q5/qFa0ysk3p245zixjrS9EfO1WwMVgT0?=
 =?us-ascii?Q?SymoEcKSd0VbjI+DlKFr6L7c5Ll5HnwNK+HybocLJqkaMce/zn6OyxLmj7BZ?=
 =?us-ascii?Q?7tfDahRm7SbXbJ49/JmPxVjte0D7h488oKF5ccVQ3Ch0XFhsy3XveWb2gBP0?=
 =?us-ascii?Q?30KbCamLYAlefPvFaDlflkPgGzqrmG+x1UMPf+Wq1oid0wBRGShsvog8dJWm?=
 =?us-ascii?Q?Bc6N5yLCvwsBZ6XwN+BGXTHNrbbB8Mi8biA8+1yRMKNkjdNe3XucbkqRI+7c?=
 =?us-ascii?Q?nzBofm6rauLqo1SUnOQyNuYBGNRne+U2eMmQrOmhW6a33JBeNSxaddVzD+Lv?=
 =?us-ascii?Q?eXycrWWjQ0t7aFQUkeIBE4xG/Pi5papeHC/afsWri4Y6HNLhY1i+P5zZCmBc?=
 =?us-ascii?Q?Y899E632ufneCGuoxhkIBt7UeofQvyYi7oE2Bv+asrj0GiHJhIDqmUtIPAcq?=
 =?us-ascii?Q?C8Sh/lDT1Dor0IYE3cweasUmeEYFtfmmRd7+UrAg0J5l1miU9r0RXFrG3T7d?=
 =?us-ascii?Q?ojkuIWjpCDE0yGgIO/3H/MoQRl/PNYYahu5A7iPNekgZ7YaS08YKsMB+cp7g?=
 =?us-ascii?Q?zMcoCyDkTasAFBzdbrv8CbF5BsYTN8opH3WD/f38T8GhBedW5uM6wgImAtXn?=
 =?us-ascii?Q?IUsjuvuODX4kxsmXLfK1vd8kT1h5wjKDivEX?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:21:55.0501 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d349d968-26d1-44ea-0ad0-08dd878564f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7118
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

It is to be used to enable HDR by allowing userpace to create and pass
3D LUTs to kernel and hardware.

new drm_colorop_type: DRM_COLOROP_3D_LUT.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Fix typo in subject (Simon Ser)
 - Update documentation for DRM_COLOROP_3D_LUT (Simon Ser)
 - Delete empty lines (Simon Ser)

v7:
 - Simplify 3D LUT by removing lut_3d_modes and related functions (Simon Ser)

 drivers/gpu/drm/drm_atomic.c      |  6 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  6 +++
 drivers/gpu/drm/drm_colorop.c     | 72 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 21 +++++++++
 include/uapi/drm/drm_mode.h       | 33 ++++++++++++++
 5 files changed, 138 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 41dd6a90e13b..35640154c70a 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -806,6 +806,12 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	case DRM_COLOROP_MULTIPLIER:
 		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
 		break;
+	case DRM_COLOROP_3D_LUT:
+		drm_printf(p, "\tsize=%d\n", colorop->lut_size);
+		drm_printf(p, "\tinterpolation=%s\n",
+			   drm_get_colorop_lut3d_interpolation_name(colorop->lut3d_interpolation));
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index a7f1d75bb4ea..497dba5ffe14 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -718,6 +718,10 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
+	case DRM_COLOROP_3D_LUT:
+		size = colorop->lut_size * colorop->lut_size * colorop->lut_size *
+		       sizeof(struct drm_color_lut);
+		break;
 	default:
 		/* should never get here */
 		return -EINVAL;
@@ -770,6 +774,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->multiplier;
 	} else if (property == colorop->lut_size_property) {
 		*val = colorop->lut_size;
+	} else if (property == colorop->lut3d_interpolation_property) {
+		*val = colorop->lut3d_interpolation;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 38bbe57db348..528de1829350 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -67,6 +67,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_LUT, "1D LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
 	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
+	{ DRM_COLOROP_3D_LUT, "3D LUT"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -82,6 +83,11 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
 	{ DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
 };
 
+
+static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] = {
+	{ DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL, "Tetrahedral" },
+};
+
 /* Init Helpers */
 
 static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -381,6 +387,51 @@ int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colo
 }
 EXPORT_SYMBOL(drm_plane_colorop_mult_init);
 
+int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				 struct drm_plane *plane,
+				 uint32_t lut_size,
+				 enum drm_colorop_lut3d_interpolation_type interpolation,
+				 uint32_t flags)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_3D_LUT, flags);
+	if (ret)
+		return ret;
+
+	/* LUT size */
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE  | DRM_MODE_PROP_ATOMIC,
+					 "SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut_size_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
+	colorop->lut_size = lut_size;
+
+	/* interpolation */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "LUT3D_INTERPOLATION",
+					drm_colorop_lut3d_interpolation_list,
+					ARRAY_SIZE(drm_colorop_lut3d_interpolation_list));
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut3d_interpolation_property = prop;
+	drm_object_attach_property(&colorop->base, prop, interpolation);
+	colorop->lut3d_interpolation = interpolation;
+
+	/* data */
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_3dlut_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -473,7 +524,13 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_LUT] = "1D LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
+	[DRM_COLOROP_3D_LUT] = "3D LUT",
 };
+
+static const char * const colorop_lu3d_interpolation_name[] = {
+	[DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL] = "Tetrahedral",
+};
+
 static const char * const colorop_lut1d_interpolation_name[] = {
 	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
 };
@@ -509,6 +566,21 @@ const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_inte
 	return colorop_lut1d_interpolation_name[type];
 }
 
+/**
+ * drm_get_colorop_lut3d_interpolation_name - return a string for interpolation type
+ * @type: interpolation type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_lu3d_interpolation_name)))
+		return "unknown";
+
+	return colorop_lu3d_interpolation_name[type];
+}
+
 /**
  * drm_colorop_set_next_property - sets the next pointer
  * @colorop: drm colorop
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index e79472739d11..d5aebe46970f 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -283,6 +283,14 @@ struct drm_colorop {
 	 */
 	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
 
+	/**
+	 * @lut3d_interpolation:
+	 *
+	 * Read-only
+	 * Interpolation for DRM_COLOROP_3D_LUT
+	 */
+	enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
+
 	/**
 	 * @lut1d_interpolation_property:
 	 *
@@ -311,6 +319,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *lut_size_property;
 
+	/**
+	 * @lut3d_interpolation_property:
+	 *
+	 * Read-only property for DRM_COLOROP_3D_LUT interpolation
+	 */
+	struct drm_property *lut3d_interpolation_property;
+
 	/**
 	 * @data_property:
 	 *
@@ -365,6 +380,11 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
 				   struct drm_plane *plane, uint32_t flags);
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
 				struct drm_plane *plane, uint32_t flags);
+int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				 struct drm_plane *plane,
+				 uint32_t lut_size,
+				 enum drm_colorop_lut3d_interpolation_type interpolation,
+				 uint32_t flags);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
@@ -415,6 +435,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index d76c8ffe5408..88fafbdeb2a2 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -930,6 +930,39 @@ enum drm_colorop_type {
 	 * property.
 	 */
 	DRM_COLOROP_MULTIPLIER,
+
+	/**
+	 * @DRM_COLOROP_3D_LUT:
+	 *
+	 * enum string "3D LUT"
+	 *
+	 * A 3D LUT of &drm_color_lut entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property, i.e., a 3D LUT with
+	 * 17x17x17 entries will have SIZE set to 17.
+	 *
+	 * The DATA blob is a 3D array of struct drm_color_lut with dimension
+	 * length of "lut_size".
+	 * The LUT elements are traversed like so:
+	 *
+	 *   for R in range 0..n
+	 *     for G in range 0..n
+	 *       for B in range 0..n
+	 *         color = lut3d[R][G][B]
+	 */
+	DRM_COLOROP_3D_LUT,
+};
+
+/**
+ * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
+ */
+enum drm_colorop_lut3d_interpolation_type {
+	/**
+	 * @DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL:
+	 *
+	 * Tetrahedral 3DLUT interpolation
+	 */
+	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
 };
 
 /**
-- 
2.43.0

