Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F02AB27783
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E0010EAE2;
	Fri, 15 Aug 2025 04:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z2pvRuFm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BEA10EAE2;
 Fri, 15 Aug 2025 04:00:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIenuisnj/N6YbqME59k6fTrqD8jAFY7D8yUIp2DzUY0+0XT/QJDNfC36yHeOUMtZuH20wsxzC9lIQw+k9uovJsJANbUyNMUIoLXdNkTc9+EX9/7kIXicSHG/10xgRp3/2Xr/f+RA1dNKmpW4wvTYYXKgI4QOREvwLErZb1wMWY0mNoBbNGl17iV4258KZ3gJYN7zyzm7qEHgOV8lG8idasgImD+1NE9JDZMaD0RXL88Q1yMPWYMqJgjism0c15qocjOzkBggXHSMCKiBIvxHra0gukWxkjumnGtP6zMSrUSnnYl36wq42f0VMSFqYzDzpZEx0lU/VoAVGCjuZ+Mbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQIoOLzrixDsLEMnEZiGt1YHEsPiF/oyxoI6OhTzkQk=;
 b=x8lVh5Ig368FBKwmGA62PDGhJ1S0cs77xwgZ+sjogWl7RMkwUYDOJ9R4xeQbE24Eo4M4FlV4zBRWWi6+HcY99QAAf1hyX7ZJWaaiK+c1pkln2F6YKWM5irstpN12xpOnaPCmC7t/nIIRLPjvBHvzeJtbPNpRBBrnJrBFdQ6IiNZylLa76p7fM7PfDn8oiBUdIbcjlW9xvPsJunhheNBoBe3WEU4WHrGcAQD7eIevA1OqaNORQCwJkQXjMnM6CWv1s8R6vpb6iC2kpDLd5CITgRAPRrOvzrxM6Us+FtNWlH0behFcQrDWEMM4azE88xO1Pu3dz31ajWHW6U1WUNL2Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQIoOLzrixDsLEMnEZiGt1YHEsPiF/oyxoI6OhTzkQk=;
 b=z2pvRuFmzpiJe7D/B9F5th0w6zDBH4WQ+0jH3PXJ7pA5F7FbnyDfEEBShgJRjjUKxE4NHfBq70qO2G0dMuyiAjfJmDavcmLLYG8yiQsqIjJ9BHRGEj6/lbKhandbsvXmWqw1820LNEBHBG/ju8n3A6NKCSkE0Zq/UKu97N5r0Dg=
