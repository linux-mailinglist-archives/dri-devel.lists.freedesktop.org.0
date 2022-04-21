Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D02B50A7F0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 20:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A6F10E36B;
	Thu, 21 Apr 2022 18:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7195F10E381
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 18:17:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 00C561F745;
 Thu, 21 Apr 2022 18:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650565053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugyist2VELOMMuGGjtlHVa5dk7UyFxpT39VzUnL5oS8=;
 b=eiZj70CvTbcnhGPqw8ARew5AUcLB+PeP/bpQrr31FoZjXuBvD11FQn6EU9npMV/MyIrNcG
 e3ReSfCOqJMkqljF+Hbj/SurVfQHSsVFiPi3ZuvaTyB+EW787ILJhUePaEYrrzCU7BIwnJ
 P3AKsdLpGeVS3AG268RHTC41RQSOgcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650565053;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugyist2VELOMMuGGjtlHVa5dk7UyFxpT39VzUnL5oS8=;
 b=mv0pWLW7K5l0R/YKJE/1LapGFaD1tjkzoXyo55QhO6EKc/fXtNbnRJIVs5Ui/JPMFBx39J
 low2bTeISh7IIDBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C380A13446;
 Thu, 21 Apr 2022 18:17:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6APgLryfYWIXGwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Apr 2022 18:17:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tiwai@suse.com, tamara.schmitz@suse.com
Subject: [PATCH 2/3] drm/format-helper: Add RGB888-to-XRGB8888 conversion
Date: Thu, 21 Apr 2022 20:17:21 +0200
Message-Id: <20220421181722.13936-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421181722.13936-1-tzimmermann@suse.de>
References: <20220421181722.13936-1-tzimmermann@suse.de>
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

Add a format helper that converts RGB888 to XRGB8888. Use this
function in drm_fb_blit_toio(). Fixes simpledrm output for this
combination of formats.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index b648f29b21b6..c107ff75ef78 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -411,6 +411,47 @@ void drm_fb_xrgb8888_to_rgb888_toio(void __iomem *dst, unsigned int dst_pitch,
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888_toio);
 
+static void drm_fb_rgb888_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	u32 *dbuf32 = dbuf;
+	const u8 *sbuf8 = sbuf;
+	unsigned int x;
+
+	for (x = 0; x < pixels; x++) {
+		u8 r = *sbuf8++;
+		u8 g = *sbuf8++;
+		u8 b = *sbuf8++;
+		*dbuf32++ = 0xff000000 | (r << 16) | (g << 8) | b;
+	}
+}
+
+static void drm_fb_rgb888_to_xrgb8888_toio(void __iomem *dst, unsigned int dst_pitch,
+					   const void *vaddr, const struct drm_framebuffer *fb,
+					   const struct drm_rect *clip)
+{
+	size_t linepixels = clip->x2 - clip->x1;
+	size_t dst_len = linepixels * 4;
+	unsigned int y, lines = clip->y2 - clip->y1;
+	void *dbuf;
+
+	if (!dst_pitch)
+		dst_pitch = dst_len;
+
+	dbuf = kmalloc(dst_len, GFP_KERNEL);
+	if (!dbuf)
+		return;
+
+	vaddr += clip_offset(clip, fb->pitches[0], 3);
+	for (y = 0; y < lines; y++) {
+		drm_fb_rgb888_to_xrgb8888_line(dbuf, vaddr, linepixels);
+		memcpy_toio(dst, dbuf, dst_len);
+		vaddr += fb->pitches[0];
+		dst += dst_pitch;
+	}
+
+	kfree(dbuf);
+}
+
 static void drm_fb_xrgb8888_to_xrgb2101010_line(u32 *dbuf, const u32 *sbuf,
 						unsigned int pixels)
 {
@@ -583,6 +624,11 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 			drm_fb_xrgb8888_to_rgb888_toio(dst, dst_pitch, vmap, fb, clip);
 			return 0;
 		}
+	} else if (dst_format == DRM_FORMAT_XRGB8888) {
+		if (fb_format == DRM_FORMAT_RGB888) {
+			drm_fb_rgb888_to_xrgb8888_toio(dst, dst_pitch, vmap, fb, clip);
+			return 0;
+		}
 	} else if (dst_format == DRM_FORMAT_XRGB2101010) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
 			drm_fb_xrgb8888_to_xrgb2101010_toio(dst, dst_pitch, vmap, fb, clip);
-- 
2.35.1

