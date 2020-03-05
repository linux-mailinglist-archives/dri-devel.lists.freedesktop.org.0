Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF7917B08E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 22:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678146EC1C;
	Thu,  5 Mar 2020 21:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E4389D1D;
 Thu,  5 Mar 2020 21:20:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v9so2177037wrf.10;
 Thu, 05 Mar 2020 13:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pZnybnEF/d3gbhd4/QGhg8bQtBubgLyObGbldPWOJBI=;
 b=paqC1Gw1OKGVqJaVUl2yi6ee0BahA+VhP5MmCObMpNX5A3fD1OO4p0KKXQrn6Bhqsw
 DR2e+R0yODR4RG+XxTFkhHeHp/kguJdnTaJ3Ew09oqftTOvR1dZZae+F2p360zBLvYKL
 1nKc3M6SNBlwxfT/qCh345OA2GQGEWYBDQLjVdSFqJghgZDEHFnpLs1t3zqi1TIBaneM
 8FjEKLig1AvPdk1kY5wjQ1dQJR22WhsVZeuEDvhwOjObKu0S/cx8PyQr8656DQPgCtzD
 iycXsVb4AjEpdpDdQQGX8/reFmUXTEVsC84+K0ClFIm0vKbL7VL0yUI5Dq0YF6SW7Tr6
 pgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pZnybnEF/d3gbhd4/QGhg8bQtBubgLyObGbldPWOJBI=;
 b=UEHyvThuvbEu7IiLPiRAJzzNRFNMfmEbz5SN6wqDJc2b1gjcmoTXbt1i2v+501Kp1X
 noDJCBIH9y+alNCUjkH7lh841tuqEjMLvnQ9MmO1Ppl/iR+mnuCLTwsUVbl5NyyEd7jh
 2wKGywquxycRW3n+/VidDakSVbXG1g2jimCc/xm8Vx132yjEkM2oBSaosZKopzfsJJpw
 1XOiMk5YBtSLC/RbcGwcimlB1uxHDG3kexhdYa6UtZxwrUc6hPcXQuUvUTDceY1Rokpx
 OSVy8zPwsAg+/qhqWH9KmgzDXGqmeZK4KEU6qV3RFX/2vWDPNRq3Hq+iveZv9U0wXse/
 U/oQ==
X-Gm-Message-State: ANhLgQ2ynpwsfULwWmTx+doWSYFK0XtPuPgfQVXLfsRoIzsdS07hVGI4
 j4uHn/+/99kUfIkHoMa7ZaorrSoK
X-Google-Smtp-Source: ADFU+vu2xF5jKQoI8fql5zbCzOwFiFWbEqi+Z0kKrghu5M+0bMx332YDBPb3titwx9oxCFta8VbfdQ==
X-Received: by 2002:adf:f604:: with SMTP id t4mr869312wrp.96.1583443257521;
 Thu, 05 Mar 2020 13:20:57 -0800 (PST)
Received: from groovy.localdomain
 (dynamic-2a01-0c23-7c4d-d900-ac26-ebd4-fe30-e544.c23.pool.telefonica.de.
 [2a01:c23:7c4d:d900:ac26:ebd4:fe30:e544])
 by smtp.gmail.com with ESMTPSA id r19sm10242454wmh.26.2020.03.05.13.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 13:20:56 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Fix pageflip event race condition for DCN.
 (v2)
Date: Thu,  5 Mar 2020 22:20:44 +0100
Message-Id: <20200305212044.3857-1-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: sunpeng.li@amd.com, alexander.deucher@amd.com, hwentlan@amd.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit '16f17eda8bad ("drm/amd/display: Send vblank and user
events at vsartup for DCN")' introduces a new way of pageflip
completion handling for DCN, and some trouble.

The current implementation introduces a race condition, which
can cause pageflip completion events to be sent out one vblank
too early, thereby confusing userspace and causing flicker:

prepare_flip_isr():

1. Pageflip programming takes the ddev->event_lock.
2. Sets acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED
3. Releases ddev->event_lock.

