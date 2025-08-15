Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B880FB2776C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDE110EA46;
	Fri, 15 Aug 2025 03:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="niq89c/a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62D010E9FA;
 Fri, 15 Aug 2025 03:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHX0znxCUgs5/dlvBWPoYLScwKe5s7ayUJHZZ2o/WsGdWnVuLImt2ayamUleXNYX43rvGCF2VnKMSCw2pt9eSMhNstHnq9PJUcCW2KfqdDflgjeKXY72knQHdC8nDwB/DhYXdvuSTjEapgENvIm8eOIDZiQzNGCy0bcBtcihL17RNlvwGVzB/QPzd+3FkldtVZfkkXs4DoDlPs4Kr4pTsdD5IzcrsNFB7mbDKpy/LCfJDP3PhtNNELp4WAzNV4jyF4Qxq/WjBPinLUyd/9J9mrJmU8kwqHx4rOS7OEXzCK0slKX5vHG2gF5yRLNLnaCLor7dOh1MVNbkJ7FczOCl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ao6N3NX38iVkqF9cJUdWpjPteTUhnGoSd9mbzgj+wRk=;
 b=hQNWzRnMSq9dkTfSoLppY95HYd/cLGFwK3yyeAVop9USnZci2AHG4VVHQHJOmdTDjUeyGFm6VYo004jZaPRe2ZkWhCNo5kipZOs8WNC692mMnERQipG/Tu9yxRmw9CWB/fu0a5g47rtHqKRI3CiFYt43n4n8frny5DQVpBM1N0PnY20CT6i5x8Goc12Rk5jw8yOmTdmRK1RELRsArrTNi8XIrZNTpY0zgRbi0g7W2bB5zyy0rvpV7IrDLRTLEKkPFbbxLM/viDuU1/WI4b4qqVUUKBYeRBERvwrhdHmY5XDxbhqIlzcor9Gm0irGTeTqLlXxWseg1vfOpQczJWmrEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ao6N3NX38iVkqF9cJUdWpjPteTUhnGoSd9mbzgj+wRk=;
 b=niq89c/aNH7ZFNWhF2YnH1Djbzf0RizdLQYLhtw2RiEnBcni1LzrA/57geaNXT8scOTbKMmD+Ce3WLHAP9E9IqoATmfWOt7gKCBips9uAXkIgSNbRM+9UqW0gaYZzuhBFTHh0SNWGcZHwgPxYkjpF+YoKesrerN0q7CNyH4XBeM=
