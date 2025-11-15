Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89815C5FB52
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0B710ECE1;
	Sat, 15 Nov 2025 00:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uChrMcJy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012058.outbound.protection.outlook.com [40.107.209.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E2A10ECD1;
 Sat, 15 Nov 2025 00:13:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BamKlV5ZYWkSJfUwouquANbOZb2guCOZ2mLErAImYCawFbAQwioswjIzVI9uI+ZxALLvmJMEKIBb1b7rOs6GHBkBqKGHik50mXV5HnQMEUqagNOTPDdATUcMe/odlb0prqElzKaeEs7xKM8MU9yo81+ipeUptJTXgcuGA7dH6PvLe4mI7ezV5DwoE4AryD9o1VjThiakKWQbLMMpw5J3tQvIM/BL+zwhKEXg2dn+Ucq3ww7CAXlG2PvOgmv0d4oFSRf3NyVzxB7yZhyNlc/8KHvF3UEkUSmDYIckaD7u7BIdUbbcNu51YLBbZqhBFMdpmQHabIjD4wJXeaDbmH9jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDVNdxchLJ5A5OsZnqCj55l1ofsxcZ56Fnn4/VD4E0E=;
 b=B3b+/csCZhAJmY7NgTGiLlTb82JXfeJ3aV1vo84ojlTjWWTuycS4n+Od3hkrS0mN1eetKWJQxfUEpwLlBbAQ8hmESYukxhJhca7n41xW3g4h5ux0KgApWqppOTyGdw5QmlDeZOhH0kN+qb3o1ZznNIE5Pc0oS+F8cBK0vp0HwdHAdvvlDvTIUCHs3fqMCrOtbA5+8buR8P9kvRHhI2HSdFLoj5WWFT3ogmVvKoUrgUqPPKGk6yy7gE+5GKFL6StbhUYo4/U0iukXt32LuZOgZw1TruAo95OYdBKZpj+SPPHWIVhoKawOMzrFedrqNQgdT3j3VLTFG/Gh4UJznRGopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDVNdxchLJ5A5OsZnqCj55l1ofsxcZ56Fnn4/VD4E0E=;
 b=uChrMcJy1QultV3V2SUaFk1FNyQrW4G4hkloVoppfxGFAz5TZ9IiE8I7QKuMI9bvlEt7vvglAG97mTzoIz4HcBWSwhUjncnhXsVtbcewgeNJjfzABSL+CBPxdSC4vNSP6RoTrRCSiXRXyhQ7qNbw2/3nB63OyxrXYo653nw/tnY=
Received: from PH5P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::16)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:12:54 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::dd) by PH5P220CA0004.outlook.office365.com
 (2603:10b6:510:34a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:13:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:12:53 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:12:47 -0800
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
Subject: [PATCH V13 38/51] drm/amd/display: add shaper and blend colorops for
 1D Curve Custom LUT
Date: Fri, 14 Nov 2025 17:02:03 -0700
Message-ID: <20251115000237.3561250-39-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de96366-e437-408b-1b9f-08de23dbb8c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NeCv7v8Z93YiNuv6v2Sg4F+oJtivcKZlpmD+nvF0/06RSv0TyVfOQy3uOkY6?=
 =?us-ascii?Q?FpzjW9W+mXAs/DazyXtLdRcimcmO7QgJy/6DC8Gml9Hg5DXaSzcbIoSLGnXc?=
 =?us-ascii?Q?f6SYm2/TURlKdCJ1ceB9KFLZnozbcsemhB6MAQ8zwigQNYBmTrECwU22oO0z?=
 =?us-ascii?Q?QyadO6f5H65RLvFnMpKNoGsmc/DhscZqZpF1zMt8n9ZAdJMyDY2TFvmMFljZ?=
 =?us-ascii?Q?xreQEYPIwgpjRIE6ejxsw7tRNvXTZOxvS+RrwGGh8eKgCcoWpFgAmNwdo2tC?=
 =?us-ascii?Q?NcJTn6gP5eLyXaWdm/PTk9R2/ALH3yhrUaeD+j/R/vfCEieqG+PpdTnucM4N?=
 =?us-ascii?Q?YHdFuebfIou42DyknVLT10oB5SVoLr7aoRucNUfNdoqXTIT/c9ZkJ9pcBEUx?=
 =?us-ascii?Q?rXCvyE7UgS8GI8yVMFKSQ3+V1mExLRUFp6AAYhCC0VKCklGtTijy19I/63IN?=
 =?us-ascii?Q?KmO9d58U3vnXDrqXEzerTL3irBySYJvNIdbV1ufpwCoJ6GarEhQlniaUpJQ2?=
 =?us-ascii?Q?eLvz9w09pGAcYkKoT+FFaUOVgDkyin/eQ3nfNtzdDJrjZTN8qsNamrzTCXkH?=
 =?us-ascii?Q?91+tzcU6yu8bUShTCJvS39E0yQGdTdmJwpkTVYzZCnracSWJx2n7oYA2/wB1?=
 =?us-ascii?Q?dz9jEFzCWvczdZicG7m3HNt636nD3MZcvwJbKV3o/VdYVhynlYYOI/Njywq2?=
 =?us-ascii?Q?MzmjIccu8xvqPXpHct02E8j8+TsBAr6C2YfWQZymgUbhSbRGHDiCxs36hX7w?=
 =?us-ascii?Q?Ly3XeqO95KIw02dMe1jtncE9Rplt1BeRALSSpH6it1dhAWqv+B2p/k1/+Or2?=
 =?us-ascii?Q?gb2cE4YkKWPX0fvTmPPkJEF06tUMw9xkpcShbpNfTvgquxKy0qJCM3p25QyR?=
 =?us-ascii?Q?PZ1cV33xghAebeiVQzCl2X8Sbko3/kavkq3KS807cTMgML16ZFJ+KSoRpFqr?=
 =?us-ascii?Q?vrb/hdwOznJhpe5CcZf0tI4QQepYdxGOJTS/YrdUDfq4bIaeaWTt00znzJY3?=
 =?us-ascii?Q?GiB2t9b/DlPGQ3rkvL2yoh+TH3ux5lYmNI3XcY/7FZvgm+KdYqN8hB0TiYP1?=
 =?us-ascii?Q?hSgmvrqdKn6lJ6aEXstqCaGyPhJRwnnhfrOQ2EfmoDGzfn4E0cXcql0upvVu?=
 =?us-ascii?Q?JLFZAqwc/WMn5YhBEsxHqQW+9qsuuuz2HQTxr030Y2oalu1vMfiSWiZyKVOA?=
 =?us-ascii?Q?yYQuil5v3U/XcS6Ny/yywGfzHk2ARuh14FlPbvYAOfmJ3J92dcKKt2Ki5aF/?=
 =?us-ascii?Q?eng5kirN5QNPLRfxvz7CdsDtuP7PRIcB1Cs0VdQnKAJYdEaKEkffQPjif8L/?=
 =?us-ascii?Q?yJ16dplj0Pjrhk39vXYwKjJgwuTNE9Jh+65yicgUjVZW7ZohTNayxDSEwtS6?=
 =?us-ascii?Q?XezaNXPxAIUgQUSsDMnbiFXAwq1k3fykkRGpSyq1PLdMqlfQSbbeFs7nCupQ?=
 =?us-ascii?Q?HlvFlLIpeNhkcj4FI1fiuAyNvv7S2s8l6kvCyZ7H0tNvSp84JlUyzUNct0L/?=
 =?us-ascii?Q?U29l6EdZfX+SxvX2hFXVIhjdRvWe+U10jG8RyXLLEc5KCX03DpnbpogVz9+r?=
 =?us-ascii?Q?cwMMfRaeQ3c66xI+smo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:12:53.6723 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de96366-e437-408b-1b9f-08de23dbb8c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731
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
index de195b94ac4d..b958f9c0a0c2 100644
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
 static int amdgpu_dm_set_atomic_regamma(struct dc_transfer_func *out_tf,
 					const struct drm_color_lut *regamma_lut,
 					uint32_t regamma_size, bool has_rom,
@@ -639,6 +730,42 @@ static int __set_input_tf(struct dc_color_caps *caps, struct dc_transfer_func *f
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
@@ -1251,38 +1378,6 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
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
@@ -1291,64 +1386,66 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
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
-	const struct drm_color_lut *blend_lut = NULL;
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
+		if (shaper_size == colorop->size) {
+			ret = __set_output_tf_32(tf, shaper_lut, shaper_size, false);
+			if (ret)
+				return ret;
+		}
 	}
 
-	return -EINVAL;
+	return 0;
 }
 
 static int
@@ -1359,28 +1456,63 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	struct drm_colorop *old_colorop;
 	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
 	struct drm_atomic_state *state = plane_state->state;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
+	const struct drm_color_lut32 *blend_lut = NULL;
+	struct drm_device *dev = colorop->dev;
+	uint32_t blend_size = 0;
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
+		blend_lut = __extract_blob_lut32(colorop_state->data, &blend_size);
+		blend_size = blend_lut != NULL ? blend_size : 0;
 
-	return __set_colorop_1d_curve_blend_tf_lut(dc_plane_state, colorop_state);
+		/* Custom LUT size must be the same as supported size */
+		if (blend_size == colorop->size)
+			__set_input_tf_32(NULL, tf, blend_lut, blend_size);
+	}
+
+	return 0;
 }
 
 static int
@@ -1449,7 +1581,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 1D Curve - SHAPER TF */
+	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
 		drm_dbg(dev, "no Shaper TF colorop found\n");
@@ -1460,7 +1592,12 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
@@ -1471,6 +1608,11 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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

