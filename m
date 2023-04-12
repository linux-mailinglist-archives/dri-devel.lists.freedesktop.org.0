Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2296DF772
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E34210E098;
	Wed, 12 Apr 2023 13:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF8E10E098
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681306817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0HQRCdB1bgAUVB6FMkn1ID72L+YmV2Ns1nrwv9UXGnk=;
 b=MzoJ/Pr+wmHDhaKvGsB/r2ce0H04TxrR0OUaxlUTVxdNjhFRZistlu3L8mGtWvlz5CL93J
 0DQ8GLG7hYBx2w8qLVaBFJ5lG7solgm7Yw5OyJcqjZK8UDwpIJylkVWIJw991kMO1+4za8
 0LfXif1RSz5MohYGjePUU39WtIo0R0U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-c3b7YUenMDe_JU6a6QvCDQ-1; Wed, 12 Apr 2023 09:40:14 -0400
X-MC-Unique: c3b7YUenMDe_JU6a6QvCDQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F737858289;
 Wed, 12 Apr 2023 13:40:14 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FBFA492C3E;
 Wed, 12 Apr 2023 13:40:13 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
Subject: [PATCH 2/2] drm/mgag200: Use 24bit format in VRAM
Date: Wed, 12 Apr 2023 15:39:12 +0200
Message-Id: <20230412133912.610294-3-jfalempe@redhat.com>
In-Reply-To: <20230412133912.610294-1-jfalempe@redhat.com>
References: <20230412133912.610294-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bandwidth between system memory and VRAM is very limited
on G200.
So when using a 32bit framebuffer on system memory, convert it to 24bit
when copying the frame to the VRAM, this allows to go 33% faster.
Converting the format on the fly is negligible, even on low end CPU.

small benchmark on my Dell T310:
1280x1024 32bits: ~125ms to transfert a single frame.
1280x1024 24bits: ~95ms

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 28 ++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index e3f0da338b95..a8d6b08bf959 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -289,6 +289,8 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 static u32 mgag200_calculate_offset(struct mga_device *mdev,
 				    const struct drm_framebuffer *fb)
 {
+	if (fb->format->format == DRM_FORMAT_XRGB8888)
+		return (fb->pitches[0] * 3) >> 6;
 	return fb->pitches[0] >> 4;
 }
 
@@ -314,17 +316,16 @@ void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_in
 	struct drm_device *dev = &mdev->base;
 	unsigned int scale;
 	u8 crtcext3, xmulctrl;
+	u8 cpp;
 
 	switch (format->format) {
 	case DRM_FORMAT_RGB565:
 		xmulctrl = MGA1064_MUL_CTL_16bits;
 		break;
+	case DRM_FORMAT_XRGB8888: /* use 24bit format in VRAM */
 	case DRM_FORMAT_RGB888:
 		xmulctrl = MGA1064_MUL_CTL_24bits;
 		break;
-	case DRM_FORMAT_XRGB8888:
-		xmulctrl = MGA1064_MUL_CTL_32_24bits;
-		break;
 	default:
 		/* BUG: We should have caught this problem already. */
 		drm_WARN_ON(dev, "invalid drm format\n");
@@ -346,8 +347,12 @@ void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_in
 	WREG_GFX(7, 0x0f);
 	WREG_GFX(8, 0x0f);
 
+	cpp = format->cpp[0];
+	if (cpp == 4) /* use 24 bit format in VRAM */
+		cpp = 3;
+
 	/* scale is the number of bytes per pixels - 1 */
-	scale = format->cpp[0] - 1;
+	scale = cpp - 1;
 
 	RREG_ECRT(3, crtcext3);
 	crtcext3 &= ~GENMASK(2, 0);
@@ -403,8 +408,19 @@ static void mgag200_handle_damage(struct mga_device *mdev, const struct iosys_ma
 {
 	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(mdev->vram);
 
-	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
-	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
+	if (fb->format->format == DRM_FORMAT_XRGB8888) {
+		/* use 24 bit format for VRAM, to save memory bandwidth,
+		 * converting on the fly is much faster than sending the bytes
+		 */
+		u32 dst_pitch[3] = {(fb->pitches[0] * 3) / 4,
+				    (fb->pitches[1] * 3) / 4,
+				    (fb->pitches[2] * 3) / 4};
+		iosys_map_incr(&dst, clip->y1 * dst_pitch[0] + clip->x1 * 3);
+		drm_fb_xrgb8888_to_rgb888(&dst, dst_pitch, vmap, fb, clip);
+	} else {
+		iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
+		drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
+	}
 }
 
 /*
-- 
2.39.2

