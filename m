Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QESpCcfFnWkRSAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AC718922D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E50110E5C1;
	Tue, 24 Feb 2026 15:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZUd/ecPc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZpgElErx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZUd/ecPc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZpgElErx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F87710E5BA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:37:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2831C3F2C4;
 Tue, 24 Feb 2026 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1Rbk53gLEXBWv4Qvb0rMKCXhmar7b2Cg7rPssW6FYY=;
 b=ZUd/ecPcX9NDCwTQ1LDkwJU9U8ynxADXLKxg5e/rv02jGn3nwxMAXR0b0D7kU2ptdVhkSf
 AQv49SgTiyMpr6WDhUQ4MVV5FkAKYW5CVmDFLr/uO5W8A4suO5mHaXaqzhfa+WNng3pPx8
 EJajMJxP9oazF2cGB/eCEEyg5VuiZh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1Rbk53gLEXBWv4Qvb0rMKCXhmar7b2Cg7rPssW6FYY=;
 b=ZpgElErx3i/s1zmHwIU6xKGTx68CKcbcMA85I4rDe9LJaeOSxtKlJs1zRH1X5JPcbDUg6G
 vZhY6FpUCnYPg6DQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ZUd/ecPc";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZpgElErx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1Rbk53gLEXBWv4Qvb0rMKCXhmar7b2Cg7rPssW6FYY=;
 b=ZUd/ecPcX9NDCwTQ1LDkwJU9U8ynxADXLKxg5e/rv02jGn3nwxMAXR0b0D7kU2ptdVhkSf
 AQv49SgTiyMpr6WDhUQ4MVV5FkAKYW5CVmDFLr/uO5W8A4suO5mHaXaqzhfa+WNng3pPx8
 EJajMJxP9oazF2cGB/eCEEyg5VuiZh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1Rbk53gLEXBWv4Qvb0rMKCXhmar7b2Cg7rPssW6FYY=;
 b=ZpgElErx3i/s1zmHwIU6xKGTx68CKcbcMA85I4rDe9LJaeOSxtKlJs1zRH1X5JPcbDUg6G
 vZhY6FpUCnYPg6DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BEC463EA69;
 Tue, 24 Feb 2026 15:37:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8LEwLZ/FnWm0FgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 15:37:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com,
 david@lechnology.com, architanant5@gmail.com, wens@kernel.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/16] drm/ili9341: Use regular atomic helpers;
 drop simple-display helpers
Date: Tue, 24 Feb 2026 16:24:44 +0100
Message-ID: <20260224153656.261351-8-tzimmermann@suse.de>
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 95AC718922D
X-Rspamd-Action: no action

Replace simple-display helpers with regular atomic helpers. Store the
pipeline elements in struct ili9341_device and initialize them as part
of probing the device. Use mipi-dbi's existing helpers and initializer
macros where possible.

Effectively open-codes the modesetting code in the initializer helpers
of mipi-dbi and simple-display. Ili9341 requires a custom helper for
CRTC enablement, and non-freeing cleanup of the pipeline.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/ili9341.c | 136 +++++++++++++++++++++++++++++----
 1 file changed, 122 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index 972811564d6a..97a62c13416a 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -52,16 +52,48 @@
 #define ILI9341_MADCTL_MX	BIT(6)
 #define ILI9341_MADCTL_MY	BIT(7)
 
