Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB3E5514A2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 11:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD04610F276;
	Mon, 20 Jun 2022 09:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A0B11307F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 09:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655718229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x0tbimbmSvjjzalt5G8UNkOuz7v5t5rFi84PnGGJZ0s=;
 b=Eix99gNx/hkEJ4xBHvmwSreUkWtXBsVrlC0PJKKGLtvnHKD/LnlObgKs3wnkU1pKivki3S
 aYNJ2pGNcxJzPgVHiMGeu1/IY7hV62ckrUDTpfU+XJF4383Qj6DK0EQ9dELNtUuzxhqJWc
 llwpWrEZLSmoPZ0iZBcntXFfVjXksTI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-nR0TAJDlNYijBfaDAduvPg-1; Mon, 20 Jun 2022 05:43:47 -0400
X-MC-Unique: nR0TAJDlNYijBfaDAduvPg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B9CC8339A5;
 Mon, 20 Jun 2022 09:43:47 +0000 (UTC)
Received: from x1.nl (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FDB340314B;
 Mon, 20 Jun 2022 09:43:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: Drop CONFIG_BACKLIGHT_CLASS_DEVICE ifdefs
Date: Mon, 20 Jun 2022 11:43:35 +0200
Message-Id: <20220620094336.9633-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM_AMDGPU Kconfig code contains:

	select BACKLIGHT_CLASS_DEVICE

So the condition these ifdefs test for is always true, drop them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c          |  6 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h          |  4 ----
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c    | 14 --------------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +--------------
 4 files changed, 1 insertion(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 98ac53ee6bb5..130060834b4e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -66,9 +66,7 @@ struct amdgpu_atif {
 	struct amdgpu_atif_notifications notifications;
 	struct amdgpu_atif_functions functions;
 	struct amdgpu_atif_notification_cfg notification_cfg;
-#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) || defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
 	struct backlight_device *bd;
-#endif
 	struct amdgpu_dm_backlight_caps backlight_caps;
 };
 
@@ -436,7 +434,6 @@ static int amdgpu_atif_handler(struct amdgpu_device *adev,
 		DRM_DEBUG_DRIVER("ATIF: %d pending SBIOS requests\n", count);
 
 		if (req.pending & ATIF_PANEL_BRIGHTNESS_CHANGE_REQUEST) {
-#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) || defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
 			if (atif->bd) {
 				DRM_DEBUG_DRIVER("Changing brightness to %d\n",
 						 req.backlight_level);
@@ -447,7 +444,6 @@ static int amdgpu_atif_handler(struct amdgpu_device *adev,
 				 */
 				backlight_device_set_brightness(atif->bd, req.backlight_level);
 			}
-#endif
 		}
 
 		if (req.pending & ATIF_DGPU_DISPLAY_EVENT) {
@@ -849,7 +845,6 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
 
-#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) || defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
 	if (atif->notifications.brightness_change) {
 		if (amdgpu_device_has_dc_support(adev)) {
 #if defined(CONFIG_DRM_AMD_DC)
@@ -876,7 +871,6 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
 			}
 		}
 	}
-#endif
 	adev->acpi_nb.notifier_call = amdgpu_acpi_event;
 	register_acpi_notifier(&adev->acpi_nb);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index f80b4838cea1..dbe2904e015b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -349,15 +349,11 @@ struct amdgpu_mode_info {
 
 #define AMDGPU_MAX_BL_LEVEL 0xFF
 
-#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) || defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
-
 struct amdgpu_backlight_privdata {
 	struct amdgpu_encoder *encoder;
 	uint8_t negative;
 };
 
-#endif
-
 struct amdgpu_atom_ss {
 	uint16_t percentage;
 	uint16_t percentage_divider;
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index 8158677302fe..e2056fbbc750 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -120,8 +120,6 @@ amdgpu_atombios_encoder_set_backlight_level(struct amdgpu_encoder *amdgpu_encode
 	}
 }
 
-#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) || defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
-
 static u8 amdgpu_atombios_encoder_backlight_level(struct backlight_device *bd)
 {
 	u8 level;
@@ -263,18 +261,6 @@ amdgpu_atombios_encoder_fini_backlight(struct amdgpu_encoder *amdgpu_encoder)
 	}
 }
 
-#else /* !CONFIG_BACKLIGHT_CLASS_DEVICE */
-
-void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *encoder)
-{
-}
-
-void amdgpu_atombios_encoder_fini_backlight(struct amdgpu_encoder *encoder)
-{
-}
-
-#endif
-
 bool amdgpu_atombios_encoder_is_digital(struct drm_encoder *encoder)
 {
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6def02dec82d..87c1f7190752 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3868,9 +3868,6 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 #define AMDGPU_DM_DEFAULT_MAX_BACKLIGHT 255
 #define AUX_BL_DEFAULT_TRANSITION_TIME_MS 50
 
-#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) ||\
-	defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
-
 static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm,
 					    int bl_idx)
 {
@@ -4081,7 +4078,6 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
 	else
 		DRM_DEBUG_DRIVER("DM: Registered Backlight device: %s\n", bl_name);
 }
-#endif
 
 static int initialize_plane(struct amdgpu_display_manager *dm,
 			    struct amdgpu_mode_info *mode_info, int plane_id,
@@ -4127,9 +4123,6 @@ static int initialize_plane(struct amdgpu_display_manager *dm,
 static void register_backlight_device(struct amdgpu_display_manager *dm,
 				      struct dc_link *link)
 {
-#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) ||\
-	defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
-
 	if ((link->connector_signal & (SIGNAL_TYPE_EDP | SIGNAL_TYPE_LVDS)) &&
 	    link->type != dc_connection_none) {
 		/*
@@ -4145,7 +4138,6 @@ static void register_backlight_device(struct amdgpu_display_manager *dm,
 			dm->num_of_edps++;
 		}
 	}
-#endif
 }
 
 
@@ -6853,15 +6845,12 @@ static void amdgpu_dm_connector_destroy(struct drm_connector *connector)
 	if (aconnector->mst_mgr.dev)
 		drm_dp_mst_topology_mgr_destroy(&aconnector->mst_mgr);
 
-#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) ||\
-	defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
 	for (i = 0; i < dm->num_of_edps; i++) {
 		if ((link == dm->backlight_link[i]) && dm->backlight_dev[i]) {
 			backlight_device_unregister(dm->backlight_dev[i]);
 			dm->backlight_dev[i] = NULL;
 		}
 	}
-#endif
 
 	if (aconnector->dc_em_sink)
 		dc_sink_release(aconnector->dc_em_sink);
@@ -9925,15 +9914,13 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	/* Update audio instances for each connector. */
 	amdgpu_dm_commit_audio(dev, state);
 
-#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) ||		\
-	defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
 	/* restore the backlight level */
 	for (i = 0; i < dm->num_of_edps; i++) {
 		if (dm->backlight_dev[i] &&
 		    (dm->actual_brightness[i] != dm->brightness[i]))
 			amdgpu_dm_backlight_set_level(dm, i, dm->brightness[i]);
 	}
-#endif
+
 	/*
 	 * send vblank event on all events not handled in flip and
 	 * mark consumed event for drm_atomic_helper_commit_hw_done
-- 
2.36.0

