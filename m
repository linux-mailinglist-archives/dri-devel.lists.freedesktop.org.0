Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E73A7278C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C792A10E810;
	Wed, 26 Mar 2025 23:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l1e3p0hk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2071.outbound.protection.outlook.com [40.107.102.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E591110E809;
 Wed, 26 Mar 2025 23:56:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQFmpRRtCi9Fvjvj3bTmyxuG5NHzURKGUpPdfo/xM3rJ+bTyvcHcFA7trdVi/LkkVesRGLGR1S4z5d+IUSKrjqMdRfnYuyK0xclKH9IiZTFSFDxEeAbO4JiynfKYp8tLM6MZ7xcmho5QhUYBtv9onF62W9ZOQzrj/PcqdIiBPbD0yuQa8GbcafLIpexdnCzGcqDzUTPGmbGe7leUStzPB8tZv0AIdHjw0XVvrUzDMQBmZpNmWtlPainhKvpS6B2GmHLtLnNAr0KMaNsXRipOhZ+KdZ5riNmV7Csmfx3p3LwNT5vyXgIrWKCulVSWfyJGHSEbzHFx60nKaI9gkdMYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF8mLukwC1ODpqiIuva2sildo2ew4zxVtkisSYjgPo0=;
 b=RM881r/+3zrww4AMRbp8iOtxxFe34PSxMGd7xaMxU8t+ZAjjdiRg5e0LDq0mtlz0uxYpGG5QmLq/DMicFt70gERnpQhGPEXodHK35sRAPLxED2lb4ZivP95vkGlpyf7WzpLDmMjMUzP1KTLVD6rzJlyh65R+mcxLmMedfYXRs+8d2Rv2CXd54W5qjYxE+LQSAKRDtdFnQPVB9kgNe+WdDN5ZQzuygynsy4tpWkGVIhdHptGloxoFBOkFyutdoyxBq7o6wneC1DvgLlM1OO3Qu0vf2bt+2ufqPuCPAILIwZKn89DwAaMiYdxXJko8d1QiY+TRHczlNV86YNmIk0kBig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF8mLukwC1ODpqiIuva2sildo2ew4zxVtkisSYjgPo0=;
 b=l1e3p0hkmTQuQRXyoxeZjHo9Afbh2PwMIF33z0RkZAXs8oF0WvDcqYJU04UyFxhr5lZqEv++vfhKnRun0Jz6ilMKXVy2h7rCHUiImQxs3jCbT6Wx5sfi/ayxOEVrFhecwyJ3sKvOaZaY/6T0u15MQWIDBsvOnOQdvj4cJEnFA+4=
Received: from MW4PR04CA0060.namprd04.prod.outlook.com (2603:10b6:303:6a::35)
 by CH3PR12MB7643.namprd12.prod.outlook.com (2603:10b6:610:152::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:56:37 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:303:6a:cafe::cd) by MW4PR04CA0060.outlook.office365.com
 (2603:10b6:303:6a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:56:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:56:37 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:56:33 -0500
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
Subject: [PATCH V8 34/43] drm/amd/display: add 3x4 matrix colorop
Date: Wed, 26 Mar 2025 17:47:15 -0600
Message-ID: <20250326234748.2982010-35-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|CH3PR12MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a984d3c-bae8-4290-9554-08dd6cc1d878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lV6wUclyNRKTtJb/P4jUjKSbv+LalucxXUHKdoSKHvJ6mJKN7Ya+XhiYukcM?=
 =?us-ascii?Q?Ebwa30rfmxWaZmJ3yJKfh9bcy2u1sZMQpV0YRiCReMqRdj1tEKe6fRLdGugK?=
 =?us-ascii?Q?oHn+c2hATWkM09bts71pjHnmrm47OYr5JW1dK/deLwPCCoT93rc3uXaJ180O?=
 =?us-ascii?Q?S2oO8cUJNY9qD3FNpOwG/n8L51n98t0Ze3v0IRpOtcxOGTIHy8Rk8ZkqGVuV?=
 =?us-ascii?Q?8GINqpp0ugZXE4VEGNFVM+egguyAjh1iF6ZeNzhFgg38YrhHk9BsD+C4Du8q?=
 =?us-ascii?Q?EJggDCTJJZRfS/fA51w7ndu90qSF3iClRBhqKX67YMX/ocE0ZkcfM9LeOkFU?=
 =?us-ascii?Q?OX6r6E0pS52yoUHIBCaZ+4kHxlY2AhBsxGSnVA+/nwN+wQ/8B3ZmIIiBLFih?=
 =?us-ascii?Q?UoAceBQXvZe0PwNdONFk5qaWnDwkzblQONaEAEyDmsenH4MiGOUNFU0dwLU9?=
 =?us-ascii?Q?GjpvTSA3Ty4xv48uL7Ne8zdpgo5DgIuWpLZeJC1ioqJ0Oa8SrdUDt+waCK3f?=
 =?us-ascii?Q?S3YyC257SVVDZQU0n/sQUxbWz7DagxMfGvLyii+8C0xxRFOCuoDkjRrFbmuq?=
 =?us-ascii?Q?g3e0oC8/rqBr4eGsqc45mwxdQShX0TOMvyhiAyZyGFWVQXAyiPgprjbhdhAz?=
 =?us-ascii?Q?ndZNTkmd81FV5AonAkATC8rVXyoxlHucsM6Yo/HhnW+/TkOaPMs+uDLuC9ok?=
 =?us-ascii?Q?Hrxm9ZZNC9tFUE5MLyOcVtoxaxj2rJ4Ag133qg/tiQzCRD0n7Lbb70i+HLB3?=
 =?us-ascii?Q?08uM1V1WZwy3wfJsTKbXmT6C+m1FPjtGwJA6veFweYpCYJLie30ZihRMrwUy?=
 =?us-ascii?Q?sMSRQq7DmzX0cEBt4CyqZ60bW5GAAcbEVl3kuZalJK5mUiHRubLUcK8QK3sr?=
 =?us-ascii?Q?uXDGy4R5oFzXz1C9Q0LOVpTkCvdosYVkErCmfmelTG+R6/ibLJuZjPRHYvdO?=
 =?us-ascii?Q?PG5WSd5rkYGVJRoqCrUFp8W2V47GW3dsdNHJYReJk6UKd8XIGyR2PyWccLx+?=
 =?us-ascii?Q?UgKcPqCyp8RAZAgv5f74aL2qm9obwvmdJZQTQ5pikh86iBl7Lh2p4sDTp+Mw?=
 =?us-ascii?Q?QIOEIg7YFphcdBfw9KN3DCWoSP//jstz9YcYt0JG30Hi7DO0S0IRiIgRTV9q?=
 =?us-ascii?Q?hyyT9BbjfwFpdyTx8fDAVTR/dQvqScPRZI+VMA7mqfGzyBuxsPj3epfUtZsu?=
 =?us-ascii?Q?XeNVeLKCozdi2VXJ5HPVNV5zN6dvG/PqWLkAkeW2xAfcNGWyW1LxlkEHtz4T?=
 =?us-ascii?Q?nvUx1AsbItH7mkZZiDY7YZiMCCW7hhs162U9WH306pFFpJbWx52AVcnULPis?=
 =?us-ascii?Q?nk1jrGvU6WtM9VH5nrG+hBEnHu2I0evvfVaBmzL+reVc/PsWOZ4OUZ7WUw4T?=
 =?us-ascii?Q?ZdluwnjTSOJtRCkxksE6pmNwKX0TMWOZhYXVIAA4CRZv2pHaDa26rVqRMyZf?=
 =?us-ascii?Q?gU65QexcYP2XWEla5dDl8401eHXdfUyEIB9Mt3RuZUG1dHHtQ9T7Jsjs7ZDp?=
 =?us-ascii?Q?tcLJkjtKdkXtysI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:56:37.1497 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a984d3c-bae8-4290-9554-08dd6cc1d878
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7643
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
---
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
index 7e81088804fe..8a9404339da0 100644
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
index 8a5e15083f11..9a9386bf85ec 100644
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
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
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