--> Deadline for surface address regs double-buffering passes on
    target pipe.

4. dc_commit_updates_for_stream() MMIO programs the new pageflip
   into hw, but too late for current vblank.

=> pflip_status == AMDGPU_FLIP_SUBMITTED, but flip won't complete
   in current vblank due to missing the double-buffering deadline
   by a tiny bit.

5. VSTARTUP trigger point in vblank is reached, VSTARTUP irq fires,
   dm_dcn_crtc_high_irq() gets called.

6. Detects pflip_status == AMDGPU_FLIP_SUBMITTED and assumes the
   pageflip has been completed/will complete in this vblank and
   sends out pageflip completion event to userspace and resets
   pflip_status = AMDGPU_FLIP_NONE.

=> Flip completion event sent out one vblank too early.

This behaviour has been observed during my testing with measurement
hardware a couple of time.

The commit message says that the extra flip event code was added to
dm_dcn_crtc_high_irq() to prevent missing to send out pageflip events
in case the pflip irq doesn't fire, because the "DCH HUBP" component
is clock gated and doesn't fire pflip irqs in that state. Also that
this clock gating may happen if no planes are active. According to
Nicholas, the clock gating can also happen if psr is active, and the
gating is controlled independently by the hardware, so difficult to
detect if and when the completion code in above commit is needed.

This patch tries the following solution: It only executes the extra pflip
completion code in dm_dcn_crtc_high_irq() iff the hardware reports
that there aren't any surface updated pending in the double-buffered
surface scanout address registers. Otherwise it leaves pflip completion
to the pflip irq handler, for a more race-free experience.

This would only guard against the order of events mentioned above.
If Step 5 (VSTARTUP trigger) happens before step 4 then this won't help
at all, because 1-3 + 5 might happen even without the hw being programmed
at all, ie. no surface update pending because none yet programmed into hw.

Therefore this patch also changes locking in amdgpu_dm_commit_planes(),
so that prepare_flip_isr() and dc_commit_updates_for_stream() are done
under event_lock protection within the same critical section.

v2: Take Nicholas comments into account, try a different solution.

Lightly tested on Polaris (locking) and Raven (the whole DCN stuff).
Seems to work without causing obvious new trouble.

Fixes: 16f17eda8bad ("drm/amd/display: Send vblank and user events at vsartup for DCN")
Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 80 ++++++++++++++++---
 1 file changed, 67 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d7df1a85e72f..aa4e941b276f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -287,6 +287,28 @@ static inline bool amdgpu_dm_vrr_active(struct dm_crtc_state *dm_state)
 	       dm_state->freesync_config.state == VRR_STATE_ACTIVE_FIXED;
 }
 
