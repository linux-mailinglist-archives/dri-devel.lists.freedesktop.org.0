Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E1FC5FAD4
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5612710EC3E;
	Sat, 15 Nov 2025 00:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VUyDTu82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010006.outbound.protection.outlook.com [52.101.85.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3944C10EC34;
 Sat, 15 Nov 2025 00:08:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkp0ulmmWf+o/0rlWLe2y5lR/A3hGEXwSKEva695IeZnBj+bp8E8m4H8s/OEW6HH2T8BDrQzhOq3N3XsKrB9kAHJg4QPW8EQg2NB9KgAGAYu/yfz+lEVN+D4MZPvnNdA2ByTaxCv9P1eqV5GWVXSw5QrxsZhiRmIgvo8RqEqmmNnL3nsJtXv4B0nUnwj7WIc8boePN0yvJsba9y8epeAQN9BYzfBolqOMRfEx/DuE/aOb0zVB7mK3VkrZcSAL6Usx/w1fJ6kaTgaTY7IX8v/GsyDRQrRUnDjUd7DN3RTMO916VzVl5JYY2VQCknjR9tKgvGq1p1qrDo0NXzmDe+0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcu7lLO2B65EkUGyPEjnFAsmcvPsN0cJmu6ww7i49ic=;
 b=y0JlbRc8lnV6MBH/eL9itIVyd3RYXEv2TniiuQjiUs3GUPDmukdACeF4hhJwUhE2/exvne1tDE8SGr9rAvPGlpowANscgybJyyV9IuEwGTU1sMqbHJ5gCeoLLkuRNQNnI8xPxmhCXKXXjzDBKryG04RpKAYJXm+CVC2hBen5QdX0AC7NRZCIC2ttZqtv5CTFdMilKTOwK1ynsDIOaqNk8AL+2DsoSWLttkAqPRgrYGTCIOSOh71Iy8bbXdqEGDULewm/0T5sCWw3GQel1L5FzkiNWQoOqiGt/oXCUBnomm20I0oetmIb58XhKxCBORXhQ5uKgc0MBWPzaBwqzmr9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcu7lLO2B65EkUGyPEjnFAsmcvPsN0cJmu6ww7i49ic=;
 b=VUyDTu82Ej27Xebgqx8jA+E1tb+uLF0Y7i9bVUT2sTiFjOGT3tIomBtGp2lX+GsbwahGoqsT6UdCV/1qxiqlIUlt30YmHg6wPjenvelAWFJE1FEGAoGtlENMEp7LoaV4QDwk23WypOhliE3dcgitxt0ilaeozm3mfHoOAMJsIxM=
Received: from SJ0PR05CA0058.namprd05.prod.outlook.com (2603:10b6:a03:33f::33)
 by IA0PR12MB8208.namprd12.prod.outlook.com (2603:10b6:208:409::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:08:34 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::5) by SJ0PR05CA0058.outlook.office365.com
 (2603:10b6:a03:33f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Sat,
 15 Nov 2025 00:08:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:08:34 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:08:30 -0800
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
Subject: [PATCH V13 20/51] drm/vkms: add 3x4 matrix in color pipeline
Date: Fri, 14 Nov 2025 17:01:45 -0700
Message-ID: <20251115000237.3561250-21-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|IA0PR12MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6194ae-6f03-438b-d62a-08de23db1e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YW5tWUVMVTl4S1RKWUJjaFFRcU92YkxUbzZMMThhYXJVMG9Qc21ISmdlR3ZS?=
 =?utf-8?B?Sis1aWpmTHVDOEkxOGFDZjd3bHc2a1pPYnRSMGVVS3pkS1YzUmorSU1IaEl5?=
 =?utf-8?B?YWlmUGp3NTBXUUF0NWFaaWFDcjFzcEUyK0xPcVJGWG9kWlkxQVhVTndGejRZ?=
 =?utf-8?B?K0dmVWtlVmFkWVBROWJJR1N6RDl5bWFhaGN1UEljT05oc0xwUDRDaTcvMXRy?=
 =?utf-8?B?SEh1Q1M3RmZFZFNSWmY1ajUveStiZ1B4bWZ6SnU3YkJFaUpXKzlqQWFRQVpm?=
 =?utf-8?B?TXJOaVp5cHErSjFaSkVnUVJxVEZVZXNnWGVvMllTR2FvRi9DNkhQWGN0eWtF?=
 =?utf-8?B?WW54T2dyZDVSbHd5ak03RHI2THc1SVFNUkhrWm56eklzOVhPbS8zak9kbmg0?=
 =?utf-8?B?TVRWLzZVclVLbVlucjYyRFA4ejBWcTkvZlJPZXRTRWtKZ1ptbHhpV2UrazRn?=
 =?utf-8?B?OXVzNWJJanRTQXFFQXcrRVlHTjFCQzQ0U3RiVUczTy94WFo5alN3YnBCY0xS?=
 =?utf-8?B?dHo2a1VpVG1JUk1aU3dLTytlSnpaeFJoNGdMZW0yQTI0QitIZFNIbktqZWE4?=
 =?utf-8?B?QkFnaHltdmxndGpzb0xMOUx3TWg0TGtPZ3B1N0NjTncxdjVDQXJiOSt2bjd0?=
 =?utf-8?B?cENVTzVYaGNsZXQvZGpuWE96L1lIcWJiY0MzOUVraHE4WVNRU205UHBGYS80?=
 =?utf-8?B?Unp3bkNRZW81MjNaZjlBSisxN0Nnd0sra2hLaVF5VzRxQmNadlB1bEtuOTFX?=
 =?utf-8?B?aXk4WWhEaklwU3pCTWRDaEVQYTViZU8rbGQ0UkpEcGdxNlhlanZyekpYREg4?=
 =?utf-8?B?alhadVZzRkhUWjdYYjZoVVhna3RHYTBJL2ZhdHlFYklZUTkrOVNYZDIyT3Zz?=
 =?utf-8?B?MUUwMEtLL25SUEl2QVA2K0dYRkFPWjNIc0hVdDVqSG9lbkV1eW1Ddm84Ukc1?=
 =?utf-8?B?dXlRTXFjc1VBMlZOZE1xUVJpMW8vZkpNbDlBUml4eFhBTGhWRmNoa21MUzJG?=
 =?utf-8?B?RkJaeFErSUkxUWx1bTJZeW1OV1B0bzd2d2RHWGhqUi81MkJDRUQ2WDZMOXZV?=
 =?utf-8?B?ZVdmbmNIQjU4OFpGZ0lKV3piNlNMMjc0TUVIaGsrVWFZNFQybnU0QnBPUDh3?=
 =?utf-8?B?R2VGRjZQb2Y0OGk2MmQ1dUg0dDl6T3ZicHgvNldzaDllOWV4N291TE1FL1g2?=
 =?utf-8?B?ei81c1BkbEJzREhva3VuTFlBb21kZFM5NUhVTXRLZU94clM5VUZ4dmd2Mk9P?=
 =?utf-8?B?eHFEUmlPMGw3Wm5TSzFDaEFLR1J1eU5tNEk1SzRVOE1kZ29RT1Z3bXcyK3pJ?=
 =?utf-8?B?Z1pGNE5Tc1JiY2NGTVJ3c2RPenJOT1QvbDlGWFhKc2RrZ3ZZS1hxQnhzYUQ0?=
 =?utf-8?B?R2hZdTYwWDlhdWFWRUdkYitWd1lkbEh5bncyQTl4Njc2Y2ptczdLejYzdndW?=
 =?utf-8?B?NVpzMlZaZkhsTWlmRDVleFpSWElSY2UrYWloNU4zTmtaKy8yRzBjdTBKSm5Z?=
 =?utf-8?B?VVhRQ0MzWWRXU2lSMVFFZXN4TlMweDBLR2tOeGZwbnR0TXU2aDR1ekNwbita?=
 =?utf-8?B?V0xXbmZOSHBYWWlZT0tWa2xOcUR1ZUxFMVJsS0wzWUI1UUZieU5vVDhLWk01?=
 =?utf-8?B?dWRENDdtaVRsdGlteUhzaXRMMFRwWmZVNzNpa015aDgwaEc5SUZaR2hISi80?=
 =?utf-8?B?cTAyb1E1QTJpYXp4bmFIQ0p0Sk90cXdaOHFWUjRwRWplQ1JFYXVxUG55S0V3?=
 =?utf-8?B?OVpBQnR2eDkxQjVhL3Qrak5wSXl0c2ljQWtpelFvNVpqRDQySElzRDRaTGZZ?=
 =?utf-8?B?ZU43Ui9MNDI2TXJNTkVOeGRrbHVDdjdGRnBPNFQ5L3pROGI1WW4xbVBGbzBn?=
 =?utf-8?B?bzMxdTg1aUJrQVArMm9CMnM2eXllTFdoT0dvT1VUNDFkZXEzRUNEcW5sckdS?=
 =?utf-8?B?UVAvQ1pxazNRMVhnM2xkMFdaTFlLMDYzbFpZcnU0eHZlOEsrMmpQYm1lcmxH?=
 =?utf-8?B?clU2NDEzcnlFb25pRGlkQ3RmUnhtRWp1ZktaUmY2T0NFMTNIUlNNUThRTXls?=
 =?utf-8?B?UFc5QW8rMXg3U3o3NUZSem9mTnRwNTVJWi9uSHRkQzRSMjZPd1NUVFlNNkZV?=
 =?utf-8?Q?INtc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:08:34.1465 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6194ae-6f03-438b-d62a-08de23db1e16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8208
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
index 3c1ec430f509..2182063776f8 100644
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

