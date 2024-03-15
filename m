Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472F387D283
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 18:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98731123B8;
	Fri, 15 Mar 2024 17:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X6OFbQTQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1111123B7;
 Fri, 15 Mar 2024 17:11:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gm4fF+imvjy/xIsdTEItNid8LqCsXn6GjWS+iE5jJ2tIFSUIqfICpHg/e/G0UJjaZ6nLK7/BvZoGkeJCdA+FRlkqsFZto4Q7GOWdVaFEgR/5IJZA56KX8+ENvIprZhaIml5GqupwP0cVD9lKZlPlmVbwjcXp9/zy1kBhci0Ukf4NsYneLg/wBTmElxWokIc56/iev82QSzbNVkMCvmneiF/xUXiN7XO5JofOqDJusQ329RnhZYg5hcbLvFOqiSNY5suOpUbfkSxSkUtkIUGnYb5M0i5xDI8O9kmw+fol371ZMjLEyhObq/7aCa2tC5w7v64fgJaCSdIpSd+ipS8fKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dH9sqPLFljkXHwUbgOaFFyOoTYSstrTR/h/noSHXwP8=;
 b=jqPutMv5Kcth8m2ngmstMz8LLY/+hOp3KvaBcgSRpIL9fv/n68pO1Xpe8AHQjw+joq3nSYy7oOFX8bHPhir+wse5HHO/rUu6mPCCiN5qvY3T5g2HwoCBcK7kWqHzc8KFAjEeoHEmjylZadTldbREjAbPqR2/pAYyA5A4Z8Ok9pv0k9hMyZTAQIhnjzKubC5uJ/oXZ4Vq66jXjZukS4Iorc21h2aTz9y2j6vDVJfZAlrqcLXlpOuGOXrr0Z0ah1AqFVTvc3QQdWLv2013RZXygfsKMCPXDFGMOljf/SFpruA3fXIbSzbJcPYv7qQRyn2fcd6hosb95Vx3/bXIrR1zBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dH9sqPLFljkXHwUbgOaFFyOoTYSstrTR/h/noSHXwP8=;
 b=X6OFbQTQ7/NTuVAvFEq8rJNCxCz5nQNs4R3AMTdEm8g10748rGGKszkvPTBSmPiqqRv4WVVk6pg0IrIEHOCBuBw7z1tj3gi4CniQLTS1kHAXZwgjrhFDXPXtm1QByrIJsHDc/Xj9I1PTCFgobviRuk+t9PgRayHe8Z9ulrN1g1g=
Received: from BN9PR03CA0653.namprd03.prod.outlook.com (2603:10b6:408:13b::28)
 by CH3PR12MB9025.namprd12.prod.outlook.com (2603:10b6:610:129::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Fri, 15 Mar
 2024 17:11:32 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:13b:cafe::2e) by BN9PR03CA0653.outlook.office365.com
 (2603:10b6:408:13b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.22 via Frontend
 Transport; Fri, 15 Mar 2024 17:11:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Fri, 15 Mar 2024 17:11:32 +0000
Received: from thonkpad.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 15 Mar
 2024 12:11:30 -0500
From: <sunpeng.li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: Joshua Ashton <joshua@froggi.es>, =?UTF-8?q?Michel=20D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader
 <robert.mader@posteo.de>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 "Sean Paul" <sean@poorly.run>, Simon Ser <contact@emersion.fr>, Shashank
 Sharma <shashank.sharma@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 "Sebastian Wick" <sebastian.wick@redhat.com>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH 2/2] drm/amd/display: Move PRIMARY plane zpos higher
