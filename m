Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9798852859E
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9B210FAED;
	Mon, 16 May 2022 13:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745EE10F053
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:40:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EBF5E2200D;
 Mon, 16 May 2022 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652708418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sWyJFC0ZWzRPh3HCCJV3g3YG73Ti9dUJqQPGV2/AclU=;
 b=XXjXZbuAj8Bn9BNEdDALxN6/MAHDZatpLk0toXMXJaTKul8GbZau8BIybp5sdPfm3wRdUu
 nw0QhTir9/HoplfOg1gh2mpMOGlbqeQM7Q/M0KBTxmIWOoxvDybWJETyfZ/C2lHkxYPpJY
 x9MdX/X/bPr4YzKtsDJd3/97ik66LR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652708418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sWyJFC0ZWzRPh3HCCJV3g3YG73Ti9dUJqQPGV2/AclU=;
 b=yJ9H6gXHqfTMjTGNNAOogdJDp88InoXHVjwZl4YXXotjt7M2jyxjsZMuKJIMnwTv1SeIGa
 0PYmWDtD9TYM5OCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0CC413ADC;
 Mon, 16 May 2022 13:40:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iC4gLkJUgmIpAwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 May 2022 13:40:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 7/7] drm/mgag200: Split up connector's mode_valid helper
Date: Mon, 16 May 2022 15:40:15 +0200
Message-Id: <20220516134015.5845-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516134015.5845-1-tzimmermann@suse.de>
References: <20220516134015.5845-1-tzimmermann@suse.de>
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

The memory-bandwidth tests assume that the display uses 4 bytes per
pixel. The first models of G200SE-A only had 1.75 MiB of VRAM, which
limits these devices to 640x480-32.

v2:
	* note the memory contraints on early G200SE-A

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 146 ++++++++++++-------------
 1 file changed, 69 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index a718a20b3a20..028c6ba7124c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -705,38 +705,27 @@ static int mgag200_vga_connector_helper_get_modes(struct drm_connector *connecto
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
@@ -746,42 +735,17 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
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
@@ -799,30 +763,6 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
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
@@ -1055,6 +995,31 @@ static const uint64_t mgag200_simple_display_pipe_fmtmods[] = {
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
@@ -1070,6 +1035,33 @@ static enum drm_mode_status mgag200_mode_config_mode_valid(struct drm_device *de
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
2.36.1

