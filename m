Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC29F8B91
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A97410EEDE;
	Fri, 20 Dec 2024 04:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jFfxhl5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C1610EEDA;
 Fri, 20 Dec 2024 04:45:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MO9WwDk/JF1p2qrmVCABvpGcO8riwd7Rl8R+GNZkUsKFBXBseWSO8bkXz6CggoeaikywTlF2MH+JTlk2cLCo0u6HhmkyLZuYs2gmP7x8TL7Cpzx/DV5Om83yr0GXsh5tXMrpce0PFj32FXrX3YAm/3EX3z91Vf0govIPqcy4I4v+Sq6+PDk01N6v1uQEYnpgWyW8vHktj/6+LuraTVyrZ1gYmeyifMcPcBUVdKtEWhqchHmRiZVp5k9rUD5do/6tPy001uyJMo6hnWGdBuUC77mEOofXnpz7tbv/JBa4Wf6Ucn+w3MVPysIMcn9ZpSMj2eRLCoxboKVvIMJb7OHoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cq8d+oOWD0gIDdZxqe6mfqa34vB0oF6zp6+Nh6IMxeA=;
 b=mAQmpWm9qVgi/RFHXdEjt374PQkZ2h3MZ8WxR9jg6lPc0PetzxvvcUtb12QphqxqsjTVnf308IznzjMpQVL7GqgYsilbE1AbYqHMqSR9N4lj8MaBieUw9xuMEDWfq8okM+eszFfo1KNBaqhl1c/tAtkKyGh2Uvh5SnPdcpaB+rKprOBXDgSNPJSw8dcAxKjbc2pe/WrVFyeXEV6KAlxfO7+ZipC6lJTYHwWGIwz3FAWogdkDKYzH0ULsBp7/zig0kMk0tejw1rhJ9OkaR/E2w57kZGxmFIwxYUNkmL/094HxGYSdxCYSyv/9huwBhMqrLZZARaH3XT7RqER8Sw8IwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cq8d+oOWD0gIDdZxqe6mfqa34vB0oF6zp6+Nh6IMxeA=;
 b=jFfxhl5ydW41pPKpJ338RjiEgQmd7sOXuBmRy38ZpxNwldEf4dQj8HQcM7Xy8BK5gcKvJC28lxMDbsydBbJ75FHKUYhY18BeKtC7sFezlaxKHZAGdBuslBaWxSVPbiyWkPkcRwBCnb3yAIA9hFDPcK7C1uYcdWVtFf1wp1Ttir8=
Received: from MW4PR04CA0039.namprd04.prod.outlook.com (2603:10b6:303:6a::14)
 by SJ2PR12MB8830.namprd12.prod.outlook.com (2603:10b6:a03:4d0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:45:08 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:303:6a:cafe::89) by MW4PR04CA0039.outlook.office365.com
 (2603:10b6:303:6a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 04:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:45:08 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:45:06 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 35/45] drm/amd/display: add 3x4 matrix colorop
