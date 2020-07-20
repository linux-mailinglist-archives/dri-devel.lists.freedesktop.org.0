Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B0A225DEA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 13:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E6B6E3B2;
	Mon, 20 Jul 2020 11:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522866E3AE;
 Mon, 20 Jul 2020 11:54:37 +0000 (UTC)
IronPort-SDR: zE7Q7cJMI3kIpiR+4+5xqvtx6edsKmcJ3TfeLZ2DKSiYsVF6Jh7jjOeQFB/mYoxdWwakgpLsLI
 GjqvsjS0RQwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="149048208"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="149048208"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 04:54:37 -0700
IronPort-SDR: oQvjozf8M/zTh1W2jhi4UrXpklUIGzMP4QZkcrNqrJtzJIcUFfL9aCEyj6Q4o7p7wzEP0ENZQn
 UMXsxBbGCKyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="431586729"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by orsmga004.jf.intel.com with ESMTP; 20 Jul 2020 04:54:34 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 4/5] drm/i915: Do not call drm_crtc_arm_vblank_event in
 async flips
Date: Mon, 20 Jul 2020 17:01:16 +0530
Message-Id: <20200720113117.16131-5-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200720113117.16131-1-karthik.b.s@intel.com>
References: <20200720113117.16131-1-karthik.b.s@intel.com>
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
Cc: paulo.r.zanoni@intel.com, Karthik B S <karthik.b.s@intel.com>,
 dri-devel@lists.freedesktop.org, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, daniel.vetter@intel.com, nicholas.kazlauskas@amd.com
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

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_sprite.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 3747482e8fa3..1c03546a4d2a 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -93,6 +93,9 @@ void intel_pipe_update_start(const struct intel_crtc_state *new_crtc_state)
 	DEFINE_WAIT(wait);
 	u32 psr_status;
 
+	if (new_crtc_state->uapi.async_flip)
+		goto irq_disable;
+
 	vblank_start = adjusted_mode->crtc_vblank_start;
 	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE)
 		vblank_start = DIV_ROUND_UP(vblank_start, 2);
@@ -206,7 +209,7 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 	 * Would be slightly nice to just grab the vblank count and arm the
 	 * event outside of the critical section - the spinlock might spin for a
 	 * while ... */
-	if (new_crtc_state->uapi.event) {
+	if (new_crtc_state->uapi.event && !new_crtc_state->uapi.async_flip) {
 		drm_WARN_ON(&dev_priv->drm,
 			    drm_crtc_vblank_get(&crtc->base) != 0);
 
@@ -220,6 +223,9 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 
 	local_irq_enable();
 
+	if (new_crtc_state->uapi.async_flip)
+		return;
+
 	if (intel_vgpu_active(dev_priv))
 		return;
 
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
