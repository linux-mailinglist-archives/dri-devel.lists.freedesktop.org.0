Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1E7A7279B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3961110E825;
	Wed, 26 Mar 2025 23:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ezLjNDZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DEE10E825;
 Wed, 26 Mar 2025 23:58:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9jMwm4MPDKrL1C1oC/ZMhL7y7N+Zwxw6RZEAm0wk6n5G03AfGJfBzp3l7s3qKlWE1dOs0XOCMqVa9jwbIS1ba/R1f9saaylLTRD+gguw6RkDQJQUiSGewJKhJSwkW5JCxgQtfpSJA0z6uGFiEPlxg0bDXZ4JbSNeplkOjbC+5S/ucb0EQFYdBGJUpZoqjK63tRQWaUkeX3xkigNNp63p1e6LxrahG/O1qg8bAJbampUZNTuLNrGEJxo6+xeZR91vBYOh9wLgeHuEd4Mx8mx8hUoK+qzjElybmSRCoIXM+w15H1jVqNroxmrLVvADocG1WhyGiwPElsGtbQDvrpMnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7V3oMmNq2sP381ohkdPV4n/DaJSm4Jk5eJtZiv0cGFo=;
 b=xjpkWHqNLZiDq3zdtCLIFUkO3x80Y/WzC3T/XM9tKLZ0iww/P2fH5t4ZYftTjOQfOrCtcKk/UI1fUYLy6KHmh8vqCcM4eLrRD720yyd1fP34zszrjUpeEizhWWALyyOdNGcwrvvYVWT9kNgbQE1Vbnadyf21SlHyEsoYVl5vt4GspPfRoItBQ2b7L2KSAnU8RWQAJmycfWf8RHUtvMtVR/SpgqDA1aC6FCj+zqE+r3MOQc5fZti/MQ+Eybx6uIu0YzTD/ltGqgmgSlYHxhdraDX83zhGbqDKBTNF16f+73zIHYUo6HzWVMPnIEmhFGdFqNhvpCf/Cy5+l+H3mZ5T8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7V3oMmNq2sP381ohkdPV4n/DaJSm4Jk5eJtZiv0cGFo=;
 b=ezLjNDZvhEp0rHbC4Ba/d9JjiS2OXVIqKtGrZeAocIgIQNxe2nbpnijHgxUqFjkzObwualJaa4cqCOxilb+qSQx05Dh7kRQmvrEL2eFN7TViVoWEwvgniBTuWp7gs9P0l6RTrjttSpnnBucJbqPRG/l7AbQsTcOA+1sFx0PneTY=
