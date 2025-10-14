Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF18ABDB293
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 22:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CEC10E69B;
	Tue, 14 Oct 2025 20:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="XRXBBait";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="mtfEx+AW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D4C10E23E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 20:08:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-77p9.prod.antispam.mailspamprotection.com;
 s=arckey; t=1760472526; 
 b=VsIPpkEVszBN5uJBo1pSLg/+v9x2EuVSARMkiAMbUgSQFeBPIKZ0Dmhe0a2AvV+Jm5ebLNqbHz
 QbfaClSlon/TU6FLXrKofK7xhnXY092LLmhbdNlFmOezO7q060LfvS63TOoTbY3JhcGmWlcGkg
 uOoDh4heUvIfThIk5L5ehCsopBjfnFhUcdP4Qcf3b0VFUn+TCw9QgDHZRYvm8wHiNrrO/X4bII
 QzFiXnHzE5Zn6l8zoBCnK2bRi5Is6FImXvetXrAtsMKiQu31YTlBleFdm1ZSHlilQDTsulquf1
 TUb4NAZBx6ZV/PrN5DWnSF3QYgTHtQSyesmj3x/1Ewg1lw==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-77p9.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-77p9.prod.antispam.mailspamprotection.com;
 s=arckey; t=1760472526; 
 bh=+5BTWhpo8xFj/7SCEKOUmnd3xUn/bC/gIZT0lglYOj4=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=b8KOuskEZcG78QH/OW3bOlB4WwulDMfnE/2rDkLLLfF4q33ywHcdZgiBBM8serywEM6n39tOyz
 uDVwJBmee0BKe5KGVL6H9l/pU0FCjvvxoTc9PKxvDxs4jrZpdL5vTY/qT42OPXkypK5mX7Xf0h
 +ThOWTgDcmcN5fJPh0QBBlpv44PGWnpWbF/Ngday4db82aY66yDLa67EP+Okge0hOrLs3LkM8a
 j+9FpUTwZaTu9lApEFK4ebjVOimLkH6PThWjSTavWG+hcvxF9+rtXgsY4qWjWrzoynzrI/+40h
 BDv5rZJX+UuoByBLFtW4G8BniuztafmR3lLA2t3MaDEJEg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=HBceqnriX2pNnf/J/de0sHN1Yjm6AqD5B1qKy0hJKpA=; b=XRXBBaityTO9i9dXWE1Mx/Jyhu
 78VqjGMYoKVJ9m+GoNGWS4aMW0o3eM2+mfjEe24AsF6/ZJUtG32+684DsgsSf6N5cMgMqlDmgMH0t
 inYaAUo2J2qlJcAqAWyMqIVLBpBcQuUktcEt8IDTBRrWsh57AsEX7q8Bw1rLCjVOtd4Q=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-77p9.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1v8lK5-00000000idp-2qWC
 for dri-devel@lists.freedesktop.org; Tue, 14 Oct 2025 20:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=HBceqnriX2pNnf/J/de0sHN1Yjm6AqD5B1qKy0hJKpA=; b=mtfEx+AWlTgtZYJAewjC2/MU9a
 325ma9wmCvTP4adpo3kaJVWrF2cviKekHd6v0eYy4nB2WBjS+FrTcWKHXiymchFCyGcplWwGObcPe
 /2g0/sH0DK7ZLoAiiM23a0jijSDJ9dZgpDocaBEIfOuF915QJxfIlT8y6lvVyrJ8teJ4=;
Received: from [87.16.13.60] (port=64127 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1v8lJq-00000000E00-2SM1; Tue, 14 Oct 2025 20:08:26 +0000
From: Francesco Valla <francesco@valla.it>
Date: Tue, 14 Oct 2025 22:08:12 +0200
Subject: [PATCH v2 1/3] drm/draw: add drm_draw_can_convert_from_xrgb8888
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm_draw_conv_check-v2-1-05bef3eb06fb@valla.it>
References: <20251014-drm_draw_conv_check-v2-0-05bef3eb06fb@valla.it>
In-Reply-To: <20251014-drm_draw_conv_check-v2-0-05bef3eb06fb@valla.it>
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
X-SGantispam-id: 61044a556555b3aabef716d73dbb9058
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1v8lK5-00000000idp-2qWC-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-77p9.prod.antispam.mailspamprotection.com; 
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
 drivers/gpu/drm/drm_draw.c          | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_draw_internal.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
index 9dc0408fbbeadbe8282a2d6b210e0bfb0672967f..ccdd6b16e73fc01d58f45759cf3824be7aac155b 100644
--- a/drivers/gpu/drm/drm_draw.c
+++ b/drivers/gpu/drm/drm_draw.c
@@ -15,6 +15,35 @@
 #include "drm_draw_internal.h"
 #include "drm_format_internal.h"
 
+/**
+ * drm_draw_can_convert_from_xrgb8888 - check if xrgb8888 can be converted to the desired format
+ * @format: format
+ *
+ * Returns:
+ * True if XRGB8888 can be converted to the specified format, false otherwise.
+ */
+bool drm_draw_can_convert_from_xrgb8888(u32 format)
+{
+	switch (format) {
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGBA5551:
+	case DRM_FORMAT_XRGB1555:
+	case DRM_FORMAT_ARGB1555:
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_ABGR2101010:
+		return true;
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL(drm_draw_can_convert_from_xrgb8888);
+
 /**
  * drm_draw_color_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
  * @color: input color, in xrgb8888 format
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

