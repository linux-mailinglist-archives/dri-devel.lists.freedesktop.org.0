Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB5162A2C2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 21:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1CB10E15A;
	Tue, 15 Nov 2022 20:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A794610E15A;
 Tue, 15 Nov 2022 20:24:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blXVYVfWR/kwU8CPjMYFCrzb7rQIPdsZGuN8PkObv9AtlibKcBu6isr8gYbi35uh5xc2k8+MkxS7Kw5++FrakPzZyRvfVZ1z3Api5BGuooA2hTuNeq0t0MzDVnk2ySUnPf5QWKcenfEc2gDCJkcghuXliSEulDlqJK9TR+z91wgglprt8JwIMy9C9/t3jyt9NlLmBWVJWT0E1koyvalDsc6EtSQ7/jJbdHi0M7WX1SO7zEFx2MazkTziSZeXAMbQrjzmysWu47jxLQD3lvGbbnCltC25FGE/aeWpybXpVaTDJxiNgdYym77grDGjH0hC0EfTqC5W+pqny6Oe2eTvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD+JK7YH2dJddtsXC2iAHWdFBxorOR4pJYdWXbrVSA4=;
 b=KyAn3fjdz7PiLjPx0i2uTvTh8rOFui58VirssBrmiQReBPZOtgd0CenWNVH1nnCb1uEO6qkG2fi3wySqrJQnbP8h/V0PSqhsz37f/llXad8e7d31nqb3GvoEHjtRFg3rMxRT7tOJj3mKWasbLUFDHKIBEj9Ohp7Ld/903zCfK6swWcG0Hvi0L8A+uuk+nYFiXL4HPbSPQ1VXdVOYADpFWwOn0iNuEF4FWgPjYe2t0476Zu7M3xba/EYcKEYebMfd4ik0EACwapphs06DzvBuYRoHzz7CqSqbojybNYu5fdYzXQbw1FjJAd/mgKtH+o5ybDVJ242Z2dZF2HMKhdwCMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD+JK7YH2dJddtsXC2iAHWdFBxorOR4pJYdWXbrVSA4=;
 b=FM5fXTi5JH9s6aGyXVCEU78tYSqwKqNW/CaJvmR0H6dB9QsHZ6q8J9S8qNYiXztFHQJgG0PVa7hdyUYGFv71UICUilfybcZ9cRDR0Cty1lu03tn87VDt8JATQnIhOQeGZFoeeFwal6QfaMaIM6k8Wh+LG1uNaBvEsUf6nYmyQgA=
