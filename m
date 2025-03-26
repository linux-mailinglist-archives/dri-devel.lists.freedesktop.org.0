Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589F6A72789
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286A510E80A;
	Wed, 26 Mar 2025 23:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P8zkIUC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA3B10E809;
 Wed, 26 Mar 2025 23:56:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFFjVI6hGJD42D5FVPnl3HqNhn94RtPRQzo4vBcKy+VGOviJeV2vM90O8YatdEGodqF69U1rQ0ooo1OxLwdewL0DGoIlrtd69nDa2xNIUY1shcrjQXlF9C62llLKQlnqUL0tpQp57M+KAkoHZ8Y/Luj+ZwttE5mDZcA4gOaRK4TbRffP4L4UdxzCU1A+h/1Iki790upYRd37mpWio/T0YZw2Sbb14W3Eg05xt9oehe//sLNrcR11xYdmPFZ4ntDC4E8uckm9/fGC8WyMSmzc5m6xhKJBvIfhhrLGuB2RcXjCeQN3DG3TM3LQfoh4i8TH6z/4+j43orddqtRRHMKVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYHRKjzOYAoyOXlRBalXIlTKIBezk5FLMX1jnJYT5ys=;
 b=gPyRTZwOaD1waAZUcILP6FgaX1uUmIIGLEJq1gyXz6j93l28hj7YaTVaDMweiwbZxRmUKMkGaRQLilpFCAE1gjZQRcMXLeZ8laseIu5EufgWX+VF66kQ9b131QIPmXT16D4vXZW3QUQSDMxLTimtf/WJeADEV7gm/2ORxQMBnTXlzT2gsIhl1RcmOgBH+VBqi+uGFOCOQkK/2dThhfVO2+cBLIJY9I5odFsyA1wxk5/4ZKITcmxsWoZFy/NicyWUejaZDghNR3Q3C7Qg5I1IDqzj93JJ/37HdhlpMQjupoGa18Jt7UXn7/ThbN1CMfM+90OdvBkxCJmiX9IC7bOudw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYHRKjzOYAoyOXlRBalXIlTKIBezk5FLMX1jnJYT5ys=;
 b=P8zkIUC5ySWLMdAheosAeI7hs8s0CxJ15vB/dak95SIM5pDkVUk7YJYAYDt+UWfczILuVY8bUOUUA5mn464YpsX+/Gdu2luPOWp70sgIzu/FCpUn/sDXVWn7WEq0aXee068XlEViDstt11+ArTfbMvYF9+YuCrf+gkrcYH8s4a8=
