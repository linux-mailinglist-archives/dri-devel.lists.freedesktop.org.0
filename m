Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5B926C44C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288C96EA46;
	Wed, 16 Sep 2020 15:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680356EA46;
 Wed, 16 Sep 2020 15:35:22 +0000 (UTC)
IronPort-SDR: 4zMixPZ1iAGCLEa0simkb43vVHbLbMnqjW9PLuP6A89LIx0QxEbtq19p8rq1N7TeERsiibyMed
 wnTWKHrtMS2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="139503635"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="139503635"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 08:35:21 -0700
IronPort-SDR: G3tjn0alPZipRmbFBcXZa94ZU+wOPupcn37BuE2xB/pEBOJaZddDJVB7S0uro++aN1hby03iTD
 3u4duDy7KlkQ==
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="307081750"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 16 Sep 2020 08:35:18 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 5/8] drm/i915: Add dedicated plane hook for async flip case
Date: Wed, 16 Sep 2020 20:38:21 +0530
Message-Id: <20200916150824.15749-6-karthik.b.s@intel.com>
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

This hook is added to avoid writing other plane registers in case of
async flips, so that we do not write the double buffered registers
during async surface address update.

v7: -Plane ctl needs bits from skl_plane_ctl_crtc as well. (Ville)
    -Add a vfunc for skl_program_async_surface_address
     and call it from intel_update_plane. (Ville)

v8: -Rebased.

v9: -Use if-else instead of return in intel_update_plane(). (Ville)
    -Rename 'program_async_surface_address' to 'async_flip'. (Ville)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c |  6 ++++-
 .../drm/i915/display/intel_display_types.h    |  3 +++
 drivers/gpu/drm/i915/display/intel_sprite.c   | 24 +++++++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 79032701873a..1171852dda5a 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -408,7 +408,11 @@ void intel_update_plane(struct intel_plane *plane,
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 
 	trace_intel_update_plane(&plane->base, crtc);
-	plane->update_plane(plane, crtc_state, plane_state);
+
+	if (crtc_state->uapi.async_flip)
+		plane->async_flip(plane, crtc_state, plane_state);
+	else
+		plane->update_plane(plane, crtc_state, plane_state);
 }
 
 void intel_disable_plane(struct intel_plane *plane,
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index b2d0edacc58c..67e48215d89e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1190,6 +1190,9 @@ struct intel_plane {
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
