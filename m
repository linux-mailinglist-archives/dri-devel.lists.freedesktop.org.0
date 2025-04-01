Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA98EA7780C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 11:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299C310E543;
	Tue,  1 Apr 2025 09:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A7810E543
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 09:45:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 434121F458;
 Tue,  1 Apr 2025 09:44:30 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 08B6F138A5;
 Tue,  1 Apr 2025 09:44:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mELPAH6162dSBgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Apr 2025 09:44:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 12/18] drm/sysfb: ofdrm: Add EDID support
Date: Tue,  1 Apr 2025 11:37:15 +0200
Message-ID: <20250401094056.32904-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401094056.32904-1-tzimmermann@suse.de>
References: <20250401094056.32904-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 434121F458
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

v3:
- avoid parser error by clearing EDID extension field
v2:
- return errno codes on errors (Jani)
- simplify EDID read logic (Jani)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.c | 34 ++++++++++++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h |  2 ++
 drivers/gpu/drm/sysfb/ofdrm.c            | 20 ++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
index b48e06b253051..262490a717924 100644
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
@@ -281,10 +282,43 @@ EXPORT_SYMBOL(drm_sysfb_crtc_atomic_destroy_state);
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
+	/*
+	 * We don't have EDID extensions available and reporting them
+	 * will upset DRM helpers. Thus clear the extension field and
+	 * update the checksum. Adding the extension flag to the checksum
+	 * does this.
+	 */
+	buf[127] += buf[126];
+	buf[126] = 0;
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

