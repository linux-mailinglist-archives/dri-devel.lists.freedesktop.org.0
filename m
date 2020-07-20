Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFDF225DE6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 13:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9875C6E3A2;
	Mon, 20 Jul 2020 11:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A5C6E39E;
 Mon, 20 Jul 2020 11:54:30 +0000 (UTC)
IronPort-SDR: p2kDtSLmd1BPpC5wkNqqlWsyCpcL55173TQYAidPPylO3tzCF8ZBresRMtKiDC6YFqbYqoL6qo
 Xd8MrroaqjAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="149048198"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="149048198"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 04:54:30 -0700
IronPort-SDR: F/ZF+qGSZH7rIodta1OBwHYPQW25uH+hedZc8ohDLJZt7nd5LcUecnlbImqz/T2VsVmn5OSMRH
 3cz1IZdIvkjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="431586719"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by orsmga004.jf.intel.com with ESMTP; 20 Jul 2020 04:54:27 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 2/5] drm/i915: Add support for async flips in I915
Date: Mon, 20 Jul 2020 17:01:14 +0530
Message-Id: <20200720113117.16131-3-karthik.b.s@intel.com>
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

Set the Async Address Update Enable bit in plane ctl
when async flip is requested.

v2: -Move the Async flip enablement to individual patch (Paulo)

v3: -Rebased.

v4: -Add separate plane hook for async flip case (Ville)

v5: -Rebased.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  6 +++++
 drivers/gpu/drm/i915/display/intel_sprite.c  | 25 ++++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h              |  1 +
 3 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b8ff032195d9..4773f39e5924 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4766,6 +4766,12 @@ u32 skl_plane_ctl(const struct intel_crtc_state *crtc_state,
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
 	u32 plane_ctl;
 
+	/* During Async flip, no other updates are allowed */
+	if (crtc_state->uapi.async_flip) {
+		plane_ctl |= PLANE_CTL_ASYNC_FLIP;
+		return plane_ctl;
+	}
+
 	plane_ctl = PLANE_CTL_ENABLE;
 
 	if (INTEL_GEN(dev_priv) < 10 && !IS_GEMINILAKE(dev_priv)) {
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index c26ca029fc0a..3747482e8fa3 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -603,6 +603,24 @@ icl_program_input_csc(struct intel_plane *plane,
 			  PLANE_INPUT_CSC_POSTOFF(pipe, plane_id, 2), 0x0);
 }
 
+static void
+skl_program_async_surface_address(struct drm_i915_private *dev_priv,
+				  const struct intel_plane_state *plane_state,
+				  enum pipe pipe, enum plane_id plane_id,
+				  u32 surf_addr)
+{
+	unsigned long irqflags;
+	u32 plane_ctl = plane_state->ctl;
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
@@ -631,6 +649,13 @@ skl_program_plane(struct intel_plane *plane,
 	u32 keymsk, keymax;
 	u32 plane_ctl = plane_state->ctl;
 
+	/* During Async flip, no other updates are allowed */
+	if (crtc_state->uapi.async_flip) {
+		skl_program_async_surface_address(dev_priv, plane_state,
+						  pipe, plane_id, surf_addr);
+		return;
+	}
+
 	plane_ctl |= skl_plane_ctl_crtc(crtc_state);
 
 	if (INTEL_GEN(dev_priv) >= 10 || IS_GEMINILAKE(dev_priv))
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 8cee06314d5d..19aad4199874 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -6935,6 +6935,7 @@ enum {
 #define   PLANE_CTL_TILED_X			(1 << 10)
 #define   PLANE_CTL_TILED_Y			(4 << 10)
 #define   PLANE_CTL_TILED_YF			(5 << 10)
+#define   PLANE_CTL_ASYNC_FLIP			(1 << 9)
 #define   PLANE_CTL_FLIP_HORIZONTAL		(1 << 8)
 #define   PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE	(1 << 4) /* TGL+ */
 #define   PLANE_CTL_ALPHA_MASK			(0x3 << 4) /* Pre-GLK */
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
