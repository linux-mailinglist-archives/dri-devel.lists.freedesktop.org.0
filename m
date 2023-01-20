Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6291F675B78
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C44310E004;
	Fri, 20 Jan 2023 17:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F13510E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 17:31:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so4234877wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=78W7IXXHqgUZh6eEXtc3i7yBwKfecEIjh9aXPYe7GEA=;
 b=SEm/NiYw03IrJVONYxj8S6CudMwJbwnQfEfMv8WLW+xrm/hl+XwebXhF8UgZukrwEQ
 jEv1Rtvs+sMjog6lwpKrVMWAdjWu010pPjDx+WW4QkKGsTndKABZNJiJ+rvtclb6RMVN
 M1Sd0fFcCG00kXHifJF8Msn4iIDPEsq7nastKIeqsyv0hPcKNsJUj6I8Pc0PtlL9kLSV
 H0r0Ruqec02yVK5SNpbCM0LfHjQmulKCvAOHPRZrK5qjSfYMW3ZONTLefeEtpIivMyLe
 fmo36tXCle53zltWf++reGaIShW4IzLLaZjB0x77h/FLc4I1R7UI2hjG4VwdOEfRQ32u
 vAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=78W7IXXHqgUZh6eEXtc3i7yBwKfecEIjh9aXPYe7GEA=;
 b=lmP4DL+2smL9sK+j+dS2OdZcGIUtsx20Cbz85ppdUOql6MBVCHdv3lZ4wme+C44I/n
 1zGNEeCDeRs18HNlIWM+3FwFK4VncfzdU31a6/RqPNBdcIKk0J8uYgqjOJGywSlY8AWU
 HN6L59rUJMuyTKwsux3d5zeDsEf1g2PoTzvc3EeTXREJlO96gZSEci+ENj3r2lsY43dc
 lzVEWxVh6pb3wAIIxrPaD8bLAo7utWoxE3XSKpUUm7R0t/cuR3IV5Zh/aa9WtvTOD+hp
 DZSMwKdKErDMUN0kFzmnS8UlXJn7y0ba/0sJKQqZmi67kbg2fCp9ZeGe6OZWJulVuhkm
 JKdg==
X-Gm-Message-State: AFqh2kp6s12P3XCdFDal65gedriNeysPH4Jje6U1ZamPWZbxGRXnPmwb
 NGizUm1ZQXZ95aw7s0Kul1I=
X-Google-Smtp-Source: AMrXdXvzEgbI7Tp8Tw5Ds4T0d245b1GQLC4LVo8SfXduEZQri0QCyUWQpHLjGRzU3haJg1/JO1ieQA==
X-Received: by 2002:a7b:cc14:0:b0:3da:50b0:e96a with SMTP id
 f20-20020a7bcc14000000b003da50b0e96amr15053406wmh.29.1674235872923; 
 Fri, 20 Jan 2023 09:31:12 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003d99da8d30asm3193070wmo.46.2023.01.20.09.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:31:12 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 6/8] drm/format-helper: Support the AB24/XB24 formats
Date: Fri, 20 Jan 2023 18:31:01 +0100
Message-Id: <20230120173103.4002342-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120173103.4002342-1-thierry.reding@gmail.com>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Add a conversion helper for the AB24 and XB24 formats to use in
drm_fb_blit().

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v4:
- rebased on top of latest drm-format-helper rework, add back AB24 support
- add Reviewed-by from Thomas

Changes in v3:
- rebase onto latest drm-next

Changes in v2:
- support XB24 format instead of AB24

 drivers/gpu/drm/drm_format_helper.c | 66 +++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 994f8fb71f45..f93a4efcee90 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -649,6 +649,66 @@ void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb8888);
 
+static void drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	__le32 *dbuf32 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	unsigned int x;
+	u32 pix;
+
+	for (x = 0; x < pixels; x++) {
+		pix = le32_to_cpu(sbuf32[x]);
+		pix = ((pix & 0x00ff0000) >> 16) <<  0 |
+		      ((pix & 0x0000ff00) >>  8) <<  8 |
+		      ((pix & 0x000000ff) >>  0) << 16 |
+		      GENMASK(31, 24); /* fill alpha bits */
+		*dbuf32++ = cpu_to_le32(pix);
+	}
+}
+
+static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
+					const struct iosys_map *src,
+					const struct drm_framebuffer *fb,
+					const struct drm_rect *clip)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		4,
+	};
+
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+		    drm_fb_xrgb8888_to_abgr8888_line);
+}
+
+static void drm_fb_xrgb8888_to_xbgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	__le32 *dbuf32 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	unsigned int x;
+	u32 pix;
+
+	for (x = 0; x < pixels; x++) {
+		pix = le32_to_cpu(sbuf32[x]);
+		pix = ((pix & 0x00ff0000) >> 16) <<  0 |
+		      ((pix & 0x0000ff00) >>  8) <<  8 |
+		      ((pix & 0x000000ff) >>  0) << 16 |
+		      ((pix & 0xff000000) >> 24) << 24;
+		*dbuf32++ = cpu_to_le32(pix);
+	}
+}
+
+static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
+					const struct iosys_map *src,
+					const struct drm_framebuffer *fb,
+					const struct drm_rect *clip)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		4,
+	};
+
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+		    drm_fb_xrgb8888_to_xbgr8888_line);
+}
+
 static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	__le32 *dbuf32 = dbuf;
@@ -868,6 +928,12 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		} else if (dst_format == DRM_FORMAT_ARGB8888) {
 			drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb, clip);
 			return 0;
+		} else if (dst_format == DRM_FORMAT_XBGR8888) {
+			drm_fb_xrgb8888_to_xbgr8888(dst, dst_pitch, src, fb, clip);
+			return 0;
+		} else if (dst_format == DRM_FORMAT_ABGR8888) {
+			drm_fb_xrgb8888_to_abgr8888(dst, dst_pitch, src, fb, clip);
+			return 0;
 		} else if (dst_format == DRM_FORMAT_XRGB2101010) {
 			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
 			return 0;
-- 
2.39.0

