Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531CC9E464B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 22:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DAC10E57E;
	Wed,  4 Dec 2024 21:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TyUd5/KS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446CF10E57C;
 Wed,  4 Dec 2024 21:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ogvLpNI8VC/gcasonSVpmrDSfrhLZqB7UaETy83T4KU=; b=TyUd5/KSivPHR/+r6zjhtysU1j
 k3l7KWXf5htogbMjUVUGSmGFVGLJqE5R7fyUYZQbUSukKx1C+3JsMMTmQQvE5wroNHdWBBb01toUm
 0+8FL5x0vKOn1H4sBNEK0eq4JfrI0fIah2lrYLiFw2x25eWhaoSh0eGGLUo61pm+SeIPiwuVA71Qk
 Wd6zSBcmeiESCLKvEjHcUz25lDKVFaG+YiH88IdzGNEuuuzMC55R5Ds3a0B8aMCjfszNhEX/EdUVl
 F/NXSITdTOFECbffapTiilo9s5JuxeH40Y7zmaEpkIM/KTFlMWKhF8PfFW1GQd+bm61U3AEX+Z/xo
 nXgDbMrA==;
Received: from [179.214.71.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tIwcy-00Ghe4-AC; Wed, 04 Dec 2024 22:09:45 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, zaeem.mohamed@amd.com,
 pekka.paalanen@collabora.com
Cc: mario.limonciello@amd.com, timur.kristof@gmail.com, victoria@system76.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [RFC PATCH 1/2] drm/amd/display: fix page fault due to max surface
 definition mismatch
Date: Wed,  4 Dec 2024 17:43:59 -0300
Message-ID: <20241204210929.1994522-2-mwen@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204210929.1994522-1-mwen@igalia.com>
References: <20241204210929.1994522-1-mwen@igalia.com>
MIME-Version: 1.0
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

DC driver is using two different values to define the maximum number of
surfaces: MAX_SURFACES and MAX_SURFACE_NUM. Consolidate MAX_SURFACES as
the unique definition for surface updates across DC.

It fixes page fault faced by Cosmic users on AMD display versions that
support two overlay planes, since the introduction of cursor overlay
mode.

[Nov26 21:33] BUG: unable to handle page fault for address: 0000000051d0f08b
[  +0.000015] #PF: supervisor read access in kernel mode
[  +0.000006] #PF: error_code(0x0000) - not-present page
[  +0.000005] PGD 0 P4D 0
[  +0.000007] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[  +0.000006] CPU: 4 PID: 71 Comm: kworker/u32:6 Not tainted 6.10.0+ #300
[  +0.000006] Hardware name: Valve Jupiter/Jupiter, BIOS F7A0131 01/30/2024
[  +0.000007] Workqueue: events_unbound commit_work [drm_kms_helper]
[  +0.000040] RIP: 0010:copy_stream_update_to_stream.isra.0+0x30d/0x750 [amdgpu]
[  +0.000847] Code: 8b 10 49 89 94 24 f8 00 00 00 48 8b 50 08 49 89 94 24 00 01 00 00 8b 40 10 41 89 84 24 08 01 00 00 49 8b 45 78 48 85 c0 74 0b <0f> b6 00 41 88 84 24 90 64 00 00 49 8b 45 60 48 85 c0 74 3b 48 8b
[  +0.000010] RSP: 0018:ffffc203802f79a0 EFLAGS: 00010206
[  +0.000009] RAX: 0000000051d0f08b RBX: 0000000000000004 RCX: ffff9f964f0a8070
[  +0.000004] RDX: ffff9f9710f90e40 RSI: ffff9f96600c8000 RDI: ffff9f964f000000
[  +0.000004] RBP: ffffc203802f79f8 R08: 0000000000000000 R09: 0000000000000000
[  +0.000005] R10: 0000000000000000 R11: 0000000000000000 R12: ffff9f96600c8000
[  +0.000004] R13: ffff9f9710f90e40 R14: ffff9f964f000000 R15: ffff9f96600c8000
[  +0.000004] FS:  0000000000000000(0000) GS:ffff9f9970000000(0000) knlGS:0000000000000000
[  +0.000005] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0.000005] CR2: 0000000051d0f08b CR3: 00000002e6a20000 CR4: 0000000000350ef0
[  +0.000005] Call Trace:
[  +0.000011]  <TASK>
[  +0.000010]  ? __die_body.cold+0x19/0x27
[  +0.000012]  ? page_fault_oops+0x15a/0x2d0
[  +0.000014]  ? exc_page_fault+0x7e/0x180
[  +0.000009]  ? asm_exc_page_fault+0x26/0x30
[  +0.000013]  ? copy_stream_update_to_stream.isra.0+0x30d/0x750 [amdgpu]
[  +0.000739]  ? dc_commit_state_no_check+0xd6c/0xe70 [amdgpu]
[  +0.000470]  update_planes_and_stream_state+0x49b/0x4f0 [amdgpu]
[  +0.000450]  ? srso_return_thunk+0x5/0x5f
[  +0.000009]  ? commit_minimal_transition_state+0x239/0x3d0 [amdgpu]
[  +0.000446]  update_planes_and_stream_v2+0x24a/0x590 [amdgpu]
[  +0.000464]  ? srso_return_thunk+0x5/0x5f
[  +0.000009]  ? sort+0x31/0x50
[  +0.000007]  ? amdgpu_dm_atomic_commit_tail+0x159f/0x3a30 [amdgpu]
[  +0.000508]  ? srso_return_thunk+0x5/0x5f
[  +0.000009]  ? amdgpu_crtc_get_scanout_position+0x28/0x40 [amdgpu]
[  +0.000377]  ? srso_return_thunk+0x5/0x5f
[  +0.000009]  ? drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x160/0x390 [drm]
[  +0.000058]  ? srso_return_thunk+0x5/0x5f
[  +0.000005]  ? dma_fence_default_wait+0x8c/0x260
[  +0.000010]  ? srso_return_thunk+0x5/0x5f
[  +0.000005]  ? wait_for_completion_timeout+0x13b/0x170
[  +0.000006]  ? srso_return_thunk+0x5/0x5f
[  +0.000005]  ? dma_fence_wait_timeout+0x108/0x140
[  +0.000010]  ? commit_tail+0x94/0x130 [drm_kms_helper]
[  +0.000024]  ? process_one_work+0x177/0x330
[  +0.000008]  ? worker_thread+0x266/0x3a0
[  +0.000006]  ? __pfx_worker_thread+0x10/0x10
[  +0.000004]  ? kthread+0xd2/0x100
[  +0.000006]  ? __pfx_kthread+0x10/0x10
[  +0.000006]  ? ret_from_fork+0x34/0x50
[  +0.000004]  ? __pfx_kthread+0x10/0x10
[  +0.000005]  ? ret_from_fork_asm+0x1a/0x30
[  +0.000011]  </TASK>

