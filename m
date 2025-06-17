Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90D9ADC06B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0124910E57B;
	Tue, 17 Jun 2025 04:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YqFYHI/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36DA10E57B;
 Tue, 17 Jun 2025 04:25:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPw2id/FCa8ePqyCV6+8PVP2rcMsxEBUn8x3+eAuEZLy22iU6OP8KD2H7TNVXtxNOHbMQdixu1n8JGJV6lohLukkN9dmL2uCfNK5a2WyH0rUogMZvI6+SMDL8WiME+xG4ChBhPo+2IB7Z8soM2d+iIsheayQ8BZvGOri6BqUOQoTG/OO3Pb+NsA++banzkUO5kfRxMpL1uRZowBDshZIuk1J6GgNAKiUnv8JB95zdAd+MXCGFmupdpK5TLDML8iDzmU+/HvaRkOV7MCVApK1hapg7K9BTq0uKhrVlmaSvM/XcJPfn0XMMVVoFn4xnvK0KcRaHf76GpvbOe84GvwhBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbNSNbMbzcd7KonEM6/zm5fbAa4kVvgnDfxp3q7SQMk=;
 b=WUEB96s6KdssgPS0VuCwFLwzk2z1lhMHIY19I/4NEB0dcxpAj95R4zxUtlmd+tGIJwyj+GUA67d11f+nY+dr3lqh15orAE+sF988+rXpmBRA4yHlTyjGChIx2T8oCByuaoZpTzHzLwelx2RHoZFkpPCJkT6vYAL7hsjZk+kO/6xUVkuDwpbAcoMPsheM4CqYsamBWwH+PHVYaS95QaK1dVv5Wkc1Ra7xVNG3UwjF9R+X36iDWygi86qIyP99URS5+YUuBNotcr0NM4WgrbBNk/rrdqJzbZ2DmSrzKKVuVAQXyTqXKDvy/3sv5apAFg3KoyS6mxY3GywLmMLufRf9kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbNSNbMbzcd7KonEM6/zm5fbAa4kVvgnDfxp3q7SQMk=;
 b=YqFYHI/Bg0OMIdWKAyn4NiilWderzTATeCoVT6LVCeZL/bp2kyeWtOMOPu6MIO6Ows0R86I+cNIo6l7iIDGI47fnWvJFzf2Z+i6feMncToogpZMLwvaJLkMzbYpLVHs4SsWstORRXJ8S9cEiqmkn4/vLoMbkQy3LmjVHx1PHOtU=
Received: from CH0P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::10)
 by DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.27; Tue, 17 Jun 2025 04:24:58 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::14) by CH0P221CA0028.outlook.office365.com
 (2603:10b6:610:11d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 04:24:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:24:58 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:24:50 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 28/46] drm/amd/display: Add support for sRGB EOTF in BLND
 block
