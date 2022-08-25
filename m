Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DDE5A140E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 16:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB9310E437;
	Thu, 25 Aug 2022 14:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A681310E3C0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661438298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U8Y7ncaElU+O3oGmewo0JDrY9FZX4397TBSNVEh71Ck=;
 b=FoCLVwOCguOs70RtfWfTzILnC9jKaTO3FiHx4wcemedvfhVka5VmVfXob4u4uO7h0qt0UA
 FQPT3VTP8BBvwYBdTKG4ATQgarwKa9/kWdoN7CWKjLXysoiBxaJpYxiEyKfz8YjxPMXdWh
 Kn6ajO7MygU/ZzdaRmRTnt8tT44ndLo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-wLOf_EwMM8OQXQyTdIyUUw-1; Thu, 25 Aug 2022 10:38:17 -0400
X-MC-Unique: wLOf_EwMM8OQXQyTdIyUUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CC39802529;
 Thu, 25 Aug 2022 14:38:16 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BA0E2166B26;
 Thu, 25 Aug 2022 14:38:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
	Daniel Dadap <ddadap@nvidia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v5 11/31] drm/i915: Call acpi_video_register_backlight() (v3)
Date: Thu, 25 Aug 2022 16:37:06 +0200
Message-Id: <20220825143726.269890-12-hdegoede@redhat.com>
In-Reply-To: <20220825143726.269890-1-hdegoede@redhat.com>
References: <20220825143726.269890-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: linux-acpi@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On machins without an i915 opregion the acpi_video driver immediately
probes the ACPI video bus and used to also immediately register
acpi_video# backlight devices when supported.

Once the drm/kms driver then loaded later and possibly registered
a native backlight device then the drivers/acpi/video_detect.c code
unregistered the acpi_video0 device to avoid there being 2 backlight
devices (when acpi_video_get_backlight_type()==native).

This means that userspace used to briefly see 2 devices and the
disappearing of acpi_video0 after a brief time confuses the systemd
backlight level save/restore code, see e.g.:
https://bbs.archlinux.org/viewtopic.php?id=269920

To fix this the ACPI video code has been modified to make backlight class
device registration a separate step, relying on the drm/kms driver to
ask for the acpi_video backlight registration after it is done setting up
its native backlight device.

Add a call to the new acpi_video_register_backlight() after the i915 calls
acpi_video_register() (after setting up the i915 opregion) so that the
acpi_video backlight devices get registered on systems where the i915
native backlight device is not registered.

Changes in v2:
-Only call acpi_video_register_backlight() when a panel is detected

Changes in v3:
-Add a new intel_acpi_video_register() helper which checks if a panel
 is present and then calls acpi_video_register_backlight()

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_acpi.c    | 27 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_acpi.h    |  3 +++
 drivers/gpu/drm/i915/display/intel_display.c |  2 +-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
index e78430001f07..9df78e7caa2b 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.c
+++ b/drivers/gpu/drm/i915/display/intel_acpi.c
@@ -7,6 +7,7 @@
 
 #include <linux/pci.h>
 #include <linux/acpi.h>
+#include <acpi/video.h>
 
 #include "i915_drv.h"
 #include "intel_acpi.h"
@@ -331,3 +332,29 @@ void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
 	 */
 	fwnode_handle_put(fwnode);
 }
+
+void intel_acpi_video_register(struct drm_i915_private *i915)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
+
+	acpi_video_register();
+
+	/*
+	 * If i915 is driving an internal panel without registering its native
+	 * backlight handler try to register the acpi_video backlight.
+	 * For panels not driven by i915 another GPU driver may still register
+	 * a native backlight later and acpi_video_register_backlight() should
+	 * only be called after any native backlights have been registered.
+	 */
+	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		struct intel_panel *panel = &to_intel_connector(connector)->panel;
+
+		if (panel->backlight.funcs && !panel->backlight.device) {
+			acpi_video_register_backlight();
+			break;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_acpi.h b/drivers/gpu/drm/i915/display/intel_acpi.h
index 4a760a2baed9..6a0007452f95 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.h
+++ b/drivers/gpu/drm/i915/display/intel_acpi.h
@@ -14,6 +14,7 @@ void intel_unregister_dsm_handler(void);
 void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915);
 void intel_acpi_device_id_update(struct drm_i915_private *i915);
 void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915);
+void intel_acpi_video_register(struct drm_i915_private *i915);
 #else
 static inline void intel_register_dsm_handler(void) { return; }
 static inline void intel_unregister_dsm_handler(void) { return; }
@@ -23,6 +24,8 @@ static inline
 void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
 static inline
 void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915) { return; }
+static inline
+void intel_acpi_video_register(struct drm_i915_private *i915) { return; }
 #endif /* CONFIG_ACPI */
 
 #endif /* __INTEL_ACPI_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6103b02c081f..129a13375101 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -9087,7 +9087,7 @@ void intel_display_driver_register(struct drm_i915_private *i915)
 
 	/* Must be done after probing outputs */
 	intel_opregion_register(i915);
-	acpi_video_register();
+	intel_acpi_video_register(i915);
 
 	intel_audio_init(i915);
 
-- 
2.37.2

