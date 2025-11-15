Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A9EC5FB14
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753F210EC7F;
	Sat, 15 Nov 2025 00:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gbApya9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3255110EC94;
 Sat, 15 Nov 2025 00:11:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKnJvs8numGKA3B9LBJIPPoHddjfOB6OIEtynzpNq0pDLHLjXH+vYeqF0WwW6lSFtK813vS3lL1upFhImTHJLeHf9cUmlpKvScKiAkgaQBQJgCF/WEF88rab8l/O1FocSZIcg4gk++MDcyvHi9oRiC+y4l6BdtrEprpfrN+Y72Y8z6VwVkbF9refkBA25I/980FskeB1GZwuRl6W9acR8q6ezPcg9bYpXInREqqMqQhGbSNRfHZeJh1zi5CmtfkfuWn2i+eLNMQQlUJyPa+IBUEud+6ruDR8/wHk3dnPVcrI+aDZn8CcWXtV2bg+ygkuxjHVMchYKbAdOtg4Iu1cCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOxEGgx2epqkAUsEQ0AaJLpQNPWceN4F3Cocp80aZZ0=;
 b=h2G8IC1YPDTtZpJgEj5j347S+uyO/o6Jk0+k67OpuNpDAUeafMuRVraWDDSpPWsMEzQbtROw0ODBhXqggXIO25Sv3DuCuaOM8ifA0gmFJ5/XinqeW0YHWB9E7HlDS397L/RKsPZOHtdDjq2KO8qs2LjvwtCI9WySaw3Js9x1bPubnnNuJZ4Pwm4YpQimbuP7MqqHLmP95cB/omb0NSlXBXuUpied4IQbQrCbZLUKHaFieKSBrp4N2sEZrMUfGxypdVTrGhZsupQ0R7mFA/VL90RdnKOXi8axL8kKWelAkOJJIBpfzEHHCTpQUy44GNzh6gGin5QKJ/ex9LX9IHeV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOxEGgx2epqkAUsEQ0AaJLpQNPWceN4F3Cocp80aZZ0=;
 b=gbApya9oLY0UMLAnRWmEDwdKcXrR/9TnaohxUuVv6rvz+AaiIa8S7HIbsmPVrBmSOrfNAni1H0z11mv3K6AZfFPjnTGWfOAsrRaKV3Appe1cKOba7bZHGGHPRH/LTyaE5QQrmz/Y1twZNTb+fKJhnbT7orKELKGIhV3WDFAG8rg=
