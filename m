Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AEF598B5F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 20:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E7A10E77C;
	Thu, 18 Aug 2022 18:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF79F10E15E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660848216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oaLtfbWG5E2dC3VyniY6vl4e+aUQP74aSxAs2H77GhU=;
 b=Ka2n4h4IJenh0brC943Ol/kMivzhwHDzHU1grxgo4j60LjdGwKnKJwscUm/iL0f3af9lwY
 tfbaEobWkXCYxO212cfKCiSfOCgXFQs0O6dOg38UoQY30BRlo5LuRj2uqoC78z9Q5d5C3x
 zduFsIMirvtBIR22iQUUOqYUFy12qgc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-16PAaeHZOfG5rkg7MwEZ-g-1; Thu, 18 Aug 2022 14:43:28 -0400
X-MC-Unique: 16PAaeHZOfG5rkg7MwEZ-g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40A773815D28;
 Thu, 18 Aug 2022 18:43:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E858492C3B;
 Thu, 18 Aug 2022 18:43:23 +0000 (UTC)
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
Subject: [PATCH v3 03/31] drm/amdgpu: Don't register backlight when another
 backlight should be used (v3)
Date: Thu, 18 Aug 2022 20:42:34 +0200
Message-Id: <20220818184302.10051-4-hdegoede@redhat.com>
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

Changes in v2:
- To avoid linker errors when amdgpu is builtin and video_detect.c is in
  a module, select ACPI_VIDEO and its deps if ACPI is enabled.
  When ACPI is disabled, ACPI_VIDEO is also always disabled, ensuring
  the stubs from acpi/video.h will be used.

Changes in v3:
- Use drm_info(drm_dev, "...") to log messages
- ACPI_VIDEO can now be enabled on non X86 too,
  adjust the Kconfig changes to match this.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/Kconfig                           | 7 +++++++
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c    | 7 +++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 0b2ad7212ee6..95ca33938b4a 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -259,6 +259,13 @@ config DRM_AMDGPU
 	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
 	select DRM_BUDDY
+	# amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select to work
+	# ACPI_VIDEO's dependencies must also be selected.
+	select INPUT if ACPI
+	select ACPI_VIDEO if ACPI
+	# On x86 ACPI_VIDEO also needs ACPI_WMI
+	select X86_PLATFORM_DEVICES if ACPI && X86
+	select ACPI_WMI if ACPI && X86
 	help
 	  Choose this option if you have a recent AMD Radeon graphics card.
 
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index fa7421afb9a6..b4e3cedceaf8 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -26,6 +26,8 @@
 
 #include <linux/pci.h>
 
+#include <acpi/video.h>
+
 #include <drm/drm_crtc_helper.h>
 #include <drm/amdgpu_drm.h>
 #include "amdgpu.h"
@@ -184,6 +186,11 @@ void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *amdgpu_encode
 	if (!(adev->mode_info.firmware_flags & ATOM_BIOS_INFO_BL_CONTROLLED_BY_GPU))
 		return;
 
+	if (!acpi_video_backlight_use_native()) {
+		drm_info(dev, "Skipping amdgpu atom DIG backlight registration\n");
+		return;
+	}
+
 	pdata = kmalloc(sizeof(struct amdgpu_backlight_privdata), GFP_KERNEL);
 	if (!pdata) {
 		DRM_ERROR("Memory allocation failed\n");
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 85fdd6baf803..66fca99d287e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -90,6 +90,8 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_plane_helper.h>
 
+#include <acpi/video.h>
+
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
 
 #include "dcn/dcn_1_0_offset.h"
@@ -4029,6 +4031,11 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
 	amdgpu_dm_update_backlight_caps(dm, dm->num_of_edps);
 	dm->brightness[dm->num_of_edps] = AMDGPU_MAX_BL_LEVEL;
 
+	if (!acpi_video_backlight_use_native()) {
+		drm_info(adev_to_drm(dm->adev), "Skipping amdgpu DM backlight registration\n");
+		return;
+	}
+
 	props.max_brightness = AMDGPU_MAX_BL_LEVEL;
 	props.brightness = AMDGPU_MAX_BL_LEVEL;
 	props.type = BACKLIGHT_RAW;
-- 
2.37.2

