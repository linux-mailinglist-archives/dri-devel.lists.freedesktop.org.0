Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D5A5A1436
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 16:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A112B10E5EA;
	Thu, 25 Aug 2022 14:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2556F10E499
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661438345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nN4WATYtbc2Vngxl9g1chOmA69lp4le/9lX4HXc45WY=;
 b=d4SMHVxMrZO+ltLWTKqeNdso7WxPAbM/PWjhYC9uZfyv9z2TjDo9d7BbPIgouJthUoNdZy
 W/BVEWvFxmrebQw3bR1BYgtiM47l+ywuis8BVMiOZAOeEU2eekIBL+H5WQ6xfHavX8HEc2
 yMlGbK9wZigqd6LeU2SU8hnaYwGEyd0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-TRlqPCd3PTuRIVd2ylDOTA-1; Thu, 25 Aug 2022 10:39:01 -0400
X-MC-Unique: TRlqPCd3PTuRIVd2ylDOTA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73B56101E985;
 Thu, 25 Aug 2022 14:39:00 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B8972166B26;
 Thu, 25 Aug 2022 14:38:56 +0000 (UTC)
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
Subject: [PATCH v5 22/31] platform/x86: acer-wmi: Move backlight DMI quirks to
 acpi/video_detect.c
Date: Thu, 25 Aug 2022 16:37:17 +0200
Message-Id: <20220825143726.269890-23-hdegoede@redhat.com>
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

Move the backlight DMI quirks to acpi/video_detect.c, so that
the driver no longer needs to call acpi_video_set_dmi_backlight_type().

acpi_video_set_dmi_backlight_type() is troublesome because it may end up
getting called after other backlight drivers have already called
acpi_video_get_backlight_type() resulting in the other drivers
already being registered even though they should not.

Note that even though the DMI quirk table name was video_vendor_dmi_table,
5/6 quirks were actually quirks to use the GPU native backlight.

These 5 quirks also had a callback in their dmi_system_id entry which
disabled the acer-wmi vendor driver; and any DMI match resulted in:

	acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);

which disabled the acpi_video driver, so only the native driver was left.
The new entries for these 5/6 devices correctly marks these as needing
the native backlight driver.

Also note that other changes in this series change the native backlight
drivers to no longer unconditionally register their backlight. Instead
these drivers now do this check:

	if (acpi_video_get_backlight_type(false) != acpi_backlight_native)
		return 0; /* bail */

which without this patch would have broken these 5/6 "special" quirks.

Since I had to look at all the commits adding the quirks anyways, to make
sure that I understood the code correctly, I've also added links to
the various original bugzillas for these quirks to the new entries.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c     | 53 ++++++++++++++++++++++++++
 drivers/platform/x86/acer-wmi.c | 66 ---------------------------------
 2 files changed, 53 insertions(+), 66 deletions(-)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 74e2087c8ff0..6a2523bc02ba 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -149,6 +149,15 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_BOARD_NAME, "X360"),
 		},
 	},
+	{
+	 /* https://bugzilla.redhat.com/show_bug.cgi?id=1128309 */
+	 .callback = video_detect_force_vendor,
+	 /* Acer KAV80 */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "KAV80"),
+		},
+	},
 	{
 	.callback = video_detect_force_vendor,
 	/* Asus UL30VT */
@@ -437,6 +446,41 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_BOARD_NAME, "JV50"),
 		},
 	},
+	{
+	 /* https://bugzilla.redhat.com/show_bug.cgi?id=1012674 */
+	 .callback = video_detect_force_native,
+	 /* Acer Aspire 5741 */
+	 .matches = {
+		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5741"),
+		},
+	},
+	{
+	 /* https://bugzilla.kernel.org/show_bug.cgi?id=42993 */
+	 .callback = video_detect_force_native,
+	 /* Acer Aspire 5750 */
+	 .matches = {
+		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5750"),
+		},
+	},
+	{
+	 /* https://bugzilla.kernel.org/show_bug.cgi?id=42833 */
+	 .callback = video_detect_force_native,
+	 /* Acer Extensa 5235 */
+	 .matches = {
+		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "Extensa 5235"),
+		},
+	},
+	{
+	 .callback = video_detect_force_native,
+	 /* Acer TravelMate 4750 */
+	 .matches = {
+		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 4750"),
+		},
+	},
 	{
 	 /* https://bugzilla.kernel.org/show_bug.cgi?id=207835 */
 	 .callback = video_detect_force_native,
@@ -447,6 +491,15 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_BOARD_NAME, "BA51_MV"),
 		},
 	},
+	{
+	 /* https://bugzilla.kernel.org/show_bug.cgi?id=36322 */
+	 .callback = video_detect_force_native,
+	 /* Acer TravelMate 5760 */
+	 .matches = {
+		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 5760"),
+		},
+	},
 	{
 	.callback = video_detect_force_native,
 	/* ASUSTeK COMPUTER INC. GA401 */
diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index e0230ea0cb7e..b933a5165edb 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -643,69 +643,6 @@ static const struct dmi_system_id non_acer_quirks[] __initconst = {
 	{}
 };
 
-static int __init
-video_set_backlight_video_vendor(const struct dmi_system_id *d)
-{
-	interface->capability &= ~ACER_CAP_BRIGHTNESS;
-	pr_info("Brightness must be controlled by generic video driver\n");
-	return 0;
-}
-
-static const struct dmi_system_id video_vendor_dmi_table[] __initconst = {
-	{
-		.callback = video_set_backlight_video_vendor,
-		.ident = "Acer TravelMate 4750",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 4750"),
-		},
-	},
-	{
-		.callback = video_set_backlight_video_vendor,
-		.ident = "Acer Extensa 5235",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Extensa 5235"),
-		},
-	},
-	{
-		.callback = video_set_backlight_video_vendor,
-		.ident = "Acer TravelMate 5760",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 5760"),
-		},
-	},
-	{
-		.callback = video_set_backlight_video_vendor,
-		.ident = "Acer Aspire 5750",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5750"),
-		},
-	},
-	{
-		.callback = video_set_backlight_video_vendor,
-		.ident = "Acer Aspire 5741",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5741"),
-		},
-	},
-	{
-		/*
-		 * Note no video_set_backlight_video_vendor, we must use the
-		 * acer interface, as there is no native backlight interface.
-		 */
-		.ident = "Acer KAV80",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "KAV80"),
-		},
-	},
-	{}
-};
-
 /* Find which quirks are needed for a particular vendor/ model pair */
 static void __init find_quirks(void)
 {
@@ -2477,9 +2414,6 @@ static int __init acer_wmi_init(void)
 
 	set_quirks();
 
-	if (dmi_check_system(video_vendor_dmi_table))
-		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
-
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		interface->capability &= ~ACER_CAP_BRIGHTNESS;
 
-- 
2.37.2

