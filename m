Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F0962FF9B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 22:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0668210E7DA;
	Fri, 18 Nov 2022 21:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2042.outbound.protection.outlook.com [40.107.212.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46F610E24A;
 Fri, 18 Nov 2022 21:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yj6IfVGtnyVNnW8oqKP8J53KpeGmh5syE+7fXkUjLBNsQuFf17mgPp8/cmkxQ59db4An1RzWyk2tbAU5VLtjQgtXFS9aPyLYpOkU6TsrYnLJ2zbWHLkRuQsJNabBt1ISYIvms4NG/Sc6tScmshWVzkbLVUwnGAzOuTYy/6fAAa0LSC/35xSfgBQfDuM6DbVK+CaIZl8KGlxZLCfIZzCf5tQXYagjcuZ8dL1HcfKtbxVRpMDzFYczPdZrP234I2xahHMUoIXx+4I9xzduXTsjwvh/+QcIbb9pn35Z8xzZQ/sT92GIrWuc46w1PanI2au7u0c1+VyVNLRwEWZ988RKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TN+LEcCPasczGrmb5BGjnxEIin6AytL38QYneJCnwvA=;
 b=NE93/rqP/zeQ2rDboh6qGrzcYXRrXnFLgovkCyMS4lC7QliNWkaF76nqvYIQ58QrkFtkuUfNxS1zGZ7PnOScdmPmcjCz2zoHt0pCrjXxK76hkaQP1IsF0XPH5DjS0Kfl2NndkBDcztVrwjOXn9DWK+k9RC/LbGyTdGgTyULTz1RYjf4Q3lN9/oG9U55To421pee+1eQk1WZdS50HrcTBQ3dJy5YgrHZlMca1lj21VZqFNNdAyuTsM0wKb6iYj4dZBhW3XUuLOCHMSdlxB4qePmeS53vQRAzLpOeB/MjM7kobRiKyW0+R4Pyj9atUe0yNEnsS/g3M0uX9Xoxvd1DLig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TN+LEcCPasczGrmb5BGjnxEIin6AytL38QYneJCnwvA=;
 b=M/lDAcGcnGBNRmUtHDl/Ia07hLqvokIuQ9kOHb3ZeDbJ+41WX9V4zg7rILq0JMnB8OBFjiggnoTsQd4zL9rQNh/I0vAxoV4Ugzptu0/ebnvy1xYCflGal+87JonS6AwC2Hyunq7+8qzaQmj6xrbMKsFTftOCZBMoxZjYsO6WO70=
Received: from MW4PR03CA0282.namprd03.prod.outlook.com (2603:10b6:303:b5::17)
 by SA3PR12MB7951.namprd12.prod.outlook.com (2603:10b6:806:318::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 21:51:25 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::54) by MW4PR03CA0282.outlook.office365.com
 (2603:10b6:303:b5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 21:51:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 21:51:24 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 15:51:23 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/display: add FB_DAMAGE_CLIPS support
Date: Fri, 18 Nov 2022 16:51:33 -0500
Message-ID: <20221118215137.384884-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT030:EE_|SA3PR12MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b503ab4-acc0-46f0-d134-08dac9af09f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2y6ef6mQ6pV3qS14Ak0jMibUjrjfFAN0Hh0H0TS5vkgd3naGT4mbknfOCfBnHRxLUuIiYBRtgrDKN4sf4wj2W8F0FThLxhoTytTDnG1L+vGfjusKdYnltOQzCTcXTQsDl65KAsMwlA4OKhltFjKNqt2T7ad34/Gq9Qlr9Vkuq6vaNb0EexdX7EfBIB95U9PkYgHNSvsCpFttDm1vxNS4MGrb53SACc+PGBYAy0422AaROFxmKAnjTnom5vp39qL+zZ2GaBzn5fDbj+pQ6ZAqxJOGVV017JfPfIqTIrcw0MerAZskHcOmMCxsqPLBGahQX30ZkF6RJ8b0ipzE93XIaUm64uWm8sKSZKmvlbp356zpvmJ1JIx3saMMfGAg+uPJ1ovUNg7G+k6nva7EVr7Xz3QSC5j6/xe42Vx9YU+9gbWB1zUBKLRDQ8sn6a+FZ/QutqM0bANFICJU2JHlPAAIFW/qu61nLZUvcMRmYd+XNlnyVdfqVmRdIkv0hbg/BOmZEhAiPF/feTbCLkTnH/MEbefxEE6RrHMKkpnZXtL2JIlnaVQ6/s8GMDsjrrYaswlZN/bbb60xWr16dyrzM4qOYecky3gwavKhB2P14KJ3aUUlVuZX4GO1pU4ZmO09q+r8fG1qKYM+GO9Bc3INlTb4ncRYDALwX2qGjTs56KXdSOLkkIERKMzpB9jIIA1oRoxYRCgl/uoAUu6evbA8LtI2uHcuoAp35ilm9Q8HOhVaoYDwbkA4YN1IVYwPlKZVtL8SXL6hb8AonuLfO+y13Z0FWw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(6666004)(316002)(2906002)(54906003)(47076005)(6916009)(26005)(8676002)(70586007)(70206006)(8936002)(2616005)(478600001)(5660300002)(186003)(1076003)(336012)(16526019)(41300700001)(83380400001)(426003)(44832011)(4326008)(86362001)(356005)(81166007)(82740400003)(36860700001)(40460700003)(36756003)(82310400005)(40480700001)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 21:51:24.8323 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b503ab4-acc0-46f0-d134-08dac9af09f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7951
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
 Alex Deucher <alexander.deucher@amd.com>,
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
v2: fallback to FFU if we run into too many dirty rectangles, consider
    dirty rectangles in non MPO case and always add a dirty rectangle
    for the new plane if there are bb changes in the MPO case.
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 130 +++++++++++-------
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   4 +
 2 files changed, 88 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4eb8201a2608..7af94a2c6237 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4842,6 +4842,35 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
 	return 0;
 }
 
+static inline void fill_dc_dirty_rect(struct drm_plane *plane,
+				      struct rect *dirty_rect, int32_t x,
+				      int32_t y, int32_t width, int32_t height,
+				      int *i, bool ffu)
+{
+	if (*i > DC_MAX_DIRTY_RECTS)
+		return;
+
+	if (*i == DC_MAX_DIRTY_RECTS)
+		goto out;
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
+out:
+	(*i)++;
+}
+
 /**
  * fill_dc_dirty_rects() - Fill DC dirty regions for PSR selective updates
  *
@@ -4862,10 +4891,6 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
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
@@ -4876,12 +4901,11 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
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
@@ -4889,20 +4913,20 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
 	if (plane->type == DRM_PLANE_TYPE_CURSOR)
 		return;
 
-	/*
-	 * Today, we only consider MPO use-case for PSR SU. If MPO not
-	 * requested, and there is a plane update, do FFU.
-	 */
+	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
+	clips = drm_plane_get_damage_clips(new_plane_state);
+
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
+		if (!num_clips || num_clips > DC_MAX_DIRTY_RECTS)
+			goto ffu;
+
+		for (; flip_addrs->dirty_rect_count < num_clips; clips++)
+			fill_dc_dirty_rect(new_plane_state->plane,
+					   &dirty_rects[i], clips->x1,
+					   clips->y1, clips->x2 - clips->x1,
+					   clips->y2 - clips->y1,
+					   &flip_addrs->dirty_rect_count,
+					   false);
 		return;
 	}
 
