Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB7D5725FF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 21:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF0E964B7;
	Tue, 12 Jul 2022 19:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23ADE964B3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 19:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657654857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+QR0/UkuXQbEkpLhT/cxqgmc7+5vv5fCbfK9rLIbHM=;
 b=bXuixF3DzNZkNBD8YoFyy7ibYvTVOM3MZZKaRuGYe3a3U1oD973lw49BI5//GafFeNj/O/
 HpF4eJx6mSAVnfuL+tG5ArD4iQA17BIDgph0rhsS0Nm2z5l9SSYpDshr/iuQRfZ9ABvAk6
 h8fpMyUnE2yd4j2QPM5l24QvQuSQ96w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-fcQrDpqqMoaa19OBUWyBxw-1; Tue, 12 Jul 2022 15:40:53 -0400
X-MC-Unique: fcQrDpqqMoaa19OBUWyBxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCFB78032F2;
 Tue, 12 Jul 2022 19:40:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28B8C40E80E0;
 Tue, 12 Jul 2022 19:40:47 +0000 (UTC)
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
Subject: [PATCH v2 22/29] platform/x86: asus-wmi: Move acpi_backlight=vendor
 quirks to ACPI video_detect.c
Date: Tue, 12 Jul 2022 21:39:03 +0200
Message-Id: <20220712193910.439171-23-hdegoede@redhat.com>
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

Remove the asus-wmi quirk_entry.wmi_backlight_power quirk-flag, which
called acpi_video_set_dmi_backlight_type(acpi_backlight_vendor) and replace
it with acpi/video_detect.c video_detect_dmi_table[] entries using the
video_detect_force_vendor callback.

acpi_video_set_dmi_backlight_type() is troublesome because it may end up
getting called after other backlight drivers have already called
acpi_video_get_backlight_type() resulting in the other drivers
already being registered even though they should not.

Note no entries are dropped from the dmi_system_id table in asus-nb-wmi.c.
This is because the entries using the removed wmi_backlight_power flag
also use other model specific quirks from the asus-wmi quirk_entry struct.
So the quirk_asus_x55u struct and the entries pointing to it cannot be
dropped.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c        | 40 ++++++++++++++++++++++++++++++
 drivers/platform/x86/asus-nb-wmi.c |  7 ------
 drivers/platform/x86/asus-wmi.c    |  3 ---
 drivers/platform/x86/asus-wmi.h    |  1 -
 drivers/platform/x86/eeepc-wmi.c   | 25 +------------------
 5 files changed, 41 insertions(+), 35 deletions(-)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index cd51cb0d7821..5d5215969f1d 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -172,6 +172,46 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "UL30A"),
 		},
 	},
+	{
+	 .callback = video_detect_force_vendor,
+	 /* Asus X55U */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "X55U"),
+		},
+	},
+	{
+	 .callback = video_detect_force_vendor,
+	 /* Asus X101CH */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "X101CH"),
+		},
+	},
+	{
+	 .callback = video_detect_force_vendor,
+	 /* Asus X401U */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "X401U"),
+		},
+	},
+	{
+	 .callback = video_detect_force_vendor,
+	 /* Asus X501U */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "X501U"),
+		},
+	},
+	{
+	 .callback = video_detect_force_vendor,
+	 /* Asus 1015CX */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "1015CX"),
+		},
+	},
 	{
 	.callback = video_detect_force_vendor,
 	/* GIGABYTE GB-BXBT-2807 */
diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 57a07db659cb..074b4764ee8a 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -79,12 +79,10 @@ static struct quirk_entry quirk_asus_q500a = {
 
 /*
  * For those machines that need software to control bt/wifi status
- * and can't adjust brightness through ACPI interface
  * and have duplicate events(ACPI and WMI) for display toggle
  */
 static struct quirk_entry quirk_asus_x55u = {
 	.wapf = 4,
-	.wmi_backlight_power = true,
 	.wmi_backlight_set_devstate = true,
 	.no_display_toggle = true,
 };
@@ -147,11 +145,6 @@ static const struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer Inc."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "U32U"),
 		},
-		/*
-		 * Note this machine has a Brazos APU, and most Brazos Asus
-		 * machines need quirk_asus_x55u / wmi_backlight_power but
-		 * here acpi-video seems to work fine for backlight control.
-		 */
 		.driver_data = &quirk_asus_wapf4,
 	},
 	{
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 9dab0998cd20..ac3f5606e267 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3609,9 +3609,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (asus->driver->quirks->wmi_force_als_set)
 		asus_wmi_set_als();
 
-	if (asus->driver->quirks->wmi_backlight_power)
-		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
-
 	if (asus->driver->quirks->wmi_backlight_native)
 		acpi_video_set_dmi_backlight_type(acpi_backlight_native);
 
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index b302415bf1d9..30770e411301 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -29,7 +29,6 @@ struct quirk_entry {
 	bool hotplug_wireless;
 	bool scalar_panel_brightness;
 	bool store_backlight_power;
-	bool wmi_backlight_power;
 	bool wmi_backlight_native;
 	bool wmi_backlight_set_devstate;
 	bool wmi_force_als_set;
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index ce86d84ee796..32d9f0ba6be3 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -96,11 +96,6 @@ static struct quirk_entry quirk_asus_et2012_type3 = {
 	.store_backlight_power = true,
 };
 
-static struct quirk_entry quirk_asus_x101ch = {
-	/* We need this when ACPI function doesn't do this well */
-	.wmi_backlight_power = true,
-};
-
 static struct quirk_entry *quirks;
 
 static void et2012_quirks(void)
@@ -151,25 +146,7 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_unknown,
 	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK Computer INC. X101CH",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "X101CH"),
-		},
-		.driver_data = &quirk_asus_x101ch,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK Computer INC. 1015CX",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "1015CX"),
-		},
-		.driver_data = &quirk_asus_x101ch,
-	},
-	{},
+	{}
 };
 
 static void eeepc_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
-- 
2.36.0

