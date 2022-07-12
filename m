Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE00D57260A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 21:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA84964E5;
	Tue, 12 Jul 2022 19:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB499648D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 19:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657654872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2WK3kAcxEEkkbv9pOh1xIkmngcweoSFUQNmrVAb4yRo=;
 b=bSoHjqXXppFDZQ2coM8dLKGob4BQJ/XbTyZReuhGRR5acT44ufl/4ENI3qvMyIgplS3fsv
 YlU0XhYTg64ZJq/Q7CjQkeABny1OQgvWUl2lS11/eScY9mT6hDaEdsDSNBcNQor3WARw5m
 o6fWdpqK1Wr9vpeckZ3fSEDg7x26r3o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-aKYw3J9FNyiVVAeTYZ7eDw-1; Tue, 12 Jul 2022 15:41:05 -0400
X-MC-Unique: aKYw3J9FNyiVVAeTYZ7eDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9C56299E764;
 Tue, 12 Jul 2022 19:41:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEC5840E80E0;
 Tue, 12 Jul 2022 19:40:59 +0000 (UTC)
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
Subject: [PATCH v2 25/29] ACPI: video: Remove
 acpi_video_set_dmi_backlight_type()
Date: Tue, 12 Jul 2022 21:39:06 +0200
Message-Id: <20220712193910.439171-26-hdegoede@redhat.com>
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

acpi_video_set_dmi_backlight_type() is troublesome because it may end
up getting called after other backlight drivers have already called
acpi_video_get_backlight_type() resulting in the other drivers
already being registered even though they should not.

In case of the acpi_video backlight, acpi_video_set_dmi_backlight_type()
actually calls acpi_video_unregister_backlight() since that is often
probed earlier, leading to userspace seeing the acpi_video0 class
device being briefly available, leading to races in userspace where
udev probe-rules try to access the device and it is already gone.

All callers have been fixed to no longer call it, so remove
acpi_video_set_dmi_backlight_type() now.

This means we now also no longer need acpi_video_unregister_backlight()
for the remove acpi_video backlight after it was wrongly registered hack,
so remove that too.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/acpi_video.c   | 10 ----------
 drivers/acpi/video_detect.c | 16 ----------------
 include/acpi/video.h        |  4 ----
 3 files changed, 30 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 4fc2a8100865..dc3c037d6313 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -2297,16 +2297,6 @@ void acpi_video_register_backlight(void)
 }
 EXPORT_SYMBOL(acpi_video_register_backlight);
 
-void acpi_video_unregister_backlight(void)
-{
-	struct acpi_video_bus *video;
-
-	mutex_lock(&video_list_lock);
-	list_for_each_entry(video, &video_bus_head, entry)
-		acpi_video_bus_unregister_backlight(video);
-	mutex_unlock(&video_list_lock);
-}
-
 bool acpi_video_handles_brightness_key_presses(void)
 {
 	return has_backlight &&
diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 84dce2c113ef..351bd6335d7a 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -37,8 +37,6 @@
 #include <linux/workqueue.h>
 #include <acpi/video.h>
 
-void acpi_video_unregister_backlight(void);
-
 static enum acpi_backlight_type acpi_backlight_cmdline = acpi_backlight_undef;
 static enum acpi_backlight_type acpi_backlight_dmi = acpi_backlight_undef;
 
@@ -792,17 +790,3 @@ bool acpi_video_backlight_use_native(void)
 	return __acpi_video_get_backlight_type(true) == acpi_backlight_native;
 }
 EXPORT_SYMBOL(acpi_video_backlight_use_native);
-
-/*
- * Set the preferred backlight interface type based on DMI info.
- * This function allows DMI blacklists to be implemented by external
- * platform drivers instead of putting a big blacklist in video_detect.c
- */
-void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type)
-{
-	acpi_backlight_dmi = type;
-	/* Remove acpi-video backlight interface if it is no longer desired */
-	if (acpi_video_get_backlight_type() != acpi_backlight_video)
-		acpi_video_unregister_backlight();
-}
-EXPORT_SYMBOL(acpi_video_set_dmi_backlight_type);
diff --git a/include/acpi/video.h b/include/acpi/video.h
index dbd48cb8bd23..a275c35e5249 100644
--- a/include/acpi/video.h
+++ b/include/acpi/video.h
@@ -60,7 +60,6 @@ extern int acpi_video_get_edid(struct acpi_device *device, int type,
 			       int device_id, void **edid);
 extern enum acpi_backlight_type acpi_video_get_backlight_type(void);
 extern bool acpi_video_backlight_use_native(void);
-extern void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type);
 /*
  * Note: The value returned by acpi_video_handles_brightness_key_presses()
  * may change over time and should not be cached.
@@ -86,9 +85,6 @@ static inline bool acpi_video_backlight_use_native(void)
 {
 	return true;
 }
-static inline void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type)
-{
-}
 static inline bool acpi_video_handles_brightness_key_presses(void)
 {
 	return false;
-- 
2.36.0