Date: Thu, 19 Dec 2024 21:33:41 -0700
Message-ID: <20241220043410.416867-36-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|SJ2PR12MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: ae0ae626-4291-43e1-de7b-08dd20b114aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qNxhQNLlU4ap3aLIimAhm76UrYX4wKqAQJNi+dydsGIJtuu3GqGxLl+pMz++?=
 =?us-ascii?Q?L09GYRLycGwVUJRL+f86552WW+e2hbUikcb4XfsZg+meWqHTPeL9YNT294bp?=
 =?us-ascii?Q?7QaB2QeLxtG532AFWkdUnbO5uXy2lrzP2Mhe/UHX+8fBzN0TrrXF2gBPIQEK?=
 =?us-ascii?Q?wsBKb1pNwvRMwiHEQFr4rvK4MFZfhQVmSP/2ARnXBrtCa+c8y3pLlZ7RWX8C?=
 =?us-ascii?Q?3I/g8bk6Y68zfd0BPGZ/Ctj8djg9orGR8GphFpkfs9LalHERnJ4IURFsxyUl?=
 =?us-ascii?Q?yKXwVvkJsEubt1bHFY9AZg4z45rVAFxsi7vI/vJVTlstSmTM3TtY6Puv/DAi?=
 =?us-ascii?Q?LXSupLt93T71mvrxJXSO6u+7uTjyNM/o5kZl6bFe1ONlkMVatTEKGizxs+Yu?=
 =?us-ascii?Q?JwomCACzCbFH+fcMOag5b9bKLDR8li5u+2uDWukvJ1E201IrLPVCNQxS24rU?=
 =?us-ascii?Q?3TsRQIUYh2b5dLBVZ4e+ztO3oxCIfjXDMpxhWbMeWVyHpjCKG3j/BOVucOV1?=
 =?us-ascii?Q?vWxIcjEyb7034rg8v1R1EYrTIYgrcRXE8+UQ2GKKby24wnQlJWJDGBr8EFVx?=
 =?us-ascii?Q?MNzr1yQVnmdCdJyP2zrHLXSz9Cq+7u8zugjhQMv4upxEf1c+qGeh+Xex6a47?=
 =?us-ascii?Q?K0YQEpflS9tVA6XT0gPDG5qr+L22vwtI+0Tw5M16NyRoosKfGPtovq8uSZfO?=
 =?us-ascii?Q?DszUl9NH2XUemVeb5zcU+8lZXLRwpMMz3lWH7k1nYjBB5Ncs+Xz3V22lWmKi?=
 =?us-ascii?Q?+HHyb95kR476+DQ7rgt0JjzWAcprklJ8hbq65qsGZ6RT9PfRxPKdgfnq4Rpa?=
 =?us-ascii?Q?dUMeCFhSS4QDgfB6C+NMrQvdJXxfeSTWPv46Zk4ElS1EIMKJTASDkvG60GWW?=
 =?us-ascii?Q?yFEK8uds8VqC6ks7Ti2a9lriodQcs14xRPuYoA6hc4AILdq9iFSizOkE4TMO?=
 =?us-ascii?Q?K0bbwkxlk8dJutvyZ23cr1eZv8u2mG8c9FWMxgP7mHzbcdkkFAs/u2OI6XiN?=
 =?us-ascii?Q?gdBcqKb1GvBOM6DgBlhVS16H+xTWgdeUNzSHfOX6EhF24yFCQZBPRiRx9D4V?=
 =?us-ascii?Q?Ic8wXqiRj7fX69FH6qHEB/dJQeYP8RHb3BZAM91c3qdCmxyWF+ljakA/a8An?=
 =?us-ascii?Q?F76ld0ejJFR+fE0cwwl+z8Jm5E1TTIAuxcnXYN6eOtxE5BGJJ41IsVMqrYj3?=
 =?us-ascii?Q?aedZYq6cTe8ql1OPQ6NUFsHsFPu5Es6MaP3ecBiQH4eCYWLq37N2IyUmeJDU?=
 =?us-ascii?Q?S/BkgOKb0y2e9dtgA9OFruRPRqRNshvpqqrZLQo9p1qZqzz2cIqMVcdfM4Xs?=
 =?us-ascii?Q?gu4UaSjTiIQ+oSW1ukf1gHwjMiL0ZiRuf6l2dSVArBAwicE2mhlKl0Ia+oAe?=
 =?us-ascii?Q?D8pUECrmX8ExsDuxpCWyLTnwpPmn44F24biymZgkN7OWh/Xb8zY2hNDb9cFg?=
 =?us-ascii?Q?o1SoKPUSrw6GbxTxtSIheAgjkFkTWco65+VwYC0L7jBAbrIr75ksn5RUPn8x?=
 =?us-ascii?Q?vaLYAE2Lwlotc94=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:45:08.2958 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0ae626-4291-43e1-de7b-08dd20b114aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8830
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
v7:
 - Change %lu to %zu for sizeof() when In drm_warn

v6:
 - fix warnings in dbg prints

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 50 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 16 ++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 0bea52eede39..5d6effe6f90e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1211,6 +1211,45 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
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
+			drm_warn(dev, "blob->length (%lu) isn't equal to drm_color_ctm_3x4 (%zu)\n",
+				 blob->length, sizeof(struct drm_color_ctm_3x4));
+	}
+
+	return 0;
+}
+
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1409,6 +1448,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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

