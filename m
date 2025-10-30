Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EAAC1E4D4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC7110EA68;
	Thu, 30 Oct 2025 03:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K/K/9oQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F1A10EA68;
 Thu, 30 Oct 2025 03:55:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+tKPIwO5wh28DlSt7Z6J0ngfZtM26Y4fTPeOyDxfkaW4H8joIiEtWsFI+0xzBzh/m1eTqb/6dsIDZpLNnLOMcc6vOjEjQpdmIgoeLwuC4rGylfZ2gdo3dR4r6iEiqJzX2Ckbcbtb61copghdPz65nUlGmWDT8khBeLqala3zjeA3dKyAA1OwmL8njeulNash1opQY2dnnOooq+H+8b6WprAfN7RAiiME1eH9sZinVBSJm3aMqUocdAoa9YrgWUvfIrrobPyPi7BKNmqcmiUC8DhH4RrQ4d64lwvHvqDD5+6PqD7MqTVRhcBwnAgjdaQ/zSguHcNGssJEc+pbLpuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFsZRuXFlMigb2c/RdNHtNb3TcJclxU9rhZEi06501M=;
 b=IM1WZkx0vRU09xcJwnwMogYc9fozv6HSQWIPgXWPZICdn1ksG9Xi9J5Mgjf4t1yLBuOzqkOJL/lNuUlbAu5LpwNeKdXYZYjaJsVL8O8MQjjrpxMUzztipKSFBPwLpNCwx4SsYysU+AFEIyuRqW2q0O/zTo7Y6rboHYqyJjdlLJbF2RRdP1MdWeB1QN1Gtd2xahos+zRSfGBxTjHudNQjo/BKPQrS4YwkTTaKg0GCfIcXIzAZqr4ujLGfbOteZXtyjAru7lQFycpbc48Thu9p2UxhlDtjMfQbnr6dWRjxW8nTFoO/2ttQzI1Ole0aN6WCW+ZWuK8io3AaJUq3IshdhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFsZRuXFlMigb2c/RdNHtNb3TcJclxU9rhZEi06501M=;
 b=K/K/9oQwGqgME3Iw6IJTd4/vs4JHHuyALb5D+WqZVC85ButR4CBDTUXRp7ryuAjs5oqU1bD7uol88rFvafMIm1OyaZQxfe+Cej3NZBUZUaaWIGx92C3hvHZN2wRUSBYx+zDX0KmO8x19EVE+4M2/kkjNYjBMN2k3fepnFOcUWpo=
