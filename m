Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19360C1E46A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5282E10E98D;
	Thu, 30 Oct 2025 03:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vWUCN9f+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7CC10E95D;
 Thu, 30 Oct 2025 03:51:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUvwAYDWMicNOtr+35OXTxZaR+E6goD6Pu7EeXLT6XBILqtyo04OZPRqM3QI0t69DP7hhvQtedh2FRRBg1nTWh4CFGOVc44L9lduA4fngaKBxwMlVyncgL00UKm3sxGkHWoENmahve+GqkJuNm12VBIXDk1UTS5cSgYZjFLHSyQk80lI1qiFWB9GYi1GmoG5zs6RkJzobgLi0iTqqVOAAf02u2hSWwdjP5Le9BGsRL0ZwXMRe+GhZQPk3dc19NJs1Fi858wyX6JGYspeQq1sKpAjUN97NiYzkXRecIphRbRVmPVC64ExIP6LZ4ogSCddCmhVeevRjYedm8khMhxcCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EydD+mrNMKpVPcQeSxp/8VAs33ZKoeoXYf1OFQYbMA=;
 b=Tn04i0pX3T1EsgDZC7NGchc5OH+vqsgIYD+pi+q1h9ySVgID9fe7tMtCc4P2PDYasRY0G2OK7vuxmfJ3DP+T2xWJVz8QVMEPVIJ9rpaOdNUVEzjC5tH9LC16sOa65eNP9H9zY5iRLOlDoxr+n3NAcJApLQuIPPGdlr2KZqP+Y+0lva77oHerGBPbsRnRSnllhvo6BNUp/B8LC8U0BaFi7aSVjs2H3pywwqwPRZBau++yKmKJD+9ce6k+9um2PJLP7AJgbJaOM33z/BE5NL5haLlk3ZAxZY5rn2XQ0FlPFBst1cgPWlauJUtDWPRzYl35GSH3NhyPlMZyMwurRy5mrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EydD+mrNMKpVPcQeSxp/8VAs33ZKoeoXYf1OFQYbMA=;
 b=vWUCN9f+PO8ZgxAA7+P53XUsotI/IcuxnJKcXnzW6mENkoSWrEyliznoE72J44qH8db/Yvfi38QUX+tG+J1yobK0hlZfewOBs7Te/qfg5SZNTW0rzgo9WfliQz7lxNvZe5Q2sHmV8tH70Q+s6ZMiad1IrlhoI1uzefVTM/kj6pI=
