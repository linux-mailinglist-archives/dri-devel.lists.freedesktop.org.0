Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7F993D45E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 15:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E0710E98B;
	Fri, 26 Jul 2024 13:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="e2c43uYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBC510E98B;
 Fri, 26 Jul 2024 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1722001252;
 bh=zLLuxR3/V2JlN8OpJMEgWoG2yzJmfvO65eS2FhFFww0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=e2c43uYCSx+UQy0ru8kSGsDvUIh1zIYSL0TfYSFHx07W2ZPuev8WkBemM1p9MXpMM
 WlVBkfZ9208dnBW9WEyDTKHilQxFDyp2tqGPmsyNhg0PywSdK6O/wtOMUqkBkCk0tV
 z9JSpYnth123fFk9b/rRrvrfpupSjJIU3dHn5rtc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 26 Jul 2024 15:40:16 +0200
Subject: [PATCH v2 2/2] drm/radeon: convert bios_hardcoded_edid to drm_edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240726-amdgpu-edid-bios-v2-2-8a0326654253@weissschuh.net>
References: <20240726-amdgpu-edid-bios-v2-0-8a0326654253@weissschuh.net>
In-Reply-To: <20240726-amdgpu-edid-bios-v2-0-8a0326654253@weissschuh.net>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722001252; l=6245;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=zLLuxR3/V2JlN8OpJMEgWoG2yzJmfvO65eS2FhFFww0=;
 b=9ND2sB1KDIhpbUs2FjCzipLLAEQJwkB/HTt8Z/JxRNUUSxvSIwYeKKU96tmaLZFnby3Mhupea
 syJ6iAwiPvXC2fFCmF8mOeG+mGqSa0JgASFcS9JbNS7MXKxrMvLtY9Z
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

Instead of manually passing around 'struct edid *' and its size,
use 'struct drm_edid', which encapsulates a validated combination of
both.

As the drm_edid_ can handle NULL gracefully, the explicit checks can be
dropped.