Received: from BL1P221CA0038.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::9)
 by SN7PR12MB7452.namprd12.prod.outlook.com (2603:10b6:806:299::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 03:58:11 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::76) by BL1P221CA0038.outlook.office365.com
 (2603:10b6:208:5b5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:58:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:58:11 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:58:05 -0500
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
Subject: [PATCH V11 27/47] drm/amd/display: Add support for sRGB Inverse EOTF
 in SHAPER block
Date: Thu, 14 Aug 2025 21:50:16 -0600
Message-ID: <20250815035047.3319284-28-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|SN7PR12MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 6934fd67-0a54-4043-a05e-08dddbaff3fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JTnrF17ZUi7mDV+ncquvClREgON65jLusdBx9dD625bUDFQnrY4OhQorJtPD?=
 =?us-ascii?Q?CjoQgLV701iwtznd31GXXahlZ+8Y27/zrrHgBCo8JN+QtwwzTXaiQOHJisCi?=
 =?us-ascii?Q?ZTwAUekIRiEA75i3LGnwwF5xKHObE72ymxfUmBguGTZfXe4tlj4SxPFhd5Yf?=
 =?us-ascii?Q?lznWLqTxSprokQTFuiNuldGXhsNsKtmWTwrPESmKtCZDvK8qoe+6zq+dkB88?=
 =?us-ascii?Q?rbmonhv3SyB12ESgRJt33egXOmrsHMGT7lqRXdYfGMxRFtiy/sBY4JnWlsRo?=
 =?us-ascii?Q?atoeTUCjpsE86gnTiJJ9pckeeIQEWgqsCAa0rDLlLtr7OtOhQUgR3Qnqdv5C?=
 =?us-ascii?Q?r7Y/3FqLZTnYEWj/l+G9MGEaV29MWK0Bl1dtoIj0vC7GOefnROXYT7Q7N1MK?=
 =?us-ascii?Q?oJ+3UN8ufIvZ1P7iqAyMNvgMXmpyI+ejNw05G9hR9fr8N6rQfRb0Wxj/n67J?=
 =?us-ascii?Q?yHQqLCxCG8n5BZQk5FYfpuuXtxmXcBMoxGnAwDkjtMX0xdK9ywalCbjBrmLX?=
 =?us-ascii?Q?FyDDJpNTyDahfjMdc3dJQ6YGm4qE9vXuD/SVRTLw4HdswtcUC9dFsYrpe8hL?=
 =?us-ascii?Q?3Opez4oxAp5SH8YjXfGTZBmSJDfbJTwaPpginKwI3KQhPeV0mfv2ubUWGiUs?=
 =?us-ascii?Q?XTMWeDsvKMBUUxyQDpugujoaYCKIwkacl0UQ6QnJTrqmwGouGXgVQnwS8Ue3?=
 =?us-ascii?Q?qKtano7T/DZ2d0/VsDdivNabCQgrCmL3sXNKBif+id9zCvLxhHfT89f2D2Zl?=
 =?us-ascii?Q?xSg0yx7v4nX0vFkWeyR6uNJ1AtKrO2H8VIf5E1VKa6+aCo8GwQU/rPjXE2Kd?=
 =?us-ascii?Q?NPSUoNWQfb9NF2mkQaDWEQ/KM9mqIquJ061bSfDfe57vs1/M4Z6+DKbxXxW3?=
 =?us-ascii?Q?9BrXEFELGce0crKzGn66/MsbAk3mQx/MVDMD25sccW0nr6K2fNF5AgLyl+un?=
 =?us-ascii?Q?0jv4S1j2qlBWN5qCSbo2HSFVl1N6A1Vy/R/jleVvxPi/bWhW/qrmsSqPB1AZ?=
 =?us-ascii?Q?yMfFNeqMW+d1gxD2vAQxalHXGetUx21++ho251xZ/ln6YLnkaagdiOdMHkB5?=
 =?us-ascii?Q?OAXbO6o9XnJYc0MHKo2Vrm7LaYcvxGtkQfdYQsEFoK9S3ihiZKOQu0L/n/iu?=
 =?us-ascii?Q?T225e0LzBIKFhyGimJrKFvN2O0nL2jZsEuvdj20+7EkE33z6y80X79LZBRgF?=
 =?us-ascii?Q?xqy/6egiIDQI+Y5tbrtsx0TXjAwSH0NFXXjPndLjGGQ4cVILKg2suO0VoQqy?=
 =?us-ascii?Q?D+eRVgwLdvtMH+dzFeZFkSRV9hFKPHUzdZlXVfPDqz6fIEBNZGHNahjYVYjz?=
 =?us-ascii?Q?42H565FfGLJEPnhVfDhaK4mHp42izHgbdWjoQr537uZwNsiSP2tlHrB/T8gc?=
 =?us-ascii?Q?14Y+3q6BTg6F/WYlijutCAtW57AW1CSNWXHADwCKqD5U4wuh6HtajLqkbuAG?=
 =?us-ascii?Q?KohVWmhu6YdMZC4L0WZlvhQs/A5USYUj3NvYUvPJKHQiXHpokfCBy+Pm68LP?=
 =?us-ascii?Q?aioTw5NTvHA+t6tiX7JVHAXP+/m4XyI/Rm47?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:58:11.5221 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6934fd67-0a54-4043-a05e-08dddbaff3fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7452
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
v10:
 - Remove redundant DRM_ERROR (checkpatch)

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v6:
 - don't pass uninitialized variable into __set_output_tf

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 74 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 93 insertions(+)

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
index a61250f7fdd4..ea6078592f4b 100644
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
@@ -59,6 +62,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	list->type = ops[i]->base.id;
 	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
 
+	i++;
+
+	/* 1D curve - SHAPER TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
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

