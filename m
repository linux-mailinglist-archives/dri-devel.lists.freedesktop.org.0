Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JteLU0dmGkvAAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:37:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F084165C56
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D8D10E7C9;
	Fri, 20 Feb 2026 08:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="bjQJWq97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3886610E7C5;
 Fri, 20 Feb 2026 08:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1771576648;
 bh=ogpuPvFiN/uJxrM0hHMOEESxZkHqG421Xa39+QVf0e8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bjQJWq97QxqQfuRkiSbLqcC4CIHD06zN7z8tINxrfDsDx5cRyoupJxRw6kaZ2NefJ
 0qd8qsL8B/sOBEXMBIVgcSNe+UcITyhEsqEU91BwVe9hl28r9fTgv0zRXCxGQQMqcr
 4YtUV0UHCzR5A40RCTnT/z2cnOd4S7Dq1B+i4j0lrO0otVt087oDgqz/M836kf1ZWH
 yrNW0hwNzIQGrq+pTDwXI1c5+Zg5UGqKhWgATN1ZzTqdB3eL/bpIsEIXYMMu0wyXD1
 Jer0HCXtz6kWAakAvDx3pWVHMdtPUL5VngfY7xBrP+1KcawGzU/0MzumDXmZ2wmpjP
 cWh8ZdWAda2YQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [i915-rt v6 13/24] drm/i915/display: Use intel_de_write_fw in
 intel_pipe_fastset
Date: Fri, 20 Feb 2026 09:37:11 +0100
Message-ID: <20260220083657.28815-39-dev@lankhorst.se>
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
X-Rspamd-Queue-Id: 5F084165C56
X-Rspamd-Action: no action

intel_set_pipe_src_size(), hsw_set_linetime_wm(),
intel_cpu_transcoder_set_m1_n1() and intel_set_transcoder_timings_lrr()
are called from an atomic context on PREEMPT_RT, and should be using the
_fw functions.

This likely prevents a deadlock on i915.

