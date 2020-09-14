Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082D62684C9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 08:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142C96E1A3;
	Mon, 14 Sep 2020 06:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F036E1A3;
 Mon, 14 Sep 2020 06:23:35 +0000 (UTC)
IronPort-SDR: AumwqF4Zu2vLXikpIXcrtLPN6zhgsXrZWUjlZY2rHWEJDhjvmF/U/wiyw4l6DqvN3TSy3bkdyl
 pOh3Xn7yX5Rg==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="156426384"
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="156426384"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 23:23:34 -0700
IronPort-SDR: x/LTmurwOU1Qp4dDgx2H/H0yocppjQSnUKbMynsVEp2HCDn/P4ucEvvpxRlqrg5EZSdpCXuYGF
 ZYalWF3TOjmw==
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="287536693"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 13 Sep 2020 23:23:31 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 6/8] drm/i915: WA for platforms with double buffered adress
 update enable bit
Date: Mon, 14 Sep 2020 11:26:31 +0530
Message-Id: <20200914055633.21109-7-karthik.b.s@intel.com>
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

In Gen 9 and Gen 10 platforms, async address update enable bit is
double buffered. Due to this, during the transition from async flip
to sync flip we have to wait until this bit is updated before continuing
with the normal commit for sync flip.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a0c17d94daf3..b7e24dff0772 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -15360,6 +15360,42 @@ static void intel_enable_crtc(struct intel_atomic_state *state,
 	intel_crtc_enable_pipe_crc(crtc);
 }
 
+static void skl_toggle_async_sync(struct intel_atomic_state *state,
+				  struct intel_crtc *crtc,
+				  struct intel_crtc_state *new_crtc_state)
+{
+	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct intel_plane *plane;
+	struct intel_plane_state *new_plane_state;
+	u32 update_mask = new_crtc_state->update_planes;
+	u32 plane_ctl, surf_addr;
+	enum plane_id plane_id;
+	unsigned long irqflags;
+	enum pipe pipe;
+	int i;
+
+	for_each_new_intel_plane_in_state(state, plane, new_plane_state, i) {
+		if (crtc->pipe != plane->pipe ||
+		    !(update_mask & BIT(plane->id)))
+			continue;
+
+		plane_id = plane->id;
+		pipe = plane->pipe;
+
+		plane_ctl = intel_de_read_fw(dev_priv, PLANE_CTL(pipe, plane_id));
+		surf_addr = intel_de_read_fw(dev_priv, PLANE_SURF(pipe, plane_id));
+
+		plane_ctl &= ~PLANE_CTL_ASYNC_FLIP;
+
+		spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+		intel_de_write_fw(dev_priv, PLANE_CTL(pipe, plane_id), plane_ctl);
+		intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id), surf_addr);
+		spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	}
+
+	intel_wait_for_vblank(dev_priv, crtc->pipe);
+}
+
 static void intel_update_crtc(struct intel_atomic_state *state,
 			      struct intel_crtc *crtc)
 {
@@ -15387,6 +15423,14 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 	else
 		intel_fbc_enable(state, crtc);
 
+	/* WA for older platforms where async address update enable bit
+	 * is double buffered.
+	 */
+	if (old_crtc_state->uapi.async_flip &&
+	    !new_crtc_state->uapi.async_flip &&
+	    INTEL_GEN(dev_priv) <= 10 && INTEL_GEN(dev_priv) >= 9)
+		skl_toggle_async_sync(state, crtc, new_crtc_state);
+
 	/* Perform vblank evasion around commit operation */
 	intel_pipe_update_start(new_crtc_state);
 
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
