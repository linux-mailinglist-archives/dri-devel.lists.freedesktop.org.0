Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0040ADC07E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7E510E6D8;
	Tue, 17 Jun 2025 04:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ImDx7Dhq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA31310E687;
 Tue, 17 Jun 2025 04:26:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkunTA4IYr0/UrfIMGT1vJnLJfuiXlaBy0HN0K9RPQEjQmOGdujbXQICQF5rmgNWz1qIJLJ6ntJ4FS2mSw/fe6WXehTvB5e+4hZZo4NqjE0x7uIDBYz8/Fhb39HFUvXNrpjMtgjQC3xo8o4VMVQig4w4/9d7vqRGOrNA+S2VGTWU+99gJor9EBF8eBMMRdpvKKE+urmDaa1IqJ5IA2BLOefoSIS/tBDZDaYG51beCF5DyduF0WOKfpIwFtc66dBnfOHVxLhZxOF9ZbxyG4XrB96oaZScYZ/efQE4Hq58BljmSoFwJS40wIWYkJviZZjrHznfN20IRKSkgy0o/liACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjxI+IPmDgHddmzZQJdBgyizm1lec14zjvEyLVIFLfE=;
 b=tc6QgVFc9Y0ixERDRaqAoDMfFwyZ/Dcr4PRsNZKAAbbxME2rqpwaWxnEp8qI+YCvSagzSBC1uLzM1+P1GZdD1/BN0s/oFfTBOvoFDEZKFEtBoFP1NrY5PWvD33x7aW2GsUuKLeDqzPh2u1nf+CWNUNlD1LOfJRHFwhyvYsUoSvBIJEScE8BygS8VGJxK6wm5Z8nr2/lDZ4k+SvJmLUcVkIpxacYp0lpSnKo9ewGViJwL/nfyyyJ7/iqJUmmb7USL7K9UbtkiYvB4ZjCzlMllpiGNAlOP/uxmHkZ1OIKTdTKcIRiYfMYhJFd+eg7Nv4g7ercREBaJRLRNTOU2aTV+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjxI+IPmDgHddmzZQJdBgyizm1lec14zjvEyLVIFLfE=;
 b=ImDx7Dhqy2dNaKEVnLx9vSrTCo3PoHLDXAHuz9kRzTaC0ynzlBk8AQG2+8Q8pDkJdXuLa7fxnYgP0PWo9rZKGosUIzdNKg7QS5mxnmm+Zi7LkLwi0WoaJXgJjpqa/efKsTFSvhS9RwwYREKUEBKbFZmxEjWnglgY85NIWoEPvSw=
Received: from CH2PR14CA0005.namprd14.prod.outlook.com (2603:10b6:610:60::15)
 by CH1PR12MB9693.namprd12.prod.outlook.com (2603:10b6:610:2b0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:26:33 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::41) by CH2PR14CA0005.outlook.office365.com
 (2603:10b6:610:60::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 04:26:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:26:33 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:26:29 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 35/46] drm/amd/display: add shaper and blend colorops for
 1D Curve Custom LUT
