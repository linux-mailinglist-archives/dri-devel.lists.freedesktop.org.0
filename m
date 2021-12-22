Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE4447CA1C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 01:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F050A10E177;
	Wed, 22 Dec 2021 00:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F3110E15C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:11:34 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 q198-20020a25d9cf000000b005f7a6a84f9fso925414ybg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 16:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=KzTr90ejPJE8HdDypHQDsmZrj3e3MqvSPqeCdgJc0rI=;
 b=UBq/MTGQRmQVvC/ixyRHkflqHgmdv3ByvcJx7AncW2cGkVpamMGXFaKzZdKinH6ILq
 O+xdWTrMSgg8+sqvDatoR3VVVMu/EhUe0XDSmlT3W8g5FGcGfFOZYpjeKlextWHkWPho
 6UzY4n1Nq4dkLtEyqRiL2DJYSma6/JBBHRQxwrE5iIRregro91FU5x8rQ4AAt1p/T5f0
 p4g9K26Qv63C9ypvk6IJ60JZa3rt+1ophSJAS67Cw/6qkCd28wTE7yF8Z8K+UlRk3hM3
 d8VYhKI8QUpbZq7ZuqxSgWklu6OFC8EnJCkHpdzVRwiVrBEAgpnDXIgXCfNk7jATzLvW
 7WAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=KzTr90ejPJE8HdDypHQDsmZrj3e3MqvSPqeCdgJc0rI=;
 b=rSBdT9RGdIWzFVFRV3yTtEDPA1Ixp9B1H340acYIBAJ4jEHT1ekGKflmxjQQ9JaHAJ
 blDxaaMKc/wS+XimPAOc9xvdYq8Xa53Ct63BhSHIetliZTklgi9eB72uCrW+I2Ll1BVj
 0hQOgMSOudzDtUO6Q7+MTxYZvixCj0vBrIn2WfETLJK+ZwTlPwY03xHWRVmY1PFzfwn7
 GH2iqVycp3j3kEVH7I56TJGN4TeA96NgXrbmphRE8W/QCEcCz/DYj54tYhf/nR15mPU9
 EdWCjW2sxbeX2+bLo6WEwFvDVXl6S+xc5bCWQoR9I7GjPgWgASyzoqGXHG4zgA77a4cT
 73ww==
X-Gm-Message-State: AOAM532mAot6VmDpUhoSgEls9y6R91i0kbW7PGVieaI4CGH8knnpMGot
 GLziDG22hLZBe9I4Dfpyrh3cD9IqovFv
X-Google-Smtp-Source: ABdhPJxIXtQLRRUwLAcILiDA4y9o38G0/GBpFnBCjvoXMfnkvL4PInURJr1lVvV+mLSjGwJxN0nnVbFfFOxe
X-Received: from rajat2.mtv.corp.google.com
 ([2620:15c:202:201:8d27:feea:1b0b:3782])
 (user=rajatja job=sendgmr) by 2002:a25:1381:: with SMTP id
 123mr1081788ybt.168.1640131894078; Tue, 21 Dec 2021 16:11:34 -0800 (PST)
Date: Tue, 21 Dec 2021 16:11:26 -0800
In-Reply-To: <20211222001127.3337471-1-rajatja@google.com>
Message-Id: <20211222001127.3337471-2-rajatja@google.com>
Mime-Version: 1.0
References: <20211222001127.3337471-1-rajatja@google.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [PATCH v4 2/3] platform/chrome: Add driver for ChromeOS privacy-screen
From: Rajat Jain <rajatja@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Benson Leung <bleung@chromium.org>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Mark Gross <markgross@kernel.org>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, gwendal@google.com, seanpaul@google.com, 
 marcheu@google.com, dtor@google.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds the ACPI driver for the ChromeOS privacy screen that is
present on some chromeos devices.

Note that ideally, we'd want this privacy screen driver to be probed
BEFORE the drm probe in order to avoid a drm probe deferral:
https://hansdegoede.livejournal.com/25948.html

In practise, I found that ACPI drivers are bound to their devices AFTER
the drm probe on chromebooks. So on chromebooks with privacy-screen,
this patch along with the other one in this series results in a probe
deferral of about 250ms for i915 driver. However, it did not result in
any user noticeable delay of splash screen in my personal experience.

