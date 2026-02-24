Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFPHDtDFnWkRSAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB78189252
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B295110E5C3;
	Tue, 24 Feb 2026 15:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ey5rYpo8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="clcu+Lq3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ey5rYpo8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="clcu+Lq3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE62D10E5AE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:37:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 205A15BCF7;
 Tue, 24 Feb 2026 15:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x83+oBZNRTLF6adXkHMlxeyjSsPx8Giqr+d8dMENo48=;
 b=ey5rYpo8vlakZvxNVC6HxM6RHbx8U7isRJdWzWovX+rfiwLyJn6zq5rGTD59wLURRGaatH
 te8z0/4O5IHfVYRTy6xNll9XkNM+ifbguxFBENZDI+LGWaK7oHXFL/VdT2iG0/FND/L311
 7UVSGoo84LROybAzlWVHay/OvLdCQyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x83+oBZNRTLF6adXkHMlxeyjSsPx8Giqr+d8dMENo48=;
 b=clcu+Lq385+p8FjCmb4iUqkk9OdK9FjX7BvCVfsQFOxvGMP8KNojxdNYpzV4QRozY0YcfV
 FwOf1Sl/YHy+LmBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x83+oBZNRTLF6adXkHMlxeyjSsPx8Giqr+d8dMENo48=;
 b=ey5rYpo8vlakZvxNVC6HxM6RHbx8U7isRJdWzWovX+rfiwLyJn6zq5rGTD59wLURRGaatH
 te8z0/4O5IHfVYRTy6xNll9XkNM+ifbguxFBENZDI+LGWaK7oHXFL/VdT2iG0/FND/L311
 7UVSGoo84LROybAzlWVHay/OvLdCQyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x83+oBZNRTLF6adXkHMlxeyjSsPx8Giqr+d8dMENo48=;
 b=clcu+Lq385+p8FjCmb4iUqkk9OdK9FjX7BvCVfsQFOxvGMP8KNojxdNYpzV4QRozY0YcfV
 FwOf1Sl/YHy+LmBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B00D03EA69;
 Tue, 24 Feb 2026 15:37:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2JSMKaLFnWm0FgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 15:37:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com,
 david@lechnology.com, architanant5@gmail.com, wens@kernel.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 15/16] drm/mipi-dbi: Remove simple-display helpers from
 mipi-dbi
Date: Tue, 24 Feb 2026 16:24:52 +0100
Message-ID: <20260224153656.261351-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224153656.261351-1-tzimmermann@suse.de>
References: <20260224153656.261351-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spam-Level: 
X-Spam-Flag: NO
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
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CCB78189252
X-Rspamd-Action: no action

With the conversion to regular atomic helpers, mipi-dbi's support
for simple-display helpers is unused. Removed it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 247 ---------------------------------
 include/drm/drm_mipi_dbi.h     |  49 -------
 2 files changed, 296 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 6846cb73ea87..09c3208a81ea 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -15,7 +15,6 @@
 #include <linux/spi/spi.h>
 
 #include <drm/drm_atomic.h>
-#include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -332,22 +331,6 @@ enum drm_mode_status drm_mipi_dbi_crtc_helper_mode_valid(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_mipi_dbi_crtc_helper_mode_valid);
 
