Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96748BB9CE3
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 22:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC6310E09D;
	Sun,  5 Oct 2025 20:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="QKSSzaIn";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="gunbTzzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD8689580
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 20:22:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-68s4.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759695734; 
 b=T0HBqC588a0SwAIJksyYsamWId8iRm7QGg1s64hUqNat5WsJLsaXgxme2Gz/x10/9NEA/7MwHu
 h9YFiusMKqY+FmnWmB/P+3Cd72Jt5JbCxW95tdOkZnEi7daI0BsVuCxImM0DlxjBVC7Uu5GkNK
 J1mAOY7PBo6NZ+hau8u6vdU8OzxTd0ymB8zCmKGVKtrQ95SQr/WXZeqVb5KgIqGNqQHfYMHzQv
 MSkLJRjLvmN0PrX6qB1VMfhmFG4g/uLPZV6U21H3OGn9GL29hQEwgLYju/8dRcuzLYqaphunWS
 WDZEfFWUrY60Npa2x8xpXip+7xJ9UEGrU4AxrZQk4QLDTw==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-68s4.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-68s4.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759695734; 
 bh=DMujsWVb0XBsms7mI+BZ4jG8OwIgPWKdo+JBJu5h68M=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=OUECj9B+XT/ZcqvhfIPvg5UztKeSLugDHAC1LcSfd8ICAGwtk4JVSjqL3Ti/AdypQUwurB4Ov2
 SFFkLhTPsR5oYNd1i+ZF2tGftR/nnLKjzAxC+Qyk/LI7+760Tbq2b+QORWTSNKwO8aJJ4kPMnL
 csap/kjLwYJ0h2gZpZNtzcAkyH7pHTtCJmtjdM6JCBIZfpmtP/FQqkTvzrNWuK9XwUr4FtyOrZ
 Cgh4JerDPoWdDe83U1ZK56mK4S4wShnXd2RoYjpZpVISYuZMclcjGce3YL7cuwLDA+9U3FS7Mo
 jGiemc72zBkXi1MENS1z9Ij1IkMK0JMc4YU4U7dwgt7SRQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=ab/UoitdFlXPH53JKWWYVjj8RBffXVQrAXU9vps/ES0=; b=QKSSzaInXAV6ToFS3jEJaRIs04
 lynrbiS6A4iKRlVzVtQTx+kEvVK2heuwOJBXfEAhtI2gKtjBVMOAeX6LC+reVWnooTzSC16VuKqSp
 uGymqH9jYDyrZTQB80WIGdiHBBxhlxRTqJp8uFGAJOST3H1wzEtohkPM3CwZHi7lJ1zM=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-68s4.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1v5VFB-0000000FIJM-3rPM
 for dri-devel@lists.freedesktop.org; Sun, 05 Oct 2025 20:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=ab/UoitdFlXPH53JKWWYVjj8RBffXVQrAXU9vps/ES0=; b=gunbTzzondc57kzWj29s1Tz4aA
 5664+ptkekCB0xBm4HZX1kmnb6QTRDH8TXyQM+c11XmLKwHRuThhC+hJZRXkQnEGvgTMAHAioBRNb
 Sw0f3GZkfYkcXwLP1ljHKzd6qpo0u4Q1Ypzi0ue7Sgtzrc/G3tTH2aewTbV/uWy7PfFA=;