Date: Fri, 15 Mar 2024 13:09:58 -0400
Message-ID: <20240315170959.165505-3-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315170959.165505-1-sunpeng.li@amd.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|CH3PR12MB9025:EE_
X-MS-Office365-Filtering-Correlation-Id: c57a5f16-eec0-4ee3-ebec-08dc4512f618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zWkpozQD7qtzCzgiJJeiSLLfjqh0D7+xfIqUpGDInoizrEKMWbM1t6QNT+BwdOtQsr24onCWaFrHL3zm4+b6Bc21LSBPuwD4Nj+ejrrCWCjpqnKFLVgf2233Mopf6oWid+u4YpYdjpJRXYg/fSJyKe7QE7REx5WtPPne5sXEEzOo5Gs2ySa85rML8zkYgAY8utR05Vn/D6F8YulSIxOPEghCdOrqqr9THt3VkNMtlSOTSIZdb1P23FOLn5QnPs00RVNSbwNUfTbYFs2UlfYm+nFMSH/yHP4wlv8GLaqsuCxyCeSxKURT4uUPJJxey3MrxGdnrACW2Ok3MyUSal0HTs0hyP47SOAzkCGF4q9jn6sEakyQUwsC2LmpAKvYkIxjQQ/pkz1W0w5rah3JiLoeR6iNw0LIcvSEZ8+A8/hGsjStyKBRxVQstyLaud2vLdvnrOwq20NDW/Zr0jX/I9jMz9pEK1PDK9DPhQdFGbucxw40rtDexCGQDzhVbAZ8QyrTpe/Rl+VMnpxM2KBQNvaf4sZY6FXEoq1CwxEybbNqts7QpNLfHv3JA1dpzENcDK2jm6mv4hNXBBy35WKV6mi8puB1Y7XfDiCBKfrxLj4vmeTzmVrDr31rW0ba4rpCqUWKb0lCeUiWBDnaaY3yHCq78oVyqb1dffehZQRbVzDoe4izIcaerUqz7z6TaZ2wtkdLhXZXK1geweNET36HpbAGscS1K99Fvl8URDsyuPGpV11+dZcun9azJfvVo1p/lONR
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(82310400014)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 17:11:32.0011 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c57a5f16-eec0-4ee3-ebec-08dc4512f618
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9025
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
underlay, or a mix of both

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
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 96 ++++++++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 17 +++-
 2 files changed, 104 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 09ab330aed17..01b00f587701 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -80,6 +80,7 @@
 #include <linux/firmware.h>
 #include <linux/component.h>
 #include <linux/dmi.h>
+#include <linux/sort.h>
 
 #include <drm/display/drm_dp_mst_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
@@ -369,6 +370,20 @@ static inline void reverse_planes_order(struct dc_surface_update *array_of_surfa
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
@@ -393,7 +408,8 @@ static inline bool update_planes_and_stream_adapter(struct dc *dc,
 						    struct dc_stream_update *stream_update,
 						    struct dc_surface_update *array_of_surface_update)
 {
-	reverse_planes_order(array_of_surface_update, planes_count);
+	sort(array_of_surface_update, planes_count,
+	     sizeof(*array_of_surface_update), dm_plane_layer_index_cmp, NULL);
 
 	/*
 	 * Previous frame finished and HW is ready for optimization.
@@ -9363,6 +9379,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		for (j = 0; j < status->plane_count; j++)
 			dummy_updates[j].surface = status->plane_states[0];
 
+		sort(dummy_updates, status->plane_count,
+		     sizeof(*dummy_updates), dm_plane_layer_index_cmp, NULL);
 
 		mutex_lock(&dm->dc_lock);
 		dc_update_planes_and_stream(dm->dc,
@@ -10097,6 +10115,17 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 	if (new_crtc_state->color_mgmt_changed)
 		return true;
 
+	/*
+	 * On zpos change, planes need to be reordered by removing and re-adding
+	 * them one by one to the dc state, in order of descending zpos.
+	 *
+	 * TODO: We can likely skip bandwidth validation if the only thing that
+	 * changed about the plane was it'z z-ordering.
+	 */
+	if (new_crtc_state->zpos_changed) {
+		return true;
+	}
+
 	if (drm_atomic_crtc_needs_modeset(new_crtc_state))
 		return true;
 
@@ -10509,6 +10538,65 @@ dm_get_plane_scale(struct drm_plane_state *plane_state,
 	*out_plane_scale_h = plane_state->crtc_h * 1000 / plane_src_h;
 }
 
+/*
+ * The normalized_zpos value cannot be used by this iterator directly. It's only
+ * calculated for enabled planes, potentially causing normalized_zpos collisions
+ * between enabled/disabled planes in the atomic state. We need a unique value
+ * so that the iterator will not generate the same object twice, or loop
+ * indefinitely.
+ */
+static inline struct __drm_planes_state *__get_next_zpos(
+	struct drm_atomic_state *state,
+	struct __drm_planes_state *prev)
+{
+	unsigned int highest_zpos = 0, prev_zpos = 256;
+	uint32_t highest_id = 0, prev_id = UINT_MAX;
+	struct drm_plane_state *new_plane_state;
+	struct drm_plane *plane;
+	int i, highest_i = -1;
+
+	if (prev != NULL) {
+		prev_zpos = prev->new_state->zpos;
+		prev_id = prev->ptr->base.id;
+	}
+
+	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
+		/* Skip planes with higher zpos than the previously returned */
+		if (new_plane_state->zpos > prev_zpos ||
+		    (new_plane_state->zpos == prev_zpos &&
+		     plane->base.id >= prev_id))
+			continue;
+
+		/* Save the index of the plane with highest zpos */
+		if (new_plane_state->zpos > highest_zpos ||
+		    (new_plane_state->zpos == highest_zpos &&
+		     plane->base.id > highest_id)) {
+			highest_zpos = new_plane_state->zpos;
+			highest_id = plane->base.id;
+			highest_i = i;
+		}
+	}
+
+	if (highest_i < 0)
+		return NULL;
+
+	return &state->planes[highest_i];
+}
+
+/*
+ * Use the uniqueness of the plane's (zpos, drm obj ID) combination to iterate
+ * by descending zpos, as read from the new plane state. This is the same
+ * ordering as defined by drm_atomic_normalize_zpos().
+ */
+#define for_each_oldnew_plane_in_decending_zpos(__state, plane, old_plane_state, new_plane_state) \
+	for (struct __drm_planes_state *__i = __get_next_zpos((__state), NULL); \
+	     __i != NULL; __i = __get_next_zpos((__state), __i))		\
+		for_each_if (((plane) = __i->ptr,			\
+			      (void)(plane) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_plane_state) = __i->old_state,	\
+			      (new_plane_state) = __i->new_state, 1))
+
+
 static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 				struct drm_crtc *crtc,
 				struct drm_crtc_state *new_crtc_state)
