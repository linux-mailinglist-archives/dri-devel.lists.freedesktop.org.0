Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9A3913910
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 10:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B9210E0FA;
	Sun, 23 Jun 2024 08:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="T49NgJZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF96610E1C0;
 Sun, 23 Jun 2024 08:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1719132689;
 bh=rczzmpjjlHlCtAKyfdbQlMnDUcEam5QWSyl/gkZmeUI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=T49NgJZIev0c63fiplfhzGkAuWQ/paHKXJ9+oa1374Ic3GcSGWJf5myt32dEIH1qi
 3I/tomzIA9tRVYXA27wN9cxEZb+ye1RpFrC6JixWbFOOf0XIEaIE6+rSkbQ/x9dB2f
 BrUeKV4j2V9HgBpogKmho4NFjOqmPiJ9jCdr2/vc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 23 Jun 2024 10:51:29 +0200
Subject: [PATCH v2 3/3] drm/amd/display: Add support backlight quirks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-amdgpu-min-backlight-quirk-v2-3-cecf7f49da9b@weissschuh.net>
References: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
In-Reply-To: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719132688; l=2788;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=rczzmpjjlHlCtAKyfdbQlMnDUcEam5QWSyl/gkZmeUI=;
 b=91+X03/aUODL2GDH3ZqzK48/y08D6dI+XwyYt1sZeGqua4CMOayPkJrOzc+4B24uRR0caZ7vY
 ikjqi1dxeVRA9O1UNQHhVY4kjP/r2qXpoz/32Jsw8BJnXBbylFYY6tY
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

Not all platforms provide correct PWM backlight capabilities through ATIF.
Use the generic drm backlight quirk infrastructure to override the
capabilities where necessary.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 692fa7cf8fd2..4fe0e8e74bb9 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -25,6 +25,7 @@ config DRM_AMDGPU
 	select DRM_BUDDY
 	select DRM_SUBALLOC_HELPER
 	select DRM_EXEC
+	select DRM_PANEL_BACKLIGHT_QUIRKS
 	# amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select to work
 	# ACPI_VIDEO's dependencies must also be selected.
 	select INPUT if ACPI
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 60404385d4d0..2d8a6d875170 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -93,6 +93,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
+#include <drm/drm_utils.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_audio_component.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -3329,6 +3330,31 @@ static struct drm_mode_config_helper_funcs amdgpu_dm_mode_config_helperfuncs = {
 	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
 };
 
+static void amdgpu_dm_apply_backlight_quirks(struct amdgpu_dm_connector *aconnector,
+					     struct amdgpu_dm_backlight_caps *caps)
+{
+	const struct drm_panel_backlight_quirk *quirk;
+	const struct drm_edid *edid;
+
+	edid = drm_edid_alloc(aconnector->edid, EDID_LENGTH * (aconnector->edid->extensions + 1));
+	if (!edid)
+		return;
+
+	quirk = drm_get_panel_backlight_quirk(edid);
+
+	drm_edid_free(edid);
+
+	if (!quirk)
+		return;
+
+	if (quirk->overrides.pwm_min_brightness &&
+	    caps->min_input_signal != quirk->pwm_min_brightness) {
+		drm_info(aconnector->base.dev,
+			 "Quirk: backlight min_input_signal=%d\n", quirk->pwm_min_brightness);
+		caps->min_input_signal = quirk->pwm_min_brightness;
+	}
+}
+
 static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 {
 	struct amdgpu_dm_backlight_caps *caps;
@@ -3369,6 +3395,8 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 		caps->aux_min_input_signal = 0;
 		caps->aux_max_input_signal = 512;
 	}
+
+	amdgpu_dm_apply_backlight_quirks(aconnector, caps);
 }
 
 void amdgpu_dm_update_connector_after_detect(

-- 
2.45.2

