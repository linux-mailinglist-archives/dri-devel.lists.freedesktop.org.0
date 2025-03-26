Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E550DA7277D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FA810E7F4;
	Wed, 26 Mar 2025 23:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ifntSXwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2066.outbound.protection.outlook.com [40.107.101.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BA710E7F4;
 Wed, 26 Mar 2025 23:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3fX1Fb/joG3c+mOs/d8pssmJKUZQpJDC/SUjvcGl2vS3UTkVc+S/1OVFvkNU667X8RFn6hVQ0xpkphzFXvGxtYHqWdH6frdI1ytXRIblAyyu5JWVznHoQeREGMI9X0Qco3pC54FrFM57jk1ABbgFGEMpuAL8m3+uD+podFbV5E7m7Cuk3yBVxJ/nVJ7Pd1RFNIVzv7M3ZwmaIZ/QukvWUOKVRgj8AOLx8iI1ej90Wwe+5/IyRIuxKZ2DvftVFPshAIqkkwavUe6XcG5jibF1eAKVDh2ULdCw6h6qVOsnuBrz8oHgPkW7BchXCTNZjD94GSQpipKrqI5hIkJnyo/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pq+l4pLTh9mSgPPDM2wOSAPMv9y8CXQeFbQ9kQmAwJc=;
 b=vrhmzK8HlO7MNg+6UKSIQnDOeMBnamx75SEFyVfVFI6EwJiC4BhTJLMTJ1/lL/kVWJXncn2wwk/r7S4yQ+oZ1Swff+/pKR/Qfsd/PGjalrDmhTpmDkWZ+EBctVviQtcLAcx6A05wr8e18prN8pAQkTGGnTikCFYf8/WynByjK8NKSc8o0DzvKyRgddJSPwQuSFQJBngdOR7yDFqSogrBXmpQkh8LxmeSGSiz9TSgl3aHRwfyKfdaqgxt86wpYR1xc68R8BdF7RgtWIPbga2YLbwhI8fB1orfbP1YD3BAPJ/89VlbtTpiN4TRFBM3XGB2Bzi9gCv71rSfHON1g3WFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pq+l4pLTh9mSgPPDM2wOSAPMv9y8CXQeFbQ9kQmAwJc=;
 b=ifntSXwBeQrQc8zjpIM1DYZDU5J5OK6WYmgL7nDeEWmHhEVfI3d9CRmUR19BywR+alVJCrq9x0falL+4h/W6nAy51mz3FO47U3trz8nobHHF/PSHr+GiDARnfxioxcCKbDs2J5ms1eoApCzWCoGyUNu+jGAQoTxAHIaDTuX4Ut8=
Received: from MN2PR04CA0031.namprd04.prod.outlook.com (2603:10b6:208:d4::44)
 by PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 23:54:58 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:d4:cafe::5a) by MN2PR04CA0031.outlook.office365.com
 (2603:10b6:208:d4::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:54:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:54:57 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:54:54 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 27/43] drm/amd/display: Add support for sRGB EOTF in BLND
 block
