Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B3FAA405F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD5410E651;
	Wed, 30 Apr 2025 01:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LxKa6O+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCD910E654;
 Wed, 30 Apr 2025 01:18:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdFAuBaTanEhmmMmPgBoWy8misJHmPHTirYg/v5iVD1Bw2lvm3fPZxNpLC509fuuMWpMHyvgfk6/5TucDu7CAsjSRMuCIg8TbNz7air3mwvgBE4pL2yBf39lrFqV5pCrcMgNLaRt+Aw3XE7gvd7RS0jxrYwQ9HG6lilI9GUgqaGRtf5A+3DtvYgUEtn1PugwyR1HotKO1TlyPZu/XmqypUGzID9fpyx2LYy1FtnkOxJo+QUVsYeJwv0JaOGc6ht3PJVoAuVUNo1RMc9DGEfCwV60MPzFXiBdPU0SuoOZDHJwkClb66cv3NQGAE72PNEYuQC2PxVwjgHQwtopO88yAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdhBmGmfiy8TcCmTXi/f5BAD4v0AVAC29PrUf+kL4Gc=;
 b=uiEDyiR+7cCa4lNQPDrqsm/4gy0LN67OI62Ce+WD6u+mwuQvdd0V3qxs6DJCZGj5fCkFUzlok1TyN7IWJn/GvrYILigYDnmvmL6/UnK/s8H4a7ydMj++PHRVIj6v0M3IwE+zA57OjnEqMOJe1qDM8jCafa2ZGAfE2QTUpa2o5hP16kpOlgZHK+Vh0mwUWpIJs91plDF/ldFrXfCQhixXiSWOsV9RZTi8C2A9cmn0MbWbfbQEgX+zbyrzcr3XCwHTO4VX6gshpmppNtI++knwFF9UgNfp/i/tV6coG1V6nzu5gyNnnlLGss4GRF0NakkmuMtpFhsY0wYHgI447wLn0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdhBmGmfiy8TcCmTXi/f5BAD4v0AVAC29PrUf+kL4Gc=;
 b=LxKa6O+uhPM4z4UY/di2PUHFzd3Dk01eGp16eauppVXbfFqFofPviJdWE+xvPppgmUvGr1w/Bp+nBQY+Taz8RTWmVHf1LrFVExEDgxsCDI+mr22kQ0y9KM+76p2NhWVIb+/GJUConrE5HrObMzjQ1JFbxgi32EC6HS3guiHqiwg=
Received: from BN0PR04CA0170.namprd04.prod.outlook.com (2603:10b6:408:eb::25)
 by CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:18:32 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::b6) by BN0PR04CA0170.outlook.office365.com
 (2603:10b6:408:eb::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Wed,
 30 Apr 2025 01:18:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:18:31 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:18:28 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 27/43] drm/amd/display: Add support for sRGB Inverse EOTF
 in SHAPER block