-/**
- * mipi_dbi_pipe_mode_valid - MIPI DBI mode-valid helper
- * @pipe: Simple display pipe
- * @mode: The mode to test
- *
- * This function validates a given display mode against the MIPI DBI's hardware
- * display. Drivers can use this as their &drm_simple_display_pipe_funcs->mode_valid
- * callback.
- */
-enum drm_mode_status mipi_dbi_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
-					      const struct drm_display_mode *mode)
-{
-	return drm_mipi_dbi_crtc_helper_mode_valid(&pipe->crtc, mode);
-}
-EXPORT_SYMBOL(mipi_dbi_pipe_mode_valid);
-
 int drm_mipi_dbi_plane_helper_atomic_check(struct drm_plane *plane,
 					   struct drm_atomic_state *state)
 {
@@ -401,21 +384,6 @@ void drm_mipi_dbi_plane_helper_atomic_update(struct drm_plane *plane,
 }
 EXPORT_SYMBOL(drm_mipi_dbi_plane_helper_atomic_update);
 
-/**
- * mipi_dbi_pipe_update - Display pipe update helper
- * @pipe: Simple display pipe
- * @old_state: Old plane state
- *
- * This function handles framebuffer flushing and vblank events. Drivers can use
- * this as their &drm_simple_display_pipe_funcs->update callback.
- */
-void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
-			  struct drm_plane_state *old_state)
-{
-	return drm_mipi_dbi_plane_helper_atomic_update(&pipe->plane, old_state->state);
-}
-EXPORT_SYMBOL(mipi_dbi_pipe_update);
-
 static void mipi_dbi_blank(struct mipi_dbi_dev *dbidev)
 {
 	struct drm_device *drm = &dbidev->drm;
@@ -484,104 +452,6 @@ void drm_mipi_dbi_crtc_helper_atomic_disable(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_mipi_dbi_crtc_helper_atomic_disable);
 
-/**
- * mipi_dbi_pipe_disable - MIPI DBI pipe disable helper
- * @pipe: Display pipe
- *
- * This function disables backlight if present, if not the display memory is
- * blanked. The regulator is disabled if in use. Drivers can use this as their
- * &drm_simple_display_pipe_funcs->disable callback.
- */
-void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe)
-{
-	drm_mipi_dbi_crtc_helper_atomic_disable(&pipe->crtc, pipe->crtc.state->state);
-}
-EXPORT_SYMBOL(mipi_dbi_pipe_disable);
-
-/**
- * mipi_dbi_pipe_begin_fb_access - MIPI DBI pipe begin-access helper
- * @pipe: Display pipe
- * @plane_state: Plane state
- *
- * This function implements struct &drm_simple_display_funcs.begin_fb_access.
- *
- * See drm_gem_begin_shadow_fb_access() for details and mipi_dbi_pipe_cleanup_fb()
- * for cleanup.
- *
- * Returns:
- * 0 on success, or a negative errno code otherwise.
- */
-int mipi_dbi_pipe_begin_fb_access(struct drm_simple_display_pipe *pipe,
-				  struct drm_plane_state *plane_state)
-{
-	return drm_gem_begin_shadow_fb_access(&pipe->plane, plane_state);
-}
-EXPORT_SYMBOL(mipi_dbi_pipe_begin_fb_access);
-
-/**
- * mipi_dbi_pipe_end_fb_access - MIPI DBI pipe end-access helper
- * @pipe: Display pipe
- * @plane_state: Plane state
- *
- * This function implements struct &drm_simple_display_funcs.end_fb_access.
- *
- * See mipi_dbi_pipe_begin_fb_access().
- */
-void mipi_dbi_pipe_end_fb_access(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *plane_state)
-{
-	drm_gem_end_shadow_fb_access(&pipe->plane, plane_state);
-}
-EXPORT_SYMBOL(mipi_dbi_pipe_end_fb_access);
-
-/**
- * mipi_dbi_pipe_reset_plane - MIPI DBI plane-reset helper
- * @pipe: Display pipe
- *
- * This function implements struct &drm_simple_display_funcs.reset_plane
- * for MIPI DBI planes.
- */
-void mipi_dbi_pipe_reset_plane(struct drm_simple_display_pipe *pipe)
-{
-	drm_gem_reset_shadow_plane(&pipe->plane);
-}
-EXPORT_SYMBOL(mipi_dbi_pipe_reset_plane);
-
-/**
- * mipi_dbi_pipe_duplicate_plane_state - duplicates MIPI DBI plane state
- * @pipe: Display pipe
- *
- * This function implements struct &drm_simple_display_funcs.duplicate_plane_state
- * for MIPI DBI planes.
- *
- * See drm_gem_duplicate_shadow_plane_state() for additional details.
- *
- * Returns:
- * A pointer to a new plane state on success, or NULL otherwise.
- */
-struct drm_plane_state *mipi_dbi_pipe_duplicate_plane_state(struct drm_simple_display_pipe *pipe)
-{
-	return drm_gem_duplicate_shadow_plane_state(&pipe->plane);
-}
-EXPORT_SYMBOL(mipi_dbi_pipe_duplicate_plane_state);
-
-/**
- * mipi_dbi_pipe_destroy_plane_state - cleans up MIPI DBI plane state
- * @pipe: Display pipe
- * @plane_state: Plane state
- *
- * This function implements struct drm_simple_display_funcs.destroy_plane_state
- * for MIPI DBI planes.
- *
- * See drm_gem_destroy_shadow_plane_state() for additional details.
- */
-void mipi_dbi_pipe_destroy_plane_state(struct drm_simple_display_pipe *pipe,
-				       struct drm_plane_state *plane_state)
-{
-	drm_gem_destroy_shadow_plane_state(&pipe->plane, plane_state);
-}
-EXPORT_SYMBOL(mipi_dbi_pipe_destroy_plane_state);
-
 int drm_mipi_dbi_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(connector->dev);
@@ -590,15 +460,6 @@ int drm_mipi_dbi_connector_helper_get_modes(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_mipi_dbi_connector_helper_get_modes);
 
