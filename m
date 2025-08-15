Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7D7B27750
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D977610E99E;
	Fri, 15 Aug 2025 03:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U2clvAc9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD35A10E9E2;
 Fri, 15 Aug 2025 03:56:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuDiJwh2rBOZAEWv5pHjpyHj2BNKSS+yPe1Gbm319KYiDlkWVjIIP1yeiqGQiEKt30onYON4N5IBUcE/XUNXBXSp0cz1xp9N3gISiFS3I+6iSnr4ZlqS+YUSwKdcL444nuqeFIc65XtBWJ2MvX2NtLV8m9gxEzVePBEflJdbqTrHyHrLoOxzR8+GnXVF9olJO3mKmOIvyRQdd0psLTqx6AS7OsUBRTrAWQkF9tlEAqs+I8U4g2ebDGrJCtgG9s+/f+BDnVqpd9uSwFdhn4x5ipnKR0whizuW5/T5TDnQmsxovWTrswsNlfZTE0wqke86WONtWnxrnSlY+HqJ054ZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6J848/y8GFu5W2LDXZaJCHgiW9FhH1lXwWzDuK+eqI=;
 b=Po4yDJDVtPKHGuJ4GYctGZHreaKvL+pGQxB4du5kpsxxJWxrc59bqle/PNqZ49LXLoc8eWeyCRbXdseAvUYA6Piu3ZUzP+CG+mzgBEtGbhavKMTr6immgwCHa45RiubC9dAq5wwxdZLutMbPUAeuiPIcNIaik7tl7zAltcKULXqsgfUuy4OnowI04BlA1RvX0/bTY0DyJSjzYXrddlyGNzfFitBukoH9AQWpG90gBolxwKQZNnJtr0sfR0y7Hc/ZT5gNRR/BrtM0q8rm4MoKfnTF1v7Fmpd20hyliWaee6u+KbsV2ID6vnulbCTHIjyVyqwv/m1V/AB8WXE9KHyXSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6J848/y8GFu5W2LDXZaJCHgiW9FhH1lXwWzDuK+eqI=;
 b=U2clvAc9Aboca9VUFOPwGSLVfafgbqt7ICCOUblwQS743hGiGE2RUWyCI0C+UIjROVIsRpFPXiADElTe44st9X2JDhKAwOiWYVIrEY1WExHbijc9DxvM37F0ekzCxxHBtxBXZJwYQx/2Cd++2sKAJ4+k0j/RFut3HlEIxwt2GYE=
