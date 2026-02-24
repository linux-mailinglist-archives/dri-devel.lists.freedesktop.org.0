Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGsEGb/FnWkRSAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB04189211
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E46B10E5BA;
	Tue, 24 Feb 2026 15:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gMbTIKqb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UAR7QVUv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gMbTIKqb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UAR7QVUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7585C10E5BA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:37:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A23D55BCFD;
 Tue, 24 Feb 2026 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gKm1cFRHolToL47oIiQPfe6VtRS6kkBnuRPyYn/fYrI=;
 b=gMbTIKqbdePmAvosljIKhk2VY+Clvrp5G9Z0uVylUMGVef7UNFkaIhIfoh/muSvx9puJqm
 hqzMmPyXYuL/1I2EW/4CHW1ngVg55cGv3ztW8Thyh7L2cH/jvykj3MYmC4AGofOyvn9C4e
 ed2Ku0jhTBB2baUjOngkzbJRIdwGbQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947425;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gKm1cFRHolToL47oIiQPfe6VtRS6kkBnuRPyYn/fYrI=;
 b=UAR7QVUv5qnxSQt5PIRFkLoIz70DgtGkUKePWuRArwXkOoi3wUv4Shr3Cxejzyi4NJT5gH
 jfFMEknyira5ulDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gKm1cFRHolToL47oIiQPfe6VtRS6kkBnuRPyYn/fYrI=;
 b=gMbTIKqbdePmAvosljIKhk2VY+Clvrp5G9Z0uVylUMGVef7UNFkaIhIfoh/muSvx9puJqm
 hqzMmPyXYuL/1I2EW/4CHW1ngVg55cGv3ztW8Thyh7L2cH/jvykj3MYmC4AGofOyvn9C4e
 ed2Ku0jhTBB2baUjOngkzbJRIdwGbQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947425;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gKm1cFRHolToL47oIiQPfe6VtRS6kkBnuRPyYn/fYrI=;
 b=UAR7QVUv5qnxSQt5PIRFkLoIz70DgtGkUKePWuRArwXkOoi3wUv4Shr3Cxejzyi4NJT5gH
 jfFMEknyira5ulDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40C603EA69;
 Tue, 24 Feb 2026 15:37:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iM9dDqHFnWm0FgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 15:37:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com,
 david@lechnology.com, architanant5@gmail.com, wens@kernel.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 11/16] drm/st7586: Use regular atomic helpers;
 drop simple-display helpers
Date: Tue, 24 Feb 2026 16:24:48 +0100
Message-ID: <20260224153656.261351-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224153656.261351-1-tzimmermann@suse.de>
References: <20260224153656.261351-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spam-Level: 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,lechnology.com,kernel.org,linux.intel.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:javierm@redhat.com,m:lanzano.alex@gmail.com,m:kamlesh.gurudasani@gmail.com,m:david@lechnology.com,m:architanant5@gmail.com,m:wens@kernel.org,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:tzimmermann@suse.de,m:lanzanoalex@gmail.com,m:kamleshgurudasani@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0EB04189211
X-Rspamd-Action: no action

Replace simple-display helpers with regular atomic helpers. Store the
pipeline elements in struct st7586_device and initialize them as part
of probing the device. Use mipi-dbi's existing helpers and initializer
macros where possible.

Effectively open-codes the modesetting code in the initializer helpers
of mipi-dbi and simple-display. St7586 requires custom helpers for
various pipeline elements, and non-freeing cleanup of the pipeline.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sitronix/st7586.c | 191 ++++++++++++++++++++++--------
 1 file changed, 143 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7586.c b/drivers/gpu/drm/sitronix/st7586.c
index dd3a1c770189..d02bfd075569 100644
--- a/drivers/gpu/drm/sitronix/st7586.c
+++ b/drivers/gpu/drm/sitronix/st7586.c
@@ -13,6 +13,7 @@
 #include <video/mipi_display.h>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
@@ -48,6 +49,20 @@
 #define ST7586_DISP_CTRL_MX	BIT(6)
 #define ST7586_DISP_CTRL_MY	BIT(7)
 
