Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PXbA7bFnWkRSAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9821D1891E3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6907810E5B8;
	Tue, 24 Feb 2026 15:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="z4jg/FrM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JRhp4Vn0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z4jg/FrM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JRhp4Vn0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9DE10E5B5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:37:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 458075BD23;
 Tue, 24 Feb 2026 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BFwQLeqBVz0IlLiDMbYwKj9f5Js3y406KC24PH8TwEE=;
 b=z4jg/FrMrL/cvT9Apz2zaqQt2eh0gVNIxyXSXrTPQV0w/WUrIJpTnuHcgXukLPpcOOUncz
 JoENF78mr1mGGzXHscGVrs75bJmU1AfnBbf2+/6tHRlt+uYbM7YBH4e6MhwcLFJnwoBO8h
 jrs/vnJ/QGe1tVvS9rvWBb/9UI9EO8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947425;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BFwQLeqBVz0IlLiDMbYwKj9f5Js3y406KC24PH8TwEE=;
 b=JRhp4Vn09qxoUuBMxsdBGViLQ203GkzL7rzv8lhmbu97heZlowV8B8ILzl+nZ/0bChWn1h
 EupxfGd7LXOdODDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="z4jg/FrM";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JRhp4Vn0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BFwQLeqBVz0IlLiDMbYwKj9f5Js3y406KC24PH8TwEE=;
 b=z4jg/FrMrL/cvT9Apz2zaqQt2eh0gVNIxyXSXrTPQV0w/WUrIJpTnuHcgXukLPpcOOUncz
 JoENF78mr1mGGzXHscGVrs75bJmU1AfnBbf2+/6tHRlt+uYbM7YBH4e6MhwcLFJnwoBO8h
 jrs/vnJ/QGe1tVvS9rvWBb/9UI9EO8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947425;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BFwQLeqBVz0IlLiDMbYwKj9f5Js3y406KC24PH8TwEE=;
 b=JRhp4Vn09qxoUuBMxsdBGViLQ203GkzL7rzv8lhmbu97heZlowV8B8ILzl+nZ/0bChWn1h
 EupxfGd7LXOdODDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D91063EA68;
 Tue, 24 Feb 2026 15:37:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ADXOM6DFnWm0FgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 15:37:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com,
 david@lechnology.com, architanant5@gmail.com, wens@kernel.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/16] drm/panel-mipi-dbi: Use regular atomic helpers;
 drop simple-display helpers
Date: Tue, 24 Feb 2026 16:24:47 +0100
Message-ID: <20260224153656.261351-11-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 9821D1891E3
X-Rspamd-Action: no action

Replace simple-display helpers with regular atomic helpers. Store the
pipeline elements in struct panel_mipi_dbi_device and initialize them as
part of probing the device. Use mipi-dbi's existing helpers and initializer
macros where possible.

Effectively open-codes the modesetting code in the initializer helpers
of mipi-dbi and simple-display. Panel-mipi-dbi requires a custom helper
for CRTC enablement, and non-freeing cleanup of the pipeline.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 140 +++++++++++++++++++++++---
 1 file changed, 124 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 4907945ab507..465d72aff6c7 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -233,18 +233,46 @@ static void panel_mipi_dbi_commands_execute(struct mipi_dbi *dbi,
 	}
 }
 
