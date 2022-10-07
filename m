Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B975F784C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 14:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391FF10E150;
	Fri,  7 Oct 2022 12:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDD310E109
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 12:50:02 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x59so6886785ede.7
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 05:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wrrrdznzTmRNvhxoL8SCZOK3Fq6gtgfxyHdbZJIJpnI=;
 b=CkS5WkwEuoScpkTqN/Vnex7SlTDJjmWf8ltwebDjzw/VuWw6FVU7zF8K5ztXKpeuba
 VS1xLXVshPj027dWbHUZcdS/Aqx0YvMDxeIjfjHni3JIso4h78Mljcc0v0+l6D8Pm4Le
 VGmDOswL/xq5CRRDXKCfl+Aqf6V8vsdF/NPHf5W3i9dV0QAzTQglQQCgEZzqWYbsCBCa
 GOcyi/3tT8Y/uHBoBWAKNAucE58ejBXYje4E1xJqCgs8sajAvLiDvVZQsQrdC3RFEbjm
 11KxxuYoUM9uTPdeC3H1SPsWAanvMaQbQc0LS5VqUp9Q007tc7b90A+9HyDdizP7qpsw
 zFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wrrrdznzTmRNvhxoL8SCZOK3Fq6gtgfxyHdbZJIJpnI=;
 b=171HZpmPJkbDU4GXzhsazj77XLocXMl18dIBGnM96ftiCarxZm8ooEwei3HOwHT0gC
 wGjnd4U5l9hyREnFzsaARTAnQzg36XC5h2dnPu/0/R0IXMVnZoA0n15/rFbZTKZQFrNM
 40bjOrWgsBx8F6QITkYvQWjrTYGLsjHIlMxPgi1mw77sjCte4OYLnAC68Yp2MSshrm4D
 y1mPCq7vkKolLKceRjO7tge5SCFapYMM/5+/PswWn8BImBslUTaMO3C5zHQiswC90plJ
 vXmlH2OJ4HoaILsBuezlfa2b2cqARB9zhVZf7mQ4hXxquMg0e1m5c4x7t2VvtD4tiqCY
 MTqg==
X-Gm-Message-State: ACrzQf3edf9KIOPf1PwcyjZ1LIp9qb4M0liLLRZTJsGdtJAW1nbGyxfh
 mOpzCgWtgUhkCwxupEO2ab4=
X-Google-Smtp-Source: AMsMyM4k7Cw2VvtfHOta0Uf/xqpK0XGradDOXq7931skX0AqQ8CW2YMP4qvBGzzeZu89rWX/O1LqSg==
X-Received: by 2002:a05:6402:35d4:b0:459:348d:a7ac with SMTP id
 z20-20020a05640235d400b00459348da7acmr4514891edc.149.1665147002327; 
 Fri, 07 Oct 2022 05:50:02 -0700 (PDT)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 mf22-20020a1709071a5600b0074136cac2e7sm1183617ejc.81.2022.10.07.05.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 05:50:01 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 5/7] drm/format-helper: Support the XB24 format
Date: Fri,  7 Oct 2022 14:49:44 +0200
Message-Id: <20221007124946.406808-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007124946.406808-1-thierry.reding@gmail.com>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Add a conversion helper for the XB24 format to use in drm_fb_blit().

v2: support XB24 format instead of AB24

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/drm_format_helper.c | 37 +++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index e2f76621453c..8a7c200ecba9 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -503,6 +503,36 @@ static void drm_fb_rgb888_to_xrgb8888(struct iosys_map *dst, const unsigned int
 		    drm_fb_rgb888_to_xrgb8888_line);
 }
 
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
+		      0xff << 24;
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
@@ -646,6 +676,8 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		fb_format = DRM_FORMAT_XRGB8888;
 	if (dst_format == DRM_FORMAT_ARGB8888)
 		dst_format = DRM_FORMAT_XRGB8888;
+	if (dst_format == DRM_FORMAT_ABGR8888)
+		dst_format = DRM_FORMAT_XBGR8888;
 	if (fb_format == DRM_FORMAT_ARGB2101010)
 		fb_format = DRM_FORMAT_XRGB2101010;
 	if (dst_format == DRM_FORMAT_ARGB2101010)
@@ -673,6 +705,11 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 			drm_fb_rgb565_to_xrgb8888(dst, dst_pitch, src, fb, clip);
 			return 0;
 		}
+	} else if (dst_format == DRM_FORMAT_XBGR8888) {
+		if (fb_format == DRM_FORMAT_XRGB8888) {
+			drm_fb_xrgb8888_to_xbgr8888(dst, dst_pitch, src, fb, clip);
+			return 0;
+		}
 	} else if (dst_format == DRM_FORMAT_XRGB2101010) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
 			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
-- 
2.37.3

