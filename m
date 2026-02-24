Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MX/KLjFnWkRSAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD861891F8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA5410E5BB;
	Tue, 24 Feb 2026 15:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HVkkGSOc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yuTaEkx7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HVkkGSOc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yuTaEkx7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217B410E5AE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:37:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C28475BCEC;
 Tue, 24 Feb 2026 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odPFVxwTXOEsC96Bw5GxWWMdYgcmStfHI0vwY1Ung4E=;
 b=HVkkGSOcq6o/wynHJ4a5LYyrbmhHFr+qeMHuEJmETVYvtT4pFBsQicA6X8EGOvRea7gK0/
 6m3Sw/95rqxgb7YM4dwALKt15g82eegTntbf6EOEUaGD2orxT557RgHzlWLY63feJBgSXq
 PsaSgsMcSTOR1tupYT1cvi5S2iZM0yo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947423;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odPFVxwTXOEsC96Bw5GxWWMdYgcmStfHI0vwY1Ung4E=;
 b=yuTaEkx7W0QjO2TfjlLamGQB50/O1T8MglVLbRMnghZxv3qWEWuYQX8sKacUVdIMMPUS3K
 Vq/L+CmjMEjduwAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HVkkGSOc;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yuTaEkx7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odPFVxwTXOEsC96Bw5GxWWMdYgcmStfHI0vwY1Ung4E=;
 b=HVkkGSOcq6o/wynHJ4a5LYyrbmhHFr+qeMHuEJmETVYvtT4pFBsQicA6X8EGOvRea7gK0/
 6m3Sw/95rqxgb7YM4dwALKt15g82eegTntbf6EOEUaGD2orxT557RgHzlWLY63feJBgSXq
 PsaSgsMcSTOR1tupYT1cvi5S2iZM0yo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947423;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odPFVxwTXOEsC96Bw5GxWWMdYgcmStfHI0vwY1Ung4E=;
 b=yuTaEkx7W0QjO2TfjlLamGQB50/O1T8MglVLbRMnghZxv3qWEWuYQX8sKacUVdIMMPUS3K
 Vq/L+CmjMEjduwAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60F663EA68;
 Tue, 24 Feb 2026 15:37:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OKw8Fp/FnWm0FgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 15:37:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com,
 david@lechnology.com, architanant5@gmail.com, wens@kernel.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/16] drm/ili9225: Use regular atomic helpers;
 drop simple-display helpers
Date: Tue, 24 Feb 2026 16:24:43 +0100
Message-ID: <20260224153656.261351-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224153656.261351-1-tzimmermann@suse.de>
References: <20260224153656.261351-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.51
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
X-Rspamd-Queue-Id: 2BD861891F8
X-Rspamd-Action: no action

Replace simple-display helpers with regular atomic helpers. Store the
pipeline elements in struct ili9225_device and initialize them as part
of probing the device. Use mipi-dbi's existing helpers and initializer
macros where possible.

Effectively open-codes the modesetting code in the initializer helpers
of mipi-dbi and simple-display. Ili9225 requires custom helpers for
various pipeline elements, and non-freeing cleanup of the pipeline.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/ili9225.c | 190 +++++++++++++++++++++++++--------
 1 file changed, 145 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index cab03cad389d..090691290379 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -17,6 +17,7 @@
 #include <video/mipi_display.h>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
@@ -24,9 +25,7 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
-#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_print.h>
@@ -72,6 +71,20 @@
 #define ILI9225_GAMMA_CONTROL_9		0x58
 #define ILI9225_GAMMA_CONTROL_10	0x59
 
+struct ili9225_device {
+	struct mipi_dbi_dev dbidev;
+
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+};
+
+static struct ili9225_device *to_ili9225_device(struct drm_device *dev)
+{
+	return container_of(drm_to_mipi_dbi_dev(dev), struct ili9225_device, dbidev);
+}
+
 static inline int ili9225_command(struct mipi_dbi *dbi, u8 cmd, u16 data)
 {
 	u8 par[2] = { data >> 8, data & 0xff };
@@ -157,47 +170,61 @@ static void ili9225_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
 }
 
