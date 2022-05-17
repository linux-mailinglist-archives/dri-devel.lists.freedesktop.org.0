Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A81752A62A
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 17:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788B71123FB;
	Tue, 17 May 2022 15:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B62710E8E7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 15:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652801030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Lx7wxEk8OZrLpfkD4Fk4XwM0sKlzzEb1nTigboGkZc=;
 b=MaEmr1NGK+mTaUJ4G0ELVHV3Yelo44hQx0/PItzA/9/jugMQdtyoRaMZyDT+0sKkR9igQY
 SF9mVEfQsI/HXvgpKeprs4GUC+bvpbGm8kT3i4zl7DWlWsgSw28+UZg8N6VTFMowR6GpeN
 3glQGgQ44ZBcFsh5BYT1RoS+DnJPA9c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-DGG5ZelkN72Qrd0GC7M5Ng-1; Tue, 17 May 2022 11:23:45 -0400
X-MC-Unique: DGG5ZelkN72Qrd0GC7M5Ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13E7A811E75;
 Tue, 17 May 2022 15:23:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92FF7C15D5C;
 Tue, 17 May 2022 15:23:40 +0000 (UTC)
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
	Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
Subject: [PATCH 01/14] ACPI: video: Add a native function parameter to
 acpi_video_get_backlight_type()
Date: Tue, 17 May 2022 17:23:18 +0200
Message-Id: <20220517152331.16217-2-hdegoede@redhat.com>
In-Reply-To: <20220517152331.16217-1-hdegoede@redhat.com>
References: <20220517152331.16217-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

ATM on x86 laptops where we want userspace to use the acpi_video backlight
device we often register both the GPU's native backlight device and
acpi_video's firmware acpi_video# backlight device. This relies on
userspace preferring firmware type backlight devices over native ones, but
registering 2 backlight devices for a single display really is undesirable.

On x86 laptops where the native GPU backlight device should be used,
the registering of other backlight devices is avoided by their drivers
using acpi_video_get_backlight_type() and only registering their backlight
if the return value matches their type.

acpi_video_get_backlight_type() uses
backlight_device_get_by_type(BACKLIGHT_RAW) to determine if a native
driver is available and will never return native if this returns
false. This means that the GPU's native backlight registering code
cannot just call acpi_video_get_backlight_type() to determine if it
should register its backlight, since acpi_video_get_backlight_type() will
never return native until the native backlight has already registered.

To fix this add a native function parameter to
acpi_video_get_backlight_type(), which when set to true will make
acpi_video_get_backlight_type() behave as if a native backlight has
already been registered.

Note that all current callers are updated to pass false for the new
parameter, so this change in itself causes no functional changes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/acpi_video.c                     |  2 +-
 drivers/acpi/video_detect.c                   | 20 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_opregion.c |  2 +-
 drivers/platform/x86/acer-wmi.c               |  2 +-
 drivers/platform/x86/asus-laptop.c            |  2 +-
 drivers/platform/x86/asus-wmi.c               |  4 ++--
 drivers/platform/x86/compal-laptop.c          |  2 +-
 drivers/platform/x86/dell/dell-laptop.c       |  2 +-
 drivers/platform/x86/eeepc-laptop.c           |  2 +-
 drivers/platform/x86/fujitsu-laptop.c         |  4 ++--
 drivers/platform/x86/ideapad-laptop.c         |  2 +-
 drivers/platform/x86/intel/oaktrail.c         |  2 +-
 drivers/platform/x86/msi-laptop.c             |  2 +-
 drivers/platform/x86/msi-wmi.c                |  2 +-
 drivers/platform/x86/samsung-laptop.c         |  2 +-
 drivers/platform/x86/sony-laptop.c            |  2 +-
 drivers/platform/x86/thinkpad_acpi.c          |  4 ++--
 drivers/platform/x86/toshiba_acpi.c           |  2 +-
 include/acpi/video.h                          |  6 +++---
 19 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 990ff5b0aeb8..cebef3403620 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -1864,7 +1864,7 @@ static int acpi_video_bus_register_backlight(struct acpi_video_bus *video)
 
 	acpi_video_run_bcl_for_osi(video);
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_video)
+	if (acpi_video_get_backlight_type(false) != acpi_backlight_video)
 		return 0;
 
 	mutex_lock(&video->device_list_lock);
diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index becc198e4c22..0a06f0edd298 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -17,12 +17,14 @@
  * Otherwise vendor specific drivers like thinkpad_acpi, asus-laptop,
  * sony_acpi,... can take care about backlight brightness.
  *
- * Backlight drivers can use acpi_video_get_backlight_type() to determine
- * which driver should handle the backlight.
+ * Backlight drivers can use acpi_video_get_backlight_type() to determine which
+ * driver should handle the backlight. RAW/GPU-driver backlight drivers must
+ * pass true for the native function argument, other drivers must pass false.
  *
  * If CONFIG_ACPI_VIDEO is neither set as "compiled in" (y) nor as a module (m)
  * this file will not be compiled and acpi_video_get_backlight_type() will
- * always return acpi_backlight_vendor.
+ * return acpi_backlight_native when its native argument is true and
+ * acpi_backlight_vendor when it is false.
  */
 
 #include <linux/export.h>
@@ -517,7 +519,7 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 /* This uses a workqueue to avoid various locking ordering issues */
 static void acpi_video_backlight_notify_work(struct work_struct *work)
 {
-	if (acpi_video_get_backlight_type() != acpi_backlight_video)
+	if (acpi_video_get_backlight_type(false) != acpi_backlight_video)
 		acpi_video_unregister_backlight();
 }
 
@@ -548,9 +550,10 @@ static int acpi_video_backlight_notify(struct notifier_block *nb,
  * Arguably the native on win8 check should be done first, but that would
  * be a behavior change, which may causes issues.
  */
-enum acpi_backlight_type acpi_video_get_backlight_type(void)
+enum acpi_backlight_type acpi_video_get_backlight_type(bool native)
 {
 	static DEFINE_MUTEX(init_mutex);
+	static bool native_available;
 	static bool init_done;
 	static long video_caps;
 
@@ -570,6 +573,8 @@ enum acpi_backlight_type acpi_video_get_backlight_type(void)
 			backlight_notifier_registered = true;
 		init_done = true;
 	}
+	if (native)
+		native_available = true;
 	mutex_unlock(&init_mutex);
 
 	if (acpi_backlight_cmdline != acpi_backlight_undef)
@@ -581,7 +586,8 @@ enum acpi_backlight_type acpi_video_get_backlight_type(void)
 	if (!(video_caps & ACPI_VIDEO_BACKLIGHT))
 		return acpi_backlight_vendor;
 
-	if (acpi_osi_is_win8() && backlight_device_get_by_type(BACKLIGHT_RAW))
+	if (acpi_osi_is_win8() &&
+	    (native_available || backlight_device_get_by_type(BACKLIGHT_RAW)))
 		return acpi_backlight_native;
 
 	return acpi_backlight_video;
@@ -597,7 +603,7 @@ void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type)
 {
 	acpi_backlight_dmi = type;
 	/* Remove acpi-video backlight interface if it is no longer desired */
-	if (acpi_video_get_backlight_type() != acpi_backlight_video)
+	if (acpi_video_get_backlight_type(false) != acpi_backlight_video)
 		acpi_video_unregister_backlight();
 }
 EXPORT_SYMBOL(acpi_video_set_dmi_backlight_type);
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index f31e8c3f8ce0..ed726a8af478 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -463,7 +463,7 @@ static u32 asle_set_backlight(struct drm_i915_private *dev_priv, u32 bclp)
 
 	drm_dbg(&dev_priv->drm, "bclp = 0x%08x\n", bclp);
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_native) {
+	if (acpi_video_get_backlight_type(false) == acpi_backlight_native) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "opregion backlight request ignored\n");
 		return 0;
diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 9c6943e401a6..0f665106692b 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2485,7 +2485,7 @@ static int __init acer_wmi_init(void)
 	if (dmi_check_system(video_vendor_dmi_table))
 		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+	if (acpi_video_get_backlight_type(false) != acpi_backlight_vendor)
 		interface->capability &= ~ACER_CAP_BRIGHTNESS;
 
 	if (wmi_has_guid(WMID_GUID3))
diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 4d2d32bfbe2a..eb78bbf79894 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1854,7 +1854,7 @@ static int asus_acpi_add(struct acpi_device *device)
 	if (result)
 		goto fail_platform;
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if (acpi_video_get_backlight_type(false) == acpi_backlight_vendor) {
 		result = asus_backlight_init(asus);
 		if (result)
 			goto fail_backlight;
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 62ce198a3463..30171ce9ba96 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3055,7 +3055,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		code = ASUS_WMI_BRN_DOWN;
 
 	if (code == ASUS_WMI_BRN_DOWN || code == ASUS_WMI_BRN_UP) {
-		if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+		if (acpi_video_get_backlight_type(false) == acpi_backlight_vendor) {
 			asus_wmi_backlight_notify(asus, orig_code);
 			return;
 		}
@@ -3625,7 +3625,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (asus->driver->quirks->xusb2pr)
 		asus_wmi_set_xusb2pr(asus);
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if (acpi_video_get_backlight_type(false) == acpi_backlight_vendor) {
 		err = asus_wmi_backlight_init(asus);
 		if (err && err != -ENODEV)
 			goto fail_backlight;
diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index ab610376fdad..252a5f83c778 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -981,7 +981,7 @@ static int __init compal_init(void)
 		return -ENODEV;
 	}
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if (acpi_video_get_backlight_type(false) == acpi_backlight_vendor) {
 		struct backlight_properties props;
 		memset(&props, 0, sizeof(struct backlight_properties));
 		props.type = BACKLIGHT_PLATFORM;
diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 1321687d923e..9c19248f45dd 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2230,7 +2230,7 @@ static int __init dell_init(void)
 		micmute_led_registered = true;
 	}
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+	if (acpi_video_get_backlight_type(false) != acpi_backlight_vendor)
 		return 0;
 
 	token = dell_smbios_find_token(BRIGHTNESS_TOKEN);
diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index ba08c9235f76..f534208798f7 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -1400,7 +1400,7 @@ static int eeepc_acpi_add(struct acpi_device *device)
 	if (result)
 		goto fail_platform;
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if (acpi_video_get_backlight_type(false) == acpi_backlight_vendor) {
 		result = eeepc_backlight_init(eeepc);
 		if (result)
 			goto fail_backlight;
diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 80929380ec7e..04e85404760f 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -387,7 +387,7 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	struct fujitsu_bl *priv;
 	int ret;
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+	if (acpi_video_get_backlight_type(false) != acpi_backlight_vendor)
 		return -ENODEV;
 
 	priv = devm_kzalloc(&device->dev, sizeof(*priv), GFP_KERNEL);
@@ -819,7 +819,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 
 	/* Sync backlight power status */
 	if (fujitsu_bl && fujitsu_bl->bl_device &&
-	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	    acpi_video_get_backlight_type(false) == acpi_backlight_vendor) {
 		if (call_fext_func(fext, FUNC_BACKLIGHT, 0x2,
 				   BACKLIGHT_PARAM_POWER, 0x0) == BACKLIGHT_OFF)
 			fujitsu_bl->bl_device->props.power = FB_BLANK_POWERDOWN;
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 3ccb7b71dfb1..deb123e7f88f 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1620,7 +1620,7 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 			dev_info(&pdev->dev, "DYTC interface is not available\n");
 	}
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if (acpi_video_get_backlight_type(false) == acpi_backlight_vendor) {
 		err = ideapad_backlight_init(priv);
 		if (err && err != -ENODEV)
 			goto backlight_failed;
diff --git a/drivers/platform/x86/intel/oaktrail.c b/drivers/platform/x86/intel/oaktrail.c
index 1a09a75bd16d..631ae393e52e 100644
--- a/drivers/platform/x86/intel/oaktrail.c
+++ b/drivers/platform/x86/intel/oaktrail.c
@@ -330,7 +330,7 @@ static int __init oaktrail_init(void)
 		goto err_device_add;
 	}
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if (acpi_video_get_backlight_type(false) == acpi_backlight_vendor) {
 		ret = oaktrail_backlight_init();
 		if (ret)
 			goto err_backlight;
diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 24ffc8e2d2d1..8c8cb814ae09 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -1050,7 +1050,7 @@ static int __init msi_init(void)
 	/* Register backlight stuff */
 
 	if (quirks->old_ec_model ||
-	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	    acpi_video_get_backlight_type(false) == acpi_backlight_vendor) {
 		struct backlight_properties props;
 		memset(&props, 0, sizeof(struct backlight_properties));
 		props.type = BACKLIGHT_PLATFORM;
diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index fd318cdfe313..3e6f291ba14e 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -309,7 +309,7 @@ static int __init msi_wmi_init(void)
 	}
 
 	if (wmi_has_guid(MSIWMI_BIOS_GUID) &&
-	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	    acpi_video_get_backlight_type(false) == acpi_backlight_vendor) {
 		err = msi_wmi_backlight_setup();
 		if (err) {
 			pr_err("Unable to setup backlight device\n");
diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index c187dcdf82f0..985e6ea0fabf 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1660,7 +1660,7 @@ static int __init samsung_init(void)
 	if (samsung->quirks->use_native_backlight)
 		acpi_video_set_dmi_backlight_type(acpi_backlight_native);
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+	if (acpi_video_get_backlight_type(false) != acpi_backlight_vendor)
 		samsung->handle_backlight = false;
 #endif
 
diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index d8d0c0bed5e9..ebd7738c2c44 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -3201,7 +3201,7 @@ static int sony_nc_add(struct acpi_device *device)
 			sony_nc_function_setup(device, sony_pf_device);
 	}
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor)
+	if (acpi_video_get_backlight_type(false) == acpi_backlight_vendor)
 		sony_nc_backlight_setup();
 
 	/* create sony_pf sysfs attributes related to the SNC device */
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e6cb4a14cdd4..411679d86308 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3547,7 +3547,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	/* Do not issue duplicate brightness change events to
 	 * userspace. tpacpi_detect_brightness_capabilities() must have
 	 * been called before this point  */
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor) {
+	if (acpi_video_get_backlight_type(false) != acpi_backlight_vendor) {
 		pr_info("This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver\n");
 		pr_notice("Disabling thinkpad-acpi brightness events by default...\n");
 
@@ -6989,7 +6989,7 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
 		return -ENODEV;
 	}
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor) {
+	if (acpi_video_get_backlight_type(false) != acpi_backlight_vendor) {
 		if (brightness_enable > 1) {
 			pr_info("Standard ACPI backlight interface available, not loading native one\n");
 			return -ENODEV;
diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 0fc9e8b8827b..3ea6a1286f0c 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2889,7 +2889,7 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
 	    dmi_check_system(toshiba_vendor_backlight_dmi))
 		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+	if (acpi_video_get_backlight_type(false) != acpi_backlight_vendor)
 		return 0;
 
 	memset(&props, 0, sizeof(props));
diff --git a/include/acpi/video.h b/include/acpi/video.h
index db8548ff03ce..e31afb93379a 100644
--- a/include/acpi/video.h
+++ b/include/acpi/video.h
@@ -55,7 +55,7 @@ extern int acpi_video_register(void);
 extern void acpi_video_unregister(void);
 extern int acpi_video_get_edid(struct acpi_device *device, int type,
 			       int device_id, void **edid);
-extern enum acpi_backlight_type acpi_video_get_backlight_type(void);
+extern enum acpi_backlight_type acpi_video_get_backlight_type(bool native);
 extern void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type);
 /*
  * Note: The value returned by acpi_video_handles_brightness_key_presses()
@@ -73,9 +73,9 @@ static inline int acpi_video_get_edid(struct acpi_device *device, int type,
 {
 	return -ENODEV;
 }
-static inline enum acpi_backlight_type acpi_video_get_backlight_type(void)
+static inline enum acpi_backlight_type acpi_video_get_backlight_type(bool native)
 {
-	return acpi_backlight_vendor;
+	return native ? acpi_backlight_native : acpi_backlight_vendor;
 }
 static inline void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type)
 {
-- 
2.36.0

