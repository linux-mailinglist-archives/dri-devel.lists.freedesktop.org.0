Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1635D35F716
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA0B6E93E;
	Wed, 14 Apr 2021 15:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7616E941
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618413090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0vFmvAiXucyp7f9FMbheeR8R5XIUXH2PC6R7NQlz7M=;
 b=IO8/2S2oTAFtPxueAynljy7tVJnjMppyavplmTI+Id3N5bkgKOKRQZ8+eo4lweyxGOkN2C
 BzF8jRT5yxu8TDSr7XJM0xVXWAmIP/dkJadjlwiTiJucO78suxlppiivSkRXU/B9fHlJ2H
 8NVjlKH8HnObb+KAO/EG6ItKRRf4ETA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-ZJ5Ux6qPOyqaVHQwurFUFQ-1; Wed, 14 Apr 2021 11:11:28 -0400
X-MC-Unique: ZJ5Ux6qPOyqaVHQwurFUFQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AA45A6862;
 Wed, 14 Apr 2021 15:11:25 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-168.ams2.redhat.com [10.36.112.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33AE85D6A8;
 Wed, 14 Apr 2021 15:11:22 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@infradead.org>
Subject: [PATCH resend 8/9] platform/x86: thinkpad_acpi: Register a
 privacy-screen device
Date: Wed, 14 Apr 2021 17:10:48 +0200
Message-Id: <20210414151049.95828-9-hdegoede@redhat.com>
In-Reply-To: <20210414151049.95828-1-hdegoede@redhat.com>
References: <20210414151049.95828-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Marco Trevisan <marco.trevisan@canonical.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sebastien Bacher <seb128@ubuntu.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Mario Limonciello <mario.limonciello@outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register a privacy-screen device on laptops with a privacy-screen,
this exports the PrivacyGuard features to user-space using a
standardized vendor-agnostic sysfs interface. Note the sysfs interface
is read-only.

Registering a privacy-screen device with the new privacy-screen class
code will also allow the GPU driver to get a handle to it and export
the privacy-screen setting as a property on the DRM connector object
for the LCD panel. This DRM connector property is news standardized
interface which all user-space code should use to query and control
the privacy-screen.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Make the new lcdshadow_set_sw_state, lcdshadow_get_hw_state and
  lcdshadow_ops symbols static
- Update state and call drm_privacy_screen_call_notifier_chain()
  when the state is changed by pressing the Fn + D hotkey combo
---
 drivers/platform/x86/Kconfig         |  1 +
 drivers/platform/x86/thinkpad_acpi.c | 91 ++++++++++++++++++++--------
 2 files changed, 67 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 461ec61530eb..404d80f99a03 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -485,6 +485,7 @@ config THINKPAD_ACPI
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on BACKLIGHT_CLASS_DEVICE
 	select ACPI_PLATFORM_PROFILE
+	select DRM_PRIVACY_SCREEN
 	select HWMON
 	select NVRAM
 	select NEW_LEDS
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index fe919700b8ae..766c6d64b0fb 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -73,6 +73,7 @@
 #include <linux/uaccess.h>
 #include <acpi/battery.h>
 #include <acpi/video.h>
+#include <drm/drm_privacy_screen_driver.h>
 
 /* ThinkPad CMOS commands */
 #define TP_CMOS_VOLUME_DOWN	0
@@ -156,6 +157,7 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_VOL_UP		= 0x1015, /* Volume up or unmute */
 	TP_HKEY_EV_VOL_DOWN		= 0x1016, /* Volume down or unmute */
 	TP_HKEY_EV_VOL_MUTE		= 0x1017, /* Mixer output mute */
+	TP_HKEY_EV_PRIVACYGUARD_TOGGLE	= 0x130f, /* Toggle priv.guard on/off */
 
 	/* Reasons for waking up from S3/S4 */
 	TP_HKEY_EV_WKUP_S3_UNDOCK	= 0x2304, /* undock requested, S3 */
@@ -3882,6 +3884,12 @@ static bool hotkey_notify_extended_hotkey(const u32 hkey)
 {
 	unsigned int scancode;
 
+	switch (hkey) {
+	case TP_HKEY_EV_PRIVACYGUARD_TOGGLE:
+		tpacpi_driver_event(hkey);
+		return true;
+	}
+
 	/* Extended keycodes start at 0x300 and our offset into the map
 	 * TP_ACPI_HOTKEYSCAN_EXTENDED_START. The calculated scancode
 	 * will be positive, but might not be in the correct range.
@@ -9759,30 +9767,40 @@ static struct ibm_struct battery_driver_data = {
  * LCD Shadow subdriver, for the Lenovo PrivacyGuard feature
  */
 
+static struct drm_privacy_screen *lcdshadow_dev;
 static acpi_handle lcdshadow_get_handle;
 static acpi_handle lcdshadow_set_handle;
-static int lcdshadow_state;
 
-static int lcdshadow_on_off(bool state)
+static int lcdshadow_set_sw_state(struct drm_privacy_screen *priv,
+				  enum drm_privacy_screen_status state)
 {
 	int output;
 
+	if (WARN_ON(!mutex_is_locked(&priv->lock)))
+		return -EIO;
+
 	if (!acpi_evalf(lcdshadow_set_handle, &output, NULL, "dd", (int)state))
 		return -EIO;
 
-	lcdshadow_state = state;
+	priv->hw_state = priv->sw_state = state;
 	return 0;
 }
 
-static int lcdshadow_set(bool on)
+static void lcdshadow_get_hw_state(struct drm_privacy_screen *priv)
 {
-	if (lcdshadow_state < 0)
-		return lcdshadow_state;
-	if (lcdshadow_state == on)
-		return 0;
-	return lcdshadow_on_off(on);
+	int output;
+
+	if (!acpi_evalf(lcdshadow_get_handle, &output, NULL, "dd", 0))
+		return;
+
+	priv->hw_state = priv->sw_state = output & 0x1;
 }
 
+static const struct drm_privacy_screen_ops lcdshadow_ops = {
+	.set_sw_state = lcdshadow_set_sw_state,
+	.get_hw_state = lcdshadow_get_hw_state,
+};
+
 static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
 {
 	acpi_status status1, status2;
@@ -9790,36 +9808,44 @@ static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
 
 	status1 = acpi_get_handle(hkey_handle, "GSSS", &lcdshadow_get_handle);
 	status2 = acpi_get_handle(hkey_handle, "SSSS", &lcdshadow_set_handle);
-	if (ACPI_FAILURE(status1) || ACPI_FAILURE(status2)) {
-		lcdshadow_state = -ENODEV;
+	if (ACPI_FAILURE(status1) || ACPI_FAILURE(status2))
 		return 0;
-	}
 
-	if (!acpi_evalf(lcdshadow_get_handle, &output, NULL, "dd", 0)) {
-		lcdshadow_state = -EIO;
+	if (!acpi_evalf(lcdshadow_get_handle, &output, NULL, "dd", 0))
 		return -EIO;
-	}
-	if (!(output & 0x10000)) {
-		lcdshadow_state = -ENODEV;
+
+	if (!(output & 0x10000))
 		return 0;
-	}
-	lcdshadow_state = output & 0x1;
+
+	lcdshadow_dev = drm_privacy_screen_register(&tpacpi_pdev->dev,
+						    &lcdshadow_ops);
+	if (IS_ERR(lcdshadow_dev))
+		return PTR_ERR(lcdshadow_dev);
 
 	return 0;
 }
 
+static void lcdshadow_exit(void)
+{
+	drm_privacy_screen_unregister(lcdshadow_dev);
+}
+
 static void lcdshadow_resume(void)
 {
-	if (lcdshadow_state >= 0)
-		lcdshadow_on_off(lcdshadow_state);
+	if (!lcdshadow_dev)
+		return;
+
+	mutex_lock(&lcdshadow_dev->lock);
+	lcdshadow_set_sw_state(lcdshadow_dev, lcdshadow_dev->sw_state);
+	mutex_unlock(&lcdshadow_dev->lock);
 }
 
 static int lcdshadow_read(struct seq_file *m)
 {
-	if (lcdshadow_state < 0) {
+	if (!lcdshadow_dev) {
 		seq_puts(m, "status:\t\tnot supported\n");
 	} else {
-		seq_printf(m, "status:\t\t%d\n", lcdshadow_state);
+		seq_printf(m, "status:\t\t%d\n", lcdshadow_dev->hw_state);
 		seq_puts(m, "commands:\t0, 1\n");
 	}
 
@@ -9831,7 +9857,7 @@ static int lcdshadow_write(char *buf)
 	char *cmd;
 	int res, state = -EINVAL;
 
-	if (lcdshadow_state < 0)
+	if (!lcdshadow_dev)
 		return -ENODEV;
 
 	while ((cmd = strsep(&buf, ","))) {
@@ -9843,11 +9869,18 @@ static int lcdshadow_write(char *buf)
 	if (state >= 2 || state < 0)
 		return -EINVAL;
 
-	return lcdshadow_set(state);
+	mutex_lock(&lcdshadow_dev->lock);
+	res = lcdshadow_set_sw_state(lcdshadow_dev, state);
+	mutex_unlock(&lcdshadow_dev->lock);
+
+	drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
+
+	return res;
 }
 
 static struct ibm_struct lcdshadow_driver_data = {
 	.name = "lcdshadow",
+	.exit = lcdshadow_exit,
 	.resume = lcdshadow_resume,
 	.read = lcdshadow_read,
 	.write = lcdshadow_write,
@@ -10533,6 +10566,14 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 		if (!atomic_add_unless(&dytc_ignore_event, -1, 0))
 			dytc_profile_refresh();
 	}
+
+	if (lcdshadow_dev && hkey_event == TP_HKEY_EV_PRIVACYGUARD_TOGGLE) {
+		mutex_lock(&lcdshadow_dev->lock);
+		lcdshadow_get_hw_state(lcdshadow_dev);
+		mutex_unlock(&lcdshadow_dev->lock);
+
+		drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
+	}
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