-static const struct drm_connector_helper_funcs mipi_dbi_connector_hfuncs = {
-	DRM_MIPI_DBI_CONNECTOR_HELPER_FUNCS,
-};
-
-static const struct drm_connector_funcs mipi_dbi_connector_funcs = {
-	DRM_MIPI_DBI_CONNECTOR_FUNCS,
-	.destroy = drm_connector_cleanup,
-};
-
 static int mipi_dbi_rotate_mode(struct drm_display_mode *mode,
 				unsigned int rotation)
 {
@@ -616,18 +477,6 @@ static int mipi_dbi_rotate_mode(struct drm_display_mode *mode,
 	}
 }
 
-static const struct drm_mode_config_helper_funcs mipi_dbi_mode_config_helper_funcs = {
-	DRM_MIPI_DBI_MODE_CONFIG_HELPER_FUNCS,
-};
-
-static const struct drm_mode_config_funcs mipi_dbi_mode_config_funcs = {
-	DRM_MIPI_DBI_MODE_CONFIG_FUNCS,
-};
-
-static const uint32_t mipi_dbi_formats[] = {
-	DRM_MIPI_DBI_PLANE_FORMATS,
-};
-
 /**
  * drm_mipi_dbi_dev_init - MIPI DBI device initialization
  * @dbidev: MIPI DBI device structure to initialize
@@ -677,102 +526,6 @@ int drm_mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev, const struct drm_display_
 }
 EXPORT_SYMBOL(drm_mipi_dbi_dev_init);
 
-/**
- * mipi_dbi_dev_init_with_formats - MIPI DBI device initialization with custom formats
- * @dbidev: MIPI DBI device structure to initialize
- * @funcs: Display pipe functions
- * @formats: Array of supported formats (DRM_FORMAT\_\*).
- * @format_count: Number of elements in @formats
- * @mode: Display mode
- * @rotation: Initial rotation in degrees Counter Clock Wise
- * @tx_buf_size: Allocate a transmit buffer of this size.
- *
- * This function sets up a &drm_simple_display_pipe with a &drm_connector that
- * has one fixed &drm_display_mode which is rotated according to @rotation.
- * This mode is used to set the mode config min/max width/height properties.
- *
- * Use mipi_dbi_dev_init() if you want native RGB565 and emulated XRGB8888 format.
- *
- * Note:
- * Some of the helper functions expects RGB565 to be the default format and the
- * transmit buffer sized to fit that.
- *
- * Returns:
- * Zero on success, negative error code on failure.
- */
-int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev *dbidev,
-				   const struct drm_simple_display_pipe_funcs *funcs,
-				   const uint32_t *formats, unsigned int format_count,
-				   const struct drm_display_mode *mode,
-				   unsigned int rotation, size_t tx_buf_size)
-{
-	static const uint64_t modifiers[] = {
-		DRM_MIPI_DBI_PLANE_FORMAT_MODIFIERS,
-	};
-	struct drm_device *drm = &dbidev->drm;
-	int ret;
-
-	ret = drm_mipi_dbi_dev_init(dbidev, mode, formats[0], rotation, tx_buf_size);
-	if (ret)
-		return ret;
-
-	ret = drmm_mode_config_init(drm);
-	if (ret)
-		return ret;
-
-	drm_connector_helper_add(&dbidev->connector, &mipi_dbi_connector_hfuncs);
-	ret = drm_connector_init(drm, &dbidev->connector, &mipi_dbi_connector_funcs,
-				 DRM_MODE_CONNECTOR_SPI);
-	if (ret)
-		return ret;
-
-	ret = drm_simple_display_pipe_init(drm, &dbidev->pipe, funcs, formats, format_count,
-					   modifiers, &dbidev->connector);
-	if (ret)
-		return ret;
-
-	drm_plane_enable_fb_damage_clips(&dbidev->pipe.plane);
-
-	drm->mode_config.funcs = &mipi_dbi_mode_config_funcs;
-	drm->mode_config.min_width = dbidev->mode.hdisplay;
-	drm->mode_config.max_width = dbidev->mode.hdisplay;
-	drm->mode_config.min_height = dbidev->mode.vdisplay;
-	drm->mode_config.max_height = dbidev->mode.vdisplay;
-	drm->mode_config.helper_private = &mipi_dbi_mode_config_helper_funcs;
-
-	return 0;
-}
-EXPORT_SYMBOL(mipi_dbi_dev_init_with_formats);
-
-/**
- * mipi_dbi_dev_init - MIPI DBI device initialization
- * @dbidev: MIPI DBI device structure to initialize
- * @funcs: Display pipe functions
- * @mode: Display mode
- * @rotation: Initial rotation in degrees Counter Clock Wise
- *
- * This function sets up a &drm_simple_display_pipe with a &drm_connector that
- * has one fixed &drm_display_mode which is rotated according to @rotation.
- * This mode is used to set the mode config min/max width/height properties.
- * Additionally &mipi_dbi.tx_buf is allocated.
- *
- * Supported formats: Native RGB565 and emulated XRGB8888.
- *
- * Returns:
- * Zero on success, negative error code on failure.
- */
-int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
-		      const struct drm_simple_display_pipe_funcs *funcs,
-		      const struct drm_display_mode *mode, unsigned int rotation)
-{
-	dbidev->drm.mode_config.preferred_depth = 16;
-
-	return mipi_dbi_dev_init_with_formats(dbidev, funcs, mipi_dbi_formats,
-					      ARRAY_SIZE(mipi_dbi_formats), mode,
-					      rotation, 0);
-}
-EXPORT_SYMBOL(mipi_dbi_dev_init);
-
 /**
  * mipi_dbi_hw_reset - Hardware reset of controller
  * @dbi: MIPI DBI structure
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index ae92a5e8d13b..52f60c177ff6 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -15,7 +15,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 struct drm_format_conv_state;
 struct drm_rect;
@@ -91,11 +90,6 @@ struct mipi_dbi_dev {
 	 */
 	struct drm_device drm;
 
