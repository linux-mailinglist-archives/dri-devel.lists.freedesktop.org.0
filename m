Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CE6175398
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 07:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74E06E088;
	Mon,  2 Mar 2020 06:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30136E088;
 Mon,  2 Mar 2020 06:17:48 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z11so2189015wro.9;
 Sun, 01 Mar 2020 22:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qZX6eNe5HkMmSChWzrmVKNVjKK3cthTERj6hrUH2bxY=;
 b=KigeuDhKUMW2J6XPjus98AnmwZuNLDNXGGT1dEjoU8QERb0kLNtuer/wmBDD+lZzcb
 Y9Jpr428hhjTxojAknLZErVi6RYwXpMZx5pYCKa1yo9PXg7xFE+7qjmqP11kSM83aMJh
 aH6eMs8VUzqxmWI4SNIEOsW/l0oxODtAgjBqsArhZWfYPEGWuI0AtiuITSxVFuvB/rOr
 SFat0Ccj9wIWEUjIMIwEo5ycJX5hERXvREdY+4IASeVxgfMmUhNv1zi4DFAcQ9t0LRHT
 kiTYqB0o6AyewW30L5anuNy/OYOyddqveNiifu++uz8E3sv+lbil5wWZqljwx1mKntvf
 Rgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qZX6eNe5HkMmSChWzrmVKNVjKK3cthTERj6hrUH2bxY=;
 b=esVbNV8B81gKpWA2to/e0WE4ITUePqhYUKRK+9/Tb4buaeHDHaSZ8U2cgmQYPDuOa2
 keiBGjF0/5cahHMU23d4L3hZ3PawUxPY68VTT098GdVI15wyCZWIJImF9h6iFdN7lSEP
 UYhiXPuyCL0w+kcmakiP3VO7a67v7Ahl2RwZp8Lvkpwky1OLDgEpTsqvvWcn02Mei00b
 LGFF6Gr3V7B4DbYSKSFwlHaUnptaZ53GlR8EndxCVMCjZM9CCLBBLQt08zxDReijLWlw
 nAlzrZFqmJPQXhWr7PCQJx5ANLpsNMshQecVrJ6sGvyPaL5BsW5CvIZCh9aw9LMUWFcR
 8pXw==
X-Gm-Message-State: ANhLgQ1YJ6M91O66fI81gfaBJlPgIIrrP2c+ulR2K5Q0RrEbCtYVAQv4
 tQQ4Cueiua/PiMzNSv/kN1iMmnBI
X-Google-Smtp-Source: ADFU+vsOO+F6kYklX3dCV0b4TqDUX7tKgm24kUcKVCRveKna2tUGSNW2BSwW5QPvB34mtHOIuJaI5g==
X-Received: by 2002:a5d:638a:: with SMTP id p10mr2579994wru.42.1583129866908; 
 Sun, 01 Mar 2020 22:17:46 -0800 (PST)
Received: from groovy.localdomain (x4db66b9b.dyn.telefonica.de.
 [77.182.107.155])
 by smtp.gmail.com with ESMTPSA id t83sm7086194wmf.43.2020.03.01.22.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 22:17:46 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Fix pageflip event race condition for DCN.
Date: Mon,  2 Mar 2020 07:17:32 +0100
Message-Id: <20200302061732.28577-1-mario.kleiner.de@gmail.com>
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
this clock gating may happen if no planes are active. This suggests
that the problem addressed by that commit can't happen if planes
are active.

The proposed solution is therefore to only execute the extra pflip
completion code iff the count of active planes is zero and otherwise
leave pflip completion handling to the pflip irq handler, for a
more race-free experience.

Note that i don't know if this fixes the problem the original commit
tried to address, as i don't know what the test scenario was. It
does fix the observed too early pageflip events though and points
out the problem introduced.

Fixes: 16f17eda8bad ("drm/amd/display: Send vblank and user events at vsartup for DCN")
Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 63e8a12a74bc..3502d6d52160 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -522,8 +522,9 @@ static void dm_dcn_crtc_high_irq(void *interrupt_params)
 
 	acrtc_state = to_dm_crtc_state(acrtc->base.state);
 
-	DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
-				amdgpu_dm_vrr_active(acrtc_state));
+	DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d, planes:%d\n", acrtc->crtc_id,
+			 amdgpu_dm_vrr_active(acrtc_state),
+			 acrtc_state->active_planes);
 
 	amdgpu_dm_crtc_handle_crc_irq(&acrtc->base);
 	drm_crtc_handle_vblank(&acrtc->base);
@@ -543,7 +544,18 @@ static void dm_dcn_crtc_high_irq(void *interrupt_params)
 			&acrtc_state->vrr_params.adjust);
 	}
 
-	if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED) {
+	/*
+	 * If there aren't any active_planes then DCH HUBP may be clock-gated.
+	 * In that case, pageflip completion interrupts won't fire and pageflip
+	 * completion events won't get delivered. Prevent this by sending
+	 * pending pageflip events from here if a flip is still pending.
+	 *
+	 * If any planes are enabled, use dm_pflip_high_irq() instead, to
+	 * avoid race conditions between flip programming and completion,
+	 * which could cause too early flip completion events.
+	 */
+	if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED &&
+	    acrtc_state->active_planes == 0) {
 		if (acrtc->event) {
 			drm_crtc_send_vblank_event(&acrtc->base, acrtc->event);
 			acrtc->event = NULL;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