Again noticed when trying to disable preemption in vblank evasion:
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
<3> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1505, name: kms_cursor_lega
<3> preempt_count: 1, expected: 0
<3> RCU nest depth: 0, expected: 0
<4> 4 locks held by kms_cursor_lega/1505:
<4>  #0: ffffc90003c6f988 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x13b/0xe90
<4>  #1: ffffc90003c6f9b0 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_mode_atomic_ioctl+0x13b/0xe90
<4>  #2: ffff888135b838b8 (&intel_dp->psr.lock){+.+.}-{3:3}, at: intel_psr_lock+0xc5/0xf0 [xe]
<4>  #3: ffff88812607bbc0 (&wl->lock){+.+.}-{2:2}, at: intel_dmc_wl_get+0x3c/0x140 [xe]
<4> CPU: 6 UID: 0 PID: 1505 Comm: kms_cursor_lega Tainted: G     U              6.18.0-rc3-lgci-xe-xe-pw-156729v1+ #1 PREEMPT_{RT,(lazy)}
<4> Tainted: [U]=USER
<4> Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3383.D02.2509240621 09/24/2025
<4> Call Trace:
<4>  <TASK>
<4>  dump_stack_lvl+0xc1/0xf0
<4>  dump_stack+0x10/0x20
<4>  __might_resched+0x174/0x260
<4>  rt_spin_lock+0x63/0x200
<4>  ? intel_dmc_wl_get+0x3c/0x140 [xe]
<4>  intel_dmc_wl_get+0x3c/0x140 [xe]
<4>  intel_set_pipe_src_size+0x89/0xe0 [xe]
<4>  intel_update_crtc+0x3c1/0x950 [xe]
<4>  ? intel_pre_update_crtc+0x258/0x400 [xe]
<4>  skl_commit_modeset_enables+0x217/0x720 [xe]
<4>  intel_atomic_commit_tail+0xd4e/0x1af0 [xe]
<4>  ? lock_release+0xce/0x2a0
<4>  intel_atomic_commit+0x2e5/0x330 [xe]
<4>  ? intel_atomic_commit+0x2e5/0x330 [xe]
<4>  drm_atomic_commit+0xaf/0xf0
<4>  ? __pfx___drm_printfn_info+0x10/0x10
<4>  drm_mode_atomic_ioctl+0xbd5/0xe90
<4>  ? lock_acquire+0xc4/0x2e0
<4>  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
<4>  drm_ioctl_kernel+0xb6/0x120
<4>  drm_ioctl+0x2d7/0x5a0
<4>  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
<4>  ? rt_spin_unlock+0xa0/0x140
<4>  ? __pm_runtime_resume+0x53/0x90
<4>  xe_drm_ioctl+0x56/0x90 [xe]
<4>  __x64_sys_ioctl+0xa8/0x110
<4>  ? lock_acquire+0xc4/0x2e0
<4>  x64_sys_call+0x1144/0x26a0
<4>  do_syscall_64+0x93/0xae0
<4>  ? lock_release+0xce/0x2a0
<4>  ? __task_pid_nr_ns+0xd9/0x270
<4>  ? do_syscall_64+0x1b7/0xae0
<4>  ? find_held_lock+0x31/0x90
<4>  ? __task_pid_nr_ns+0xcf/0x270
<4>  ? __lock_acquire+0x43e/0x2860
<4>  ? __task_pid_nr_ns+0xd9/0x270
<4>  ? lock_acquire+0xc4/0x2e0
<4>  ? find_held_lock+0x31/0x90
<4>  ? __task_pid_nr_ns+0xcf/0x270
<4>  ? lock_release+0xce/0x2a0
<4>  ? __task_pid_nr_ns+0xd9/0x270
<4>  ? do_syscall_64+0x1b7/0xae0
<4>  ? do_syscall_64+0x1b7/0xae0
<4>  entry_SYSCALL_64_after_hwframe+0x76/0x7e

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_display.c | 36 ++++++++++----------
 drivers/gpu/drm/i915/display/intel_vrr.c     | 18 +++++-----
 2 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f224c9d7e0dfa..8fba2a8b6a6b5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1607,9 +1607,9 @@ static void hsw_set_linetime_wm(const struct intel_crtc_state *crtc_state)
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 
-	intel_de_write(display, WM_LINETIME(crtc->pipe),
-		       HSW_LINETIME(crtc_state->linetime) |
-		       HSW_IPS_LINETIME(crtc_state->ips_linetime));
+	intel_de_write_fw(display, WM_LINETIME(crtc->pipe),
+			  HSW_LINETIME(crtc_state->linetime) |
+			  HSW_IPS_LINETIME(crtc_state->ips_linetime));
 }
 
 static void hsw_set_frame_start_delay(const struct intel_crtc_state *crtc_state)