Received: from BL1PR13CA0321.namprd13.prod.outlook.com (2603:10b6:208:2c1::26)
 by BN7PPF9C6E5285F.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6db) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 03:55:28 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::b5) by BL1PR13CA0321.outlook.office365.com
 (2603:10b6:208:2c1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 03:55:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:55:28 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:55:24 -0700
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 43/49] drm/colorop: Add 3D LUT support to color pipeline
Date: Wed, 29 Oct 2025 21:42:48 -0600
Message-ID: <20251030034349.2309829-44-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|BN7PPF9C6E5285F:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9668d6-d698-4b28-62df-08de17682a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UQLKwDW28FnUSwFxAjw5KH1v+W2lVrK9xsl4lA1/gWW5Sj2eH1lkcLM+rAUQ?=
 =?us-ascii?Q?DSHtBpeQRjyzqWkCZiyInPP2e0fSlH0HUUs4VSl8EKDESttJjM+wkeCTusEE?=
 =?us-ascii?Q?4E02Pv21enBuj9/v1fw3JOsIWCnn2sJBRr7tU6HSWYpX/vu0vUKcF6lI15U3?=
 =?us-ascii?Q?+9SRHiWF44U5QuM4flpQ1dUPdd8I+tOh9pW8at0y43cQIMFHjCmIwuS9wLjp?=
 =?us-ascii?Q?TJVtEDehl+wb2F5ySPyP9ko4FeKNK0iZGip8uLIxwVs25xvTxA/4GbdVcgzS?=
 =?us-ascii?Q?+Tz2gO283LucVlCyF/C4PS0WUc3UydXxeu66VeLvnHeYEv9fU8DNebxGHb7Q?=
 =?us-ascii?Q?EwOGkpkvpu1cyFDhYe/eLIQO7NAynYrHgZU92nGNZnQy2PCKZEq5qqI+uu84?=
 =?us-ascii?Q?teZpMhiRR82aHe0Gn4RwI3Lss5OpbEvEq9gVmKeCyFqTe7ZnNsDk5CAKhdmN?=
 =?us-ascii?Q?JrzhN2v4CYmLbYZ6x4L526s507EPXtTUJG6F1abMV5Sb0+Ggu4SXmDS0VZIx?=
 =?us-ascii?Q?NvgLFa56goaON4p2O40hvekgpELKI5b3A+4/0p4kWnnCCMTAsI5QxfX4zTdO?=
 =?us-ascii?Q?p4tSaNyFJFJHeuqUc/VoqdtfG5KEZYHbKkdqNsWp5o6XdodafU20sKSa2wnn?=
 =?us-ascii?Q?O0EgtlwhKqJeeUAafApDLZ4pQGftNuRoSHR14PdOYLXTO7KnUQaKVVqziB+h?=
 =?us-ascii?Q?V1dvoEkp3udkaOEpY/9rJl+f3zOB289z3SYbd+4axpp9wGgtuvE9fz4Q8IRN?=
 =?us-ascii?Q?Gu/Cnj230oNzcrOiakbdEYsY7+lPTZ10Q3HHfi878ugb5MjnU6kMttrOqAUx?=
 =?us-ascii?Q?nYtpw7mA3iSF4w0ZMY2Kd905AvSsDzPiXgfY3sdzss5XlZibjwL+Lw+kemeN?=
 =?us-ascii?Q?99NBjxFeoXZx8+onAYIJJiC/6eQkYcclaQZf2kB2qCR5SP9jIddBx5eni7qa?=
 =?us-ascii?Q?SaBkJH1SCtdeSf50efh7XMjYd0A97qNIDa/17Y82JzHEjs5JsnnFiiv/nyy+?=
 =?us-ascii?Q?A6niITHD1faK4VyenrfxkF3btsBp6CCqvzFGfL3z+zvJGfIV5wm+GhYSU0Yq?=
 =?us-ascii?Q?NU7HPeHvsLIw2N/Z0kt5t+UOSvgr88hO/1EWMDpf/1BvlCI2pzRD/7eWisCI?=
 =?us-ascii?Q?wreDebnpb/IosQsg7spIDnVOp/ikTmuvnW+27IodmeRD+vJPYmkF+DP+++HO?=
 =?us-ascii?Q?a6OM7PteDVZ9d6cYOwmQOOWh+p/e7D6zzj5kUqzdK6Ze2QtbpXiVCafJ96wn?=
 =?us-ascii?Q?t6loPMPHJAWiPWkE8FdO0UCYYLmOmJGwPG99+D2W3QpKxFoasfqJ0lv+jyO4?=
 =?us-ascii?Q?R1qjl9cC3H0cTv3Whzab1lXX8LZpazt+cWHWW+aK/hjzoN/SuHqkwI1pNyC6?=
 =?us-ascii?Q?LKK5PXxHJQcdT0XYduE4fqfjOiHo05ekNPAK6eS9XTbCzdXrerd8jrcNSrhq?=
 =?us-ascii?Q?fmwUv3/HfebEOvwITEbGrNYFsI/9B4nexLzRGGTf3ZWmpvhrwS7AQQz+XsuY?=
 =?us-ascii?Q?JUujVwDJ5Y56k6P7rqZEeWAYF0NcFNO9q95st2tBYJnLPFunY+PtT8QsSl6i?=
 =?us-ascii?Q?OZpTTllg8Wk0OefD7OM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:55:28.4609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9668d6-d698-4b28-62df-08de17682a30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF9C6E5285F
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
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v12:
 - Update lut_size to size (Sebastian Wick & Xaver Hugl)