-	/**
-	 * @pipe: Display pipe structure
-	 */
-	struct drm_simple_display_pipe pipe;
-
 	/**
 	 * @connector: Connector
 	 */
@@ -173,28 +167,6 @@ int mipi_dbi_spi_init(struct spi_device *spi, struct mipi_dbi *dbi,
 int drm_mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev, const struct drm_display_mode *mode,
 			  u32 format, unsigned int rotation, size_t tx_buf_size);
 
-int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev *dbidev,
-				   const struct drm_simple_display_pipe_funcs *funcs,
-				   const uint32_t *formats, unsigned int format_count,
-				   const struct drm_display_mode *mode,
-				   unsigned int rotation, size_t tx_buf_size);
-int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
-		      const struct drm_simple_display_pipe_funcs *funcs,
-		      const struct drm_display_mode *mode, unsigned int rotation);
-enum drm_mode_status mipi_dbi_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
-					      const struct drm_display_mode *mode);
-void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
-			  struct drm_plane_state *old_state);
-void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe);
-int mipi_dbi_pipe_begin_fb_access(struct drm_simple_display_pipe *pipe,
-				  struct drm_plane_state *plane_state);
-void mipi_dbi_pipe_end_fb_access(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *plane_state);
-void mipi_dbi_pipe_reset_plane(struct drm_simple_display_pipe *pipe);
-struct drm_plane_state *mipi_dbi_pipe_duplicate_plane_state(struct drm_simple_display_pipe *pipe);
-void mipi_dbi_pipe_destroy_plane_state(struct drm_simple_display_pipe *pipe,
-				       struct drm_plane_state *plane_state);
-
 void mipi_dbi_hw_reset(struct mipi_dbi *dbi);
 bool mipi_dbi_display_is_on(struct mipi_dbi *dbi);
 int mipi_dbi_poweron_reset(struct mipi_dbi_dev *dbidev);
@@ -322,25 +294,4 @@ void mipi_dbi_debugfs_init(struct drm_minor *minor);
 static inline void mipi_dbi_debugfs_init(struct drm_minor *minor) {}
 #endif
 
-/**
- * DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS - Initializes struct drm_simple_display_pipe_funcs
- *                                          for MIPI-DBI devices
- * @enable_: Enable-callback implementation
- *
- * This macro initializes struct drm_simple_display_pipe_funcs with default
- * values for MIPI-DBI-based devices. The only callback that depends on the
- * hardware is @enable, for which the driver has to provide an implementation.
- * MIPI-based drivers are encouraged to use this macro for initialization.
- */
-#define DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(enable_) \
-	.mode_valid = mipi_dbi_pipe_mode_valid, \
-	.enable = (enable_), \
-	.disable = mipi_dbi_pipe_disable, \
-	.update = mipi_dbi_pipe_update, \
-	.begin_fb_access = mipi_dbi_pipe_begin_fb_access, \
-	.end_fb_access = mipi_dbi_pipe_end_fb_access, \
-	.reset_plane = mipi_dbi_pipe_reset_plane, \
-	.duplicate_plane_state = mipi_dbi_pipe_duplicate_plane_state, \
-	.destroy_plane_state = mipi_dbi_pipe_destroy_plane_state
-
 #endif /* __LINUX_MIPI_DBI_H */
-- 
2.52.0