@@ -2606,14 +2606,14 @@ void intel_set_m_n(struct intel_display *display,
 		   i915_reg_t data_m_reg, i915_reg_t data_n_reg,
 		   i915_reg_t link_m_reg, i915_reg_t link_n_reg)
 {
-	intel_de_write(display, data_m_reg, TU_SIZE(m_n->tu) | m_n->data_m);
-	intel_de_write(display, data_n_reg, m_n->data_n);
-	intel_de_write(display, link_m_reg, m_n->link_m);
+	intel_de_write_fw(display, data_m_reg, TU_SIZE(m_n->tu) | m_n->data_m);
+	intel_de_write_fw(display, data_n_reg, m_n->data_n);
+	intel_de_write_fw(display, link_m_reg, m_n->link_m);
 	/*
 	 * On BDW+ writing LINK_N arms the double buffered update
 	 * of all the M/N registers, so it must be written last.
 	 */
-	intel_de_write(display, link_n_reg, m_n->link_n);
+	intel_de_write_fw(display, link_n_reg, m_n->link_n);
 }
 
 bool intel_cpu_transcoder_has_m2_n2(struct intel_display *display,
@@ -2800,9 +2800,9 @@ static void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc
 	}
 
 	if (DISPLAY_VER(display) >= 13) {
-		intel_de_write(display,
-			       TRANS_SET_CONTEXT_LATENCY(display, cpu_transcoder),
-			       crtc_state->set_context_latency);
+		intel_de_write_fw(display,
+				  TRANS_SET_CONTEXT_LATENCY(display, cpu_transcoder),
+				  crtc_state->set_context_latency);
 
 		/*
 		 * VBLANK_START not used by hw, just clear it
@@ -2818,9 +2818,9 @@ static void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc
 	 * The hardware actually ignores TRANS_VBLANK.VBLANK_END in DP mode.
 	 * But let's write it anyway to keep the state checker happy.
 	 */
-	intel_de_write(display, TRANS_VBLANK(display, cpu_transcoder),
-		       VBLANK_START(crtc_vblank_start - 1) |
-		       VBLANK_END(crtc_vblank_end - 1));
+	intel_de_write_fw(display, TRANS_VBLANK(display, cpu_transcoder),
+			  VBLANK_START(crtc_vblank_start - 1) |
+			  VBLANK_END(crtc_vblank_end - 1));
 	/*
 	 * For platforms that always use VRR Timing Generator, the VTOTAL.Vtotal
 	 * bits are not required. Since the support for these bits is going to
@@ -2834,9 +2834,9 @@ static void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc
 	 * The double buffer latch point for TRANS_VTOTAL
 	 * is the transcoder's undelayed vblank.
 	 */
-	intel_de_write(display, TRANS_VTOTAL(display, cpu_transcoder),
-		       VACTIVE(crtc_vdisplay - 1) |
-		       VTOTAL(crtc_vtotal - 1));
+	intel_de_write_fw(display, TRANS_VTOTAL(display, cpu_transcoder),
+			  VACTIVE(crtc_vdisplay - 1) |
+			  VTOTAL(crtc_vtotal - 1));
 
 	intel_vrr_set_fixed_rr_timings(crtc_state);
 	intel_vrr_transcoder_enable(crtc_state);
@@ -2853,8 +2853,8 @@ static void intel_set_pipe_src_size(const struct intel_crtc_state *crtc_state)
 	/* pipesrc controls the size that is scaled from, which should
 	 * always be the user's requested size.
 	 */
-	intel_de_write(display, PIPESRC(display, pipe),
-		       PIPESRC_WIDTH(width - 1) | PIPESRC_HEIGHT(height - 1));
+	intel_de_write_fw(display, PIPESRC(display, pipe),
+			  PIPESRC_WIDTH(width - 1) | PIPESRC_HEIGHT(height - 1));
 }
 
 static bool intel_pipe_is_interlaced(const struct intel_crtc_state *crtc_state)
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 00ca76dbdd6ce..128e19afc6c86 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -318,12 +318,12 @@ void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state)
 	if (!intel_vrr_possible(crtc_state))
 		return;
 
-	intel_de_write(display, TRANS_VRR_VMIN(display, cpu_transcoder),
-		       intel_vrr_fixed_rr_hw_vmin(crtc_state) - 1);
-	intel_de_write(display, TRANS_VRR_VMAX(display, cpu_transcoder),
-		       intel_vrr_fixed_rr_hw_vmax(crtc_state) - 1);
-	intel_de_write(display, TRANS_VRR_FLIPLINE(display, cpu_transcoder),
-		       intel_vrr_fixed_rr_hw_flipline(crtc_state) - 1);
+	intel_de_write_fw(display, TRANS_VRR_VMIN(display, cpu_transcoder),
+			  intel_vrr_fixed_rr_hw_vmin(crtc_state) - 1);
+	intel_de_write_fw(display, TRANS_VRR_VMAX(display, cpu_transcoder),
+			  intel_vrr_fixed_rr_hw_vmax(crtc_state) - 1);
+	intel_de_write_fw(display, TRANS_VRR_FLIPLINE(display, cpu_transcoder),
+			  intel_vrr_fixed_rr_hw_flipline(crtc_state) - 1);
 }
 
 static
@@ -896,8 +896,8 @@ static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 vrr_ctl;
 
-	intel_de_write(display, TRANS_PUSH(display, cpu_transcoder),
-		       trans_vrr_push(crtc_state, false));
+	intel_de_write_fw(display, TRANS_PUSH(display, cpu_transcoder),
+			  trans_vrr_push(crtc_state, false));
 
 	vrr_ctl = VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state);
 
@@ -909,7 +909,7 @@ static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
 	if (cmrr_enable)
 		vrr_ctl |= VRR_CTL_CMRR_ENABLE;
 
-	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
+	intel_de_write_fw(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
 }
 
 static void intel_vrr_tg_disable(const struct intel_crtc_state *old_crtc_state)
-- 
2.51.0

