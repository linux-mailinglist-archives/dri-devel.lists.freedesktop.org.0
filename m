Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DBA5A1425
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 16:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625ED10E469;
	Thu, 25 Aug 2022 14:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968F310E461
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 14:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661438324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VE9pvPAzjrHVXmz9RKnZkmNJ4tUOhjb5J/X48cd2x14=;
 b=jMx8AZLFmg9Ktv3QxPlDb73xGChvPekYLzW8Pq2i3FzO587YMfaaUj03ygoucLp53q1G40
 mZRN6fG5QMR8IUmea+5hlS+vcQB0XwhMF2+4Rk7DuM5Ntg3cLV+dL+XRTR6dgyC5VjqdII
 fZ5dgILXCwfpQTUJTW9/kqsE31xrzSM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-yCzmEf36PGOZkUk1fGVqRw-1; Thu, 25 Aug 2022 10:38:41 -0400
X-MC-Unique: yCzmEf36PGOZkUk1fGVqRw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F9CF1C0515B;
 Thu, 25 Aug 2022 14:38:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2D32166B26;
 Thu, 25 Aug 2022 14:38:36 +0000 (UTC)
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
Subject: [PATCH v5 17/31] ACPI: video: Add Nvidia WMI EC brightness control
 detection (v3)
Date: Thu, 25 Aug 2022 16:37:12 +0200
Message-Id: <20220825143726.269890-18-hdegoede@redhat.com>
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
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some new laptop designs a new Nvidia specific WMI interface is present
which gives info about panel brightness control and may allow controlling
the brightness through this interface when the embedded controller is used
for brightness control.

When this WMI interface is present and indicates that the EC is used,
then this interface should be used for brightness control.

Changes in v2:
- Use the new shared nvidia-wmi-ec-backlight.h header for the
  WMI firmware API definitions
- ACPI_VIDEO can now be enabled on non X86 too,
  adjust the Kconfig changes to match this.

Changes in v3:
- Use WMI_BRIGHTNESS_GUID define

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/Kconfig           |  1 +
 drivers/acpi/video_detect.c    | 37 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/gma500/Kconfig |  2 ++
 drivers/gpu/drm/i915/Kconfig   |  2 ++
 include/acpi/video.h           |  1 +
 5 files changed, 43 insertions(+)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index 7802d8846a8d..44ad4b6bd234 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -212,6 +212,7 @@ config ACPI_VIDEO
 	tristate "Video"
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
+	depends on ACPI_WMI || !X86
 	select THERMAL
 	help
 	  This driver implements the ACPI Extensions For Display Adapters
diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index cc9d0d91e268..4dc7fb865083 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -32,6 +32,7 @@
 #include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_data/x86/nvidia-wmi-ec-backlight.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 #include <acpi/video.h>
@@ -75,6 +76,36 @@ find_video(acpi_handle handle, u32 lvl, void *context, void **rv)
 	return AE_OK;
 }
 
+/* This depends on ACPI_WMI which is X86 only */
+#ifdef CONFIG_X86
+static bool nvidia_wmi_ec_supported(void)
+{
+	struct wmi_brightness_args args = {
+		.mode = WMI_BRIGHTNESS_MODE_GET,
+		.val = 0,
+		.ret = 0,
+	};
+	struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
+	acpi_status status;
+
+	status = wmi_evaluate_method(WMI_BRIGHTNESS_GUID, 0,
+				     WMI_BRIGHTNESS_METHOD_SOURCE, &buf, &buf);
+	if (ACPI_FAILURE(status))
+		return false;
+
+	/*
+	 * If brightness is handled by the EC then nvidia-wmi-ec-backlight
+	 * should be used, else the GPU driver(s) should be used.
+	 */
+	return args.ret == WMI_BRIGHTNESS_SOURCE_EC;
+}
+#else
+static bool nvidia_wmi_ec_supported(void)
+{
+	return false;
+}
+#endif
+
 /* Force to use vendor driver when the ACPI device is known to be
  * buggy */
 static int video_detect_force_vendor(const struct dmi_system_id *d)
@@ -541,6 +572,7 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
 {
 	static DEFINE_MUTEX(init_mutex);
+	static bool nvidia_wmi_ec_present;
 	static bool native_available;
 	static bool init_done;
 	static long video_caps;
@@ -553,6 +585,7 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
 		acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
 				    ACPI_UINT32_MAX, find_video, NULL,
 				    &video_caps, NULL);
+		nvidia_wmi_ec_present = nvidia_wmi_ec_supported();
 		init_done = true;
 	}
 	if (native)
@@ -570,6 +603,10 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
 	if (acpi_backlight_dmi != acpi_backlight_undef)
 		return acpi_backlight_dmi;
 
+	/* Special cases such as nvidia_wmi_ec and apple gmux. */
+	if (nvidia_wmi_ec_present)
+		return acpi_backlight_nvidia_wmi_ec;
+
 	/* On systems with ACPI video use either native or ACPI video. */
 	if (video_caps & ACPI_VIDEO_BACKLIGHT) {
 		/*
diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index 0cff20265f97..807b989e3c77 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -7,6 +7,8 @@ config DRM_GMA500
 	select ACPI_VIDEO if ACPI
 	select BACKLIGHT_CLASS_DEVICE if ACPI
 	select INPUT if ACPI
+	select X86_PLATFORM_DEVICES if ACPI
+	select ACPI_WMI if ACPI
 	help
 	  Say yes for an experimental 2D KMS framebuffer driver for the
 	  Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 7ae3b7d67fcf..3efce05d7b57 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -23,6 +23,8 @@ config DRM_I915
 	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
 	select BACKLIGHT_CLASS_DEVICE if ACPI
 	select INPUT if ACPI
+	select X86_PLATFORM_DEVICES if ACPI
+	select ACPI_WMI if ACPI
 	select ACPI_VIDEO if ACPI
 	select ACPI_BUTTON if ACPI
 	select SYNC_FILE
diff --git a/include/acpi/video.h b/include/acpi/video.h
index 0625806d3bbd..91578e77ac4e 100644
--- a/include/acpi/video.h
+++ b/include/acpi/video.h
@@ -48,6 +48,7 @@ enum acpi_backlight_type {
 	acpi_backlight_video,
 	acpi_backlight_vendor,
 	acpi_backlight_native,
+	acpi_backlight_nvidia_wmi_ec,
 };
 
 #if IS_ENABLED(CONFIG_ACPI_VIDEO)
-- 
2.37.2