Received: from MW3PR06CA0001.namprd06.prod.outlook.com (2603:10b6:303:2a::6)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Fri, 15 Aug
 2025 03:55:59 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:303:2a:cafe::a3) by MW3PR06CA0001.outlook.office365.com
 (2603:10b6:303:2a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:55:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:55:58 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:55:55 -0500
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
Subject: [PATCH V11 18/47] drm/vkms: add 3x4 matrix in color pipeline
Date: Thu, 14 Aug 2025 21:50:07 -0600
Message-ID: <20250815035047.3319284-19-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|MN2PR12MB4424:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b13771-760a-47e3-2b5f-08dddbafa4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlhQNEdRdnFwUXdKTy9Ta3lLc2pDMW5rbzBTSzRQZUZvbmRNaXZaSUNFbUFm?=
 =?utf-8?B?SCt6aHNuRldJV0pxbUgzRVVCSThtR2Y5VzA4c0l0NjAzM2hDZis0OUtiMjBl?=
 =?utf-8?B?cVlKRFRySEhnVDZOWWRFeG1PVkNKOC94bUJVV1lOb2d6clcwc1dxcW9kd3NG?=
 =?utf-8?B?a1o5NDUwMEIxUWQ2aGJIOXFDNDJHMm1YSG1TcEFEZlRKK05uMVl3STdrbHNs?=
 =?utf-8?B?L20wR3NzYStCM1dwYUNUbVczSUxaYkNPaVROc3o4UC9QMisvWGNaTzNDWVhw?=
 =?utf-8?B?RmkxQU56NWJpOXc1cVNZNGhrb1hUNHhGTmdUYWMydThyRWZqZXJLWjBSa2pi?=
 =?utf-8?B?bGI5aExIT21sb2lPQU1RTXNXeHNNMDlXWHpMcU9wbE50eWZiaWhxcnhNZHlD?=
 =?utf-8?B?dHVvakh6UE5XL0ZlaGZKSVN0ZEdadUJSQVFPaDRLN08vb3Z5Nzl4ZkFwSGRq?=
 =?utf-8?B?OXpkUTZmR2wyVnJtVjgxQk01RURHY01HRDdvbU9GZjZwN3NaeERrM3Y0QVRr?=
 =?utf-8?B?c2dlNUxoaUpDVXFMOTR0dVJicFhqMS9Qb1dOTDZLV1VVRHpYOExEMFRzNU1k?=
 =?utf-8?B?czhzOVdqdUdlVTUrUUVBZTAwV2ZTbS8zSXFhSW5KTDFpejJvVXdxL0FjMm9N?=
 =?utf-8?B?NUYxVHYrc2pSeFIxMlYzUmxQQXl6V1lxT3l6Nks2VThuaUxwVWg1enY3V3V2?=
 =?utf-8?B?eG1STEJ0dmxFWVBDV2xmMkhVMjJBa2Q0RW5iZ2F2YXF6cWJ4M3pjUStPSXdi?=
 =?utf-8?B?bDZKLzBNVDdkaHB3NUpPaTE1TlFlNVNIa2xKYW1yRm41WTVRamsva0MzRG9J?=
 =?utf-8?B?eWdPd3ZLY1gvV1ZVb0ZxdlFtNWRTTFNDYThSSzg5QmtDR3R1OHROdlN2TDBE?=
 =?utf-8?B?SCtoSEtDcUJyaE52SlBMM0NCSCsxaGlwL2FiSElyYlVLN3BERmJOZzB2YXNv?=
 =?utf-8?B?ZEV6c2ltN3hwK1lteWJOQmhReUxITGlsWDY5WU1IMHk1ZVNMcjF6SWl3RCtu?=
 =?utf-8?B?NUFlNkF5aEpLdXl5a2tOSExyUjdJbEx2OFZHM240ZldFMDVxN1duU2tMcVhs?=
 =?utf-8?B?S3orMUV2WENIYnZEUmFCWUtiVU1IS2JVdHJvMGwzeU1DOUhQdVdmYUVST3gy?=
 =?utf-8?B?bWFNUmJuNkFWQmdmcGl5M1ZoTmg5M1R1ak56NFZYL2ZRbXR3TjZGNlRVRUVn?=
 =?utf-8?B?YkRGNHQxS3p3OWZnUDJLVnh3dnEwdHpIeXZKZEx5SXc2YVVXa0lLZXB3Q0VZ?=
 =?utf-8?B?NUFBbTBmdGxXS2dJZzZySGlIY3psalE1UWEvVnZISW5zanpJTGQ1UWxGWXBp?=
 =?utf-8?B?ZWtRMk1xN3NrUkxhV1VDT3N0MU14TmxnL2lhOTJ6ZUU3S1pGV2ZpTnh5cHZu?=
 =?utf-8?B?NHNqaEpWak05OUZvR3lGRCtld3FDTnljbWgvUWwxMjgrdUx2Q1NrOEltOHow?=
 =?utf-8?B?ZDFpSUg2aVBuY2wvZDE1M1Vvanl0VkxlOVN3R1R0OE9MYmljdHliTE9zOWlB?=
 =?utf-8?B?MUwzNDhteXdNNVBJcWplMlZWY09zcEY2UGJCYUt4SngrSmFYOFZqOWorRU55?=
 =?utf-8?B?MTlybDYwOXZabDFrVk1abFZobnlycW1rMkFZSEd4bDBYZEduUlJGMUlkQU9G?=
 =?utf-8?B?MVMvcnZLYkZvTXNyRkZ1MFVPZXJ5OGpnVm1DajcveE9TUnFhdjJBRWtsRE80?=
 =?utf-8?B?a3BZT2lYU01BTVlPUlFrZEs5S2p2eGJ5SDVwOHd5MFpENzczcVdjT2VUTUty?=
 =?utf-8?B?bEVxUXdWeXJQMXdWU0hsUXNOQkplNWVzUTRZeDZTVWtKeW5iV2FtNGErdUdV?=
 =?utf-8?B?MTJRR3VYZS8rWTRnT2ZGS21KYWVmQUV0N2dtZllBTHhNR1BERmEvSkNISFhC?=
 =?utf-8?B?WTJ2OGhyU3hCcWNySlFVeHIvTzF5dzM4Q0pvK291dUx2N240QVJpWWFiSUFn?=
 =?utf-8?B?ZnJ4cUV6ZVpkSUwwZVM0OUM2ckQweHlmV0QzK3BScnh1ZVgwVVF2dUp6M2hL?=
 =?utf-8?B?bURENnpScmxWQ0xaZXV2UlVSU1pIREFXUEtHVCtxT1cyaXNlWEErZzhuY0tU?=
 =?utf-8?Q?10mjyz?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:55:58.7710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b13771-760a-47e3-2b5f-08dddbafa4e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424
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
index f955ffb0ac84..3be9b204a9bf 100644
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
index 6630dccd68a4..96cdbf08e70d 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -128,6 +128,35 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
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
@@ -151,6 +180,10 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
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

