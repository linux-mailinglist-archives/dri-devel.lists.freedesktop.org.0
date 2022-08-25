Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD8C5A13C2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 16:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E0210E290;
	Thu, 25 Aug 2022 14:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF2910E2AB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661438254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=O4J7msV35Y59tpMeVrBJQ/SHSU3/vshN9nue8TqJlB4=;
 b=IZ8YnsmQz0U5zLdbKdduLp1DU5sIFXFaecYbIHm/KHDLO0am1kXVp3uX3xNQAB41uuM5Ns
 tfW+LEY2tvzu61NzVz0SkTBrxqXxkOyvtCn3aW2d71DCN28wBMiyDozgsbXhqs5eGun2nD
 C37HcQ6HvfsbC4NlIdkJlz0uXLyNyUo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-yxcPGkQqP4Cbp34SPOVM-g-1; Thu, 25 Aug 2022 10:37:32 -0400
X-MC-Unique: yxcPGkQqP4Cbp34SPOVM-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4631718A64EA;
 Thu, 25 Aug 2022 14:37:31 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25AF82166B29;
 Thu, 25 Aug 2022 14:37:27 +0000 (UTC)
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
Subject: [PATCH v5 00/31] drm/kms: Stop registering multiple
 /sys/class/backlight devs for a single display
Date: Thu, 25 Aug 2022 16:36:55 +0200
Message-Id: <20220825143726.269890-1-hdegoede@redhat.com>
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
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

As mentioned in my RFC titled "drm/kms: control display brightness through
drm_connector properties":
https://lore.kernel.org/dri-devel/0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com/

The first step towards this is to deal with some existing technical debt
in backlight handling on x86/ACPI boards, specifically we need to stop
registering multiple /sys/class/backlight devs for a single display.

This series implements my RFC describing my plan for these cleanups:
https://lore.kernel.org/dri-devel/98519ba0-7f18-201a-ea34-652f50343158@redhat.com/

Changes in version 5:
- Use drm_info(drm_dev, ...) in patch 2/31
- Modify "drm/i915: Call acpi_video_register_backlight()", dropping
  the global has_panel flag, replacing it with a new
  intel_acpi_video_register() helper

Changes in version 4:
- Minor tweaks to nvidia-wmi-ec-backlight changes
- Add nouveau_acpi_* wrappers around used include/acpi/video.h functions to
  fix unresolved symbol errors on non X86

Changes in version 3:
- ACPI_VIDEO can now be enabled on non X86 too, adjust various Kconfig changes
- Make the delay before doing fallback acpi_video backlight registration
  a module option (patch 9)
- Move the nvidia-wmi-ec-backlight fw API definitions to a shared header
- Add a "acpi_video_get_backlight_type() == acpi_backlight_nvidia_wmi_ec"
  check to the nvidia-wmi-ec-backlight driver (patch 19)

Changes in version 2:
- Introduce acpi_video_backlight_use_native() helper
- Finishes the refactoring, addressing all the bits from the "Other issues"
  section of the refactor RFC

This series as submitted is based on drm-tip for CI purposes.

Assuming the last i915 patch also pass review now, I hope to push
out an immutable branch with this series on top of v6.0-rc1 and
send out a pull-request to all involved subsystems based on
this branch soon.

Regards,

Hans


