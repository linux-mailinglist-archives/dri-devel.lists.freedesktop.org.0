Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHa6OKnFnWnsRwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 502131891BD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560C710E5B4;
	Tue, 24 Feb 2026 15:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xDN5MS4K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fhcm+0fx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xDN5MS4K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fhcm+0fx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EE910E5AF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:37:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D62493F2BE;
 Tue, 24 Feb 2026 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5pEGGOZ6b+E4iGwCGM2qklzpQ8BwHMg9tkCjCYXlbs=;
 b=xDN5MS4KOCyXZTAZFdPfoVbnQrZwBfBzLlS+kMJWr1nBfa+CHmyfc0ZxvPR24NXPYYmKcS
 i+JDvS9EvswfIcGWOz4qE1kXaudGh3k3pGpEWrC9pv5legtYOoIORB4H9IWZHS1lYKKgmz
 RaCilDEEX7WBnSh5Hmc9WMFG5URzmqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947421;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5pEGGOZ6b+E4iGwCGM2qklzpQ8BwHMg9tkCjCYXlbs=;
 b=fhcm+0fxSe8NtyWtczV1Fp2KMhjmc1HnnU45frix7gRUhRDMtPoKpEGJqiR5VAWngz3GfE
 BETMYf8YXyiU4wBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xDN5MS4K;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fhcm+0fx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5pEGGOZ6b+E4iGwCGM2qklzpQ8BwHMg9tkCjCYXlbs=;
 b=xDN5MS4KOCyXZTAZFdPfoVbnQrZwBfBzLlS+kMJWr1nBfa+CHmyfc0ZxvPR24NXPYYmKcS
 i+JDvS9EvswfIcGWOz4qE1kXaudGh3k3pGpEWrC9pv5legtYOoIORB4H9IWZHS1lYKKgmz
 RaCilDEEX7WBnSh5Hmc9WMFG5URzmqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947421;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5pEGGOZ6b+E4iGwCGM2qklzpQ8BwHMg9tkCjCYXlbs=;
 b=fhcm+0fxSe8NtyWtczV1Fp2KMhjmc1HnnU45frix7gRUhRDMtPoKpEGJqiR5VAWngz3GfE
 BETMYf8YXyiU4wBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 737483EA69;
 Tue, 24 Feb 2026 15:37:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2OnDGp3FnWm0FgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 15:37:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com,
 david@lechnology.com, architanant5@gmail.com, wens@kernel.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/16] drm/mipi-dbi: Only modify planes on enabled CRTCs
Date: Tue, 24 Feb 2026 16:24:38 +0100
Message-ID: <20260224153656.261351-2-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 502131891BD
X-Rspamd-Action: no action

Use drm_atomic_helper_commit_tail_rpm() as commit tail to update the
plane after enabling the CRTC. Then remove the plane-update code from
mipi_dbi_enable_flush() and inline the remaining backlight code where
necessary.

Mipi-dbi's current commit tail drm_atomic_helper_commit_tail() first
updates the plane and then enables the CRTC. But the CRTC enablement
includes power management that prevents the initial plane update from
working. Hence, each mipi-dbi driver includes a plane update in their
CRTC enablement; in the form of mipi_dbi_enable_flush() or custom code.

Using drm_atomic_helper_commit_tail_rpm() enables the CRTC before any
plane updates. Hence the additional plane update can be removed from
mipi_dbi_enable_flush() and a number of drivers.

This leaves backlight_enable() in the helper, which can now be inlined
into affected drivers. Drivers now enable the CRTC plus an optional
backlight and then automatically update the plane.

In the case of disabling the display, drm_atomic_helper_commit_tail_rpm()
only disables the CRTC without touching the plane at all. Mipi-dbi's
mipi_dbi_pipe_disable() already contains the necessary logic.

Removing the plane update from the CRTC enablement will also help with
converting mipi-dbi from simple-pipe helpers to regular atomic helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_mipi_dbi.c        | 44 ++++-----------------------
 drivers/gpu/drm/sitronix/st7586.c     |  3 --
 drivers/gpu/drm/sitronix/st7735r.c    |  2 +-
 drivers/gpu/drm/tiny/hx8357d.c        |  3 +-
 drivers/gpu/drm/tiny/ili9163.c        |  3 +-
 drivers/gpu/drm/tiny/ili9225.c        |  3 --
 drivers/gpu/drm/tiny/ili9341.c        |  3 +-
 drivers/gpu/drm/tiny/ili9486.c        |  3 +-
 drivers/gpu/drm/tiny/mi0283qt.c       |  3 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c |  2 +-
 include/drm/drm_mipi_dbi.h            |  3 --
 11 files changed, 18 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 00482227a9cd..bb6cebc583be 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -368,44 +368,6 @@ void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
 }
 EXPORT_SYMBOL(mipi_dbi_pipe_update);
 
