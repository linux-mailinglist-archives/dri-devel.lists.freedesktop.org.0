Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C09962684C6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 08:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B77D6E19C;
	Mon, 14 Sep 2020 06:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595F36E194;
 Mon, 14 Sep 2020 06:23:22 +0000 (UTC)
IronPort-SDR: Zag81CbZ7D+26VDVq4Yq2eARCEa9vREqZehrnxebzv6klRNoBM7EjreDRQEkiYT5tXoMegqgAY
 hhAoSLn510tg==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="146723829"
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="146723829"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 23:23:21 -0700
IronPort-SDR: RryNuodW25CZx5sSVPafwfA5UVWFO6sFdm4uaEGJNVljLCrqVd/PYMGHX7ZhFLtEJyp3lr3wW6
 atd8eG2YgUTA==
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="287536660"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 13 Sep 2020 23:23:17 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 4/8] drm/i915: Do not call drm_crtc_arm_vblank_event in
 async flips
Date: Mon, 14 Sep 2020 11:26:29 +0530
Message-Id: <20200914055633.21109-5-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200914055633.21109-1-karthik.b.s@intel.com>
References: <20200914055633.21109-1-karthik.b.s@intel.com>
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

v8: -Rebased.

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
