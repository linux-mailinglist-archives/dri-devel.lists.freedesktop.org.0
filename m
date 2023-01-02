Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D92BF65B110
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 12:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C4410E323;
	Mon,  2 Jan 2023 11:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6923410E314
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 11:29:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 141CA20BEC;
 Mon,  2 Jan 2023 11:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672658972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWU6D4rcg/vRXkR2cImtm32BkHur/reapojst4SzVVw=;
 b=iu6bAndYzevU1AlLyqq/UK67i5Faw9/sKzwPUrz+we1ZW/8pLIWmQZJPIX8ORfQMbFdC8+
 C0ZWzsfgfeArgzmQSdzSoxHTyQ30fqbnUcXwsbcfj5VXj/CDUwtOzkG+gCqmdjhfNPCsVX
 iq43dUJPPvqHDq/sMEMMY6+v8oTiEL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672658972;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWU6D4rcg/vRXkR2cImtm32BkHur/reapojst4SzVVw=;
 b=DdZZj0QL1MND2I/Y1JpQJYRrbKsDDamIesbHsPRfRhOsYmg1PGOVL04H5Z17vauulPvVeY
 eaLKF8T5nxD+/+AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0AB613427;
 Mon,  2 Jan 2023 11:29:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gI4sLhvAsmOOcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Jan 2023 11:29:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 06/13] drm/format-helper: Flip src/dst-format branches in
 blit helper
Date: Mon,  2 Jan 2023 12:29:20 +0100
Message-Id: <20230102112927.26565-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102112927.26565-1-tzimmermann@suse.de>
References: <20230102112927.26565-1-tzimmermann@suse.de>
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

Upcoming changes to the format conversion will mostly blit from
XRGB8888 to some other format. So put the source format in blit's
outer branches to make the code more readable. For cases where
a format only changes its endianness, such as XRGB565, introduce
dedicated branches that handle this for all formats.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_format_helper.c | 44 +++++++++++++----------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index f3f3b3809a3e..36d2ca9d0f01 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -653,41 +653,37 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 	if (dst_format == DRM_FORMAT_ARGB2101010)
 		dst_format = DRM_FORMAT_XRGB2101010;
 
-	if (dst_format == fb_format) {
+	if (fb_format == dst_format) {
 		drm_fb_memcpy(dst, dst_pitch, src, fb, clip);
 		return 0;
-
-	} else if (dst_format == DRM_FORMAT_RGB565) {
-		if (fb_format == DRM_FORMAT_XRGB8888) {
+	} else if (fb_format == (dst_format | DRM_FORMAT_BIG_ENDIAN)) {
+		drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
+		return 0;
+	} else if (fb_format == (dst_format & ~DRM_FORMAT_BIG_ENDIAN)) {
+		drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
+		return 0;
+	} else if (fb_format == DRM_FORMAT_XRGB8888) {
+		if (dst_format == DRM_FORMAT_RGB565) {
 			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, false);
 			return 0;
-		}
-	} else if (dst_format == (DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN)) {
-		if (fb_format == DRM_FORMAT_RGB565) {
-			drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
-			return 0;
-		}
-	} else if (dst_format == DRM_FORMAT_RGB888) {
-		if (fb_format == DRM_FORMAT_XRGB8888) {
+		} else if (dst_format == DRM_FORMAT_RGB888) {
 			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip);
 			return 0;
-		}
-	} else if (dst_format == DRM_FORMAT_XRGB8888) {
-		if (fb_format == DRM_FORMAT_RGB888) {
-			drm_fb_rgb888_to_xrgb8888(dst, dst_pitch, src, fb, clip);
+		} else if (dst_format == DRM_FORMAT_XRGB2101010) {
+			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
 			return 0;
-		} else if (fb_format == DRM_FORMAT_RGB565) {
-			drm_fb_rgb565_to_xrgb8888(dst, dst_pitch, src, fb, clip);
+		} else if (dst_format == DRM_FORMAT_BGRX8888) {
+			drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
 			return 0;
 		}
-	} else if (dst_format == DRM_FORMAT_XRGB2101010) {
-		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
+	} else if (fb_format == DRM_FORMAT_RGB888) {
+		if (dst_format == DRM_FORMAT_XRGB8888) {
+			drm_fb_rgb888_to_xrgb8888(dst, dst_pitch, src, fb, clip);
 			return 0;
 		}
-	} else if (dst_format == DRM_FORMAT_BGRX8888) {
-		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
+	} else if (fb_format == DRM_FORMAT_RGB565) {
+		if (dst_format == DRM_FORMAT_XRGB8888) {
+			drm_fb_rgb565_to_xrgb8888(dst, dst_pitch, src, fb, clip);
 			return 0;
 		}
 	}
-- 
2.39.0

