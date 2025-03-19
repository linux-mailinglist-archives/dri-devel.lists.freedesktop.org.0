Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE5DA686E4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 09:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5954810E2ED;
	Wed, 19 Mar 2025 08:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GeykS0a5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="noD0ezDD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GeykS0a5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="noD0ezDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF04910E2EB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 08:34:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 084051F842;
 Wed, 19 Mar 2025 08:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742373234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCUpTQguZPkphpefLyu/RAFkbFGUntgaxK6dTDlbU64=;
 b=GeykS0a5zOCj52XmCRGtIGVpVhmFhupsm6gt98kFVOjoYWfqqFXni4+iXOIX15AnY3MwNF
 7MF5TgjQDyyoJa4xSvACiQZo8v1741QT72k0OHiw8YkkGHdIPyDCKfL7Egb9BtAVfz76Tr
 uRtnNxgAb7+zqHdJuLOqFufnGjtdjVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742373234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCUpTQguZPkphpefLyu/RAFkbFGUntgaxK6dTDlbU64=;
 b=noD0ezDDbdqTX/C6Dil72lNUUaiKvWomllintihbJPNZ64r8VNta+n5+r22u4bXdGVpW1F
 BX5zHeBjCN/B/FDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742373234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCUpTQguZPkphpefLyu/RAFkbFGUntgaxK6dTDlbU64=;
 b=GeykS0a5zOCj52XmCRGtIGVpVhmFhupsm6gt98kFVOjoYWfqqFXni4+iXOIX15AnY3MwNF
 7MF5TgjQDyyoJa4xSvACiQZo8v1741QT72k0OHiw8YkkGHdIPyDCKfL7Egb9BtAVfz76Tr
 uRtnNxgAb7+zqHdJuLOqFufnGjtdjVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742373234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCUpTQguZPkphpefLyu/RAFkbFGUntgaxK6dTDlbU64=;
 b=noD0ezDDbdqTX/C6Dil72lNUUaiKvWomllintihbJPNZ64r8VNta+n5+r22u4bXdGVpW1F
 BX5zHeBjCN/B/FDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8D5213A2C;
 Wed, 19 Mar 2025 08:33:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2GDEL3GB2mc+OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Mar 2025 08:33:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/18] drm/sysfb: Provide single mode-init helper
Date: Wed, 19 Mar 2025 08:45:05 +0100
Message-ID: <20250319083021.6472-7-tzimmermann@suse.de>
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

Merge the mode-init functions of ofdrm and simpledrm to the new helper
drm_sysfb_mode(). Also implement the DPI defaults there. Replace the
code in each driver with the shared helper.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h |  5 +++++
 drivers/gpu/drm/sysfb/ofdrm.c            | 17 +----------------
 drivers/gpu/drm/sysfb/simpledrm.c        | 23 +----------------------
 4 files changed, 31 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
index c083d21fd9ca..6deeac81a41d 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
@@ -6,3 +6,27 @@
 
 MODULE_DESCRIPTION("Helpers for DRM sysfb drivers");
 MODULE_LICENSE("GPL");
+
+struct drm_display_mode drm_sysfb_mode(unsigned int width,
+				       unsigned int height,
+				       unsigned int width_mm,
+				       unsigned int height_mm)
+{
+	/*
+	 * Assume a monitor resolution of 96 dpi to
+	 * get a somewhat reasonable screen size.
+	 */
+	if (!width_mm)
+		width_mm = DRM_MODE_RES_MM(width, 96ul);
+	if (!height_mm)
+		height_mm = DRM_MODE_RES_MM(height, 96ul);
+
+	{
+		const struct drm_display_mode mode = {
+			DRM_MODE_INIT(60, width, height, width_mm, height_mm)
+		};
+
+		return mode;
+	}
+}
+EXPORT_SYMBOL(drm_sysfb_mode);
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index 8f05eee7f49e..8b4cc4af702b 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -11,6 +11,11 @@
 
 struct drm_format_info;
 
+struct drm_display_mode drm_sysfb_mode(unsigned int width,
+				       unsigned int height,
+				       unsigned int width_mm,
+				       unsigned int height_mm);
+
 /*
  * Device
  */
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index d42704facb45..7df6901157fb 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -1070,21 +1070,6 @@ static const struct ofdrm_device_funcs ofdrm_qemu_device_funcs = {
 	.cmap_write = ofdrm_qemu_cmap_write,
 };
 
-static struct drm_display_mode ofdrm_mode(unsigned int width, unsigned int height)
-{
-	/*
-	 * Assume a monitor resolution of 96 dpi to
-	 * get a somewhat reasonable screen size.
-	 */
-	const struct drm_display_mode mode = {
-		DRM_MODE_INIT(60, width, height,
-			      DRM_MODE_RES_MM(width, 96ul),
-			      DRM_MODE_RES_MM(height, 96ul))
-	};
-
-	return mode;
-}
-
 static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 						struct platform_device *pdev)
 {
@@ -1251,7 +1236,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	 */
 
 	iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
-	sysfb->fb_mode = ofdrm_mode(width, height);
+	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
 	sysfb->fb_format = format;
 	sysfb->fb_pitch = linebytes;
 
diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index f258d8cdb6b6..149df6941b6c 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -756,18 +756,6 @@ static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
  * Init / Cleanup
  */
 
-static struct drm_display_mode simpledrm_mode(unsigned int width,
-					      unsigned int height,
-					      unsigned int width_mm,
-					      unsigned int height_mm)
-{
-	const struct drm_display_mode mode = {
-		DRM_MODE_INIT(60, width, height, width_mm, height_mm)
-	};
-
-	return mode;
-}
-
 static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 							struct platform_device *pdev)
 {
@@ -855,16 +843,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 			return ERR_PTR(-EINVAL);
 	}
 
-	/*
-	 * Assume a monitor resolution of 96 dpi if physical dimensions
-	 * are not specified to get a somewhat reasonable screen size.
-	 */
-	if (!width_mm)
-		width_mm = DRM_MODE_RES_MM(width, 96ul);
-	if (!height_mm)
-		height_mm = DRM_MODE_RES_MM(height, 96ul);
-
-	sysfb->fb_mode = simpledrm_mode(width, height, width_mm, height_mm);
+	sysfb->fb_mode = drm_sysfb_mode(width, height, width_mm, height_mm);
 	sysfb->fb_format = format;
 	sysfb->fb_pitch = stride;
 
-- 
2.48.1

