Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59522CE848C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 23:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F45710E754;
	Mon, 29 Dec 2025 22:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="GGWR9FOr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 524 seconds by postgrey-1.36 at gabe;
 Mon, 29 Dec 2025 22:25:14 UTC
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5A710E749;
 Mon, 29 Dec 2025 22:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1767046588;
 bh=h49GpH9yeTAWW9kc5VE/h8WxulC3EVUfsjmG/pOznCI=;
 h=From:Date:Subject:To:Cc:From;
 b=GGWR9FOr/MMPtvLE9eTduKA+I+3k6GiGPthaCDaGQ99sizN9MtDnUW0/DQ7CqgRkW
 JsCVnaPESPatCOFvmFPnnHr/NYG2vadV4U7VfFXStvY7e4u8wdP4FOd2IJ78kRK6A0
 eZwlfUL9MMUPjW/7FJGbfmVXda/O5KzZWtz31zgU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 29 Dec 2025 23:13:41 +0100
Subject: [PATCH v3] drm/radeon: Switch radeon_connector to struct drm_edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251229-radeon-drm_edid-v3-1-f93c780e6344@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIABT9UmkC/3XNQQ6CMBQE0KuYrq3h/4IUV97DGIPtx3Zh0Raqh
 nB3Cy40IS5nknkzsEDeUmC71cA8RRts61IQ6xVTpnYX4lanzDDDPJMgua81tY5rfz2RtppXTaZ
 IiS0hliytbp4a+5zFw/GTPd37BHff0tjQtf41v0aY2v8HETjw/Fw2WkMFAmn/IBtCUKY3G0cdm
 8CIPwjiEsGEFFIgFAVIAL1AxnF8Axa5BjINAQAA
X-Change-ID: 20240818-radeon-drm_edid-9f0cec36e227
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767046587; l=10767;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=h49GpH9yeTAWW9kc5VE/h8WxulC3EVUfsjmG/pOznCI=;
 b=xXs8N0rkrv5mJWXBk5nh92Ys3tN6hsBrCWAM0EgoTkPz5hCW9uOEi9UhWmWIY7SIj84Fm4v0C
 DI9CnEVjfpYCspmm6sp/kwCLXucfzNudib1cJYvkH4UzvaORzRgb+Jx
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

"struct drm_edid" is the safe and recommended alternative to "struct edid".

Rename the member to make sure that no usage sites are missed,
as "struct drm_edid" has some restrictions, for example it can not be
used with kfree().

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v3:
- Rebase onto drm-misc-next
- Link to v2: https://lore.kernel.org/r/20240822-radeon-drm_edid-v2-1-58321551811d@weissschuh.net

Changes in v2:
- Simplify some logic as drm_edid_*()-APIs can handle NULL
- Correctly use drm_edid_read_switcheroo()
- Link to v1: https://lore.kernel.org/r/20240818-radeon-drm_edid-v1-1-4b7fdd19132e@weissschuh.net
---
This is only compile-tested.
---
 drivers/gpu/drm/radeon/radeon_audio.c      |  4 +--
 drivers/gpu/drm/radeon/radeon_combios.c    |  4 +--
 drivers/gpu/drm/radeon/radeon_connectors.c | 56 +++++++++++++-----------------
 drivers/gpu/drm/radeon/radeon_mode.h       |  5 ++-
 4 files changed, 31 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 8d64ba18572e..566f7524b037 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -311,7 +311,7 @@ static void radeon_audio_write_sad_regs(struct drm_encoder *encoder)
 	if (!connector)
 		return;
 
-	sad_count = drm_edid_to_sad(radeon_connector->edid, &sads);
+	sad_count = drm_edid_to_sad(drm_edid_raw(radeon_connector->drm_edid), &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
@@ -335,7 +335,7 @@ static void radeon_audio_write_speaker_allocation(struct drm_encoder *encoder)
 	if (!connector)
 		return;
 
-	sad_count = drm_edid_to_speaker_allocation(radeon_connector->edid, &sadb);
+	sad_count = drm_edid_to_speaker_allocation(drm_edid_raw(radeon_connector->drm_edid), &sadb);
 	if (sad_count < 0) {
 		DRM_DEBUG("Couldn't read Speaker Allocation Data Block: %d\n",
 			  sad_count);
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index df8d7f56b028..f4947acd0419 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -390,10 +390,10 @@ bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev)
 }
 
 /* this is used for atom LCDs as well */
