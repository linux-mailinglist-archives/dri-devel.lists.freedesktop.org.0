Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB3687D281
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 18:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004BE1123B1;
	Fri, 15 Mar 2024 17:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dwR6bQnd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2064.outbound.protection.outlook.com [40.107.101.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB79E1123B1;
 Fri, 15 Mar 2024 17:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkdPQWHNpbMen3Qkw5Fy8fP9WTP2m22xd48VRcGNcpuD7WLDn3oasLeOh6QunbiSaKF6qFhcNd9wr1ahOF1oCj9Mea+ckGLd9C2VkGV50Gqh6RBD+tHkApN17U+13ur1zoLo6oYTFdoiqvzbw+NdFzwu0rFFipffX9o7lQEhfO4D0rfjT03m410M/fEqjVHPuE4ECGWTtAPomn2oZAfHeRxrY2PV2ukJ/mOZlgzvgAnfruZKDyiVrKAfGrmImetzXDBDnBd5PzJQQ9oQrONGli7BMmwv5qIBF50gNEJYyFr3pRCLB791iQyqzTbfxentLWq41UQWbmShTkAH2Ymruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4hJtPPoOb1+1FFKfzHYRRDI6/i8eRYM+rENMDzlPjI=;
 b=kUA6YI78lG3mUFAgOmlBj/q0fjG0ryciMn2tFvns0xTHG0i1jhpAFyxI9xUlMqLsNtqv2I0vwwfe3TTHlE42Ph77iVpgFEQThxCNL9SGxRW00loSHB9Osk1G2AULhDbuY8Gzc8LBPmPTOBWY+hHYxQ6aPhIcMny1Ksoi1xsMnYWd2Tjr3oSVhXR1c80YG0dXRntUaarWIUEQMfnKfH16AC+oInT0kjqH4/gHVaieB1ne9LafiMOO84bapFQ1z7jKdPoYR8po0Uol3ItJhn8X5a1E+BMPNE7FSI1rceRyn4nppXu8usvjFZH3yHbBwRhzf/mXEVP2TJ+pq1jbIFtLXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4hJtPPoOb1+1FFKfzHYRRDI6/i8eRYM+rENMDzlPjI=;
 b=dwR6bQndL1c7w86vPs7XzqftyP2Z09XpQFG2OKlg2zmxwoM4ySjd86kPzoCa7s9zAEK9NnK2Ns+15EVBC3HchcQguF2yQnonSi0df9WAZq9peJIAS6f63sPpZV3Jadlm1doTMMnBU6falkTRmWO79azjXoQHzBHPEo6C1Muicwg=
Received: from BN0PR04CA0113.namprd04.prod.outlook.com (2603:10b6:408:ec::28)
 by SN7PR12MB6861.namprd12.prod.outlook.com (2603:10b6:806:266::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.22; Fri, 15 Mar
 2024 17:11:27 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:ec:cafe::fe) by BN0PR04CA0113.outlook.office365.com
 (2603:10b6:408:ec::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.22 via Frontend
 Transport; Fri, 15 Mar 2024 17:11:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Fri, 15 Mar 2024 17:11:27 +0000
Received: from thonkpad.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 15 Mar
 2024 12:11:25 -0500
From: <sunpeng.li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: Joshua Ashton <joshua@froggi.es>, =?UTF-8?q?Michel=20D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader
 <robert.mader@posteo.de>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 "Sean Paul" <sean@poorly.run>, Simon Ser <contact@emersion.fr>, Shashank
 Sharma <shashank.sharma@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 "Sebastian Wick" <sebastian.wick@redhat.com>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH 1/2] drm/amd/display: Introduce overlay cursor mode
Date: Fri, 15 Mar 2024 13:09:57 -0400
Message-ID: <20240315170959.165505-2-sunpeng.li@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|SN7PR12MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: cade5a3c-fcae-4bfe-f6f0-08dc4512f33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cU4JrMvPIxG4xYVQOwU/q0O8PnMNLaMS3mTFluQEMrLHyUXy/5Yro3g8XDKn0AGQyS0t3u84N6CA5rSf9t4uRpagIx3j1xo8v/Q3kIv/aIX/rHeILF5VjRD39zNpJFvUxraaeTYql03t1Uzk97flpc+FCSglak4NGo/uqAssmq29O8Np4LD3gBwh0jEL4x2xPk9ZBWFFHvEwFAootpj2ChxgUkW61F2QTgUl2o8er6CZDho0mXjPXbUnQX7GOhWNvt+ePlNtgjxBV5yT8oIT7YkK6EAcoarOEbEd2qT8rZKgXTi3sgB9TWsf9Rl2QlVuc4mENEhVEREgR2kmetoW7Vnc31Im3YR1W/jcZO6Opp1Q1q4b4yZdADm/fev9snLbtFFTRqqByPydwyqBGflhZB8GYV1/V0hPG3f3DGC9IbL1qHERZU7Cl+WLuTdq5nc7Fnv06MtRi5VoAXabkvJV2r8lp9TOgANp5Ihz/Ag16zsRXWvpTrzTEhFUUrxhl8VRcEXtL6ge6mCvbXobWxHLIMlLkB4tExolIn4FlG49aE0j1od123GuyDCdCKxjmI+8dF1BI75Sve61GlNyGjbHRtCrCb+lhcG3xYT8NY1O5h5Wdd1cHMiyOYRbfpgnrGwYIxHlU+eR3PM33ZwL8Mr3JxTVrIvkcPwhDeQAzsnzP0LuKCr7nOgXkd01L9L3PKP8QbIoYwu/w690WYWiGJOirFc3vZPluwolCICXYpHb1BEZ1lB14UX/Rw1uE2b4cis2
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(7416005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 17:11:27.1820 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cade5a3c-fcae-4bfe-f6f0-08dc4512f33b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6861
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

DCN is the display hardware for amdgpu. DRM planes are backed by DCN
hardware pipes, which carry pixel data from one end (memory), to the
other (output encoder).

Each DCN pipe has the ability to blend in a cursor early on in the
pipeline. In other words, there are no dedicated cursor planes in DCN,
which makes cursor behavior somewhat unintuitive for compositors.

For example, if the cursor is in RGB format, but the top-most DRM plane
is in YUV format, DCN will not be able to blend them. Because of this,
amdgpu_dm rejects all configurations where a cursor needs to be enabled
on top of a YUV formatted plane.

From a compositor's perspective, when computing an allocation for
hardware plane offloading, this cursor-on-yuv configuration result in an
atomic test failure. Since the failure reason is not obvious at all,
compositors will likely fall back to full rendering, which is not ideal.

Instead, amdgpu_dm can try to accommodate the cursor-on-yuv
configuration by opportunistically reserving a separate DCN pipe just
for the cursor. We can refer to this as "overlay cursor mode". It is
contrasted with "native cursor mode", where the native DCN per-pipe
cursor is used.

[How]

On each crtc, compute whether the cursor plane should be enabled in
overlay mode (which currently, is iff the immediate plane below has a
YUV format). If it is, mark the CRTC as requesting overlay cursor mode.

During DC validation, attempt to enable a separate DCN pipe for the
cursor if it's in overlay mode. If that fails, or if no overlay mode is
requested, then fallback to native mode.

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 309 +++++++++++++++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  13 +-
 4 files changed, 288 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 21a61454c878..09ab330aed17 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8359,8 +8359,19 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 	 * Disable the cursor first if we're disabling all the planes.
 	 * It'll remain on the screen after the planes are re-enabled
 	 * if we don't.
+	 *
+	 * If the cursor is transitioning from native to overlay mode, the
+	 * native cursor needs to be disabled first.
 	 */
-	if (acrtc_state->active_planes == 0)
+	if (acrtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE &&
+	    dm_old_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE) {
+		struct dc_cursor_position cursor_position = {0};
+		dc_stream_set_cursor_position(acrtc_state->stream,
+					      &cursor_position);
+	}
+
+	if (acrtc_state->active_planes == 0 &&
+	    dm_old_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE)
 		amdgpu_dm_commit_cursors(state);
 
 	/* update planes when needed */
@@ -8374,7 +8385,8 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		struct dm_plane_state *dm_new_plane_state = to_dm_plane_state(new_plane_state);
 
 		/* Cursor plane is handled after stream updates */
-		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
+		if (plane->type == DRM_PLANE_TYPE_CURSOR &&
+		    acrtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE) {
 			if ((fb && crtc == pcrtc) ||
 			    (old_plane_state->fb && old_plane_state->crtc == pcrtc))
 				cursor_update = true;
@@ -8727,7 +8739,8 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 	 * This avoids redundant programming in the case where we're going
 	 * to be disabling a single plane - those pipes are being disabled.
 	 */
-	if (acrtc_state->active_planes)
+	if (acrtc_state->active_planes &&
+	    acrtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE)
 		amdgpu_dm_commit_cursors(state);
 
 cleanup:
@@ -10039,7 +10052,8 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 {
 	struct drm_plane *other;
 	struct drm_plane_state *old_other_state, *new_other_state;
-	struct drm_crtc_state *new_crtc_state;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct dm_crtc_state *old_dm_crtc_state, *new_dm_crtc_state;
 	struct amdgpu_device *adev = drm_to_adev(plane->dev);
 	int i;
 
@@ -10061,10 +10075,24 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 
 	new_crtc_state =
 		drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
+	old_crtc_state =
+		drm_atomic_get_old_crtc_state(state, old_plane_state->crtc);
 
 	if (!new_crtc_state)
 		return true;
 
+	/*
+	 * A change in cursor mode means a new dc pipe needs to be acquired or
+	 * released from the state
+	 */
+	old_dm_crtc_state = to_dm_crtc_state(old_crtc_state);
+	new_dm_crtc_state = to_dm_crtc_state(new_crtc_state);
+	if (plane->type == DRM_PLANE_TYPE_CURSOR &&
+	    old_dm_crtc_state != NULL &&
+	    old_dm_crtc_state->cursor_mode != new_dm_crtc_state->cursor_mode) {
+		return true;
+	}
+
 	/* CRTC Degamma changes currently require us to recreate planes. */
 	if (new_crtc_state->color_mgmt_changed)
 		return true;
@@ -10216,6 +10244,68 @@ static int dm_check_cursor_fb(struct amdgpu_crtc *new_acrtc,
 	return 0;
 }
 
+/*
+ * Helper function for checking the cursor in native mode
+ */
+static int dm_check_native_cursor_state(struct drm_crtc *new_plane_crtc,
+					struct drm_plane *plane,
+					struct drm_plane_state *new_plane_state,
+					bool enable)
+{
+
+	struct amdgpu_crtc *new_acrtc;
+	int ret;
+
+	if (!enable || !new_plane_crtc ||
+	    drm_atomic_plane_disabling(plane->state, new_plane_state))
+		return 0;
+
+	new_acrtc = to_amdgpu_crtc(new_plane_crtc);
+
+	if (new_plane_state->src_x != 0 || new_plane_state->src_y != 0) {
+		DRM_DEBUG_ATOMIC("Cropping not supported for cursor plane\n");
+		return -EINVAL;
+	}
+
+	if (new_plane_state->fb) {
+		ret = dm_check_cursor_fb(new_acrtc, new_plane_state,
+						new_plane_state->fb);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static bool dm_should_update_native_cursor(struct drm_atomic_state *state,
+					   struct drm_crtc *old_plane_crtc,
+					   struct drm_crtc *new_plane_crtc,
+					   bool enable)
+{
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
+
+	if (!enable) {
+		if (old_plane_crtc == NULL)
+			return true;
+
+		old_crtc_state = drm_atomic_get_old_crtc_state(
+			state, old_plane_crtc);
+		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
+
+		return dm_old_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE;
+	} else {
+		if (new_plane_crtc == NULL)
+			return true;
+
+		new_crtc_state = drm_atomic_get_new_crtc_state(
+			state, new_plane_crtc);
+		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+
+		return dm_new_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE;
+	}
+}
+
 static int dm_update_plane_state(struct dc *dc,
 				 struct drm_atomic_state *state,
 				 struct drm_plane *plane,
@@ -10231,8 +10321,7 @@ static int dm_update_plane_state(struct dc *dc,
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct dm_crtc_state *dm_new_crtc_state, *dm_old_crtc_state;
 	struct dm_plane_state *dm_new_plane_state, *dm_old_plane_state;
-	struct amdgpu_crtc *new_acrtc;
-	bool needs_reset;
+	bool needs_reset, update_native_cursor;
 	int ret = 0;
 
 
@@ -10241,24 +10330,16 @@ static int dm_update_plane_state(struct dc *dc,
 	dm_new_plane_state = to_dm_plane_state(new_plane_state);
 	dm_old_plane_state = to_dm_plane_state(old_plane_state);
 
-	if (plane->type == DRM_PLANE_TYPE_CURSOR) {
-		if (!enable || !new_plane_crtc ||
-			drm_atomic_plane_disabling(plane->state, new_plane_state))
-			return 0;
-
-		new_acrtc = to_amdgpu_crtc(new_plane_crtc);
-
-		if (new_plane_state->src_x != 0 || new_plane_state->src_y != 0) {
-			DRM_DEBUG_ATOMIC("Cropping not supported for cursor plane\n");
-			return -EINVAL;
-		}
+	update_native_cursor = dm_should_update_native_cursor(state,
+							      old_plane_crtc,
+							      new_plane_crtc,
+							      enable);
 
-		if (new_plane_state->fb) {
-			ret = dm_check_cursor_fb(new_acrtc, new_plane_state,
-						 new_plane_state->fb);
-			if (ret)
-				return ret;
-		}
+	if (plane->type == DRM_PLANE_TYPE_CURSOR && update_native_cursor) {
+		ret = dm_check_native_cursor_state(new_plane_crtc, plane,
+					            new_plane_state, enable);
+		if (ret)
+			return ret;
 
 		return 0;
 	}
@@ -10285,16 +10366,17 @@ static int dm_update_plane_state(struct dc *dc,
 				plane->base.id, old_plane_crtc->base.id);
 
 		ret = dm_atomic_get_state(state, &dm_state);
-		if (ret)
-			return ret;
+		if (ret) {
+			goto out;
+		}
 
 		if (!dc_state_remove_plane(
 				dc,
 				dm_old_crtc_state->stream,
 				dm_old_plane_state->dc_state,
 				dm_state->context)) {
-
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out;
 		}
 
 		if (dm_old_plane_state->dc_state)
@@ -10323,21 +10405,16 @@ static int dm_update_plane_state(struct dc *dc,
 			return 0;
 
 		ret = amdgpu_dm_plane_helper_check_state(new_plane_state, new_crtc_state);
-		if (ret)
-			return ret;
+		if (ret) {
+			goto out;
+		}
 
 		WARN_ON(dm_new_plane_state->dc_state);
 
 		dc_new_plane_state = dc_create_plane_state(dc);
-		if (!dc_new_plane_state)
-			return -ENOMEM;
-
-		/* Block top most plane from being a video plane */
-		if (plane->type == DRM_PLANE_TYPE_OVERLAY) {
-			if (amdgpu_dm_plane_is_video_format(new_plane_state->fb->format->format) && *is_top_most_overlay)
-				return -EINVAL;
-
-			*is_top_most_overlay = false;
+		if (!dc_new_plane_state) {
+			ret = -ENOMEM;
+			goto out;
 		}
 
 		DRM_DEBUG_ATOMIC("Enabling DRM plane: %d on DRM crtc %d\n",
@@ -10350,13 +10427,13 @@ static int dm_update_plane_state(struct dc *dc,
 			new_crtc_state);
 		if (ret) {
 			dc_plane_state_release(dc_new_plane_state);
-			return ret;
+			goto out;
 		}
 
 		ret = dm_atomic_get_state(state, &dm_state);
 		if (ret) {
 			dc_plane_state_release(dc_new_plane_state);
-			return ret;
+			goto out;
 		}
 
 		/*
@@ -10373,7 +10450,8 @@ static int dm_update_plane_state(struct dc *dc,
 				dm_state->context)) {
 
 			dc_plane_state_release(dc_new_plane_state);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out;
 		}
 
 		dm_new_plane_state->dc_state = dc_new_plane_state;
@@ -10388,6 +10466,16 @@ static int dm_update_plane_state(struct dc *dc,
 		*lock_and_validation_needed = true;
 	}
 
+out:
+	/* If cursor overlay failed, attempt fallback to native mode */
+	if (ret == -EINVAL && plane->type == DRM_PLANE_TYPE_CURSOR) {
+		ret = dm_check_native_cursor_state(new_plane_crtc, plane,
+						    new_plane_state, enable);
+		if (ret) {
+			return ret;
+		}
+		dm_new_crtc_state->cursor_mode = DM_CURSOR_NATIVE_MODE;
+	}
 
 	return ret;
 }
@@ -10544,6 +10632,126 @@ static int add_affected_mst_dsc_crtcs(struct drm_atomic_state *state, struct drm
 	return drm_dp_mst_add_affected_dsc_crtcs(state, &aconnector->mst_root->mst_mgr);
 }
 
+/**
+ * DOC: Cursor Modes - Native vs Overlay
+ *
+ * In native mode, the cursor uses a integrated cursor pipe within each DCN hw
+ * plane. It does not require a dedicated hw plane to enable, but it is
+ * subjected to the same z-order and scaling as the hw plane. It also has format
+ * restrictions, a RGB cursor in native mode cannot be enabled within a non-RGB
+ * hw plane.
+ *
+ * In overlay mode, the cursor uses a separate DCN hw plane, and thus has its
+ * own scaling and z-pos. It also has no blending restrictions. It lends to a
+ * cursor behavior more akin to a DRM client's expectations. However, it does
+ * occupy an extra DCN plane, and therefore will only be used if a DCN plane is
+ * available.
+*/
+
+/**
+ * Set whether the cursor should be enabled in native mode, or overlay mode, on
+ * the dm_crtc_state.
+ *
+ * The cursor should be enabled in overlay mode if the immediate underlying
+ * plane contains a video format.
+ *
+ * Since zpos info is required, drm_atomic_normalize_zpos must be called before
+ * calling this function.
+*/
+static int dm_crtc_set_cursor_mode(struct drm_atomic_state *state,
+				    struct dm_crtc_state *dm_crtc_state)
+{
+	struct drm_plane_state *plane_state, *old_plane_state, *target_plane_state;
+	struct drm_crtc_state *crtc_state = &dm_crtc_state->base;
+	struct drm_plane *plane;
+	bool consider_mode_change = false;
+	bool cursor_changed = false;
+	unsigned int target_zpos;
+	unsigned int cursor_zpos;
+	int i;
+
+	/*
+	 * Cursor mode can change if a plane's format changes, is
+	 * enabled/disabled, or z-order changes.
+	 */
+	for_each_oldnew_plane_in_state(state, plane, old_plane_state, plane_state, i) {
+
+		/* Only care about planes on this CRTC */
+		if ((drm_plane_mask(plane) & crtc_state->plane_mask) == 0)
+			continue;
+
+		if (plane->type == DRM_PLANE_TYPE_CURSOR)
+			cursor_changed = true;
+
+		if (drm_atomic_plane_enabling(old_plane_state, plane_state) ||
+		    drm_atomic_plane_disabling(old_plane_state, plane_state) ||
+		    old_plane_state->fb->format != plane_state->fb->format) {
+			consider_mode_change = true;
+			break;
+		}
+	}
+
+	if (!consider_mode_change && !crtc_state->zpos_changed) {
+		return 0;
+	}
+
+	/*
+	 * If no cursor change on this CRTC, and not enabled on this CRTC, then
+	 * no need to set cursor mode. This avoids needlessly locking the cursor
+	 * state.
+	 */
+	if (!cursor_changed &&
+	    !(drm_plane_mask(crtc_state->crtc->cursor) & crtc_state->plane_mask)) {
+		return 0;
+	}
+
+	plane_state = drm_atomic_get_plane_state(state,
+						 crtc_state->crtc->cursor);
+	if (IS_ERR(plane_state))
+		return PTR_ERR(plane_state);
+
+	/* Cursor is disabled */
+	if (!plane_state->fb)
+		return 0;
+
+	cursor_zpos = plane_state->normalized_zpos;
+
+	/* Get enabled plane immediately below cursor. */
+	target_plane_state = NULL;
+	target_zpos = 0;
+	drm_for_each_plane_mask(plane, state->dev, crtc_state->plane_mask) {
+		if (plane->type == DRM_PLANE_TYPE_CURSOR)
+			continue;
+
+		plane_state = drm_atomic_get_plane_state(state, plane);
+		if (IS_ERR(plane_state))
+			return PTR_ERR(plane_state);
+
+		if (!plane_state->fb ||
+		    plane_state->normalized_zpos >= cursor_zpos)
+			continue;
+
+		if (plane_state->normalized_zpos >= target_zpos) {
+			target_zpos = plane_state->normalized_zpos;
+			target_plane_state = plane_state;
+		}
+	}
+
+	/* Nothing below cursor - use overlay mode */
+	if (target_plane_state == NULL) {
+		dm_crtc_state->cursor_mode = DM_CURSOR_OVERLAY_MODE;
+		return 0;
+	}
+
+	if (amdgpu_dm_plane_is_video_format(target_plane_state->fb->format->format)) {
+		dm_crtc_state->cursor_mode = DM_CURSOR_OVERLAY_MODE;
+	} else {
+		dm_crtc_state->cursor_mode = DM_CURSOR_NATIVE_MODE;
+	}
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_atomic_check() - Atomic check implementation for AMDgpu DM.
  *
@@ -10713,6 +10921,20 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		goto fail;
 	}
 
+	/*
+	 * Determine whether cursors on each CRTC should be enabled in native or
+	 * overlay mode.
+	 */
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+
+		ret = dm_crtc_set_cursor_mode(state, dm_new_crtc_state);
+		if (ret) {
+			drm_dbg(dev, "Failed to determine cursor mode\n");
+			goto fail;
+		}
+	}
+
 	/* Remove exiting planes if they are modified */
 	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
 		if (old_plane_state->fb && new_plane_state->fb &&
@@ -10793,6 +11015,11 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 
 	/* Check cursor planes scaling */
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		/* Overlay cusor does not need scaling check */
+		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+		if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
+			continue;
+
 		ret = dm_check_crtc_cursor(state, crtc, new_crtc_state);
 		if (ret) {
 			DRM_DEBUG_DRIVER("dm_check_crtc_cursor() failed\n");
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 09519b7abf67..b8d39fdd1e09 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -822,6 +822,11 @@ struct dm_plane_state {
 	enum amdgpu_transfer_function blend_tf;
 };
 
+enum amdgpu_dm_cursor_mode {
+	DM_CURSOR_NATIVE_MODE = 0,
+	DM_CURSOR_OVERLAY_MODE,
+};
+
 struct dm_crtc_state {
 	struct drm_crtc_state base;
 	struct dc_stream_state *stream;
@@ -852,6 +857,8 @@ struct dm_crtc_state {
 	 * encoding.
 	 */
 	enum amdgpu_transfer_function regamma_tf;
+
+	enum amdgpu_dm_cursor_mode cursor_mode;
 };
 
 #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index e23a0a276e33..67aea1d2feb9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -304,6 +304,7 @@ static struct drm_crtc_state *amdgpu_dm_crtc_duplicate_state(struct drm_crtc *cr
 	state->regamma_tf = cur->regamma_tf;
 	state->crc_skip_count = cur->crc_skip_count;
 	state->mpo_requested = cur->mpo_requested;
+	state->cursor_mode = cur->cursor_mode;
 	/* TODO Duplicate dc_stream after objects are stream object is flattened */
 
 	return &state->base;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 8a4c40b4c27e..ed1fc01f1649 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -104,7 +104,7 @@ void amdgpu_dm_plane_fill_blending_from_plane_state(const struct drm_plane_state
 	*global_alpha = false;
 	*global_alpha_value = 0xff;
 
-	if (plane_state->plane->type != DRM_PLANE_TYPE_OVERLAY)
+	if (plane_state->plane->type == DRM_PLANE_TYPE_PRIMARY)
 		return;
 
 	if (plane_state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI ||
@@ -1175,10 +1175,21 @@ static int amdgpu_dm_plane_atomic_check(struct drm_plane *plane,
 static int amdgpu_dm_plane_atomic_async_check(struct drm_plane *plane,
 					      struct drm_atomic_state *state)
 {
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_plane_state *new_plane_state;
+	struct dm_crtc_state *dm_new_crtc_state;
+
 	/* Only support async updates on cursor planes. */
 	if (plane->type != DRM_PLANE_TYPE_CURSOR)
 		return -EINVAL;
 
+	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
+	dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+	/* Reject overlay cursors for now*/
+	if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.44.0

