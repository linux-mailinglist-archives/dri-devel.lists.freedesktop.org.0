Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242199F8B8D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A9610EED5;
	Fri, 20 Dec 2024 04:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YTgdjVBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC0A10EED3;
 Fri, 20 Dec 2024 04:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTR93kyw/vKvUJgKl+6QnGZ5Tp6ihv0HfiHN5KIyp0DhXPHh1o1+vV9LD86i9dfWDESt700aDlZO7IyeRzfMN19YcaYPAPznTQqu7BWY5eJxQQZrZTVs+g9OvIum4urn+jjGuqe5PMSvMnab3QddzTYrUnohTNncHjE/ItFK2syS8cNhevS6KvMI7oy+o1krP88NNqMUk3wKy+lYzHVof8Bf0tkaHZUi0bSLf6WK07A7MZd942cdR6vmKO6pz0+J3l1Pm89dhYvD1z+MCvjh6J+wKt+ULeWR6KFRLLUdeCPDT9vC0bgU0RC3DKUIqlRHxlviUSo4kklCm6dom8xGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kN+TiFXjETLY6xdrjA8qjF7ilcwj6A8EY6evhmIv9Fc=;
 b=IFW2HjwLj3tGMyfmXr4aFp1RHy1XBOyFM2NCqRMsQ9Dkc1nSzioWkIlqGAQw1IC/7OWsGpm1BdOx+UxspFC9NT8oxjlMNRrpCF0vIe4kNbUs7MoFcvlGiRaOZ/dmVTK12JJTCCqYk21hapCd+b9prQuSCKKw82lxMIOaGAzgTLnbiGRI/Dy+n+nD94MeTZEkI/ZAZlDOmM5SnaChtWG2gxypbRaFWPeoHqR7ldsLgE9gnlw0vxx+MJFzGdNlrmJ+2CS4J8dDjaFOHSdoCBQN3NYh8d5JdXHAsnlcebEqrHt7ot8r0dzHTSApQz+Q4ZDM2bEeXZpNqpC+0mmrzRGFgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kN+TiFXjETLY6xdrjA8qjF7ilcwj6A8EY6evhmIv9Fc=;
 b=YTgdjVBon3pJm0aWviYtrYL7fb4SxAZHSorQZWLUFl2kZTQEyOGPMaFlvlgmwm/gmjt2i9ssEKCEvzHhl6A84ncc18ZKYWBBIaPaSSs78/iuhQJ2XeUj+3P2b4ppnJ20eT0jL7tRJMJ3w1Cp7j5bR9FxxhLxWUjJEKTSr+mq8ys=
Received: from SA1P222CA0131.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::12)
 by SJ1PR12MB6217.namprd12.prod.outlook.com (2603:10b6:a03:458::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 04:44:42 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:3c2:cafe::70) by SA1P222CA0131.outlook.office365.com
 (2603:10b6:806:3c2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.25 via Frontend Transport; Fri,
 20 Dec 2024 04:44:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:44:42 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:44:41 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 33/45] drm/colorop: Add 1D Curve Custom LUT type
