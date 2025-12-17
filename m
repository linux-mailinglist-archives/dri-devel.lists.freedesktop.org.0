Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B8DCC6AEA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 10:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C5E10E270;
	Wed, 17 Dec 2025 09:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="FR6/IP1b";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="jDh98vxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9CA10E270
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 09:02:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-8tzl.prod.antispam.mailspamprotection.com;
 s=arckey; t=1765962122; 
 b=zcd84AUC5cDv/pvK3U0iWN35KgQalP7tKEjAXlOon80pcD7pyMafNtq0yuT4UFjw9KBjVwOqt5
 wZ9z6Qc1GWqKO6XJ3+CEy6LSjvUosSRDm1LNpHkJiv0dZ8qYDIe/b5K8GxdCSV7YkrGcr6PAVY
 QaFkcQUK/fZ8ZwhF4lYTfzpoHru2CrYXA4t4onOlk0dAXymy9tbcjjnPmz5gKF9jlf0NPDnAB4
 km9G7toCWpo2FXfuUrVF2mNB56xxKp5UTA7B5muxWIc28MMC3apZLddRcIIaUwWjCX1X32iQ4d
 lBnS+rXD+v1AxD0gk4cNgOHN39eP612vtMg0igf/XSEzyw==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-8tzl.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-8tzl.prod.antispam.mailspamprotection.com;
 s=arckey; t=1765962122; 
 bh=3R2Fi+LMXSFAxxhMSgWy+NDD1j2U6w1AOA2qqvgyJ58=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=pBiQ/7+fHhRmQi6Q0VT92vVLkOCP7xZW+GYq6RrnLovCbxm/QJu7nhED9QOPCtHSobCyKrUCQi
 jbJqhL1aUu69buVZyiOu9387YYV9nd37fhvWxDlG7AqsNCclQOtZxbj1RBp5QxINeK/fX4k7L1
 TEW6iitBZM8GoHTtDfT5herOyMCJncKscEwW3TWgtsN5T9iemOTU4RZPTjtcc/NilCCjFhBvj4
 yuotnWlT6BnNvT6vkhR9oyZVFs1vhoHvYBb+IruhqeXBbBSEr6nTCmEYXRm5mruvRy+bdgKCPs
 sJM4x2aV3+HgBsmUYnx33+lzmYTwk/qmf1WnaTP5U5zW9w==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=1tihKt8uvSIfndhnOmOIg83PXG8YIJ50aUVeqkQLmRI=; b=FR6/IP1bqjA053slgDdSNWLnUp
 +EfvL+qPB0D6J1mF+FGjpO48SLw4t5pU1WUfqhBkBjWs8NcUVHNgSAabjHfVjJzEUOQhc3gdShxeV
 uM23oSkCZu/JIyWddvt2w4NKd+PjyLIo+EmhTU/oPLFzvCZKcijfIQK0mKUgE1hoASdY=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-fz0z.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vVma7-00000008l34-0w0G
 for dri-devel@lists.freedesktop.org; Wed, 17 Dec 2025 08:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=1tihKt8uvSIfndhnOmOIg83PXG8YIJ50aUVeqkQLmRI=; b=jDh98vxCaObQQ7chNsDdXZAegp
 +3uV6cxi74HNY6PgyqEwr6l1W+jD4lJo2MNM2mfY9lG2yPMFYMIfXiUWy8DqLLHLUkl3kQ5PU1c3G
 1AVioNlY1dZnKW7e+mp19OpIrGF8WjluULEC9hu7apqx6SRv/ZvECtJ5yoAs2Qy/COBs=;
Received: from [79.34.194.176] (port=63558 helo=[192.168.178.175])
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vVmZy-00000000ENx-3weV; Wed, 17 Dec 2025 08:08:14 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 17 Dec 2025 09:06:54 +0100
Subject: [PATCH v3 1/3] drm/draw: add drm_draw_can_convert_from_xrgb8888
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-drm_draw_conv_check-v3-1-15b6f8bc1cbc@valla.it>
References: <20251217-drm_draw_conv_check-v3-0-15b6f8bc1cbc@valla.it>
In-Reply-To: <20251217-drm_draw_conv_check-v3-0-15b6f8bc1cbc@valla.it>
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2291; i=francesco@valla.it;
 h=from:subject:message-id; bh=3R2Fi+LMXSFAxxhMSgWy+NDD1j2U6w1AOA2qqvgyJ58=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJlOKW+F6w40bOtkW/z4vsGKqKtOlrsvaRm0x6d1vuXQC
 f407UFIRykLgxgXg6yYIkvIuhv39sw1/5a2gfERzBxWJpAhDFycAjARdnGGfyZSmnt3uJ2/GLhz
 h0lO6CvOPQsnBghmRr7/eWYJ/8UN7z0ZGU57x5R/mnRNvvT7deVDSUrJzGHPFkjNje7zeXD6sEz
 tO04A
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 0e871d3a53ce0153e0cc39caa61e532e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vVma7-00000008l34-0w0G-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-8tzl.prod.antispam.mailspamprotection.com; 
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

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/gpu/drm/drm_draw.c          | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_draw_internal.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
index 5b956229c82fb6e232e3342705a226c8e14c8568..5043baf901b82e730cb7c3fe55aab99c91cd9fdf 100644
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
index 20cb404e23ea6263b535ea2b81b25f84c37be8a2..2619671456359efa3406a480890a0b5ac63dd9ea 100644
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
2.52.0

