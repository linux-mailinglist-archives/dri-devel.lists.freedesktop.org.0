Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A187778AF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 14:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3AD10E518;
	Thu, 10 Aug 2023 12:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1502D10E186;
 Thu, 10 Aug 2023 12:41:12 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Handle legacy cursor update as normal update
Date: Thu, 10 Aug 2023 14:41:05 +0200
Message-Id: <20230810124105.124395-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230810124105.124395-1-maarten.lankhorst@linux.intel.com>
References: <20230810124105.124395-1-maarten.lankhorst@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Abuse the vblank worker to make the changes as small as possible. We
need a way to sync flip_done, but if we wait on flip_done, all async
tests start failing.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c    | 21 ++++++++++++++------
 drivers/gpu/drm/i915/display/intel_crtc.h    |  6 ++++--
 drivers/gpu/drm/i915/display/intel_display.c | 10 +++++++---
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 182c6dd64f47..2adcce303271 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -389,8 +389,13 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 	return ret;
 }
 
-static bool intel_crtc_needs_vblank_work(const struct intel_crtc_state *crtc_state)
+static bool intel_crtc_needs_vblank_work(const struct intel_atomic_state *state,
+					 const struct intel_crtc_state *crtc_state)
 {
+	/* Always init for legacy cursor update, so we can sync on teardown */
+	if (state->base.legacy_cursor_update)
+		return true;
+
 	return crtc_state->hw.active &&
 		!intel_crtc_needs_modeset(crtc_state) &&
 		!crtc_state->preload_luts &&
@@ -438,7 +443,7 @@ void intel_wait_for_vblank_workers(struct intel_atomic_state *state)
 	int i;
 
 	for_each_new_intel_crtc_in_state(state, crtc, crtc_state, i) {
-		if (!intel_crtc_needs_vblank_work(crtc_state))
+		if (!intel_crtc_needs_vblank_work(state, crtc_state))
 			continue;
 
 		drm_vblank_work_flush(&crtc_state->vblank_work);
@@ -470,6 +475,7 @@ static int intel_mode_vblank_start(const struct drm_display_mode *mode)
 
 /**
  * intel_pipe_update_start() - start update of a set of display registers
+ * @state: the intel atomic state
  * @new_crtc_state: the new crtc state
  *
  * Mark the start of an update to pipe registers that should be updated
@@ -480,7 +486,8 @@ static int intel_mode_vblank_start(const struct drm_display_mode *mode)
  * until a subsequent call to intel_pipe_update_end(). That is done to
  * avoid random delays.
  */
-void intel_pipe_update_start(struct intel_crtc_state *new_crtc_state)
+void intel_pipe_update_start(struct intel_atomic_state *state,
+			     struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
@@ -497,7 +504,7 @@ void intel_pipe_update_start(struct intel_crtc_state *new_crtc_state)
 	if (new_crtc_state->do_async_flip)
 		return;
 
-	if (intel_crtc_needs_vblank_work(new_crtc_state))
+	if (intel_crtc_needs_vblank_work(state, new_crtc_state))
 		intel_crtc_vblank_work_init(new_crtc_state);
 
 	if (new_crtc_state->vrr.enable) {
@@ -631,13 +638,15 @@ static void dbg_vblank_evade(struct intel_crtc *crtc, ktime_t end) {}
 
 /**
  * intel_pipe_update_end() - end update of a set of display registers
+ * @state: the intel atomic state
  * @new_crtc_state: the new crtc state
  *
  * Mark the end of an update started with intel_pipe_update_start(). This
  * re-enables interrupts and verifies the update was actually completed
  * before a vblank.
  */
-void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
+void intel_pipe_update_end(struct intel_atomic_state *state,
+			   struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
 	enum pipe pipe = crtc->pipe;
@@ -665,7 +674,7 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 	 * Would be slightly nice to just grab the vblank count and arm the
 	 * event outside of the critical section - the spinlock might spin for a
 	 * while ... */
-	if (intel_crtc_needs_vblank_work(new_crtc_state)) {
+	if (intel_crtc_needs_vblank_work(state, new_crtc_state)) {
 		drm_vblank_work_schedule(&new_crtc_state->vblank_work,
 					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
 					 false);
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h b/drivers/gpu/drm/i915/display/intel_crtc.h
index 51a4c8df9e65..ca7f45a454a0 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.h
+++ b/drivers/gpu/drm/i915/display/intel_crtc.h
@@ -36,8 +36,10 @@ void intel_crtc_state_reset(struct intel_crtc_state *crtc_state,
 u32 intel_crtc_get_vblank_counter(struct intel_crtc *crtc);
 void intel_crtc_vblank_on(const struct intel_crtc_state *crtc_state);
 void intel_crtc_vblank_off(const struct intel_crtc_state *crtc_state);
-void intel_pipe_update_start(struct intel_crtc_state *new_crtc_state);
-void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state);
+void intel_pipe_update_start(struct intel_atomic_state *state,
+			     struct intel_crtc_state *new_crtc_state);
+void intel_pipe_update_end(struct intel_atomic_state *state,
+			   struct intel_crtc_state *new_crtc_state);
 void intel_wait_for_vblank_workers(struct intel_atomic_state *state);
 struct intel_crtc *intel_first_crtc(struct drm_i915_private *i915);
 struct intel_crtc *intel_crtc_for_pipe(struct drm_i915_private *i915,
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 763ab569d8f3..e1ca1f9c3941 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6604,7 +6604,7 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 	intel_crtc_planes_update_noarm(state, crtc);
 
 	/* Perform vblank evasion around commit operation */
-	intel_pipe_update_start(new_crtc_state);
+	intel_pipe_update_start(state, new_crtc_state);
 
 	commit_pipe_pre_planes(state, crtc);
 
@@ -6612,7 +6612,7 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 
 	commit_pipe_post_planes(state, crtc);
 
-	intel_pipe_update_end(new_crtc_state);
+	intel_pipe_update_end(state, new_crtc_state);
 
 	/*
 	 * We usually enable FIFO underrun interrupts as part of the
@@ -6895,6 +6895,9 @@ static void intel_atomic_cleanup_work(struct work_struct *work)
 	struct intel_crtc *crtc;
 	int i;
 
+	if (state->base.legacy_cursor_update)
+		intel_wait_for_vblank_workers(state);
+
 	for_each_old_intel_crtc_in_state(state, crtc, old_crtc_state, i)
 		intel_color_cleanup_commit(old_crtc_state);
 
@@ -7056,7 +7059,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	if (state->modeset)
 		intel_set_cdclk_post_plane_update(state);
 
-	intel_wait_for_vblank_workers(state);
+	if (!state->base.legacy_cursor_update)
+		intel_wait_for_vblank_workers(state);
 
 	/* FIXME: We should call drm_atomic_helper_commit_hw_done() here
 	 * already, but still need the state for the delayed optimization. To
-- 
2.39.2

