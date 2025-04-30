Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5FDAA4070
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23D410E681;
	Wed, 30 Apr 2025 01:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RS+PB8oW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB1810E682;
 Wed, 30 Apr 2025 01:20:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRrye1lf8ZLscySxHzd5SfoeJap76nCoZ5WsI0mnOgDTYvoKrl4OcrXHM9nn0aEs4oG8REN/Tw9hZ8fZ+FZVFeQowBI5qxsy99czlfgpWWQUyt8oWUS3wamOdc3I+seVv5BGHMjg0YU9hdRZXtdi1AH0CQzJfLx0QECg2CW831ykUA11H3tH94fIh9E5iAiwhCVx/ql6DBF+oONk2BcM3BaQZHlXQEN0Mxm2sFlSinabZ+tgYOiDPEzXaxW1hnvLl+iJkPE5FQdBVOipn+58Ym/Qiz2QpuVOIA0hcurbmC3HUFI9BJ5tyCQoxw9mCjUvOc3Cwf71NePcEetwHc0J3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5S8tvqX0PVN35ioDToFZEZ7+jDp4t9/d0X5WiS4q3I=;
 b=ENMs5gam5csC1FKWRVFSa14s+Q1+5JHCTS9ROjkLjjsJdWKX44Pj6YjuIOgzlrEUcUqWoyBnG0cH6KvPL/JiTHTsQlYJa/4tD1RmljbPXcLQy4e3NUlg4kzWpdaHMudtCljTrl9xw6g+tUZ1gclwiZ/T/DtSJdKpwnOz1RvJ7T4OcvLtLmNpplVtFOJ/JU6w6jAETYhQcs3ZFTpM/XLKeK0iA5GngaW6weytjIKUYatxLBbTTA1kbEtXlUG2vtcCCUCSXKaAunVSdLYNiF8nkLJ0lY8oRSDs+3rfGRR/OhFYiKo1wdFB/sFqyWg2OFultCccm+rrFLPcPsD3pJMsqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5S8tvqX0PVN35ioDToFZEZ7+jDp4t9/d0X5WiS4q3I=;
 b=RS+PB8oWDZC1hTC0Bramhxnvk6UKEAYNvLEdUSGtKfv80rzijI2nuNCB/erbX8Bzi0pXKfNxAPY7HnbAR7W2mqEIeD6NROiRALlqc+veY+gVg8JcpAe+39L4JbaAe8TUzDMXaZUwJGnGlXKFG9OiS0T3SzbxkCuZc/g0hPn72Vs=