Received: from BL1P221CA0034.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::18)
 by LV8PR12MB9405.namprd12.prod.outlook.com (2603:10b6:408:1fa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 04:00:33 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::d0) by BL1P221CA0034.outlook.office365.com
 (2603:10b6:208:5b5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 04:00:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:00:33 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:00:29 -0500
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
Subject: [PATCH V11 37/47] drm/amd/display: add 3x4 matrix colorop
Date: Thu, 14 Aug 2025 21:50:26 -0600
Message-ID: <20250815035047.3319284-38-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|LV8PR12MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 50dbaaea-604f-4990-30ed-08dddbb04889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?09D2sDsTVHZ/+lX37dKcQo4PKY0sVq4urPoEeXetjL5r/QMT3vWQr9RkzVMr?=
 =?us-ascii?Q?0h3+3Qjrbh9glhnEIcz8Ime6ybFaVhZbkayTl3WHGXn5NAyZP5uSG2Yrj6rG?=
 =?us-ascii?Q?sBZd46A7qtY+krv2ei+xvVhpldaGaV1LeCVOjs1Qz86w1fyKo5AzID/MCLZ1?=
 =?us-ascii?Q?xnh7t2XPDi59Ptal5hIDPOgMlI91RzH2I4M/b4JjOLMrHRZFY/4cYrpHp2YP?=
 =?us-ascii?Q?ttF9JxAPTq9Nuk+Vnn/CwbyBKFKOePbhY6491LW2AhMsOwTB3nATwuJxxkfH?=
 =?us-ascii?Q?Qzxob75gW8DXEsL+jkBXPnlu1/IwjHyS8jCksmCwEMYE8Mbv13M6z1C2xM/j?=
 =?us-ascii?Q?rRXtAxeqax9BpRS+pnDlK15wDFokG+Ajxt+INBvd+2UhJOK4/w8XEAg7JfED?=
 =?us-ascii?Q?7dy+15yEkzpvoeKwBde0RqZvVVjEMj8VP49Vr0ENEYTzXDV97kIio9+OkZYS?=
 =?us-ascii?Q?k8QmB+yMYf/LCE7ZQwFb40Zl/3Q2qbGpzRnXMpSftWMyVHKUym5gkrfFt8ig?=
 =?us-ascii?Q?/ke/yatNJh3aHrKFMgaAr32X859fLHSIlnP473EnzkR8eghRR+bXTr1pAPZU?=
 =?us-ascii?Q?9pLUVkpCvjE/yv7vDjM9C2xrr75lfO6i8iSmfBX0PWhDMIistljaotCdped9?=
 =?us-ascii?Q?qE+pOQQ1YgN6HXfc9eLN5QkK456ynIFlqWFPzQKtqKF2XaDYaePJI35sg+nj?=
 =?us-ascii?Q?iltNCQ9nFPRF/7fayyd9yr59UBM3RVm3xcrdqOICCw/Xb0KbF2bFeM1hhq2x?=
 =?us-ascii?Q?/EBMreiOROnwGgS1ZjOGQP1/7TFO7EWs/Iql0juMuD0y8bZxNZlEL4vAeyxa?=
 =?us-ascii?Q?7QNMgzS/73KZEfItNZYXJTt1FnmM0wZ2K9bNkyZhtaWcMUST9+oIipwq7ET5?=
 =?us-ascii?Q?5vdS0j0/1iURiKz8XkGqO3VNzvzpcLDOkAMG7h6drpJWZ04ww8p0KXOHLBIp?=
 =?us-ascii?Q?oy7QGSfEtbFMVjs7jfNhlPK+XWNFu2/TlJeLXARjaDG/dWO2UN4Lv+aMC7tk?=
 =?us-ascii?Q?ZRzVoVIOFY3ayWYq+S1nHXTLZwIUcHXC+jLEhn3A/xh+OxeIAwwQF+3LQjtA?=
 =?us-ascii?Q?11LWjG20takHwqKvx8DoBmBF9IEn7wKTV/Ux3IOF59NAbiyQG0JT3lpYzUDy?=
 =?us-ascii?Q?KtWvmiIYiwH71gRjobtvgqeGwIkEPUUx08O6lMaup0s2Xz8b+v5/Qn92S1co?=
 =?us-ascii?Q?nxmWGrhY2MeW9w4aiPJhapGewGAFblO9ixVwVY1d8xJZVhMmo5SziQkdUkCI?=
 =?us-ascii?Q?4ETGRX5Gcty+orfMNSqpkLbXmVh+RvobCHusVLh/VSaH6j8C0+ZNvf6P7SiA?=
 =?us-ascii?Q?YSb/UvbypwZsaZQLrg3COd9vBfgWYTu+f/KmIbPKloTs31SuqurgBJxz6bT1?=
 =?us-ascii?Q?PD2vi4TWh34eiPxe/75c88p0Us5kvQiKqFlOiCfGtL/uzHnfkTfFeGek8a3k?=
 =?us-ascii?Q?csYrdrT/dkkdIoxauL8aUlUAqcXcyOd7dYYV56xuG6VgifzTdEiiBBQCtZaA?=
 =?us-ascii?Q?m9Ol1Ltzhf3TxYyJmH6MH/SPGQc0+O741XmY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:00:33.3727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50dbaaea-604f-4990-30ed-08dddbb04889
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9405
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
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
V10: 
 - Change %lu to %zu for sizeof() in drm_warn (kernel test robot)
 - Remove redundant DRM_ERROR(...)

V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Return -EINVAL when drm_color_ctm_3x4's size mismatches (Leo Li)

v7:
 - Change %lu to %zu for sizeof() in drm_warn

v6:
 - fix warnings in dbg prints

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 52 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 15 ++++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 6868e36e7372..ec640ad33f85 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1338,6 +1338,47 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
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
+			drm_warn(dev, "blob->length (%zu) isn't equal to drm_color_ctm_3x4 (%zu)\n",
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
@@ -1541,6 +1582,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index 4845f26e4a8a..f2be75b9b073 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -74,6 +74,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 3x4 matrix */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
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

