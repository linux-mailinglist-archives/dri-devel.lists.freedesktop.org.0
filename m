Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99830218D5C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 18:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5FB6E8F6;
	Wed,  8 Jul 2020 16:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E986E8F8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 16:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594226656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCCsKEGk6kEmf3+7zRhdihYeaCB8sW2XLhAbZRxyXwA=;
 b=NC8HHW3bqrXgW5w1eL1sicrwXOtfo5A6t4g3IvefbPydUm3f8vNe7FOSbsQkGIfP7OlkA4
 6ddb3YYoEuTYajbrWy9coWbWdndycibmFzJkmAw4b6NbJIU1cbPe4KIN9hgs4Z34qwWvhr
 kl+E5bHnEO93+7sbo5kTiSBPOcag8qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-AsqDOQktMqqxF4j4Crsh8A-1; Wed, 08 Jul 2020 12:44:12 -0400
X-MC-Unique: AsqDOQktMqqxF4j4Crsh8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21B9D1005510;
 Wed,  8 Jul 2020 16:44:11 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-5.ams2.redhat.com [10.36.112.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A32D65F7D8;
 Wed,  8 Jul 2020 16:44:08 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 9/9] drm/i915: Add privacy-screen support
Date: Wed,  8 Jul 2020 18:43:35 +0200
Message-Id: <20200708164335.25097-10-hdegoede@redhat.com>
In-Reply-To: <20200708164335.25097-1-hdegoede@redhat.com>
References: <20200708164335.25097-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for eDP panels with a built-in privacy screen using the
new drm_privacy_screen class.

One thing which stands out here is the addition of these 2 lines to
intel_atomic_commit_tail:

	for_each_new_connector_in_state(&state->base, connector, ...
		drm_connector_update_privacy_screen(connector, state);

It may seem more logical to instead take care of updating the
privacy-screen state by marking the crtc as needing a modeset and then
do this in both the encoder update_pipe (for fast-sets) and enable
(for full modesets) callbacks. But ATM these callbacks only get passed
the new connector_state and these callbacks are all called after
drm_atomic_helper_swap_state() at which point there is no way to get
the old state from the new state.

Without access to the old state, we do not know if the sw_state of
the privacy-screen has changes so we would need to call
drm_privacy_screen_set_sw_state() unconditionally. This is undesirable
since all current known privacy-screen providers use ACPI calls which
are somewhat expensive to make.

Also, as all providers use ACPI calls, rather then poking GPU registers,
there is no need to order this together with other encoder operations.
Since no GPU poking is involved having this as a separate step of the
commit process actually is the logical thing to do.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  5 +++++
 drivers/gpu/drm/i915/display/intel_dp.c      | 10 ++++++++++
 drivers/gpu/drm/i915/i915_pci.c              | 12 ++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9ea1a397d1b5..9e2b57e77118 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -15412,6 +15412,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	struct drm_device *dev = state->base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
+	struct drm_connector_state *new_connector_state;
+	struct drm_connector *connector;
 	struct intel_crtc *crtc;
 	u64 put_domains[I915_MAX_PIPES] = {};
 	intel_wakeref_t wakeref = 0;
@@ -15501,6 +15503,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 			intel_color_load_luts(new_crtc_state);
 	}
 
+	for_each_new_connector_in_state(&state->base, connector, new_connector_state, i)
+		drm_connector_update_privacy_screen(connector, &state->base);
+
 	/*
 	 * Now that the vblank has passed, we can go ahead and program the
 	 * optimal watermarks on platforms that need two-step watermark
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ed9e53c373a7..6d4e0a5e054b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -39,6 +39,7 @@
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_hdcp.h>
+#include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_probe_helper.h>
 
 #include "i915_debugfs.h"
@@ -8032,6 +8033,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	struct drm_connector *connector = &intel_connector->base;
 	struct drm_display_mode *fixed_mode = NULL;
 	struct drm_display_mode *downclock_mode = NULL;
+	struct drm_privacy_screen *privacy_screen;
 	bool has_dpcd;
 	enum pipe pipe = INVALID_PIPE;
 	intel_wakeref_t wakeref;
@@ -8129,6 +8131,14 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 				fixed_mode->hdisplay, fixed_mode->vdisplay);
 	}
 
+	privacy_screen = drm_privacy_screen_get(&dev->pdev->dev, NULL);
+	if (!IS_ERR(privacy_screen)) {
+		drm_connector_attach_privacy_screen_provider(connector,
+							     privacy_screen);
+	} else if (PTR_ERR(privacy_screen) != -ENODEV) {
+		drm_warn(&dev_priv->drm, "Error getting privacy-screen\n");
+	}
+
 	return true;
 
 out_vdd_off:
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index eb0b5be7c35d..3604babc2ee7 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -26,6 +26,7 @@
 #include <linux/vga_switcheroo.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_privacy_screen_consumer.h>
 #include <drm/i915_pciids.h>
 
 #include "display/intel_fbdev.h"
@@ -992,6 +993,7 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct intel_device_info *intel_info =
 		(struct intel_device_info *) ent->driver_data;
+	struct drm_privacy_screen *privacy_screen;
 	int err;
 
 	if (intel_info->require_force_probe &&
@@ -1020,7 +1022,17 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (vga_switcheroo_client_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
+	/*
+	 * We do not handle -EPROBE_DEFER further into the probe process, so
+	 * check if we have a laptop-panel privacy-screen for which the driver
+	 * has not loaded yet here.
+	 */
+	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
+	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
 	err = i915_driver_probe(pdev, ent);
+	drm_privacy_screen_put(privacy_screen);
 	if (err)
 		return err;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
