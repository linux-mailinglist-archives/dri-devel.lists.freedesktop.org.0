Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA1178519
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 22:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B656E95D;
	Tue,  3 Mar 2020 21:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114446E59F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 21:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583272421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PpaQSlL5pSAj9nf+y2H0OTdGptVUNf4Y09OND/PZJgQ=;
 b=PnpxF63tetoun825dXcG/S97q/Ct6T2+r6NbjpcodfwgoEZHX3BCJcgkDZpNVZpm2/3aJx
 GvF9ohVW8WRuDIxQntwbe82VLIYCEsFPUlHcyg1SYfqW+K3CaEuUfwsLkw+RZgp+r3iZ3D
 2Dzseg3pM5Drj59+pi/KtaoQNjJTY6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-n0yLHLsSPEGQq_jTByIryA-1; Tue, 03 Mar 2020 16:53:37 -0500
X-MC-Unique: n0yLHLsSPEGQq_jTByIryA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8C9B8010EA;
 Tue,  3 Mar 2020 21:53:34 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CA935C1D6;
 Tue,  3 Mar 2020 21:53:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/i915: Force DPCD backlight mode on X1 Extreme 2nd Gen
 4K AMOLED panel
Date: Tue,  3 Mar 2020 16:53:18 -0500
Message-Id: <20200303215320.93491-1-lyude@redhat.com>
In-Reply-To: <20200211183358.157448-3-lyude@redhat.com>
References: <20200211183358.157448-3-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The X1 Extreme is one of the systems that lies about which backlight
interface that it uses in its VBIOS as PWM backlight controls don't work
at all on this machine. It's possible that this panel could be one of
the infamous ones that can switch between PWM mode and DPCD backlight
control mode, but we haven't gotten any more details on this from Lenovo
just yet. For the time being though, making sure the backlight 'just
works' is a bit more important.

So, add a quirk to force DPCD backlight controls on for these systems
based on EDID (since this panel doesn't appear to fill in the device ID).
Hopefully in the future we'll figure out a better way of probing this.

Changes since v2:
* The bugzilla URL is deprecated, bug reporting happens on gitlab now.
  Update the messages we print to reflect this
* Also, take the opportunity to move FDO_BUG_URL out of i915_utils.c and
  into i915_utils.h so that other places which print things that aren't
  traditional errors but are worth filing bugs about, can actually use
  it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Adam Jackson <ajax@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c               |  4 ++++
 .../drm/i915/display/intel_dp_aux_backlight.c | 24 +++++++++++++++----
 drivers/gpu/drm/i915/i915_utils.c             |  1 -
 drivers/gpu/drm/i915/i915_utils.h             |  2 ++
 include/drm/drm_dp_helper.h                   | 10 ++++++++
 5 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 7be712c67aae..671f4d3968fc 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1295,6 +1295,10 @@ struct edid_quirk {
  * DP quirks in such cases.
  */
 static const struct edid_quirk edid_quirk_list[] = {
+	/* Optional 4K AMOLED panel in the ThinkPad X1 Extreme 2nd Generation
+	 * only supports DPCD backlight controls
+	 */
+	{ MFG(0x4c, 0x83), PROD_ID(0x41, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
 };
 
 #undef MFG
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 48276237b362..3e706bb850a8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -328,15 +328,31 @@ intel_dp_aux_display_control_capable(struct intel_connector *connector)
 int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
 {
 	struct intel_panel *panel = &intel_connector->panel;
-	struct drm_i915_private *dev_priv = to_i915(intel_connector->base.dev);
+	struct intel_dp *intel_dp = enc_to_intel_dp(intel_connector->encoder);
+	struct drm_device *dev = intel_connector->base.dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
 
 	if (i915_modparams.enable_dpcd_backlight == 0 ||
-	    (i915_modparams.enable_dpcd_backlight == -1 &&
-	    dev_priv->vbt.backlight.type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE))
+	    !intel_dp_aux_display_control_capable(intel_connector))
 		return -ENODEV;
 
-	if (!intel_dp_aux_display_control_capable(intel_connector))
+	/*
+	 * There are a lot of machines that don't advertise the backlight
+	 * control interface to use properly in their VBIOS, :\
+	 */
+	if (dev_priv->vbt.backlight.type !=
+	    INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE &&
+	    !drm_dp_has_quirk(&intel_dp->desc, intel_dp->edid_quirks,
+			      DP_QUIRK_FORCE_DPCD_BACKLIGHT)) {
+		DRM_DEV_INFO(dev->dev,
+			     "Panel advertises DPCD backlight support, but "
+			     "VBT disagrees. If your backlight controls "
+			     "don't work try booting with "
+			     "i915.enable_dpcd_backlight=1. If your machine "
+			     "needs this, please file a _new_ bug report on "
+			     "drm/i915, see " FDO_BUG_URL " for details.\n");
 		return -ENODEV;
+	}
 
 	panel->backlight.setup = intel_dp_aux_setup_backlight;
 	panel->backlight.enable = intel_dp_aux_enable_backlight;
diff --git a/drivers/gpu/drm/i915/i915_utils.c b/drivers/gpu/drm/i915/i915_utils.c
index 632d6953c78d..029854ae65fc 100644
--- a/drivers/gpu/drm/i915/i915_utils.c
+++ b/drivers/gpu/drm/i915/i915_utils.c
@@ -8,7 +8,6 @@
 #include "i915_drv.h"
 #include "i915_utils.h"
 
-#define FDO_BUG_URL "https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs"
 #define FDO_BUG_MSG "Please file a bug on drm/i915; see " FDO_BUG_URL " for details."
 
 void
diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index b0ade76bec90..cae0ae520398 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -34,6 +34,8 @@
 struct drm_i915_private;
 struct timer_list;
 
+#define FDO_BUG_URL "https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs"
+
 #undef WARN_ON
 /* Many gcc seem to no see through this and fall over :( */
 #if 0
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index abb04650f210..c6119e4c169a 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1538,6 +1538,16 @@ enum drm_dp_quirk {
 	 * The DSC caps can be read from the physical aux instead.
 	 */
 	DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD,
+	/**
+	 * @DP_QUIRK_FORCE_DPCD_BACKLIGHT:
+	 *
+	 * The device is telling the truth when it says that it uses DPCD
+	 * backlight controls, even if the system's firmware disagrees. This
+	 * quirk should be checked against both the ident and panel EDID.
+	 * When present, the driver should honor the DPCD backlight
+	 * capabilities advertised.
+	 */
+	DP_QUIRK_FORCE_DPCD_BACKLIGHT,
 };
 
 /**
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