Received: from CY5PR15CA0011.namprd15.prod.outlook.com (2603:10b6:930:14::23)
 by DS0PR12MB8294.namprd12.prod.outlook.com (2603:10b6:8:f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:10:57 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:14:cafe::df) by CY5PR15CA0011.outlook.office365.com
 (2603:10b6:930:14::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:10:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:10:57 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:10:53 -0800
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
Subject: [PATCH V13 30/51] drm/amd/display: Add support for sRGB EOTF in BLND
 block
Date: Fri, 14 Nov 2025 17:01:55 -0700
Message-ID: <20251115000237.3561250-31-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|DS0PR12MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: 835c8d0c-dd4d-4031-cd4e-08de23db7375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ApMbquvrD+Sebu4CW9o96NlZqPwFiy8XJbT1VaK23wo/IIBKTqXyzgCRZcjL?=
 =?us-ascii?Q?fV05LaMCLDhHZrcPe7a8UZhnEa5V4AIBnh2kjjhbfAzn18AbLqhpN3rMpTvy?=
 =?us-ascii?Q?QWrRDGJEonFVKyS8J7WrmXoRLF+yYqBJm5e4RlOUPC4NiBsfUP9T84DgIbXx?=
 =?us-ascii?Q?kPkjDtGEf7qHo4Vjgy7g90v5VWf/h606+QA9nmXjj7iFiygMJ7FxyKULzbli?=
 =?us-ascii?Q?TJsYprF9iBBumvoVV6zvDcJVL0NPDNMbXnod2+kDRVo7f32T/FnrC1RJhAkj?=
 =?us-ascii?Q?bDlRUHk7l/0enLBREXTWB9swV+qZcYy1AaTBaCApMTICHT4e1lnZjb1coBwk?=
 =?us-ascii?Q?cGRMwdEqG0W2qQgEPEuIgHQ6aHZtih8xqS5EAvOU/+AzYO4XIoCrVvWVREsl?=
 =?us-ascii?Q?+kS3kdevsnFc1dsO8OxXxH++uVttmGGCFZi/kpYOSYQ/SrVc9TO8hXg3cGKD?=
 =?us-ascii?Q?iRKNvTou/bSgMtt7mMSBnvQK6NpksR/LhIAuzgeQeTw3Mo6spqW+GdqMGufL?=
 =?us-ascii?Q?zCMA2AnT5EM/uB2hd539+pRe+Ib+pVwd39H5lXcSWKfjzcOMWG0RB+FOKp2K?=
 =?us-ascii?Q?KAi4XgfMFgU/xH/HPXvq1rp9euRmTWSuwHwImlQYBR0tT9rCLbIURoRI3qE9?=
 =?us-ascii?Q?xV5z4HBgtbqJS8pwib5ATjnw3/fXR5XcJfqtslAa/OQAL+lv6xgrfli+11w6?=
 =?us-ascii?Q?aOQ0y5RtEQmOa9xc9NGHXa+3kxj7HUceZlMuS20LSEy9P4H2GeGolEwsOCYC?=
 =?us-ascii?Q?UH9qkvOWR9LpRlvUVekIp3tdl+vklLS1Mm8i+5wNt1EmWC4vfKOKqYOUobGe?=
 =?us-ascii?Q?3oVziomIgoEMB9yj8tb0w7UzFPAIxdgHH/66l2IqbW6F5NBsF9e5v6kjVNyI?=
 =?us-ascii?Q?4GlSzYPWmAsqnVkQJu5fBqpdU1U6AmiwzBAO7KLzPtdseXrUihxWPqVeoxhi?=
 =?us-ascii?Q?z3OGbcT4w87qpJI+RSmR/Dwlj7cpl72F+WOveuXA/lUzCNfaoYZyENbVStdy?=
 =?us-ascii?Q?R8664wzOCCYkGewCiogaSivp6QMjKF9Gu6BzKDIMdP2gdCegW3QjqCEek7fn?=
 =?us-ascii?Q?QcrrpGconHsH8QZEIqjcWHrG6fVRFnGjGi+EqTQ/Q4JnwXUtnCRQhTRR9u5v?=
 =?us-ascii?Q?F6H9QW4Dj4WiSGTz1IiWfyas8JvNo44XiBRsqpDBH/9EMbBhtkcJxzjoRbFU?=
 =?us-ascii?Q?/aoZBYJDVWblhMpjT6icETbWe4zpokpRxEKkJMFSTE3pAmv6u/9Rq/QWCBmr?=
 =?us-ascii?Q?1zc+au3LQ5DA6mqz7qya/t3IeczBljhREw+6zN2EnCw0nr0lPl720baaZ1/U?=
 =?us-ascii?Q?b8j66zHYNkqvA0vH26xHFvkXobXzmyArYy6xYQkWm6W2zMir/ArsW4m2kzR0?=
 =?us-ascii?Q?7JrVcWf8ijdA7t7p9wc0UdtuW/RKiSfgssTNrfef4Pd0r5HoZ1NF7f/faHlv?=
 =?us-ascii?Q?V1mGAi8hripPrYz4xDwYAHy6aGEzUClIyBrzHy+n9VY5hq5RkDpHPV5m83Ab?=
 =?us-ascii?Q?JfpOGGCjl8Nu70RNefwlKdXA/MKY3scc9Juqxk6TPIOV41nmR1+cQzY4p7de?=
 =?us-ascii?Q?Dnv+KM/G+baa/kYSYko=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:10:57.4231 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 835c8d0c-dd4d-4031-cd4e-08de23db7375
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8294
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
v12:
 - Initialize the variable 'blend_lut' to NULL (kernel test robot)

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
index 6b199f1179a3..53e1469cb3b9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1304,6 +1304,72 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
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
+	const struct drm_color_lut *blend_lut = NULL;
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
@@ -1381,6 +1447,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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

