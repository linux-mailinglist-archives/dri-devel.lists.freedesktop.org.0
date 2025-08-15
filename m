Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A477B2776F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA5410EA15;
	Fri, 15 Aug 2025 03:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BvfOo05z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6545510EA7F;
 Fri, 15 Aug 2025 03:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rc7QAIons9VfKCkTMmRQqBG34zlSdkUgi8rB3HQpdrvJWBQ4RObVN/IAn935/P2tFepvLxwcN8ExwtevdxlzWO8vdAnQiDU8BclHyWNe6X94kCU46r0BBWZTM2/FeTU17Qiw743VUvghnp4JtTH1fUmFjqBm7HZjz67c/aJJHrCsSS02QgVaIFmnWBoJ8m0Mbt+Ehm87KXVITjo81+HFguH45uKl6orhTT3dJ36CC2ufAT0dtoLFAsTGqPONjOATdtV5PThDLK9dTPWXSIzW24i4C4WICqNkehiRQh6ZfNjc5xBqzSGhaQM5lou8XgRCqAy0qRnPkF3Zi0YfxJPeeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sl7YIHKDgDrrPbT+8LKclCInDDx0po7sL3uLZhcwFI4=;
 b=elnsEOv0LE8KhiHNwaUdE2+JiWLYT09/opqXU1bVaFoPclVnTEl+JFwTpkIFgUmFvSFvXD8VNKZqRDQMZv5TCYP4AWg3e56Lbx1rfDj9BIxrKyDAMTtxkIfVUvwSw/Cpz9YVBRzMYRwqOEPr8LBoUJe5YORWqfZ70vS3LZmp+FkrH5CmY+yBhaT3RKEUftDyVPTSmGbwmF9Qmef2HR3H+YYRPXHctVJ9Hn1OkCFwyJaO36KLdveMuggIaxlefe5ash06pcKN+vNP9RStAKE7uwNWu1k+9rSJ8cAStKG9LMO9fOIPRS4+zPkAdqBzUZ9WyM/C0oSc4NEMYd+SbMD4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sl7YIHKDgDrrPbT+8LKclCInDDx0po7sL3uLZhcwFI4=;
 b=BvfOo05z+HNngOt+X3O2TETcZiGWjN1Bw+TG9rop/WCfenZQrKXQeuyLTurVTuaou9SWUXj23sND+aLpun4O8Fg03ELM7/VaKB8qNeL2khHBvMNY/YsNmcVXnTnVQJ8Mtfq0tMEA/gUWU38L38BmnssO4UWfk7eQP17a0URG+98=