Date: Tue, 29 Apr 2025 19:10:57 -0600
Message-ID: <20250430011115.223996-28-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|CY5PR12MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 79dfdb9f-74b3-41f1-a5f8-08dd8784ebba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eilyutuTT4vKDSn8G3I0Hfo/GtOvxBIper7CpaTmauC3bqRXk/pUT/FSwLZ7?=
 =?us-ascii?Q?kRmENrdqBe/obzFKE1suWYybcJh0fCqJ4MZDHpKZCZmmyZbSjoKIs6F74gMh?=
 =?us-ascii?Q?EwkOpw+O7CBVfkF2cfJ19LPCtEQIyU3+KIvpGQ8tu63ZuCCtLfR4n7W7mQM4?=
 =?us-ascii?Q?iBa5B7pYR4FpDIpVqOXPwlObvaAg+WM4vLegbLpwgvKVMo4oGaIziZ+jr3oc?=
 =?us-ascii?Q?j6DGGOYawjSoLbPg+q8K43cRpv3RFQJuvQvyvVgnRNhexeWOZZm/t4A+Qzl0?=
 =?us-ascii?Q?RsrBj1NBLxcpMgneefbMf1Av3yMBzM89Z33dh8+6ozpoUFORBFNm4Vxjj09d?=
 =?us-ascii?Q?n4nvqJZpvhzndLRLa7oviUig2GK57+lBYCZZY0u//ABvatTmQc+eRyTl9+To?=
 =?us-ascii?Q?keN9FrLyOoXI21ICHeRQ5pBfZvPjemh/NxEiS0nTqga5wqaTwB2hDYNJq07Z?=
 =?us-ascii?Q?rQNLHVbpa92pDRhgNeKUAxoECpyqBn/SzvQA19/XrfVRd490PWonDC6dzSmT?=
 =?us-ascii?Q?TljJ6y9yJ0o4Y+pDeg/C8qBedwuZZ3VmDbcEcxkO/Qc3Lhwseq9s+8khf1Tn?=
 =?us-ascii?Q?nAMU83FEjfFNFdcmbaqjzWNZmiZjxImLYzYw4tUVeNVO3vIie16r9ky86M5b?=
 =?us-ascii?Q?w00WEjOA4s+3nDrAVmOABd/AKxHaaLHKtBBswCEhAfR8MUfwvzYea1VphcmV?=
 =?us-ascii?Q?N6nKEvpzcapl7ssqwwHZLMxq1xkcVGOqCfcqFAtX5HDhU1GxuGsZHr1Cestz?=
 =?us-ascii?Q?IQ9zke/b8Fixg9WWKF/zWq2SWBMdIOmj1SKTKHkhelZhf9EYW5EGJzXcZeuX?=
 =?us-ascii?Q?6cZ3U1zXKIRLlESoipqImat99dwBIahlkUVxnGpEzQalh1sfBwHkL8jE3cWx?=
 =?us-ascii?Q?im1TDWbvLoK6qk7LGnLwKdm6q1DlYMx/2gLm/aMmdcdUzIj3UcQOnRRU+osP?=
 =?us-ascii?Q?8nKhHX81u1Mz003iX3CJYlNZWvl/hRthCErgxvo382hxXKNwtVQps8WRRld+?=
 =?us-ascii?Q?WrldsMMFBkiqPQKIF/P+XfkLyV5zzrLX/BvVIwokUVdIZG+1uydN7EcILYL9?=
 =?us-ascii?Q?ohKK7bGXPGJcQCyrRwQfFlhNy/ftAUhQyzjx7m7D3mSVXDiGdqM/9zlTHO2i?=
 =?us-ascii?Q?oDT2YOUgSK3T3EMgV4j9Dal58I7cC1k0Q7lmYeoq8zBoj1EIVYlWb0NvxVef?=
 =?us-ascii?Q?36VgXbUybztC2FZXXhWFus5Ne27mhtSZmVFs5AjFwETMOIEEZmyhRStCTEw5?=
 =?us-ascii?Q?rFBripsDNIz+4v1M1lvPz3hX+JYwUd3hanbt7fcC/nbt1Y7SErY1awgABjf2?=
 =?us-ascii?Q?ryrPX2oJqfK2opb9jDmVdqG9tS5amvDmQITcEOXn+e/TMmf34mBrF4XL7CQc?=
 =?us-ascii?Q?nsOMes5CTRMhM2Bd5RXJLc1FdsDtHBf1kt/57qbr1obS7QJYy8/M+25sTQ6X?=
 =?us-ascii?Q?YolNCeO6hED5kOehG9NEtUUBSruogU6pPQjPcz+cBut3kRpVhxmuBWCLYoIU?=
 =?us-ascii?Q?0tP6Nsca4TiOMdmaDnuFtiDHak2mpvP5CvBj?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:18:31.6518 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79dfdb9f-74b3-41f1-a5f8-08dd8784ebba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108
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

Expose a 2nd curve colorop with support for
DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF and program HW to
perform the sRGB Inverse EOTF on the shaper block
when the colorop is not in bypass.

With this change the follow IGT tests pass:
kms_colorop --run plane-XR30-XR30-srgb_inv_eotf
kms_colorop --run plane-XR30-XR30-srgb_eotf-srgb_inv_eotf

The color pipeline now consists of the following colorops:
1. 1D curve colorop w/ sRGB EOTF support
2. 1D curve colorop w/ sRGB Inverse EOTF support

Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v6:
 - don't pass uninitialized variable into __set_output_tf

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 74 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 19 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 0b513ab5050f..4662d88885de 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1202,6 +1202,68 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }
 
+static int
+__set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)
+{
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
+
+	if (colorop->type != DRM_COLOROP_1D_CURVE &&
+	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		tf->type = TF_TYPE_BYPASS;
+		tf->tf = TRANSFER_FUNCTION_LINEAR;
+		return 0;
+	}
+
+	drm_dbg(drm, "Shaper colorop with ID: %d\n", colorop->base.id);
+
+	if (colorop->type == DRM_COLOROP_1D_CURVE) {
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		return __set_output_tf(tf, 0, 0, false);
+	}
+
+	return -EINVAL;
+}
+
+static int
+__set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
+			      struct dc_plane_state *dc_plane_state,
+			      struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	int i = 0;
+
+	old_colorop = colorop;
+
+	/* 2nd op: 1d curve - shaper */
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+
+		if (new_colorop_state->colorop == old_colorop) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (!colorop_state)
+		return -EINVAL;
+
+	return __set_colorop_in_shaper_1d_curve(dc_plane_state, colorop_state);
+}
+
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 				     struct dc_plane_state *dc_plane_state)
@@ -1257,6 +1319,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 		       struct dc_plane_state *dc_plane_state)
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
+	struct drm_device *dev = plane_state->plane->dev;
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1267,6 +1330,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* 1D Curve - SHAPER TF */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Shaper TF colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index bc9980aad7d8..5597a693ed47 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -34,6 +34,9 @@
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
 
+const u64 amdgpu_dm_supported_shaper_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
+
 #define MAX_COLOR_PIPELINE_OPS 10
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
@@ -60,6 +63,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	list->type = ops[i]->base.id;
 	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
 
+	i++;
+
+	/* 1D curve - SHAPER TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_shaper_tfs);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
 	return 0;
 
 cleanup:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
index 3324e2a66079..71cd27994528 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -28,6 +28,7 @@
 #define __AMDGPU_DM_COLOROP_H__
 
 extern const u64 amdgpu_dm_supported_degam_tfs;
+extern const u64 amdgpu_dm_supported_shaper_tfs;
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
-- 
2.43.0

