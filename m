Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0355A1441
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 16:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6587210E5E8;
	Thu, 25 Aug 2022 14:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C024410E499
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 14:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661438336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C30+JylXoiqfCL1QVhV6xN5vRbXmIR8YpoQkV4jNNtM=;
 b=jLHKpv4Lnkx+Qio0fxOf93gxsqQ03zxYTXsHw/g3D3YUL/DWBtC/N1Gnb7qljxQA0x+GO7
 PiavlNc8nvJ64168qvsTDHl1kKfxcemkSwWfaK3GoBJdpvOkfiqXGkHjY+LhUWfnW0lAHt
 Pg0E8sVVjs+fNZVuzzwyQtKyn+GzQY0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-EFVMyU7XOF2abnvZZSK7Ig-1; Thu, 25 Aug 2022 10:38:45 -0400
X-MC-Unique: EFVMyU7XOF2abnvZZSK7Ig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E6D71C004F7;
 Thu, 25 Aug 2022 14:38:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 962952166B26;
 Thu, 25 Aug 2022 14:38:40 +0000 (UTC)
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
Subject: [PATCH v5 18/31] ACPI: video: Add Apple GMUX brightness control
 detection
Date: Thu, 25 Aug 2022 16:37:13 +0200
Message-Id: <20220825143726.269890-19-hdegoede@redhat.com>
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

On Apple laptops with an Apple GMUX using this for brightness control,
should take precedence of any other brightness control methods.

Add apple-gmux detection to acpi_video_get_backlight_type() using
the already existing apple_gmux_present() helper function.

This will allow removig the (ab)use of:

	acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);

Inside the apple-gmux driver.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c | 4 ++++
 include/acpi/video.h        | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 4dc7fb865083..be2fc43418af 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -28,6 +28,7 @@
 
 #include <linux/export.h>
 #include <linux/acpi.h>
+#include <linux/apple-gmux.h>
 #include <linux/backlight.h>
 #include <linux/dmi.h>
 #include <linux/module.h>
@@ -607,6 +608,9 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
 	if (nvidia_wmi_ec_present)
 		return acpi_backlight_nvidia_wmi_ec;
 
+	if (apple_gmux_present())
+		return acpi_backlight_apple_gmux;
+
 	/* On systems with ACPI video use either native or ACPI video. */
 	if (video_caps & ACPI_VIDEO_BACKLIGHT) {
 		/*
diff --git a/include/acpi/video.h b/include/acpi/video.h
index 91578e77ac4e..dbd48cb8bd23 100644
--- a/include/acpi/video.h
+++ b/include/acpi/video.h
@@ -49,6 +49,7 @@ enum acpi_backlight_type {
 	acpi_backlight_vendor,
 	acpi_backlight_native,
 	acpi_backlight_nvidia_wmi_ec,
+	acpi_backlight_apple_gmux,
 };
 
 #if IS_ENABLED(CONFIG_ACPI_VIDEO)
-- 
2.37.2

