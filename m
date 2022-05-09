Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 041C951FA10
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 12:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB8E10E96B;
	Mon,  9 May 2022 10:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0673610E95E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 10:36:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9848421C37;
 Mon,  9 May 2022 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652092559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIPSxsGGVHZU268fsmLzEavli+X3hOtz0l77MJKv1nw=;
 b=vSRbYpI8haLXzwu2u17UNdlDdK/9oTmhiaeL8zKH4TBssIgHrJQNbqDwsTvwy2BJgXy3Rn
 PgWml9/90Kn17O7t6ojlchtI9OZ4J3yU0lPemtAhNphr58vXOaKtWhQ2rnsFGyMEkRAB15
 l5oCGWe5fRauctvmWKvawZqRrqQkRpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652092559;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIPSxsGGVHZU268fsmLzEavli+X3hOtz0l77MJKv1nw=;
 b=uN6pbl3hWL0HYiu8FyWzyA7h19egmfFHauyD2rLLlEYkq9M8LRGZFup1ULu73qH9RqL5RY
 eYmDnPwOI3f+j1AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FE84132C0;
 Mon,  9 May 2022 10:35:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ULx0Go/ueGJ9AgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 May 2022 10:35:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH 7/7] drm/mgag200: Split up connector's mode_valid helper
Date: Mon,  9 May 2022 12:35:54 +0200
Message-Id: <20220509103554.11996-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220509103554.11996-1-tzimmermann@suse.de>
References: <20220509103554.11996-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split up the connector's mode_valid helper into a simple-pipe and a
mode-config helper. The simple-pipe helper tests for display-size
limits while the mode-config helper tests for memory-bandwidth limits.

Also add the mgag200_ prefix to mga_vga_calculate_mode_bandwidth() and
comment on the function's purpose.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 146 ++++++++++++-------------
 1 file changed, 69 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 92d3ae9489f0..a808827d7a2c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -681,38 +681,27 @@ static int mgag200_vga_connector_helper_get_modes(struct drm_connector *connecto
 	return ret;
 }
 
-static uint32_t mga_vga_calculate_mode_bandwidth(struct drm_display_mode *mode,
-							int bits_per_pixel)
-{
-	uint32_t total_area, divisor;
-	uint64_t active_area, pixels_per_second, bandwidth;
-	uint64_t bytes_per_pixel = (bits_per_pixel + 7) / 8;
-
-	divisor = 1024;
-
-	if (!mode->htotal || !mode->vtotal || !mode->clock)
-		return 0;
-
-	active_area = mode->hdisplay * mode->vdisplay;
-	total_area = mode->htotal * mode->vtotal;
-
-	pixels_per_second = active_area * mode->clock * 1000;
-	do_div(pixels_per_second, total_area);
-
-	bandwidth = pixels_per_second * bytes_per_pixel * 100;
-	do_div(bandwidth, divisor);
+static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs = {
+	.get_modes  = mgag200_vga_connector_helper_get_modes,
+};
 
-	return (uint32_t)(bandwidth);
-}
+static const struct drm_connector_funcs mga_vga_connector_funcs = {
+	.reset                  = drm_atomic_helper_connector_reset,
+	.fill_modes             = drm_helper_probe_single_connector_modes,
+	.destroy                = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
+};
 
-#define MODE_BANDWIDTH	MODE_BAD
+/*
+ * Simple Display Pipe
+ */
 