-static void ili9225_pipe_update(struct drm_simple_display_pipe *pipe,
-				struct drm_plane_state *old_state)
+static const u32 ili9225_plane_formats[] = {
+	DRM_MIPI_DBI_PLANE_FORMATS,
+};
+
+static const u64 ili9225_plane_format_modifiers[] = {
+	DRM_MIPI_DBI_PLANE_FORMAT_MODIFIERS,
+};
+
+static void ili9225_plane_helper_atomic_update(struct drm_plane *plane,
+					       struct drm_atomic_state *state)
 {
-	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_device *drm = plane->dev;
+	struct drm_plane_state *plane_state = plane->state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_rect rect;
 	int idx;
 
-	if (!pipe->crtc.state->active)
+	if (!plane_state->fb)
 		return;
 
-	if (!drm_dev_enter(fb->dev, &idx))
+	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
+	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &rect))
 		ili9225_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
 				 &shadow_plane_state->fmtcnv_state);
 
 	drm_dev_exit(idx);
 }
 
-static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
-				struct drm_crtc_state *crtc_state,
-				struct drm_plane_state *plane_state)
+static const struct drm_plane_helper_funcs ili9225_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check = drm_mipi_dbi_plane_helper_atomic_check,
+	.atomic_update = ili9225_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs ili9225_plane_funcs = {
+	DRM_MIPI_DBI_PLANE_FUNCS,
+	.destroy = drm_plane_cleanup,
+};
+
+static void ili9225_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					      struct drm_atomic_state *state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
-	struct drm_framebuffer *fb = plane_state->fb;
-	struct device *dev = pipe->crtc.dev->dev;
+	struct drm_device *drm = crtc->dev;
+	struct ili9225_device *ili9225 = to_ili9225_device(drm);
+	struct mipi_dbi_dev *dbidev = &ili9225->dbidev;
+	struct device *dev = drm->dev;
 	struct mipi_dbi *dbi = &dbidev->dbi;
-	struct drm_rect rect = {
-		.x1 = 0,
-		.x2 = fb->width,
-		.y1 = 0,
-		.y2 = fb->height,
-	};
 	int ret, idx;
 	u8 am_id;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(drm, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
@@ -288,9 +315,12 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static void ili9225_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void ili9225_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					       struct drm_atomic_state *state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct drm_device *drm = crtc->dev;
+	struct ili9225_device *ili9225 = to_ili9225_device(drm);
+	struct mipi_dbi_dev *dbidev = &ili9225->dbidev;
 	struct mipi_dbi *dbi = &dbidev->dbi;
 
 	DRM_DEBUG_KMS("\n");
@@ -309,6 +339,39 @@ static void ili9225_pipe_disable(struct drm_simple_display_pipe *pipe)
 	ili9225_command(dbi, ILI9225_POWER_CONTROL_1, 0x0a02);
 }
 
