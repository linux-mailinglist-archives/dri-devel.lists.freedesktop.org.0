Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0322098F7C3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD8D10E98A;
	Thu,  3 Oct 2024 20:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cqR/2Exg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524AA10E96E;
 Thu,  3 Oct 2024 20:02:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1ER3Npkq63WRrRqept/a91MPZlh7uuU25TgUfzo0OjzZqbsqxYEnODfdrDAIqM/B+PckGnZfLSLSQDTh4/QvnZ5TyJt98j97s6CiMoPnML3jwURzVBC2oc2p9E+uKUThUa8T2q2wI8AoCuOi2kFTJF8VwGefBNQ8bBZw0rG3I4XekNS2WhiGOK6KRAFEF5XpiRTbZVek8Y0H39PEOsNmnAu/wBzio5dPJCrSctWyIkn4UaNrfMtRMHJenGeWa98Zca8QAY/rz599nr3mhcXmaxWt147qSk9XhCZnfEzsLQ4Cd9H2IhJzqXuuQmDo99oXMumoC6v+CEoWMB8I9/HlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkWHw1EEbSB5aG8mMOI1SVjJAVluRFXOSbOQcN0MFXw=;
 b=IKBMcAxdcQo9++x0OMZh+lKzISWMgng1QrQv2sLkWaBlKPE8tK8XBNBVvOBB74y+Lf8kschumBJzYhopm1AddvQcY97JPWCRzb7x5PMfZykF4rls2b0Uu1foa67AqkhxYXDzOVWcjLLQZjiMuzNDJB7/zV8Hbm1QI51hjJ13uM09bdBGo2nqHnFgsmG+KTywfys4zqal2wjd2lo2mb4FfhmnaWXeHl2nT5SKDjW4spM6EC0ceJ9y4w8bLmYji5OtWpvr41OBG+boWyVbKbcbqbexKHRqECvgf663rUqtgakFVk5B/y00HQnDLOxSCwbOGyDY7eLPoY9u69YYf+2A1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkWHw1EEbSB5aG8mMOI1SVjJAVluRFXOSbOQcN0MFXw=;
 b=cqR/2ExgkdyLrsgGlNw9AK++t3HuGj6kTjrm6f5WfRFgIF71umKh9cjG5qOsMa3Coybr0XhYr9Hmzu+bYmiSjcABBa7quxtkOkrwUg6NMx+rUmKim9olJMFbkShM38Doo6912n4vrG0I6XzBj2OA50SBQtYhfdx91oDZYtV8IjA=
Received: from DM6PR04CA0027.namprd04.prod.outlook.com (2603:10b6:5:334::32)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Thu, 3 Oct
 2024 20:01:58 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::e5) by DM6PR04CA0027.outlook.office365.com
 (2603:10b6:5:334::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:54 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:54 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v6 37/44] drm/colorop: Add mutliplier type
