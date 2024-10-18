Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD619A482E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 22:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E74310E984;
	Fri, 18 Oct 2024 20:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ixq2X3oO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7055010E984
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 20:35:36 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539e5c15fd3so2468576e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 13:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729283734; x=1729888534; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DkSqDVM+OnjF+v0+0ZQEDga6Q+ZMXwj1q1eJK3kt87E=;
 b=Ixq2X3oOPB2NNA7RQLviUmGBvwjYgnSGDj3zpnb0ZF8Mz+uGPzKrKjvk03cJac4rSE
 J/koEHR/vriRBBw2uSYM7JNFcTQlF2m6Us0bIQRHoVtmpd7E5K27ywxcG6GrsxwwNRcw
 vgAndte7+2R18YEvGz584rYHa3X+uz60UIkK5sR4JZHhQRmfkG0jTejSIe9u2JiqVoXS
 GqN0UXhp9UsMWMoSk6t+ULCFtEHwtqwmRn2g9W1CQMGBX+R6lx0e66JjGkoR/D3QCgRx
 QKG7CW1eCFOV/PzSBQTrDfqg48mEgy7I7pa19wrpzbJzKP8Wml4fIwuSmtbrv7Sjw/v2
 JGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729283734; x=1729888534;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DkSqDVM+OnjF+v0+0ZQEDga6Q+ZMXwj1q1eJK3kt87E=;
 b=DmR5bmexHDsIgDHJ/zJGFDDYaWsx13Bm8yNjPMoZrwqc05qEFH+9rjfXwIr082bUUM
 LDCZZR0aiUvQRqca/pn7Rsip3xJ5YzeG45NBO0L0opcyu1FIS2LqYilqDlQsx9rUzW3u
 wDg//Qu2Em8Uf7uV7cqCatNT6XSCI2JDcTllAujW1FAeCULU/XaO94auOxWZS7JWP+Gx
 mrrIaRG51Z0xrD/uLL9/0Rc8eb6O4uTWO6rWq5BraLm5bX1azc9g1o03jGVP/wr1Tj5h
 +f1tIn8NAtyHxRXMRHrdWIX9Q00hUyPjGxRVMPXzWezx5P1y9JppjDosD2IZQggCpkbS
 fDgQ==
X-Gm-Message-State: AOJu0YxD1+5H4Z+NiVCYmX1MIxFBD3EGZ6zdcyg1pKO14X5sMZHEWedv
 4A0L6R95RvzOXOfHlFRwi7Xqf16YO3A1qaKo+mPIFB74L47oauXrtHxPVpyDqkg=
X-Google-Smtp-Source: AGHT+IHzYkuJZ6He3xwlqBtuptVarSRmqR+0hl1ibW2ueCQLRNIsql9cH5DCivezs4UNKzkdg1gvbg==
X-Received: by 2002:a05:6512:3a93:b0:539:8df0:4d3f with SMTP id
 2adb3069b0e04-53a15445cefmr2551963e87.40.1729283734514; 
 Fri, 18 Oct 2024 13:35:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a152044adsm319315e87.193.2024.10.18.13.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 13:35:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 23:35:30 +0300
Subject: [PATCH] drm/fbdev: fix drm_fb_helper_deferred_io() build failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-fix-drm-deferred-v1-1-c33bf5d209b0@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJHGEmcC/x2MQQqAMAzAviI9W1hFpvMr4mFsVXtwSgciyP7u8
 BhI8kJmFc4wNS8o35LlTBWobSDsPm2MEitDZ7qeDI24yoNRD4y8sipHNBScczbQ4C3U7FKuzr+
 cl1I+kvcAz2IAAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pKk163LMDVj6v54mfPGIRdSC85Ls7fSRSTyM5dZXEbA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEsaU4LCIhqwK2qU4tiDA2tygruguQJdK+imJc
 t/DCOHd0JeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLGlAAKCRCLPIo+Aiko
 1SrhCACLFFYBzpvpksP0UsaEaxLJSu1Llqw2vqRrWTtntnAKSGUVGkj4rugWxIq6348zsbxSTBL
 8wp9JGXOm8Nz39ST3FBJEwIIrAtU6+yjVQvpmAE9cBrubxYTYI4JwheotPmBWy7xdF7DrY0rsjt
 G4iXtAjowJZE64QFkikieA+I3yB/n6pz7Kp2rO3n3mIOE/gO/NsgoXeSe/g0VQ2nOQI90R8wjoG
 X/heHdaoZv+D7GE93f4zcHJ5P4Ti4XhjgCV9d5FcgQf5w4/688TY1sX1yOWT28CqQKAU56tgSSI
 f5FoRwwvkz/pKtLVGuo4eQwPKi097e8MTD5vD5wJeiJhT4OA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The drm_fb_helper_deferred_io() uses struct fb_deferred_io_pageref,
which isn't available without CONFIG_FB_DEFERRED_IO. Put the function
under corresponding #ifdef to fix build failure if deferred I/O isn't
enabled.

Fixes: 8058944f5226 ("drm/fbdev: Select fbdev I/O helpers from modules that require them")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_fb_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d5e8994345bb..c9008113111b 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -697,6 +697,7 @@ void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u3
 }
 EXPORT_SYMBOL(drm_fb_helper_damage_area);
 
+#ifdef CONFIG_FB_DEFERRED_IO
 /**
  * drm_fb_helper_deferred_io() - fbdev deferred_io callback function
  * @info: fb_info struct pointer
@@ -740,6 +741,7 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 	}
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
+#endif
 
 /**
  * drm_fb_helper_set_suspend - wrapper around fb_set_suspend

---
base-commit: 2063ca42486bc07b49bc145b5dfcb421f4deebaf
change-id: 20241018-fix-drm-deferred-01c9996c17a6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

