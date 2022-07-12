Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 213FA5725EC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 21:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F48A9648F;
	Tue, 12 Jul 2022 19:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18BD9648C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 19:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657654831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7tsJYxSgE0PxW4rHW8wHGgESrarZMYWQiEu3i7bApiA=;
 b=aH+dDYMOvC8AS2wgpZkKjhgNauCFiVrFaz7tESLbZy7Cj5dx+OKfbCJGBXuRlPqhEGjUl5
 XAkKPnAdvUx4jiItfw+UVQIjKQxcxOb657zaxEMN+VbKsycavnnKI72oz2DSXJPFu79Zi7
 YozzgaHp29wPZxQUo2k7YD7npOx9Ynw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-9kZwBuDQPAGO9HNrTsxp_Q-1; Tue, 12 Jul 2022 15:40:27 -0400
X-MC-Unique: 9kZwBuDQPAGO9HNrTsxp_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66E7A1C0CE69;
 Tue, 12 Jul 2022 19:40:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC5B240E80E0;
 Tue, 12 Jul 2022 19:40:22 +0000 (UTC)
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
Subject: [PATCH v2 16/29] ACPI: video: Add Nvidia WMI EC brightness control
 detection
Date: Tue, 12 Jul 2022 21:38:57 +0200
Message-Id: <20220712193910.439171-17-hdegoede@redhat.com>
In-Reply-To: <20220712193910.439171-1-hdegoede@redhat.com>
References: <20220712193910.439171-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: linux-acpi@vger.kernel.org, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some new laptop designs a new Nvidia specific WMI interface is present
which gives info about panel brightness control and may allow controlling
the brightness through this interface when the embedded controller is used
for brightness control.

When this WMI interface is present and indicates that the EC is used,
then this interface should be used for brightness control.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/Kconfig           |  1 +
 drivers/acpi/video_detect.c    | 35 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/gma500/Kconfig |  2 ++
 drivers/gpu/drm/i915/Kconfig   |  2 ++
 include/acpi/video.h           |  1 +
 5 files changed, 41 insertions(+)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index 1e34f846508f..c372385cfc3f 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -212,6 +212,7 @@ config ACPI_VIDEO
 	tristate "Video"
 	depends on X86 && BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
+	depends on ACPI_WMI
 	select THERMAL
 	help
 	  This driver implements the ACPI Extensions For Display Adapters
diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 8c2863403040..7b89dc9a04a2 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -75,6 +75,35 @@ find_video(acpi_handle handle, u32 lvl, void *context, void **rv)
 	return AE_OK;
 }
 
+#define WMI_BRIGHTNESS_METHOD_SOURCE			2
+#define WMI_BRIGHTNESS_MODE_GET				0
+#define WMI_BRIGHTNESS_SOURCE_EC			2
+
+struct wmi_brightness_args {
+	u32 mode;
+	u32 val;
+	u32 ret;
+	u32 ignored[3];
+};
+
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
+	status = wmi_evaluate_method("603E9613-EF25-4338-A3D0-C46177516DB7", 0,
+				     WMI_BRIGHTNESS_METHOD_SOURCE, &buf, &buf);
+	if (ACPI_FAILURE(status))
+		return false;
+
+	return args.ret == WMI_BRIGHTNESS_SOURCE_EC;
+}
+
 /* Force to use vendor driver when the ACPI device is known to be
  * buggy */
 static int video_detect_force_vendor(const struct dmi_system_id *d)
@@ -518,6 +547,7 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
 {
 	static DEFINE_MUTEX(init_mutex);
+	static bool nvidia_wmi_ec_present;
 	static bool native_available;
 	static bool init_done;
 	static long video_caps;
@@ -530,6 +560,7 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
 		acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
 				    ACPI_UINT32_MAX, find_video, NULL,
 				    &video_caps, NULL);
+		nvidia_wmi_ec_present = nvidia_wmi_ec_supported();
 		init_done = true;
 	}
 	if (native)
@@ -547,6 +578,10 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
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
2.36.0

