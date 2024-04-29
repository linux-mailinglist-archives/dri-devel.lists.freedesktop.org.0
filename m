Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079FD8B62D1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B1F11219C;
	Mon, 29 Apr 2024 19:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vM4RdfYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16D311219C;
 Mon, 29 Apr 2024 19:48:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xh0PxD3rE7UF7LO4z5+qzTk+5mejbcDuRfB7GjFohfPfAMfEJxu5xNKpBA2Dmern1UqwaC98V9le+qP6V9yRPX+vzfDEmSDtSRNhP16suZXowAUlDRKudL/WxsfmlaceXk8rmEDwjBR3MvpypeiGqaBHTI5BKPOVXMKEvwpRJg6jNya29KCQpZ2N1p4dWlMBy4IuJHOdfrVsngEYKgmgkcTQVzlOG29moiLpr+VvbpFtdIq3gHGR/4/EQBn7PohmdQpJDYb7L++XFrTusPuPkJ+t9tYx25I+BKABy+KKCHaGmuEq5tGDLRl+Du48R4CCkyKjJtUpZzD5AYPsf7cmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mspcowMmD7wnB6yK8xr3QpoS55uCutUSurvUP+ZnMvo=;
 b=AMZybg+nDMmUQDfV1r9gF5EHRJsUF/K+qqRETP1yR5cNPKsQ4WN5N96CS3AX2T1u9P7ocLx2E3EPLVJKaP7NHpg3TIIGnZ6ctaFcEbdiuQ5/3XZR3AiP7g0dUKUX/bdtYmYFg4WLcgG7/+h1Sge7biqSuWsjMCkx4P8bWOl5rLhcJOqggFbpax3H56hTvw1v528T3Xk4hthbTNUSnKjkBl4Ioue6rLyOLoBZtJG2KPPVzKN85IGqU+Acvps3HMUOVBY616Nx1lnwHS+KSHkHkYb1VEHr+WXqmyWUS2oqhAjFpAKbRZv1JrPdkmXSxPlgrWOWPE17p0n6mtiWmxRj7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mspcowMmD7wnB6yK8xr3QpoS55uCutUSurvUP+ZnMvo=;
 b=vM4RdfYHez7PKlSHayZ03zyR5sH1y+Bf9HyIIh0N06cFyCGiX46OBPoaGq8Kx5gcJ19OUu0OYISdQIlglHshJRVSFeYi3Ep+fM3TFcvbirvMyjwxsIILeH8TFbP2DnMH62uSHY11ZP+8T2WkagBSFSkjpmxAN537AJKNecT72tA=
Received: from BLAPR05CA0011.namprd05.prod.outlook.com (2603:10b6:208:36e::26)
 by SJ2PR12MB7919.namprd12.prod.outlook.com (2603:10b6:a03:4cc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Mon, 29 Apr
 2024 19:48:31 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:36e:cafe::ac) by BLAPR05CA0011.outlook.office365.com
 (2603:10b6:208:36e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.22 via Frontend
 Transport; Mon, 29 Apr 2024 19:48:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.0 via Frontend Transport; Mon, 29 Apr 2024 19:48:31 +0000
Received: from thonkpad.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 29 Apr
 2024 14:48:30 -0500
From: <sunpeng.li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: Joshua Ashton <joshua@froggi.es>, =?UTF-8?q?Michel=20D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader
 <robert.mader@posteo.de>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 "Sean Paul" <sean@poorly.run>, Simon Ser <contact@emersion.fr>, Shashank
 Sharma <shashank.sharma@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 "Sebastian Wick" <sebastian.wick@redhat.com>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH v2 2/2] drm/amd/display: Move PRIMARY plane zpos higher
