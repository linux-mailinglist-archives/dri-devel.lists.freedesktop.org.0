Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DFEC1E473
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9523810E994;
	Thu, 30 Oct 2025 03:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kav4EYSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013031.outbound.protection.outlook.com
 [40.93.201.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B4710E994;
 Thu, 30 Oct 2025 03:51:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNch335R7QxfDUJzoj6lhEE49M3hl5O5TQmsxz7bCGaqkuZuzfq6GIBE3ZvxGcUVfYqf5Z2ImqRw76nVsV6h+tA7DABhRw+2yKiZI3ciBKdv5xv1DurUV9N4WeEu4JJOblRn/aqWvSWmaSTed9FFAYoC5CF6gpQZJvpyQbLoCmwKhqXtvL1xQrCYdBG+E7aI/QnXJBNnsf/cXGOFGEVLpM7BDvlq4SkkwCppayw7Zg2QoHxXMYFJhTLyHJFxLdhZSetJIn4fH7X0CZnuVhGy3ekFBaGGomcqwAYqvpopB21dpwjHnZ8XpLdUR8o/0VecFZ5EthJVX/jOWawWYTiZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOxEGgx2epqkAUsEQ0AaJLpQNPWceN4F3Cocp80aZZ0=;
 b=icDBgjXSz21pzyuyma5wOgkoERR3XHOrOqnJl7zoybDTLuh2/ViFA86O83qy/wDkgmnRFucZP0xGBorA65ykdp8cXpIBAfYmBotumHPomEerNyZ3uUgOL+PD55dhxeMZORJGHVogzr3iFEDkd6jmj1EfjY13JXabsqPmuPkJytTbU6FKlogVoQSXcc4Uk5+UOtY5SmkQsxNgyluN+TLkhB7Tc++Y394peVpEn/LHgEykYd1CValQxy0klWeJ6K9DPtCljjs3wMZMQVhPxtzS9Ew8d6mr0/SHg6qJEhlzWwy627MVnVJ0Voj9MnKf+Iidcq2ek3phINDfhewJWAh2Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOxEGgx2epqkAUsEQ0AaJLpQNPWceN4F3Cocp80aZZ0=;
 b=kav4EYSg5Qr6H0xnDhDtz4Q2oWo+0L3zXN9g2bD3n8JYBNBAcRGeFNcuTbiAUFOZcoMIs3FgGEmgG3UVPIXdWsu4Ehh0mivay9TRPCMUXoBpcdmNJFdtnJdh+cJug805VZDLdM5oKY3rxJa0Ych0a6+fsCeantpBpvvkvpDKvOw=
Received: from BL1PR13CA0184.namprd13.prod.outlook.com (2603:10b6:208:2be::9)
 by BN7PPF48E601ED5.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6ce) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 03:51:44 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::12) by BL1PR13CA0184.outlook.office365.com
 (2603:10b6:208:2be::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:51:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:51:44 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:51:40 -0700
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
Subject: [PATCH V12 28/49] drm/amd/display: Add support for sRGB EOTF in BLND
 block
Date: Wed, 29 Oct 2025 21:42:33 -0600
Message-ID: <20251030034349.2309829-29-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|BN7PPF48E601ED5:EE_
X-MS-Office365-Filtering-Correlation-Id: 268a37bc-702d-4bba-b243-08de1767a4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iO3maPXK1aF+jordRnRPimk5PU0th8kvJ3oxMBjsoEdVaKTX36l3EfNPd+m1?=
 =?us-ascii?Q?gcA3y+DeXp5T1prTZc4hGNj4Ijk7lSkvqM0dGv3gGhf3A5Qbe38G4PI/6tDp?=
 =?us-ascii?Q?9sJO+sEpgsCMUDHclu1ZrOPBM8wjf/0D/XAPxC3e878yWbupIf5vIDcghbiZ?=
 =?us-ascii?Q?x4SVXgkYtEXykU7c0Wd3VdSGuM6pnEk5mhLkL6lhur5ULSH+wt2cn1LmM2WW?=
 =?us-ascii?Q?T7GgxiLPZGoEkOR3r6D14DwaTef7LebuDiZEVDBawnbOZEIuoTIMRbbfLoUY?=
 =?us-ascii?Q?2y1Ro7IqI7dthLtqg0JvBxPirbfzZf2MJRGWgAD444s7it1a5+hyd0qoK/JC?=
 =?us-ascii?Q?fX4VUeG2S+XLUrue1wVztvvjtoKbO1vWrgdlTfFaxiUgb3RToXzseJNrAewN?=
 =?us-ascii?Q?zWwUgwL75UDnijvZ9PW1lsiwET+zmDSHyUja8KiGDR007JvlScJZxbiEjVZn?=
 =?us-ascii?Q?5csCuQtr7ZoaD7XNWKcUEBWc6HO2kOeK2CUQ7hnDCjLHaDWbAXvfQdYDIAvc?=
 =?us-ascii?Q?e6aX3SCUXHOex2CPqKE1B2BvQGaOjOo9KfCVn7yHOYvai/JkpLjjaDht0udQ?=
 =?us-ascii?Q?oEevkuMSPZ7VHe09E/0ZiYCZ1TM+1U6mgtqL4QB7/Z8fpONSuP6rQLoj3wCl?=
 =?us-ascii?Q?Lmo6d6zB6kXLro9ovU99nIipgFCoHWC/zXyUJXwc17BZdrbEWvJUSDeDzxB1?=
 =?us-ascii?Q?xRgHoboNQ4vwSIaJxjAsFvY2XYmWZub79sOJQJ3vnC0WgWGEVbbxYrSJCpgc?=
 =?us-ascii?Q?rhAo4Vj2E1mURmxfx+NB1bEQWD+sPDz9emndVhiPkUSKYRsl2MU3JQH4JG3y?=
 =?us-ascii?Q?hszFQKTmbWsQKcZtVqG19T9aNJTAVcKDnZ98mqtbEz0+oXZN6uw4fwnrDf7E?=
 =?us-ascii?Q?uU953qNl715dNw3d4+z5+7NH99EeMvOEaRsTZUwWZgAv0TN9q11RzoraJKMs?=
 =?us-ascii?Q?Hd4ZCmIMvZ9paBvsplmUf2gxaaH+FzPtTpVMuh9ucxwbwj13b046kxfIFl1I?=
 =?us-ascii?Q?rImj4SZLUb7jbXWYcLL8cBEp+GVqfRbs0MHbgBocR7e2k8AjLDUHQT3UsFoh?=
 =?us-ascii?Q?KKrfnXhYiaBYvM1L/d8DO4Y/ksCsxeox6DoA9NIXD0/88ox8xX9HwqFtmEBF?=
 =?us-ascii?Q?ZZ7RzfnGsky+Vplo6kePe57ycuxksuVwgersPI3MLG15+QiPIZOV4VmOcmDt?=
 =?us-ascii?Q?9XeACA37GCCgunBoKI4Jv+QVmWi7ndIwW0q+5p9kgxgt3r/EcE8D/gFwUvpy?=
 =?us-ascii?Q?Cc7U9HVNPo507DUozbqY43DbHOTlOU4Dv0qXROn/ntj2+ZHmQJHKRa4V7h3G?=
 =?us-ascii?Q?td2vzTfnQdZJwG3zt3l08WTWItv3TVxzetLhuGdWIQwN+GHHknJY7OnFePBl?=
 =?us-ascii?Q?fhUilfYUuckO8bHH5djKXH4/s02n9fH1kd8vlEuxs+9YyttHp1ugFptsic0O?=
 =?us-ascii?Q?BE6pwDviVP50DQRskoqNPf8js9rdYYLo9aQAwpXgGKRrdSd3lfNntOKBxkc5?=
 =?us-ascii?Q?vNcvz5OGuwyyPrb6WhuPrwnl/xXok8ozry6bhMZCWlHq5ofNQ2oIQpgRGcy9?=
 =?us-ascii?Q?YHxtBLBguRUtloCbGyA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:51:44.7684 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 268a37bc-702d-4bba-b243-08de1767a4db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF48E601ED5
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