Received: from BL1PR13CA0184.namprd13.prod.outlook.com (2603:10b6:208:2be::9)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 01:20:28 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:208:2be:cafe::48) by BL1PR13CA0184.outlook.office365.com
 (2603:10b6:208:2be::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.13 via Frontend Transport; Wed,
 30 Apr 2025 01:20:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:20:27 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:20:24 -0500
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
Subject: [PATCH V9 35/43] drm/amd/display: add 3x4 matrix colorop
Date: Tue, 29 Apr 2025 19:11:05 -0600
Message-ID: <20250430011115.223996-36-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: a0df4485-de64-4f11-8c8f-08dd878530f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S5HlbzRNNFm7rIDvOiiKfv9YO6LT4JMfOYLnCzRyrZgxczyuKpHjGBNaDoV+?=
 =?us-ascii?Q?zUdl1lGRiXKIXuCgpNFPr+PDAfBzF2cQ7A8NLUDR7cMl9iD6S/sIQfqJWBaO?=
 =?us-ascii?Q?/oY/gJXCnl7y2xTY7ys4rosGs3uh7bKctW+4BOApw6exRC8Kcsz1ijN7cYex?=
 =?us-ascii?Q?9lJtWMxgXlmdeFfdPaQOgFnz3x9UVKoqEHB1J6PVWl/lvwf0Oq+Q9gXtYTjo?=
 =?us-ascii?Q?aT1laHeCU2Q1a/4RZ/ibthdiU1DOy6zHejfp4Fo6jWY+/+Db5uIlUQwfX4Wm?=
 =?us-ascii?Q?OxXCbT+fPcerjVhOgguoaBh+7LW874/bbL7PblKWm6WAk4YnjGY9BxkHF1qD?=
 =?us-ascii?Q?53WzGnyBqoZ1GxcwFX6bCwtA878z1enCKWVR12budH2jKPdeIz1VU/D3EAL9?=
 =?us-ascii?Q?/3yYpeJKhkfj5LwfA751BBq60QqUHDhNQlYXJ/QgVp/WH06F2X3fnm2nU9to?=
 =?us-ascii?Q?wzP/N2hoO0KFJUSANbI4jEbTRLcrF7zX3Qn/OdkWFfW9w2dsw1px0oaADJEq?=
 =?us-ascii?Q?1Ky5Yk1cgf+myGaPDW24dPzawJaRAewIpf7X8ba6wkMYy9wLHf5rG6H5yU9e?=
 =?us-ascii?Q?67iDWfM0A3X0QeQ8DhjWPv9J85OBeu6egtfO8GVFWLU2Ov15rovb6VnN3Wi1?=
 =?us-ascii?Q?NKaC50ZQWxnzH71axoQII0MvOEx7XryvWRZijbZqz6BAh9GqoyduQ/PD/THq?=
 =?us-ascii?Q?EQSgG+9/c/PCS7eHddzusQY6gcBJJ2JCVSGvEfqVbdiq67h+bp0OrC4e8fet?=
 =?us-ascii?Q?3wKpBGzcmUFmnNJrNEfU/1NDA6kBP0dezGIxrluXeE2LWvxlEi26KEl3KSgU?=
 =?us-ascii?Q?xVqkT/O2elNznaz0knk10yCQKmsVMtYmDegnBBQsrgIYCri2KrRcpdRV4wh7?=
 =?us-ascii?Q?yUoig5th7D48BVo/XPI7x+EkwiHJvQQCurRJCL/jGBARhjg2TsfiH90Iyp+D?=
 =?us-ascii?Q?KINVY1s6EGPQpi1B8jb22tqAFa7H7ptJHQ/T9XbzI6jERhmnyUGOtf6TJx9J?=
 =?us-ascii?Q?LA8HqgBiu7IIvcnx6/1FkjqDxbh92v05KeoddpiQ6BEFtmHmCBsE7IdJvCOz?=
 =?us-ascii?Q?5mn7Zl+juLDYgiymthPmxJMalltMig/rG0ppGmrnFQTbRbfuBxcN4sLsXf4B?=
 =?us-ascii?Q?WL636zWaqZ2Drblhjfi0EhpFmGPtmxkvTdFAPmWsZrvEM60+HUZE6hCNWa1E?=
 =?us-ascii?Q?1ICuRGvRBIqIJA4Pnn7skIPdcMvYSVxsoRj3iHhN/0wyMsOIYpuhDF3hZzQ+?=
 =?us-ascii?Q?/l13JCuEQhVqLxPvRnUPwCy+N++e4HvvCf/UyZlzPOB45VOh4wHL7W+uWhsl?=
 =?us-ascii?Q?dFH/PFQXF17MrJyhx5yR97t9ysXsSgbgAu6jFGPlT7zkiibT1RJkaocVEnPj?=
 =?us-ascii?Q?XhUNbhaV/xhOG1+plVk8vhkPW8KuCuySe7O01zcHob8w/wTYRK3X4DT+cMbt?=
 =?us-ascii?Q?dBXneLQ4o8DpQ9To1dVR3QYdwj79qK+lJGQSE6o0jaohdoi3Tm9guVHDNVJN?=
 =?us-ascii?Q?LFW5rGsfBnbVI1MLl5OXQ9uiVnYiUHXSSAOG?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:20:27.7922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0df4485-de64-4f11-8c8f-08dd878530f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Return -EINVAL when drm_color_ctm_3x4's size mismatches (Leo Li)

v7:
 - Change %lu to %zu for sizeof() when In drm_warn

v6:
 - fix warnings in dbg prints

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 52 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 16 ++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index cf73c794ac5a..268d4837759e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1211,6 +1211,47 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
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
+		} else {
+			drm_warn(dev, "blob->length (%lu) isn't equal to drm_color_ctm_3x4 (%zu)\n",
+				 blob->length, sizeof(struct drm_color_ctm_3x4));
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1414,6 +1455,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index 1a03f7ee2fbb..39f0b383700b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -75,6 +75,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 3x4 matrix */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
 	/* 1D curve - SHAPER TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
-- 
2.43.0

