Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5C152103
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 20:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23ADA6E8DC;
	Tue,  4 Feb 2020 19:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB8C6E8DC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 19:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580844528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jN9F1jju3DTsHk55X7khAIcnUVHNVuohHBr9YCstd0=;
 b=h5TaUxzT3cCt5m7/SjSJbqSpL7xhY1jWozBsZs9YQZtnm6CkoCO21vzN0mdfIdlF3j3rJ4
 eYG4TGC+jvQPFeE+HtlEEiVQxcmB05xHDMwTFykR452yMOrjadB0TFd+gAheo8ptsB/UFi
 bPr7Gs0IhkFv/ErxP98Gx+kVWtzcCsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-MB4oF2nKOa63n1nomfd_3Q-1; Tue, 04 Feb 2020 14:28:38 -0500
X-MC-Unique: MB4oF2nKOa63n1nomfd_3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 599EB1005F74;
 Tue,  4 Feb 2020 19:28:36 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-90.bss.redhat.com
 [10.20.1.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F371D85750;
 Tue,  4 Feb 2020 19:28:34 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] Revert "drm/i915: Don't use VBT for detecting DPCD
 backlight controls"
Date: Tue,  4 Feb 2020 14:28:09 -0500
Message-Id: <20200204192823.111404-2-lyude@redhat.com>
In-Reply-To: <20200204192823.111404-1-lyude@redhat.com>
References: <20200204192823.111404-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 David Airlie <airlied@linux.ie>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit d2a4bb6f8bc8cf2d788adf7e59b5b52fe3a3333c.

So, turns out that this ended up just breaking things. While many
laptops incorrectly advertise themselves as supporting PWM backlight
controls, they actually will only work with DPCD backlight controls.
Unfortunately, it also seems there are a number of systems which
advertise DPCD backlight controls in their eDP DPCD but don't actually
support them. Talking with some laptop manufacturers has shown it might
be possible to probe this support via the EDID (!?!?) but I haven't been
able to confirm that this would work on any other manufacturer's
systems.

So in the mean time, we'll just revert this commit for now and go back
to the old way of doing things. Additionally, let's print out an info
message into the kernel log so that it's a little more obvious if a
system needs DPCD backlight controls enabled through a quirk (which
we'll introduce in the next commit).

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index e86feebef299..48276237b362 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -328,16 +328,15 @@ intel_dp_aux_display_control_capable(struct intel_connector *connector)
 int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
 {
 	struct intel_panel *panel = &intel_connector->panel;
-	enum intel_backlight_type type =
-		to_i915(intel_connector->base.dev)->vbt.backlight.type;
+	struct drm_i915_private *dev_priv = to_i915(intel_connector->base.dev);
 
 	if (i915_modparams.enable_dpcd_backlight == 0 ||
 	    (i915_modparams.enable_dpcd_backlight == -1 &&
-	     !intel_dp_aux_display_control_capable(intel_connector)))
+	    dev_priv->vbt.backlight.type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE))
 		return -ENODEV;
 
-	if (type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE)
-		DRM_DEBUG_DRIVER("Ignoring VBT backlight type\n");
+	if (!intel_dp_aux_display_control_capable(intel_connector))
+		return -ENODEV;
 
 	panel->backlight.setup = intel_dp_aux_setup_backlight;
 	panel->backlight.enable = intel_dp_aux_enable_backlight;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
