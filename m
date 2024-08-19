Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ECE957645
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEDB10E446;
	Mon, 19 Aug 2024 20:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HsTXS2kd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D6410E42F;
 Mon, 19 Aug 2024 20:57:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ED++JlWKJQpIrch2dBUdeGl9I7NPAwZUVxWEBfKMNc7YJ5PLAqu7nUYT2j5O+wvLXIZ63REGyszQRnEFQoTNb5nGpO36FG+PsGXlCvhlfxuYCjT2LutimRFjZ4Z0zfYtjsBKLxlKYfUT+RtsJ364ZQhK8myCfeFOpXxOGbT7W80FxodqZ36psFBN2jTK+SmS32DDDB43rOVS/0P+tUBXCtpq5mMX6bgWNLdxgT1bog7mp1ajSrgIT1/c86QgtE8joV6LrujidX7NPtaC5yibV/hnGV8JKU9Rn9LgS/q8ewkhMvlBVkb71OKHM6PYh552TZUNI0s7SIU/zeQP0SfG+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTZ2M94TWJUe9i9tbsWmQmSzoMGMa9FOzHNwwAXuxlg=;
 b=JoNiMr1KsSaqlD1GF7Sx06akP1jdkS4e3rUGFSq0RC8fNPveXyPr+xEl8Vf/jrvd3KhN9PdR+rdsd4g7QP8LlN0TUFfC7c8m/2FLc4lMFoxgxKAsE5o5YeueLsYWY+wQBClLKKfxy6AKpEKnWhEtwiSUt2LRfN055Wnuj8zGizo4s4LUE5HUkqd2hnpfPURVQdcy9DaYrjqDsCvgyMYyciUZSoT9yRQZGVj2KWi/3/EV4hPfYjLNMOR03NfztnLrULmZ0O8Yy8WudtpoleaNRcZAJLS0F5ltf2xN4pyo5WVGJoZCuXMR0Ee3D3dsZBaCU7RK8YDS/eHLfgcS5U4IGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTZ2M94TWJUe9i9tbsWmQmSzoMGMa9FOzHNwwAXuxlg=;
 b=HsTXS2kdobH5ZaReFlKhj/mAWBdQhOxCbhIV7wcIdxRAAb17CuaMTZpAsvzsgFr3k7ZEACVo72rzBBDxAgAt6ibVXyDgiY0YCkOanRVLfrR/Rl51hrt3UJz1lzZaN/sCMiq6FRGbz/laANwDtXDD8pX/QF3vHoY0ObZSWxWcDzg=
Received: from BN9PR03CA0040.namprd03.prod.outlook.com (2603:10b6:408:fb::15)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:43 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::66) by BN9PR03CA0040.outlook.office365.com
 (2603:10b6:408:fb::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:42 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:41 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 36/44] drm/amd/display: add 3x4 matrix colorop
