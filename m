Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDF7D2311D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E0610E6FC;
	Thu, 15 Jan 2026 08:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="M0bXvUH5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="968qfzj2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M0bXvUH5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="968qfzj2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FB610E6FB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:21:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 428FE5BCEB;
 Thu, 15 Jan 2026 08:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768465296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7m9ptp3zS9Bt5WIJi/no0bSERhCnoUipcknBWmggDU=;
 b=M0bXvUH51lgLjqOZO9F5kFqg8TDwLUB4qZP/1rMJznsAyF707tcVuOH/8hKrKrBiDZ/FTT
 8EXNTsY8lAkyeuuh0wZNWuBnNXCCfG1DBHeoT+H/IOIx0kcVC+ygHNbqBCt6o+8WrtyvSB
 dhUumpTmTHHnseMdCp3ifYZVGmygt4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768465296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7m9ptp3zS9Bt5WIJi/no0bSERhCnoUipcknBWmggDU=;
 b=968qfzj28b087BElNt0z55oIFVfHVfFOq+biXVxirUZ80wMDbIvlICGUXDFgaWQotRXsGd
 oYLgzGpQa54f0MDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768465296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7m9ptp3zS9Bt5WIJi/no0bSERhCnoUipcknBWmggDU=;
 b=M0bXvUH51lgLjqOZO9F5kFqg8TDwLUB4qZP/1rMJznsAyF707tcVuOH/8hKrKrBiDZ/FTT
 8EXNTsY8lAkyeuuh0wZNWuBnNXCCfG1DBHeoT+H/IOIx0kcVC+ygHNbqBCt6o+8WrtyvSB
 dhUumpTmTHHnseMdCp3ifYZVGmygt4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768465296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7m9ptp3zS9Bt5WIJi/no0bSERhCnoUipcknBWmggDU=;
 b=968qfzj28b087BElNt0z55oIFVfHVfFOq+biXVxirUZ80wMDbIvlICGUXDFgaWQotRXsGd
 oYLgzGpQa54f0MDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E365C3EA63;
 Thu, 15 Jan 2026 08:21:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UIxRNo+jaGkjBQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jan 2026 08:21:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 12/12] drm/corebotdrm: Support panel orientation
Date: Thu, 15 Jan 2026 08:57:22 +0100
Message-ID: <20260115082128.12460-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115082128.12460-1-tzimmermann@suse.de>
References: <20260115082128.12460-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLf8s8spogujn9h9roxabhn3pd)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Add fields and constants for coreboot framebuffer orientation. Set
corebootdrm's DRM connector state from the values. Not all firmware
provides orientation, so make it optional. Systems without continue
to use unknown orientation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/corebootdrm.c | 30 +++++++++++++++++++++++++----
 include/linux/coreboot.h            |  9 +++++++++
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/corebootdrm.c b/drivers/gpu/drm/sysfb/corebootdrm.c
index 745318580a5d..5dc6f3c76f7b 100644
--- a/drivers/gpu/drm/sysfb/corebootdrm.c
+++ b/drivers/gpu/drm/sysfb/corebootdrm.c
@@ -110,6 +110,26 @@ static phys_addr_t corebootdrm_get_address_fb(struct drm_device *dev, resource_s
 	return fb->physical_address;
 }
 
+static enum drm_panel_orientation corebootdrm_get_orientation_fb(struct drm_device *dev,
+								 const struct lb_framebuffer *fb)
+{
+	if (!LB_FRAMEBUFFER_HAS_ORIENTATION(fb))
+		return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+
+	switch (fb->orientation) {
+	case LB_FRAMEBUFFER_ORIENTATION_NORMAL:
+		return DRM_MODE_PANEL_ORIENTATION_NORMAL;
+	case LB_FRAMEBUFFER_ORIENTATION_BOTTOM_UP:
+		return DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
+	case LB_FRAMEBUFFER_ORIENTATION_LEFT_UP:
+		return DRM_MODE_PANEL_ORIENTATION_LEFT_UP;
+	case LB_FRAMEBUFFER_ORIENTATION_RIGHT_UP:
+		return DRM_MODE_PANEL_ORIENTATION_RIGHT_UP;
+	}
+
+	return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+}
+
 /*
  * Simple Framebuffer device
  */
@@ -168,7 +188,8 @@ static const struct drm_mode_config_funcs corebootdrm_mode_config_funcs = {
 	DRM_SYSFB_MODE_CONFIG_FUNCS,
 };
 
-static int corebootdrm_mode_config_init(struct corebootdrm_device *cdev)
+static int corebootdrm_mode_config_init(struct corebootdrm_device *cdev,
+					enum drm_panel_orientation orientation)
 {
 	struct drm_sysfb_device *sysfb = &cdev->sysfb;
 	struct drm_device *dev = &sysfb->dev;
@@ -234,8 +255,7 @@ static int corebootdrm_mode_config_init(struct corebootdrm_device *cdev)
 	if (ret)
 		return ret;
 	drm_connector_helper_add(connector, &corebootdrm_connector_helper_funcs);
-	drm_connector_set_panel_orientation_with_quirk(connector,
-						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
+	drm_connector_set_panel_orientation_with_quirk(connector, orientation,
 						       width, height);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
@@ -276,6 +296,7 @@ static int corebootdrm_probe(struct platform_device *pdev)
 	int width, height, pitch;
 	resource_size_t size;
 	phys_addr_t address;
+	enum drm_panel_orientation orientation;
 	struct resource *res, *mem = NULL;
 	struct resource aperture;
 	void __iomem *screen_base;
@@ -320,6 +341,7 @@ static int corebootdrm_probe(struct platform_device *pdev)
 	address = corebootdrm_get_address_fb(dev, size, fb);
 	if (!address)
 		return -EINVAL;
+	orientation = corebootdrm_get_orientation_fb(dev, fb);
 
 	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
 	sysfb->fb_format = format;
@@ -375,7 +397,7 @@ static int corebootdrm_probe(struct platform_device *pdev)
 	 * DRM mode setting and registration
 	 */
 
-	ret = corebootdrm_mode_config_init(cdev);
+	ret = corebootdrm_mode_config_init(cdev, orientation);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
index e81ee5746e2b..d1de94f49cd3 100644
--- a/include/linux/coreboot.h
+++ b/include/linux/coreboot.h
@@ -45,6 +45,11 @@ struct lb_cbmem_entry {
 	u32 id;
 } __packed;
 
+#define LB_FRAMEBUFFER_ORIENTATION_NORMAL	0
+#define LB_FRAMEBUFFER_ORIENTATION_BOTTOM_UP	1
+#define LB_FRAMEBUFFER_ORIENTATION_LEFT_UP	2
+#define LB_FRAMEBUFFER_ORIENTATION_RIGHT_UP	3
+
 /* Describes framebuffer setup by coreboot */
 struct lb_framebuffer {
 	u32 tag;
@@ -63,9 +68,13 @@ struct lb_framebuffer {
 	u8  blue_mask_size;
 	u8  reserved_mask_pos;
 	u8  reserved_mask_size;
+	u8  orientation;
 } __packed;
 
 #define LB_FRAMEBUFFER_HAS_LFB(__fb) \
 	((__fb)->size >= offsetofend(struct lb_framebuffer, reserved_mask_size))
 
+#define LB_FRAMEBUFFER_HAS_ORIENTATION(__fb) \
+	((__fb)->size >= offsetofend(struct lb_framebuffer, orientation))
+
 #endif /* _LINUX_COREBOOT_H */
-- 
2.52.0

