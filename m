Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AF452A67D
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 17:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9B4112F73;
	Tue, 17 May 2022 15:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C22112F8B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 15:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652801079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMV/pO71tp7Tnmw0apJUjOC22eI0KpMfGNgJNZ8mGcM=;
 b=M9d4sJGhna1ozfknrCBLS2RSk7Imt7uX/KDtR28gf848y7YWNWu+xHPyfD/vfkOxMaRkNS
 ccctT7az+wOVcMbKjKSQHklLZEppXc57Afuga8J/QxLqzXm7QFbnHUtkFo0u+KQEC54URq
 mvTZ5TwwMpMmfvU3T7+CDmcoqVqBJgE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-XN_9o3srMm2CwS02pjP2vw-1; Tue, 17 May 2022 11:24:34 -0400
X-MC-Unique: XN_9o3srMm2CwS02pjP2vw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C029F1857F02;
 Tue, 17 May 2022 15:24:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41153C15D70;
 Tue, 17 May 2022 15:24:29 +0000 (UTC)
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
	Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
Subject: [PATCH 14/14] drm/radeon: Register ACPI video backlight when skipping
 radeon backlight registration
Date: Tue, 17 May 2022 17:23:31 +0200
Message-Id: <20220517152331.16217-15-hdegoede@redhat.com>
In-Reply-To: <20220517152331.16217-1-hdegoede@redhat.com>
References: <20220517152331.16217-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

Typically the acpi_video driver will initialize before radeon, which
used to cause /sys/class/backlight/acpi_video0 to get registered and then
radeon would register its own radeon_bl# device later. After which
the drivers/acpi/video_detect.c code unregistered the acpi_video0 device
to avoid there being 2 backlight devices.

This means that userspace used to briefly see 2 devices and the
disappearing of acpi_video0 after a brief time confuses the systemd
backlight level save/restore code, see e.g.:
https://bbs.archlinux.org/viewtopic.php?id=269920

To fix this the ACPI video code has been modified to make backlight class
device registration a separate step, relying on the drm/kms driver to
ask for the acpi_video backlight registration after it is done setting up
its native backlight device.

Add a call to the new acpi_video_register_backlight() when radeon skips
registering its own backlight device because of e.g. the firmware_flags
or the acpi_video_get_backlight_type() return value. This ensures that
if the acpi_video backlight device should be used, it will be available
before the radeon drm_device gets registered with userspace.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/radeon/radeon_encoders.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
index 46549d5179ee..c1cbebb51be1 100644
--- a/drivers/gpu/drm/radeon/radeon_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_encoders.c
@@ -30,6 +30,8 @@
 #include <drm/drm_device.h>
 #include <drm/radeon_drm.h>
 
+#include <acpi/video.h>
+
 #include "radeon.h"
 #include "radeon_atombios.h"
 #include "radeon_legacy_encoders.h"
@@ -167,7 +169,7 @@ static void radeon_encoder_add_backlight(struct radeon_encoder *radeon_encoder,
 		return;
 
 	if (radeon_backlight == 0) {
-		return;
+		use_bl = false;
 	} else if (radeon_backlight == 1) {
 		use_bl = true;
 	} else if (radeon_backlight == -1) {
@@ -193,6 +195,13 @@ static void radeon_encoder_add_backlight(struct radeon_encoder *radeon_encoder,
 		else
 			radeon_legacy_backlight_init(radeon_encoder, connector);
 	}
+
+	/*
+	 * If there is no native backlight device (which may happen even when
+	 * use_bl==true) try registering an ACPI video backlight device instead.
+	 */
+	if (!rdev->mode_info.bl_encoder)
+		acpi_video_register_backlight();
 }
 
 void
-- 
2.36.0

