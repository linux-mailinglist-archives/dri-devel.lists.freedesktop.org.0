Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D275295762C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8464A10E411;
	Mon, 19 Aug 2024 20:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0afQpcHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D045A10E3C4;
 Mon, 19 Aug 2024 20:57:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLe6bFdrvAVGPCBV1N42k8qjQMH/R9zQ5Lxy7pdOQ3HST/8WodXLYkunKU7gWEZzMva+TprF94lPnViIasvKBjytGVI49kibfF1K3n1EAWQ/up6wCnQSFuMHa/Et+zCx7MKLQAVKQLZ93TA+uG6g0BVHI7ma78nYE3GaHTI/e0q2UMddLr+C0zbJFqOJOJd2w5YUIHR45UpAq4ES8gXQrY+tCJfJzoEgJIM4fyQWuoZAxmds0e7DIr5oNicIAAFbIByzg9KHyTZ1j+Yjbr2bk9/DH0/os/ER01KBHcZV4gbkjAZPIqww0Z6Q808LHKaWOYGKLsZ1JksV+k87EGjggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4Hjs8i6s7f/iFE/xQQwh+C9X5zXPzQ0EpFoV9NrgM4=;
 b=jCjQMqnWvJnbD1ZuvasE5T6/5iKQ8lsHdT4TvLMrjT+bxKS3GN1TOLXY76v7tD5d4pVy3nq7f09nMdueB21/NuVhMzmvlzKR6ButSqJHpo2cCKIm1G3hx1osxZdFhjMdiJJUSH6lMAGzbTyRf1jeGqo8UAU2vDvja+727bBxVrthWR2kBX+FhxtO97XjgTa8cnvt7lOunNPJH9YUXoWZNaChegcIYbeKkVdmBweYcVLe91MLyCdRYpIKiE5rNq3ldWec5N2wkzt500b/KVXvoGNKKQWAraOkH4vnb6KPRQzHENTfl/Emiav010KB+APG+/bjTIaKFoR8AdOI+L491g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4Hjs8i6s7f/iFE/xQQwh+C9X5zXPzQ0EpFoV9NrgM4=;
 b=0afQpcHNRKVt5LkAaOmml8cHJ0VZrmuPfORa2yVbd/Mok/0NDLKf3g6ONaUL1syXBHCk51afVPL/akLIKug7eTWbM6I2gZDzssNacn1NxaexTrAMu6js/Ghn0Z0moG4JAEyhA1nOfmz6UDtnVoIf0TiVQBFI/6Dhl6/Ew0quQkI=
Received: from BN9PR03CA0513.namprd03.prod.outlook.com (2603:10b6:408:131::8)
 by PH8PR12MB6963.namprd12.prod.outlook.com (2603:10b6:510:1be::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:37 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::1a) by BN9PR03CA0513.outlook.office365.com
 (2603:10b6:408:131::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:36 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:36 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 28/44] drm/amd/display: Add support for sRGB Inverse EOTF
 in SHAPER block