Hans de Goede (31):
  ACPI: video: Add acpi_video_backlight_use_native() helper
  drm/i915: Don't register backlight when another backlight should be
    used (v2)
  drm/amdgpu: Don't register backlight when another backlight should be
    used (v3)
  drm/radeon: Don't register backlight when another backlight should be
    used (v3)
  drm/nouveau: Don't register backlight when another backlight should be
    used (v2)
  ACPI: video: Drop backlight_device_get_by_type() call from
    acpi_video_get_backlight_type()
  ACPI: video: Remove acpi_video_bus from list before tearing it down
  ACPI: video: Simplify acpi_video_unregister_backlight()
  ACPI: video: Make backlight class device registration a separate step
    (v2)
  ACPI: video: Remove code to unregister acpi_video backlight when a
    native backlight registers
  drm/i915: Call acpi_video_register_backlight() (v3)
  drm/nouveau: Register ACPI video backlight when nv_backlight
    registration fails (v2)
  drm/amdgpu: Register ACPI video backlight when skipping amdgpu
    backlight registration
  drm/radeon: Register ACPI video backlight when skipping radeon
    backlight registration
  platform/x86: nvidia-wmi-ec-backlight: Move fw interface definitions
    to a header (v2)
  ACPI: video: Refactor acpi_video_get_backlight_type() a bit
  ACPI: video: Add Nvidia WMI EC brightness control detection (v3)
  ACPI: video: Add Apple GMUX brightness control detection
  platform/x86: nvidia-wmi-ec-backlight: Use
    acpi_video_get_backlight_type()
  platform/x86: apple-gmux: Stop calling acpi/video.h functions
  platform/x86: toshiba_acpi: Stop using
    acpi_video_set_dmi_backlight_type()
  platform/x86: acer-wmi: Move backlight DMI quirks to
    acpi/video_detect.c
  platform/x86: asus-wmi: Drop DMI chassis-type check from backlight
    handling
  platform/x86: asus-wmi: Move acpi_backlight=vendor quirks to ACPI
    video_detect.c
  platform/x86: asus-wmi: Move acpi_backlight=native quirks to ACPI
    video_detect.c
  platform/x86: samsung-laptop: Move acpi_backlight=[vendor|native]
    quirks to ACPI video_detect.c
  ACPI: video: Remove acpi_video_set_dmi_backlight_type()
  ACPI: video: Drop "Samsung X360" acpi_backlight=native quirk
  ACPI: video: Drop NL5x?U, PF4NU1F and PF5?U?? acpi_backlight=native
    quirks
  ACPI: video: Fix indentation of video_detect_dmi_table[] entries
  drm/todo: Add entry about dealing with brightness control on devices
    with > 1 panel

 Documentation/gpu/todo.rst                    |  68 +++
 MAINTAINERS                                   |   1 +
 drivers/acpi/Kconfig                          |   1 +
 drivers/acpi/acpi_video.c                     |  64 ++-
 drivers/acpi/video_detect.c                   | 428 +++++++++++-------
 drivers/gpu/drm/Kconfig                       |  14 +
 .../gpu/drm/amd/amdgpu/atombios_encoders.c    |  14 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   9 +
 drivers/gpu/drm/gma500/Kconfig                |   2 +
 drivers/gpu/drm/i915/Kconfig                  |   2 +
 drivers/gpu/drm/i915/display/intel_acpi.c     |  27 ++
 drivers/gpu/drm/i915/display/intel_acpi.h     |   3 +
 .../gpu/drm/i915/display/intel_backlight.c    |   7 +
 drivers/gpu/drm/i915/display/intel_display.c  |   2 +-
 drivers/gpu/drm/nouveau/nouveau_acpi.c        |  10 +
 drivers/gpu/drm/nouveau/nouveau_acpi.h        |   4 +
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |  13 +
 drivers/gpu/drm/radeon/atombios_encoders.c    |   7 +
 drivers/gpu/drm/radeon/radeon_encoders.c      |  11 +-
 .../gpu/drm/radeon/radeon_legacy_encoders.c   |   7 +
 drivers/platform/x86/Kconfig                  |   1 +
 drivers/platform/x86/acer-wmi.c               |  66 ---
 drivers/platform/x86/apple-gmux.c             |   3 -
 drivers/platform/x86/asus-nb-wmi.c            |  21 -
 drivers/platform/x86/asus-wmi.c               |  13 -
 drivers/platform/x86/asus-wmi.h               |   2 -
 drivers/platform/x86/eeepc-wmi.c              |  25 +-
 .../platform/x86/nvidia-wmi-ec-backlight.c    |  82 +---
 drivers/platform/x86/samsung-laptop.c         |  87 ----
 drivers/platform/x86/toshiba_acpi.c           |  16 -
 include/acpi/video.h                          |   9 +-
 .../x86/nvidia-wmi-ec-backlight.h             |  76 ++++
 32 files changed, 588 insertions(+), 507 deletions(-)
 create mode 100644 include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h

-- 
2.37.2

