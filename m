Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615A6572608
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 21:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F6B964CA;
	Tue, 12 Jul 2022 19:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0102D964C7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 19:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657654866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IN+2MbILBTq8EAj5bW31Ky4wdixJFQxoXnYtSMwDdnc=;
 b=EE+RNId+qYG+8D99Lj0QwQ21Tr7Vt5oAML34TOv9BWsYScmnMN4inwwxVGaQdj7w065IWa
 JtzU99uxunHI+Twcyak1ywC9BggmNtcqwHpVsrIRcGZclpcuLCaAn2/QQI1+vQffYKqsJG
 bseb2OL8aKv2d15iQm+v2E7CAaGzACs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-KiUzqHqVPPWJSgiUy31CoA-1; Tue, 12 Jul 2022 15:40:57 -0400
X-MC-Unique: KiUzqHqVPPWJSgiUy31CoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2F4780418F;
 Tue, 12 Jul 2022 19:40:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EF0F40E80E0;
 Tue, 12 Jul 2022 19:40:52 +0000 (UTC)
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
Subject: [PATCH v2 23/29] platform/x86: asus-wmi: Move acpi_backlight=native
 quirks to ACPI video_detect.c
Date: Tue, 12 Jul 2022 21:39:04 +0200
Message-Id: <20220712193910.439171-24-hdegoede@redhat.com>
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

Remove the asus-wmi quirk_entry.wmi_backlight_native quirk-flag, which
called acpi_video_set_dmi_backlight_type(acpi_backlight_native) and replace
it with acpi/video_detect.c video_detect_dmi_table[] entries using the
video_detect_force_native callback.

acpi_video_set_dmi_backlight_type() is troublesome because it may end up
getting called after other backlight drivers have already called
acpi_video_get_backlight_type() resulting in the other drivers
already being registered even though they should not.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c        |  8 ++++++++
 drivers/platform/x86/asus-nb-wmi.c | 14 --------------
 drivers/platform/x86/asus-wmi.c    |  3 ---
 drivers/platform/x86/asus-wmi.h    |  1 -
 4 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 5d5215969f1d..a92322f4caff 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -554,6 +554,14 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "GA503"),
 		},
 	},
+	{
+	 .callback = video_detect_force_native,
+	 /* Asus UX303UB */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "UX303UB"),
+		},
+	},
 	/*
 	 * Clevo NL5xRU and NL5xNU/TUXEDO Aura 15 Gen1 and Gen2 have both a
 	 * working native and video interface. However the default detection
diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 074b4764ee8a..325ccd030a32 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -97,11 +97,6 @@ static struct quirk_entry quirk_asus_x200ca = {
 	.wmi_backlight_set_devstate = true,
 };
 
-static struct quirk_entry quirk_asus_ux303ub = {
-	.wmi_backlight_native = true,
-	.wmi_backlight_set_devstate = true,
-};
-
 static struct quirk_entry quirk_asus_x550lb = {
 	.wmi_backlight_set_devstate = true,
 	.xusb2pr = 0x01D9,
@@ -372,15 +367,6 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_x200ca,
 	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. UX303UB",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "UX303UB"),
-		},
-		.driver_data = &quirk_asus_ux303ub,
-	},
 	{
 		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. UX330UAK",
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index ac3f5606e267..a0df14d35574 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3609,9 +3609,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (asus->driver->quirks->wmi_force_als_set)
 		asus_wmi_set_als();
 
-	if (asus->driver->quirks->wmi_backlight_native)
-		acpi_video_set_dmi_backlight_type(acpi_backlight_native);
-
 	if (asus->driver->quirks->xusb2pr)
 		asus_wmi_set_xusb2pr(asus);
 
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 30770e411301..f30252efe1db 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -29,7 +29,6 @@ struct quirk_entry {
 	bool hotplug_wireless;
 	bool scalar_panel_brightness;
 	bool store_backlight_power;
-	bool wmi_backlight_native;
 	bool wmi_backlight_set_devstate;
 	bool wmi_force_als_set;
 	bool use_kbd_dock_devid;
-- 
2.36.0