-static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
-			     struct drm_crtc_state *crtc_state,
-			     struct drm_plane_state *plane_state)
+struct ili9341_device {
+	struct mipi_dbi_dev dbidev;
+
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+};
+
+static struct ili9341_device *to_ili9341_device(struct drm_device *dev)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	return container_of(drm_to_mipi_dbi_dev(dev), struct ili9341_device, dbidev);
+}
+
+static const u32 ili9341_plane_formats[] = {
+	DRM_MIPI_DBI_PLANE_FORMATS,
+};
+
+static const u64 ili9341_plane_format_modifiers[] = {
+	DRM_MIPI_DBI_PLANE_FORMAT_MODIFIERS,
+};
+
+static const struct drm_plane_helper_funcs ili9341_plane_helper_funcs = {
+	DRM_MIPI_DBI_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs ili9341_plane_funcs = {
+	DRM_MIPI_DBI_PLANE_FUNCS,
+	.destroy = drm_plane_cleanup,
+};
+
+static void ili9341_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					      struct drm_atomic_state *state)
+{
+	struct drm_device *drm = crtc->dev;
+	struct ili9341_device *ili9341 = to_ili9341_device(drm);
+	struct mipi_dbi_dev *dbidev = &ili9341->dbidev;
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	u8 addr_mode;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(drm, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
@@ -139,8 +171,35 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static const struct drm_simple_display_pipe_funcs ili9341_pipe_funcs = {
-	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(yx240qv29_enable),
+static const struct drm_crtc_helper_funcs ili9341_crtc_helper_funcs = {
+	DRM_MIPI_DBI_CRTC_HELPER_FUNCS,
+	.atomic_enable = ili9341_crtc_helper_atomic_enable,
+};
+
+static const struct drm_crtc_funcs ili9341_crtc_funcs = {
+	DRM_MIPI_DBI_CRTC_FUNCS,
+	.destroy = drm_crtc_cleanup,
+};
+
+static const struct drm_encoder_funcs ili9341_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static const struct drm_connector_helper_funcs ili9341_connector_helper_funcs = {
+	DRM_MIPI_DBI_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs ili9341_connector_funcs = {
+	DRM_MIPI_DBI_CONNECTOR_FUNCS,
+	.destroy = drm_connector_cleanup,
+};
+
+static const struct drm_mode_config_helper_funcs ili9341_mode_config_helper_funcs = {
+	DRM_MIPI_DBI_MODE_CONFIG_HELPER_FUNCS,
+};
+
+static const struct drm_mode_config_funcs ili9341_mode_config_funcs = {
+	DRM_MIPI_DBI_MODE_CONFIG_FUNCS,
 };
 
 static const struct drm_display_mode yx240qv29_mode = {
@@ -176,19 +235,22 @@ MODULE_DEVICE_TABLE(spi, ili9341_id);
 static int ili9341_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
+	struct ili9341_device *ili9341;
 	struct mipi_dbi_dev *dbidev;
 	struct drm_device *drm;
 	struct mipi_dbi *dbi;
 	struct gpio_desc *dc;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
 	u32 rotation = 0;
 	int ret;
 
-	dbidev = devm_drm_dev_alloc(dev, &ili9341_driver,
-				    struct mipi_dbi_dev, drm);
-	if (IS_ERR(dbidev))
-		return PTR_ERR(dbidev);
-
-	dbi = &dbidev->dbi;
+	ili9341 = devm_drm_dev_alloc(dev, &ili9341_driver, struct ili9341_device, dbidev.drm);
+	if (IS_ERR(ili9341))
+		return PTR_ERR(ili9341);
+	dbidev = &ili9341->dbidev;
 	drm = &dbidev->drm;
 
 	dbi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
@@ -209,7 +271,53 @@ static int ili9341_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
-	ret = mipi_dbi_dev_init(dbidev, &ili9341_pipe_funcs, &yx240qv29_mode, rotation);
+	ret = drm_mipi_dbi_dev_init(dbidev, &yx240qv29_mode, ili9341_plane_formats[0],
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
+	drm->mode_config.funcs = &ili9341_mode_config_funcs;
+	drm->mode_config.preferred_depth = 16;
+	drm->mode_config.helper_private = &ili9341_mode_config_helper_funcs;
+
+	plane = &ili9341->plane;
+	ret = drm_universal_plane_init(drm, plane, 0, &ili9341_plane_funcs,
+				       ili9341_plane_formats, ARRAY_SIZE(ili9341_plane_formats),
+				       ili9341_plane_format_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(plane, &ili9341_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(plane);
+
+	crtc = &ili9341->crtc;
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL, &ili9341_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &ili9341_crtc_helper_funcs);
+
+	encoder = &ili9341->encoder;
+	ret = drm_encoder_init(drm, encoder, &ili9341_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	connector = &ili9341->connector;
+	ret = drm_connector_init(drm, connector, &ili9341_connector_funcs,
+				 DRM_MODE_CONNECTOR_SPI);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(&dbidev->connector, &ili9341_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
 		return ret;
 
-- 
2.52.0

