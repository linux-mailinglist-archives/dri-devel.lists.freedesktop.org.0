Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DCD598B9A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 20:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DF010EB5C;
	Thu, 18 Aug 2022 18:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A01010E2FE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660848238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odfSBCZPzbhtIghrqB9jKxIVVOwBiMpifs1qKmZ4b0A=;
 b=d7IGJCrxjDwqbJ9cDbq+mAaSBhQXYbCI828MyWwAnzoG7rqlwijuKQFmjYv/5cEivg3g1t
 C7gCvButGjnziCV2PgoMGegfj5pc18Q0cxAl6NQRHovsTs+Ze98nRQyuNEps6YPTXsNSZQ
 ua12E3T27D2RnBuqTWqXRdMmOR4vTUw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-O3MfdwJOPLq_KpMwjxlGMA-1; Thu, 18 Aug 2022 14:43:56 -0400
X-MC-Unique: O3MfdwJOPLq_KpMwjxlGMA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBEEA3C0D879;
 Thu, 18 Aug 2022 18:43:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 267E8492C3B;
 Thu, 18 Aug 2022 18:43:51 +0000 (UTC)
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
Subject: [PATCH v3 10/31] ACPI: video: Remove code to unregister acpi_video
 backlight when a native backlight registers
Date: Thu, 18 Aug 2022 20:42:41 +0200
Message-Id: <20220818184302.10051-11-hdegoede@redhat.com>
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
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the code to unregister acpi_video backlight devices when
a native backlight device gets registered later.

Now that the acpi_video backlight device registration is a separate step
which runs later, after the drm/kms driver is done setting up its own
native backlight device, it is no longer necessary to monitor for a
native (BACKLIGHT_RAW) device showing up later and to then unregister
the acpi_video backlight device(s).

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/acpi_video.c   |  2 --
 drivers/acpi/video_detect.c | 36 ------------------------------------
 2 files changed, 38 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 09dd86f86cf3..d1e41f30c004 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -94,7 +94,6 @@ static void acpi_video_bus_notify(struct acpi_device *device, u32 event);
 static void acpi_video_bus_register_backlight_work(struct work_struct *ignored);
 static DECLARE_DELAYED_WORK(video_bus_register_backlight_work,
 			    acpi_video_bus_register_backlight_work);
-void acpi_video_detect_exit(void);
 
 /*
  * Indices in the _BCL method response: the first two items are special,
@@ -2342,7 +2341,6 @@ static int __init acpi_video_init(void)
 
 static void __exit acpi_video_exit(void)
 {
-	acpi_video_detect_exit();
 	acpi_video_unregister();
 }
 
diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 385eb49c763f..fb49b8f4523a 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -38,10 +38,6 @@
 
 void acpi_video_unregister_backlight(void);
 
-static bool backlight_notifier_registered;
-static struct notifier_block backlight_nb;
-static struct work_struct backlight_notify_work;
-
 static enum acpi_backlight_type acpi_backlight_cmdline = acpi_backlight_undef;
 static enum acpi_backlight_type acpi_backlight_dmi = acpi_backlight_undef;
 
@@ -538,26 +534,6 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 	{ },
 };
 
-/* This uses a workqueue to avoid various locking ordering issues */
-static void acpi_video_backlight_notify_work(struct work_struct *work)
-{
-	if (acpi_video_get_backlight_type() != acpi_backlight_video)
-		acpi_video_unregister_backlight();
-}
-
-static int acpi_video_backlight_notify(struct notifier_block *nb,
-				       unsigned long val, void *bd)
-{
-	struct backlight_device *backlight = bd;
-
-	/* A raw bl registering may change video -> native */
-	if (backlight->props.type == BACKLIGHT_RAW &&
-	    val == BACKLIGHT_REGISTERED)
-		schedule_work(&backlight_notify_work);
-
-	return NOTIFY_OK;
-}
-
 /*
  * Determine which type of backlight interface to use on this system,
  * First check cmdline, then dmi quirks, then do autodetect.
@@ -587,12 +563,6 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
 		acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
 				    ACPI_UINT32_MAX, find_video, NULL,
 				    &video_caps, NULL);
-		INIT_WORK(&backlight_notify_work,
-			  acpi_video_backlight_notify_work);
-		backlight_nb.notifier_call = acpi_video_backlight_notify;
-		backlight_nb.priority = 0;
-		if (backlight_register_notifier(&backlight_nb) == 0)
-			backlight_notifier_registered = true;
 		init_done = true;
 	}
 	if (native)
@@ -639,9 +609,3 @@ void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type)
 		acpi_video_unregister_backlight();
 }
 EXPORT_SYMBOL(acpi_video_set_dmi_backlight_type);
-
-void __exit acpi_video_detect_exit(void)
-{
-	if (backlight_notifier_registered)
-		backlight_unregister_notifier(&backlight_nb);
-}
-- 
2.37.2