-struct edid *
+const struct drm_edid *
 radeon_bios_get_hardcoded_edid(struct radeon_device *rdev)
 {
-	return drm_edid_duplicate(drm_edid_raw(rdev->mode_info.bios_hardcoded_edid));
+	return drm_edid_dup(rdev->mode_info.bios_hardcoded_edid);
 }
 
 static struct radeon_i2c_bus_rec combios_setup_i2c_bus(struct radeon_device *rdev,
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 012d8b2295b8..4dacdd642cc4 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -261,7 +261,7 @@ static void radeon_connector_get_edid(struct drm_connector *connector)
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 
-	if (radeon_connector->edid)
+	if (radeon_connector->drm_edid)
 		return;
 
 	/* on hw with routers, select right port */
@@ -271,8 +271,8 @@ static void radeon_connector_get_edid(struct drm_connector *connector)
 	if ((radeon_connector_encoder_get_dp_bridge_encoder_id(connector) !=
 	     ENCODER_OBJECT_ID_NONE) &&
 	    radeon_connector->ddc_bus->has_aux) {
-		radeon_connector->edid = drm_get_edid(connector,
-						      &radeon_connector->ddc_bus->aux.ddc);
+		radeon_connector->drm_edid = drm_edid_read_ddc(connector,
+							       &radeon_connector->ddc_bus->aux.ddc);
 	} else if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
 		   (connector->connector_type == DRM_MODE_CONNECTOR_eDP)) {
 		struct radeon_connector_atom_dig *dig = radeon_connector->con_priv;
@@ -280,22 +280,22 @@ static void radeon_connector_get_edid(struct drm_connector *connector)
 		if ((dig->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT ||
 		     dig->dp_sink_type == CONNECTOR_OBJECT_ID_eDP) &&
 		    radeon_connector->ddc_bus->has_aux)
-			radeon_connector->edid = drm_get_edid(&radeon_connector->base,
-							      &radeon_connector->ddc_bus->aux.ddc);
+			radeon_connector->drm_edid = drm_edid_read_ddc(&radeon_connector->base,
+								       &radeon_connector->ddc_bus->aux.ddc);
 		else if (radeon_connector->ddc_bus)
-			radeon_connector->edid = drm_get_edid(&radeon_connector->base,
-							      &radeon_connector->ddc_bus->adapter);
+			radeon_connector->drm_edid = drm_edid_read_ddc(&radeon_connector->base,
+								       &radeon_connector->ddc_bus->adapter);
 	} else if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC &&
 		   connector->connector_type == DRM_MODE_CONNECTOR_LVDS &&
 		   radeon_connector->ddc_bus) {
-		radeon_connector->edid = drm_get_edid_switcheroo(&radeon_connector->base,
-								 &radeon_connector->ddc_bus->adapter);
+		radeon_connector->drm_edid = drm_edid_read_switcheroo(&radeon_connector->base,
+								      &radeon_connector->ddc_bus->adapter);
 	} else if (radeon_connector->ddc_bus) {
-		radeon_connector->edid = drm_get_edid(&radeon_connector->base,
-						      &radeon_connector->ddc_bus->adapter);
+		radeon_connector->drm_edid = drm_edid_read_ddc(&radeon_connector->base,
+							       &radeon_connector->ddc_bus->adapter);
 	}
 
-	if (!radeon_connector->edid) {
+	if (!radeon_connector->drm_edid) {
 		/* don't fetch the edid from the vbios if ddc fails and runpm is
 		 * enabled so we report disconnected.
 		 */
@@ -306,34 +306,30 @@ static void radeon_connector_get_edid(struct drm_connector *connector)
 			/* some laptops provide a hardcoded edid in rom for LCDs */
 			if (((connector->connector_type == DRM_MODE_CONNECTOR_LVDS) ||
 			     (connector->connector_type == DRM_MODE_CONNECTOR_eDP)))
-				radeon_connector->edid = radeon_bios_get_hardcoded_edid(rdev);
+				radeon_connector->drm_edid = radeon_bios_get_hardcoded_edid(rdev);
 		} else {
 			/* some servers provide a hardcoded edid in rom for KVMs */
-			radeon_connector->edid = radeon_bios_get_hardcoded_edid(rdev);
+			radeon_connector->drm_edid = radeon_bios_get_hardcoded_edid(rdev);
 		}
 	}