v11:
 - Update names from *_lut_32_* to *_lut32_* (Simon Ser)

v10:
 - Add missing set lut3d_interpolation in drm_atomic_colorop_set_property
 - LUT3D_INTERPOLATION is no longer immutable (Xaver Hugl)
 - Support 32BIT RGB in 3D LUT with drm_color_lut_32 (Harry Wentland)
 - Fix 3D LUT kernel doc (Leandro Ribeiro)

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Fix typo in subject (Simon Ser)
 - Update documentation for DRM_COLOROP_3D_LUT (Simon Ser)
 - Delete empty lines (Simon Ser)

v7:
 - Simplify 3D LUT by removing lut_3d_modes and related functions (Simon Ser)

 drivers/gpu/drm/drm_atomic.c      |  6 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  8 ++++
 drivers/gpu/drm/drm_colorop.c     | 72 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 21 +++++++++
 include/uapi/drm/drm_mode.h       | 34 +++++++++++++++
 5 files changed, 141 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index e4c6778b21bc..811ded5ae54d 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -806,6 +806,12 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	case DRM_COLOROP_MULTIPLIER:
 		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
 		break;
+	case DRM_COLOROP_3D_LUT:
+		drm_printf(p, "\tsize=%d\n", colorop->size);
+		drm_printf(p, "\tinterpolation=%s\n",
+			   drm_get_colorop_lut3d_interpolation_name(colorop->lut3d_interpolation));
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 3c17943b990e..c83a73f5e63b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -703,6 +703,10 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
+	case DRM_COLOROP_3D_LUT:
+		size = colorop->size * colorop->size * colorop->size *
+		       sizeof(struct drm_color_lut32);
+		break;
 	default:
 		/* should never get here */
 		return -EINVAL;
@@ -728,6 +732,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->curve_1d_type = val;
 	} else if (property == colorop->multiplier_property) {
 		state->multiplier = val;
+	} else if (property == colorop->lut3d_interpolation_property) {
+		colorop->lut3d_interpolation = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
 							  property, val);
@@ -759,6 +765,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->multiplier;
 	} else if (property == colorop->size_property) {
 		*val = colorop->size;
+	} else if (property == colorop->lut3d_interpolation_property) {
+		*val = colorop->lut3d_interpolation;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 425af6e16cc0..e1b2b446faf2 100644
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
+	colorop->size_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->size_property, lut_size);
+	colorop->size = lut_size;
+
+	/* interpolation */
+	prop = drm_property_create_enum(dev, 0, "LUT3D_INTERPOLATION",
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
+};
+
+static const char * const colorop_lu3d_interpolation_name[] = {
+	[DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL] = "Tetrahedral",
 };
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
index e7587936d2e0..3e70f66940e0 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -284,6 +284,14 @@ struct drm_colorop {
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
@@ -312,6 +320,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *size_property;
 
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
@@ -367,6 +382,11 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
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
@@ -417,6 +437,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 4b38da880fc7..cbbbfc1dfe2b 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -942,6 +942,40 @@ enum drm_colorop_type {
 	 * property.
 	 */
 	DRM_COLOROP_MULTIPLIER,
+
+	/**
+	 * @DRM_COLOROP_3D_LUT:
+	 *
+	 * enum string "3D LUT"
+	 *
+	 * A 3D LUT of &drm_color_lut32 entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property, i.e., a 3D LUT with
+	 * 17x17x17 entries will have SIZE set to 17.
+	 *
+	 * The DATA blob is a 3D array of struct drm_color_lut32 with dimension
+	 * length of "size".
+	 * The LUT elements are traversed like so:
+	 *
+	 *   for B in range 0..n
+	 *     for G in range 0..n
+	 *       for R in range 0..n
+	 *        index = R + n * (G + n * B)
+	 *         color = lut3d[index]
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

