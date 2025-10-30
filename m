Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0ACC1E42E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5746E10E90C;
	Thu, 30 Oct 2025 03:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c1Wnyjyj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A162F10E90C;
 Thu, 30 Oct 2025 03:49:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=issAHn0gVBgqI9KZ/wK788jsrfSUGpRgG4DCWTbmv5JngA2on/qVGgGfd5/5EjNrTaMzoKs23DG4zbQzeoR1wTF4Ld7iKqc5ISxPQq3Bhe6dDB4jo6GnBJNXFZ4V6cK44UVu+5s4LdSJGTGRvmK+8y4OzSRLKFBrey6XWOH0RkPBdQgJ5B4lnvNESkNbS6wo00ku07Gsc+5nt/ehgNPhhPgx1PmAwfIC6MQO9Cg6dVxCD5VZOFDMq6a2YCitoJ/UuQ6UfHKNcXxKehVD9ewUbYnb1zboZeQ5mbJTp+VkHmn3vanhnwT+MW8+ImwS4o7ppBQk9hq5zxvlj93Pbj7Syw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bu+tlMYFnR0kLT0702ZPrzF8miTdA3pT0zVDK8aG+8Q=;
 b=hzfhf7w2VUS68TYIbFp4dXPvvwctlIQAfK0Lxlh/I6apbXvjlmqDbDJuYqGX+z7tLdMU/ysKF3G979k0xVGyDBh7nvUyW2dRqUe3Lr2U361eMde6JDJr0hGSYTn4GLKPsGH7xYXmYUFEO4990g7j3zENrZuOParyjAnWU6qm48EllamStc5ynu/OMOtVQUB2rplATqKd3cOS+NtdZzntb7p4jcjRALWa7Su7hnpmLWbNCzCD1gJ9JiArBlvVNeDt99yAa25m8pcUkk8g471KYHg32LoORG7+HfaKnH/BY3QWBR+nE6mjaJBCLHYWE3gmD0KbY66EX8JEvTKVFxDJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bu+tlMYFnR0kLT0702ZPrzF8miTdA3pT0zVDK8aG+8Q=;
 b=c1Wnyjyj5cMS2HlR+Cg5MmNsqv1sK/zqWwVTF6goKDJFIKrfhm1YUxh1CZbCdwdaVafeHC0Z3sw6hOi+AJHmnNZiGn7eurQ6LrG6NAbmo895A5dK5WVbAlupEPjdJrM4yrkGxucMTaZkQoEHvx+3LWuypoFbbqYh+E2f/XHPIP4=
