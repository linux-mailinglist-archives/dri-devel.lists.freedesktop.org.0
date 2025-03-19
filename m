Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ED4A686EA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 09:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B676610E2EF;
	Wed, 19 Mar 2025 08:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bzhUZAAf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t1I5O7vb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bzhUZAAf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t1I5O7vb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D76F10E23C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 08:34:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4847C1F84B;
 Wed, 19 Mar 2025 08:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742373237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JPaoeYUBBXi4RDQAzIkfzs2lI/kIbsPcJ4TkutvdANA=;
 b=bzhUZAAfv940oCQmJ9X0g73UFQpbxYdUydkhT1K2IVxul8COQyohHRYUnmZlozQhYzcF2A
 rhKLQLgibp5HN5fusXGOiPr2XOOA9CsYGdcUXa5IMb8h0WFfy6BXiIyTorO2gSgiv3i0Ai
 nAPuqUOfuSjkHlP/00msklVm5pN2Td8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742373237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JPaoeYUBBXi4RDQAzIkfzs2lI/kIbsPcJ4TkutvdANA=;
 b=t1I5O7vb2GxR5JD2j6sa3B1EGu76D3zKY/ajv457VgeTZ4av6eHms/WzPpgSWIR7o7Q1i8
 1GM3GjrpaJSBAfDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742373237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JPaoeYUBBXi4RDQAzIkfzs2lI/kIbsPcJ4TkutvdANA=;
 b=bzhUZAAfv940oCQmJ9X0g73UFQpbxYdUydkhT1K2IVxul8COQyohHRYUnmZlozQhYzcF2A
 rhKLQLgibp5HN5fusXGOiPr2XOOA9CsYGdcUXa5IMb8h0WFfy6BXiIyTorO2gSgiv3i0Ai
 nAPuqUOfuSjkHlP/00msklVm5pN2Td8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742373237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JPaoeYUBBXi4RDQAzIkfzs2lI/kIbsPcJ4TkutvdANA=;
 b=t1I5O7vb2GxR5JD2j6sa3B1EGu76D3zKY/ajv457VgeTZ4av6eHms/WzPpgSWIR7o7Q1i8
 1GM3GjrpaJSBAfDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A886F13A2C;
 Wed, 19 Mar 2025 08:33:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +MlqHnSB2mc+OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Mar 2025 08:33:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/18] drm/sysfb: ofdrm: Add EDID support
Date: Wed, 19 Mar 2025 08:45:11 +0100
Message-ID: <20250319083021.6472-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319083021.6472-1-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
 RCPT_COUNT_SEVEN(0.00)[7]; RCVD_COUNT_TWO(0.00)[2];
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.c | 29 ++++++++++++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h |  2 ++
 drivers/gpu/drm/sysfb/ofdrm.c            | 20 ++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
index b48e06b25305..cb65c618f8d3 100644
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
@@ -281,10 +282,38 @@ EXPORT_SYMBOL(drm_sysfb_crtc_atomic_destroy_state);
  * Connector
  */
 
+static int drm_sysfb_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
+{
+	const u8 *edid = data;
+	size_t off = block * EDID_LENGTH;
+	size_t end = off + len;
+
+	if (!edid)
+		return -1;
+	if (end > EDID_LENGTH)
+		return -1;
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
+		drm_edid = drm_edid_read_custom(connector, drm_sysfb_get_edid_block,
+						(void *)sysfb->edid);
+		if (drm_edid) {
+			drm_edid_connector_update(connector, drm_edid);
+			drm_edid_free(drm_edid);
+		} else {
+			drm_edid_connector_update(connector, NULL);
+		}
+	}
 
+	/* Return the fixed mode even with EDID */
 	return drm_connector_helper_get_modes_fixed(connector, &sysfb->fb_mode);
 }
 EXPORT_SYMBOL(drm_sysfb_connector_helper_get_modes);
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index 45e396bf74b7..3684bd0ef085 100644
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
index 71e661ba9329..86c1a0c80ceb 100644
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
2.48.1

