Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D975C5FB5E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974BE10EC07;
	Sat, 15 Nov 2025 00:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T8N6JNHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010035.outbound.protection.outlook.com
 [52.101.193.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D0510EB8A;
 Sat, 15 Nov 2025 00:13:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y07C+stYSDes+u5OxTucVctM3eV1REQnR+oUVsVpxCaWBCEUo7UILOm99llDLTKF3Dz3ivUVkhOaLS5znvA7H+RTu4n1pERQsPevgIK/1AVKWP9P1/7wNfICQoQ6RcfHIK9Zrcnj2l4qVlqqWHKBpLNRHOLSmS+6zW3ABnssJPdY/GKshA+FlKap2fTa1NS5nE5gRF2pdBuuexPOTUmI9G+ITZqH1e/6N0ScIAFv0M53QZdjPSLh3ww08qrL50+6lGiFZVjhPw9K9PwNwnGI8nzh0iIUpJcERWe691wn+KOrPTevDGgti2ZMCtDuazu55jtar6RDAJN1zUDjqVPwTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUeOa+9yrTByWW3jsjapP8sE1kKfUNVtBgPI7U7dBgw=;
 b=sRy0eKjtohFOsJHMJAmJuhjGrvVxaNORjbnq9jg+XtFg//f4e3V3chqT15xtbT9cWS+YLkzUqEJKzL0iHsm/Wzgb72XFypjv2nj0oQublZPPk7vhm4+Zj5Iz+zEIp7l6BdsaOWalBf1969yC0At8ZW/+fZGRSOgw091PVG4b7KGlr695FeKzK+3Lgms2BjbROjZjW+8cTCJpsCZzSXKQbNmTRoinxbBag+7+im1QwLmYK7fs+Ysy1zp3Ha4VLaTkDXqkjOsxpGcawLyY3Iwzju09BgFOslNvC6LcD0XaI/8VWJm8hE4sLnLMF2jMQrG3+bwR1u+GjrbCIzUzsJPiRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUeOa+9yrTByWW3jsjapP8sE1kKfUNVtBgPI7U7dBgw=;
 b=T8N6JNHWUzKqPKrl7Xaz52/2+++JkIkp6M0WJH+Z4cVSoKcY4mau9O40tic8i9FhcUW4qFFikcF66yM3K8zfSyh8f1h4KdGi0ox79b030wVrFzALaX+WwLKgyiRrJHSy+hNZB1k++HRrolk0HVSVdclNuq7Uo5VnKAvzWFeBqKw=
Received: from PH8PR07CA0021.namprd07.prod.outlook.com (2603:10b6:510:2cd::10)
 by DS0PR12MB8198.namprd12.prod.outlook.com (2603:10b6:8:f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:13:20 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::57) by PH8PR07CA0021.outlook.office365.com
 (2603:10b6:510:2cd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:13:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:13:19 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:13:16 -0800
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
Subject: [PATCH V13 40/51] drm/colorop: Add multiplier type
Date: Fri, 14 Nov 2025 17:02:05 -0700
Message-ID: <20251115000237.3561250-41-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|DS0PR12MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: f32abada-763f-4b48-5104-08de23dbc869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8jgJyEqovYvy0E4Vhlh6xX2V+/qReiniPidEZ7DAt2ibqmDwipHtC8DcnN+6?=
 =?us-ascii?Q?hJJkrXsBrqONL20ID8CgWT7WT/iJfDKiCfMBZ+D0qJvuZYW1RAyjRm80cGxW?=
 =?us-ascii?Q?dcXL8/U27W7CXgJG/dh6N6g9BB2phaV7GxvRKFgHIsylpJwvDtdqino2caxI?=
 =?us-ascii?Q?HnQIr+erbXj9nidLgfZMK5lEfTh4+NamxSwfIC6KmD5yaYPQvzt6AFIbgpbO?=
 =?us-ascii?Q?q5tFN6Z6GK9pEDGzSMYPNf3kVv8k0UaNYljP/RHrV412a1Jm5z/W5qd8ByaI?=
 =?us-ascii?Q?dXFPT/4WYUjc40tzd2CAlSJfTqb7Wf8z+0orMdsO/q6ed1PGyl/YvPfbb7dR?=
 =?us-ascii?Q?TVdzhgibsdtylgr9wd5KbmIWtEnhn3+EhCo8siQmB/Y39Zoj9ZljUNcOo0l5?=
 =?us-ascii?Q?HxRZ8kw45ga7Ofk+54i8g1NPMzxz0ozr/VJup3DcN3qEzNttloI6H9qBpRMi?=
 =?us-ascii?Q?3zjZkseKtw0EjCaqKVsBeT3jFgJqzKV/g5zWcA5L/AzKzhXPInCnCAl3S6NI?=
 =?us-ascii?Q?ivzjuCmsSfoxsPnroaXY4O+fzdT0woA3uCjWkvfsiXLWeiUqLXBn2TN0llof?=
 =?us-ascii?Q?tKmrONOURrFF+GMSg6BdhFwWKYCPvETxwA0RIxWTCTMK+XjX9o+Wy/bCe9CN?=
 =?us-ascii?Q?c/adoBDujHPEkIfPu4TTY7TOuQjgQ5CB9nfwSwuH1MDSfr3uTI2s/vWogfZT?=
 =?us-ascii?Q?t3u+S1wuF+Igb9X+pBLu61wjImXA7XOrGDXJ2pGUiEZOHjzPfJsKSDcn3tiO?=
 =?us-ascii?Q?vufh0TwRm+AQvS30a4djmfeiTKkG0+lPkCYcfFIO5xE4D18UXArAHVeSXvW4?=
 =?us-ascii?Q?/kxjxIu7OeViXdg5UB+GK898xFDq6uOVPENJWARcA2SIXT6XbqyjOEXghPDP?=
 =?us-ascii?Q?wpsFxkC2XOgNEthYbesp7vcdcEhyLiJFlEiKbRsHqiIDHHK6oeYS43+AzRr4?=
 =?us-ascii?Q?sGtj0dXOlAt5jEPaIcRddB9RJKZyd5Gg2NILc2BBCnNJAO9TljbwbCCKvm0O?=
 =?us-ascii?Q?HcugOpwApr/OEjdjx3sBLMbzHoPQjtixbN11EQdxyY/EAiBrjpALOmeAm7nz?=
 =?us-ascii?Q?qMBDj8jH8c6NapZwpOD+YDL0de/2MVJjedcaj6LmWt9dahge1OlWFXno7RiN?=
 =?us-ascii?Q?bT08TWW84kfA1og+lMWdwoK/m5LKtiq4SudM4ClYzOHy+7+eq/hFpOh8u3Uk?=
 =?us-ascii?Q?hbDiC8RUeI58fHdP/ze9mVh7b0qGa1hjsg05UXVp11dtzErHoTMC3mZ7JVr9?=
 =?us-ascii?Q?kqpoXHQokyUgxkPA/ZMvpJ5Pyyy7tRS2GarDk3WHvG9NpF0iskmmLsThV/Ro?=
 =?us-ascii?Q?4D2Vnd+YO5C2ilzKLRpG6Uep0ZQlnh3pUvlsLztLXfEPPzXyUE0q6/8flt0c?=
 =?us-ascii?Q?LHO9zoXSXr7Ok0MjmQxi4b9E/d7bAuSFC3RpGU8z8NHeCP61YB5i6AOgFrI1?=
 =?us-ascii?Q?/db+rO/VNmvmLHfKkijG8jWlKBPrz1tonQ5+JNPQjN4F7DI/ifnPBQcL7Lsc?=
 =?us-ascii?Q?w+z1tYUAYwPdsQ6MlWRV03ufZHrkHG8Ynig6W0MppEtBVQb/EOQkZnD3cnGT?=
 =?us-ascii?Q?MsbLGWRBc24sjoiH+lE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:13:19.9471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f32abada-763f-4b48-5104-08de23dbc869
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8198
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
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_colorop.c     | 33 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 16 +++++++++++++++
 include/uapi/drm/drm_mode.h       | 11 +++++++++++
 5 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 1e685ebf1bd1..17c553ae9e61 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -804,6 +804,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
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
index a1c956420dd8..b559552d267c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -728,6 +728,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->multiplier_property) {
+		state->multiplier = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
 							  property, val);
@@ -753,6 +755,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->multiplier_property) {
+		*val = state->multiplier;
 	} else if (property == colorop->size_property) {
 		*val = colorop->size;
 	} else if (property == colorop->data_property) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index e773259633ae..5bdeed99c9b5 100644
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
index 7f622c8a0955..f846f807d7c4 100644
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
 	 * @size_property:
 	 *
@@ -331,6 +345,8 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 					struct drm_plane *plane, uint32_t lut_size);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane);
+int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+				struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index bec524e2fa32..cac25c0ca37b 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -931,6 +931,17 @@ enum drm_colorop_type {
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