+static const struct drm_crtc_helper_funcs ili9225_crtc_helper_funcs = {
+	.mode_valid = drm_mipi_dbi_crtc_helper_mode_valid,
+	.atomic_check = drm_mipi_dbi_crtc_helper_atomic_check,
+	.atomic_enable = ili9225_crtc_helper_atomic_enable,
+	.atomic_disable = ili9225_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs ili9225_crtc_funcs = {
+	DRM_MIPI_DBI_CRTC_FUNCS,
+	.destroy = drm_crtc_cleanup,
+};
+
+static const struct drm_encoder_funcs ili9225_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static const struct drm_connector_helper_funcs ili9225_connector_helper_funcs = {
+	DRM_MIPI_DBI_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs ili9225_connector_funcs = {
+	DRM_MIPI_DBI_CONNECTOR_FUNCS,
+	.destroy = drm_connector_cleanup,
+};
+
+static const struct drm_mode_config_helper_funcs ili9225_mode_config_helper_funcs = {
+	DRM_MIPI_DBI_MODE_CONFIG_HELPER_FUNCS,
+};
+
+static const struct drm_mode_config_funcs ili9225_mode_config_funcs = {
+	DRM_MIPI_DBI_MODE_CONFIG_FUNCS,
+};
+
 static int ili9225_dbi_command(struct mipi_dbi *dbi, u8 *cmd, u8 *par,
 			       size_t num)
 {
@@ -337,18 +400,6 @@ static int ili9225_dbi_command(struct mipi_dbi *dbi, u8 *cmd, u8 *par,
 	return ret;
 }
 
-static const struct drm_simple_display_pipe_funcs ili9225_pipe_funcs = {
-	.mode_valid	= mipi_dbi_pipe_mode_valid,
-	.enable		= ili9225_pipe_enable,
-	.disable	= ili9225_pipe_disable,
-	.update		= ili9225_pipe_update,
-	.begin_fb_access = mipi_dbi_pipe_begin_fb_access,
-	.end_fb_access	= mipi_dbi_pipe_end_fb_access,
-	.reset_plane	= mipi_dbi_pipe_reset_plane,
-	.duplicate_plane_state = mipi_dbi_pipe_duplicate_plane_state,
-	.destroy_plane_state = mipi_dbi_pipe_destroy_plane_state,
-};
-
 static const struct drm_display_mode ili9225_mode = {
 	DRM_SIMPLE_MODE(176, 220, 35, 44),
 };
@@ -381,19 +432,22 @@ MODULE_DEVICE_TABLE(spi, ili9225_id);
 static int ili9225_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
+	struct ili9225_device *ili9225;
 	struct mipi_dbi_dev *dbidev;
 	struct drm_device *drm;
 	struct mipi_dbi *dbi;
 	struct gpio_desc *rs;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
 	u32 rotation = 0;
 	int ret;
 
-	dbidev = devm_drm_dev_alloc(dev, &ili9225_driver,
-				    struct mipi_dbi_dev, drm);
-	if (IS_ERR(dbidev))
-		return PTR_ERR(dbidev);
-
-	dbi = &dbidev->dbi;
+	ili9225 = devm_drm_dev_alloc(dev, &ili9225_driver, struct ili9225_device, dbidev.drm);
+	if (IS_ERR(ili9225))
+		return PTR_ERR(ili9225);
+	dbidev = &ili9225->dbidev;
 	drm = &dbidev->drm;
 
 	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
@@ -413,7 +467,53 @@ static int ili9225_probe(struct spi_device *spi)
 	/* override the command function set in  mipi_dbi_spi_init() */
 	dbi->command = ili9225_dbi_command;
 
-	ret = mipi_dbi_dev_init(dbidev, &ili9225_pipe_funcs, &ili9225_mode, rotation);
+	ret = drm_mipi_dbi_dev_init(dbidev, &ili9225_mode, ili9225_plane_formats[0],
+				    rotation, 0);
+	if (ret)
+		return ret;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	drm->mode_config.min_width = dbidev->mode.hdisplay;
+	drm->mode_config.max_width = dbidev->mode.hdisplay;
+	drm->mode_config.min_height = dbidev->mode.vdisplay;
+	drm->mode_config.max_height = dbidev->mode.vdisplay;
+	drm->mode_config.funcs = &ili9225_mode_config_funcs;
+	drm->mode_config.preferred_depth = 16;
+	drm->mode_config.helper_private = &ili9225_mode_config_helper_funcs;
+
+	plane = &ili9225->plane;
+	ret = drm_universal_plane_init(drm, plane, 0, &ili9225_plane_funcs,
+				       ili9225_plane_formats, ARRAY_SIZE(ili9225_plane_formats),
+				       ili9225_plane_format_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(plane, &ili9225_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(plane);
+
+	crtc = &ili9225->crtc;
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL, &ili9225_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &ili9225_crtc_helper_funcs);
+
+	encoder = &ili9225->encoder;
+	ret = drm_encoder_init(drm, encoder, &ili9225_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	connector = &ili9225->connector;
+	ret = drm_connector_init(drm, connector, &ili9225_connector_funcs,
+				 DRM_MODE_CONNECTOR_SPI);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(&dbidev->connector, &ili9225_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
 		return ret;
 
-- 
2.52.0