Received: from DS7PR05CA0026.namprd05.prod.outlook.com (2603:10b6:5:3b9::31)
 by SJ1PR12MB6266.namprd12.prod.outlook.com (2603:10b6:a03:457::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 20:24:01 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::5b) by DS7PR05CA0026.outlook.office365.com
 (2603:10b6:5:3b9::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8 via Frontend
 Transport; Tue, 15 Nov 2022 20:24:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Tue, 15 Nov 2022 20:24:00 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 15 Nov
 2022 14:23:59 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: add FB_DAMAGE_CLIPS support
Date: Tue, 15 Nov 2022 15:24:09 -0500
Message-ID: <20221115202413.283685-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT027:EE_|SJ1PR12MB6266:EE_
X-MS-Office365-Filtering-Correlation-Id: 67419b3f-d795-417d-6dab-08dac7475511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zHELdeBeI72s+SFVxtqZGrErQcYXqwT0TsmDQjcIxJ3dKa0joBG+WENWHkBBB2udFWsXjJnJqni3Xp+/O9cwg5UiujKcf2ZVes7BfSFHRjjo79JjPJCxICOAauG1yNunsB0yNblHCSzo50jHeyMOywQWsnjNrJ/WN5V6EagVtmoUli0o8LKTPfvlDZ4S8/EH3n63m+xYQ6qQCg8Bmy1dZQqAjyuWOubRCT6wa6abU49JPU2UlJ69/zME2YYv8ewDU5ovwCEFgE26NFYOvS2L0MjiB5HUESVC4uwUhbtL/KOADHreojvjs1v37rl6tHV3lOpHN/I6eWcZtVhPF1DKfoj+I6do8/pswLIVUMmn8ih4gdzjmY5vS2aXagq5UTC6qsvdviYIN87Px1WPyPktt0pXs56yNAqr8JgVCKs6jaHXodC4xMAKZqmWbRzQAVmIixGXJlSOqC40SJy0b+nO/xfOuJi0bQ3OW2U1LFr4jPhB3JnO7ZPOG40VhvUXrs07W4jWJTG0NCyvNdwBnnQhWl5F/9EAo+SMidHRd3nPH+uiLimCeHfkHZelCt9T3+qlYLT7dZvMw7r8Y2NKQtFspAIlDKwdLC/LDbKiuZxrhMzhwfHRYRH5mRiw6hMS0kDTPOXDOg52d7V04w3NcwqA+7HygaHlvmJx+eRdKgAjV5/X389Oemf3cVCDSX12xgaB2REmfYmsc4B3MbKG8bVJddqZXNKGWzYLaCioKtuCbsqjeNd3NPFGvUFnCAQzwLY2td3M60bDHBn94e7Dhci1ZZrtaW2gC7SfAvsLC3RVTIymCp8tcxG6WBJL1M7FJWS5uN8ytAAkMCuas5UVTXFacw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(40460700003)(36756003)(40480700001)(83380400001)(86362001)(26005)(1076003)(6666004)(2616005)(336012)(82740400003)(16526019)(47076005)(426003)(186003)(8936002)(356005)(81166007)(36860700001)(44832011)(4326008)(41300700001)(5660300002)(2906002)(70206006)(70586007)(316002)(6916009)(478600001)(8676002)(54906003)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 20:24:00.9376 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67419b3f-d795-417d-6dab-08dac7475511
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6266
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
Cc: Yifan Zhang <yifan1.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, userspace doesn't have a way to communicate selective updates
to displays. So, enable support for FB_DAMAGE_CLIPS for DCN ASICs newer
than DCN301, convert DRM damage clips to dc dirty rectangles and fill
them into dirty_rects in fill_dc_dirty_rects().

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 91 +++++++++++--------
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  4 +
 2 files changed, 58 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 185d09c760ba..18b710ba802d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4842,6 +4842,31 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
 	return 0;
 }
 
+static inline void fill_dc_dirty_rect(struct drm_plane *plane,
+				      struct rect *dirty_rect, int32_t x,
+				      int32_t y, int32_t width, int32_t height,
+				      int *i, bool ffu)
+{
+	WARN_ON(*i >= DC_MAX_DIRTY_RECTS);
+
+	dirty_rect->x = x;
+	dirty_rect->y = y;
+	dirty_rect->width = width;
+	dirty_rect->height = height;
+
+	if (ffu)
+		drm_dbg(plane->dev,
+			"[PLANE:%d] PSR FFU dirty rect size (%d, %d)\n",
+			plane->base.id, width, height);
+	else
+		drm_dbg(plane->dev,
+			"[PLANE:%d] PSR SU dirty rect at (%d, %d) size (%d, %d)",
+			plane->base.id, x, y, width, height);
+
+	(*i)++;
+}
+
+
 /**
  * fill_dc_dirty_rects() - Fill DC dirty regions for PSR selective updates
  *
@@ -4862,10 +4887,6 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
  * addition, certain use cases - such as cursor and multi-plane overlay (MPO) -
  * implicitly provide damage clips without any client support via the plane
  * bounds.
- *
- * Today, amdgpu_dm only supports the MPO and cursor usecase.
- *
- * TODO: Also enable for FB_DAMAGE_CLIPS
  */
 static void fill_dc_dirty_rects(struct drm_plane *plane,
 				struct drm_plane_state *old_plane_state,
@@ -4876,12 +4897,11 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
 	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
 	struct rect *dirty_rects = flip_addrs->dirty_rects;
 	uint32_t num_clips;
+	struct drm_mode_rect *clips;
 	bool bb_changed;
 	bool fb_changed;
 	uint32_t i = 0;
 
-	flip_addrs->dirty_rect_count = 0;
-
 	/*
 	 * Cursor plane has it's own dirty rect update interface. See
 	 * dcn10_dmub_update_cursor_data and dmub_cmd_update_cursor_info_data
@@ -4894,15 +4914,11 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
 	 * requested, and there is a plane update, do FFU.
 	 */
 	if (!dm_crtc_state->mpo_requested) {
-		dirty_rects[0].x = 0;
-		dirty_rects[0].y = 0;
-		dirty_rects[0].width = dm_crtc_state->base.mode.crtc_hdisplay;
-		dirty_rects[0].height = dm_crtc_state->base.mode.crtc_vdisplay;
-		flip_addrs->dirty_rect_count = 1;
-		DRM_DEBUG_DRIVER("[PLANE:%d] PSR FFU dirty rect size (%d, %d)\n",
-				 new_plane_state->plane->base.id,
-				 dm_crtc_state->base.mode.crtc_hdisplay,
-				 dm_crtc_state->base.mode.crtc_vdisplay);
+		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[0], 0,
+				   0, dm_crtc_state->base.mode.crtc_hdisplay,
+				   dm_crtc_state->base.mode.crtc_vdisplay, &i,
+				   true);
+		flip_addrs->dirty_rect_count = i;
 		return;
 	}
 