+/**
+ * dm_crtc_is_flip_pending() - Is a pageflip pending on this crtc?
+ *
+ * Returns true if any plane on the crtc has a flip pending, false otherwise.
+ */
+static bool dm_crtc_is_flip_pending(struct dm_crtc_state *acrtc_state)
+{
+	struct dc_stream_status *status = dc_stream_get_status(acrtc_state->stream);
+	const struct dc_plane_status *plane_status;
+	int i;
+	bool pending = false;
+
+	for (i = 0; i < status->plane_count; i++) {
+		plane_status = dc_plane_get_status(status->plane_states[i]);
+		pending |= plane_status->is_flip_pending;
+		DRM_DEBUG_DRIVER("plane:%d, flip_pending=%d\n",
+				 i, plane_status->is_flip_pending);
+	}
+
+	return pending;
+}
+
 /**
  * dm_pflip_high_irq() - Handle pageflip interrupt
  * @interrupt_params: ignored
@@ -435,6 +457,11 @@ static void dm_vupdate_high_irq(void *interrupt_params)
 				spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
 			}
 		}
+
+		if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED) {
+			DRM_DEBUG_DRIVER("%s:crtc:%d, flip_pending=%d\n", __func__,
+					    acrtc->crtc_id, dm_crtc_is_flip_pending(acrtc_state));
+		}
 	}
 }
 
@@ -489,6 +516,11 @@ static void dm_crtc_high_irq(void *interrupt_params)
 				&acrtc_state->vrr_params.adjust);
 			spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
 		}
+
+		if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED) {
+			DRM_DEBUG_DRIVER("%s:crtc:%d, flip_pending=%d\n", __func__,
+					 acrtc->crtc_id, dm_crtc_is_flip_pending(acrtc_state));
+		}
 	}
 }
 
@@ -543,13 +575,29 @@ static void dm_dcn_crtc_high_irq(void *interrupt_params)
 			&acrtc_state->vrr_params.adjust);
 	}
 
-	if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED) {
+	/*
+	 * If there aren't any active_planes, or PSR is active, then DCH HUBP
+	 * may be clock-gated. In that state, pageflip completion interrupts
+	 * won't fire and pageflip completion events won't get delivered.
+	 *
+	 * Prevent this by sending pending pageflip events from here if a flip
+	 * has been submitted, but is no longer pending in hw, ie. has already
+	 * completed.
+	 *
+	 * If the flip is still pending in hw, then use dm_pflip_high_irq()
+	 * instead, handling completion as usual by pflip irq.
+	 */
+	if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED &&
+	    !dm_crtc_is_flip_pending(acrtc_state)) {
 		if (acrtc->event) {
 			drm_crtc_send_vblank_event(&acrtc->base, acrtc->event);
 			acrtc->event = NULL;
 			drm_crtc_vblank_put(&acrtc->base);
 		}
 		acrtc->pflip_status = AMDGPU_FLIP_NONE;
+
+		DRM_DEBUG_DRIVER("crtc:%d, pflip_stat:AMDGPU_FLIP_NONE\n",
+				 acrtc->crtc_id);
 	}
 
 	spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
@@ -6325,7 +6373,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			to_dm_crtc_state(drm_atomic_get_old_crtc_state(state, pcrtc));
 	int planes_count = 0, vpos, hpos;
 	long r;
-	unsigned long flags;
+	unsigned long flags = 0;
 	struct amdgpu_bo *abo;
 	uint64_t tiling_flags;
 	uint32_t target_vblank, last_flip_vblank;
@@ -6513,17 +6561,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			usleep_range(1000, 1100);
 		}
 
-		if (acrtc_attach->base.state->event) {
-			drm_crtc_vblank_get(pcrtc);
-
-			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
-
-			WARN_ON(acrtc_attach->pflip_status != AMDGPU_FLIP_NONE);
-			prepare_flip_isr(acrtc_attach);
-
-			spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
-		}
-
 		if (acrtc_state->stream) {
 			if (acrtc_state->freesync_vrr_info_changed)
 				bundle->stream_update.vrr_infopacket =
@@ -6575,6 +6612,15 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 				acrtc_state->stream->link->psr_allow_active)
 			amdgpu_dm_psr_disable(acrtc_state->stream);
 
+		if (pflip_present && acrtc_attach->base.state->event) {
+			drm_crtc_vblank_get(pcrtc);
+
+			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
+
+			WARN_ON(acrtc_attach->pflip_status != AMDGPU_FLIP_NONE);
+			prepare_flip_isr(acrtc_attach);
+		}
+
 		dc_commit_updates_for_stream(dm->dc,
 						     bundle->surface_updates,
 						     planes_count,
@@ -6582,6 +6628,14 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 						     &bundle->stream_update,
 						     dc_state);
 
+		/*
+		 * Must event_lock protect prepare_flip_isr() above and
+		 * dc_commit_updates_for_stream within same critical section,
+		 * or pageflip completion will suffer bad races on DCN.
+		 */
+		if (pflip_present && acrtc_attach->pflip_status == AMDGPU_FLIP_SUBMITTED)
+			spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
+
 		if ((acrtc_state->update_type > UPDATE_TYPE_FAST) &&
 						acrtc_state->stream->psr_version &&
 						!acrtc_state->stream->link->psr_feature_enabled)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
