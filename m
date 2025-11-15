Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDFDC5FB7C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C69B10ED0E;
	Sat, 15 Nov 2025 00:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Belf6DMV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013007.outbound.protection.outlook.com
 [40.93.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4B610ECF6;
 Sat, 15 Nov 2025 00:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsI93m033w5yc2RSGZve2S5y2C2FMcxMgRufLV9G+Dnpv8xbVkG2kS49B5bftBDNAHUzNanbp7fzrO+u9dE0ihgJujF57C7vQwTwBdMX2YVewd4MxYoGjk7z3Hrt/SNobvGJeE47zdHTDEfrxIJJr5ZzFAUWIXvpBY04XPl7H/eleKpMokOaUuX6Mj2cbVZiSQg+qaW7wS3pH6RoxE+hLAw4+kdK+Xn8dT+ENvbM2vRyxAolaJq90i2QqYqslhzmvTPmDbxOURSfzJXCwBmroWdb9UFtXt7XVZNf/hhIA+wtX9GC7EZduikMcqOZa/6KdafgJndWkfomkN/48I2bOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0AoSMCeIBE55tvKnRy6CEA3p1SOAa61KMrjo2yNfik=;
 b=cpQtpFtwAzHkllsdKqD/+QN3j8746LONLqNB9iunQQYPUl5l/QaSgi8Dt0+rp07EKNUlJIlDGi+W6qSdiq3e4BrBar0CU23S3LjzI8mn720MnJKPAAXULdxS/lWoDcPBEEp8CD7C8vsNbaIS2F4nipmCJmbz7uAA8xefu3jO/j55ZI5PNj948b4tWOlHIh+l7Q2F9OeXjgoTr/6LiiGg+Coh8xcv8t/ck5RQUL+bmlUYRzrnHsI3exdcYV08jfxmn8BlOt+hQUuoojc3REronlRK2g25mMElLgRBP05yUjGdVKY51Z+PgZNwG62pjaRP6TlnNQNCvXPOvYu+RlWsPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0AoSMCeIBE55tvKnRy6CEA3p1SOAa61KMrjo2yNfik=;
 b=Belf6DMVPhIXh7khyIiIdDy9JjscGDre51m601yfCeRZrMt0Z5HbTIr5XzSApltdd4NV282lBPConmuSwhEzJC7PQ7vGr0inoAnKtDIoLsK2YFUXRqykMOXDQaT4J2p6dasoNDEFqlDXY3GeX6rAc+JJ9k1/1ETvJtuvfhk4Y6g=
Received: from DS7PR03CA0338.namprd03.prod.outlook.com (2603:10b6:8:55::31) by
 MW4PR12MB6732.namprd12.prod.outlook.com (2603:10b6:303:1ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:14:32 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:8:55:cafe::bd) by DS7PR03CA0338.outlook.office365.com
 (2603:10b6:8:55::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:14:31 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:14:28 -0800
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
Subject: [PATCH V13 45/51] drm/colorop: Add 3D LUT support to color pipeline
Date: Fri, 14 Nov 2025 17:02:10 -0700
Message-ID: <20251115000237.3561250-46-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|MW4PR12MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d96d38-19c1-4472-60db-08de23dbf333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0iTebnTpclo2/1TskkAPcd7dmMlJM5vrLjHUdsTjqwx1RDkVhYvGbsDrrvhY?=
 =?us-ascii?Q?P15bMqndXoVofvL+i+fF3LGZPZ8vyxlXibNa6C4fn5+rKNpZx6BNl2tZx5An?=
 =?us-ascii?Q?TdH58krpatPA7IIS7du49G1wVy3gMu+JDiRxwC4V0qNbXQUtYazmDOQ0FiUG?=
 =?us-ascii?Q?jnKbOJNq8ahcgZAm/dsq0ryLe8r40hPSdQA5oe+JTDXUtiGeQkdy2PuZe3HO?=
 =?us-ascii?Q?9xOckZ5Wk/1IaSJnCtglzsSbo93CL3Ch8LlX9csVEfjAvol0lMnMAIMmOatL?=
 =?us-ascii?Q?zMhzIRADgrAM2K9iSbKTzyrZyJzuuqgAVo5pQ3IehoR3qrwGyUogxBHeXq0t?=
 =?us-ascii?Q?VbvADX2USO+yMuiOXcXm73LvI7hfRsefpV+xCXH9aMj+gJp7wMcWrgjciwNL?=
 =?us-ascii?Q?WqYwuKTk+PUMd6DZ2LC13xNimdGlK/MGWenPYkadPoVgbG6h9O4MurZ9KoqK?=
 =?us-ascii?Q?nYnHN0HQEn96wrHDifVTKvjCGj0keXXURctupfnh76xnicFTxpB6F2yhVxJb?=
 =?us-ascii?Q?YXXF4TxT1JP6XW1G7oKYAKYMG7gDYTS8sho0Nk+iL825jcEubgEW3M79BT9K?=
 =?us-ascii?Q?mJHNioUZbaQtN0xhppo2tkbmurLoPongNcWezEx9mM7m/ybwqkxEtEpOIVor?=
 =?us-ascii?Q?fnln8SKAYhZbbDMu/c4wyGKdRh6NvVSV3wT5jqCszQj+gEpraAzfylsEnC6Q?=
 =?us-ascii?Q?vCcfQvO2b6ccd7bI87sHb9TgUYj6Kp8cTVVtJZCL+3wxi02XV4n1aXoTZoNj?=
 =?us-ascii?Q?LMSpxN4FwKvzQvoZ16gC5b8I/YYvp+g1y4IDUFSRbeGHkN/cp5P6ayPZBB8e?=
 =?us-ascii?Q?wc4glWmAoFqNjyxfd/38yk9c+8NEtZzGI5pOu28lOY7fPSZVk2jk6nsifoIw?=
 =?us-ascii?Q?gUWPKEPsah+/fCFDwmaJ+nGgAJ4+61QSZjxEyaOM4z4K59sciPrFBrTCQ26A?=
 =?us-ascii?Q?JryhxKPseQvrPPuizbvfe+3anrMKgpF31tLyXoG7ax1T9yZFobSda++rrKUg?=
 =?us-ascii?Q?8u9rNX9fhloEPcxygTuqC6/JaHVcw7MIJEbveGtA0QT0f262sEbAvueUugzi?=
 =?us-ascii?Q?UdTgvNYeFfm5nXe4EYZZCE05Gru0zSvWe8YPOpN7FvpWnNF5hsi8ooc5KIVB?=
 =?us-ascii?Q?iUeQnv8bPKMp3P1kYC/m/zDMjWeTjD/jFyc6FWJXoa2dD49APJk2rSy9J4Rz?=
 =?us-ascii?Q?F+SjCaVkKllgu1l8RzUvVD/qWssVDDxdJoF8eRLGVaukvADpAXBQrmv2ztNb?=
 =?us-ascii?Q?VeLS6/sj7eo4nIOiIgE9DDs7jxpZyhXT99gJQCnd8S+KjRhRhazhJlnonoO3?=
 =?us-ascii?Q?Eq/X3xBn5ZEv2wwzWZA7801B2Krf9gdA0JxqI7N1UIbPIrPIFUcYEmWOhYov?=
 =?us-ascii?Q?tPb4X6xsnhxxHZjiBRo8vDDOBDYbU+IqBq1iXybHziNyX9WnJ+1lVzLb30ym?=
 =?us-ascii?Q?XNpHL28Tc3Le6hGPumXh5fQK7kzMh+/vWKR14nHviasBpCCGH48o7tKuBqiG?=
 =?us-ascii?Q?6o/NHv5SAn7WxpcZzyrlYaTyY/B+Jxv0wuO2VSvzB0NwbhKF0zxQyCJ8uIy0?=
 =?us-ascii?Q?jiFnNuLTsYJE/WgBBDk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:14:31.7441 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d96d38-19c1-4472-60db-08de23dbf333
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6732
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
index 831e0cc1fd15..c8c11d7655f9 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -810,6 +810,12 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
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
index 4a354a043593..e1a152e4570a 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -707,6 +707,10 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
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
@@ -732,6 +736,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->curve_1d_type = val;
 	} else if (property == colorop->multiplier_property) {
 		state->multiplier = val;
+	} else if (property == colorop->lut3d_interpolation_property) {
+		colorop->lut3d_interpolation = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
 							  property, val);
@@ -763,6 +769,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
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