+struct st7586_device {
+	struct mipi_dbi_dev dbidev;
+
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+};
+
+static struct st7586_device *to_st7586_device(struct drm_device *dev)
+{
+	return container_of(drm_to_mipi_dbi_dev(dev), struct st7586_device, dbidev);
+}
+
 /*
  * The ST7586 controller has an unusual pixel format where 2bpp grayscale is
  * packed 3 pixels per byte with the first two pixels using 3 bits and the 3rd
@@ -147,46 +162,57 @@ static void st7586_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
 }
 
-static void st7586_pipe_update(struct drm_simple_display_pipe *pipe,
-			       struct drm_plane_state *old_state)
+static const u32 st7586_plane_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static const u64 st7586_plane_format_modifiers[] = {
+	DRM_MIPI_DBI_PLANE_FORMAT_MODIFIERS,
+};
+
+static void st7586_plane_helper_atomic_update(struct drm_plane *plane,
+					      struct drm_atomic_state *state)
 {
-	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_plane_state *plane_state = plane->state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_rect rect;
 	int idx;
 
-	if (!pipe->crtc.state->active)
+	if (!fb)
 		return;
 
-	if (!drm_dev_enter(fb->dev, &idx))
-		return;
+	if (drm_dev_enter(plane->dev, &idx)) {
+		if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &rect))
+			st7586_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
+					&shadow_plane_state->fmtcnv_state);
+		drm_dev_exit(idx);
+	}
+}
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		st7586_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
-				&shadow_plane_state->fmtcnv_state);
+static const struct drm_plane_helper_funcs st7586_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check = drm_mipi_dbi_plane_helper_atomic_check,
+	.atomic_update = st7586_plane_helper_atomic_update
+};
 
-	drm_dev_exit(idx);
-}
+static const struct drm_plane_funcs st7586_plane_funcs = {
+	DRM_MIPI_DBI_PLANE_FUNCS,
+	.destroy = drm_plane_cleanup,
+};
 
-static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
-			       struct drm_crtc_state *crtc_state,
-			       struct drm_plane_state *plane_state)
+static void st7586_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					     struct drm_atomic_state *state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
-	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_device *drm = crtc->dev;
+	struct st7586_device *st7586 = to_st7586_device(drm);
+	struct mipi_dbi_dev *dbidev = &st7586->dbidev;
 	struct mipi_dbi *dbi = &dbidev->dbi;
-	struct drm_rect rect = {
-		.x1 = 0,
-		.x2 = fb->width,
-		.y1 = 0,
-		.y2 = fb->height,
-	};
 	int idx, ret;
 	u8 addr_mode;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(drm, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
@@ -247,9 +273,12 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static void st7586_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void st7586_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					      struct drm_atomic_state *state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct drm_device *drm = crtc->dev;
+	struct st7586_device *st7586 = to_st7586_device(drm);
+	struct mipi_dbi_dev *dbidev = &st7586->dbidev;
 
 	/*
 	 * This callback is not protected by drm_dev_enter/exit since we want to
@@ -263,20 +292,37 @@ static void st7586_pipe_disable(struct drm_simple_display_pipe *pipe)
 	mipi_dbi_command(&dbidev->dbi, MIPI_DCS_SET_DISPLAY_OFF);
 }
 
-static const u32 st7586_formats[] = {
-	DRM_FORMAT_XRGB8888,
+static const struct drm_crtc_helper_funcs st7586_crtc_helper_funcs = {
+	.mode_valid = drm_mipi_dbi_crtc_helper_mode_valid,
+	.atomic_check = drm_mipi_dbi_crtc_helper_atomic_check,
+	.atomic_enable = st7586_crtc_helper_atomic_enable,
+	.atomic_disable = st7586_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs st7586_crtc_funcs = {
+	DRM_MIPI_DBI_CRTC_FUNCS,
+	.destroy = drm_crtc_cleanup,
+};
+
+static const struct drm_encoder_funcs st7586_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
-static const struct drm_simple_display_pipe_funcs st7586_pipe_funcs = {
-	.mode_valid	= mipi_dbi_pipe_mode_valid,
-	.enable		= st7586_pipe_enable,
-	.disable	= st7586_pipe_disable,
-	.update		= st7586_pipe_update,
-	.begin_fb_access = mipi_dbi_pipe_begin_fb_access,
-	.end_fb_access	= mipi_dbi_pipe_end_fb_access,
-	.reset_plane	= mipi_dbi_pipe_reset_plane,
-	.duplicate_plane_state = mipi_dbi_pipe_duplicate_plane_state,
-	.destroy_plane_state = mipi_dbi_pipe_destroy_plane_state,
+static const struct drm_connector_helper_funcs st7586_connector_helper_funcs = {
+	DRM_MIPI_DBI_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs st7586_connector_funcs = {
+	DRM_MIPI_DBI_CONNECTOR_FUNCS,
+	.destroy = drm_connector_cleanup,
+};
+
+static const struct drm_mode_config_helper_funcs st7586_mode_config_helper_funcs = {
+	DRM_MIPI_DBI_MODE_CONFIG_HELPER_FUNCS,
+};
+
+static const struct drm_mode_config_funcs st7586_mode_config_funcs = {
+	DRM_MIPI_DBI_MODE_CONFIG_FUNCS,
 };
 
 static const struct drm_display_mode st7586_mode = {
@@ -312,21 +358,26 @@ MODULE_DEVICE_TABLE(spi, st7586_id);
 static int st7586_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
+	struct st7586_device *st7586;
 	struct mipi_dbi_dev *dbidev;
 	struct drm_device *drm;
 	struct mipi_dbi *dbi;
 	struct gpio_desc *a0;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
 	u32 rotation = 0;
 	size_t bufsize;
 	int ret;
 
-	dbidev = devm_drm_dev_alloc(dev, &st7586_driver,
-				    struct mipi_dbi_dev, drm);
-	if (IS_ERR(dbidev))
-		return PTR_ERR(dbidev);
+	st7586 = devm_drm_dev_alloc(dev, &st7586_driver, struct st7586_device, dbidev.drm);
+	if (IS_ERR(st7586))
+		return PTR_ERR(st7586);
+	dbidev = &st7586->dbidev;
+	drm = &dbidev->drm;
 
 	dbi = &dbidev->dbi;
-	drm = &dbidev->drm;
 
 	bufsize = (st7586_mode.vdisplay + 2) / 3 * st7586_mode.hdisplay;
 
@@ -347,9 +398,8 @@ static int st7586_probe(struct spi_device *spi)
 	/* Cannot read from this controller via SPI */
 	dbi->read_commands = NULL;
 