Received: from BN0PR04CA0111.namprd04.prod.outlook.com (2603:10b6:408:ec::26)
 by MW4PR12MB6923.namprd12.prod.outlook.com (2603:10b6:303:208::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 03:49:16 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::ad) by BN0PR04CA0111.outlook.office365.com
 (2603:10b6:408:ec::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:49:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:49:15 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:49:11 -0700
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
Subject: [PATCH V12 18/49] drm/vkms: add 3x4 matrix in color pipeline
Date: Wed, 29 Oct 2025 21:42:23 -0600
Message-ID: <20251030034349.2309829-19-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|MW4PR12MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2914d3-b03a-4a30-d9ad-08de17674bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rld4NlRqcElhZmlaZ2tQbTVxTlM0ZlZJMEVWKzlkMDZVOTVVNDdpYjBIVmQz?=
 =?utf-8?B?UTYvQUt1UXFORjhja3NXQUtBZnpHRHorQXJHbnpSRUFzdWxMZ1M1OS9US09I?=
 =?utf-8?B?U1FVaXNyZnRaVHUwRlhOTGZld1c5Q29mK2kwZ3RMN3RMbmtxOHo2dXBNVzN3?=
 =?utf-8?B?UjFsUWYrQ1NqR08vbjlnaUpmZDUrd1czTWswVm1JZGc3emRDdUdCSE4ybjU0?=
 =?utf-8?B?QWJnRWNFTWt6ZXJnNCtUQnVINStXVEJ4ZGx2VjlKQUIrY3VmRkJGQlo2bGVv?=
 =?utf-8?B?RlJFdFJjUW5BWG1wazV5eGN1S0phL1kxT0ZsV0hFTUNtOFM1MUxBNzBDWGZG?=
 =?utf-8?B?TVNBMG0vRjNVdDlxT1k5L3U4MjVEMk1YTk1ZLzlwM1N5UHBEakpSck4rYlAy?=
 =?utf-8?B?Nlh3c0ZNbjhpVnNTUDRSeDZWaVROd1JubHZ2K25TQzNPNnZ5WndVd1FUMzI5?=
 =?utf-8?B?Um52WjFuNU5mS3BZSmNEYzdwSWdzSGNScjZWaFBTVDNSWXR1OURHMmQwakFj?=
 =?utf-8?B?Rm5RSmlKNmhEVlJ1ZlgwSm0xbnlTbTdtTzRjY01BaTBCUVdpMkl4MlMxWnRF?=
 =?utf-8?B?bG1lbE1jVTI3alRaYlhuYUpmczh1WDhoa1dJSTBaT0Vud2NmTkNUZHh2SjJk?=
 =?utf-8?B?SW5YOURYODlKT2dWNGgvZzZkK1NoSlRZcHZlMzdua3R2VDFDanVsSXNhSFp4?=
 =?utf-8?B?WEl3ZDhGMnhtZHM1VWhXUlkweFl5T3JPejlFV2laOG9KakRiY0Q1MUtJRC9o?=
 =?utf-8?B?R0VTWit3OTl1djkyTS9GZjZnMGg5NjFjaTVQWGNraE81QlZQRVF1WHlJWlpU?=
 =?utf-8?B?dDgyL1d6YnpOS0VEMHoxTlNKb0pkM01BVzVwcU1WUHlycHEyWXNmckNrdXRR?=
 =?utf-8?B?RUFkTFVUR21RZFF5UWpQMm9QWkppRFd0TFhDN01rNnAxME9CeWQvbkZNRHdy?=
 =?utf-8?B?UUQxOXNrbktPcC9qRy9nTzllREtUQWFaLytsYk9NWGIxMlM0Si9QZy8rS2sz?=
 =?utf-8?B?WFlNM0Rkd3ZGeEpzRG1YRHFCTGd0WDN1V2xFVkZQUHBYL1lySDRVZmdTTDRL?=
 =?utf-8?B?R1c4R0o1bGxVQXdKOUcwWm9sZUpwNFZLK2YvVVA1c0Q1MVJKVmFaNW9HNGJr?=
 =?utf-8?B?TS9VRmx6M1VFRnBMWFpOUHZIaytNYWk3Zkh0b3I1eml3Z3p3ZVd0dWhiY3By?=
 =?utf-8?B?SDlhMmJHS1VkcmwxejdRZ3hqS2FaajZ5T3JsZFE1WEQ2cnV4QkpVY2htNU9a?=
 =?utf-8?B?TWEwNDBtSnJOSUxBcU5VaHhrSU1nZlpnUHVKOUFiOG9JS1NpVTJYNmJuRlR5?=
 =?utf-8?B?eXpNZWZNNnpxR3FNb0ljYitKR2NYV1hQejcvczFBd2p3T0R5R2ZrSFJGbFVZ?=
 =?utf-8?B?Z2wwdms1NExXMXA5c1BXZ1k0NFpub0RNanE3bUJHOTJCcWI3L2VJRVJUdFh3?=
 =?utf-8?B?T2xwckNUMExtYzdjVUN2MHZhMUhQUkp3dGIrS2RPaktsNlBHc0dmY0ZQNEZR?=
 =?utf-8?B?MVozU0Y4WTVNUTQxbUk5R2JHTlA2WjQ2bTI4aW9kSi9NNnk1c3U5Z21zR1VK?=
 =?utf-8?B?WnFGNXFmUHFKODNMTGVMWTFHRU92d2laZEg0YzRKNXZnZTZYRkxNZ1hPOUNK?=
 =?utf-8?B?OXVsWG1yb1o5NTNmeFpCcStvT1FlcWRBd3ZqQ0Q3a3A3Z2VuamQzUy9DYnhm?=
 =?utf-8?B?d2djSUtoTFM2WS9jeloyVHR2ZHpranlqeCtxRkVPL0RINVVzZDNLM1MwbWF1?=
 =?utf-8?B?Um91bitnaUkxOTFhVHZORFdZc2tDWjFwb29vY25Ja3lhTXlMTkJkQ0xvU1dN?=
 =?utf-8?B?U1N1Yy9DVGluK2ppUTRIb0FhZHF1SW92RFYvMzZpVjlWcjB4TVVvRDcraVR3?=
 =?utf-8?B?Y2ZqTnlTeU1JTldvSEcrQU13OHNXR2NjOHBwMjE1UzNZbjgvVTdqSE9ETUVE?=
 =?utf-8?B?N1hMMzlzTjk3cjZiaVZ3SkQ1Z2FpQWYwY0lPdGp1RU4vQytmaXczNzhIdTd0?=
 =?utf-8?B?bi9USnMxVjZqTFlWVEdPRUZDZW5zWGdvSmE4S3kvZVRQZjJCY2dudXZndjRF?=
 =?utf-8?B?RXBjTVRUVE0zbSt2ZFYxaFh4VXE2T1FvZXZvZVNvNWJod3h1QXZVUDJOSlJQ?=
 =?utf-8?Q?iZvc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:49:15.3280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2914d3-b03a-4a30-d9ad-08de17674bc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6923
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

From: Harry Wentland <harry.wentland@amd.com>

We add two 3x4 matrices into the VKMS color pipeline. The reason
we're adding matrices is so that we can test that application
of a matrix and its inverse yields an output equal to the input
image.

One complication with the matrix implementation has to do with
the fact that the matrix entries are in signed-magnitude fixed
point, whereas the drm_fixed.h implementation uses 2s-complement.
The latter one is the one that we want for easy addition and
subtraction, so we convert all entries to 2s-complement.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v11:
 - Fix comments to "2nd op 3x4 matrix" (Nícolas Prado)

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Replace DRM_ERROR with drm_err (Louis Chauvet)

v7:
 - Fix checkpatch warnings
  - Change kzalloc(sizeof(struct drm_colorop) ...) to kzalloc(sizeof(*ops[i]) ...)
  - Change i-1to i - 1
  - Add a new line at EOF

v6:
 - pre-compute colors (Louis Chauvet)
 - round matrix output (Louis Chauvet)

 drivers/gpu/drm/vkms/vkms_colorop.c  | 36 ++++++++++++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_composer.c | 33 +++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 946e9641d940..7aceb0813b2d 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -12,7 +12,7 @@ static const u64 supported_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
 
-#define MAX_COLOR_PIPELINE_OPS 2
+#define MAX_COLOR_PIPELINE_OPS 4
 
 static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
@@ -40,7 +40,39 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* 2nd op: 1d curve */
+	/* 2nd op: 3x4 matrix */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
+	i++;
+
+	/* 3rd op: 3x4 matrix */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
+	i++;
+
+	/* 4th op: 1d curve */
 	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
 	if (!ops[i]) {
 		drm_err(dev, "KMS: Failed to allocate colorop\n");
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 85d6e6703b7e..3e32e9a16ef4 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -127,6 +127,35 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
+static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
+{
+	s64 rf, gf, bf;
+	s64 r, g, b;
+
+	r = drm_int2fixp(pixel->r);
+	g = drm_int2fixp(pixel->g);
+	b = drm_int2fixp(pixel->b);
+
+	rf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), r) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), g) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), b) +
+	     drm_sm2fixp(matrix->matrix[3]);
+
+	gf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), r) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), g) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), b) +
+	     drm_sm2fixp(matrix->matrix[7]);
+
+	bf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), r) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), g) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), b) +
+	     drm_sm2fixp(matrix->matrix[11]);
+
+	pixel->r = drm_fixp2int_round(rf);
+	pixel->g = drm_fixp2int_round(gf);
+	pixel->b = drm_fixp2int_round(bf);
+}
+
 static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
 {
 	struct drm_colorop_state *colorop_state = colorop->state;
@@ -150,6 +179,10 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
 				      colorop_state->curve_1d_type);
 			break;
 		}
+	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
+		if (colorop_state->data)
+			apply_3x4_matrix(pixel,
+					 (struct drm_color_ctm_3x4 *) colorop_state->data->data);
 	}
 }
 
-- 
2.43.0