@@ -4914,6 +4930,7 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
 	 * rects.
 	 */
 	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
+	clips = drm_plane_get_damage_clips(new_plane_state);
 	fb_changed = old_plane_state->fb->base.id !=
 		     new_plane_state->fb->base.id;
 	bb_changed = (old_plane_state->crtc_x != new_plane_state->crtc_x ||
@@ -4921,33 +4938,33 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
 		      old_plane_state->crtc_w != new_plane_state->crtc_w ||
 		      old_plane_state->crtc_h != new_plane_state->crtc_h);
 
-	DRM_DEBUG_DRIVER("[PLANE:%d] PSR bb_changed:%d fb_changed:%d num_clips:%d\n",
-			 new_plane_state->plane->base.id,
-			 bb_changed, fb_changed, num_clips);
+	drm_dbg(plane->dev,
+		"[PLANE:%d] PSR bb_changed:%d fb_changed:%d num_clips:%d\n",
+		new_plane_state->plane->base.id,
+		bb_changed, fb_changed, num_clips);
 
-	if (num_clips || fb_changed || bb_changed) {
-		dirty_rects[i].x = new_plane_state->crtc_x;
-		dirty_rects[i].y = new_plane_state->crtc_y;
-		dirty_rects[i].width = new_plane_state->crtc_w;
-		dirty_rects[i].height = new_plane_state->crtc_h;
-		DRM_DEBUG_DRIVER("[PLANE:%d] PSR SU dirty rect at (%d, %d) size (%d, %d)\n",
-				 new_plane_state->plane->base.id,
-				 dirty_rects[i].x, dirty_rects[i].y,
-				 dirty_rects[i].width, dirty_rects[i].height);
-		i += 1;
+	if (num_clips) {
+		for (; i < num_clips; i++, clips++) {
+			fill_dc_dirty_rect(new_plane_state->plane,
+					   &dirty_rects[i], clips->x1,
+					   clips->y1, clips->x2 - clips->x1,
+					   clips->y2 - clips->y1, &i, false);
+		}
+	} else if (fb_changed || bb_changed) {
+		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
+				   new_plane_state->crtc_x,
+				   new_plane_state->crtc_y,
+				   new_plane_state->crtc_w,
+				   new_plane_state->crtc_h, &i, false);
 	}
 
 	/* Add old plane bounding-box if plane is moved or resized */
 	if (bb_changed) {
-		dirty_rects[i].x = old_plane_state->crtc_x;
-		dirty_rects[i].y = old_plane_state->crtc_y;
-		dirty_rects[i].width = old_plane_state->crtc_w;
-		dirty_rects[i].height = old_plane_state->crtc_h;
-		DRM_DEBUG_DRIVER("[PLANE:%d] PSR SU dirty rect at (%d, %d) size (%d, %d)\n",
-				old_plane_state->plane->base.id,
-				dirty_rects[i].x, dirty_rects[i].y,
-				dirty_rects[i].width, dirty_rects[i].height);
-		i += 1;
+		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
+				   old_plane_state->crtc_x,
+				   old_plane_state->crtc_y,
+				   old_plane_state->crtc_w,
+				   old_plane_state->crtc_h, &i, false);
 	}
 
 	flip_addrs->dirty_rect_count = i;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index e6854f7270a6..3c50b3ff7954 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1600,6 +1600,10 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 		drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
 						   supported_rotations);
 
+	if (dm->adev->ip_versions[DCE_HWIP][0] > IP_VERSION(3, 0, 1) &&
+	    plane->type != DRM_PLANE_TYPE_CURSOR)
+		drm_plane_enable_fb_damage_clips(plane);
+
 	drm_plane_helper_add(plane, &dm_plane_helper_funcs);
 
 #ifdef CONFIG_DRM_AMD_DC_HDR
-- 
2.38.1

