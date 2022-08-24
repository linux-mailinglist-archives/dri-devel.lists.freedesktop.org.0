Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD6D59F9A1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 14:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED149476A;
	Wed, 24 Aug 2022 12:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A44D12A9E6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 12:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661343394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+6tHZYyrogyhGbIdsbwjzHRumcVlNmmYf2j+CeiUK6U=;
 b=Ef+dhKa6kFuc3AHM7BRdL/PgUjaKYPPtYzwRJqLxLnFAHy6g5tOIcFrjVaxY6/nvW9Mfwm
 aYAX+jgiEoGu6spBSdQcooiXcOWVQz2teTDX5Omc41bus+CGFXhozGpO7i6JwXdD52TFWl
 8kVa2aN4uyeM3uG2oEJ/DdCw0SV17Lw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-DDsAqTpaNFCB40fgRjquQw-1; Wed, 24 Aug 2022 08:16:31 -0400
X-MC-Unique: DDsAqTpaNFCB40fgRjquQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00CA5380115A;
 Wed, 24 Aug 2022 12:16:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47598C15BB3;
 Wed, 24 Aug 2022 12:16:26 +0000 (UTC)
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
Subject: [PATCH v4 13/31] drm/amdgpu: Register ACPI video backlight when
 skipping amdgpu backlight registration
Date: Wed, 24 Aug 2022 14:15:05 +0200
Message-Id: <20220824121523.1291269-14-hdegoede@redhat.com>
In-Reply-To: <20220824121523.1291269-1-hdegoede@redhat.com>
References: <20220824121523.1291269-1-hdegoede@redhat.com>
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

Typically the acpi_video driver will initialize before amdgpu, which
used to cause /sys/class/backlight/acpi_video0 to get registered and then
amdgpu would register its own amdgpu_bl# device later. After which
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

Add a call to the new acpi_video_register_backlight() when amdgpu skips
registering its own backlight device because of either the firmware_flags
or the acpi_video_get_backlight_type() return value. This ensures that
if the acpi_video backlight device should be used, it will be available
before the amdgpu drm_device gets registered with userspace.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c    | 9 +++++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index b4e3cedceaf8..6be9ac2b9c5b 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -184,11 +184,11 @@ void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *amdgpu_encode
 		return;
 
 	if (!(adev->mode_info.firmware_flags & ATOM_BIOS_INFO_BL_CONTROLLED_BY_GPU))
-		return;
+		goto register_acpi_backlight;
 
 	if (!acpi_video_backlight_use_native()) {
 		drm_info(dev, "Skipping amdgpu atom DIG backlight registration\n");
-		return;
+		goto register_acpi_backlight;
 	}
 
 	pdata = kmalloc(sizeof(struct amdgpu_backlight_privdata), GFP_KERNEL);
@@ -225,6 +225,11 @@ void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *amdgpu_encode
 error:
 	kfree(pdata);
 	return;
+
+register_acpi_backlight:
+	/* Try registering an ACPI video backlight device instead. */
+	acpi_video_register_backlight();
+	return;
 }
 
 void
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 706c67f4bda8..c450964f84d4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4037,6 +4037,8 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
 
 	if (!acpi_video_backlight_use_native()) {
 		drm_info(adev_to_drm(dm->adev), "Skipping amdgpu DM backlight registration\n");
+		/* Try registering an ACPI video backlight device instead. */
+		acpi_video_register_backlight();
 		return;
 	}
 
-- 
2.37.2

