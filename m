Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E568C23EB16
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 12:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00A66E9BF;
	Fri,  7 Aug 2020 10:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537276E9BF;
 Fri,  7 Aug 2020 10:02:01 +0000 (UTC)
IronPort-SDR: n7xPsudaq2dyqyuQGu0vrWJe3booIqaWiNlxLP1lPNlvfmXpSx6KYcWnkiJ24LgqYRx/iEFCYa
 X9TuMTTXlzDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="132604166"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="132604166"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 03:02:01 -0700
IronPort-SDR: epNt71jN513OSiN8E/62ZWs4O1cV0HxD7N/1YFDHHXEtBmpbXilH+vMvIhXZihXju5PXgLPhLM
 QyB2DkTsiCxA==
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="468178403"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 07 Aug 2020 03:01:57 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 5/7] drm/i915: Add dedicated plane hook for async flip case
Date: Fri,  7 Aug 2020 15:05:49 +0530
Message-Id: <20200807093551.10673-6-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200807093551.10673-1-karthik.b.s@intel.com>
References: <20200807093551.10673-1-karthik.b.s@intel.com>
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

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_sprite.c | 25 +++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 2b2d96c59d7f..1c03546a4d2a 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -609,6 +609,24 @@ icl_program_input_csc(struct intel_plane *plane,
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
@@ -637,6 +655,13 @@ skl_program_plane(struct intel_plane *plane,
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
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
