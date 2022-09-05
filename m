Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB45F5AD793
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A3A10E45F;
	Mon,  5 Sep 2022 16:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8CD10E454
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:33:14 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id fy31so18089813ejc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uXTNuaFFOdggI8omSyQsRBaLji6UVsxiw3E8D64RifU=;
 b=SU4g2xDsRRT5Lge5vVMmNdkIdi4Wx4rY2Jb7B1+kjyC4IpWuOpuOCa7gRbYVenGOqc
 ++w7MZB8ca0gPiv0BO9nKcBCNcIiFskMgKUW0ebaktr8VtrAXbZRIOYdJ250PFxLH9pP
 60JLW5enypDB+cXUWpI0rU9y5l8fM7o3T1ruXz2M7jrNImzmZSBait5oF7eL8O+zpHE0
 0y0hpo70sVIv8NuDYDm3HN2+0ZPL/SYdfFQeJkk7t8LpWOBST1G32pX4RE4qDucpPE3K
 oBd59M245Od28432MMfhQjZlO4IAugqgUT5o3Uk7y8kQWztfPoU/a2A2jYcru52fOqjd
 8wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uXTNuaFFOdggI8omSyQsRBaLji6UVsxiw3E8D64RifU=;
 b=0PG18lbnGEEUsoxaUb8kqPwamoZLPUJSTnS0eBPgMUOJH42AmEnSbd4gWvdPiS1VnB
 W2Z7IXj6Zg+GNYBLF1cuWPQ2TgoTwq4T1DHh1wKRf+wO39mJWAC1vTG2xp+qL/ZxnJij
 Ok8r8HcUr+sIj05oq+GDW3MS8UdO9g9oFERgU4oQkKux7a0EFuI0pokkskY7/Ghm4DGK
 xGm+RZJikbw2Wg4iKUxYXJi7m1AoNI7VDccwLdt83BVplYoMA/JXUoIDI5R+yirPakmL
 h/RZr6wcyhBYAKg+TcTGTA1f2YjW88i69SuquzFp8+3Db/cEvImEa1UBROwUPOUFyHi1
 BDMQ==
X-Gm-Message-State: ACgBeo1L+uqpdiymu2TCRyho/7IEWNrhIlvW9YLjTuT+LFNzxl77/u85
 3zSnwXNz1SLULEGdpaG7CI4=
X-Google-Smtp-Source: AA6agR6uI3+HR0n8gdjr49biODWamP0NUzQ2iqhGF7LaoQmgLEoRg/Ki4VZBma74UqlsYDxX034kPg==
X-Received: by 2002:a17:906:7315:b0:741:5b1b:920d with SMTP id
 di21-20020a170906731500b007415b1b920dmr28665181ejc.484.1662395593082; 
 Mon, 05 Sep 2022 09:33:13 -0700 (PDT)
Received: from localhost
 (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a056402400200b0043a61f6c389sm6752395eda.4.2022.09.05.09.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 09:33:12 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 4/6] drm/format-helper: Support the AB24 format
Date: Mon,  5 Sep 2022 18:32:58 +0200
Message-Id: <20220905163300.391692-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905163300.391692-1-thierry.reding@gmail.com>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
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
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Add a conversion helper for the AB24 format to use in drm_fb_blit().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/drm_format_helper.c | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 56642816fdff..d564412a816b 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -503,6 +503,36 @@ static void drm_fb_rgb888_to_xrgb8888(struct iosys_map *dst, const unsigned int
 		    drm_fb_rgb888_to_xrgb8888_line);
 }
 
+static void drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	__le32 *dbuf32 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	unsigned int x;
+	u32 pix;
+
+	for (x = 0; x < pixels; x++) {
+		pix = le32_to_cpu(sbuf32[x]);
+		pix = ((pix & 0xff000000) >> 24) << 24 |
+		      ((pix & 0x00ff0000) >> 16) <<  0 |
+		      ((pix & 0x0000ff00) >>  8) <<  8 |
+		      ((pix & 0x000000ff) >>  0) << 16;
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
 static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	__le32 *dbuf32 = dbuf;
@@ -672,6 +702,11 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 			drm_fb_rgb565_to_xrgb8888(dst, dst_pitch, src, fb, clip);
 			return 0;
 		}
+	} else if (dst_format == DRM_FORMAT_ABGR8888) {
+		if (fb_format == DRM_FORMAT_XRGB8888) {
+			drm_fb_xrgb8888_to_abgr8888(dst, dst_pitch, src, fb, clip);
+			return 0;
+		}
 	} else if (dst_format == DRM_FORMAT_XRGB2101010) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
 			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
-- 
2.37.2

