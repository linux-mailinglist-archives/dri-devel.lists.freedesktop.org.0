Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB83350DAC7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 09:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF7110E092;
	Mon, 25 Apr 2022 07:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F4410E069
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 07:59:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8907C21100;
 Mon, 25 Apr 2022 07:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650873583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMgrxxRGzsFD5mMG+YVDq2ZpkCITCYI5+wwJYdiBQo4=;
 b=miMPZAw8fUQ/E3WxCAvedD6zMGk7xACx8GOBf0Hw/ojhP+SAMrkSp3AEJ6nhm+aK4CtRcR
 KZO26iNDBcRj1IqJxIuSVI2KDcXJQOrEgWRwpdiRpXTLPu5xtKRMBNT35M6PjFjmzE1+8t
 F06V0kSR3wMFKrhr61RdVNFGBn+5GzQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650873583;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMgrxxRGzsFD5mMG+YVDq2ZpkCITCYI5+wwJYdiBQo4=;
 b=pLqzqQMdavP6qTgFDH9jk6iQ43PRr/dAVKJ3zd8EuoH4SO09RC1C817vGjRPne/uvu7x20
 1tH7VO7htQd1CfAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 599FE13AED;
 Mon, 25 Apr 2022 07:59:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WJnqFO9UZmIWbwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Apr 2022 07:59:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tiwai@suse.com, tamara.schmitz@suse.com
Subject: [PATCH v2 3/3] drm/format-helper: Add RGB565-to-XRGB8888 conversion
Date: Mon, 25 Apr 2022 09:59:39 +0200
Message-Id: <20220425075939.30450-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220425075939.30450-1-tzimmermann@suse.de>
References: <20220425075939.30450-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a format helper that converts RGB565 to XRGB8888. Use this
function in drm_fb_blit_toio(). Fixes simpledrm output for this
combination of formats.

UEFI and/or Grub will usually set 32-bit output in XRGB8888 format.
The issue can be reproduced by enabling simpledrm and requesting a
console framebuffer of different format on the kernel command line;
for example

  nomodeset video=1024x768-16

In this case, conversion helpers will display nothing on the console.
The patch makes this work by implementing the rsp conversion helpers.
It also enables odd userspace configurations, such as running Xorg
with 16-bit color depth on a 32-bit output buffer.

v2:
	* use helpers for struct drm_rect (Javier)
	* improve commit message (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_format_helper.c | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index c83e0bb2e8c7..34b7ef443ad2 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -411,6 +411,49 @@ void drm_fb_xrgb8888_to_rgb888_toio(void __iomem *dst, unsigned int dst_pitch,
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888_toio);
 
+static void drm_fb_rgb565_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	u32 *dbuf32 = dbuf;
+	const u16 *sbuf16 = sbuf;
+	unsigned int x;
+
+	for (x = 0; x < pixels; x++, ++sbuf16, ++dbuf32) {
+		u32 val32 = ((*sbuf16 & 0xf800) << 8) |
+			    ((*sbuf16 & 0x07e0) << 5) |
+			    ((*sbuf16 & 0x001f) << 3);
+		*dbuf32 = 0xff000000 | val32 |
+			  ((val32 >> 3) & 0x00070007) |
+			  ((val32 >> 2) & 0x00000300);
+	}
+}
+
+static void drm_fb_rgb565_to_xrgb8888_toio(void __iomem *dst, unsigned int dst_pitch,
+					   const void *vaddr, const struct drm_framebuffer *fb,
+					   const struct drm_rect *clip)
+{
+	size_t linepixels = drm_rect_width(clip);
+	size_t dst_len = linepixels * 4;
+	unsigned int y, lines = drm_rect_height(clip);
+	void *dbuf;
+
+	if (!dst_pitch)
+		dst_pitch = dst_len;
+
+	dbuf = kmalloc(dst_len, GFP_KERNEL);
+	if (!dbuf)
+		return;
+
+	vaddr += clip_offset(clip, fb->pitches[0], 2);
+	for (y = 0; y < lines; y++) {
+		drm_fb_rgb565_to_xrgb8888_line(dbuf, vaddr, linepixels);
+		memcpy_toio(dst, dbuf, dst_len);
+		vaddr += fb->pitches[0];
+		dst += dst_pitch;
+	}
+
+	kfree(dbuf);
+}
+
 static void drm_fb_rgb888_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	u32 *dbuf32 = dbuf;
@@ -628,6 +671,9 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 		if (fb_format == DRM_FORMAT_RGB888) {
 			drm_fb_rgb888_to_xrgb8888_toio(dst, dst_pitch, vmap, fb, clip);
 			return 0;
+		} else if (fb_format == DRM_FORMAT_RGB565) {
+			drm_fb_rgb565_to_xrgb8888_toio(dst, dst_pitch, vmap, fb, clip);
+			return 0;
 		}
 	} else if (dst_format == DRM_FORMAT_XRGB2101010) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-- 
2.36.0

