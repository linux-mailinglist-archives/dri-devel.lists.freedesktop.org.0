Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EAA952265
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 21:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7736310E0A3;
	Wed, 14 Aug 2024 19:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iO7WX3GR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CF710E0A3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 19:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723662129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/HYaNpt+Hxgow8hyB4/IctLXMbXyzlPpsD0bDBpFGE=;
 b=iO7WX3GRt0MV46FXNGAbx4k2c4QCP/hVNfAms7apnm9MO/Uz/H/gEhwigawdlMzK8nMm8V
 gTIn5U3z+zxcrZP3oKmDfuB7/mSh45q0WvRPFt8ByHuxJf3Gkn13sLgmMxywiaqAma+pje
 oyJCl2AUItokXyHEXfjd7MTtEb1jQis=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-264-9ojPAhtCPGakEkwjO7Rkug-1; Wed,
 14 Aug 2024 15:02:08 -0400
X-MC-Unique: 9ojPAhtCPGakEkwjO7Rkug-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6099A1944CEE; Wed, 14 Aug 2024 19:02:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.22])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AC0AB19560AA; Wed, 14 Aug 2024 19:02:03 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH 1/3] ACPI: video: Add Dell UART backlight controller detection
Date: Wed, 14 Aug 2024 21:01:57 +0200
Message-ID: <20240814190159.15650-2-hdegoede@redhat.com>
In-Reply-To: <20240814190159.15650-1-hdegoede@redhat.com>
References: <20240814190159.15650-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dell All In One (AIO) models released after 2017 use a backlight
controller board connected to an UART.

In DSDT this uart port will be defined as:

   Name (_HID, "DELL0501")
   Name (_CID, EisaId ("PNP0501")

Commit 484bae9e4d6a ("platform/x86: Add new Dell UART backlight driver")
has added support for this, but I neglected to tie this into
acpi_video_get_backlight_type().

Now the first AIO has turned up which has not only the DSDT bits for this,
but also an actual controller attached to the UART, yet it is not using
this controller for backlight control.

Add support to acpi_video_get_backlight_type() for a new dell_uart
backlight type. So that the existing infra to override the backlight
control method on the commandline or with DMI quirks can be used.

Fixes: 484bae9e4d6a ("platform/x86: Add new Dell UART backlight driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c | 7 +++++++
 include/acpi/video.h        | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index c11cbe5b6eaa..e509dcbf3090 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -54,6 +54,8 @@ static void acpi_video_parse_cmdline(void)
 		acpi_backlight_cmdline = acpi_backlight_nvidia_wmi_ec;
 	if (!strcmp("apple_gmux", acpi_video_backlight_string))
 		acpi_backlight_cmdline = acpi_backlight_apple_gmux;
+	if (!strcmp("dell_uart", acpi_video_backlight_string))
+		acpi_backlight_cmdline = acpi_backlight_dell_uart;
 	if (!strcmp("none", acpi_video_backlight_string))
 		acpi_backlight_cmdline = acpi_backlight_none;
 }
@@ -918,6 +920,7 @@ enum acpi_backlight_type __acpi_video_get_backlight_type(bool native, bool *auto
 	static DEFINE_MUTEX(init_mutex);
 	static bool nvidia_wmi_ec_present;
 	static bool apple_gmux_present;
+	static bool dell_uart_present;
 	static bool native_available;
 	static bool init_done;
 	static long video_caps;
@@ -932,6 +935,7 @@ enum acpi_backlight_type __acpi_video_get_backlight_type(bool native, bool *auto
 				    &video_caps, NULL);
 		nvidia_wmi_ec_present = nvidia_wmi_ec_supported();
 		apple_gmux_present = apple_gmux_detect(NULL, NULL);
+		dell_uart_present = acpi_dev_present("DELL0501", NULL, -1);
 		init_done = true;
 	}
 	if (native)
@@ -962,6 +966,9 @@ enum acpi_backlight_type __acpi_video_get_backlight_type(bool native, bool *auto
 	if (apple_gmux_present)
 		return acpi_backlight_apple_gmux;
 
+	if (dell_uart_present)
+		return acpi_backlight_dell_uart;
+
 	/* Use ACPI video if available, except when native should be preferred. */
 	if ((video_caps & ACPI_VIDEO_BACKLIGHT) &&
 	     !(native_available && prefer_native_over_acpi_video()))
diff --git a/include/acpi/video.h b/include/acpi/video.h
index 3d538d4178ab..044c463138df 100644
--- a/include/acpi/video.h
+++ b/include/acpi/video.h
@@ -50,6 +50,7 @@ enum acpi_backlight_type {
 	acpi_backlight_native,
 	acpi_backlight_nvidia_wmi_ec,
 	acpi_backlight_apple_gmux,
+	acpi_backlight_dell_uart,
 };
 
 #if IS_ENABLED(CONFIG_ACPI_VIDEO)
-- 
2.46.0