Date: Mon, 16 Jun 2025 22:17:17 -0600
Message-ID: <20250617041746.2884343-36-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|CH1PR12MB9693:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f63d9b-aeb0-47d2-6fd9-08ddad5723e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BgNQve6t3EclXoI3bLc/RmRLApRtkIB9rGUQifGIUitf6MU75v+lBWleqsdc?=
 =?us-ascii?Q?d6IsfH/0O6Hg9ebpIjmeBfbORjgclyvN/vrWZADo7NQem+ay3R4v/DGCAFn/?=
 =?us-ascii?Q?fwQtP6omiHYbYZ3l3OxU1iAKcLBe3q4Iwfs1CAUPNgYI3PZedD0apCiwdeAU?=
 =?us-ascii?Q?yLZGYcIh7wspFn78Tb6AaiSV9ES/A1MurF6ioOhW255YLaWL6KQJJBNhDnAs?=
 =?us-ascii?Q?NhbRCFP1RjPkJIl1yn6/Z2put4k5jclMTnuJ3frF1pGN+H4c9IRuGKDuIEak?=
 =?us-ascii?Q?qRuuzDhNPhAetBqfLPnYn9jyGtyDBxU46D2oBu+o8vOdysCbnPyNAqwIdrZ6?=
 =?us-ascii?Q?FifiVA7QKTuLhl5NPTYnr0X5pLAA0pPgymJYRCg1+ynwYDrmFj2xMRobGsZm?=
 =?us-ascii?Q?Kj3W3zTM16DzpI32AHfzwO/GmyBLJ2iZt8AMNYKARS1p89n6VrByYOHVSX8N?=
 =?us-ascii?Q?S2+1opzga0FqvW5MJKzzoVQAQAYevh+GyNLS0fXbEygbuShyJyxbCmtjaANu?=
 =?us-ascii?Q?JZ26s3Xsu1rLJo87C7qo42N6KkIVcZOqfM5YfEJsvLRrIPgTo/YfECbF6q4j?=
 =?us-ascii?Q?VsNPWObEM3TPkBUAYnS8xbHxdc1XXRpOQ2nPiW4ksiRblt026Nbk4ZokcGre?=
 =?us-ascii?Q?PFTT8/ClGXewt9JDXEMKM42ndDLRqc8fjgIZ1C8J28yqnoyDUkd8W4IqxOes?=
 =?us-ascii?Q?k3xyR9y8CX87W7PwxHAdUnMPPqNq2sTB3MXo1bhzkt3afBMhPfqKholhP/47?=
 =?us-ascii?Q?gXvzwiTeYdcCKQ46qV/hjys9Q5Ntuipfr0MTN2yxpYTrUl/HnQpMC6dV8Vw2?=
 =?us-ascii?Q?dRPjTjv67IUtOORmnxsHirF6K53htY/dS6P8LhEZrP2VElnOv8yBjWcY7D36?=
 =?us-ascii?Q?cU21aWMnyEOGjq0pKHNA7pmsUyzEGyTkQxFNFHI9x6Ep0sr+w3yAiuaXukby?=
 =?us-ascii?Q?iOraCiD8+I0KL2uQz8yOWh/oin/ZYXew9gUwBPQo8V4Iznry+APyESYzUzXP?=
 =?us-ascii?Q?tGqLg5WxWLnO1cnNqDYwVlzVvPaX0JHzj+sETaQpdJGmm1UaPwMiNfCFylRL?=
 =?us-ascii?Q?N39hnv8UrTl8hD135j/9qDbuDwUSCw3Amx+3AwHDSVMwuWNYSgrKkbKrkx9e?=
 =?us-ascii?Q?M9gE7Roq1Fqi8MtNe9vUZRo0w9V8R/TKvC+pgcI6tUjmmoiZOyU+wv2JPptz?=
 =?us-ascii?Q?T2IEfh7VVaJIVceclyiA1VNZwMBVQDGnv+Xq9fdnAy1KfvKvCPHAh9pRcXAL?=
 =?us-ascii?Q?NFVw8buSz1hOFOpDhl6WG+vi6IwiXnImuiSQgDXIrytIRzmQ+AUj/P/VVqXx?=
 =?us-ascii?Q?DvaH37y5iBsDM6mOCqabEYIh8D2qscpOjc+x4s0xJS6TIUHvSCdPmH1Qmsaf?=
 =?us-ascii?Q?mNEQOu2E9bZX7FdPEHkEOX2bzCA0Qa5LKdU6hByaAtTfGyAfzqxAw6tzZzlZ?=
 =?us-ascii?Q?BLFkvU4ghJMNLe7sZbl5HfLldKKA6prljUQrjShKQjYVNbKhSCsQ+wx1OUgi?=
 =?us-ascii?Q?KgAkJZblFRNlJ/1qLR8fDpSzNwBYCMvuLULN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:26:33.2187 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f63d9b-aeb0-47d2-6fd9-08ddad5723e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9693
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

This patch adds colorops for custom 1D LUTs in the SHAPER and
BLND HW blocks.

With this change the following IGT tests pass:
kms_colorop --run plane-XR30-XR30-srgb_inv_eotf_lut
kms_colorop --run plane-XR30-XR30-srgb_inv_eotf_lut-srgb_eotf_lut

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. 1D curve colorop
3. 1D LUT
4. 1D curve colorop
5. 1D LUT

The 1D curve colorops support sRGB, BT2020, and PQ scaled to 125.0.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V10:
 - Support 32BIT RGB in 1D LUT with drm_color_lut_32 (Uma Shankar)
 - Remove redundant DRM_ERROR(...)

