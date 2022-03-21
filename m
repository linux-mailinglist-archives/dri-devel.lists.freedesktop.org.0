Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0D24E257F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 12:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B447010E298;
	Mon, 21 Mar 2022 11:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B09610E298
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 11:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647863478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ixVLCPpg12W56+MS3uU6qoKZIf4ChOm3i3yOXd+omnE=;
 b=bbz+R8vw68SWVxpKnKBM9Upp1924rfi0CetGk3G4uLeU+O3L6EAN2XcQlW52I5uF45pL8z
 HMskxeOAzSDltjq6xrqaJwMXEbm4NimqXm7TmdTmkkyPANUA1VqDv1TyIm3rShWZaCDkW1
 gV3K6h8joRVemkyFOkC3ydofyKWMiHw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-BJnuuVLFPGefjXDrD5178Q-1; Mon, 21 Mar 2022 07:51:13 -0400
X-MC-Unique: BJnuuVLFPGefjXDrD5178Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C9DF1010369;
 Mon, 21 Mar 2022 11:51:12 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DB3340C1241;
 Mon, 21 Mar 2022 11:51:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH] drm/privacy-screen: Use connector name in lookup
Date: Mon, 21 Mar 2022 12:51:06 +0100
Message-Id: <20220321115106.132546-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
 intel-gfx <intel-gfx@lists.freedesktop.org>, Rajat Jain <rajatja@google.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ATM the drm privacy-screen code is not using connector names to lookup
drm privacy-screen providers, drm_privacy_screen_get() does support this,
but before this change the con_id is set to NULL everywhere which is
treated as a wildcard.

There are some worries that we may see devices with 2 displays with
a privacy-screen, be it 2 internal displays or 1 internal + 1 external.

All laptop-models which currently are supported by the drm_privacy_screen
code use an eDP display connected to eDP-1.

This commits enables the use of the con_id parameter, hardcoding this to
"eDP-1" in the lookup tables in drivers/gpu/drm/drm_privacy_screen_x86.c
and adjusting the i915 driver to match.

Using the con_id parameter paves the way for potentially having another
display (attached to a different connector) which also has a builtin
privacy-screen.

This was tested by Hans de Goede on a ThinkPad and by Rajat Jain on
an Intel Chromebook (both with builtin privacy-screens).

Cc: Sean Paul <seanpaul@chromium.org>
Cc: Rajat Jain <rajatja@google.com>
Tested-by: Rajat Jain <rajatja@google.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_privacy_screen_x86.c     |  4 ++--
 drivers/gpu/drm/i915/display/intel_ddi.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++----
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
index 72ed40e4997e..6afa3773313a 100644
--- a/drivers/gpu/drm/drm_privacy_screen_x86.c
+++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
@@ -62,7 +62,7 @@ static const struct arch_init_data arch_init_data[] __initconst = {
 	{
 		.lookup = {
 			.dev_id = NULL,
-			.con_id = NULL,
+			.con_id = "eDP-1",
 			.provider = "privacy_screen-thinkpad_acpi",
 		},
 		.detect = detect_thinkpad_privacy_screen,
@@ -72,7 +72,7 @@ static const struct arch_init_data arch_init_data[] __initconst = {
 	{
 		.lookup = {
 			.dev_id = NULL,
-			.con_id = NULL,
+			.con_id = "eDP-1",
 			.provider = "privacy_screen-GOOG0010:00",
 		},
 		.detect = detect_chromeos_privacy_screen,
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index cab505277595..e1930ab6ff11 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3951,7 +3951,7 @@ intel_ddi_init_dp_connector(struct intel_digital_port *dig_port)
 		struct drm_device *dev = dig_port->base.base.dev;
 		struct drm_privacy_screen *privacy_screen;
 
-		privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
+		privacy_screen = drm_privacy_screen_get(dev->dev, connector->base.name);
 		if (!IS_ERR(privacy_screen)) {
 			drm_connector_attach_privacy_screen_provider(&connector->base,
 								     privacy_screen);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index fb455d3710c6..f0695c29a393 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -10825,7 +10825,11 @@ void intel_modeset_driver_remove_nogem(struct drm_i915_private *i915)
 
 bool intel_modeset_probe_defer(struct pci_dev *pdev)
 {
+	static const char * const internal_panel_connector_names[] = {
+		"eDP-1",
+	};
 	struct drm_privacy_screen *privacy_screen;
+	int i;
 
 	/*
 	 * apple-gmux is needed on dual GPU MacBook Pro
@@ -10835,11 +10839,14 @@ bool intel_modeset_probe_defer(struct pci_dev *pdev)
 		return true;
 
 	/* If the LCD panel has a privacy-screen, wait for it */
-	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
-	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
-		return true;
+	for (i = 0; i < ARRAY_SIZE(internal_panel_connector_names); i++) {
+		privacy_screen = drm_privacy_screen_get(&pdev->dev,
+							internal_panel_connector_names[i]);
+		if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
+			return true;
 
-	drm_privacy_screen_put(privacy_screen);
+		drm_privacy_screen_put(privacy_screen);
+	}
 
 	return false;
 }
-- 
2.35.1

