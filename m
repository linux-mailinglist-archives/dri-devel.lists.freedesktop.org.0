Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8328B27780
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393FC10EB01;
	Fri, 15 Aug 2025 04:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LLobw7wc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2072.outbound.protection.outlook.com [40.107.95.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586CB10EB10;
 Fri, 15 Aug 2025 04:00:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIakDnHbYJIgyNAK8yfzIl3lDud1zW5tr40BMSr3EK+Ps/jEtZHWyKQ3XDvSJsCsxxlyFAWk2h7HQm+hf+orqok77tP44LCcQfGN+itkB9q9BtDORAzbn5LkGtIbA+1Qux7AdoQkLkXiILRyzpIKmUA5U0hsatn94zlLwKbUN9asq2B/i0ylvmunaOLA3ClNlnAkaDXQrnvyWvgqP5u4rOB240slegB7zyLf2oMb5zjH9c32FIIIntyzqGppjTB3bsve7J8n6xdW5lnlzNBh3Fl3qNmBybCsdmSkznWRBS/9LDMsWsGxRZc+p0q2Eatjd1oxClFvxZzODRMQ3BkC0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRM5FCjyzPLVuKd86rEsg96TTTxZrcuMlONKSNEYINA=;
 b=CaUZSasZOT9rg/AypDMwRJBTjyyzx3VMeKrft0LnVrMAiza5oPAmIwZ0rmAwX0jOgBRrodFPsPvV6q+ufchO50/UuAU34q6RoEZn1aEZcwxMedwvxR08HrUJ3GQhRdTQ1xT9DYpU1Lpsov0ozLPl93oZW7/pnNyuJLi6G6XDKjPvlsknAdXolorrodAlXPH1BZFCpahV3SpU/uJoFB0lY5XQy9TC5fTnXv+MItqjIDgOcmTyaTaOqkgzsf7HHBNU8rxsTNKueOZL68z5RtsWXgZEZYqUqRoUec63YH4YqzUc47otnxp7mMZDDO7bp9GMZy8ANMDLUH0zxZ1vy5ZEKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRM5FCjyzPLVuKd86rEsg96TTTxZrcuMlONKSNEYINA=;
 b=LLobw7wcTP7YuFgzGVbq1BkzXtynXA2zTcyMw9txtRVbrA0XSj6dHgeO+GyzeSuTvxSATJem5PWYQ7ZpTJOZn19krQzdrPqPNa68Oo1rom2mgrjjTCmUa5j7IJc+Uqhs66M5UmJ6kZRbaSDP1Od9KwiUzIKuajU6O5OK/DsvJRE=
Received: from BN0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:408:e6::6)
 by IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 04:00:10 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::6) by BN0PR03CA0001.outlook.office365.com
 (2603:10b6:408:e6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.16 via Frontend Transport; Fri,
 15 Aug 2025 04:00:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:00:10 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:00:00 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 35/47] drm/colorop: Add 1D Curve Custom LUT type