Date: Thu, 19 Dec 2024 21:33:39 -0700
Message-ID: <20241220043410.416867-34-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|SJ1PR12MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 465012c6-37e3-472d-ff10-08dd20b1054b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TBYBmQhQhIbCsBQrFNC4YmBuIo0i8FbWo+l3EzggHnRHYQNkALQ2uSrU43Yl?=
 =?us-ascii?Q?W9/qPXfa9zSzcCirsNUBoeUkPY7tFdNtULfcRH0N09KYEmqpqUB7DcJ/FY/2?=
 =?us-ascii?Q?ZFT9JNP9AI6ObYdB5yCPhPILTCxjpYEVm5KKP0OgUpCf2773qGQCZaA4hmBQ?=
 =?us-ascii?Q?UE4G8Ap9Q2+fHscrxv6pZO1XvuF6jEhO+rn/l6PhKxb+9zxY9hb8+geTtXYY?=
 =?us-ascii?Q?xgCkx3cgwqiloDWf+BMZfxqhhxWyTuc/hYVpypSuA2ugnvofoV2KY4k2u0kl?=
 =?us-ascii?Q?HvLaL2zfwSVp6p/kuRjAzfwSp3BKYkeGbVuQRjjeWC1wBDwoKLvYqsumG0E3?=
 =?us-ascii?Q?2mPoPiDLDZViwO6m0UXSisv0x16jnKFbj2CaC3Gu1236cVRgWLmDim6qG4Zn?=
 =?us-ascii?Q?9n1vVIlehPs0UU2E5cvtomInIRmGuxBfiT6Oa3GvRus0WtejdQw3w9gFF0lm?=
 =?us-ascii?Q?Ar6PFv9PTvyjrDdwJNeSk7BxDaXzh6sxapGmF90ugOolNiBaZ0ZU0bCeeqHX?=
 =?us-ascii?Q?ZRe0520nhNCI5m9I/PnGJl0oMXZg8r196Gt32m5N09Yyf0kQw9Nwxj5IEJQT?=
 =?us-ascii?Q?xBa38zfbsdIoF/bL7j0K9xjeJ/ITaOvTGzAnwEk1vMKi7PP5tmU2cO996IoE?=
 =?us-ascii?Q?IsJrrskkf1Y88ulX14WTi6dvQn/sB7VxMvjSy8T2eoiWbCk6Bn5YrhswfwiN?=
 =?us-ascii?Q?izwomNjMdOY4l7GccQV/Xd7/zz/4ZDyb6dGYX8PE+sNSIWS/JLbqLQRmBdmZ?=
 =?us-ascii?Q?+W4cARVzF6uS+pO50UCyp7I5EXVLR8FUAt+bYM3fPt42X32DAipxGtbpNot0?=
 =?us-ascii?Q?yCUqCHZwx/Ye3nfWDnqCgQ6bq7CHq7x6B48mka2dO/HNn7RvjZXPewmJH8uG?=
 =?us-ascii?Q?3p7eRb38r0x3NjtXACQ7F7N+5WyYMi+ukX5hKUWSr83rxSaifwfo3DMfizMA?=
 =?us-ascii?Q?5yIutub8pATtUhsI+gT6OxJF0UEWm+kXyxSc6oMPSHOAOeJPzeOHtFusdHss?=
 =?us-ascii?Q?G6/Gxkgi3Wv+O6usefHMfdFSAtle7R8B3yrzTbqHEoHYAXbwlzzeAP5Bd4y8?=
 =?us-ascii?Q?5aH/ntaCOwXgzZcTOzzcFEP6H0/EzYK+0gk4cMhj0N8LFPWsVD/vorWGwD+p?=
 =?us-ascii?Q?w2TKvsy+jlFJPhkydZcLBne4yto7+8SQ3Zcfa24qhuOgxWtI8kVRGf2Rt9Uj?=
 =?us-ascii?Q?RsGDRrb3QjpAedQgXFWKgrxCc3C5v96rvfdAHTa8KI27tDCdn5SwO0F/VSri?=
 =?us-ascii?Q?fcXkkFJVCPWIq9LFALcJqJqbUqFIYA8d4Zk/1KfiK90qIEGGSe9cGeUYy+Ji?=
 =?us-ascii?Q?VPjiE3EayYzuvlVoovX4agCTQVrSoZtwATWqGTDNSoLgqac+Zvs+PIgsGwOW?=
 =?us-ascii?Q?idZCnzgaXoJA5gg85vJ4dNoLKVSENJWf/8gAlYVCZ5vJiCm+Kqc7To9oGCVj?=
 =?us-ascii?Q?/Ct6Zj2Rqroy7VX8JF65q07WL0fqEV0pxjCHE/HHDulXLWoTeqyljF5uuUA7?=
 =?us-ascii?Q?3TKQX/KdclGb0yM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:44:42.5864 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 465012c6-37e3-472d-ff10-08dd20b1054b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6217
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

