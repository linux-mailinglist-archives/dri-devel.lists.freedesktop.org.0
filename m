Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130F787DF25
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 19:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0269D10F117;
	Sun, 17 Mar 2024 18:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kz8ZOJBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB57710E625
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 18:02:25 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d2509c66daso51806641fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 11:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710698544; x=1711303344; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=77+d/aGXZdxhiUIc4X6IkmC/hLm4q/v2prNmd9Qfe+M=;
 b=kz8ZOJBfBc78lPuxBkl2k6UWQ9O+gSodnfwzyEVtWvggcrHr9nQaMYPO6mr1zcgS2m
 dyR2hYnuh7vYqkLRLmf4as2z1J6Qh6msF9hMxlsvRbbJopcprfp5YqlvDCvQwbS3e1gU
 9KISxWsefKTveVpCA4w2I6gqGzgIooJ3Q3mzov5APuxmcqytnmMomvkz/7TWdSUeQxcF
 tCvwNAypgJGXnR3TTL+oeV2GH7JbuAWEMj2+0HtA8LCuZ4vN5ovW6CK3O8N7Y5jkIaCl
 rBVF7EmBvEk3ldrO1fqdGDJQc4eMlpEPf4DSScHDNxU2DQ5K2g5NNQwFmf5KCj0h/79y
 /QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710698544; x=1711303344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=77+d/aGXZdxhiUIc4X6IkmC/hLm4q/v2prNmd9Qfe+M=;
 b=keuuK6gn6SsJYrUyKdq4pL8Th+yH31bbjYPXamF9AZWAElmkvOHL0VmX70eJu9k2Kq
 S/FPhWwp44aCMXHsdwZx9wRa7X5FJ8Ooz4bCPqxGIqT+ucYAXpWcQGGwyBr2MgKsweVY
 k6OyGecbN8oYxyuM2nfzA7bAW9g9HsvfeS/vd87iTLxir+ng4QI5pn+gQHlpSYBz0oCg
 DrqdL8oSj+dNVY4HdScHSatWrIDL7HrgzyYjY9RmDmJfR77U08mwPXErAWxn7pLM74bf
 r3powsUFh83PzsecHNarTtF0kiJEpwoCDr3ydcLuZZf39jPIPBeFmFOW+ZaPtcGvvNCc
 NiiQ==
X-Gm-Message-State: AOJu0Yz+IqB10jIk/SZdmxqYd/4RTdPGnARxUv21JIk3phR1l8IAhOlJ
 7S3+eN6iMCvi5VV/kc7glE2vZKpTrZ599qs48WET1N7gJhEVWywUyhpUQtFZy8k=
X-Google-Smtp-Source: AGHT+IFSRqBm97H2wrhw9FQv+wqTWFQSx3C8N0+1LjbPizm2KnCzgclN9zqpZvKmU9dWdDqHUxwzbw==
X-Received: by 2002:a2e:351a:0:b0:2d4:37ca:92d1 with SMTP id
 z26-20020a2e351a000000b002d437ca92d1mr6010901ljz.42.1710698543878; 
 Sun, 17 Mar 2024 11:02:23 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 m4-20020a2ea584000000b002d2e419d9besm1171685ljp.65.2024.03.17.11.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 11:02:23 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rlupy-000000005e0-4Bry; Sun, 17 Mar 2024 19:02:23 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 04/11] drm/exynos: Use drm_driver_legacy_fb_format() for fbdev
Date: Sun, 17 Mar 2024 19:01:29 +0100
Message-ID: <aa2e96d47d4465827fea0604089b698fe37d1550.1710698387.git.frej.drejhammar@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710698386.git.frej.drejhammar@gmail.com>
References: <cover.1710698386.git.frej.drejhammar@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to using drm_driver_legacy_fb_format() instead of
drm_mode_legacy_fb_format() to use the same logic as for the
DRM_IOCTL_MODE_ADDFB ioctl when selecting a framebuffer format.

Signed-off-by: Frej Drejhammar <frej.drejhammar@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

---

This is an evolved version of the changes proposed in "drm: Don't
return unsupported formats in drm_mode_legacy_fb_format" [1] following
the suggestions of Thomas Zimmermann.

[1] https://lore.kernel.org/all/20240310152803.3315-1-frej.drejhammar@gmail.com/
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index a379c8ca435a..d47bb5e89ff2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -104,8 +104,10 @@ static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
 	mode_cmd.width = sizes->surface_width;
 	mode_cmd.height = sizes->surface_height;
 	mode_cmd.pitches[0] = sizes->surface_width * (sizes->surface_bpp >> 3);
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-							  sizes->surface_depth);
+	mode_cmd.pixel_format =
+		drm_driver_legacy_fb_format(dev,
+					    sizes->surface_bpp,
+					    sizes->surface_depth);
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 
-- 
2.44.0