Date: Thu, 3 Oct 2024 16:01:19 -0400
Message-ID: <20241003200129.1732122-38-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c36e7f9-d106-44b1-a55f-08dce3e63bd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p6by4bR4K9GctZV98PRVJwD0uiqHBG4IEiGYHnPOEnlj7wEGAFMJcWW+32Dg?=
 =?us-ascii?Q?7HqeOqAp6p9BBqFO479t778tFrbRFMuFFU3PMXQ3jachZpW06M42Xx/ODStV?=
 =?us-ascii?Q?DXzu/qx75cjIwFZPgwI7iWP3KpFk/HRBCRhwIXI4oSI0oB4oROAkoNok2OIa?=
 =?us-ascii?Q?BvOhD4FLTjvtd+NpOHeCC0TPJm2S2zC/XFMKCyzGxNE1zY9qeDjjeiA0SIoF?=
 =?us-ascii?Q?xverCBWUsbeYukHOM2SrDh20foN90jOzuIAJMtGvUu5MzCcKulvvZvvgJDUV?=
 =?us-ascii?Q?HRWVF9fWCKOzmPOqModlqWsmc8xwYJF8uklp4Zghfrt9uxBByiWkukHviZRh?=
 =?us-ascii?Q?bgCJ29Aopx4sK2LZFUaWe/9494p5tJGDpz8Me6n0Lw3kidqvoi8DyDhlHsm4?=
 =?us-ascii?Q?X5mTcy+5lw2dbm1FPNHQT9/sC5pylp2uvamqnMQ6n27iXlVoT50jFcaMn91l?=
 =?us-ascii?Q?ZdyhbFl/sBjvAQH6t7+2ePvNg2CVozg1cdPFLqfjplCZDRMGoP7RZMRfxsCf?=
 =?us-ascii?Q?CqfvhUGZhDzDovMV01rpSPwoZnpGP3AoO/D3XS1r12uABrUqo9KI9Azud2Ky?=
 =?us-ascii?Q?DV7SLAlld1DDCUA94bl/4G5+DlQam68lwTwioktUcTnY2Qwu7MXbTMQU2O7x?=
 =?us-ascii?Q?3fqiXnXsd74m3gG9z7mbrcwbmzNlQ9lWi2gqam/usHTI0YnAe6Oztqv1FzGF?=
 =?us-ascii?Q?7T7jOLOdYiFPZpDWhJD6kZUTdQkvEz1TeFJo4p5oqd69QQLsbmsihnd0YNR5?=
 =?us-ascii?Q?nY47PHgQguT/cAMLmhbxcQYsCgO3BLm8xfGGRLCJxN8rdF1cVhMI3vjYE+2r?=
 =?us-ascii?Q?Rps53DR6BUUnTwRsOycj8icTVlSCWT4XDZSMghBB8C862QSAimMXMTuswxbt?=
 =?us-ascii?Q?iT3BXfi6ynBXNdHNjwsBLJOnOlWSpcyyIavJWTpmaw2oT/J5Tzqxm3BXcFZA?=
 =?us-ascii?Q?IiGjijMeOIv0l1Bs8B/u0ZJTpIIQ9OYVFpkyz83jID47D0Zqgsw5NfdEFtPi?=
 =?us-ascii?Q?nZzeKUW+rer+Ual/9pQfiX9mSja3wBXXNmgTiK+SZiI/vfgtP6lBr0DW8LOZ?=
 =?us-ascii?Q?L14u6ymQP2lw/iS4FQgFHZnFvxKzJA2FdbN8dhzAi4bfQwjRS75f+IYRHncz?=
 =?us-ascii?Q?u3gjRb8Sj+QKGj5xQUw6rYIob4KHBnU39fq5nc6keNcyHTRdHhaiBYQf3KWf?=
 =?us-ascii?Q?SNGtFyqgbOgtYdv/xF+cWIvh0yf7uAKnbELeZCbGe2fCsdvuEVpc1sVDSUHI?=
 =?us-ascii?Q?6BmSDJl/eGBrjUfjL/PYuxrMF2yDH28REzb6vqcEFTY2qA1EbkT6+ISzdIYw?=
 =?us-ascii?Q?w6900bSGRPGU2arSqSeKNXvH1aVrqaQlSnpOvpiU57HtzzDU1BQgYJGfXiOZ?=
 =?us-ascii?Q?fpCctN4HR4VeukhkfNZ1ZU/JsUja?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:56.3224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c36e7f9-d106-44b1-a55f-08dce3e63bd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442
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

From: Alex Hung <alex.hung@amd.com>

This introduces a new drm_colorop_type: DRM_COLOROP_MULTIPLIER.

It's a simple multiplier to all pixel values. The value is
specified via a S31.32 fixed point provided via the
"MULTIPLIER" property.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_colorop.c     | 37 +++++++++++++++++++++++++++++--
 include/drm/drm_colorop.h         | 16 +++++++++++++
 include/uapi/drm/drm_mode.h       |  9 ++++++++
 5 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f06b1d5a61ed..acd8a2fc0270 100644
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
index 2b7368b337a4..57029e5938f6 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -727,6 +727,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->multiplier_property) {
+		state->multiplier = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop,
 					state, property, val);
@@ -752,6 +754,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->multiplier_property) {
+		*val = state->multiplier;
 	} else if (property == colorop->size_property) {
 		*val = state->size;
 	} else if (property == colorop->data_property) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 1d3fef74a30e..41f0ade76b57 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -64,7 +64,8 @@
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 	{ DRM_COLOROP_1D_LUT, "1D Curve Custom LUT" },
-	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
+	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -285,6 +286,37 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
 }
 EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
 
+/**
+ * drm_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @return zero on success, -E value on failure
+ */
+int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER);
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
+EXPORT_SYMBOL(drm_colorop_mult_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -375,7 +407,8 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
 	[DRM_COLOROP_1D_LUT] = "1D Curve Custom LUT",
-	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
+	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 32973ad99f8c..f78ef745887c 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -133,6 +133,13 @@ struct drm_colorop_state {
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
 	 * @size:
 	 *
@@ -252,6 +259,13 @@ struct drm_colorop {
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
@@ -309,6 +323,8 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 				  struct drm_plane *plane, uint32_t lut_size);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane);
+int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 40cc5c661cff..96cb32e6980c 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -904,6 +904,15 @@ enum drm_colorop_type {
 	 * &drm_color_ctm_3x4 struct provided via the DATA property.
 	 */
 	DRM_COLOROP_CTM_3X4,
+
+	/**
+	 * @DRM_COLOROP_MULTIPLIER:
+	 *
+	 * A simple multiplier, applied to all color values. The
+	 * multiplier is specified as a S31.32 via the MULTIPLIER
+	 * property.
+	 */
+	DRM_COLOROP_MULTIPLIER,
 };
 
 /**
-- 
2.46.2