Date: Mon, 19 Aug 2024 16:57:03 -0400
Message-ID: <20240819205714.316380-37-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|DM6PR12MB4172:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5acbe2-2b9f-4640-b4ce-08dcc09191c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zpFjHOffUil0GEjn7m2VnrLQwPFEvMw7QUQ/xQ1mam1eBxbPpFz3SMhuhcOJ?=
 =?us-ascii?Q?YQ9h3oMW82NCeAInjdqP2RQztIWXeuQ9XHSlxkrl7ZNfucdh76GJKwGpp0c5?=
 =?us-ascii?Q?yaKhg0H/d1KWGGww/gH4GT/jUSzgswKfF9x1bxjmyIcJyDwNoQAb6OTfBXgA?=
 =?us-ascii?Q?F9Zls5IgWOFbAtkc7FtUBc6LKTnRijY8EzjIUto12PfJmVKH4+WQZp8R+FiX?=
 =?us-ascii?Q?kxOb+t3Y7T/Zj7gfn4gvdp3zj2c91Kfkc4JpNbfTB0WkB+nVcLBjy2YnRcHQ?=
 =?us-ascii?Q?3CcWs/Ddm69KUDnwCKa2z8kvRDQtgLhRrMZ1rnyJR0zzUk8KupPKEPp9Hzwg?=
 =?us-ascii?Q?z2ftYL9HAw9KwBxD+/NBOQYn0US4XwstklC+YrvU0S+Hf147C6nIsNolXp7t?=
 =?us-ascii?Q?y8qSZgNX752UIb1t6eMSYYeigHbv6bsF1/hdL2ojOuwh9QXd+yaaMhErFnB6?=
 =?us-ascii?Q?/35ukgXQv9PtM0/IVvIYCJnKRmmgiglDz6WUAc5ae1J6aVSejTIYPyuMl4T3?=
 =?us-ascii?Q?HI3Lz5grna5DoZMuhvwGAeDOZb5taJSkKK+9JrBkvEjVfMgyqYCDFNenJJUt?=
 =?us-ascii?Q?14bWbgO0H7mMlHDoRJwv/C7JE0VlSREOUG7RizCTytf1WNgQalBUJs0Kq28H?=
 =?us-ascii?Q?MrnO1KdpBZ7prRA6Mqwnbx8OO/R2xO7GIQrSRo4Jz+LWAWsca7cqzhlaazLS?=
 =?us-ascii?Q?loWd5m8ueWURTOB6ysVjglYCnAoNRV/5Wk7GzH64/XOB07BTS+QBGdk/42xK?=
 =?us-ascii?Q?abtQDe5ZO3Cke6Z0O5XOD+zRNn3Z9trDRCfgQbWPTqq67r55SecxpOUpsElU?=
 =?us-ascii?Q?DoBzP2DKHBfAFFJKb0jM324YM+3J9aojpR54YRjcT7vzUgs5rRNWpgfkRNux?=
 =?us-ascii?Q?yKZZp468RfckumesOiROpWHsohyFxwyjgK7KgiAWkFpgDgLdYRYJstirM/vW?=
 =?us-ascii?Q?+JygkIqY2ccHBaLn6MnfpaigcubTqVzJtjaQk6cY+CPHo/2Jl/1EXN/Ot6wo?=
 =?us-ascii?Q?NrAiRyhcHvlDr7uiKTNFa7c8IFMGzE0NKHl7FkSvReyHqZsfY3RvqQ1tkgye?=
 =?us-ascii?Q?UP8wTZNjlhvGIL5DYP5ATeGseoVZbIB3fSc/NDCU/4xbkMVKAYz4oEf2EOVS?=
 =?us-ascii?Q?mGsO3n4Hav/7lNUYj4jXUyCASTV+wZ330JPviGluPP8fIFAjyKVMflm6GTGG?=
 =?us-ascii?Q?DrEolaVmSUg0sFXVv7WmdbCU0FeBPk8gaWTcwDUcb2GUTLOQUsNLPgjaJrUs?=
 =?us-ascii?Q?3A3ctL0fvWE9CYNZ43UZvAasHDER/y6l8tKeLXwBn+8oO1SJ5HEwJSdccQ24?=
 =?us-ascii?Q?FZFLzFFWe8CS5vee3gDPMTFAtzUu96AaPBFVdYFllQ7iKNMUvXJ/YtVo68T0?=
 =?us-ascii?Q?zzdiVWHIdmYGSTtEF4NAEseHyHg5QRdK1yqq5i7/Ay+8Bibiqlc99eGCAuVv?=
 =?us-ascii?Q?oDDlQYsAekfCauV6bGJSPL+tDLFWEYYF?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:42.7652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5acbe2-2b9f-4640-b4ce-08dcc09191c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172
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

This adds support for a 3x4 color transformation matrix.

With this change the following IGT tests pass:
kms_colorop --run plane-XR30-XR30-ctm_3x4_50_desat
kms_colorop --run plane-XR30-XR30-ctm_3x4_overdrive
kms_colorop --run plane-XR30-XR30-ctm_3x4_oversaturate
kms_colorop --run plane-XR30-XR30-ctm_3x4_bt709_enc
kms_colorop --run plane-XR30-XR30-ctm_3x4_bt709_dec

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. 3x4 CTM
3. 1D curve colorop
4. 1D LUT
5. 1D curve colorop
6. 1D LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 50 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 15 ++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index c66f249ae70b..ea9bd287cddd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1212,6 +1212,45 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }
 
+static int
+__set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
+				  struct dc_plane_state *dc_plane_state,
+				  struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct drm_device *dev = colorop->dev;
+	const struct drm_property_blob *blob;
+	struct drm_color_ctm_3x4 *ctm = NULL;
+	int i = 0;
+
+	/* 3x4 matrix */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_CTM_3X4) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_CTM_3X4) {
+		drm_dbg(dev, "3x4 matrix colorop with ID: %d\n", colorop->base.id);
+		blob = colorop_state->data;
+		if (blob->length == sizeof(struct drm_color_ctm_3x4)) {
+			ctm = blob ? (struct drm_color_ctm_3x4 *) blob->data : NULL;
+			__drm_ctm_3x4_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
+			dc_plane_state->gamut_remap_matrix.enable_remap = true;
+			dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
+		} else
+			drm_warn(dev, "blob->length (%ld) isn't equal to drm_color_ctm_3x4 (%ld)\n",
+				 blob->length, sizeof(struct drm_color_ctm_3x4));
+	}
+
+	return 0;
+}
+
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1411,6 +1450,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* 3x4 matrix */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no 3x4 matrix colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 08480bf61dc5..ba42f1f6b620 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -69,6 +69,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	prev_op = op;
 
+	/* 3x4 matrix */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_ctm_3x4_init(dev, op, plane);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
+	prev_op = op;
+
 	/* 1D curve - SHAPER TF */
 	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!op) {
-- 
2.46.0