-static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
-				 struct drm_display_mode *mode)
+static enum drm_mode_status
+mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
+				       const struct drm_display_mode *mode)
 {
-	struct drm_device *dev = connector->dev;
-	struct mga_device *mdev = to_mga_device(dev);
-	int bpp = 32;
+	struct mga_device *mdev = to_mga_device(pipe->crtc.dev);
 
 	if (IS_G200_SE(mdev)) {
 		u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
@@ -722,42 +711,17 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
 				return MODE_VIRTUAL_X;
 			if (mode->vdisplay > 1200)
 				return MODE_VIRTUAL_Y;
-			if (mga_vga_calculate_mode_bandwidth(mode, bpp)
-				> (24400 * 1024))
-				return MODE_BANDWIDTH;
 		} else if (unique_rev_id == 0x02) {
 			if (mode->hdisplay > 1920)
 				return MODE_VIRTUAL_X;
 			if (mode->vdisplay > 1200)
 				return MODE_VIRTUAL_Y;
-			if (mga_vga_calculate_mode_bandwidth(mode, bpp)
-				> (30100 * 1024))
-				return MODE_BANDWIDTH;
-		} else {
-			if (mga_vga_calculate_mode_bandwidth(mode, bpp)
-				> (55000 * 1024))
-				return MODE_BANDWIDTH;
 		}
 	} else if (mdev->type == G200_WB) {
 		if (mode->hdisplay > 1280)
 			return MODE_VIRTUAL_X;
 		if (mode->vdisplay > 1024)
 			return MODE_VIRTUAL_Y;
-		if (mga_vga_calculate_mode_bandwidth(mode, bpp) >
-		    (31877 * 1024))
-			return MODE_BANDWIDTH;
-	} else if (mdev->type == G200_EV &&
-		(mga_vga_calculate_mode_bandwidth(mode, bpp)
-			> (32700 * 1024))) {
-		return MODE_BANDWIDTH;
-	} else if (mdev->type == G200_EH &&
-		(mga_vga_calculate_mode_bandwidth(mode, bpp)
-			> (37500 * 1024))) {
-		return MODE_BANDWIDTH;
-	} else if (mdev->type == G200_ER &&
-		(mga_vga_calculate_mode_bandwidth(mode,
-			bpp) > (55000 * 1024))) {
-		return MODE_BANDWIDTH;
 	}
 
 	if ((mode->hdisplay % 8) != 0 || (mode->hsync_start % 8) != 0 ||
@@ -775,30 +739,6 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
-static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs = {
-	.get_modes  = mgag200_vga_connector_helper_get_modes,
-	.mode_valid = mga_vga_mode_valid,
-};
-
-static const struct drm_connector_funcs mga_vga_connector_funcs = {
-	.reset                  = drm_atomic_helper_connector_reset,
-	.fill_modes             = drm_helper_probe_single_connector_modes,
-	.destroy                = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
-};
-
-/*
- * Simple Display Pipe
- */
-
-static enum drm_mode_status
-mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
-				       const struct drm_display_mode *mode)
-{
-	return MODE_OK;
-}
-
 static void
 mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
 		      struct drm_rect *clip, const struct iosys_map *map)
@@ -1009,6 +949,31 @@ static const uint64_t mgag200_simple_display_pipe_fmtmods[] = {
  * Mode config
  */
 
+/* Calculates a mode's required memory bandwidth (in KiB/sec). */
+static uint32_t mgag200_calculate_mode_bandwidth(const struct drm_display_mode *mode,
+						 unsigned int bits_per_pixel)
+{
+	uint32_t total_area, divisor;
+	uint64_t active_area, pixels_per_second, bandwidth;
+	uint64_t bytes_per_pixel = (bits_per_pixel + 7) / 8;
+
+	divisor = 1024;
+
+	if (!mode->htotal || !mode->vtotal || !mode->clock)
+		return 0;
+
+	active_area = mode->hdisplay * mode->vdisplay;
+	total_area = mode->htotal * mode->vtotal;
+
+	pixels_per_second = active_area * mode->clock * 1000;
+	do_div(pixels_per_second, total_area);
+
+	bandwidth = pixels_per_second * bytes_per_pixel * 100;
+	do_div(bandwidth, divisor);
+
+	return (uint32_t)bandwidth;
+}
+
 static enum drm_mode_status mgag200_mode_config_mode_valid(struct drm_device *dev,
 							   const struct drm_display_mode *mode)
 {
@@ -1024,6 +989,33 @@ static enum drm_mode_status mgag200_mode_config_mode_valid(struct drm_device *de
 	if (fbpages > max_fbpages)
 		return MODE_MEM;
 
+	if (IS_G200_SE(mdev)) {
+		u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
+
+		if (unique_rev_id == 0x01) {
+			if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (24400 * 1024))
+				return MODE_BAD;
+		} else if (unique_rev_id == 0x02) {
+			if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (30100 * 1024))
+				return MODE_BAD;
+		} else {
+			if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (55000 * 1024))
+				return MODE_BAD;
+		}
+	} else if (mdev->type == G200_WB) {
+		if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (31877 * 1024))
+			return MODE_BAD;
+	} else if (mdev->type == G200_EV) {
+		if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (32700 * 1024))
+			return MODE_BAD;
+	} else if (mdev->type == G200_EH) {
+		if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (37500 * 1024))
+			return MODE_BAD;
+	} else if (mdev->type == G200_ER) {
+		if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (55000 * 1024))
+			return MODE_BAD;
+	}
+
 	return MODE_OK;
 }
 
-- 
2.36.0