@@ -4913,7 +4937,6 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
 	 * If plane is moved or resized, also add old bounding box to dirty
 	 * rects.
 	 */
-	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
 	fb_changed = old_plane_state->fb->base.id !=
 		     new_plane_state->fb->base.id;
 	bb_changed = (old_plane_state->crtc_x != new_plane_state->crtc_x ||
@@ -4921,36 +4944,51 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
 		      old_plane_state->crtc_w != new_plane_state->crtc_w ||
 		      old_plane_state->crtc_h != new_plane_state->crtc_h);
 
-	DRM_DEBUG_DRIVER("[PLANE:%d] PSR bb_changed:%d fb_changed:%d num_clips:%d\n",
-			 new_plane_state->plane->base.id,
-			 bb_changed, fb_changed, num_clips);
-
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
-	}
+	drm_dbg(plane->dev,
+		"[PLANE:%d] PSR bb_changed:%d fb_changed:%d num_clips:%d\n",
+		new_plane_state->plane->base.id,
+		bb_changed, fb_changed, num_clips);
 
-	/* Add old plane bounding-box if plane is moved or resized */
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
-	}
+		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
+				   new_plane_state->crtc_x,
+				   new_plane_state->crtc_y,
+				   new_plane_state->crtc_w,
+				   new_plane_state->crtc_h, &i, false);
+
+		/* Add old plane bounding-box if plane is moved or resized */
+		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
+				   old_plane_state->crtc_x,
+				   old_plane_state->crtc_y,
+				   old_plane_state->crtc_w,
+				   old_plane_state->crtc_h, &i, false);
+	}
+
+	if (num_clips) {
+		for (; i < num_clips; clips++)
+			fill_dc_dirty_rect(new_plane_state->plane,
+					   &dirty_rects[i], clips->x1,
+					   clips->y1, clips->x2 - clips->x1,
+					   clips->y2 - clips->y1, &i, false);
+	} else if (fb_changed && !bb_changed) {
+		fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
+				   new_plane_state->crtc_x,
+				   new_plane_state->crtc_y,
+				   new_plane_state->crtc_w,
+				   new_plane_state->crtc_h, &i, false);
+	}
+
+	if (i > DC_MAX_DIRTY_RECTS)
+		goto ffu;
 
 	flip_addrs->dirty_rect_count = i;
+	return;
+
+ffu:
+	fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[0], 0, 0,
+			   dm_crtc_state->base.mode.crtc_hdisplay,
+			   dm_crtc_state->base.mode.crtc_vdisplay,
+			   &flip_addrs->dirty_rect_count, true);
 }
 
 static void update_stream_scaling_settings(const struct drm_display_mode *mode,
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

