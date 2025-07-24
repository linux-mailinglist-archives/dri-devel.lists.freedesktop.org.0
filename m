Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE02BB1100F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 18:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD01A10E99E;
	Thu, 24 Jul 2025 16:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=daenzer.net header.i=@daenzer.net header.b="3ITtXYlu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6336710E988;
 Thu, 24 Jul 2025 16:58:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; t=1753375955; x=1753980755; s=webland;
 d=daenzer.net; c=relaxed/relaxed; v=1;
 bh=1JOd5JZfwR3vxDwMVaP7/i6CZLsS7UNvvtXR27Ujn9w=;
 h=From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References;
 b=3ITtXYluOmi6fCsPuVukBZdF20n/b4yLJOYkzLwKpzUSypI/ah59uKKBnwL1ZjNEeKhJOn/2WA5QyWhzbdyiFRDUsToquWFk3EGuYqneHmVOXOEQMPCy7LD8bDSnqIE2XT4FVbWY2rodEyOkXYHL1wCMz1Aed7gwkbtKgntcqDQI3TlAe5fH9zbtaYRqKAIR5KiuPIYh4QiTqlP2n6mCBrxjB7XtRlex54BeR4sQaDxLX08/uu11qPy8+1uPJbeN9SgiQw36ajJHq96uOYgLK6L6oWMWSPGjfaboByjKuOinvBIa9Z4KT60DhFj36Otf2YF+DhOLYG8mRphmUHyPcQ==
Received: from kaveri ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202507241852340793; Thu, 24 Jul 2025 18:52:34 +0200
Received: from daenzer by kaveri with local (Exim 4.98.2)
 (envelope-from <michel@daenzer.net>) id 1uezBI-00000004zM8-2g7d;
 Thu, 24 Jul 2025 18:52:32 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Shankar@kaveri.local,
 Uma <uma.shankar@intel.com>, Xaver Hugl <xaver.hugl@kde.org>,
 victoria@system76.com, David Turner <david.turner@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amd/display: Update HW_DONE_DEADLINE property value
 on modeset
Date: Thu, 24 Jul 2025 18:40:31 +0200
Message-ID: <20250724165220.1189129-5-michel@daenzer.net>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250724165220.1189129-1-michel@daenzer.net>
References: <20250724165220.1189129-1-michel@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Michel Dänzer <mdaenzer@redhat.com>

Set it to the end of the front porch.

Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0b8ac9edc070..e78249b55345 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10021,6 +10021,21 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 	drm_writeback_queue_job(wb_conn, new_con_state);
 }
 
+static void
+update_hw_done_deadline(struct dm_crtc_state *dm_new_crtc_state)
+{
+	struct dc_stream_state *stream = dm_new_crtc_state->stream;
+	struct dc_crtc_timing *timing = &stream->timing;
+	struct drm_crtc *crtc = dm_new_crtc_state->base.crtc;
+	uint32_t deadline_lines, deadline_us;
+
+	/* XXX: My guess, AMD display team to the rescue! */
+	deadline_lines = timing->v_total - timing->v_addressable - timing->v_front_porch;
+	deadline_us = DIV_ROUND_UP(deadline_lines * stream->timing.h_total * 10000u,
+				   stream->timing.pix_clk_100hz);
+	drm_crtc_set_hw_done_deadline_property(crtc, deadline_us);
+}
+
 /**
  * amdgpu_dm_atomic_commit_tail() - AMDgpu DM's commit tail implementation.
  * @state: The atomic state to commit
@@ -10419,6 +10434,13 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	/* Signal HW programming completion */
 	drm_atomic_helper_commit_hw_done(state);
 
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		if (new_crtc_state->active &&
+		    (!old_crtc_state->active ||
+		     drm_atomic_crtc_needs_modeset(new_crtc_state)))
+			update_hw_done_deadline(to_dm_crtc_state(new_crtc_state));
+	}
+
 	if (wait_for_vblank)
 		drm_atomic_helper_wait_for_flip_done(dev, state);
 
-- 
2.50.0

