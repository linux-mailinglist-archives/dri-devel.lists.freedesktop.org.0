Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F525D841
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 14:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A516EB80;
	Fri,  4 Sep 2020 12:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C676EB7F;
 Fri,  4 Sep 2020 12:00:43 +0000 (UTC)
IronPort-SDR: 4bvZTGq7DEnvjBl/Dykr26HASf7SCi4+J+xowZ15rygowbrzVyw/Gay4FQnB8zV/09RFtU2k9q
 PnQ+LDgiCuVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="242548387"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="242548387"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 05:00:42 -0700
IronPort-SDR: moXPcQpQz75ZSNqDnpDXSjTQRkmEEqMhsIXFgtEg5N+X4dfY/yD14/AuAzF0ajSxzmcgBMYt67
 QHnilZPOMnjA==
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="298389931"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 04 Sep 2020 05:00:36 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 4/7] drm/i915: Do not call drm_crtc_arm_vblank_event in
 async flips
Date: Fri,  4 Sep 2020 17:03:27 +0530
Message-Id: <20200904113330.19815-5-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200904113330.19815-1-karthik.b.s@intel.com>
References: <20200904113330.19815-1-karthik.b.s@intel.com>
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the flip done event will be sent in the flip_done_handler,
no need to add the event to the list and delay it for later.

v2: -Moved the async check above vblank_get as it
     was causing issues for PSR.

v3: -No need to wait for vblank to pass, as this wait was causing a
     16ms delay once every few flips.

v4: -Rebased.

v5: -Rebased.

v6: -Rebased.

v7: -No need of irq disable if we are not doing vblank evade. (Ville)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_sprite.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 5ac0dbf0e03d..f0c89418d2e1 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -93,6 +93,9 @@ void intel_pipe_update_start(const struct intel_crtc_state *new_crtc_state)
 	DEFINE_WAIT(wait);
 	u32 psr_status;
 
+	if (new_crtc_state->uapi.async_flip)
+		return;
+
 	vblank_start = adjusted_mode->crtc_vblank_start;
 	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE)
 		vblank_start = DIV_ROUND_UP(vblank_start, 2);
@@ -202,6 +205,9 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 
 	trace_intel_pipe_update_end(crtc, end_vbl_count, scanline_end);
 
+	if (new_crtc_state->uapi.async_flip)
+		return;
+
 	/* We're still in the vblank-evade critical section, this can't race.
 	 * Would be slightly nice to just grab the vblank count and arm the
 	 * event outside of the critical section - the spinlock might spin for a
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