V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Return error when __set_output_tf fails (Leo Li)
 - 

v7:
 - Initialize uint32_t blend_size = 0 by default (kernel test robot)
 - Modify state->size to colorop->lut_size

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 306 +++++++++++++-----
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  30 ++
 2 files changed, 257 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index f645f9ded95f..2b97a262b1c0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -73,6 +73,7 @@
  */
 
 #define MAX_DRM_LUT_VALUE 0xFFFF
+#define MAX_DRM_LUT_32_VALUE 0xFFFFFFFF
 #define SDR_WHITE_LEVEL_INIT_VALUE 80
 
 /**
@@ -342,6 +343,21 @@ __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
 	return blob ? (struct drm_color_lut *)blob->data : NULL;
 }
 
+/**
+ * __extract_blob_lut_32 - Extracts the DRM lut and lut size from a blob.
+ * @blob: DRM color mgmt property blob
+ * @size: lut size
+ *
+ * Returns:
+ * DRM LUT or NULL
+ */
+static const struct drm_color_lut_32 *
+__extract_blob_lut_32(const struct drm_property_blob *blob, uint32_t *size)
+{
+	*size = blob ? drm_color_lut_32_size(blob) : 0;
+	return blob ? (struct drm_color_lut_32 *)blob->data : NULL;
+}
+
 /**
  * __is_lut_linear - check if the given lut is a linear mapping of values
  * @lut: given lut to check values
@@ -415,6 +431,30 @@ static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
 	}
 }
 
+/**
+ * __drm_lut_32_to_dc_gamma - convert the drm_color_lut to dc_gamma.
+ * @lut: DRM lookup table for color conversion
+ * @gamma: DC gamma to set entries
+ * @is_legacy: legacy or atomic gamma
+ *
+ * The conversion depends on the size of the lut - whether or not it's legacy.
+ */
+static void __drm_lut_32_to_dc_gamma(const struct drm_color_lut_32 *lut, struct dc_gamma *gamma)
+{
+	uint32_t r, g, b;
+	int i;
+
+	for (i = 0; i < MAX_COLOR_LUT_ENTRIES; i++) {
+		r = drm_color_lut_extract(lut[i].red, 32);
+		g = drm_color_lut_extract(lut[i].green, 32);
+		b = drm_color_lut_extract(lut[i].blue, 32);
+
+		gamma->entries.red[i] = dc_fixpt_from_fraction(r, MAX_DRM_LUT_32_VALUE);
+		gamma->entries.green[i] = dc_fixpt_from_fraction(g, MAX_DRM_LUT_32_VALUE);
+		gamma->entries.blue[i] = dc_fixpt_from_fraction(b, MAX_DRM_LUT_32_VALUE);
+	}
+}
+
 /**
  * __drm_ctm_to_dc_matrix - converts a DRM CTM to a DC CSC float matrix
  * @ctm: DRM color transformation matrix
@@ -567,6 +607,63 @@ static int __set_output_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
+/**
+ * __set_output_tf_32 - calculates the output transfer function based on expected input space.
+ * @func: transfer function
+ * @lut: lookup table that defines the color space
+ * @lut_size: size of respective lut
+ * @has_rom: if ROM can be used for hardcoded curve
+ *
+ * Returns:
+ * 0 in case of success. -ENOMEM if fails.
+ */
+static int __set_output_tf_32(struct dc_transfer_func *func,
+			      const struct drm_color_lut_32 *lut, uint32_t lut_size,
+			      bool has_rom)
+{
+	struct dc_gamma *gamma = NULL;
+	struct calculate_buffer cal_buffer = {0};
+	bool res;
+
+	cal_buffer.buffer_index = -1;
+
+	if (lut_size) {
+		gamma = dc_create_gamma();
+		if (!gamma)
+			return -ENOMEM;
+
+		gamma->num_entries = lut_size;
+		__drm_lut_32_to_dc_gamma(lut, gamma);
+	}
+
+	if (func->tf == TRANSFER_FUNCTION_LINEAR) {
+		/*
+		 * Color module doesn't like calculating regamma params
+		 * on top of a linear input. But degamma params can be used
+		 * instead to simulate this.
+		 */
+		if (gamma)
+			gamma->type = GAMMA_CUSTOM;
+		res = mod_color_calculate_degamma_params(NULL, func,
+							 gamma, gamma != NULL);
+	} else {
+		/*
+		 * Assume sRGB. The actual mapping will depend on whether the
+		 * input was legacy or not.
+		 */
+		if (gamma)
+			gamma->type = GAMMA_CS_TFM_1D;
+		res = mod_color_calculate_regamma_params(func, gamma, gamma != NULL,
+							 has_rom, NULL, &cal_buffer);
+	}
+
+	if (gamma)
+		dc_gamma_release(&gamma);
+
+	return res ? 0 : -ENOMEM;
+}
+
+
 static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
 					const struct drm_color_lut *regamma_lut,
 					uint32_t regamma_size, bool has_rom,