@@ -10571,7 +10659,7 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 	if (i)
 		return i;
 
-	for_each_new_plane_in_state_reverse(state, underlying, new_underlying_state, i) {
+	for_each_oldnew_plane_in_decending_zpos(state, underlying, old_plane_state, new_underlying_state) {
 		/* Narrow down to non-cursor planes on the same CRTC as the cursor */
 		if (new_underlying_state->crtc != crtc || underlying == crtc->cursor)
 			continue;
@@ -10936,7 +11024,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	}
 
 	/* Remove exiting planes if they are modified */
-	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
+	for_each_oldnew_plane_in_decending_zpos(state, plane, old_plane_state, new_plane_state) {
 		if (old_plane_state->fb && new_plane_state->fb &&
 		    get_mem_type(old_plane_state->fb) !=
 		    get_mem_type(new_plane_state->fb))
@@ -10981,7 +11069,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	}
 
 	/* Add new/modified planes */
-	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
+	for_each_oldnew_plane_in_decending_zpos(state, plane, old_plane_state, new_plane_state) {
 		ret = dm_update_plane_state(dc, state, plane,
 					    old_plane_state,
 					    new_plane_state,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index ed1fc01f1649..787c0dcdd1ea 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -104,8 +104,6 @@ void amdgpu_dm_plane_fill_blending_from_plane_state(const struct drm_plane_state
 	*global_alpha = false;
 	*global_alpha_value = 0xff;
 
-	if (plane_state->plane->type == DRM_PLANE_TYPE_PRIMARY)
-		return;
 
 	if (plane_state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI ||
 		plane_state->pixel_blend_mode == DRM_MODE_BLEND_COVERAGE) {
@@ -1686,6 +1684,7 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	int res = -EPERM;
 	unsigned int supported_rotations;
 	uint64_t *modifiers = NULL;
+	unsigned int primary_zpos = dm->dc->caps.max_slave_planes;
 
 	num_formats = amdgpu_dm_plane_get_plane_formats(plane, plane_cap, formats,
 							ARRAY_SIZE(formats));
@@ -1715,10 +1714,18 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
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
+		drm_plane_create_zpos_property(plane, zpos, 0, 254);
 	} else if (plane->type == DRM_PLANE_TYPE_CURSOR) {
 		drm_plane_create_zpos_immutable_property(plane, 255);
 	}
-- 
2.44.0

