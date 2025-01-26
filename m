Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4315A1C8C0
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5A210E386;
	Sun, 26 Jan 2025 14:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RvICHWOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A376610E386;
 Sun, 26 Jan 2025 14:53:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E76DB5C5FEE;
 Sun, 26 Jan 2025 14:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C622BC4CEE2;
 Sun, 26 Jan 2025 14:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903202;
 bh=lBTWHoEglIg63hLtbb2uN3HE7cH3ANNtDenRKpCKCTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RvICHWOu1x5687usZoonLfDCucU/BW5nQoPrkVOzdbi2UK0zAkAn+o0r2Zsi14ZFm
 4B1UpFIcCeR2vrxaQX09tMqPc+gBiSPqQ+iveehjL+PjL3NfXAnXWaGIQ9hzWBx8it
 74y9fSgBEhrC8QbNc6Il3nTL6bYxy93rsYdr+ngUPxN3k2NwXpYm2H2zRpnWP+zx/i
 np8zWA4amMT6MXB8tHoRljSejmvBXZAwcJBsDljbNiD6sCJXretlSRuLt6pWIpX3Cj
 1sk6n4S0/+U2g0yA/jomiV5ypRttz19gPXjTWdBM84bzPX1o4riT6vfIZoFVofJAbj
 DOstmJCYdcs2g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Dustin L . Howett" <dustin@howett.net>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Sasha Levin <sashal@kernel.org>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, mripard@kernel.org, geert+renesas@glider.be,
 arnd@arndb.de, jani.nikula@intel.com, tzimmermann@suse.de,
 dmitry.baryshkov@linaro.org, chiahsuan.chung@amd.com,
 hamza.mahfooz@amd.com, sunil.khatri@amd.com, alex.hung@amd.com,
 aurabindo.pillai@amd.com, hersenxs.wu@amd.com, mwen@igalia.com,
 Wayne.Lin@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 03/34] drm/amd/display: Add support for minimum
 backlight quirk
Date: Sun, 26 Jan 2025 09:52:39 -0500
Message-Id: <20250126145310.926311-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145310.926311-1-sashal@kernel.org>
References: <20250126145310.926311-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit
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

From: Thomas Weißschuh <linux@weissschuh.net>

[ Upstream commit c2753b2471c65955de18cbc58530641447e5bfe9 ]

Not all platforms provide the full range of PWM backlight capabilities
supported by the hardware through ATIF.
Use the generic drm panel minimum backlight quirk infrastructure to
override the capabilities where necessary.

Testing the backlight quirk together with the "panel_power_savings"
sysfs file has not shown any negative impact.
One quirk seems to be that 0% at panel_power_savings=0 seems to be
slightly darker than at panel_power_savings=4.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Tested-by: Dustin L. Howett <dustin@howett.net>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241111-amdgpu-min-backlight-quirk-v7-2-f662851fda69@weissschuh.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig                | 1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 41fa3377d9cf5..1a11cab741aca 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -26,6 +26,7 @@ config DRM_AMDGPU
 	select DRM_BUDDY
 	select DRM_SUBALLOC_HELPER
 	select DRM_EXEC
+	select DRM_PANEL_BACKLIGHT_QUIRKS
 	# amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select to work
 	# ACPI_VIDEO's dependencies must also be selected.
 	select INPUT if ACPI
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5f216d626cbb5..d394f758272e3 100644
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
@@ -3457,6 +3458,7 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	struct drm_connector *conn_base;
 	struct amdgpu_device *adev;
 	struct drm_luminance_range_info *luminance_range;
+	int min_input_signal_override;
 
 	if (aconnector->bl_idx == -1 ||
 	    aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
@@ -3493,6 +3495,10 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 		caps->aux_min_input_signal = 0;
 		caps->aux_max_input_signal = 512;
 	}
+
+	min_input_signal_override = drm_get_panel_min_brightness_quirk(aconnector->drm_edid);
+	if (min_input_signal_override >= 0)
+		caps->min_input_signal = min_input_signal_override;
 }
 
 void amdgpu_dm_update_connector_after_detect(
-- 
2.39.5