Date: Mon, 29 Apr 2024 15:48:05 -0400
Message-ID: <20240429194805.141626-2-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429194805.141626-1-sunpeng.li@amd.com>
References: <20240429194805.141626-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|SJ2PR12MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 0841f8b5-7e09-4ee1-daa0-08dc68855919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400014|376005|1800799015|7416005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GBY5Tbr1fN1S/Wq99wkosrmxD8CGG4uLLXaAUg0406nN8b5liO3nYY/KiWHm?=
 =?us-ascii?Q?EpJ2V7UsKXnTBRKC58W57TjU6a25wifSNu0RIah3yGxdkUhFSqYTvLQebnyJ?=
 =?us-ascii?Q?IhWUEkd/ujpw7cfIIMq8ZSqKzdI0pTj6I5kkonDmEVfKxPYttbBj90MUx8oJ?=
 =?us-ascii?Q?uaQAUH8do8khvG90DahDN/51YmXW5QZRhD3QFYPUYV2eQia9r1Dm6pUUlE5+?=
 =?us-ascii?Q?C+qurjL4dKiMcvASyCaNbYKIG9YWxzP8A4bjKI2ILhHf8PIJR97vtSSty4/d?=
 =?us-ascii?Q?jXwC6fbN3v8z98jYXi9W1BqvmstLRdnze945QTpnGe9gZdUSe/Xx3/nPirxW?=
 =?us-ascii?Q?YiuZ+C01XgYFLgtIXbru7L4sqetHIfXd3Q8fZVdwBxXFtgKrF2LSYa0eu7RH?=
 =?us-ascii?Q?Xmdp2JaQC7sTahl1RUVFtwcZyxtF4iqICbX07zDNYrdhhHDc2ylQDa/J5SDI?=
 =?us-ascii?Q?g+5x6BdrsJ/0TCVYAYqJNFPQ3qW/1ld5Nr5ajErTGGQ6x5/NlegbiLx5WUYr?=
 =?us-ascii?Q?SV68k84gVsMY8j3fvXY/tOwBZyx/2si3iwDDe9DDlxSx7i1dN1RcXl4k9cxc?=
 =?us-ascii?Q?4cCMdQTZ2HKbpU8UNOT1ZhwpucviBBAk3Z2M9dh+bzBGK23Jj88PHgOoXBT/?=
 =?us-ascii?Q?1jyBJIwvqOXvrgmSJgmZE+eeIIDd8K+f3isPyt5nyuUQhEQMJoyI0d6JlnbM?=
 =?us-ascii?Q?SBEXfoLBduAZ1b988yp9K4Uo1qFKpY5WDMqa/TfYBa5yP6rU2JRijcTFY6Au?=
 =?us-ascii?Q?hCQPmDCsYQVpu36ECbjPvNHbNvOwD2inUhPwZZAeLlxTA8RSRLPJkc7QbwC3?=
 =?us-ascii?Q?DCT+g5MabZ7183sV9BA80mxntjMM0A1L3wDfhapmPpnvx991BQM11bPYfmMg?=
 =?us-ascii?Q?09ByyjBq4YD8Rs8fwNBIqpvGIu+x5H5ZVyBVCq9xdCvI26CSNf/MnngGo8TW?=
 =?us-ascii?Q?yOkNF2xExosakQVJIKRjIfLFkz2jkzrn3syQo42F0WJfSYYrXHNFqu5ModFc?=
 =?us-ascii?Q?XBjv28zxurV5F20raDvjFkCqoFjLyzU7rFCTw9Xj9jwnz2yAc6yXzl3h+JSp?=
 =?us-ascii?Q?mav6kN8Q5pyp7HYX8gQcv2/4azsbWDTsQG2ShvEt9hkERhT2lfYTLBM7aiXr?=
 =?us-ascii?Q?P4oDwtpW2ArOg22EKfT7iUur1MxNSkjuYNNZmsyha6GL5PwOTAmR7ctPHpV/?=
 =?us-ascii?Q?qaBANP7hm9SYzG76c4D5uRsDzOJNluYrTU4YRbROP5M1pdTxpVoHvBs/m9Zz?=
 =?us-ascii?Q?vXUno51RYBDzFiRx1Bp+JpDg7sQgBLzjv9Xv5CR+DfsJDO9R0Uiy6KsqDRUp?=
 =?us-ascii?Q?qMJozFJk4y4AIwKuyyYENHkz?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(1800799015)(7416005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 19:48:31.4103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0841f8b5-7e09-4ee1-daa0-08dc68855919
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7919
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

From: Leo Li <sunpeng.li@amd.com>

[Why]

Compositors have different ways of assigning surfaces to DRM planes for
render offloading. It may decide between various strategies: overlay,
underlay, or a mix of both (see here for more info:
https://gitlab.freedesktop.org/emersion/libliftoff/-/issues/76)

One way for compositors to implement the underlay strategy is to assign
a higher zpos to the DRM_PRIMARY plane than the DRM_OVERLAY planes,
effectively turning the DRM_OVERLAY plane into an underlay plane.

Today, amdgpu attaches an immutable zpos of 0 to the DRM_PRIMARY plane.
This however, is an arbitrary restriction. DCN pipes are general
purpose, and can be arranged in any z-order. To support compositors
using this allocation scheme, we can set a non-zero immutable zpos for
the PRIMARY, allowing the placement of OVERLAYS (mutable zpos range
0-254) beneath the PRIMARY.

[How]

Assign a zpos = #no of OVERLAY planes to the PRIMARY plane. Then, clean
up any assumptions in the driver of PRIMARY plane having the lowest
zpos.

Signed-off-by: Leo Li <sunpeng.li@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

v2: Fix typo s/decending/descending/
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 34 +++++++++++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 18 +++++++---
 2 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b4b5b73707c1..6782ca1137d4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -80,6 +80,7 @@
 #include <linux/firmware.h>
 #include <linux/component.h>
 #include <linux/dmi.h>
+#include <linux/sort.h>
 
 #include <drm/display/drm_dp_mst_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
@@ -375,6 +376,20 @@ static inline void reverse_planes_order(struct dc_surface_update *array_of_surfa
 		swap(array_of_surface_update[i], array_of_surface_update[j]);
 }
 
+/*
+ * DC will program planes with their z-order determined by their ordering
+ * in the dc_surface_updates array. This comparator is used to sort them
+ * by descending zpos.
+ */
+static int dm_plane_layer_index_cmp(const void *a, const void *b)
+{
+	const struct dc_surface_update *sa = (struct dc_surface_update *)a;
+	const struct dc_surface_update *sb = (struct dc_surface_update *)b;
+
+	/* Sort by descending dc_plane layer_index (i.e. normalized_zpos) */
+	return sb->surface->layer_index - sa->surface->layer_index;
+}
+
 /**
  * update_planes_and_stream_adapter() - Send planes to be updated in DC
  *
@@ -399,7 +414,8 @@ static inline bool update_planes_and_stream_adapter(struct dc *dc,
 						    struct dc_stream_update *stream_update,
 						    struct dc_surface_update *array_of_surface_update)
 {
-	reverse_planes_order(array_of_surface_update, planes_count);
+	sort(array_of_surface_update, planes_count,
+	     sizeof(*array_of_surface_update), dm_plane_layer_index_cmp, NULL);
 
 	/*
 	 * Previous frame finished and HW is ready for optimization.
@@ -9503,6 +9519,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		for (j = 0; j < status->plane_count; j++)
 			dummy_updates[j].surface = status->plane_states[0];
 
+		sort(dummy_updates, status->plane_count,
+		     sizeof(*dummy_updates), dm_plane_layer_index_cmp, NULL);
 
 		mutex_lock(&dm->dc_lock);
 		dc_update_planes_and_stream(dm->dc,
@@ -10237,6 +10255,16 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 	if (new_crtc_state->color_mgmt_changed)
 		return true;
 
+	/*
+	 * On zpos change, planes need to be reordered by removing and re-adding
+	 * them one by one to the dc state, in order of descending zpos.
+	 *
+	 * TODO: We can likely skip bandwidth validation if the only thing that
+	 * changed about the plane was it'z z-ordering.
+	 */
+	if (new_crtc_state->zpos_changed)
+		return true;
+
 	if (drm_atomic_crtc_needs_modeset(new_crtc_state))
 		return true;
 
@@ -11076,7 +11104,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	}
 
 	/* Remove exiting planes if they are modified */
-	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
+	for_each_oldnew_plane_in_descending_zpos(state, plane, old_plane_state, new_plane_state) {
 		if (old_plane_state->fb && new_plane_state->fb &&
 		    get_mem_type(old_plane_state->fb) !=
 		    get_mem_type(new_plane_state->fb))
@@ -11121,7 +11149,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	}
 
 	/* Add new/modified planes */
-	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
+	for_each_oldnew_plane_in_descending_zpos(state, plane, old_plane_state, new_plane_state) {
 		ret = dm_update_plane_state(dc, state, plane,
 					    old_plane_state,
 					    new_plane_state,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 3e467244ad07..bb534b2b0b71 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -104,8 +104,6 @@ void amdgpu_dm_plane_fill_blending_from_plane_state(const struct drm_plane_state
 	*global_alpha = false;
 	*global_alpha_value = 0xff;
 
-	if (plane_state->plane->type == DRM_PLANE_TYPE_PRIMARY)
-		return;
 
 	if (plane_state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI ||
 		plane_state->pixel_blend_mode == DRM_MODE_BLEND_COVERAGE) {
@@ -1701,6 +1699,7 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	int res = -EPERM;
 	unsigned int supported_rotations;
 	uint64_t *modifiers = NULL;
+	unsigned int primary_zpos = dm->dc->caps.max_slave_planes;
 
 	num_formats = amdgpu_dm_plane_get_plane_formats(plane, plane_cap, formats,
 							ARRAY_SIZE(formats));
@@ -1730,10 +1729,19 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	}
 
 	if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
-		drm_plane_create_zpos_immutable_property(plane, 0);
+		/*
+		 * Allow OVERLAY planes to be used as underlays by assigning an
+		 * immutable zpos = # of OVERLAY planes to the PRIMARY plane.
+		 */
+		drm_plane_create_zpos_immutable_property(plane, primary_zpos);
 	} else if (plane->type == DRM_PLANE_TYPE_OVERLAY) {
-		unsigned int zpos = 1 + drm_plane_index(plane);
-		drm_plane_create_zpos_property(plane, zpos, 1, 254);
+		/*
+		 * OVERLAY planes can be below or above the PRIMARY, but cannot
+		 * be above the CURSOR plane.
+		 */
+		unsigned int zpos = primary_zpos + 1 + drm_plane_index(plane);
+
+		drm_plane_create_zpos_property(plane, zpos, 0, 254);
 	} else if (plane->type == DRM_PLANE_TYPE_CURSOR) {
 		drm_plane_create_zpos_immutable_property(plane, 255);
 	}
-- 
2.44.0