Date: Thu, 14 Aug 2025 21:50:24 -0600
Message-ID: <20250815035047.3319284-36-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|IA1PR12MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb09eb3-655c-4e4e-aa0d-08dddbb03ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zxw0xvdr6zCapeuQ5HG8gwj1uhBxEnbyC/CjwKQfxGWnMJxsFXplleA6d4mp?=
 =?us-ascii?Q?h5qsA8Tv6Y33jKn2b4AtqY9tg1SpOsb16M5ehCpzDRmoY4tMHxOOxJ66Wty8?=
 =?us-ascii?Q?J2lhCmap8vT8Z2S/PuQ6VxpT5AQ9ZUA4tJo2U9xASbMqEHPkpoydLM+qH7Rd?=
 =?us-ascii?Q?6sDP/ezp9FzhHLiKHAXsDrJnoz+YXuv6YATHI5Eqpp4NCqSpMPwad0h8BBaQ?=
 =?us-ascii?Q?ZCTlHBjBU//xZYVyBNhzmOvFnIX1LXN3m0hl8uM4Mn6+WC3pb0aheg0Aa4HR?=
 =?us-ascii?Q?EgWDvF18JShCRZPQA0RNF54M2/zBP7VHLbswRd7EUOWdLTNg+We+WKBGepcv?=
 =?us-ascii?Q?J+AXeh5qTy0rn8oKts3SwmrF0FXFJQTCfok6vwliMA/vFv7oFnJzNj1t1mIW?=
 =?us-ascii?Q?+3irvEiEkIQcInOfCQ17a14gaE51YMhL3/eeJ+lRs3oRJU3nIIEl9ORp7GEj?=
 =?us-ascii?Q?GfLGSxAi1o8pb1SxhaR4auiX2V0bpeCOWFs05Rhw3oaEbR8DJIOfYc5B6RAc?=
 =?us-ascii?Q?1Y6IROfujA9AIDk8QnBsEpNm3eczAuHq3sCINsa4xnfWkO+XCY1AJjdzqH6V?=
 =?us-ascii?Q?I3h1mjKvBa1NgetZhiV+vwf4E4/jvMbl+GHazA/JKytrvclL38xL9kc8VLb8?=
 =?us-ascii?Q?0ihVQA/5C0MUQRy5H7t8stndVEmZGY5tf1j3MshwdjM+Ggqe85eOrlmiPDAy?=
 =?us-ascii?Q?WLR1sZwT14WzKW5eck0NGlQQ3mtOlCYv60ilyWIIICDbNtp4YKatVHxo36Ml?=
 =?us-ascii?Q?8hM2pttpEmeFM1jtmrB4UM2+19iVrDR6tSzPA7Yn8IyugRk70x6F2v/gk2XL?=
 =?us-ascii?Q?0DB+5Sl+h8tZGH8p4p1DnZBzhw9+R8QE/KR9wS2LsWK/Fj9ST4H31qhXpq2I?=
 =?us-ascii?Q?F/Brq5XUL8dyVPiBTH2h1G8xV5vaT1wGIGZgnSOlpjfVCrj8PMDxNYVSFubY?=
 =?us-ascii?Q?/1sJbVyqgteWS0vqmnsMvntvGiL/PQn5ELhgR7+4QRX1jYTyPleMnbrJlAvb?=
 =?us-ascii?Q?Krios9uwatdX3nQuEWDyDe9NxxK0WSnPg5nl8oQR2jKo5U4rKWM/jVqB+qUB?=
 =?us-ascii?Q?6FxyoKr+7IqtMLQAwD6+PwbkpLqzflmN1giDwbI+u4EAhvTjhO4UUe17WbS/?=
 =?us-ascii?Q?ICuTLYLPtvqceu/2Qmr71OPsR8S27/oLVJoiV7EXygad9YCUD6A3qW47AxDg?=
 =?us-ascii?Q?XVGQwIF/IEjoHhfwww8W9iV1JGJrU7FcmY8zODCwQfBCRLlcsRBfBEReNF1b?=
 =?us-ascii?Q?wBOa3Sr683iAW34VzxsSUWLYo9xaTXOIiGP7x6UEzcbKN3K+/RZsbF4aPeXk?=
 =?us-ascii?Q?JSPzn5tZrIpfGzhUNsWa9GkgSWUgTCFEKO/+sitwfHG+KTgOE/vAaPzSWkRq?=
 =?us-ascii?Q?3WuexEPRfPhDD1KgVuWg1VrSLf7rHOIC0qy4/3ZV/iv2m9LaZ7X1liiTCsSM?=
 =?us-ascii?Q?wVqU7yrUY0Yw7cCmmfo0La6Fvif3p4J9Hmnq6tURdBAq0w/I+jD2UWuFwL5F?=
 =?us-ascii?Q?adghLdfHAvg68wpnqmAFlbTzEIPZP8januGB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:00:10.1432 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb09eb3-655c-4e4e-aa0d-08dddbb03ab0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8467
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

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v11:
 - Update names from *_lut_32_* to *_lut32_* (Simon Ser)

v10:
 - 1D LUT API is now using 32BIT RGB with drm_color_lut_32 (Uma Shankar)

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Add DRM_MODE_PROP_ATOMIC to drm_property_create_range (Simon Ser)
 - Change "1D Curve Custom LUT" to "1D LUT" (Simon Ser)

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
 drivers/gpu/drm/drm_colorop.c     | 43 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 16 ++++++++++++
 include/uapi/drm/drm_mode.h       | 14 ++++++++++
 5 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 1f47949aa10b..27eba485fe2b 100644
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
index fe59dd1f2c07..093635d43ea3 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -697,6 +697,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	bool replaced = false;
 
 	switch (colorop->type) {
+	case DRM_COLOROP_1D_LUT:
+		size = colorop->lut_size * sizeof(struct drm_color_lut32);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
@@ -746,6 +749,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->lut_size_property) {
+		*val = colorop->lut_size;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index c245a3ff45d3..e799a87f25fe 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -64,6 +64,7 @@
 
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_1D_LUT, "1D LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
 };
 
@@ -265,6 +266,47 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
 	return 0;
 }
 
+/**
+ * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @lut_size: LUT size supported by driver
+ * @return zero on success, -E value on failure
+ */
+int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+					struct drm_plane *plane, uint32_t lut_size)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT);
+	if (ret)
+		return ret;
+
+	/* initialize 1D LUT only attribute */
+	/* LUT size */
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
+					 "SIZE", 0, UINT_MAX);
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
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
+
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane)
 {
@@ -373,6 +415,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_1D_LUT] = "1D LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 };
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index c6d2b289e3cf..fe662e0f89aa 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -259,6 +259,13 @@ struct drm_colorop {
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
@@ -266,6 +273,13 @@ struct drm_colorop {
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
@@ -312,6 +326,8 @@ void drm_colorop_pipeline_destroy(struct drm_device *dev);
 
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs);
+int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+					struct drm_plane *plane, uint32_t lut_size);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index bcc4e9845881..24fd52e16953 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -902,6 +902,20 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_1D_CURVE,
 
+	/**
+	 * @DRM_COLOROP_1D_LUT:
+	 *
+	 * enum string "1D LUT"
+	 *
+	 * A simple 1D LUT of uniformly spaced &drm_color_lut32 entries,
+	 * packed into a blob via the DATA property. The driver's
+	 * expected LUT size is advertised via the SIZE property.
+	 *
+	 * The DATA blob is an array of struct drm_color_lut32 with size
+	 * of "lut_size".
+	 */
+	DRM_COLOROP_1D_LUT,
+
 	/**
 	 * @DRM_COLOROP_CTM_3X4:
 	 *
-- 
2.43.0