@@ -640,6 +737,42 @@ static int __set_input_tf(struct dc_color_caps *caps, struct dc_transfer_func *f
 	return res ? 0 : -ENOMEM;
 }
 
+/**
+ * __set_input_tf_32 - calculates the input transfer function based on expected
+ * input space.
+ * @caps: dc color capabilities
+ * @func: transfer function
+ * @lut: lookup table that defines the color space
+ * @lut_size: size of respective lut.
+ *
+ * Returns:
+ * 0 in case of success. -ENOMEM if fails.
+ */
+static int __set_input_tf_32(struct dc_color_caps *caps, struct dc_transfer_func *func,
+			     const struct drm_color_lut_32 *lut, uint32_t lut_size)
+{
+	struct dc_gamma *gamma = NULL;
+	bool res;
+
+	if (lut_size) {
+		gamma = dc_create_gamma();
+		if (!gamma)
+			return -ENOMEM;
+
+		gamma->type = GAMMA_CUSTOM;
+		gamma->num_entries = lut_size;
+
+		__drm_lut_32_to_dc_gamma(lut, gamma);
+	}
+
+	res = mod_color_calculate_degamma_params(caps, func, gamma, gamma != NULL);
+
+	if (gamma)
+		dc_gamma_release(&gamma);
+
+	return res ? 0 : -ENOMEM;
+}
+
 static enum dc_transfer_func_predefined
 amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
 {
@@ -1211,38 +1344,6 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }
 
-static int
-__set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
-		       struct drm_colorop_state *colorop_state)
-{
-	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
-	struct drm_colorop *colorop = colorop_state->colorop;
-	struct drm_device *drm = colorop->dev;
-
-	if (colorop->type != DRM_COLOROP_1D_CURVE)
-		return -EINVAL;
-
-	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs))
-		return -EINVAL;
-
-	if (colorop_state->bypass) {
-		tf->type = TF_TYPE_BYPASS;
-		tf->tf = TRANSFER_FUNCTION_LINEAR;
-		return 0;
-	}
-
-	drm_dbg(drm, "Shaper colorop with ID: %d\n", colorop->base.id);
-
-	if (colorop->type == DRM_COLOROP_1D_CURVE) {
-		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
-		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
-		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
-		return __set_output_tf(tf, 0, 0, false);
-	}
-
-	return -EINVAL;
-}
-
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1251,64 +1352,66 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	struct drm_colorop *old_colorop;
 	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
 	struct drm_atomic_state *state = plane_state->state;
-	int i = 0;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	const struct drm_color_lut_32 *shaper_lut;
+	struct drm_device *dev = colorop->dev;
+	uint32_t shaper_size;
+	int i = 0, ret = 0;
 
+	/* 1D Curve - SHAPER TF */
 	old_colorop = colorop;
-
-	/* 2nd op: 1d curve - shaper */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
 		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
-
-		if (new_colorop_state->colorop == old_colorop) {
-			colorop_state = new_colorop_state;
-			break;
-		}
 	}
 
