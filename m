Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CA552A640
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 17:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B467112BF8;
	Tue, 17 May 2022 15:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9D7112CCA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652801043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EzQ0bpfNq/u5CmCRWzwXFCuUS14QmFp9uACdqa5mEOQ=;
 b=EGYbn+87Vn8pis1zhe3qfLeyuMS+xxDoJYI2rvVywCYWoYf8e3gvW3MDirLc+8QuVk7UBC
 0aFnbBWrAn43fW/g3xS2jxKJJSJyPBoC3cHLj3fmUYP4Q5wG7OkGR1pOGtYSLyCzV/7/DL
 iTkSKZsDPAF1aESNxZ1hHsVWcN4bjd0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-Jn-4oR0_MKSItA1HmnTSUQ-1; Tue, 17 May 2022 11:23:56 -0400
X-MC-Unique: Jn-4oR0_MKSItA1HmnTSUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 307203817A62;
 Tue, 17 May 2022 15:23:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF7C6C15D5C;
 Tue, 17 May 2022 15:23:51 +0000 (UTC)
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
Subject: [PATCH 04/14] drm/radeon: Don't register backlight when another
 backlight should be used
Date: Tue, 17 May 2022 17:23:21 +0200
Message-Id: <20220517152331.16217-5-hdegoede@redhat.com>
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

Before this commit when we want userspace to use the acpi_video backlight
device we register both the GPU's native backlight device and acpi_video's
firmware acpi_video# backlight device. This relies on userspace preferring
firmware type backlight devices over native ones.

Registering 2 backlight devices for a single display really is
undesirable, don't register the GPU's native backlight device when
another backlight device should be used.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/Kconfig                         | 1 +
 drivers/gpu/drm/radeon/atombios_encoders.c      | 7 +++++++
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c | 7 +++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ddbeb2124df7..37205953056b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -258,6 +258,7 @@ config DRM_RADEON
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
+	select ACPI_VIDEO if ACPI && X86 && INPUT
 	help
 	  Choose this option if you have an ATI Radeon graphics card.  There
 	  are both PCI and AGP versions.  You don't need to choose this to
diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index 70bd84b7ef2b..f82577dc25e8 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -32,6 +32,8 @@
 #include <drm/drm_file.h>
 #include <drm/radeon_drm.h>
 
+#include <acpi/video.h>
+
 #include "atom.h"
 #include "radeon_atombios.h"
 #include "radeon.h"
@@ -211,6 +213,11 @@ void radeon_atom_backlight_init(struct radeon_encoder *radeon_encoder,
 	if (!(rdev->mode_info.firmware_flags & ATOM_BIOS_INFO_BL_CONTROLLED_BY_GPU))
 		return;
 
+	if (acpi_video_get_backlight_type(true) != acpi_backlight_native) {
+		DRM_INFO("Skipping radeon atom DIG backlight registration\n");
+		return;
+	}
+
 	pdata = kmalloc(sizeof(struct radeon_backlight_privdata), GFP_KERNEL);
 	if (!pdata) {
 		DRM_ERROR("Memory allocation failed\n");
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
index 7fdb77d48d6a..d2180f5c80fa 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
@@ -33,6 +33,8 @@
 #include <drm/drm_util.h>
 #include <drm/radeon_drm.h>
 
+#include <acpi/video.h>
+
 #include "radeon.h"
 #include "radeon_asic.h"
 #include "radeon_legacy_encoders.h"
@@ -389,6 +391,11 @@ void radeon_legacy_backlight_init(struct radeon_encoder *radeon_encoder,
 		return;
 #endif
 
+	if (acpi_video_get_backlight_type(true) != acpi_backlight_native) {
+		DRM_INFO("Skipping radeon legacy LVDS backlight registration\n");
+		return;
+	}
+
 	pdata = kmalloc(sizeof(struct radeon_backlight_privdata), GFP_KERNEL);
 	if (!pdata) {
 		DRM_ERROR("Memory allocation failed\n");
-- 
2.36.0

