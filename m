Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BF726F6E1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 09:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8056ECB9;
	Fri, 18 Sep 2020 07:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F67A6ECBB;
 Fri, 18 Sep 2020 07:27:18 +0000 (UTC)
IronPort-SDR: NjGw3azHbX8fa1ARNwtFUEeUkO5sp9Ok4K/psCsK8FvIMmP2+UbqNZQ+NkmAKzU48CB3GqjOUE
 PfgE3yxxANjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="160800708"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="160800708"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 00:27:13 -0700
IronPort-SDR: wALC1Vn5oiQ5T7p7JUOqfzIy+Y6fH72INNcpFZ684ZS3HeOVYsGZaC6k4iBuaH9F0nkafnzlbM
 H8W+sAQMJggw==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="508052788"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 18 Sep 2020 00:27:09 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 5/8] drm/i915: Add dedicated plane hook for async flip case
Date: Fri, 18 Sep 2020 12:30:45 +0530
Message-Id: <20200918070045.9703-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200916150824.15749-6-karthik.b.s@intel.com>
References: <20200916150824.15749-6-karthik.b.s@intel.com>
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

This hook is added to avoid writing other plane registers in case of
async flips, so that we do not write the double buffered registers
during async surface address update.

v7: -Plane ctl needs bits from skl_plane_ctl_crtc as well. (Ville)
    -Add a vfunc for skl_program_async_surface_address
     and call it from intel_update_plane. (Ville)

v8: -Rebased.

v9: -Use if-else instead of return in intel_update_plane(). (Ville)
    -Rename 'program_async_surface_address' to 'async_flip'. (Ville)

v10: -Check if async_flip hook is present before calling it.
      Otherwise it will OOPS during legacy cursor updates. (Ville)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c |  6 ++++-
 .../drm/i915/display/intel_display_types.h    |  3 +++
 drivers/gpu/drm/i915/display/intel_sprite.c   | 24 +++++++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 79032701873a..6bd8e6cdd477 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -408,7 +408,11 @@ void intel_update_plane(struct intel_plane *plane,
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 
 	trace_intel_update_plane(&plane->base, crtc);
-	plane->update_plane(plane, crtc_state, plane_state);
+
+	if (crtc_state->uapi.async_flip && plane->async_flip)
+		plane->async_flip(plane, crtc_state, plane_state);
+	else
+		plane->update_plane(plane, crtc_state, plane_state);
 }
 
 void intel_disable_plane(struct intel_plane *plane,
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 3d4bf9b6a0a2..e3339e41ddf7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1183,6 +1183,9 @@ struct intel_plane {
 			   struct intel_plane_state *plane_state);
 	int (*min_cdclk)(const struct intel_crtc_state *crtc_state,
 			 const struct intel_plane_state *plane_state);
+	void (*async_flip)(struct intel_plane *plane,
+			   const struct intel_crtc_state *crtc_state,
+			   const struct intel_plane_state *plane_state);
 };
 
 struct intel_watermark_params {
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 76a3d9bfe0de..3634e98b04c1 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -609,6 +609,29 @@ icl_program_input_csc(struct intel_plane *plane,
 			  PLANE_INPUT_CSC_POSTOFF(pipe, plane_id, 2), 0x0);
 }
 
+static void
+skl_program_async_surface_address(struct intel_plane *plane,
+				  const struct intel_crtc_state *crtc_state,
+				  const struct intel_plane_state *plane_state)
+{
+	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	unsigned long irqflags;
+	enum plane_id plane_id = plane->id;
+	enum pipe pipe = plane->pipe;
+	u32 surf_addr = plane_state->color_plane[0].offset;
+	u32 plane_ctl = plane_state->ctl;
+
+	plane_ctl |= skl_plane_ctl_crtc(crtc_state);
+
+	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+
+	intel_de_write_fw(dev_priv, PLANE_CTL(pipe, plane_id), plane_ctl);
+	intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id),
+			  intel_plane_ggtt_offset(plane_state) + surf_addr);
+
+	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+}
+
 static void
 skl_program_plane(struct intel_plane *plane,
 		  const struct intel_crtc_state *crtc_state,
@@ -3095,6 +3118,7 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 	plane->get_hw_state = skl_plane_get_hw_state;
 	plane->check_plane = skl_plane_check;
 	plane->min_cdclk = skl_plane_min_cdclk;
+	plane->async_flip = skl_program_async_surface_address;
 
 	if (INTEL_GEN(dev_priv) >= 11)
 		formats = icl_get_plane_formats(dev_priv, pipe,
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