Also save a few characters by transforming '&array[0]' to the equivalent
'array' and using 'max_t(int, ...)' instead of manual casts.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/radeon/radeon_atombios.c   | 17 ++++++-----------
 drivers/gpu/drm/radeon/radeon_combios.c    | 26 +++++---------------------
 drivers/gpu/drm/radeon/radeon_connectors.c |  4 ++--
 drivers/gpu/drm/radeon/radeon_display.c    |  2 +-
 drivers/gpu/drm/radeon/radeon_mode.h       |  4 ++--
 5 files changed, 16 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 168f3f94003b..81a0a91921b9 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -1716,23 +1716,18 @@ struct radeon_encoder_atom_dig *radeon_atombios_get_lvds_info(struct
 				case LCD_FAKE_EDID_PATCH_RECORD_TYPE:
 					fake_edid_record = (ATOM_FAKE_EDID_PATCH_RECORD *)record;
 					if (fake_edid_record->ucFakeEDIDLength) {
-						struct edid *edid;
+						const struct drm_edid *edid;
 						int edid_size;
 
 						if (fake_edid_record->ucFakeEDIDLength == 128)
 							edid_size = fake_edid_record->ucFakeEDIDLength;
 						else
 							edid_size = fake_edid_record->ucFakeEDIDLength * 128;
-						edid = kmemdup(&fake_edid_record->ucFakeEDIDString[0],
-							       edid_size, GFP_KERNEL);
-						if (edid) {
-							if (drm_edid_is_valid(edid)) {
-								rdev->mode_info.bios_hardcoded_edid = edid;
-								rdev->mode_info.bios_hardcoded_edid_size = edid_size;
-							} else {
-								kfree(edid);
-							}
-						}
+						edid = drm_edid_alloc(fake_edid_record->ucFakeEDIDString, edid_size);
+						if (drm_edid_valid(edid))
+							rdev->mode_info.bios_hardcoded_edid = edid;
+						else
+							drm_edid_free(edid);
 						record += struct_size(fake_edid_record,
 								      ucFakeEDIDString,
 								      edid_size);
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index 41ddc576f8f8..df8d7f56b028 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -370,7 +370,7 @@ static uint16_t combios_get_table_offset(struct drm_device *dev,
 bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev)
 {
 	int edid_info, size;
-	struct edid *edid;
+	const struct drm_edid *edid;
 	unsigned char *raw;
 	edid_info = combios_get_table_offset(rdev_to_drm(rdev), COMBIOS_HARDCODED_EDID_TABLE);
 	if (!edid_info)
@@ -378,19 +378,14 @@ bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev)
 
 	raw = rdev->bios + edid_info;
 	size = EDID_LENGTH * (raw[0x7e] + 1);
-	edid = kmalloc(size, GFP_KERNEL);
-	if (edid == NULL)
-		return false;
-
-	memcpy((unsigned char *)edid, raw, size);
+	edid = drm_edid_alloc(raw, size);
 
-	if (!drm_edid_is_valid(edid)) {
-		kfree(edid);
+	if (!drm_edid_valid(edid)) {
+		drm_edid_free(edid);
 		return false;
 	}
 
 	rdev->mode_info.bios_hardcoded_edid = edid;
-	rdev->mode_info.bios_hardcoded_edid_size = size;
 	return true;
 }
 
@@ -398,18 +393,7 @@ bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev)
 struct edid *
 radeon_bios_get_hardcoded_edid(struct radeon_device *rdev)
 {
-	struct edid *edid;
-
-	if (rdev->mode_info.bios_hardcoded_edid) {
-		edid = kmalloc(rdev->mode_info.bios_hardcoded_edid_size, GFP_KERNEL);
-		if (edid) {
-			memcpy((unsigned char *)edid,
-			       (unsigned char *)rdev->mode_info.bios_hardcoded_edid,
-			       rdev->mode_info.bios_hardcoded_edid_size);
-			return edid;
-		}
-	}
-	return NULL;
+	return drm_edid_duplicate(drm_edid_raw(rdev->mode_info.bios_hardcoded_edid));
 }
 
 static struct radeon_i2c_bus_rec combios_setup_i2c_bus(struct radeon_device *rdev,
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 880edabfc9e3..528a8f3677c2 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -1059,7 +1059,7 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 	 */
 	if ((!rdev->is_atom_bios) &&
 	    (ret == connector_status_disconnected) &&
-	    rdev->mode_info.bios_hardcoded_edid_size) {
+	    rdev->mode_info.bios_hardcoded_edid) {
 		ret = connector_status_connected;
 	}
 
@@ -1392,7 +1392,7 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 out:
 	if ((!rdev->is_atom_bios) &&
 	    (ret == connector_status_disconnected) &&
-	    rdev->mode_info.bios_hardcoded_edid_size) {
+	    rdev->mode_info.bios_hardcoded_edid) {
 		radeon_connector->use_digital = true;
 		ret = connector_status_connected;
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 10fd58f400bc..8f5f8abcb1b4 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1658,7 +1658,7 @@ void radeon_modeset_fini(struct radeon_device *rdev)
 		rdev->mode_info.mode_config_initialized = false;
 	}
 
-	kfree(rdev->mode_info.bios_hardcoded_edid);
+	drm_edid_free(rdev->mode_info.bios_hardcoded_edid);
 
 	/* free i2c buses */
 	radeon_i2c_fini(rdev);
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index e0a5af180801..421c83fc70dc 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -39,6 +39,7 @@
 #include <linux/i2c-algo-bit.h>
 
 struct edid;
+struct drm_edid;
 struct radeon_bo;
 struct radeon_device;
 
@@ -262,8 +263,7 @@ struct radeon_mode_info {
 	/* Output CSC */
 	struct drm_property *output_csc_property;
 	/* hardcoded DFP edid from BIOS */
-	struct edid *bios_hardcoded_edid;
-	int bios_hardcoded_edid_size;
+	const struct drm_edid *bios_hardcoded_edid;
 
 	/* firmware flags */
 	u16 firmware_flags;

-- 
2.45.2

