Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2EEA76B71
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186AD10E441;
	Mon, 31 Mar 2025 15:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iW2S+ORY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xrG82naU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iW2S+ORY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xrG82naU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4067510E441
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:59:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C163C21206;
 Mon, 31 Mar 2025 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743436743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vMT5KOeB/NDlZB2gFYYHWSwjf3W9tSQGPwVapZ7UWg=;
 b=iW2S+ORYSCGhvX9yXeWbf6qu53iyL9fu1S4IONb9J4csEAGK8OthHHIsHYKRkJjUfXSEOs
 ljPZrICSbI+4V4uVitxH3q7UmWm8+xFQJSrd/2SCYpfHwBrWb4RSr6NEBkW/7iYQ/uvqei
 peqnDA7B7I+GwzfZAhf6WEq3Z6WB0z4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743436743;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vMT5KOeB/NDlZB2gFYYHWSwjf3W9tSQGPwVapZ7UWg=;
 b=xrG82naU6CzfDlXZSiDL+9j0HqP/uXyMVhAGJKb4IcbPTMX/jzoKOAdJaLbd+W8pe38rRo
 EQRbu8lp3TZ/EUCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743436743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vMT5KOeB/NDlZB2gFYYHWSwjf3W9tSQGPwVapZ7UWg=;
 b=iW2S+ORYSCGhvX9yXeWbf6qu53iyL9fu1S4IONb9J4csEAGK8OthHHIsHYKRkJjUfXSEOs
 ljPZrICSbI+4V4uVitxH3q7UmWm8+xFQJSrd/2SCYpfHwBrWb4RSr6NEBkW/7iYQ/uvqei
 peqnDA7B7I+GwzfZAhf6WEq3Z6WB0z4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743436743;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vMT5KOeB/NDlZB2gFYYHWSwjf3W9tSQGPwVapZ7UWg=;
 b=xrG82naU6CzfDlXZSiDL+9j0HqP/uXyMVhAGJKb4IcbPTMX/jzoKOAdJaLbd+W8pe38rRo
 EQRbu8lp3TZ/EUCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7F53413A1F;
 Mon, 31 Mar 2025 15:59:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YH3wHce76mfdVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 31 Mar 2025 15:59:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 12/18] drm/sysfb: ofdrm: Add EDID support
Date: Mon, 31 Mar 2025 17:52:15 +0200
Message-ID: <20250331155538.1173333-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331155538.1173333-1-tzimmermann@suse.de>
References: <20250331155538.1173333-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,ffwll.ch,gmail.com];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.80
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

Add EDID support to sysfb connector helpers. Read the EDID property
from the OF node in ofdrm. Without EDID, this does nothing.

Some systems with OF display, such as 32-bit PPC Macintoshs, provide
the system display's EDID data as node property in their DT. Exporting
this information allows compositors to implement correct DPI and
meaningful color management.

v2:
- return errno codes on errors (Jani)
- simplify EDID read logic (Jani)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.c | 25 ++++++++++++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h |  2 ++
 drivers/gpu/drm/sysfb/ofdrm.c            | 20 +++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
index b48e06b253051..1971d7e171f81 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
@@ -9,6 +9,7 @@
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -281,10 +282,34 @@ EXPORT_SYMBOL(drm_sysfb_crtc_atomic_destroy_state);
  * Connector
  */
 
+static int drm_sysfb_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
+{
+	struct drm_sysfb_device *sysfb = data;
+	const u8 *edid = sysfb->edid;
+	size_t off = block * EDID_LENGTH;
+	size_t end = off + len;
+
+	if (!edid)
+		return -EINVAL;
+	if (end > EDID_LENGTH)
+		return -EINVAL;
+	memcpy(buf, &edid[off], len);
+
+	return 0;
+}
+
 int drm_sysfb_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(connector->dev);
+	const struct drm_edid *drm_edid;
+
+	if (sysfb->edid) {
+		drm_edid = drm_edid_read_custom(connector, drm_sysfb_get_edid_block, sysfb);
+		drm_edid_connector_update(connector, drm_edid);
+		drm_edid_free(drm_edid);
+	}
 
+	/* Return the fixed mode even with EDID */
 	return drm_connector_helper_get_modes_fixed(connector, &sysfb->fb_mode);
 }
 EXPORT_SYMBOL(drm_sysfb_connector_helper_get_modes);
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index 45e396bf74b73..3684bd0ef0853 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -24,6 +24,8 @@ struct drm_display_mode drm_sysfb_mode(unsigned int width,
 struct drm_sysfb_device {
 	struct drm_device dev;
 
+	const u8 *edid; /* can be NULL */
+
 	/* hardware settings */
 	struct drm_display_mode fb_mode;
 	const struct drm_format_info *fb_format;
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index 71e661ba93299..86c1a0c80ceb3 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -12,6 +12,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
@@ -227,6 +228,16 @@ static u64 display_get_address_of(struct drm_device *dev, struct device_node *of
 	return address;
 }
 
+static const u8 *display_get_edid_of(struct drm_device *dev, struct device_node *of_node,
+				     u8 buf[EDID_LENGTH])
+{
+	int ret = of_property_read_u8_array(of_node, "EDID", buf, EDID_LENGTH);
+
+	if (ret)
+		return NULL;
+	return buf;
+}
+
 static bool is_avivo(u32 vendor, u32 device)
 {
 	/* This will match most R5xx */
@@ -298,6 +309,8 @@ struct ofdrm_device {
 	/* colormap */
 	void __iomem *cmap_base;
 
+	u8 edid[EDID_LENGTH];
+
 	/* modesetting */
 	u32 formats[DRM_SYSFB_PLANE_NFORMATS(1)];
 	struct drm_plane primary_plane;
@@ -840,6 +853,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	int width, height, depth, linebytes;
 	const struct drm_format_info *format;
 	u64 address;
+	const u8 *edid;
 	resource_size_t fb_size, fb_base, fb_pgbase, fb_pgsize;
 	struct resource *res, *mem;
 	void __iomem *screen_base;
@@ -989,6 +1003,9 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 		}
 	}
 
+	/* EDID is optional */
+	edid = display_get_edid_of(dev, of_node, odev->edid);
+
 	/*
 	 * Firmware framebuffer
 	 */
@@ -999,6 +1016,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	sysfb->fb_pitch = linebytes;
 	if (odev->cmap_base)
 		sysfb->fb_gamma_lut_size = OFDRM_GAMMA_LUT_SIZE;
+	sysfb->edid = edid;
 
 	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sysfb->fb_mode));
 	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, linebytes=%d byte\n",
@@ -1072,6 +1090,8 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	drm_connector_set_panel_orientation_with_quirk(connector,
 						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
 						       width, height);
+	if (edid)
+		drm_connector_attach_edid_property(connector);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
-- 
2.49.0