-	ret = mipi_dbi_dev_init_with_formats(dbidev, &st7586_pipe_funcs,
-					     st7586_formats, ARRAY_SIZE(st7586_formats),
-					     &st7586_mode, rotation, bufsize);
+	ret = drm_mipi_dbi_dev_init(dbidev, &st7586_mode, st7586_plane_formats[0],
+				    rotation, bufsize);
 	if (ret)
 		return ret;
 
@@ -362,6 +412,51 @@ static int st7586_probe(struct spi_device *spi)
 	 */
 	dbi->swap_bytes = true;
 
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	drm->mode_config.min_width = dbidev->mode.hdisplay;
+	drm->mode_config.max_width = dbidev->mode.hdisplay;
+	drm->mode_config.min_height = dbidev->mode.vdisplay;
+	drm->mode_config.max_height = dbidev->mode.vdisplay;
+	drm->mode_config.funcs = &st7586_mode_config_funcs;
+	drm->mode_config.preferred_depth = 24;
+	drm->mode_config.helper_private = &st7586_mode_config_helper_funcs;
+
+	plane = &st7586->plane;
+	ret = drm_universal_plane_init(drm, plane, 0, &st7586_plane_funcs,
+				       st7586_plane_formats, ARRAY_SIZE(st7586_plane_formats),
+				       st7586_plane_format_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(plane, &st7586_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(plane);
+
+	crtc = &st7586->crtc;
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL, &st7586_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &st7586_crtc_helper_funcs);
+
+	encoder = &st7586->encoder;
+	ret = drm_encoder_init(drm, encoder, &st7586_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	connector = &st7586->connector;
+	ret = drm_connector_init(drm, connector, &st7586_connector_funcs,
+				 DRM_MODE_CONNECTOR_SPI);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(&dbidev->connector, &st7586_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ret;
+
 	drm_mode_config_reset(drm);
 
 	ret = drm_dev_register(drm, 0);
-- 
2.52.0