-	if (!colorop_state)
-		return -EINVAL;
-
-	return __set_colorop_in_shaper_1d_curve(dc_plane_state, colorop_state);
-}
-
-
-static int
-__set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
-				  struct drm_colorop_state *colorop_state)
-{
-
-	struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
-	struct drm_colorop *colorop = colorop_state->colorop;
-	struct drm_device *drm = colorop->dev;
-	const struct drm_color_lut *blend_lut;
-	uint32_t blend_size = 0;
-
-	if (colorop->type != DRM_COLOROP_1D_CURVE)
-		return -EINVAL;
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE) {
+		drm_dbg(dev, "Shaper TF colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		ret = __set_output_tf(tf, 0, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs))
+	/* 1D LUT - SHAPER LUT */
+	colorop = old_colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Shaper LUT colorop found\n");
 		return -EINVAL;
-
-	if (colorop_state->bypass) {
-		tf->type = TF_TYPE_BYPASS;
-		tf->tf = TRANSFER_FUNCTION_LINEAR;
-		return 0;
 	}
 
-	drm_dbg(drm, "Blend colorop with ID: %d\n", colorop->base.id);
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
 
-	if (colorop->type == DRM_COLOROP_1D_CURVE) {
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT) {
+		drm_dbg(dev, "Shaper LUT colorop with ID: %d\n", colorop->base.id);
 		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
-		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->tf = default_tf;
 		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
-		return __set_input_tf(NULL, tf, blend_lut, blend_size);
+		shaper_lut = __extract_blob_lut_32(colorop_state->data, &shaper_size);
+		shaper_size = shaper_lut != NULL ? shaper_size : 0;
+
+		/* Custom LUT size must be the same as supported size */
+		if (shaper_size == colorop->lut_size) {
+			ret = __set_output_tf_32(tf, shaper_lut, shaper_size, false);
+			if (ret)
+				return ret;
+		}
 	}
 
-	return -EINVAL;
+	return 0;
 }
 
 static int
@@ -1319,28 +1422,63 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	struct drm_colorop *old_colorop;
 	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
 	struct drm_atomic_state *state = plane_state->state;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
+	const struct drm_color_lut_32 *blend_lut;
+	struct drm_device *dev = colorop->dev;
+	uint32_t blend_size;
 	int i = 0;
 
+	/* 1D Curve - BLND TF */
 	old_colorop = colorop;
-
-	/* 3nd op: 1d curve - blend */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
 		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE &&
+	    (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
+		drm_dbg(dev, "Blend TF colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		__set_input_tf_32(NULL, tf, blend_lut, blend_size);
+	}
 
-		if (new_colorop_state->colorop == old_colorop) {
+	/* 1D Curve - BLND LUT */
+	colorop = old_colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Blend LUT colorop found\n");
+		return -EINVAL;
+	}
+
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
 			colorop_state = new_colorop_state;
 			break;
 		}
 	}
 
-	if (!colorop_state)
-		return -EINVAL;
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT &&
+	    (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
+		drm_dbg(dev, "Blend LUT colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf;
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		blend_lut = __extract_blob_lut_32(colorop_state->data, &blend_size);
+		blend_size = blend_lut != NULL ? blend_size : 0;
 
-	return __set_colorop_1d_curve_blend_tf_lut(dc_plane_state, colorop_state);
+		/* Custom LUT size must be the same as supported size */
+		if (blend_size == colorop->lut_size)
+			__set_input_tf_32(NULL, tf, blend_lut, blend_size);
+	}
+
+	return 0;
 }
 
 static int
@@ -1409,7 +1547,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 1D Curve - SHAPER TF */
+	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
 		drm_dbg(dev, "no Shaper TF colorop found\n");
@@ -1420,7 +1558,12 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 1D Curve - BLND TF */
+	/* Shaper LUT colorop is already handled, just skip here */
+	colorop = colorop->next;
+	if (!colorop)
+		return -EINVAL;
+
+	/* 1D Curve & LUT - BLND TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
 		drm_dbg(dev, "no Blend TF colorop found\n");
@@ -1431,6 +1574,11 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* BLND LUT colorop is already handled, just skip here */
+	colorop = colorop->next;
+	if (!colorop)
+		return -EINVAL;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 5c84c6a5a74a..427fe5050d0d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -29,6 +29,7 @@
 #include <drm/drm_property.h>
 #include <drm/drm_colorop.h>
 
+#include "amdgpu.h"
 #include "amdgpu_dm_colorop.h"
 
 const u64 amdgpu_dm_supported_degam_tfs =
@@ -88,6 +89,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 1D LUT - SHAPER LUT */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
 	/* 1D curve - BLND TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
@@ -101,6 +117,20 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	drm_colorop_set_next_property(ops[i-1], ops[i]);
 
+	i++;
+
+	/* 1D LUT - BLND LUT */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
 	return 0;
 
 cleanup:
-- 
2.43.0