Date: Mon, 16 Jun 2025 22:17:10 -0600
Message-ID: <20250617041746.2884343-29-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|DM4PR12MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: e096ca04-87a4-4f8a-340b-08ddad56eb60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ioUEO+ALAYyhg9i+2Mpu9loAc40Tu0T1JjIjLzszyVYH6nZCXpgrih7n9T/h?=
 =?us-ascii?Q?GXSilvkuR7mkicNQ//mRYkAi/vz6MLco2TfOwD3BYUtcloVSj3hp0em1iel8?=
 =?us-ascii?Q?mUiKvPJgcqIdxmi6fbb82QXibZP2DqnGnommYoNq+oXGgYsVeiWAveFjbrHN?=
 =?us-ascii?Q?Nyckm3fbYZwofrsyOwdkXCSP+9fZ+tFjDKbi00k9Nzj49+RsjTRM5ILexBQy?=
 =?us-ascii?Q?oxpLsKFJtc9IlmfS4TMCjR3yBKOtMHQlMRcbIBZzVulZ2biHFIRL/Gjnoj6p?=
 =?us-ascii?Q?x9QxYL/A2S9ivU/AY5ee/KbAvMo8KVSoBTileC9gUGPwSuc+cBUB58pEXIi1?=
 =?us-ascii?Q?BMa195FotUQ5Zxn66yf6Qvf+1qVn/CmRoNLsqOvsl1vP/VEFBQFcEUb2MDUw?=
 =?us-ascii?Q?cXQo2jfrQLveQ2RcB9b1sjKmIVCq4bTZusElhVYWFooFZkA5AG4Zf//ZEOlg?=
 =?us-ascii?Q?xs8PY5Km34sfRTG/CqZxTbGoGEaxbk0hfGG4oOgCz7lRg7aJQiDuX2HSw42Q?=
 =?us-ascii?Q?Fq3oyoMyhmqPrWMus9/GInUrK0lGOw/n5xT73TUK0ZRk36qB18/lqVV8KwDF?=
 =?us-ascii?Q?dzOoAS09qfTvOj7wfFrB0/hR/JFsQoOwhgY5CemUO8S/rS/CqWUc7q1pbjTm?=
 =?us-ascii?Q?u1ZJV3tfpOxvWhHCVCuwuqML2GvhF3LugN9cvHJzbe+CdZkHQdnlUgpE1N34?=
 =?us-ascii?Q?FsdZQEaEi5eqM4XCiaKrNDVWayQZkjz5OhEu4DIbUfaTb/bkR2kXApHtGo+B?=
 =?us-ascii?Q?S+SED6Ia1oorG9A/Bb2VQA1KwL1XA3aWuGIGlWthmLLat+lG10wKumAerU/Y?=
 =?us-ascii?Q?HT1hRJjqoaHpGs9H8ciuOsAYL5Ds7rqmg0eKPrcv3OZqZbjqkqZxrGhHBU0u?=
 =?us-ascii?Q?0Pwd2HzxAySXVz1R5xzkHEcVjnGV0k8wqy9KI0P26GPI/sgOoQ9BXt8jVuJ+?=
 =?us-ascii?Q?teT329vnAuoATDlpFCObkase7XyZl4lf+abzUBhKp//BnjsK6FFOK2tI599Y?=
 =?us-ascii?Q?2/XLRJnRi9j3yNFDVZOOTpCjo1eEzm6wFK+TZG8J/JioDETbLa9yj6WBKGPD?=
 =?us-ascii?Q?lUXThzF8qpKfWFNK91xUzWo0kH4IXBi4zEQYdcE1zbBehsD9Pv1vxGmJ1W/g?=
 =?us-ascii?Q?XpBeWT9T3UfDsR7l6li/qFRQwQt7zBBXY34Fpq2AX8kJINJ+wRFqKLOR3iJI?=
 =?us-ascii?Q?H6RRVQyxdiYP9pSKlIVSGyc0DHsBwKqvumCQwQ7xTrh08oS/PDUca0MC6icN?=
 =?us-ascii?Q?HaGz1xOqVQyl1UDeCAPz2xofGcq8OVjy41t3FB3NoTH4H+3cpuZeBwGlVV6x?=
 =?us-ascii?Q?4aXTaRrf2Qiyu8841ioZMPMincB0EV8CGG4zFutvmx9EfC49GXprRckA9blr?=
 =?us-ascii?Q?sN2WQ6N2gzhA0ATc5AmVLpFs+ybIPjzNMfOuW2a3+KbXj44Xy3ul6CnL3huN?=
 =?us-ascii?Q?Z/wVfG07VCsqXeMJ/XmEWa0f4lhCUKR6L7scal4YW24mXMNSSIPiEd+TiLtU?=
 =?us-ascii?Q?J4/RZ4NaYj7pQI7TMH5nrfK61PaX/O8Z7P9S?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:24:58.3672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e096ca04-87a4-4f8a-340b-08ddad56eb60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9072
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V10:
 - Remove redundant DRM_ERROR (checkpatch)

V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v7:
 - Initialized uint32_t blend_size = 0 by default (kernel test robot)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 77 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 96 insertions(+)

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
index dec64f11840f..aa6737f2b35e 100644
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
@@ -77,6 +80,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	drm_colorop_set_next_property(ops[i-1], ops[i]);
 
+	i++;
+
+	/* 1D curve - BLND TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_blnd_tfs);
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