Date: Wed, 26 Mar 2025 17:47:08 -0600
Message-ID: <20250326234748.2982010-28-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|PH7PR12MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 9912275f-fdc3-442d-c8e6-08dd6cc19d09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rnKer7ApOFsVJSeba4fNYEsViO/5GiaE6Uj98hELTA5z/k9+imPHICaxNnov?=
 =?us-ascii?Q?ZXLY/TLfNaz6uvJbWkfmhtEu741Vf1SLv+xAqDMCfIXPS79gY/sy/YjffuoJ?=
 =?us-ascii?Q?iXMhLOA3hwyW5iqLPbW+65PnJ9nRPfiEEv8ilL23QEorGODiGWbcy8ZL7u2T?=
 =?us-ascii?Q?QE5MCI35MHyNdtEZKV0JcRoQNQIN5HKIrNQxPfflCD2vVRq5m4L9tXcDIzcl?=
 =?us-ascii?Q?MwI2lrCWpU29/XbjWg3fDwlg5zmbnPGPTYlivKz9+td8r9wlKREegiNpkDM4?=
 =?us-ascii?Q?jqlBte9cf0wqxQToOpulY1MVC/fHOrujf7a0zh43YDss/I/0eCOCEPpJWqZy?=
 =?us-ascii?Q?yqn2HIoi2QvCOG9W4mT9zGJvvZXkAdpFGsTtNFnqN8BYDHnjA1xtC3kXBZuH?=
 =?us-ascii?Q?RC4zAyxk/qqbbdth2uRRf48maB3RZp1jWJFPEt6Qs+MlSfcXmmrbrmMUYCrQ?=
 =?us-ascii?Q?0ioZ2O5ZwkXE8QPYerPN4pG4dXTptUBYZpmon6oRH7hcshwYQ0FrL2qrNxY0?=
 =?us-ascii?Q?q+9bqwA2ntfjtPaCHmMEzp81O7r4nodPie+ccKL7U1GY29Rnvj0TWK9HIIOm?=
 =?us-ascii?Q?mJwv8nTDmoO5plWfv28vx1LzQvHAm33w59toNOa3WOcrOMPnafVjJ35R6zAr?=
 =?us-ascii?Q?UmZNE60JvVOxe2A4XFQHCx71cZa0+hSUb6k4jsNHBP2lFKua2PJ9RcKsmPpD?=
 =?us-ascii?Q?vOWivV+7GEdEbGeCTd8kGFi75ItGq44wp6JRDaNUxKtcUx7AuPyF47+e0AV2?=
 =?us-ascii?Q?jfPzLkZTH6UrK0y16QYVte3u2z1Wf4KW1A0scPTi/cKImRVaytT0cx0Yp54a?=
 =?us-ascii?Q?1Kt9zqRr06BuBEqieYsp8VLz6DgKkrDMuSRD1S59Id2cT/bdIM99ZWWI/CEU?=
 =?us-ascii?Q?SD1xZOhpNFMwswsvmbyt7K9eHlyGOi6QuAhCujCAmg0Zp1f+6AzgMtk81/lE?=
 =?us-ascii?Q?U5jT4x4FwiJddGMLEoim0CBKxrixs5/ukhJ5aGqHEyeS8ljHFXagmPZ05Fug?=
 =?us-ascii?Q?5FX4buPeO/OU2p6Dc4wGNaswFbZNEeSvPCFt3ka4C/lDq/zXAcUSLW3PLk5D?=
 =?us-ascii?Q?9DR9sHEXVHENjI2XB1G6xTAIe4o8VO+sEnKjL+TIfuuIBU7UQ7/vffbmHHG0?=
 =?us-ascii?Q?KrvbhPMwogjPF5bf+qkWF7Fl66gMspFkbfqjwecDwpO+PRpZRfx2CipSO7Xv?=
 =?us-ascii?Q?wkq5VE1SVPtYMb41Uwyj8cEv3vKe/+dA+AHWRtyyQokF5IVc1xMdQ+EcpqoU?=
 =?us-ascii?Q?wTiUdfb3ridMuUku2xlbCIS7WNRrqkhuHIBp1OL2C3W5HKWpAzSsIc9rXsRH?=
 =?us-ascii?Q?NYhaMuDiUY9VRgviDmfaId5jZgJkimz/V9B9kkcwcEhprXULH+BexweDB3zt?=
 =?us-ascii?Q?ciRqz82kGB1adRr/DT7dscU/5unlNBEW9gh6IOO+NVQdG0B7PqcAcFUPaPe/?=
 =?us-ascii?Q?00+ZkcpcvNj54Z704G6uSVm0u9XAbTuxZad/IRvnk5WAY5kzXEWfCqmK9TGU?=
 =?us-ascii?Q?YJdT9mY6cbJUUEE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:54:57.5161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9912275f-fdc3-442d-c8e6-08dd6cc19d09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8056
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

Expose a 3rd 1D curve colorop, with support for
DRM_COLOROP_1D_CURVE_SRGB_EOTF and program the BLND block
to perform the sRGB transform when the colorop is not in
bypass

With this change the following IGT test passes:
kms_colorop --run plane-XR30-XR30-srgb_eotf-srgb_inv_eotf-srgb_eotf

The color pipeline now consists of the following colorops:
1. 1D curve colorop w/ sRGB EOTF support
2. 1D curve colorop w/ sRGB Inverse EOTF support
3. 1D curve colorop w/ sRGB EOTF support

Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v7:
 - Initialized uint32_t blend_size = 0 by default (kernel test robot)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 77 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 19 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 4662d88885de..7ce95ddf3851 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1264,6 +1264,72 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	return __set_colorop_in_shaper_1d_curve(dc_plane_state, colorop_state);
 }
 
+
+static int
+__set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
+				  struct drm_colorop_state *colorop_state)
+{
+
+	struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
+	const struct drm_color_lut *blend_lut;
+	uint32_t blend_size = 0;
+
+	if (colorop->type != DRM_COLOROP_1D_CURVE &&
+	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		tf->type = TF_TYPE_BYPASS;
+		tf->tf = TRANSFER_FUNCTION_LINEAR;
+		return 0;
+	}
+
+	drm_dbg(drm, "Blend colorop with ID: %d\n", colorop->base.id);
+
+	if (colorop->type == DRM_COLOROP_1D_CURVE) {
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		return __set_input_tf(NULL, tf, blend_lut, blend_size);
+	}
+
+	return -EINVAL;
+}
+
+static int
+__set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
+			     struct dc_plane_state *dc_plane_state,
+			     struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	int i = 0;
+
+	old_colorop = colorop;
+
+	/* 3nd op: 1d curve - blend */
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
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
+	return __set_colorop_1d_curve_blend_tf_lut(dc_plane_state, colorop_state);
+}
+
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 				     struct dc_plane_state *dc_plane_state)
@@ -1341,6 +1407,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* 1D Curve - BLND TF */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Blend TF colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_blend(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 718544b11863..c5154e1430f5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -37,6 +37,9 @@ const u64 amdgpu_dm_supported_degam_tfs =
 const u64 amdgpu_dm_supported_shaper_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
 
+const u64 amdgpu_dm_supported_blnd_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
+
 #define MAX_COLOR_PIPELINE_OPS 10
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
@@ -79,6 +82,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	drm_colorop_set_next_property(ops[i-1], ops[i]);
 
+	i++;
+
+	/* 1D curve - BLND TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_blnd_tfs);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
 	return 0;
 
 cleanup:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
index 71cd27994528..2e1617ffc8ee 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -29,6 +29,7 @@
 
 extern const u64 amdgpu_dm_supported_degam_tfs;
 extern const u64 amdgpu_dm_supported_shaper_tfs;
+extern const u64 amdgpu_dm_supported_blnd_tfs;
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
-- 
2.43.0