Date: Mon, 19 Aug 2024 16:56:55 -0400
Message-ID: <20240819205714.316380-29-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|PH8PR12MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 96fa724b-3111-4dc7-7885-08dcc0918e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8BibLs0nLAANVnfcWbRFScnTsjfL/4cn6n4lcqBlQ4WQKubU8npbvjWI47Ks?=
 =?us-ascii?Q?3793LV7uQ5snDptBZWS3vBi035kAw7ebOVFpJNc/NrZOkyGKb5VFCy7XuPkx?=
 =?us-ascii?Q?4hnG3xoCVejp5ZaHRO+c8XCob3mZPOiLOA6dseqOupzfx00WaWIpsNG6+GcP?=
 =?us-ascii?Q?KsvLiFZwMmiRnDvIIGLQSy55KgnNCfSh37P3YJWX0EbvHUZsQV4Ru86M7k9q?=
 =?us-ascii?Q?bQKVkCQLL6ZquOQzkLEP6/DB5W9HJyWGDEX8Fqz05spnqCvoif4+tvvhPf3K?=
 =?us-ascii?Q?/dqRjVp+zuRl+Or3Blu3bmahcGnUzdrxgeOX6fQMoO/0qGVer4mo0lNQqP3N?=
 =?us-ascii?Q?bFMQH7Doqku7x9tcR71cEjrPGFGsNqhNNQmCATvei9vpHNDhNMtCJmS5oa8t?=
 =?us-ascii?Q?1VGgaFZ+6KfXPYIklBtsrhlRx2NzB/FZeL/+VIahzCo1gRq7B2RBdv55n114?=
 =?us-ascii?Q?AyVeEJpyDuAjo0wSNqp1jet/tcsZjFdTSoZy5Kd2V9mUI2P4StttcLOD1WEB?=
 =?us-ascii?Q?xCidPBVMFv3mjNd2yzTZ4GMt1IcYR+Tph1XbTB5MtKE9nh/gIYdavFs/IEAI?=
 =?us-ascii?Q?DWsJfJWe7UGQdst1xrmu9WIS46kcyGeNWE37dUD04RNIIKrjtkXNZ5V3atV2?=
 =?us-ascii?Q?h5/Ht7QU9pRD0lXEnHfnRzaChsCn/hYbWAzNf4rDZEzgG+ndPtXIh/BjEgfb?=
 =?us-ascii?Q?I3FQ/6AYWcwRnfcyOCxea4wXCetftYuplEBnYzYJE+7T9Wos086+Ks/N/t6+?=
 =?us-ascii?Q?jaxkEc48BUPGbj6P8SNQrPCHF3BxZ9g1KPWxlALYPMrIJwJyWXI10P85bX3P?=
 =?us-ascii?Q?SflBHrxRcEMxod7IAFcIBOY4cyNSV7MgKzqbzB/4b7RY4faIP21ukJTPX8CE?=
 =?us-ascii?Q?2aEpPe3IOc5sEdgDFzKCrJYwFuaQ9sSJSnqp0GOWStcO8eOOy24ioPqklt/5?=
 =?us-ascii?Q?KxWeK+of5RFRvPXJTHyI0PiFm9Y7DjUiVS/tjZ05fPRBObQf7a6V/aToCBHI?=
 =?us-ascii?Q?VVqhkre0d4dHly4kVmgt5yXllVXwFVSoPZ2uqaoJIrVXGthhosPiSkL890Oo?=
 =?us-ascii?Q?VLu8cT3pZaqH6mhltsv4V/7uAn+0B6500Rfy15UUdIFbHydFgAwme212q/mZ?=
 =?us-ascii?Q?hs9xNTlbOWZ71W1+pZkMm3SXz7GoMdfk58xKB4kXB1mmBHljqo5ltOKPXm3D?=
 =?us-ascii?Q?5XmBH4UqV4Zyws9Iuo9025KnURUs4Iz9CbwGF9nRJaVfc1nlBC+EmyKOQftg?=
 =?us-ascii?Q?eSCgXVEajNOJYC/8+AWsH6AnT+cYl6MNREsWfpAeWVn5uWLGFo+gTo9ww/M+?=
 =?us-ascii?Q?Zo0+v3gKNghlmeRd5/SGL/mPhZ58UTt1bqI0fkpa3nUfz6egAOMq3z9EwYpf?=
 =?us-ascii?Q?H8j4AwqdKos5uH/Jiq/APQlSEuRdTNJB2KRyUqAMSrP2Klga9YsjWW0rGmTm?=
 =?us-ascii?Q?c7gxHrIvFgItwnxeXprCyZahhA25wAut?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:37.4683 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fa724b-3111-4dc7-7885-08dcc0918e9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6963
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
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 76 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 20 ++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index adb1e4b3522d..58a996090509 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1203,6 +1203,70 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }
 
+static int
+__set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)
+{
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
+	const struct drm_color_lut *shaper_lut;
+	uint32_t shaper_size;
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
+		return __set_output_tf(tf, shaper_lut, shaper_size, false);
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
@@ -1258,6 +1322,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 		       struct dc_plane_state *dc_plane_state)
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
+	struct drm_device *dev = plane_state->plane->dev;
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1269,6 +1334,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index e8b7fc8bb0f1..0d1626abf577 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -34,9 +34,12 @@
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
 
+ const u64 amdgpu_dm_supported_shaper_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
+
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
-	struct drm_colorop *op;
+	struct drm_colorop *op, *prev_op;
 	struct drm_device *dev = plane->dev;
 	int ret;
 
@@ -54,5 +57,20 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	list->type = op->base.id;
 	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", op->base.id);
 
+	prev_op = op;
+
+	/* 1D curve - SHAPER TF */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_curve_1d_init(dev, op, plane, amdgpu_dm_supported_shaper_tfs);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
 	return 0;
 }
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
index f16de6a9fbde..c4b1b187e9bf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -28,6 +28,7 @@
 #define __AMDGPU_DM_COLOROP_H__
 
 extern const u64 amdgpu_dm_supported_degam_tfs;
+extern const u64 amdgpu_dm_supported_shaper_tfs;
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
-- 
2.46.0

