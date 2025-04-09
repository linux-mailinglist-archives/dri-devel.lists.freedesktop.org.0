Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AEBA82C8F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 18:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF8C10E0D5;
	Wed,  9 Apr 2025 16:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="XRQjGNaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 362 seconds by postgrey-1.36 at gabe;
 Wed, 09 Apr 2025 16:36:41 UTC
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F9610E14C;
 Wed,  9 Apr 2025 16:36:41 +0000 (UTC)
Received: from wse-pc.fritz.box (host-88-217-226-44.customer.m-online.net
 [88.217.226.44]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPA id 1F5742FC0052;
 Wed,  9 Apr 2025 18:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1744216235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sv1LGOUNmwh012y33sRSiC7ve03lgZzUYhRmkjBwcVA=;
 b=XRQjGNaAsffNeMT1xzJZ/i2Bd7TmAdxH7TPzVC7w9SP+FIx+zgLwLELTfbNfohYTNpTpTA
 gnaGqNlrxQNhyEW+m4BjBzxQ0UKgxStGUVVk2tOUofLxMllcEZUv2x0ELu2fCpM+FGUbTt
 A8rOEcPJSZboiSdAByCdRk0kHXnUr2Y=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 1/1] drm/amd/display: Add quirk to force backlight type on
 some TUXEDO devices
Date: Wed,  9 Apr 2025 18:27:00 +0200
Message-ID: <20250409163029.130651-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409163029.130651-1-wse@tuxedocomputers.com>
References: <20250409163029.130651-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
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

The display backlight on TUXEDO Polaris AMD Gen2 and Gen3 with panels
BOE 2420 and BOE 2423 must be forced to pwn controlled to be able to
control the brightness.

This could already be archived via a module parameter, but this patch adds
a quirk to apply this by default on the mentioned device + panel
combinations.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: stable@vger.kernel.org
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 39df45f652b32..2bad6274ad8ff 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1625,11 +1625,13 @@ static bool dm_should_disable_stutter(struct pci_dev *pdev)
 struct amdgpu_dm_quirks {
 	bool aux_hpd_discon;
 	bool support_edp0_on_dp1;
+	bool boe_2420_2423_bl_force_pwm;
 };
 
 static struct amdgpu_dm_quirks quirk_entries = {
 	.aux_hpd_discon = false,
-	.support_edp0_on_dp1 = false
+	.support_edp0_on_dp1 = false,
+	.boe_2420_2423_bl_force_pwm = false
 };
 
 static int edp0_on_dp1_callback(const struct dmi_system_id *id)
@@ -1644,6 +1646,12 @@ static int aux_hpd_discon_callback(const struct dmi_system_id *id)
 	return 0;
 }
 
+static int boe_2420_2423_bl_force_pwm_callback(const struct dmi_system_id *id)
+{
+	quirk_entries.boe_2420_2423_bl_force_pwm = true;
+	return 0;
+}
+
 static const struct dmi_system_id dmi_quirk_table[] = {
 	{
 		.callback = aux_hpd_discon_callback,
@@ -1722,6 +1730,20 @@ static const struct dmi_system_id dmi_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP EliteBook 665 16 inch G11 Notebook PC"),
 		},
 	},
+	{
+		// TUXEDO Polaris AMD Gen2
+		.callback = boe_2420_2423_bl_force_pwm_callback,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
+		},
+	},
+	{
+		// TUXEDO Polaris AMD Gen3
+		.callback = boe_2420_2423_bl_force_pwm_callback,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
+		},
+	},
 	{}
 	/* TODO: refactor this from a fixed table to a dynamic option */
 };
@@ -3586,6 +3608,7 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	struct amdgpu_device *adev;
 	struct drm_luminance_range_info *luminance_range;
 	int min_input_signal_override;
+	u32 panel;
 
 	if (aconnector->bl_idx == -1 ||
 	    aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
@@ -3610,6 +3633,13 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 		caps->aux_support = false;
 	else if (amdgpu_backlight == 1)
 		caps->aux_support = true;
+	else if (amdgpu_backlight == -1 &&
+		 quirk_entries.boe_2420_2423_bl_force_pwm) {
+		panel = drm_edid_get_panel_id(aconnector->drm_edid);
+		if (panel == drm_edid_encode_panel_id('B', 'O', 'E', 0x0974) ||
+		    panel == drm_edid_encode_panel_id('B', 'O', 'E', 0x0977))
+			caps->aux_support = false;
+	}
 	if (caps->aux_support)
 		aconnector->dc_link->backlight_control_type = BACKLIGHT_CONTROL_AMD_AUX;
 
-- 
2.43.0

