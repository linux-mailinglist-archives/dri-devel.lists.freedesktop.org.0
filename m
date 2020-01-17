Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259F61414CB
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 00:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2D58972D;
	Fri, 17 Jan 2020 23:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DA46F95E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 23:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579303334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/SHYbTc4mVQlnGSSRKlNXBA4512ItBob86hriSAwCo=;
 b=PQQUb8Anov88HLEqj9Uurmi51e/cPPe+8QtSPPQux6A2J4I2Tjz7Jvnx/OR16wRM7cXJIa
 Oc3UAOR38Seq3iiBIFsAezzWfYtyIkTTKrB5nEYlceD7q1ros9AY2eNfYkLgi3CAD0Jf/d
 LW4UbpJCJelGeU330ImargskCpQcNBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-W9xSDrvmNN6DIb-3p0VLUw-1; Fri, 17 Jan 2020 18:22:11 -0500
X-MC-Unique: W9xSDrvmNN6DIb-3p0VLUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 980228017CC;
 Fri, 17 Jan 2020 23:22:08 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-90.bss.redhat.com
 [10.20.1.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7315A5C1D8;
 Fri, 17 Jan 2020 23:22:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4] drm/i915: Don't use VBT for detecting DPCD backlight
 controls
Date: Fri, 17 Jan 2020 18:21:54 -0500
Message-Id: <20200117232155.135579-1-lyude@redhat.com>
In-Reply-To: <20200116211623.53799-5-lyude@redhat.com>
References: <20200116211623.53799-5-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 AceLan Kao <acelan.kao@canonical.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Perry Yuan <pyuan@redhat.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Despite the fact that the VBT appears to have a field for specifying
that a system is equipped with a panel that supports standard VESA
backlight controls over the DP AUX channel, so far every system we've
spotted DPCD backlight control support on doesn't actually set this
field correctly and all have it set to INTEL_BACKLIGHT_DISPLAY_DDI.

While we don't know the exact reason for this VBT misuse, talking with
some vendors indicated that there's a good number of laptop panels out
there that supposedly support both PWM backlight controls and DPCD
backlight controls as a workaround until Intel supports DPCD backlight
controls across platforms universally. This being said, the X1 Extreme
2nd Gen that I have here (note that Lenovo is not the hardware vendor
that informed us of this) PWM backlight controls are advertised, but
only DPCD controls actually function. I'm going to make an educated
guess here and say that on systems like this one, it's likely that PWM
backlight controls might have been intended to work but were never
really tested by QA.

Since we really need backlights to work without any extra module
parameters, let's take the risk here and rely on the standard DPCD caps
to tell us whether AUX backlight controls are supported or not. We still
check the VBT, just so we can print a debugging message on systems that
advertise DPCD backlight support on the panel but not in the VBT.

Changes since v3:
* Print a debugging message if we enable DPCD backlight control on a
  device which doesn't report DPCD backlight controls in it's VBT,
  instead of warning on custom panel backlight interfaces.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=112376
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Perry Yuan <pyuan@redhat.com>
Cc: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 77a759361c5c..0f8edc775375 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -328,15 +328,16 @@ intel_dp_aux_display_control_capable(struct intel_connector *connector)
 int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
 {
 	struct intel_panel *panel = &intel_connector->panel;
-	struct drm_i915_private *dev_priv = to_i915(intel_connector->base.dev);
+	enum intel_backlight_type type =
+		to_i915(intel_connector->base.dev)->vbt.backlight.type;
 
 	if (i915_modparams.enable_dpcd_backlight == 0 ||
 	    (i915_modparams.enable_dpcd_backlight == -1 &&
-	    dev_priv->vbt.backlight.type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE))
+	     !intel_dp_aux_display_control_capable(intel_connector)))
 		return -ENODEV;
 
-	if (!intel_dp_aux_display_control_capable(intel_connector))
-		return -ENODEV;
+	if (type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE)
+		DRM_DEBUG_DRIVER("Ignoring VBT backlight type\n");
 
 	panel->backlight.setup = intel_dp_aux_setup_backlight;
 	panel->backlight.enable = intel_dp_aux_enable_backlight;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