Received: from BYAPR05CA0004.namprd05.prod.outlook.com (2603:10b6:a03:c0::17)
 by PH7PR12MB6934.namprd12.prod.outlook.com (2603:10b6:510:1b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 23:58:18 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::f2) by BYAPR05CA0004.outlook.office365.com
 (2603:10b6:a03:c0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Wed,
 26 Mar 2025 23:58:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:58:16 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:58:13 -0500
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
Subject: [PATCH V8 41/43] drm/amd/display: add 3D LUT colorop
Date: Wed, 26 Mar 2025 17:47:22 -0600
Message-ID: <20250326234748.2982010-42-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|PH7PR12MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f9c56b7-6af3-45a7-a2e5-08dd6cc213e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RxhkkIoUmxHmjLtDbVf/ydIQIKBNsCRRBeok8OfNhg7WfdVfprY73Gai5d0+?=
 =?us-ascii?Q?yNB9FsVEd/jGrM7AaxC3Oi64En8zknLls0Pbowmi9XCQO1rpq+7g3wWO7RU9?=
 =?us-ascii?Q?z35ppGfs+PyQ61p/DyuIwkBFF4NN+ZV7kaoAj88oFUk2SVhYbIvWe59GEisC?=
 =?us-ascii?Q?jNdJZINu+pp3v7xQdC+SYponLJJQjkmjkQ4sanoKWkZTY7uf/KSKk0GjJvs8?=
 =?us-ascii?Q?pfyyQ7eRGuaxL5Gt8sqyEHmfMc7wYxvhAPgop3VFjE0nGp4D9SyCjGS7G3sy?=
 =?us-ascii?Q?wI2/6PBcHTLUnfopUHT78AR32Qx38KASGo7wv3ulkoTa6Egv98X7GxBA9MUX?=
 =?us-ascii?Q?4Ebe5Dux/6tMoLY1ZyCjTsX48Yleknk3EBo2kRTwOd43RM3ZcgTKfm/Bfzhq?=
 =?us-ascii?Q?BEX9G89FgIoUZmROFau9msbkf9gNXiV2ekXgwIdLWkzSQ8MyCzOyLb+NQOhJ?=
 =?us-ascii?Q?CA/GqCi2WRPN7hM9x5WrK4ExsxpQpQTYgpEcbQa8dSCXfoPoQ4U7WFER1dF+?=
 =?us-ascii?Q?DtPJjnypj/ntEL0hhogwdg6JDvUYS4Y1e2zPrIUiCNgUgzA+ANgDqs6zrCxZ?=
 =?us-ascii?Q?4ayeYLDP5ttro8QERXeFhF3NtBZn7OPTnjBfJvKZFPvbn0EakZzIctxXz+23?=
 =?us-ascii?Q?oC4Xx/NwQAqFFWNpllR5aSIyZueYpTWGUzQ2Jue7X4P2JZ9N79W02W6RWExa?=
 =?us-ascii?Q?mhs4ouhOd8SjhhY7Zci8zBvxaVCRi0YVxwp7EZ178J6s83TLBg8pmSqBkR74?=
 =?us-ascii?Q?fv3A24amvt+rrZixLSR0/8Xrhkxfioi+vV3NvUCWJK4qrjqtG1x8DCHa70Oi?=
 =?us-ascii?Q?LUs26nObIAYsW897f+5TMEtPhTJakV/ClwnAnuBdvcZYQxR1JWmer2+2EQnc?=
 =?us-ascii?Q?CrSdu80JsCh2vvVXyh7OmIEnxYXjUnumj3iuTLuRQXUj9e87XYoyCZgX4u97?=
 =?us-ascii?Q?2Kjx3kvBJJcQ+xqnVXeHSM3C7XTXOTu/Vb6z948kGqdnYqLKLxLqToD0iUFI?=
 =?us-ascii?Q?pI8LC45T+M1dsJLQ8iFqhPAc5HFjJKsLOT3IINkSw5y8xBDua5RppoLn/g94?=
 =?us-ascii?Q?3CkBlvGB0exCas85ddTklm+GoteSJNyMmDxCeFddFiu6BX1R4iuWUUnMf0RS?=
 =?us-ascii?Q?zatVsoUt3XaCBI8w/8JtOwBe+WRgksT3W8E2u0lXPNQYHbT1c3L0ucrkP7/j?=
 =?us-ascii?Q?Y4Ri8SM1+AvU/5i2VWv9bcJI+3N0LSvvXnKDSYXWruprGmtFUNXhMRpb9+za?=
 =?us-ascii?Q?W+oF9gyWB/6fLTNrzFsP33G46E3H2qta+V6smzKi4stSlNRNaIK5jDlkS5Za?=
 =?us-ascii?Q?0uU7OWRa2+gJBT+jHt1NfSCOgjfLx5uET8489gU1w9VPW2Q01NSuDOk+5pQM?=
 =?us-ascii?Q?4j3oXagRaYmgiKaG+2QC1+BGoSUUW6aOKjFSgtgN0baX1vaRaFhrhxQS9nde?=
 =?us-ascii?Q?b+haaUVllgHM2PZ/SlBuIBLLkoTzE8dZhEkK6XHtULwJ7hPiPmje8pRXmrjX?=
 =?us-ascii?Q?EUDnd3HoEu7z4pU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:58:16.8212 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9c56b7-6af3-45a7-a2e5-08dd6cc213e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6934
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

This adds support for a 3D LUT.

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. Multiplier
3. 3x4 CTM
4. 1D curve colorop
5. 1D LUT
6. 3D LUT
7. 1D curve colorop
8. 1D LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v8:
 - Set initialized to 0 and return when drm_lut3d_size is 0 (Harry Wentland)
 - Rework tf->type = TF_TYPE_BYPASS for shaper (Harry Wentland & Leo Li)

v7:
 - Simplify 3D LUT according to drm_colorop changes (Simon Ser)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 94 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 19 ++++
 2 files changed, 113 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 1bf40f39bd0c..a4b6bb7b409f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1293,6 +1293,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
 	const struct drm_color_lut *shaper_lut;
 	struct drm_device *dev = colorop->dev;
+	bool enabled = false;
 	uint32_t shaper_size;
 	int i = 0, ret = 0;
 
@@ -1314,6 +1315,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 		ret = __set_output_tf(tf, 0, 0, false);
 		if (ret)
 			return ret;
+		enabled = true;
 	}
 
 	/* 1D LUT - SHAPER LUT */
