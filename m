Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C415A1431
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 16:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6449510E4B2;
	Thu, 25 Aug 2022 14:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6BB10E45B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661438345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6xVWh0Dc8/uuezucezT0dIDBu1CvpE+lkATuLHa0mA=;
 b=CMEuSpnWBYvglhkiEXSCInT7Islu9yovniZ1cDxyPqih3TN48TLZUJxMQ91/idII1/ZDsW
 CMwxzjXtxDd2HCE1Vpugw0RoRPRSdfLME3iqxGlr+SgnSwu+ND74vJP5Su4prX3FsWtahW
 mjLDDMloeTOYv0lq1xllAct6IoPnqKA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-VgEcgdOyPoKAC69U3_eqUg-1; Thu, 25 Aug 2022 10:38:58 -0400
X-MC-Unique: VgEcgdOyPoKAC69U3_eqUg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 477F3101E985;
 Thu, 25 Aug 2022 14:38:56 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 755592166B2A;
 Thu, 25 Aug 2022 14:38:52 +0000 (UTC)
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
Subject: [PATCH v5 21/31] platform/x86: toshiba_acpi: Stop using
 acpi_video_set_dmi_backlight_type()
Date: Thu, 25 Aug 2022 16:37:16 +0200
Message-Id: <20220825143726.269890-22-hdegoede@redhat.com>
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

acpi_video_set_dmi_backlight_type() is troublesome because it may end up
getting called after other backlight drivers have already called
acpi_video_get_backlight_type() resulting in the other drivers
already being registered even though they should not.

In case of the acpi_video backlight, acpi_video_set_dmi_backlight_type()
actually calls acpi_video_unregister_backlight() since that is often
probed earlier, leading to userspace seeing the acpi_video0 class
device being briefly available, leading to races in userspace where
udev probe-rules try to access the device and it is already gone.

In case of toshiba_acpi there are no DMI quirks to move to
acpi/video_detect.c, but it also (ab)uses it for transflective
displays. Adding transflective display support to video_detect.c would
be quite involved. But luckily there are only 2 known models with
a transflective display, so we can just add DMI quirks for those.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c         | 19 +++++++++++++++++++
 drivers/platform/x86/toshiba_acpi.c | 16 ----------------
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index be2fc43418af..74e2087c8ff0 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -190,6 +190,25 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		},
 	},
 
+	/*
+	 * Toshiba models with Transflective display, these need to use
+	 * the toshiba_acpi vendor driver for proper Transflective handling.
+	 */
+	{
+	 .callback = video_detect_force_vendor,
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "PORTEGE R500"),
+		},
+	},
+	{
+	 .callback = video_detect_force_vendor,
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "PORTEGE R600"),
+		},
+	},
+
 	/*
 	 * These models have a working acpi_video backlight control, and using
 	 * native backlight causes a regression where backlight does not work
diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 0fc9e8b8827b..030dc37d50b8 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -271,14 +271,6 @@ static const struct key_entry toshiba_acpi_alt_keymap[] = {
 	{ KE_END, 0 },
 };
 
-/*
- * List of models which have a broken acpi-video backlight interface and thus
- * need to use the toshiba (vendor) interface instead.
- */
-static const struct dmi_system_id toshiba_vendor_backlight_dmi[] = {
-	{}
-};
-
 /*
  * Utility
  */
@@ -2881,14 +2873,6 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
 		return 0;
 	}
 
-	/*
-	 * Tell acpi-video-detect code to prefer vendor backlight on all
-	 * systems with transflective backlight and on dmi matched systems.
-	 */
-	if (dev->tr_backlight_supported ||
-	    dmi_check_system(toshiba_vendor_backlight_dmi))
-		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
-
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		return 0;
 
-- 
2.37.2

