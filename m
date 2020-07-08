Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC16218D5A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 18:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDE16E8F0;
	Wed,  8 Jul 2020 16:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9026E8EF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594226653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iBcR8YBNpayL+NbYNHe7mgR4zl0uH9CwMgEjXRTSxL8=;
 b=EA3Yr1aLRJVF2ZYRQgdXfDhIbQBXHDBy9WnBinVPTIfBMDLuWrUlIOHj9+VypS+Cyrh3Vc
 T/I/SPbj54XvC9vMzYOsBTktqJjziDJSGupxcSnXqxcIcQWIiZfv8N+5ElG3wB1+M+itMM
 1xkbViC6RpVwvVCazIFpUD+/hwZlJo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-aB4tdORzM62x_wlsNvhw-g-1; Wed, 08 Jul 2020 12:44:10 -0400
X-MC-Unique: aB4tdORzM62x_wlsNvhw-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B0AA8F6CC4;
 Wed,  8 Jul 2020 16:44:08 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-5.ams2.redhat.com [10.36.112.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B17135F7D8;
 Wed,  8 Jul 2020 16:44:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 8/9] platform/x86: thinkpad_acpi: Register a privacy-screen
 device
Date: Wed,  8 Jul 2020 18:43:34 +0200
Message-Id: <20200708164335.25097-9-hdegoede@redhat.com>
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
 drivers/platform/x86/Kconfig         |  1 +
 drivers/platform/x86/thinkpad_acpi.c | 76 +++++++++++++++++++---------
 2 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 318e083f38b3..db427ab86292 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -617,6 +617,7 @@ config THINKPAD_ACPI
 	depends on RFKILL || RFKILL = n
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_PRIVACY_SCREEN
 	select HWMON
 	select NVRAM
 	select NEW_LEDS
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 782e74d3167f..7e7edac26f83 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -72,6 +72,7 @@
 #include <linux/uaccess.h>
 #include <acpi/battery.h>
 #include <acpi/video.h>
+#include <drm/drm_privacy_screen_driver.h>
 
 /* ThinkPad CMOS commands */
 #define TP_CMOS_VOLUME_DOWN	0
@@ -9699,30 +9700,40 @@ static struct ibm_struct battery_driver_data = {
  * LCD Shadow subdriver, for the Lenovo PrivacyGuard feature
  */
 
+static struct drm_privacy_screen *lcdshadow_dev;
 static acpi_handle lcdshadow_get_handle;
 static acpi_handle lcdshadow_set_handle;
-static int lcdshadow_state;
 
-static int lcdshadow_on_off(bool state)
+int lcdshadow_set_sw_state(struct drm_privacy_screen *priv,
+			   enum drm_privacy_screen_status state)
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
+void lcdshadow_get_hw_state(struct drm_privacy_screen *priv)
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
 
+const struct drm_privacy_screen_ops lcdshadow_ops = {
+	.set_sw_state = lcdshadow_set_sw_state,
+	.get_hw_state = lcdshadow_get_hw_state,
+};
+
 static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
 {
 	acpi_status status1, status2;
@@ -9730,36 +9741,44 @@ static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
 
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
 
@@ -9771,7 +9790,7 @@ static int lcdshadow_write(char *buf)
 	char *cmd;
 	int res, state = -EINVAL;
 
-	if (lcdshadow_state < 0)
+	if (!lcdshadow_dev)
 		return -ENODEV;
 
 	while ((cmd = strsep(&buf, ","))) {
@@ -9783,11 +9802,18 @@ static int lcdshadow_write(char *buf)
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
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