Received: from MN2PR06CA0010.namprd06.prod.outlook.com (2603:10b6:208:23d::15)
 by CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 03:51:30 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::9d) by MN2PR06CA0010.outlook.office365.com
 (2603:10b6:208:23d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:51:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:51:29 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:51:26 -0700
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
Subject: [PATCH V12 27/49] drm/amd/display: Add support for sRGB Inverse EOTF
 in SHAPER block
Date: Wed, 29 Oct 2025 21:42:32 -0600
Message-ID: <20251030034349.2309829-28-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|CH2PR12MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: e9576e98-76b3-446e-f351-08de17679bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Gwx3qRtXuIOSowFJc/D5sjsx1Sh2G1MJ0i29n8OUx4zHKXsA1PmwefIvrtfA?=
 =?us-ascii?Q?Y/rhWxiv4jOF4fhGLv2D9jj5ip2C30AqnYUP6zwTUGbH177OsDhKJ5nNGlic?=
 =?us-ascii?Q?PV9EDZu2deQnnCjeiYg2p2nVGhSVSEwr9zsBV4aRKIYSCZJUGDF1MHWHbFlU?=
 =?us-ascii?Q?cL2i+SgQi+PpOBbGykoRaY/19bawy9vrn0I1KyHifPkher/biiJ8IgKp2TVf?=
 =?us-ascii?Q?bGNpkrdyzA4Upzs7ail0cnla//nt9UvK+NoYSHvbOUHMyGw7V+mr1Koia931?=
 =?us-ascii?Q?kZoZ/BuASbQwMkvdUxh9krNyzqd3UBJFb5JBTGd4KIxlQW0sX6veEPJ7ZtuA?=
 =?us-ascii?Q?5TmSjsdjV6lFyR7B/6PpQ2/aCubafde9nuekhPiO0QIiTQKZWdhSxx5FF1v8?=
 =?us-ascii?Q?CqYxoWDwQH/FM/g+6gGxG6INsEeuUi25PVhr5wFTzIw8fpkSf+RxHtwpEJUI?=
 =?us-ascii?Q?ZR42x+a2U9Ik1au7Qd+FAd6EBLqBtBYpCi+RM/fZwOo0HeiIUEpXTh7hkH8A?=
 =?us-ascii?Q?k2T6080SR7XDwUbLGshHiFcnFr9vvI3MsQivco6ALtpQU3tIierowpDgUFMU?=
 =?us-ascii?Q?tAHVpQhfqODah40xA9QIiEGzkyhmYopOPE4YatenWIdB+ENkv7o5F5uGJipA?=
 =?us-ascii?Q?elRgHuGQvISLZN9MLXOCS4Fru++9SLreuJCT/HtMaeIh2RyMdl6ezbE2iJDz?=
 =?us-ascii?Q?Sf6+61tAALLyuiO0gq4Tp1w2kQfN/aTFXKB3bUxc2zHxNldf0gJAYefbyh2O?=
 =?us-ascii?Q?boTAq8tZL9R3X3griH7iHFoKxsx3IC4W6wkPCcF3zV4Oz66H7h55jDmZie93?=
 =?us-ascii?Q?g6Rvzt8d8Cto7s+S8x8YiDYZsgp603CI80DPidAjIGVo7O6etZCy22KQFvmu?=
 =?us-ascii?Q?ZNoqpLH8VZCLzKYQ3bFTBhaCEkhXkC9SVz1w7gPSaKulHOsPGDJZsdLJTXyv?=
 =?us-ascii?Q?FDR1Tw3Be2Y837hHjKHeqLCEcBFZtGKEM/B3rc1tEFCRd+an8B0JXhN6mok3?=
 =?us-ascii?Q?2zSZNBPYVAejFK138LWVHw1zWs2tUZrQbpIUJ66G3Vqn6KW+LsYIodaZuzAS?=
 =?us-ascii?Q?csaxvvT5wdUuTBdaa7cxHASIZEpZrtzJSDwB5rmrL+M1qX5VPUY3oyDNpFA3?=
 =?us-ascii?Q?jC4iuVbC8blYMA1/OC16gyd/5v4F/n07WjJMYsosmKEERccPe1I1GTC3+DLh?=
 =?us-ascii?Q?wAy+VDqrNarbPy8sePLf/L9qbnTjKpFEsh3E68Ey9uLbNXNCBRJyrHnATMQL?=
 =?us-ascii?Q?ySddleXSivujBULGZQbUhbaW3INXL+CVjRp/0LftQu2kwWhY5pdiyOGjYrRE?=
 =?us-ascii?Q?WRIdtgQaAooY9a3ZKhgpt4UHQJHw6twM9Cn3+5lgCMb1YdcUKFXfu9JJFm23?=
 =?us-ascii?Q?PZMov5Jk1fQoB09npKyKlJmobyvVcpZRt1nn40+h1SdR7XDB1f1smi8xaXkM?=
 =?us-ascii?Q?OgGEgYMRXLKZ98mXUJX+izRIkZEmdv9AtiXtgp8zr4yQAwH29JUiBv/5EZBX?=
 =?us-ascii?Q?AHLrxOG7cDzLpDsad+aatfDGfjaTzgvRqUhc2GG3mOUNiauxPNibd+8I/Hk9?=
 =?us-ascii?Q?MRkyjHHixWe5GHTZ1+Q=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:51:29.8414 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9576e98-76b3-446e-f351-08de17679bf5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150
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

Expose a 2nd curve colorop with support for
DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF and program HW to
perform the sRGB Inverse EOTF on the shaper block
when the colorop is not in bypass.

With this change the follow IGT tests pass:
kms_colorop --run plane-XR30-XR30-srgb_inv_eotf
kms_colorop --run plane-XR30-XR30-srgb_eotf-srgb_inv_eotf

The color pipeline now consists of the following colorops:
1. 1D curve colorop w/ sRGB EOTF support
2. 1D curve colorop w/ sRGB Inverse EOTF support

Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v10:
 - Remove redundant DRM_ERROR (checkpatch)

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v6:
 - don't pass uninitialized variable into __set_output_tf

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 74 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  1 +
 3 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 23acc035b62d..6b199f1179a3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1242,6 +1242,68 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }
 
+static int
+__set_colorop_in_shaper_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)
+{
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
+
+	if (colorop->type != DRM_COLOROP_1D_CURVE &&
+	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		tf->type = TF_TYPE_BYPASS;
+		tf->tf = TRANSFER_FUNCTION_LINEAR;
+		return 0;
+	}
+
+	drm_dbg(drm, "Shaper colorop with ID: %d\n", colorop->base.id);
+
+	if (colorop->type == DRM_COLOROP_1D_CURVE) {
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		return __set_output_tf(tf, 0, 0, false);
+	}
+
+	return -EINVAL;
+}
+
+static int
+__set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
+			      struct dc_plane_state *dc_plane_state,
+			      struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	int i = 0;
+
+	old_colorop = colorop;
+
+	/* 2nd op: 1d curve - shaper */
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) {
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
+	return __set_colorop_in_shaper_1d_curve(dc_plane_state, colorop_state);
+}
+
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 				     struct dc_plane_state *dc_plane_state)
@@ -1297,6 +1359,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 		       struct dc_plane_state *dc_plane_state)
 {
 	struct drm_colorop *colorop = plane_state->color_pipeline;
+	struct drm_device *dev = plane_state->plane->dev;
 	int ret;
 
 	/* 1D Curve - DEGAM TF */
@@ -1307,6 +1370,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* 1D Curve - SHAPER TF */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Shaper TF colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index a61250f7fdd4..ea6078592f4b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -34,6 +34,9 @@
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
 
+const u64 amdgpu_dm_supported_shaper_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
+
 #define MAX_COLOR_PIPELINE_OPS 10
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
@@ -59,6 +62,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 	list->type = ops[i]->base.id;
 	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
 
+	i++;
+
+	/* 1D curve - SHAPER TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_shaper_tfs);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
 	return 0;
 
 cleanup:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
index 3324e2a66079..71cd27994528 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -28,6 +28,7 @@
 #define __AMDGPU_DM_COLOROP_H__
 
 extern const u64 amdgpu_dm_supported_degam_tfs;
+extern const u64 amdgpu_dm_supported_shaper_tfs;
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
-- 
2.43.0

