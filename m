Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAE4B27782
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16E010EB1C;
	Fri, 15 Aug 2025 04:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GXCEMW77";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2042.outbound.protection.outlook.com [40.107.101.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB4510EB0A;
 Fri, 15 Aug 2025 04:00:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9FFq+/3wPKPJlr9k8btgyQwqW+iQZUcK94sgysKgR42zmem0S2idXLj9/yG8YmtO4J+Y9B17aNvI72Aka17nAQXeCfKRvjrAG6CPVM1vVOFHFIvhJ3B33ZxMRjaF5MG/16bx7sA5dnl6hoPiAOznRO037BlIrVWiy0FUbYQEkR4l2NGwtwKKadqk0gsAH3LQGMbHfAQx0VEN6TfI2iv9r+KxITGwgxl79RK1G2aNLW/Wn+KTUmWZv8Pg5Qv/Sei/2jWhIVQ0pRnvxGUYfl4sMX7orXKSKEO/Mc+Ad7NRfjXZsXHzcwDq4HlgPUANDifA6l8PMK3iZ+UPsJNgmKksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgsyNL01A0eZYS6a7Z76NIr0eGliYJVS7qNkGrZKPVY=;
 b=ZHKfDzkppqWhGsA3hP9LZgor8+PseNLOETmF4pjGqO7lMnTEXtVB4WwLKd2vzXmAQycPV2jCRIbg697k9PGtKjU5UAtbtnpSHXw4cwuLOormW00ESh+VKifsj1g5mbYs2kOwrB6BA3AzDeqWNkKTZl30oz3vjCZxQZOrvi4D1FtjWWmoxokm20M6583X/ce0zIx085SK5vlKlESzWy/lRM3/5/V70+LZbhIO2fCtSRwc7RiB5O1ozHrW0xaC5oIhelnITgXh3t3HzFW/4Br20kDre7lC+Efe2nfZRiDLZfHfvnfRupUkRmQZl3ej3nzuyF/+UbVEfFixL4K8U1FIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgsyNL01A0eZYS6a7Z76NIr0eGliYJVS7qNkGrZKPVY=;
 b=GXCEMW77bP6hGQo5Nlsikojw6t0YXsNnyIzPuwvnXFqQjQMlNvW4nrBn2EuQwGDWrXJF6gUBXyNXGhGTTm0IYoe/jV5fxxuFdN6B5AUh6mgTCuF5ls+ZL0ToxpbfpY/r0ZIiPc0xiuMdatn96ZwYqvM9krdTc5l/KyrOiYNsCro=