Received: from BY5PR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:1d0::34)
 by DS7PR12MB6069.namprd12.prod.outlook.com (2603:10b6:8:9f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:56:23 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::de) by BY5PR04CA0024.outlook.office365.com
 (2603:10b6:a03:1d0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:56:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:56:23 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:56:19 -0500
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
Subject: [PATCH V8 33/43] drm/amd/display: add shaper and blend colorops for
 1D Curve Custom LUT
Date: Wed, 26 Mar 2025 17:47:14 -0600
Message-ID: <20250326234748.2982010-34-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|DS7PR12MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 935a38c9-2578-4cdf-4ad9-08dd6cc1d019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k8G+qDn9fR+KuPdnU5bI00puQPef1PmFAysVrB04w8ccsLPzqrp8D3CZgDlX?=
 =?us-ascii?Q?mBB02jYxZH5vPiXw9g+HZ0kwiFPnuWKbsKz2pVkwckk/CGjWoi11iOEcl+qY?=
 =?us-ascii?Q?Yk1R4hwCGRQ37f3kOH+71K4UDWFmXV9xxynu3HsBfLgU+kmrLQP3uAye+J3J?=
 =?us-ascii?Q?PlVa6rH4Zawx/5y0h1qv2QC9h5HdpVn5fYKd/3iPtU6BGLheRmEnU6SrqbzF?=
 =?us-ascii?Q?CGfsxDAIBroZAAmDxHFy2WKlPdRXwHEz2TAWj+jM0od2/a08kwsofndIYCmT?=
 =?us-ascii?Q?LbwVvEV/p1jJvhiuXWAaJfSAlSfwuavZDCdyTSFhQ9Otg8tpzXJvZhgQ0ZFr?=
 =?us-ascii?Q?/gJzc74/QTrTku7JYT8pYsplhNNr83sZKKf1Pi1xUbi7VbqDFVIhOzLK//Uy?=
 =?us-ascii?Q?I+UgVa1GiHdBNJXE1ttZog1457TMCM5WD7pey6zIq9rEmzgkPBeG/nqB/yeQ?=
 =?us-ascii?Q?RW4SvmVLcuixxSgYu+Kjy1+HPH4GTERDbszpL9suINo0iZtwIF+AF77Kb1K7?=
 =?us-ascii?Q?aQtycFlPeQJT5JLwfh8e/7DkoUzGV8vh9wRfwsL0qIcBT6rnMr9z2bTkUWZf?=
 =?us-ascii?Q?DMndEKA4x8vQB4mxXw/I9ttkG/lk4ymn3iVljp48sKDpywDoWst7zhoHn8R3?=
 =?us-ascii?Q?koYb8pvCdx8BiJ43uxxFb1Qa6C5tCz9GMxQ8tflxDeoR6PL7MrIm2n8Gtc9o?=
 =?us-ascii?Q?SvBIojHoC0yFPIeXt95GIycT+R/7u4lSkoJP7Tly3C1N+12rf75oNJaRkAtG?=
 =?us-ascii?Q?0BguccY7hzdhOTmZjWckQ00fEewiwq7xWtVMnt0rU2i5+XX9oaaZXuegtmFR?=
 =?us-ascii?Q?Zrfz28sAIvyrDhWvlpLTAjUDgkhPvjC5wKj92hLETXIL4pGBiqUzpb2ZC/lI?=
 =?us-ascii?Q?tLFhezmf2kxL6fe4yyXK6RVbXdBE+C26b8enuT0mt+H2YErZN70FbgiLxsbu?=
 =?us-ascii?Q?9bNcEmfQOg6mDH28oZs0vqICrnHphzEyx5wezcOBxdadURZx7YcA6st5yVO1?=
 =?us-ascii?Q?gTryhsTKqjTchNIMr1lzpwHXqbGbSn1SzHrlj9cihWiNxNQ7jCOPqkCKXn+4?=
 =?us-ascii?Q?gAMjVRCkqiv+4Wg0PmOCdZ4iWLv0LvQbfFVMy/oOdOP+7BlOabI3Yiw/KO0O?=
 =?us-ascii?Q?8Cgen4iQtcpuIf8MgIsx2e4F/CGRfukkaiiMLHMKXLaw2LfrTH4ysFTQ6oPZ?=
 =?us-ascii?Q?VSqaiFEo9S0rM3P+R9OgEjTl/r24D+ENqYNBbW7cpI7JdF6ZXPTkgF79uroP?=
 =?us-ascii?Q?IssM6fFcDuwdAHLQbyeY+bjk+lmlAlz05ANzXzKh4tg2htP9VwNnAVKUwJqs?=
 =?us-ascii?Q?0wR3ip9ULzKlzd5XwghDxfjmAipGmNX5+BSPkX/2f8DQKgvgF53DzgV1FJo+?=
 =?us-ascii?Q?vFTS5f3o2Pp12rdYKJix1Ed++HKuqc811BEv/3u/caY6ADhi4UlfnnuwO2Ew?=
 =?us-ascii?Q?GVXeaMICsW9XcFIRr+VOjlq82kshh00/c488AuOUy2TbQN3K54v/vZLSzi7r?=
 =?us-ascii?Q?nylRLYq/Ib0Y4ks=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:56:23.0878 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 935a38c9-2578-4cdf-4ad9-08dd6cc1d019
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6069
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
---
v8:
 - Return error when __set_output_tf fails (Leo Li)
 - 

v7:
 - Initialize uint32_t blend_size = 0 by default (kernel test robot)
 - Modify state->size to colorop->lut_size

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 173 ++++++++++--------
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  32 ++++
 2 files changed, 126 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 1765402bc122..7e81088804fe 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1211,38 +1211,6 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
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
@@ -1251,64 +1219,66 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 	struct drm_colorop *old_colorop;
 	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
 	struct drm_atomic_state *state = plane_state->state;
-	int i = 0;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	const struct drm_color_lut *shaper_lut;
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
+		shaper_lut = __extract_blob_lut(colorop_state->data, &shaper_size);
+		shaper_size = shaper_lut != NULL ? shaper_size : 0;
+
+		/* Custom LUT size must be the same as supported size */
+		if (shaper_size == colorop->lut_size) {
+			ret = __set_output_tf(tf, shaper_lut, shaper_size, false);
+			if (ret)
+				return ret;
+		}
 	}
 
-	return -EINVAL;
+	return 0;
 }
 
 static int
@@ -1319,28 +1289,63 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	struct drm_colorop *old_colorop;
 	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
 	struct drm_atomic_state *state = plane_state->state;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
+	const struct drm_color_lut *blend_lut;
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
+		__set_input_tf(NULL, tf, blend_lut, blend_size);
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
+		blend_lut = __extract_blob_lut(colorop_state->data, &blend_size);
+		blend_size = blend_lut != NULL ? blend_size : 0;
 
-	return __set_colorop_1d_curve_blend_tf_lut(dc_plane_state, colorop_state);
+		/* Custom LUT size must be the same as supported size */
+		if (blend_size == colorop->lut_size)
+			__set_input_tf(NULL, tf, blend_lut, blend_size);
+	}
+
+	return 0;
 }
 
 static int
@@ -1409,7 +1414,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 1D Curve - SHAPER TF */
+	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
 		drm_dbg(dev, "no Shaper TF colorop found\n");
@@ -1420,7 +1425,12 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
@@ -1431,6 +1441,11 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index ff5828a1e8cd..8a5e15083f11 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -29,6 +29,7 @@
 #include <drm/drm_property.h>
 #include <drm/drm_colorop.h>
 
+#include "amdgpu.h"
 #include "amdgpu_dm_colorop.h"
 
 const u64 amdgpu_dm_supported_degam_tfs =
@@ -90,6 +91,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 1D LUT - SHAPER LUT */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
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
@@ -104,6 +121,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	drm_colorop_set_next_property(ops[i-1], ops[i]);
 
+	i++;
+
+	/* 1D LUT - BLND LUT */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
 	return 0;
 
 cleanup:
-- 
2.43.0

