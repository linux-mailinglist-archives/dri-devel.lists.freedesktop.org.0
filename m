Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98096582598
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 13:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E54C340A;
	Wed, 27 Jul 2022 11:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D28C4804
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 11:33:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE037385BB;
 Wed, 27 Jul 2022 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658921619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZo7RnTMdrvT0RK3xji8EOPo06RSAHO/sriFVUg3SVA=;
 b=QIzSxDZccMZGli6Vw8berFvIBQEWfc2u5PWFWXzsMdADARtma2bydNndVpckyD+qzzNZ04
 ISuzwOZsaHkqXpOnZt5eljxt/Kk6zBoTBpN0gn4LQP2UCwFqrQgnKr1dDlJSOotgkq0BhW
 NY4lYtELrT5X2xki6fJfUm6jXLN8abs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658921619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZo7RnTMdrvT0RK3xji8EOPo06RSAHO/sriFVUg3SVA=;
 b=NulrMVmOJPPVEi55s3hYkzqpT/QiXJAjpsPV65DihiMcg+HHMSF9zAN6gJTlyWgwi4amv8
 DtolB0qm+5NkyzBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9097513AD7;
 Wed, 27 Jul 2022 11:33:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YFNcIpMi4WJmBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Jul 2022 11:33:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, noralf@tronnes.org, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@redhat.com,
 javierm@redhat.com, drawat.floss@gmail.com, kraxel@redhat.com,
 david@lechnology.com, jose.exposito89@gmail.com
Subject: [PATCH 09/12] drm/format-helper: Rework XRGB8888-to-XRGB2101010
 conversion
Date: Wed, 27 Jul 2022 13:33:09 +0200
Message-Id: <20220727113312.22407-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727113312.22407-1-tzimmermann@suse.de>
References: <20220727113312.22407-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update XRGB8888-to-XRGB2101010 conversion to support struct iosys_map
and convert all users. Although these are single-plane color formats,
the new interface supports multi-plane formats for consistency with
drm_fb_blit().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 35 +++++++++++++++++------------
 include/drm/drm_format_helper.h     |  6 ++---
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 155827eebe99..209f63b66c5f 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -504,26 +504,34 @@ static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
 }
 
 /**
- * drm_fb_xrgb8888_to_xrgb2101010_toio - Convert XRGB8888 to XRGB2101010 clip
- * buffer
- * @dst: XRGB2101010 destination buffer (iomem)
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @vaddr: XRGB8888 source buffer
+ * drm_fb_xrgb8888_to_xrgb2101010 - Convert XRGB8888 to XRGB2101010 clip buffer
+ * @dst: Array of XRGB2101010 destination buffers
+ * @dst_pitch: Array of numbers of bytes between two consecutive scanlines within dst
+ * @vmap: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * Drivers can use this function for XRGB2101010 devices that don't natively
  * support XRGB8888.
  */
-void drm_fb_xrgb8888_to_xrgb2101010_toio(void __iomem *dst,
-					 unsigned int dst_pitch, const void *vaddr,
-					 const struct drm_framebuffer *fb,
-					 const struct drm_rect *clip)
+void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
+				    const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+				    const struct drm_rect *clip)
 {
-	drm_fb_xfrm_toio(dst, dst_pitch, 4, vaddr, fb, clip, false,
-			 drm_fb_xrgb8888_to_xrgb2101010_line);
+	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+		0, 0, 0, 0
+	};
+
+	if (!dst_pitch)
+		dst_pitch = default_dst_pitch;
+
+	if (dst[0].is_iomem)
+		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
+				 clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
+	else
+		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
+			    clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
 }
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010_toio);
 
 static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
@@ -628,8 +636,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		}
 	} else if (dst_format == DRM_FORMAT_XRGB2101010) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_xrgb8888_to_xrgb2101010_toio(dst[0].vaddr_iomem, dst_pitch[0],
-							    vmap[0].vaddr, fb, clip);
+			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, vmap, fb, clip);
 			return 0;
 		}
 	}
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 8c633dbab5d6..6807440ce29c 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -29,9 +29,9 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip);
-void drm_fb_xrgb8888_to_xrgb2101010_toio(void __iomem *dst, unsigned int dst_pitch,
-					 const void *vaddr, const struct drm_framebuffer *fb,
-					 const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
+				    const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+				    const struct drm_rect *clip);
 void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
 			      const struct drm_framebuffer *fb, const struct drm_rect *clip);
 
-- 
2.37.1

