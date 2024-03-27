Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475D288DD68
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E05E10FAA9;
	Wed, 27 Mar 2024 12:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EUHZJBZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977A010FA9D;
 Wed, 27 Mar 2024 12:08:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 10CC3614DE;
 Wed, 27 Mar 2024 12:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21DEC433F1;
 Wed, 27 Mar 2024 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541304;
 bh=Wp12HwnVgqjIodZEeoklA6PNqKVXhq1zx0jbICtLY3k=;
 h=From:To:Cc:Subject:Date:From;
 b=EUHZJBZ4gPMjbTkK470sU4VEHnjGenAOZWPEH1YdDs+PgkqVPGRxmLmpNftMvCghj
 IAaequNd4e4dxR+ECfhwt3iw+gH34dKgkofzM8X3a2DzU7+SmlM2YFyayWp6PqJ4Jn
 FEGLe/8xYKFCJzNCqoRT2fna9d3lFSvINaSAfgr/iiLEMU21sUvD35sZesnubekw+n
 qutHfs12sB8ceu7rEWmrjWaHLuJwWikcQDOYByhKsjiYX7SJXNHFzDWDG9NljM8+bQ
 NDAjjyLEBfI5ldxS1prADBEdeaUCKJE3syzeydrjTYMeNKgPgbYFJKKjkwpeb4X03o
 7j/EA7otMrz1Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	hamza.mahfooz@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amdgpu: make damage clips support configurable"
 failed to apply to 6.7-stable tree
Date: Wed, 27 Mar 2024 08:08:22 -0400
Message-ID: <20240327120822.2826140-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
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

The patch below does not apply to the 6.7-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From fc184dbe9fd99ad2dfb197b6fe18768bae1774b1 Mon Sep 17 00:00:00 2001
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
Date: Thu, 8 Feb 2024 16:23:29 -0500
Subject: [PATCH] drm/amdgpu: make damage clips support configurable

We have observed that there are quite a number of PSR-SU panels on the
market that are unable to keep up with what user space throws at them,
resulting in hangs and random black screens. So, make damage clips
support configurable and disable it by default for PSR-SU displays.

Cc: stable@vger.kernel.org
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 13 +++++++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 312dfaec7b4a7..1291b8eb9dffa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -198,6 +198,7 @@ extern uint amdgpu_dc_debug_mask;
 extern uint amdgpu_dc_visual_confirm;
 extern uint amdgpu_dm_abm_level;
 extern int amdgpu_backlight;
+extern int amdgpu_damage_clips;
 extern struct amdgpu_mgpu_info mgpu_info;
 extern int amdgpu_ras_enable;
 extern uint amdgpu_ras_mask;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 161ecf9b41747..6ef7f22c1152c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -211,6 +211,7 @@ int amdgpu_seamless = -1; /* auto */
 uint amdgpu_debug_mask;
 int amdgpu_agp = -1; /* auto */
 int amdgpu_wbrf = -1;
+int amdgpu_damage_clips = -1; /* auto */
 
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
@@ -859,6 +860,18 @@ int amdgpu_backlight = -1;
 MODULE_PARM_DESC(backlight, "Backlight control (0 = pwm, 1 = aux, -1 auto (default))");
 module_param_named(backlight, amdgpu_backlight, bint, 0444);
 
+/**
+ * DOC: damageclips (int)
+ * Enable or disable damage clips support. If damage clips support is disabled,
+ * we will force full frame updates, irrespective of what user space sends to
+ * us.
+ *
+ * Defaults to -1 (where it is enabled unless a PSR-SU display is detected).
+ */
+MODULE_PARM_DESC(damageclips,
+		 "Damage clips support (0 = disable, 1 = enable, -1 auto (default))");
+module_param_named(damageclips, amdgpu_damage_clips, int, 0444);
+
 /**
  * DOC: tmz (int)
  * Trusted Memory Zone (TMZ) is a method to protect data being written
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b7a717c3682f9..f9a7a16f1ec21 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5254,6 +5254,7 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
 				struct drm_plane_state *new_plane_state,
 				struct drm_crtc_state *crtc_state,
 				struct dc_flip_addrs *flip_addrs,
+				bool is_psr_su,
 				bool *dirty_regions_changed)
 {
 	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
@@ -5278,6 +5279,10 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
 	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
 	clips = drm_plane_get_damage_clips(new_plane_state);
 
+	if (num_clips && (!amdgpu_damage_clips || (amdgpu_damage_clips < 0 &&
+						   is_psr_su)))
+		goto ffu;
+
 	if (!dm_crtc_state->mpo_requested) {
 		if (!num_clips || num_clips > DC_MAX_DIRTY_RECTS)
 			goto ffu;
@@ -8412,6 +8417,8 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			fill_dc_dirty_rects(plane, old_plane_state,
 					    new_plane_state, new_crtc_state,
 					    &bundle->flip_addrs[planes_count],
+					    acrtc_state->stream->link->psr_settings.psr_version ==
+					    DC_PSR_VERSION_SU_1,
 					    &dirty_rects_changed);
 
 			/*
-- 
2.43.0