We've previously introduced DRM_COLOROP_1D_CURVE for
pre-defined 1D curves. But we also have HW that supports
custom curves and userspace needs the ability to pass
custom curves, aka LUTs.

This patch introduces a new colorop type, called
DRM_COLOROP_1D_LUT that provides a SIZE property which
is used by a driver to advertise the supported SIZE
of the LUT, as well as a DATA property which userspace
uses to set the LUT.

DATA and size function in the same way as current drm_crtc
GAMMA and DEGAMMA LUTs.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v7:
 - Change "size" to "lut_size" (this affects multiple following commits)
 - Move "lut_size" from drm_colorop_state to drm_colorop
 - Modify other files accordingly (i.e. from drm_colorop_state->size
   to drm_colorop->lut_size)

v5:
 - Add kernel doc
 - Define SIZE in similar manner to GAMMA_SIZE on drm_crtc (Melissa)

 drivers/gpu/drm/drm_atomic.c      |  4 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  5 ++++
 drivers/gpu/drm/drm_colorop.c     | 47 +++++++++++++++++++++++++++++--
 include/drm/drm_colorop.h         | 16 +++++++++++
 include/uapi/drm/drm_mode.h       |  9 ++++++
 5 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c58663327e6b..b7a05132ee01 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -793,6 +793,10 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		drm_printf(p, "\tcurve_1d_type=%s\n",
 			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
 		break;
+	case DRM_COLOROP_1D_LUT:
+		drm_printf(p, "\tsize=%d\n", colorop->lut_size);
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index a3e1fcad47ad..4744c12e429d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -701,6 +701,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	bool replaced = false;
 
 	switch (colorop->type) {
+	case DRM_COLOROP_1D_LUT:
+		size = colorop->lut_size * sizeof(struct drm_color_lut);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
@@ -750,6 +753,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->lut_size_property) {
+		*val = colorop->lut_size;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 665b23900cc0..e6dea2713490 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -64,6 +64,7 @@
 
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_1D_LUT, "1D Curve Custom LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
 };
 
@@ -219,11 +220,52 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
 
 	colorop->data_property = prop;
 	drm_object_attach_property(&colorop->base,
-					colorop->data_property,
-					0);
+				   colorop->data_property,
+				   0);
+
+	return 0;
+}
+
+/**
+ * drm_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @lut_size: LUT size supported by driver
+ * @return zero on success, -E value on failure
+ */
+int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				  struct drm_plane *plane, uint32_t lut_size)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT);
+	if (ret)
+		return ret;
+
+	/* initialize 1D LUT only attribute */
+	/* LUT size */
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE, "SIZE",
+					 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut_size_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
+	colorop->lut_size = lut_size;
+
+	/* data */
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
 
 	return 0;
 }
+EXPORT_SYMBOL(drm_colorop_curve_1d_lut_init);
 
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane)
@@ -333,6 +375,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_1D_LUT] = "1D Curve Custom LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
 };
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 83a6bd64d48a..d3226ab7e1e3 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -239,6 +239,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *bypass_property;
 
+	/**
+	 * @lut_size:
+	 *
+	 * Number of entries of the custom LUT. This should be read-only.
+	 */
+	uint32_t lut_size;
+
 	/**
 	 * @curve_1d_type_property:
 	 *
@@ -246,6 +253,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @lut_size_property:
+	 *
+	 * Size property for custom LUT from userspace.
+	 */
+	struct drm_property *lut_size_property;
+
 	/**
 	 * @data_property:
 	 *
@@ -293,6 +307,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
+int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				  struct drm_plane *plane, uint32_t lut_size);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 6fc1ce24800a..40cc5c661cff 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -888,6 +888,15 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_1D_CURVE,
 
+	/**
+	 * @DRM_COLOROP_1D_LUT:
+	 *
+	 * A simple 1D LUT of uniformly spaced &drm_color_lut entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property.
+	 */
+	DRM_COLOROP_1D_LUT,
+
 	/**
 	 * @DRM_COLOROP_CTM_3X4:
 	 *
-- 
2.43.0