@@ -1345,6 +1347,87 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			ret = __set_output_tf(tf, shaper_lut, shaper_size, false);
 			if (ret)
 				return ret;
+			enabled = true;
+		}
+	}
+
+	if (!enabled)
+		tf->type = TF_TYPE_BYPASS;
+
+	return 0;
+}
+
+/* __set_colorop_3dlut - set DRM 3D LUT to DC stream
+ * @drm_lut3d: user 3D LUT
+ * @drm_lut3d_size: size of 3D LUT
+ * @lut3d: DC 3D LUT
+ *
+ * Map user 3D LUT data to DC 3D LUT and all necessary bits to program it
+ * on DCN accordingly.
+ */
+static void __set_colorop_3dlut(const struct drm_color_lut *drm_lut3d,
+				uint32_t drm_lut3d_size,
+				struct dc_3dlut *lut)
+{
+	if (!drm_lut3d_size) {
+		lut->state.bits.initialized = 0;
+		return;
+	}
+
+	/* Only supports 17x17x17 3D LUT (12-bit) now */
+	lut->lut_3d.use_12bits = true;
+	lut->lut_3d.use_tetrahedral_9 = false;
+
+	lut->state.bits.initialized = 1;
+	__drm_3dlut_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut->lut_3d,
+				lut->lut_3d.use_tetrahedral_9, 12);
+
+}
+
+static int
+__set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
+			     struct dc_plane_state *dc_plane_state,
+			     struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct amdgpu_device *adev = drm_to_adev(colorop->dev);
+	const struct drm_device *dev = colorop->dev;
+	const struct drm_color_lut *lut3d;
+	uint32_t lut3d_size;
+	int i = 0, ret = 0;
+
+	/* 3D LUT */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_3D_LUT) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_3D_LUT) {
+		if (!adev->dm.dc->caps.color.dpp.hw_3d_lut) {
+			drm_dbg(dev, "3D LUT is not supported by hardware\n");
+			return -EINVAL;
+		}
+
+		drm_dbg(dev, "3D LUT colorop with ID: %d\n", colorop->base.id);
+		lut3d = __extract_blob_lut(colorop_state->data, &lut3d_size);
+		lut3d_size = lut3d != NULL ? lut3d_size : 0;
+		__set_colorop_3dlut(lut3d, lut3d_size, &dc_plane_state->lut3d_func);
+
+		/* 3D LUT requires shaper. If shaper colorop is bypassed, enable shaper curve
+		 * with TRANSFER_FUNCTION_LINEAR
+		 */
+		if (tf->type == TF_TYPE_BYPASS) {
+			tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+			tf->tf = TRANSFER_FUNCTION_LINEAR;
+			tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+			ret = __set_output_tf(tf, NULL, 0, false);
 		}
 	}
 
@@ -1522,6 +1605,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (!colorop)
 		return -EINVAL;
 
+	/* 3D LUT */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no 3D LUT colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - BLND TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index ec94ff887886..e03e6044f937 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -49,6 +49,8 @@ const u64 amdgpu_dm_supported_blnd_tfs =
 
 #define MAX_COLOR_PIPELINE_OPS 10
 
+#define LUT3D_SIZE		17
+
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
@@ -145,6 +147,23 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 3D LUT */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
+				     DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL, true);
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
-- 
2.43.0

