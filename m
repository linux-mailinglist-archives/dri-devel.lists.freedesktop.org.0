Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C589F909CBB
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 11:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E261510E0F5;
	Sun, 16 Jun 2024 09:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="adVOb+r7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5505410E0F5;
 Sun, 16 Jun 2024 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1718529169;
 bh=soXT6ejv1Jmdiecl/JaLHs9qbKzLrDGNxWPNnQa5keg=;
 h=From:Date:Subject:To:Cc:From;
 b=adVOb+r7x6NPCff5svEjqTEheRJqsecwvwA1P+hQcGKHMXwzlK8cs6s+tr+/Zfv+p
 yDpBX/2InSLlHIdcpKaLp5KWd+JgqjNb8p3VUf/guEGS3UKAxRy2Y9jDsvVXlYlbKA
 VS3fQz915nGIjDUrRgP9jijeBskv3aHF+uTVkMHc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 16 Jun 2024 11:12:03 +0200
Subject: [PATCH] drm/amdgpu: convert bios_hardcoded_edid to drm_edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240616-amdgpu-edid-bios-v1-1-2874f212b365@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAGKsbmYC/x3MMQqAMAxA0atIZgNNKx28ijhEGzWDVVoUQXp3i
 +Mb/n8hS1LJ0DcvJLk16xErqG1g3jiughqqwRrbGU8eeQ/reaEEDTjpkZEdMZOfjLMENTuTLPr
 8y2Es5QMoxhPDYgAAAA==
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718529166; l=7172;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=soXT6ejv1Jmdiecl/JaLHs9qbKzLrDGNxWPNnQa5keg=;
 b=nVYgkUeKEtbsZrsJiINgk727iI4cpBu7q/mFHtx8PvPoOMQyKR9ogrLzw9sk+E7/kAjYhWFzp
 1pY1jyMyVolDBSDTK5zm1ya9AzehJtuyZLwdt0cuFIVdFyGoK+NY1ek
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
While this patch introduces a new user for drm_edid_raw(),
if amdgpu proper gets migrated to 'struct drm_edid', that usage will go
away.

This is only compile-tested.

I have some more patches for the rest of amdgpu,
to move to 'struct drm_edid'.
This patch is a test-balloon for the general idea.

The same can also be done for drm/radeon.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c |  6 +-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h       |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 21 +++++++--------------
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c          |  2 +-
 8 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 9caba10315a8..f1b11b27cce0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -265,11 +265,7 @@ struct edid *amdgpu_connector_edid(struct drm_connector *connector)
 static struct edid *
 amdgpu_connector_get_hardcoded_edid(struct amdgpu_device *adev)
 {
-	if (adev->mode_info.bios_hardcoded_edid) {
-		return kmemdup((unsigned char *)adev->mode_info.bios_hardcoded_edid,
-			       adev->mode_info.bios_hardcoded_edid_size, GFP_KERNEL);
-	}
-	return NULL;
+	return drm_edid_duplicate(drm_edid_raw(adev->mode_info.bios_hardcoded_edid));
 }
 
 static void amdgpu_connector_get_edid(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 1fe21a70ddd0..928ac3f1e2ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -51,6 +51,7 @@ struct amdgpu_encoder;
 struct amdgpu_router;
 struct amdgpu_hpd;
 struct edid;
+struct drm_edid;
 
 #define to_amdgpu_crtc(x) container_of(x, struct amdgpu_crtc, base)
 #define to_amdgpu_connector(x) container_of(x, struct amdgpu_connector, base)
@@ -325,8 +326,7 @@ struct amdgpu_mode_info {
 	/* FMT dithering */
 	struct drm_property *dither_property;
 	/* hardcoded DFP edid from BIOS */
-	struct edid *bios_hardcoded_edid;
-	int bios_hardcoded_edid_size;
+	const struct drm_edid *bios_hardcoded_edid;
 
 	/* firmware flags */
 	u32 firmware_flags;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index e30eecd02ae1..543275db8302 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -539,7 +539,7 @@ static int amdgpu_vkms_sw_fini(void *handle)
 
 	adev->mode_info.mode_config_initialized = false;
 
-	kfree(adev->mode_info.bios_hardcoded_edid);
+	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
 	kfree(adev->amdgpu_vkms_output);
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index 25feab188dfe..90383094ed1e 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -2064,20 +2064,13 @@ amdgpu_atombios_encoder_get_lcd_info(struct amdgpu_encoder *encoder)
 				case LCD_FAKE_EDID_PATCH_RECORD_TYPE:
 					fake_edid_record = (ATOM_FAKE_EDID_PATCH_RECORD *)record;
 					if (fake_edid_record->ucFakeEDIDLength) {
-						struct edid *edid;
-						int edid_size =
-							max((int)EDID_LENGTH, (int)fake_edid_record->ucFakeEDIDLength);
-						edid = kmalloc(edid_size, GFP_KERNEL);
-						if (edid) {
-							memcpy((u8 *)edid, (u8 *)&fake_edid_record->ucFakeEDIDString[0],
-							       fake_edid_record->ucFakeEDIDLength);
-
-							if (drm_edid_is_valid(edid)) {
-								adev->mode_info.bios_hardcoded_edid = edid;
-								adev->mode_info.bios_hardcoded_edid_size = edid_size;
-							} else
-								kfree(edid);
-						}
+						const struct drm_edid *edid;
+						edid = drm_edid_alloc(fake_edid_record->ucFakeEDIDString,
+								      max_t(int, EDID_LENGTH, fake_edid_record->ucFakeEDIDLength));
+						if (drm_edid_valid(edid))
+							adev->mode_info.bios_hardcoded_edid = edid;
+						else
+							drm_edid_free(edid);
 					}
 					record += fake_edid_record->ucFakeEDIDLength ?
 						  struct_size(fake_edid_record,
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index b44fce44c066..11d648e688ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2846,7 +2846,7 @@ static int dce_v10_0_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	kfree(adev->mode_info.bios_hardcoded_edid);
+	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
 
 	drm_kms_helper_poll_fini(adev_to_drm(adev));
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 80b2e7f79acf..01536f523032 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -2973,7 +2973,7 @@ static int dce_v11_0_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	kfree(adev->mode_info.bios_hardcoded_edid);
+	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
 
 	drm_kms_helper_poll_fini(adev_to_drm(adev));
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index db20012600f5..0e5b568a96fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2745,7 +2745,7 @@ static int dce_v6_0_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	kfree(adev->mode_info.bios_hardcoded_edid);
+	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
 
 	drm_kms_helper_poll_fini(adev_to_drm(adev));
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 5b56100ec902..895f050a3e62 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2766,7 +2766,7 @@ static int dce_v8_0_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	kfree(adev->mode_info.bios_hardcoded_edid);
+	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
 
 	drm_kms_helper_poll_fini(adev_to_drm(adev));
 

---
base-commit: a3e18a540541325a8c8848171f71e0d45ad30b2c
change-id: 20240616-amdgpu-edid-bios-a31aa16b0321

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