-/**
- * mipi_dbi_enable_flush - MIPI DBI enable helper
- * @dbidev: MIPI DBI device structure
- * @crtc_state: CRTC state
- * @plane_state: Plane state
- *
- * Flushes the whole framebuffer and enables the backlight. Drivers can use this
- * in their &drm_simple_display_pipe_funcs->enable callback.
- *
- * Note: Drivers which don't use mipi_dbi_pipe_update() because they have custom
- * framebuffer flushing, can't use this function since they both use the same
- * flushing code.
- */
-void mipi_dbi_enable_flush(struct mipi_dbi_dev *dbidev,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
-{
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
-	struct drm_framebuffer *fb = plane_state->fb;
-	struct drm_rect rect = {
-		.x1 = 0,
-		.x2 = fb->width,
-		.y1 = 0,
-		.y2 = fb->height,
-	};
-	int idx;
-
-	if (!drm_dev_enter(&dbidev->drm, &idx))
-		return;
-
-	mipi_dbi_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
-			  &shadow_plane_state->fmtcnv_state);
-	backlight_enable(dbidev->backlight);
-
-	drm_dev_exit(idx);
-}
-EXPORT_SYMBOL(mipi_dbi_enable_flush);
-
 static void mipi_dbi_blank(struct mipi_dbi_dev *dbidev)
 {
 	struct drm_device *drm = &dbidev->drm;
@@ -577,6 +539,10 @@ static int mipi_dbi_rotate_mode(struct drm_display_mode *mode,
 	}
 }
 
+static const struct drm_mode_config_helper_funcs mipi_dbi_mode_config_helper_funcs = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
 static const struct drm_mode_config_funcs mipi_dbi_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create_with_dirty,
 	.atomic_check = drm_atomic_helper_check,
@@ -660,6 +626,8 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev *dbidev,
 	drm->mode_config.max_width = dbidev->mode.hdisplay;
 	drm->mode_config.min_height = dbidev->mode.vdisplay;
 	drm->mode_config.max_height = dbidev->mode.vdisplay;
+	drm->mode_config.helper_private = &mipi_dbi_mode_config_helper_funcs;
+
 	dbidev->rotation = rotation;
 	dbidev->pixel_format = formats[0];
 	if (formats[0] == DRM_FORMAT_RGB888)
diff --git a/drivers/gpu/drm/sitronix/st7586.c b/drivers/gpu/drm/sitronix/st7586.c
index b57ebf37a664..dd3a1c770189 100644
--- a/drivers/gpu/drm/sitronix/st7586.c
+++ b/drivers/gpu/drm/sitronix/st7586.c
@@ -242,9 +242,6 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	msleep(100);
 
-	st7586_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
-			&shadow_plane_state->fmtcnv_state);
-
 	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
 out_exit:
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/sitronix/st7735r.c b/drivers/gpu/drm/sitronix/st7735r.c
index c1f8228495f6..1a34c7ba460b 100644
--- a/drivers/gpu/drm/sitronix/st7735r.c
+++ b/drivers/gpu/drm/sitronix/st7735r.c
@@ -129,7 +129,7 @@ static void st7735r_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	msleep(20);
 
-	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+	backlight_enable(dbidev->backlight);
 out_exit:
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index 9f26aaca0bfa..5115be8854bb 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -177,7 +177,8 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
 		break;
 	}
 	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
-	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+
+	backlight_enable(dbidev->backlight);
 out_exit:
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index 7c154c008344..c616f56af5b5 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -96,7 +96,8 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
 	}
 	addr_mode |= ILI9163_MADCTL_BGR;
 	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
-	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+
+	backlight_enable(dbidev->backlight);
 out_exit:
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index d32538b1eb09..cab03cad389d 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -284,9 +284,6 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	ili9225_command(dbi, ILI9225_DISPLAY_CONTROL_1, 0x1017);
 
-	ili9225_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
-			 &shadow_plane_state->fmtcnv_state);
-
 out_exit:
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index 2ab750cba505..972811564d6a 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -133,7 +133,8 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
 	}
 	addr_mode |= ILI9341_MADCTL_BGR;
 	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
-	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+
+	backlight_enable(dbidev->backlight);
 out_exit:
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 1e411a0f4567..52b14f2cb0e1 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -155,7 +155,8 @@ static void waveshare_enable(struct drm_simple_display_pipe *pipe,
 	}
 	addr_mode |= ILI9486_MADCTL_BGR;
 	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
-	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+
+	backlight_enable(dbidev->backlight);
  out_exit:
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index a063eff77624..f121e1a8a303 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -137,7 +137,8 @@ static void mi0283qt_enable(struct drm_simple_display_pipe *pipe,
 	}
 	addr_mode |= ILI9341_MADCTL_BGR;
 	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
-	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+
+	backlight_enable(dbidev->backlight);
 out_exit:
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 82dfa169f762..4907945ab507 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -252,7 +252,7 @@ static void panel_mipi_dbi_enable(struct drm_simple_display_pipe *pipe,
 	if (!ret)
 		panel_mipi_dbi_commands_execute(dbi, dbidev->driver_private);
 
-	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+	backlight_enable(dbidev->backlight);
 out_exit:
 	drm_dev_exit(idx);
 }
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index f45f9612c0bc..637be84d3d5a 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -176,9 +176,6 @@ enum drm_mode_status mipi_dbi_pipe_mode_valid(struct drm_simple_display_pipe *pi
 					      const struct drm_display_mode *mode);
 void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
 			  struct drm_plane_state *old_state);
-void mipi_dbi_enable_flush(struct mipi_dbi_dev *dbidev,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plan_state);
 void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe);
 int mipi_dbi_pipe_begin_fb_access(struct drm_simple_display_pipe *pipe,
 				  struct drm_plane_state *plane_state);
-- 
2.52.0