Received: from [87.16.13.60] (port=64461 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1v5VEu-000000001im-416r; Sun, 05 Oct 2025 20:21:53 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sun, 05 Oct 2025 22:21:34 +0200
Subject: [PATCH 1/3] drm/draw: add drm_draw_can_convert_from_xrgb8888
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251005-drm_draw_conv_check-v1-1-9c814d9362f6@valla.it>
References: <20251005-drm_draw_conv_check-v1-0-9c814d9362f6@valla.it>
In-Reply-To: <20251005-drm_draw_conv_check-v1-0-9c814d9362f6@valla.it>
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 894b6a73cbce1e354845af593ec0607c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1v5VFB-0000000FIJM-3rPM-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-68s4.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

Add drm_draw_can_convert_from_xrgb8888() function that can be used to
determine if a XRGB8888 color can be converted to the specified format.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/gpu/drm/drm_draw.c          | 84 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/drm_draw_internal.h |  2 +
 2 files changed, 63 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
index 9dc0408fbbeadbe8282a2d6b210e0bfb0672967f..2641026a103d3b28cab9f5d378604b0604520fe4 100644
--- a/drivers/gpu/drm/drm_draw.c
+++ b/drivers/gpu/drm/drm_draw.c
@@ -15,45 +15,83 @@
 #include "drm_draw_internal.h"
 #include "drm_format_internal.h"
 
-/**
- * drm_draw_color_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
- * @color: input color, in xrgb8888 format
- * @format: output format
- *
- * Returns:
- * Color in the format specified, casted to u32.
- * Or 0 if the format is not supported.
- */
-u32 drm_draw_color_from_xrgb8888(u32 color, u32 format)
+static int __drm_draw_color_from_xrgb8888(u32 color, u32 format, u32 *out_color)
 {
 	switch (format) {
 	case DRM_FORMAT_RGB565:
-		return drm_pixel_xrgb8888_to_rgb565(color);
+		*out_color = drm_pixel_xrgb8888_to_rgb565(color);
+		break;
 	case DRM_FORMAT_RGBA5551:
-		return drm_pixel_xrgb8888_to_rgba5551(color);
+		*out_color = drm_pixel_xrgb8888_to_rgba5551(color);
+		break;
 	case DRM_FORMAT_XRGB1555:
-		return drm_pixel_xrgb8888_to_xrgb1555(color);
+		*out_color = drm_pixel_xrgb8888_to_xrgb1555(color);
+		break;
 	case DRM_FORMAT_ARGB1555:
-		return drm_pixel_xrgb8888_to_argb1555(color);
+		*out_color = drm_pixel_xrgb8888_to_argb1555(color);
+		break;
 	case DRM_FORMAT_RGB888:
+		fallthrough;
 	case DRM_FORMAT_XRGB8888:
-		return color;
+		*out_color = color;
+		break;
 	case DRM_FORMAT_ARGB8888:
-		return drm_pixel_xrgb8888_to_argb8888(color);
+		*out_color = drm_pixel_xrgb8888_to_argb8888(color);
+		break;
 	case DRM_FORMAT_XBGR8888:
-		return drm_pixel_xrgb8888_to_xbgr8888(color);
+		*out_color = drm_pixel_xrgb8888_to_xbgr8888(color);
+		break;
 	case DRM_FORMAT_ABGR8888:
-		return drm_pixel_xrgb8888_to_abgr8888(color);
+		*out_color = drm_pixel_xrgb8888_to_abgr8888(color);
+		break;
 	case DRM_FORMAT_XRGB2101010:
-		return drm_pixel_xrgb8888_to_xrgb2101010(color);
+		*out_color = drm_pixel_xrgb8888_to_xrgb2101010(color);
+		break;
 	case DRM_FORMAT_ARGB2101010:
-		return drm_pixel_xrgb8888_to_argb2101010(color);
+		*out_color = drm_pixel_xrgb8888_to_argb2101010(color);
+		break;
 	case DRM_FORMAT_ABGR2101010:
-		return drm_pixel_xrgb8888_to_abgr2101010(color);
+		*out_color = drm_pixel_xrgb8888_to_abgr2101010(color);
+		break;
 	default:
-		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
-		return 0;
+		return -1;
 	}
+
+	return 0;
+}
+
+/**
+ * drm_draw_can_convert_from_xrgb8888 - check if xrgb8888 can be converted to the desired format
+ * @format: format
+ *
+ * Returns:
+ * True if XRGB8888 can be converted to the specified format, false otherwise.
+ */
+bool drm_draw_can_convert_from_xrgb8888(u32 format)
+{
+	u32 out_color;
+
+	return __drm_draw_color_from_xrgb8888(0, format, &out_color) == 0;
+}
+EXPORT_SYMBOL(drm_draw_can_convert_from_xrgb8888);
+
+/**
+ * drm_draw_color_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
+ * @color: input color, in xrgb8888 format
+ * @format: output format
+ *
+ * Returns:
+ * Color in the format specified, casted to u32.
+ * Or 0 if the format is not supported.
+ */
+u32 drm_draw_color_from_xrgb8888(u32 color, u32 format)
+{
+	u32 out_color = 0;
+
+	if (__drm_draw_color_from_xrgb8888(color, format, &out_color))
+		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
+
+	return out_color;
 }
 EXPORT_SYMBOL(drm_draw_color_from_xrgb8888);
 
diff --git a/drivers/gpu/drm/drm_draw_internal.h b/drivers/gpu/drm/drm_draw_internal.h
index f121ee7339dc11537f677c833f0ee94fe0e799cd..2ab4cb341df94fc4173dd6f5e7a512bdcfa5e55c 100644
--- a/drivers/gpu/drm/drm_draw_internal.h
+++ b/drivers/gpu/drm/drm_draw_internal.h
@@ -24,6 +24,8 @@ static inline const u8 *drm_draw_get_char_bitmap(const struct font_desc *font,
 	return font->data + (c * font->height) * font_pitch;
 }
 
+bool drm_draw_can_convert_from_xrgb8888(u32 format);
+
 u32 drm_draw_color_from_xrgb8888(u32 color, u32 format);
 
 void drm_draw_blit16(struct iosys_map *dmap, unsigned int dpitch,

-- 
2.51.0