Received: from MN0P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::10)
 by PH8PR12MB6722.namprd12.prod.outlook.com (2603:10b6:510:1cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 03:58:23 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::42) by MN0P222CA0009.outlook.office365.com
 (2603:10b6:208:531::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 03:58:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:58:23 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:58:19 -0500
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
Subject: [PATCH V11 28/47] drm/amd/display: Add support for sRGB EOTF in BLND
 block
Date: Thu, 14 Aug 2025 21:50:17 -0600
Message-ID: <20250815035047.3319284-29-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|PH8PR12MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6700ff-f54f-4060-f32b-08dddbaffaf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H8UBYqj6jrZWSuRyY+yDzgEowvAIbxva3mB22PE9c7y8HZnM0z9Z4QDtRzrp?=
 =?us-ascii?Q?zYZwgzYMcA/M9+qnRyl5+7DRTvlhKzsHtdi7oqQA3PXuoHRcGpkxI7P6L0JT?=
 =?us-ascii?Q?kDO8B6W29MNbzhNmn2pmXWK5uc+m+9j5kqv3ou+hsQ+ns955dZbPXZ27+v0k?=
 =?us-ascii?Q?0MPSTr7LLwQ+W7Rp6rHxeXXWbtDHdXxuxwnBj/5kq6+I+KiJekf4E7nyw/Gh?=
 =?us-ascii?Q?uxxKTd+gv3UHE8MSr9o13i5KklyRRxECCDIvjTl+e3ES7QTysKDyM0FniZy3?=
 =?us-ascii?Q?9R8vvAv3LsFmuRJ1FiQBIM7n4vxpJSDmyEakw53jIv7OBMmePIf0/gQj1gfY?=
 =?us-ascii?Q?UV7LNiYkhMTs9wFt+mB7H8T8LXVSxjT8qLx1h4x21gZkCZuZT+iWyP5R8w5b?=
 =?us-ascii?Q?zCIrtrB0CjGRkbSByisfi3s5SJwW49x6wNAACu2JBn6rV1poT9iffD+r5krt?=
 =?us-ascii?Q?75WPCU5J1xaoctLjBWZ+Qgdg+NBssIOI0LyWiRlQplbfBgjuhMSq8LHdoCrv?=
 =?us-ascii?Q?KVt5G0RjbBNVKdW/5MImfL9HMJEaA1n8L4ASJLDaP5FcHkguukhifQ2aHPTl?=
 =?us-ascii?Q?lEmblz6h1OMK1x3OI0r1ZJt/FIjmpdOHKCyRjaON1MccbHMd9fACW+7F9gnq?=
 =?us-ascii?Q?ejygwSAbaDF93hmHVLjxAWN5n9ZCmtnl7j1IPZprPWXZrk5YI7z47Se4dPOG?=
 =?us-ascii?Q?YbfioCnkQlwwXf2xu0IwisrooXg4xWyX2miSjdFUWCizQKSbqN1onqkIvxzm?=
 =?us-ascii?Q?3sU/0XqfBHERPJBRi70H5L935Lc1vJ19hV0gpuqrQBpwODks+8FgB3K9IBLE?=
 =?us-ascii?Q?gO/XTpHwwLUve3WZcq05rtiL3CPIreVvFYm30clWmJlBY9A2IZ+NNSaX+h7d?=
 =?us-ascii?Q?eKiAEPYq8faTPqlssA7rqBtsDHEjSEWBZavyMWfWIwFd+3Kz+kXPk4kKpWHu?=
 =?us-ascii?Q?XbUR2rQIw8hzPvPW4WfpcFwMqGmgQr67KGXdP5oA9cOvYpTmjhZli4AS/qDn?=
 =?us-ascii?Q?eZ0GINXuUZhcnsIjebY2hEsjO2e2Ier5XuRLK4q074vuQ/JjNLStXPxo8suj?=
 =?us-ascii?Q?Hl7XSFmpJsIzJTWiGGpOhnYVzqLpQ0ArK1vx/l1+nJR52CIpjKSnoMOz6mFa?=
 =?us-ascii?Q?XAkKxW6TLU9FD4kn5GDfRWOzA8QKW6E0rAX1TMLI9r4JmDmAfob4LPPJtpjH?=
 =?us-ascii?Q?AfsBcuMtJpkkPuKGLFvdyzhcQ241jVMaPqsDuoZRmr92l/PefpnC3i4gpbmf?=
 =?us-ascii?Q?WKTMxeVPtC1jxEC1t9UQMrLLnwUBNM/bcIH4o8aEvDPFYwj5aKv2ikh6nSJf?=
 =?us-ascii?Q?8HonkIEI58RJwvxEG3gnlm8iwrGL2IPzuVg48EVCRHYsXXR9VQ92+BzhsSfF?=
 =?us-ascii?Q?LIWbwQJvDbjp/FtfkOixDRDJSVaE2qYyN/+Rgf2wBj1ixZZ3jLtObjALKSsq?=
 =?us-ascii?Q?XhnvhJHJogmufuVubEdbocMapOnH93ExaI9js4zBuCPzSKipXaQG64nc/XFE?=
 =?us-ascii?Q?gStCBicO8+01H/FaigeAu5k1l3v5AtULREpB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:58:23.2162 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6700ff-f54f-4060-f32b-08dddbaffaf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6722
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
v10:
 - Remove redundant DRM_ERROR (checkpatch)

v9:
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
index ea6078592f4b..e8ba66962ce4 100644
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

