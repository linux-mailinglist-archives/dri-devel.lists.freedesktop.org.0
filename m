Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1546C1E4AF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C6310EA0D;
	Thu, 30 Oct 2025 03:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mObtHCYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013060.outbound.protection.outlook.com
 [40.107.201.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759A310EA06;
 Thu, 30 Oct 2025 03:54:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeMf38OSDLP7Nn2XIR4hKspMndL+ZPpZnoA31gJx02QX+Jb3rJuQ8FPZaGMxIn/2+2w5RPBBasWNDd/LH/mrvDrjhCpRom6WZZeUUPTGMM7dv8JnkQWgqq+GS5uoE3hq4ZMxPl9AolLg4FjB7GqQD/RWR/0d83AUCZbPwEBAJeNSk8kMa7DsXL0YGMENADcx82TqoDNadx1Aqt4g4prxx5xjJXC5Cbmhoig9cvaYFJ+9zFQFiNL20h4PHu/3u36oLXYVi3RH0TIbdcNt8Ru5XQcaOKNCqsHc/z5hCwyw+lhfwNZ/mX5MHBwsbqr+mmdqzh4+u/63gPb+M6KJyhLWrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P036KmSIMYAhorx7Xcarm+gA7H/cmc4E8+TrYXeLTQQ=;
 b=c7p7pkCxe1ucP3IvjcSChsYDNWBwbmQjUIGjVpH7+J3CsgK6iHXHUYoCOx9iQqHquiFRWJjUEEggk61RKKFsZQhPi83vwUfZ6PD3DoqiHVmJDDkjm1PaO5uYv5mLkLyOJCUALkdyK+RCBdJyCdrpgrXnntjAjqvRPrk1FJgMrHzEGZU0ZyM4JnCurqcfeqTIhrMflAJ9ZTsKCUEtNtwLktWs9lp4YHKn9wXhuSKlX/fVv3Egq/dq96gyeAYPfo4T7sZfVq4ChB8/QvHG1eMGpybX1kKlT8fM/H+OOfElLTbnzhgZELHZ8VP7YpDwdqQlmURtHXXnZ6T6jrtxv4mI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P036KmSIMYAhorx7Xcarm+gA7H/cmc4E8+TrYXeLTQQ=;
 b=mObtHCYR9msrs9UAcfS1i8c9kqWL2rGdIQxFzZEPh0p+kYj2BKsCg1wxHSdxlgUEhogSwCAgDJi8jPZbPOKUIWYUjx15opduY+k6G+IVXBkTIQkWTyopyq6zk+kdpXVURZCQE27cHUP8pdbkVVNyc+o4pNg9+Bp7DVBE4fZC9tc=
Received: from BLAPR03CA0065.namprd03.prod.outlook.com (2603:10b6:208:329::10)
 by SJ2PR12MB9113.namprd12.prod.outlook.com (2603:10b6:a03:560::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 03:53:59 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::17) by BLAPR03CA0065.outlook.office365.com
 (2603:10b6:208:329::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Thu,
 30 Oct 2025 03:53:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:53:59 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:53:55 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 37/49] drm/amd/display: add 3x4 matrix colorop
Date: Wed, 29 Oct 2025 21:42:42 -0600
Message-ID: <20251030034349.2309829-38-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|SJ2PR12MB9113:EE_
X-MS-Office365-Filtering-Correlation-Id: d3804ef0-f8e0-45f0-4bca-08de1767f4e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?erXx3tZsVhcf/3djq1cuAfcbZ+kcss6J7nFQhXY7UiJrbg+9BoqDbfUw2nZ7?=
 =?us-ascii?Q?yg+TqL0vCveUsNtmsUhJfkDSZ5Fff+al0E8Ui+oFbEzzyOe3KkZ81BWpXnDh?=
 =?us-ascii?Q?FB1SwxGZ1HlZCLdnvAfIy/qY5mye/Ykzf6wjm4yZw0T4/erswni+CjruA7p4?=
 =?us-ascii?Q?BxboM9EmIdGyoPcthH1S+wlnlFUYZQV82V8/LeHQ6bDgBfZOEfwEaN5c/pX+?=
 =?us-ascii?Q?rZ1CHY3DLIsn+kzLZTWcIC7i+r4+nf4xyLbY61Zj5Vx/uTdw1nvTB812r8ev?=
 =?us-ascii?Q?zAAoZlzD5PqD4KQAOHh6Mq/0Yip4GoqoJEbhPearVIPt4dHl+P0dXFWe2Qpc?=
 =?us-ascii?Q?gFR/13N767Re7dLubwQyr7n+bkMMmdciRSxGpTU+rFMAMEZmeVpBa5cX/BAO?=
 =?us-ascii?Q?uMArMWiGl/O96eqt1PFz/7qJPp7nIKIDVoVwI59Yc7T09ABbfKdqmjySwxBl?=
 =?us-ascii?Q?XyuSP2y3hf6vEKRbLDANEMgTo3VP9p17XuzZ/NQZ9ZsCDbfTMzPR0wCWCKJO?=
 =?us-ascii?Q?/PxBbtBXyewSxzLqiJD/Uf76A6RKNR3eE6bR9XKhjAHrOIMUqXEGFbJnpvBa?=
 =?us-ascii?Q?uYWff1MSL3mcdO8zxQ9RSH5LaDEB5Wz+1Co9rG3EiKhTtHfePWMSS/3emLtj?=
 =?us-ascii?Q?GykHGNZu6YU/Scn/LxAD8Xx2SepHvy5EFicY47M4QlQlKZIcVLD2HQ+XE0hY?=
 =?us-ascii?Q?+kwn9+V6kFhDcg8HZnu8Cg0qo/LYjQt9oMi7ORxIo7HZlZKUsev4RggiRvzR?=
 =?us-ascii?Q?gcenuHP1IlsEsx9dnu9ZTOCM2RJTcW+W6dmMFHB0KbtOYvcQnPmDf5hrHk17?=
 =?us-ascii?Q?1ZjLp8hknbhjKscl4JtFDsg9eEQ1E1rWiRveIGdWjB3R0o6CGDpqazTNnN3a?=
 =?us-ascii?Q?6rDoXpwJry6vSbUYl/qTLwSlPug4RNL/eKKLfWQHsUgcrm2kKEbb0pis9vQ1?=
 =?us-ascii?Q?lqDG3Wj14ve3SiKMfIX2fx8V87B3ryJddWIc+QDAp0v6K2IXCaQeL+oRL81F?=
 =?us-ascii?Q?I7jWIE4i/5hPNLpNB3RQIBIohy3ZVPSEBy673FqhMc86fYIBTHto0e0bCrBH?=
 =?us-ascii?Q?n31+atQK+CwaV+Jy40wnCeSSTw8O1NWkCIOM5V74cMVOpg7zkYuEe6LOGcxT?=
 =?us-ascii?Q?vCAK1niOss7ltt1eUf4s1/aE3MgA3j+ExEFpU4CFfS4limuwzs+gVBGqkaEc?=
 =?us-ascii?Q?5TfIxmbW4AJS5CNlXNNLMm2RsagTiehiv5g1w3fwjVKBCYAB/ailrqlN+rkx?=
 =?us-ascii?Q?0GX+iuJLastXszttUOh/1YXjY4KC5h3YW/q6pNG1ABd7c6sytItHCfsukhCq?=
 =?us-ascii?Q?43BuX7Xqa25MHQkx2FNDTyFKeaBey2oodfLR4COz2NelNkfKvRvP4dIusjLC?=
 =?us-ascii?Q?Eb9WwSUp+VJ1jUPq+AY4WdU7b13MZRTj319SX1YS6I9FjS5XmpjyNn8yl7zz?=
 =?us-ascii?Q?IkrNjU1uBXOlpiHC1HNaVSou95c+JILbzF5hk8T6h16b7o9Sn7Zt6CLIcElD?=
 =?us-ascii?Q?p7uPu2QDwd6L+a77+Kh3gqonLyGwEStx6VujJgydBVcPkr+0WFSmpVpqHsci?=
 =?us-ascii?Q?vw3TDWvHtOm5Z2MmCj4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:53:59.0552 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3804ef0-f8e0-45f0-4bca-08de1767f4e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9113
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
index 8fb56c844293..3e30e7fae0c3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1378,6 +1378,47 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
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
@@ -1581,6 +1622,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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

