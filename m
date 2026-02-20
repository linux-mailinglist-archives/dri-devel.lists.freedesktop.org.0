Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHsEIkQdmGnp/wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:37:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A35165BE5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C3E10E7B5;
	Fri, 20 Feb 2026 08:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Qj2LZr9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D0210E7B2;
 Fri, 20 Feb 2026 08:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1771576636;
 bh=rjmJqsTeOBziWii1BOThh4DnZ/kSdPIBV3Tloha9GFQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qj2LZr9ignIVTDc9GxLR54xac2TZ6OFnrInOdaWscWRON8ZsjKmoRVPOecVOceX71
 S9xxVIWPGs27payYpTm4N4FrXqnYnjVarkDsAqGCdlld+ekP2FTIEGgwP8tHgzidNP
 +Fe7axNSZMsd/LqYLSYxi+VoJu0AsTx5VXuA1rUi+nhR6lm4j+JzDZ1L5QIvv9fJXq
 DE90fOsZsCwaKim3Dv+HWeBU1DnreJkNURJq/3ScxKTGDV013XLx2Bzs2Ab1LDd/Lf
 LU8uxzEYKD1jPDD73/zQZAw1keqZkKDRNUgbp4+ap0Je0a3DQsYNgxR6iXcfDHqi/p
 MSHwQP9vKq6Xw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [i915-rt v6 06/24] drm/i915/display: Remove locking from
 intel_vblank_evade critical section
Date: Fri, 20 Feb 2026 09:37:04 +0100
Message-ID: <20260220083657.28815-32-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220083657.28815-26-dev@lankhorst.se>
References: <20260220083657.28815-26-dev@lankhorst.se>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lankhorst.se,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lankhorst.se:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lankhorst.se:+];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 02A35165BE5
X-Rspamd-Action: no action

finish_wait() may take a lock, which means that it can take any amount
of time. On PREEMPT-RT we should not be taking any lock after disabling
preemption, so ensure that the completion is done before disabling
interrupts.

This also has the benefit of making vblank evasion more deterministic,
by performing the final vblank check after all locking is done.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_crtc.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_vblank.c | 30 +++++++++------------
 drivers/gpu/drm/i915/display/intel_vblank.h |  1 +
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 36a9685958bad..36bcd79263b6f 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -688,7 +688,7 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	enum pipe pipe = crtc->pipe;
-	int scanline_end = intel_get_crtc_scanline(crtc);
+	int scanline_end = __intel_get_crtc_scanline(crtc);
 	u32 end_vbl_count = intel_crtc_get_vblank_counter(crtc);
 	ktime_t end_vbl_time = ktime_get();
 
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 1b7cfe226ff8f..73676d8ccec8b 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -241,7 +241,7 @@ int intel_crtc_scanline_offset(const struct intel_crtc_state *crtc_state)
  * intel_de_read_fw(), only for fast reads of display block, no need for
  * forcewake etc.
  */
-static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
+int __intel_get_crtc_scanline(struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(&crtc->base);
@@ -732,6 +732,16 @@ void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
 		evade->min -= vblank_delay;
 }
 
+static bool scanline_in_safe_range(struct intel_vblank_evade_ctx *evade, int *scanline, bool unlocked)
+{
+	if (unlocked)
+		*scanline = intel_get_crtc_scanline(evade->crtc);
+	else
+		*scanline = __intel_get_crtc_scanline(evade->crtc);
+
+	return *scanline < evade->min || *scanline > evade->max;
+}
+
 /* must be called with vblank interrupt already enabled! */
 int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 {
@@ -739,24 +749,12 @@ int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 	struct intel_display *display = to_intel_display(crtc);
 	long timeout = msecs_to_jiffies_timeout(1);
 	wait_queue_head_t *wq = drm_crtc_vblank_waitqueue(&crtc->base);
-	DEFINE_WAIT(wait);
 	int scanline;
 
 	if (evade->min <= 0 || evade->max <= 0)
 		return 0;
 
-	for (;;) {
-		/*
-		 * prepare_to_wait() has a memory barrier, which guarantees
-		 * other CPUs can see the task state update by the time we
-		 * read the scanline.
-		 */
-		prepare_to_wait(wq, &wait, TASK_UNINTERRUPTIBLE);
-
-		scanline = intel_get_crtc_scanline(crtc);
-		if (scanline < evade->min || scanline > evade->max)
-			break;
-
+	while (!scanline_in_safe_range(evade, &scanline, false)) {
 		if (!timeout) {
 			drm_dbg_kms(display->drm,
 				    "Potential atomic update failure on pipe %c\n",
@@ -766,13 +764,11 @@ int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 
 		local_irq_enable();
 
-		timeout = schedule_timeout(timeout);
+		timeout = wait_event_timeout(*wq, scanline_in_safe_range(evade, &scanline, true), timeout);
 
 		local_irq_disable();
 	}
 
-	finish_wait(wq, &wait);
-
 	/*
 	 * On VLV/CHV DSI the scanline counter would appear to
 	 * increment approx. 1/3 of a scanline before start of vblank.
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.h b/drivers/gpu/drm/i915/display/intel_vblank.h
index 98d04cacd65f8..aa1974400e9fc 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.h
+++ b/drivers/gpu/drm/i915/display/intel_vblank.h
@@ -38,6 +38,7 @@ u32 g4x_get_vblank_counter(struct drm_crtc *crtc);
 bool intel_crtc_get_vblank_timestamp(struct drm_crtc *crtc, int *max_error,
 				     ktime_t *vblank_time, bool in_vblank_irq);
 int intel_get_crtc_scanline(struct intel_crtc *crtc);
+int __intel_get_crtc_scanline(struct intel_crtc *crtc);
 void intel_wait_for_pipe_scanline_stopped(struct intel_crtc *crtc);
 void intel_wait_for_pipe_scanline_moving(struct intel_crtc *crtc);
 void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
-- 
2.51.0

