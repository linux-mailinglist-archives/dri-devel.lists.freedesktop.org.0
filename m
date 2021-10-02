Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E81341FD35
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 18:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4D76F4C8;
	Sat,  2 Oct 2021 16:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B0F6F4C8
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633192633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2+KDtrw05uj5F7fj7m/1ZjrRG+E6j0FTDlsU7SYouA=;
 b=jN8eDwtigzKqibjmLOFJigFUdx6Ur7t8ji6Yu00XncI+jsRHcY0svLAG4Ut2qZzEVbVJIW
 j7fzArrMoRHciMhUR8V2klqDzxSVbzzKOp/bZEX3WKV82u6hTG1kuzFELNIlAyqdvaRH3j
 b/vO9L/IlhRT9fdLSocw2zQt0K21uZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-bE3NcMSWPV6PXJ5FJHmu0w-1; Sat, 02 Oct 2021 12:37:10 -0400
X-MC-Unique: bE3NcMSWPV6PXJ5FJHmu0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 837D01006AA2;
 Sat,  2 Oct 2021 16:37:07 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5550100763D;
 Sat,  2 Oct 2021 16:37:03 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH 10/10] drm/i915: Add privacy-screen support (v2)
Date: Sat,  2 Oct 2021 18:36:18 +0200
Message-Id: <20211002163618.99175-11-hdegoede@redhat.com>
In-Reply-To: <20211002163618.99175-1-hdegoede@redhat.com>
References: <20211002163618.99175-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for eDP panels with a built-in privacy screen using the
new drm_privacy_screen class.

Changes in v2:
- Call drm_connector_update_privacy_screen() from
  intel_enable_ddi_dp() / intel_ddi_update_pipe_dp() instead of adding a
  for_each_new_connector_in_state() loop to intel_atomic_commit_tail()
- Move the probe-deferral check to the intel_modeset_probe_defer() helper

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c  |  1 +
 drivers/gpu/drm/i915/display/intel_ddi.c     |  3 +++
 drivers/gpu/drm/i915/display/intel_display.c | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c      | 10 ++++++++++
 4 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index b4e7ac51aa31..a62550711e98 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -139,6 +139,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 	    new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
 	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
 	    new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
+	    new_conn_state->base.privacy_screen_sw_state != old_conn_state->base.privacy_screen_sw_state ||
 	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state))
 		crtc_state->mode_changed = true;
 
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 51cd0420e00e..e4496c830a35 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -25,6 +25,7 @@
  *
  */
 
+#include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_scdc_helper.h>
 
 #include "i915_drv.h"
@@ -3022,6 +3023,7 @@ static void intel_enable_ddi_dp(struct intel_atomic_state *state,
 	if (port == PORT_A && DISPLAY_VER(dev_priv) < 9)
 		intel_dp_stop_link_train(intel_dp, crtc_state);
 
+	drm_connector_update_privacy_screen(conn_state);
 	intel_edp_backlight_on(crtc_state, conn_state);
 
 	if (!dig_port->lspcon.active || dig_port->dp.has_hdmi_sink)
@@ -3247,6 +3249,7 @@ static void intel_ddi_update_pipe_dp(struct intel_atomic_state *state,
 	intel_drrs_update(intel_dp, crtc_state);
 
 	intel_backlight_update(state, encoder, crtc_state, conn_state);
+	drm_connector_update_privacy_screen(conn_state);
 }
 
 void intel_ddi_update_pipe(struct intel_atomic_state *state,
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e67f3207ba54..9a5dbe51458d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -42,6 +42,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_drv.h>
@@ -12693,6 +12694,8 @@ void intel_modeset_driver_remove_nogem(struct drm_i915_private *i915)
 
 bool intel_modeset_probe_defer(struct pci_dev *pdev)
 {
+	struct drm_privacy_screen *privacy_screen;
+
 	/*
 	 * apple-gmux is needed on dual GPU MacBook Pro
 	 * to probe the panel if we're the inactive GPU.
@@ -12700,6 +12703,13 @@ bool intel_modeset_probe_defer(struct pci_dev *pdev)
 	if (vga_switcheroo_client_probe_defer(pdev))
 		return true;
 
+	/* If the LCD panel has a privacy-screen, wait for it */
+	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
+	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
+		return true;
+
+	drm_privacy_screen_put(privacy_screen);
+
 	return false;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 74a657ae131a..91207310dc0d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -37,6 +37,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_probe_helper.h>
 
 #include "g4x_dp.h"
@@ -4808,6 +4809,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	struct drm_connector *connector = &intel_connector->base;
 	struct drm_display_mode *fixed_mode = NULL;
 	struct drm_display_mode *downclock_mode = NULL;
+	struct drm_privacy_screen *privacy_screen;
 	bool has_dpcd;
 	enum pipe pipe = INVALID_PIPE;
 	struct edid *edid;
@@ -4902,6 +4904,14 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 				fixed_mode->hdisplay, fixed_mode->vdisplay);
 	}
 
+	privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
+	if (!IS_ERR(privacy_screen)) {
+		drm_connector_attach_privacy_screen_provider(connector,
+							     privacy_screen);
+	} else if (PTR_ERR(privacy_screen) != -ENODEV) {
+		drm_warn(&dev_priv->drm, "Error getting privacy-screen\n");
+	}
+
 	return true;
 
 out_vdd_off:
-- 
2.31.1

