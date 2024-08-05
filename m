Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31617947B8A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 15:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C4710E200;
	Mon,  5 Aug 2024 13:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5807910E1EA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 13:06:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 27ADB1F847;
 Mon,  5 Aug 2024 13:06:25 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E185813ACF;
 Mon,  5 Aug 2024 13:06:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id INzINVDOsGaiMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Aug 2024 13:06:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/5] drm/mgag200: vga-bmc: Control BMC scanout from encoder
Date: Mon,  5 Aug 2024 15:06:00 +0200
Message-ID: <20240805130622.63458-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240805130622.63458-1-tzimmermann@suse.de>
References: <20240805130622.63458-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 27ADB1F847
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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

Move calls to stop and start BMC scanout from CRTC helpers to the
VGA-BMC encoder's atomic_disable and atomic_enable. Makes the BMC
scanout transparent to the CRTC.

DRM's atomic helpers call an encoder's atomic_disable and atomic_enable
helpers for all enabled encoders. The BMC stops scanning out the VGA
signal if modeset disables the VGA encoder, and starts scanning out
if the modeset enables the VGA encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  3 ---
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  3 ---
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |  3 ---
 drivers/gpu/drm/mgag200/mgag200_mode.c    |  6 ------
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 20 ++++++++++++++++++++
 5 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index e0f7816ad87a..b99b308a7e54 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -207,9 +207,6 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_enable_display(mdev);
 
-	if (mdev->info->sync_bmc)
-		mgag200_bmc_start_scanout(mdev);
-
 	drm_crtc_vblank_on(crtc);
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index a2c683f82127..717e4357adcc 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -208,9 +208,6 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_enable_display(mdev);
 
-	if (mdev->info->sync_bmc)
-		mgag200_bmc_start_scanout(mdev);
-
 	drm_crtc_vblank_on(crtc);
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index b83f3f31ed0e..0db7e14e3328 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -339,9 +339,6 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_enable_display(mdev);
 
-	if (mdev->info->sync_bmc)
-		mgag200_bmc_start_scanout(mdev);
-
 	drm_crtc_vblank_on(crtc);
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 8dc16821e1cd..7159909aca1e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -693,9 +693,6 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 
 	mgag200_enable_display(mdev);
 
-	if (mdev->info->sync_bmc)
-		mgag200_bmc_start_scanout(mdev);
-
 	drm_crtc_vblank_on(crtc);
 }
 
@@ -705,9 +702,6 @@ void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic
 
 	drm_crtc_vblank_off(crtc);
 
-	if (mdev->info->sync_bmc)
-		mgag200_bmc_stop_scanout(mdev);
-
 	mgag200_disable_display(mdev);
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
index 77340f2dee17..a5a3ac108bd5 100644
--- a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
@@ -8,6 +8,24 @@
 #include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
+static void mgag200_vga_bmc_encoder_atomic_disable(struct drm_encoder *encoder,
+						   struct drm_atomic_state *state)
+{
+	struct mga_device *mdev = to_mga_device(encoder->dev);
+
+	if (mdev->info->sync_bmc)
+		mgag200_bmc_stop_scanout(mdev);
+}
+
+static void mgag200_vga_bmc_encoder_atomic_enable(struct drm_encoder *encoder,
+						  struct drm_atomic_state *state)
+{
+	struct mga_device *mdev = to_mga_device(encoder->dev);
+
+	if (mdev->info->sync_bmc)
+		mgag200_bmc_start_scanout(mdev);
+}
+
 static int mgag200_vga_bmc_encoder_atomic_check(struct drm_encoder *encoder,
 						struct drm_crtc_state *new_crtc_state,
 						struct drm_connector_state *new_connector_state)
@@ -21,6 +39,8 @@ static int mgag200_vga_bmc_encoder_atomic_check(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs mgag200_dac_encoder_helper_funcs = {
+	.atomic_disable = mgag200_vga_bmc_encoder_atomic_disable,
+	.atomic_enable = mgag200_vga_bmc_encoder_atomic_enable,
 	.atomic_check = mgag200_vga_bmc_encoder_atomic_check,
 };
 
-- 
2.46.0