Received: from MN0P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::20)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 04:00:19 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::cf) by MN0P222CA0012.outlook.office365.com
 (2603:10b6:208:531::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:00:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:00:18 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:00:15 -0500
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
Subject: [PATCH V11 36/47] drm/amd/display: add shaper and blend colorops for
 1D Curve Custom LUT
Date: Thu, 14 Aug 2025 21:50:25 -0600
Message-ID: <20250815035047.3319284-37-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aad05a0-a36b-4d28-1efa-08dddbb03ff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FiNxQGqPUDtCAJ2wBBZ97XWZwvJDZ0KyTDOYbOdVu5RYn0OY6jPQ5ahQSOdx?=
 =?us-ascii?Q?qNssjbqEKtpTXI9pUs5Eb6cf3U4IfjzCHGtVULUZfBwF/USLEnSB7ICftiKP?=
 =?us-ascii?Q?Nz54lPoF8CTF9tg9/wksGAJF6ay8P5LFcsYP8lxmYjfoowSRJGSYB/UluJMR?=
 =?us-ascii?Q?UTfukyzjxhguH21lxAdg+vVaXNDLIiUEVBqyCGhm4LXEiA64Sol2HxtKRAce?=
 =?us-ascii?Q?l80t5/HueKa35vjDAaJ6tAtBV8Z2ie1UTIdXwzr96Z2/12ITicKFkdipSotS?=
 =?us-ascii?Q?NyVY2n5o/kE3+VeF3yOURDM65XuAPhIFTXyKqA/V7iP9URKA3S/4QNaIycqe?=
 =?us-ascii?Q?sRjiDwoV4AO3JB06DDxID3i3cXiqFH5b0zz1htjs35pOf+4x0jcT3i5DL1F4?=
 =?us-ascii?Q?bjcCjw4y+7MCuLb22SvlvdqT99zGGBsc1I6y5AjXNg018KQTdTxICSrE23RI?=
 =?us-ascii?Q?Ql4TbVqUhzzmKcaIbON/1TBAqLWUn+H4a5tEHEmbKFr8SGr9l/++HqBnK0Cd?=
 =?us-ascii?Q?9QP90KVYSghwtgQau4s15XOpjxgA4hoObtOFgttMOhF/BQdQ2z8aEt4JOItW?=
 =?us-ascii?Q?seC1FpHJzdTSXO1NonCi6P5f3fQfWluY3SzjvkymFr04MXmpBNCBaOyZFTtV?=
 =?us-ascii?Q?Ok33jpsVKBPxsoTqP2H+PzUAMscnqUsaSfaXnGsOmOE4u4P/O9pezqnk1Fhl?=
 =?us-ascii?Q?rA1Ml5pCaspn9/STij4+haVf59E33OQqDJXFr7sxKk12dUnSXx5o0YjUIOIs?=
 =?us-ascii?Q?rhuiDEAg19nECmDfeqY79OpJxRF19P0MkNMb7MvE8Zf7JlJLn/q8RA2cRRBv?=
 =?us-ascii?Q?UmR7hWuxJpHrQBF3zUBAYw9dN9a2TYxKbNqHQCwDHp/U5UugldSirFQ2gIId?=
 =?us-ascii?Q?r7kcG0lHtdXWvrVBGat0/DCzMTlbDZx5VJZXKXvT0pguDtI0yfXygPO95Crh?=
 =?us-ascii?Q?Ga6UpdlGIjd7nAJYGTSP2hG/35/bwuyXEavAcE7iGzgRS2S25U18Un63KgY7?=
 =?us-ascii?Q?UJh7ivtO79H+FLrcsHJKOKei6r2P1nvWI4gu4GIqcgqwI9DRxZm9JDDn8+Yf?=
 =?us-ascii?Q?FI8TZhgx2IIKDnwo7GD0Ie/nskvjgikIg33ASiw6RP1DV17TwL9pMT6WMWUN?=
 =?us-ascii?Q?mgdvkBkjntQoOp5BxI9P+H8dhSdf8ROsR9vgbZUeqQa8DKn2/wjSYXISbyNi?=
 =?us-ascii?Q?KrRrt+dL3cEJ+eyc4DRGAxQ/SC6udfoLK5LHek1dFTkOxIw8oMgVv5QdAEd9?=
 =?us-ascii?Q?0widP4HAuzr0pz8N7gnxEY+utkTfQjOmRV4qUspfaJSx1z+UDaxjxcoMrlnX?=
 =?us-ascii?Q?RygSdA0iQug9DeJ3+x0mJy4fdnFGjas36dUnvtdu05xyLLGhyHGPhdrj8T7F?=
 =?us-ascii?Q?3s68DgRPRRpPF4Q3Sf+a8CoIyPcL7/Ao2m+/zXpUTMJc86EnpuUQhiqsBJPH?=
 =?us-ascii?Q?nq2ym2aZKCZqACk09/fH14xFpCp9mVe6MLQpZ35I5R6WPO8XZ7r7Nhl2pdPR?=
 =?us-ascii?Q?DHLWKnvYj/iOETc7VUqK7LEre5fzBQ+UoSGT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:00:18.9470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aad05a0-a36b-4d28-1efa-08dddbb03ff0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040
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
v11:
 - Update names from *_lut_32_* to *_lut32_* (Simon Ser)
 - Remove redundant is_legacy from __drm_lut_32_to_dc_gamma
 - Fix RGB 32bit extraction from LUT (Xaver Hugl)

v10:
 - Support 32BIT RGB in 1D LUT with drm_color_lut_32 (Uma Shankar)
 - Remove redundant DRM_ERROR(...)

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Return error when __set_output_tf fails (Leo Li)
 - 

v7:
 - Initialize uint32_t blend_size = 0 by default (kernel test robot)
 - Modify state->size to colorop->lut_size

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 300 +++++++++++++-----
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  30 ++
 2 files changed, 251 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index f645f9ded95f..6868e36e7372 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -73,6 +73,7 @@
  */
 
 #define MAX_DRM_LUT_VALUE 0xFFFF
+#define MAX_DRM_LUT32_VALUE 0xFFFFFFFF
 #define SDR_WHITE_LEVEL_INIT_VALUE 80
 
 /**
@@ -342,6 +343,21 @@ __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
 	return blob ? (struct drm_color_lut *)blob->data : NULL;
 }
 
+/**
+ * __extract_blob_lut32 - Extracts the DRM lut and lut size from a blob.
+ * @blob: DRM color mgmt property blob
+ * @size: lut size
+ *
+ * Returns:
+ * DRM LUT or NULL
+ */
+static const struct drm_color_lut32 *
+__extract_blob_lut32(const struct drm_property_blob *blob, uint32_t *size)
+{
+	*size = blob ? drm_color_lut32_size(blob) : 0;
+	return blob ? (struct drm_color_lut32 *)blob->data : NULL;
+}
+
 /**
  * __is_lut_linear - check if the given lut is a linear mapping of values
  * @lut: given lut to check values
@@ -415,6 +431,24 @@ static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
 	}
 }
 
+/**
+ * __drm_lut32_to_dc_gamma - convert the drm_color_lut to dc_gamma.
+ * @lut: DRM lookup table for color conversion
+ * @gamma: DC gamma to set entries
+ *
+ * The conversion depends on the size of the lut - whether or not it's legacy.
+ */
+static void __drm_lut32_to_dc_gamma(const struct drm_color_lut32 *lut, struct dc_gamma *gamma)
+{
+	int i;
+
+	for (i = 0; i < MAX_COLOR_LUT_ENTRIES; i++) {
+		gamma->entries.red[i] = dc_fixpt_from_fraction(lut[i].red, MAX_DRM_LUT32_VALUE);
+		gamma->entries.green[i] = dc_fixpt_from_fraction(lut[i].green, MAX_DRM_LUT32_VALUE);
+		gamma->entries.blue[i] = dc_fixpt_from_fraction(lut[i].blue, MAX_DRM_LUT32_VALUE);
+	}
+}
+
 /**
  * __drm_ctm_to_dc_matrix - converts a DRM CTM to a DC CSC float matrix
  * @ctm: DRM color transformation matrix
@@ -567,6 +601,63 @@ static int __set_output_tf(struct dc_transfer_func *func,
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
+			      const struct drm_color_lut32 *lut, uint32_t lut_size,
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
+		__drm_lut32_to_dc_gamma(lut, gamma);
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
@@ -640,6 +731,42 @@ static int __set_input_tf(struct dc_color_caps *caps, struct dc_transfer_func *f
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
+			     const struct drm_color_lut32 *lut, uint32_t lut_size)
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
+		__drm_lut32_to_dc_gamma(lut, gamma);
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
@@ -1211,38 +1338,6 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
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
@@ -1251,64 +1346,66 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	struct drm_colorop *old_colorop;
 	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
 	struct drm_atomic_state *state = plane_state->state;
-	int i = 0;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	const struct drm_color_lut32 *shaper_lut;
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
+		shaper_lut = __extract_blob_lut32(colorop_state->data, &shaper_size);
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
@@ -1319,28 +1416,63 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	struct drm_colorop *old_colorop;
 	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
 	struct drm_atomic_state *state = plane_state->state;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
+	const struct drm_color_lut32 *blend_lut;
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
 
-		if (new_colorop_state->colorop == old_colorop) {
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE &&
+	    (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
+		drm_dbg(dev, "Blend TF colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		__set_input_tf_32(NULL, tf, blend_lut, blend_size);
+	}
+
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
+		blend_lut = __extract_blob_lut32(colorop_state->data, &blend_size);
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
@@ -1409,7 +1541,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 1D Curve - SHAPER TF */
+	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
 		drm_dbg(dev, "no Shaper TF colorop found\n");
@@ -1420,7 +1552,12 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
@@ -1431,6 +1568,11 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index d7162fab0884..4845f26e4a8a 100644
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