Fixes: 1b04dcc ("drm/amd/display: Introduce overlay cursor mode")
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3693
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c                | 2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c          | 8 ++++----
 drivers/gpu/drm/amd/display/dc/dc.h                     | 2 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h              | 2 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h               | 1 -
 drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c | 2 +-
 6 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index dc14c0d05e8f..bac8f17b8322 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -4510,7 +4510,7 @@ static bool commit_minimal_transition_based_on_current_context(struct dc *dc,
 	struct pipe_split_policy_backup policy;
 	struct dc_state *intermediate_context;
 	struct dc_state *old_current_state = dc->current_state;
-	struct dc_surface_update srf_updates[MAX_SURFACE_NUM] = {0};
+	struct dc_surface_update srf_updates[MAX_SURFACES] = {0};
 	int surface_count;
 
 	/*
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
index e006f816ff2f..1b2cce127981 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
@@ -483,9 +483,9 @@ bool dc_state_add_plane(
 	if (stream_status == NULL) {
 		dm_error("Existing stream not found; failed to attach surface!\n");
 		goto out;
-	} else if (stream_status->plane_count == MAX_SURFACE_NUM) {
+	} else if (stream_status->plane_count == MAX_SURFACES) {
 		dm_error("Surface: can not attach plane_state %p! Maximum is: %d\n",
-				plane_state, MAX_SURFACE_NUM);
+				plane_state, MAX_SURFACES);
 		goto out;
 	} else if (!otg_master_pipe) {
 		goto out;
@@ -600,7 +600,7 @@ bool dc_state_rem_all_planes_for_stream(
 {
 	int i, old_plane_count;
 	struct dc_stream_status *stream_status = NULL;
-	struct dc_plane_state *del_planes[MAX_SURFACE_NUM] = { 0 };
+	struct dc_plane_state *del_planes[MAX_SURFACES] = { 0 };
 
 	for (i = 0; i < state->stream_count; i++)
 		if (state->streams[i] == stream) {
@@ -875,7 +875,7 @@ bool dc_state_rem_all_phantom_planes_for_stream(
 {
 	int i, old_plane_count;
 	struct dc_stream_status *stream_status = NULL;
-	struct dc_plane_state *del_planes[MAX_SURFACE_NUM] = { 0 };
+	struct dc_plane_state *del_planes[MAX_SURFACES] = { 0 };
 
 	for (i = 0; i < state->stream_count; i++)
 		if (state->streams[i] == phantom_stream) {
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 1f9b6147c826..d487f317ea34 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1399,7 +1399,7 @@ struct dc_scratch_space {
 	 * store current value in plane states so we can still recover
 	 * a valid current state during dc update.
 	 */
-	struct dc_plane_state plane_states[MAX_SURFACE_NUM];
+	struct dc_plane_state plane_states[MAX_SURFACES];
 
 	struct dc_stream_state stream_state;
 };
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 413970588a26..860506c6bda4 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -56,7 +56,7 @@ struct dc_stream_status {
 	int plane_count;
 	int audio_inst;
 	struct timing_sync_info timing_sync_info;
-	struct dc_plane_state *plane_states[MAX_SURFACE_NUM];
+	struct dc_plane_state *plane_states[MAX_SURFACES];
 	bool is_abm_supported;
 	struct mall_stream_config mall_stream_config;
 	bool fpo_in_use;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 025ab521be25..f17870877968 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -76,7 +76,6 @@ struct dc_perf_trace {
 	unsigned long last_entry_write;
 };
 
-#define MAX_SURFACE_NUM 6
 #define NUM_PIXEL_FORMATS 10
 
 enum tiling_mode {
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
index 3d29169dd6bb..6b3b8803e0ae 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
@@ -813,7 +813,7 @@ static bool remove_all_phantom_planes_for_stream(struct dml2_context *ctx, struc
 {
 	int i, old_plane_count;
 	struct dc_stream_status *stream_status = NULL;
-	struct dc_plane_state *del_planes[MAX_SURFACE_NUM] = { 0 };
+	struct dc_plane_state *del_planes[MAX_SURFACES] = { 0 };
 
 	for (i = 0; i < context->stream_count; i++)
 			if (context->streams[i] == stream) {
-- 
2.45.2