+
+	drm_edid_connector_update(&radeon_connector->base, radeon_connector->drm_edid);
 }
 
 static void radeon_connector_free_edid(struct drm_connector *connector)
 {
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 
-	kfree(radeon_connector->edid);
-	radeon_connector->edid = NULL;
+	drm_edid_free(radeon_connector->drm_edid);
+	radeon_connector->drm_edid = NULL;
 }
 
 static int radeon_ddc_get_modes(struct drm_connector *connector)
 {
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
-	int ret;
 
-	if (radeon_connector->edid) {
-		drm_connector_update_edid_property(connector, radeon_connector->edid);
-		ret = drm_add_edid_modes(connector, radeon_connector->edid);
-		return ret;
-	}
-	drm_connector_update_edid_property(connector, NULL);
-	return 0;
+	drm_edid_connector_update(connector, radeon_connector->drm_edid);
+	return drm_edid_connector_add_modes(connector);
 }
 
 static struct drm_encoder *radeon_best_single_encoder(struct drm_connector *connector)
@@ -869,7 +865,7 @@ radeon_lvds_detect(struct drm_connector *connector, bool force)
 
 	/* check for edid as well */
 	radeon_connector_get_edid(connector);
-	if (radeon_connector->edid)
+	if (radeon_connector->drm_edid)
 		ret = connector_status_connected;
 	/* check acpi lid status ??? */
 
@@ -1010,13 +1006,12 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 		radeon_connector_free_edid(connector);
 		radeon_connector_get_edid(connector);
 
-		if (!radeon_connector->edid) {
+		if (!radeon_connector->drm_edid) {
 			DRM_ERROR("%s: probed a monitor but no|invalid EDID\n",
 					connector->name);
 			ret = connector_status_connected;
 		} else {
-			radeon_connector->use_digital =
-				!!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
+			radeon_connector->use_digital = drm_edid_is_digital(radeon_connector->drm_edid);
 
 			/* some oems have boards with separate digital and analog connectors
 			 * with a shared ddc line (often vga + hdmi)
@@ -1254,7 +1249,7 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 		radeon_connector_free_edid(connector);
 		radeon_connector_get_edid(connector);
 
-		if (!radeon_connector->edid) {
+		if (!radeon_connector->drm_edid) {
 			DRM_ERROR("%s: probed a monitor but no|invalid EDID\n",
 					connector->name);
 			/* rs690 seems to have a problem with connectors not existing and always
@@ -1270,8 +1265,7 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 				broken_edid = true; /* defer use_digital to later */
 			}
 		} else {
-			radeon_connector->use_digital =
-				!!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
+			radeon_connector->use_digital = drm_edid_is_digital(radeon_connector->drm_edid);
 
 			/* some oems have boards with separate digital and analog connectors
 			 * with a shared ddc line (often vga + hdmi)
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 088af85902f7..556c56d965bb 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -42,7 +42,6 @@ struct drm_fb_helper;
 struct drm_fb_helper_surface_size;
 struct drm_format_info;
 
-struct edid;
 struct drm_edid;
 struct radeon_bo;
 struct radeon_device;
@@ -525,7 +524,7 @@ struct radeon_connector {
 	bool use_digital;
 	/* we need to mind the EDID between detect
 	   and get modes due to analog/digital/tvencoder */
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	void *con_priv;
 	bool dac_load_detect;
 	bool detected_by_load; /* if the connection status was determined by load */
@@ -839,7 +838,7 @@ radeon_get_crtc_scanout_position(struct drm_crtc *crtc, bool in_vblank_irq,
 				 const struct drm_display_mode *mode);
 
 extern bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev);
-extern struct edid *
+extern const struct drm_edid *
 radeon_bios_get_hardcoded_edid(struct radeon_device *rdev);
 extern bool radeon_atom_get_clock_info(struct drm_device *dev);
 extern bool radeon_combios_get_clock_info(struct drm_device *dev);

---
base-commit: 130343ee6bca9895c47d314467db7dd3dcc8bc35
change-id: 20240818-radeon-drm_edid-9f0cec36e227

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