-static void panel_mipi_dbi_enable(struct drm_simple_display_pipe *pipe,
-				  struct drm_crtc_state *crtc_state,
-				  struct drm_plane_state *plane_state)
+struct panel_mipi_dbi_device {
+	struct mipi_dbi_dev dbidev;
+
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+};
+
+static struct panel_mipi_dbi_device *to_panel_mipi_dbi_device(struct drm_device *dev)
+{
+	return container_of(drm_to_mipi_dbi_dev(dev), struct panel_mipi_dbi_device, dbidev);
+}
+
+static const u64 panel_mipi_dbi_plane_format_modifiers[] = {
+	DRM_MIPI_DBI_PLANE_FORMAT_MODIFIERS,
+};
+
+static const struct drm_plane_helper_funcs panel_mipi_dbi_plane_helper_funcs = {
+	DRM_MIPI_DBI_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs panel_mipi_dbi_plane_funcs = {
+	DRM_MIPI_DBI_PLANE_FUNCS,
+	.destroy = drm_plane_cleanup,
+};
+
+static void panel_mipi_dbi_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+						     struct drm_atomic_state *state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct drm_device *drm = crtc->dev;
+	struct panel_mipi_dbi_device *panel_mipi_dbi = to_panel_mipi_dbi_device(drm);
+	struct mipi_dbi_dev *dbidev = &panel_mipi_dbi->dbidev;
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	drm_dbg(pipe->crtc.dev, "\n");
+	drm_dbg(drm, "\n");
 
 	ret = mipi_dbi_poweron_conditional_reset(dbidev);
 	if (ret < 0)
@@ -257,8 +285,35 @@ static void panel_mipi_dbi_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static const struct drm_simple_display_pipe_funcs panel_mipi_dbi_pipe_funcs = {
-	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(panel_mipi_dbi_enable),
+static const struct drm_crtc_helper_funcs panel_mipi_dbi_crtc_helper_funcs = {
+	DRM_MIPI_DBI_CRTC_HELPER_FUNCS,
+	.atomic_enable = panel_mipi_dbi_crtc_helper_atomic_enable,
+};
+
+static const struct drm_crtc_funcs panel_mipi_dbi_crtc_funcs = {
+	DRM_MIPI_DBI_CRTC_FUNCS,
+	.destroy = drm_crtc_cleanup,
+};
+
+static const struct drm_encoder_funcs panel_mipi_dbi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static const struct drm_connector_helper_funcs panel_mipi_dbi_connector_helper_funcs = {
+	DRM_MIPI_DBI_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs panel_mipi_dbi_connector_funcs = {
+	DRM_MIPI_DBI_CONNECTOR_FUNCS,
+	.destroy = drm_connector_cleanup,
+};
+
+static const struct drm_mode_config_helper_funcs panel_mipi_dbi_mode_config_helper_funcs = {
+	DRM_MIPI_DBI_MODE_CONFIG_HELPER_FUNCS,
+};
+
+static const struct drm_mode_config_funcs panel_mipi_dbi_mode_config_funcs = {
+	DRM_MIPI_DBI_MODE_CONFIG_FUNCS,
 };
 
 DEFINE_DRM_GEM_DMA_FOPS(panel_mipi_dbi_fops);
@@ -317,22 +372,30 @@ static int panel_mipi_dbi_get_mode(struct mipi_dbi_dev *dbidev, struct drm_displ
 static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
-	struct drm_display_mode mode;
+	struct panel_mipi_dbi_device *panel_mipi_dbi;
 	struct mipi_dbi_dev *dbidev;
 	struct drm_device *drm;
+	struct drm_display_mode mode;
 	struct mipi_dbi *dbi;
 	struct gpio_desc *dc;
 	unsigned int bpp;
 	size_t buf_size;
 	u32 formats[2];
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
 	int ret;
 
-	dbidev = devm_drm_dev_alloc(dev, &panel_mipi_dbi_driver, struct mipi_dbi_dev, drm);
-	if (IS_ERR(dbidev))
-		return PTR_ERR(dbidev);
+	panel_mipi_dbi = devm_drm_dev_alloc(dev, &panel_mipi_dbi_driver,
+					    struct panel_mipi_dbi_device,
+					    dbidev.drm);
+	if (IS_ERR(panel_mipi_dbi))
+		return PTR_ERR(panel_mipi_dbi);
+	dbidev = &panel_mipi_dbi->dbidev;
+	drm = &dbidev->drm;
 
 	dbi = &dbidev->dbi;
-	drm = &dbidev->drm;
 
 	ret = panel_mipi_dbi_get_mode(dbidev, &mode);
 	if (ret)
@@ -377,9 +440,54 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 		return ret;
 
 	buf_size = DIV_ROUND_UP(mode.hdisplay * mode.vdisplay * bpp, 8);
-	ret = mipi_dbi_dev_init_with_formats(dbidev, &panel_mipi_dbi_pipe_funcs,
-					     formats, ARRAY_SIZE(formats),
-					     &mode, 0, buf_size);
+	ret = drm_mipi_dbi_dev_init(dbidev, &mode, formats[0], 0, buf_size);
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
+	drm->mode_config.funcs = &panel_mipi_dbi_mode_config_funcs;
+	drm->mode_config.preferred_depth = bpp;
+	drm->mode_config.helper_private = &panel_mipi_dbi_mode_config_helper_funcs;
+
+	plane = &panel_mipi_dbi->plane;
+	ret = drm_universal_plane_init(drm, plane, 0, &panel_mipi_dbi_plane_funcs,
+				       formats, ARRAY_SIZE(formats),
+				       panel_mipi_dbi_plane_format_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(plane, &panel_mipi_dbi_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(plane);
+
+	crtc = &panel_mipi_dbi->crtc;
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL, &panel_mipi_dbi_crtc_funcs,
+					NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &panel_mipi_dbi_crtc_helper_funcs);
+
+	encoder = &panel_mipi_dbi->encoder;
+	ret = drm_encoder_init(drm, encoder, &panel_mipi_dbi_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	connector = &panel_mipi_dbi->connector;
+	ret = drm_connector_init(drm, connector, &panel_mipi_dbi_connector_funcs,
+				 DRM_MODE_CONNECTOR_SPI);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(&dbidev->connector, &panel_mipi_dbi_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
 		return ret;
 
-- 
2.52.0

