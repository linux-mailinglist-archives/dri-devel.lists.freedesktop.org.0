Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6618111FB82
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 22:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EC389E8C;
	Sun, 15 Dec 2019 21:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD3589E0C
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 21:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576445593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wlgoT8tVMvuPYevJ9s7K4tjH+ipQ2fBdw3M/my+wFhw=;
 b=idgjLH07bdDcNhUZOs40wYMXGGGosZpHp2/bRtywu1d1WITmYXXhQAdbIi8fgnjcRjz+HC
 0qqgJrx5cjtIpfQU6s2UB3+z6uSCLM9VXn5we9A1Ivz163kdVZn8HpqlPEZqI/fHqE3q7H
 Seq44NgNunsu3iL/LLMbIXPWPmz4SZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-fkjYyRF8P0ibZpymBqtSWg-1; Sun, 15 Dec 2019 16:33:12 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A00181005502;
 Sun, 15 Dec 2019 21:33:10 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-49.ams2.redhat.com
 [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11CC75C28C;
 Sun, 15 Dec 2019 21:33:08 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/i915/dsi: Remove readback of panel orientation on BYT
 / CHT
Date: Sun, 15 Dec 2019 22:33:06 +0100
Message-Id: <20191215213307.689830-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: fkjYyRF8P0ibZpymBqtSWg-1
X-Mimecast-Spam-Score: 0
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 82daca297506 ("drm/i915: Add "panel orientation" property to the
panel connector, v6.") uses hardware state readback to determine if the
GOP is rotating the image by 180 degrees to compensate for upside-down
mounted panels.

When I wrote that commit I tried to find the VBT bits the GOP used to
decide to rotate the image, but I could not find them. Back then I only
looked at the rotation bits in struct mipi_config and these read 0 on
the 1 BYT device I have with an upside-down mounted panel
(a GP-electronic T701 tablet). While working on a similar problem on a
BYT device with an eDP panel I noticed that the new
intel_dsi_get_panel_orientation() helper which gets used on newer
SoCs (Apollo-Lake, etc.) checks the rotate_180 bit in the
BDB_GENERAL_FEATURES VBT block.

I've checked and this bit indeed is set on the GP-electronic T701 tablet,
so using the generic intel_dsi_get_panel_orientation() helper there does
the right thing without needing any extra readback of hw state.

This commit removes the special handling of the panel orientation for
DSI panels on BYT/CHT devices, bringing the handling in line with the
handling of DSI panels on other devices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 55 +-------------------------
 1 file changed, 1 insertion(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 0ca49b1604c6..18f7616e6c27 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1563,59 +1563,6 @@ static const struct drm_connector_funcs intel_dsi_connector_funcs = {
 	.atomic_duplicate_state = intel_digital_connector_duplicate_state,
 };
 
-static enum drm_panel_orientation
-vlv_dsi_get_hw_panel_orientation(struct intel_connector *connector)
-{
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	struct intel_encoder *encoder = connector->encoder;
-	enum intel_display_power_domain power_domain;
-	enum drm_panel_orientation orientation;
-	struct intel_plane *plane;
-	struct intel_crtc *crtc;
-	intel_wakeref_t wakeref;
-	enum pipe pipe;
-	u32 val;
-
-	if (!encoder->get_hw_state(encoder, &pipe))
-		return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
-
-	crtc = intel_get_crtc_for_pipe(dev_priv, pipe);
-	plane = to_intel_plane(crtc->base.primary);
-
-	power_domain = POWER_DOMAIN_PIPE(pipe);
-	wakeref = intel_display_power_get_if_enabled(dev_priv, power_domain);
-	if (!wakeref)
-		return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
-
-	val = I915_READ(DSPCNTR(plane->i9xx_plane));
-
-	if (!(val & DISPLAY_PLANE_ENABLE))
-		orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
-	else if (val & DISPPLANE_ROTATE_180)
-		orientation = DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
-	else
-		orientation = DRM_MODE_PANEL_ORIENTATION_NORMAL;
-
-	intel_display_power_put(dev_priv, power_domain, wakeref);
-
-	return orientation;
-}
-
-static enum drm_panel_orientation
-vlv_dsi_get_panel_orientation(struct intel_connector *connector)
-{
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	enum drm_panel_orientation orientation;
-
-	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
-		orientation = vlv_dsi_get_hw_panel_orientation(connector);
-		if (orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
-			return orientation;
-	}
-
-	return intel_dsi_get_panel_orientation(connector);
-}
-
 static void vlv_dsi_add_properties(struct intel_connector *connector)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -1633,7 +1580,7 @@ static void vlv_dsi_add_properties(struct intel_connector *connector)
 		connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
 
 		connector->base.display_info.panel_orientation =
-			vlv_dsi_get_panel_orientation(connector);
+			intel_dsi_get_panel_orientation(connector);
 		drm_connector_init_panel_orientation_property(
 				&connector->base,
 				connector->panel.fixed_mode->hdisplay,
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