In future if this probe deferral turns out to be an issue, we can
consider turning this ACPI driver into something that is probed
earlier than the drm drivers.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v4: Same as v3 (No changes)
v3: * Renamed everything chromeos_priv_scrn_* to chromeos_privacy_screen_*
     (and added line breaks to accommodate longer names within 80 chars)
    * Cleanup / Added few comments
    * Use the newly added drm_privacy_screen_get_drvdata()
    * Provide the cleanup function chromeos_privacy_screen_remove()
v2: * Reword the commit log
    * Make the Kconfig into a tristate
    * Reorder the patches in the series.

 drivers/platform/chrome/Kconfig               |  11 ++
 drivers/platform/chrome/Makefile              |   1 +
 .../platform/chrome/chromeos_privacy_screen.c | 152 ++++++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 drivers/platform/chrome/chromeos_privacy_screen.c

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index ccc23d8686e8..75e93efd669f 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -243,6 +243,17 @@ config CROS_USBPD_NOTIFY
 	  To compile this driver as a module, choose M here: the
 	  module will be called cros_usbpd_notify.
 
+config CHROMEOS_PRIVACY_SCREEN
+	tristate "ChromeOS Privacy Screen support"
+	depends on ACPI
+	depends on DRM
+	select DRM_PRIVACY_SCREEN
+	help
+	  This driver provides the support needed for the in-built electronic
+	  privacy screen that is present on some ChromeOS devices. When enabled,
+	  this should probably always be built into the kernel to avoid or
+	  minimize drm probe deferral.
+
 source "drivers/platform/chrome/wilco_ec/Kconfig"
 
 endif # CHROMEOS_PLATFORMS
diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
index f901d2e43166..5d4be9735d9d 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -4,6 +4,7 @@
 CFLAGS_cros_ec_trace.o:=		-I$(src)
 
 obj-$(CONFIG_CHROMEOS_LAPTOP)		+= chromeos_laptop.o
+obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)	+= chromeos_privacy_screen.o
 obj-$(CONFIG_CHROMEOS_PSTORE)		+= chromeos_pstore.o
 obj-$(CONFIG_CHROMEOS_TBMC)		+= chromeos_tbmc.o
 obj-$(CONFIG_CROS_EC)			+= cros_ec.o
