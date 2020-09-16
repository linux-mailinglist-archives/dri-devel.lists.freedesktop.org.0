Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B08BE26C44F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EDC6EA4B;
	Wed, 16 Sep 2020 15:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFD96EA47;
 Wed, 16 Sep 2020 15:35:30 +0000 (UTC)
IronPort-SDR: 8VZfKqTlkabhNiFOq9McM5cTzACjQpwqL2Uj90Y23Im5fK88o2K1PGQkygsoh8Fc8ILOooGWAw
 +jJsZcUp5GFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="156882079"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="156882079"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 08:35:27 -0700
IronPort-SDR: 5ufx9KLbvcoaYo6dSlIu9XuZ9bfHYWQTwNfLywcZaOxQlTrMCmKfxd8+/i/BPj1exIOmR2tbQc
 TfsriIg2iN0w==
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="307081778"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 16 Sep 2020 08:35:23 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 6/8] drm/i915: WA for platforms with double buffered
 address update enable bit
Date: Wed, 16 Sep 2020 20:38:22 +0530
Message-Id: <20200916150824.15749-7-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200916150824.15749-1-karthik.b.s@intel.com>
References: <20200916150824.15749-1-karthik.b.s@intel.com>
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

v9: -Rename skl_toggle_async_sync() to skl_disable_async_flip_wa(). (Ville)
    -Place the declarations appropriately as per need. (Ville)
    -Take the lock before the reg read. (Ville)
    -Fix comment and formatting. (Ville)
    -Use IS_GEN_RANGE() for gen check. (Ville)
    -Move skl_disable_async_flip_wa() to intel_pre_plane_update(). (Ville)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 46 ++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 0f0bcbb00c7f..6f6edc581e14 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6562,6 +6562,43 @@ static void intel_post_plane_update(struct intel_atomic_state *state,
 		icl_wa_scalerclkgating(dev_priv, pipe, false);
 }
 
+static void skl_disable_async_flip_wa(struct intel_atomic_state *state,
+				      struct intel_crtc *crtc,
+				      const struct intel_crtc_state *new_crtc_state)
+{
+	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct intel_plane *plane;
+	struct intel_plane_state *new_plane_state;
+	int i;
+
+	for_each_new_intel_plane_in_state(state, plane, new_plane_state, i) {
+		u32 update_mask = new_crtc_state->update_planes;
+		u32 plane_ctl, surf_addr;
+		enum plane_id plane_id;
+		unsigned long irqflags;
+		enum pipe pipe;
+
+		if (crtc->pipe != plane->pipe ||
+		    !(update_mask & BIT(plane->id)))
+			continue;
+
+		plane_id = plane->id;
+		pipe = plane->pipe;
+
+		spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+		plane_ctl = intel_de_read_fw(dev_priv, PLANE_CTL(pipe, plane_id));
+		surf_addr = intel_de_read_fw(dev_priv, PLANE_SURF(pipe, plane_id));
+
+		plane_ctl &= ~PLANE_CTL_ASYNC_FLIP;
+
+		intel_de_write_fw(dev_priv, PLANE_CTL(pipe, plane_id), plane_ctl);
+		intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id), surf_addr);
+		spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	}
+
+	intel_wait_for_vblank(dev_priv, crtc->pipe);
+}
+
 static void intel_pre_plane_update(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
@@ -6647,6 +6684,15 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 	 */
 	if (IS_GEN(dev_priv, 2) && planes_disabling(old_crtc_state, new_crtc_state))
 		intel_set_cpu_fifo_underrun_reporting(dev_priv, pipe, false);
+
+	/*
+	 * WA for platforms where async address update enable bit
+	 * is double buffered and only latched at start of vblank.
+	 */
+	if (old_crtc_state->uapi.async_flip &&
+	    !new_crtc_state->uapi.async_flip &&
+	    IS_GEN_RANGE(dev_priv, 9, 10))
+		skl_disable_async_flip_wa(state, crtc, new_crtc_state);
 }
 
 static void intel_crtc_disable_planes(struct intel_atomic_state *state,
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
