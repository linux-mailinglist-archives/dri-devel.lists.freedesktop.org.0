Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7CB598BAD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 20:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFE510EA14;
	Thu, 18 Aug 2022 18:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BC110EC9D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660848276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMRBJxq87CBXyk/TjPWjUIyp8oSUCkcWSAUi9s9Ld4I=;
 b=F+mA5SuUGkFs4A6KreTMfuBxAjbGBYPCIZx0n67Rb66pJXjSw7s7NwVtPM4OY9YY5yPTE/
 FRPBC+XNGQwdFNoUu/1tAI4J2dK0s623llTaLQYMhl4pWJQAbFzHZto0aEbUdlbuqRqP6E
 jw3J0IJkNx2AIsCyAshZOB8uPoHVut4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-N4vyCZg2NLqv7PDiTSNnDw-1; Thu, 18 Aug 2022 14:44:31 -0400
X-MC-Unique: N4vyCZg2NLqv7PDiTSNnDw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CCB03C0E231;
 Thu, 18 Aug 2022 18:44:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A986F492C3B;
 Thu, 18 Aug 2022 18:44:26 +0000 (UTC)
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
Subject: [PATCH v3 19/31] platform/x86: nvidia-wmi-ec-backlight: Use
 acpi_video_get_backlight_type()
Date: Thu, 18 Aug 2022 20:42:50 +0200
Message-Id: <20220818184302.10051-20-hdegoede@redhat.com>
In-Reply-To: <20220818184302.10051-1-hdegoede@redhat.com>
References: <20220818184302.10051-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

Add an acpi_video_get_backlight_type() == acpi_backlight_nvidia_wmi_ec
check. This will make nvidia-wmi-ec-backlight properly honor the user
selecting a different backlight driver through the acpi_backlight=...
kernel commandline option.

Since the auto-detect code check for nvidia-wmi-ec-backlight in
drivers/acpi/video_detect.c already checks that the WMI advertised
brightness-source is the embedded controller, this new check makes it
unnecessary for nvidia_wmi_ec_backlight_probe() to check this itself.

Suggested-by: Daniel Dadap <ddadap@nvidia.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig                   |  1 +
 drivers/platform/x86/nvidia-wmi-ec-backlight.c | 14 +++-----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f2f98e942cf2..0cc5ac35fc57 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -93,6 +93,7 @@ config PEAQ_WMI
 
 config NVIDIA_WMI_EC_BACKLIGHT
 	tristate "EC Backlight Driver for Hybrid Graphics Notebook Systems"
+	depends on ACPI_VIDEO
 	depends on ACPI_WMI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
index e84e1d629b14..83d544180264 100644
--- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
+++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
@@ -10,6 +10,7 @@
 #include <linux/platform_data/x86/nvidia-wmi-ec-backlight.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
+#include <acpi/video.h>
 
 /**
  * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
@@ -87,19 +88,10 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
 {
 	struct backlight_properties props = {};
 	struct backlight_device *bdev;
-	u32 source;
 	int ret;
 
-	ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
-	                           WMI_BRIGHTNESS_MODE_GET, &source);
-	if (ret)
-		return ret;
-
-	/*
-	 * This driver is only to be used when brightness control is handled
-	 * by the EC; otherwise, the GPU driver(s) should control brightness.
-	 */
-	if (source != WMI_BRIGHTNESS_SOURCE_EC)
+	/* drivers/acpi/video_detect.c also checks that SOURCE == EC */
+	if (acpi_video_get_backlight_type() != acpi_backlight_nvidia_wmi_ec)
 		return -ENODEV;
 
 	/*
-- 
2.37.2