diff --git a/drivers/platform/chrome/chromeos_privacy_screen.c b/drivers/platform/chrome/chromeos_privacy_screen.c
new file mode 100644
index 000000000000..07c9f257c723
--- /dev/null
+++ b/drivers/platform/chrome/chromeos_privacy_screen.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ *  ChromeOS Privacy Screen support
+ *
+ * Copyright (C) 2022 Google LLC
+ *
+ * This is the Chromeos privacy screen provider, present on certain chromebooks,
+ * represented by a GOOG0010 device in the ACPI. This ACPI device, if present,
+ * will cause the i915 drm driver to probe defer until this driver registers
+ * the privacy-screen.
+ */
+
+#include <linux/acpi.h>
+#include <drm/drm_privacy_screen_driver.h>
+
+/*
+ * The DSM (Device Specific Method) constants below are the agreed API with
+ * the firmware team, on how to control privacy screen using ACPI methods.
+ */
+#define PRIV_SCRN_DSM_REVID		1	/* DSM version */
+#define PRIV_SCRN_DSM_FN_GET_STATUS	1	/* Get privacy screen status */
+#define PRIV_SCRN_DSM_FN_ENABLE		2	/* Enable privacy screen */
+#define PRIV_SCRN_DSM_FN_DISABLE	3	/* Disable privacy screen */
+
+static const guid_t chromeos_privacy_screen_dsm_guid =
+		    GUID_INIT(0xc7033113, 0x8720, 0x4ceb,
+			      0x90, 0x90, 0x9d, 0x52, 0xb3, 0xe5, 0x2d, 0x73);
+
+static void
+chromeos_privacy_screen_get_hw_state(struct drm_privacy_screen
+				     *drm_privacy_screen)
+{
+	union acpi_object *obj;
+	acpi_handle handle;
+	struct device *privacy_screen =
+		drm_privacy_screen_get_drvdata(drm_privacy_screen);
+
+	handle = acpi_device_handle(to_acpi_device(privacy_screen));
+	obj = acpi_evaluate_dsm(handle, &chromeos_privacy_screen_dsm_guid,
+				PRIV_SCRN_DSM_REVID,
+				PRIV_SCRN_DSM_FN_GET_STATUS, NULL);
+	if (!obj) {
+		dev_err(privacy_screen,
+			"_DSM failed to get privacy-screen state\n");
+		return;
+	}
+
+	if (obj->type != ACPI_TYPE_INTEGER)
+		dev_err(privacy_screen,
+			"Bad _DSM to get privacy-screen state\n");
+	else if (obj->integer.value == 1)
+		drm_privacy_screen->hw_state = drm_privacy_screen->sw_state =
+			PRIVACY_SCREEN_ENABLED;
+	else
+		drm_privacy_screen->hw_state = drm_privacy_screen->sw_state =
+			PRIVACY_SCREEN_DISABLED;
+
+	ACPI_FREE(obj);
+}
+
+static int
+chromeos_privacy_screen_set_sw_state(struct drm_privacy_screen
+				     *drm_privacy_screen,
+				     enum drm_privacy_screen_status state)
+{
+	union acpi_object *obj = NULL;
+	acpi_handle handle;
+	struct device *privacy_screen =
+		drm_privacy_screen_get_drvdata(drm_privacy_screen);
+
+	handle = acpi_device_handle(to_acpi_device(privacy_screen));
+
+	if (state == PRIVACY_SCREEN_DISABLED) {
+		obj = acpi_evaluate_dsm(handle,
+					&chromeos_privacy_screen_dsm_guid,
+					PRIV_SCRN_DSM_REVID,
+					PRIV_SCRN_DSM_FN_DISABLE, NULL);
+	} else if (state == PRIVACY_SCREEN_ENABLED) {
+		obj = acpi_evaluate_dsm(handle,
+					&chromeos_privacy_screen_dsm_guid,
+					PRIV_SCRN_DSM_REVID,
+					PRIV_SCRN_DSM_FN_ENABLE, NULL);
+	} else {
+		dev_err(privacy_screen,
+			"Bad attempt to set privacy-screen status to %u\n",
+			state);
+		return -EINVAL;
+	}
+
+	if (!obj) {
+		dev_err(privacy_screen,
+			"_DSM failed to set privacy-screen state\n");
+		return -EIO;
+	}
+
+	drm_privacy_screen->hw_state = drm_privacy_screen->sw_state = state;
+	ACPI_FREE(obj);
+	return 0;
+}
+
+static const struct drm_privacy_screen_ops chromeos_privacy_screen_ops = {
+	.get_hw_state = chromeos_privacy_screen_get_hw_state,
+	.set_sw_state = chromeos_privacy_screen_set_sw_state,
+};
+
+static int chromeos_privacy_screen_add(struct acpi_device *adev)
+{
+	struct drm_privacy_screen *drm_privacy_screen =
+		drm_privacy_screen_register(&adev->dev,
+					    &chromeos_privacy_screen_ops,
+					    &adev->dev);
+
+	if (IS_ERR(drm_privacy_screen)) {
+		dev_err(&adev->dev, "Error registering privacy-screen\n");
+		return PTR_ERR(drm_privacy_screen);
+	}
+
+	adev->driver_data = drm_privacy_screen;
+	dev_info(&adev->dev, "registered privacy-screen '%s'\n",
+		 dev_name(&drm_privacy_screen->dev));
+
+	return 0;
+}
+
+static int chromeos_privacy_screen_remove(struct acpi_device *adev)
+{
+	struct drm_privacy_screen *drm_privacy_screen =	acpi_driver_data(adev);
+	drm_privacy_screen_unregister(drm_privacy_screen);
+	return 0;
+}
+
+static const struct acpi_device_id chromeos_privacy_screen_device_ids[] = {
+	{"GOOG0010", 0}, /* Google's electronic privacy screen for eDP-1 */
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, chromeos_privacy_screen_device_ids);
+
+static struct acpi_driver chromeos_privacy_screen_driver = {
+	.name = "chromeos_privacy_screen_drvr",
+	.class = "ChromeOS",
+	.ids = chromeos_privacy_screen_device_ids,
+	.ops = {
+		.add = chromeos_privacy_screen_add,
+		.remove = chromeos_privacy_screen_remove,
+	},
+};
+
+module_acpi_driver(chromeos_privacy_screen_driver);
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("ChromeOS ACPI Privacy Screen driver");
+MODULE_AUTHOR("Rajat Jain <rajatja@google.com>");
-- 
2.34.1.307.g9b7440fafd-goog

