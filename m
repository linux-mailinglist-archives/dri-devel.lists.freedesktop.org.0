Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700177D972B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 14:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE6610E986;
	Fri, 27 Oct 2023 12:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093DC10E986
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 12:05:02 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507b96095abso2878648e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 05:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698408300; x=1699013100; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hPBeFfhGzz7b9reukuJd9y/UBu4JJXA38Z99vzaShGU=;
 b=JJbE5ZtWhvaEmJY7XVh1qNNntFt4hBvc9UfIR53/Vj5jzUpWF43AUYCtfZslYJnpho
 yUhqLcAvdkBYncTIekNBeOncdiXnD2FpCubbp4+AgwtJoRLEEKzxSXMp4TiGeUEgGKv3
 7W2dvsStnVJ4UR69CgRoEWmsWecAYOq39QAe0xSxb7B4d6IaoKXRZhXW9jpkWO4mvLSD
 qSRhaODNKlUdDjaoGtPvoshzvELU5qgC6ng5WyhQEJ2cIxBOpZOH3N7DhHShPW4oiFeL
 h6PoGOKyrfXlMxICfUQPq6YiECZ8J03xHnjQ0o1TZSH/GskD0tcQVAiNwdLSKJP5kD7W
 9I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698408300; x=1699013100;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hPBeFfhGzz7b9reukuJd9y/UBu4JJXA38Z99vzaShGU=;
 b=SWv22xn/fLCSyk570KUwChy814xa3gLBO8HKav287WqkXX0Awvfad0UjpVhLhhwIgx
 459c8YjodWlleeKjZUtYv1fDUcK7/aVUcW+QgHL753iXPdVWcGKp1WY7Ls3W4zGpza/b
 XnL1mPUWWFlHoWx81aDVlI7AiaffgWOOqJ+pXl0o0uxoHa3L8UpWtuAV9+E/bKBvce82
 Who/znZH3qv7ZctI4aiWow/bHmqLjsE2egOcPQnfs0f2rkK+laoIE9Qsdmh24xaNLE82
 4pehu8TsK+rKcFn4XAbc/Pm3S/MggqMkmPDq70hy1E0O5Zm8/2fC3u9yuRDkX9tEr+hV
 3fHw==
X-Gm-Message-State: AOJu0YynAOVOyOiwswlHHTRNanCPC5Z1Kun59Ui1toeK7vSoN1vHX9Uo
 zjRqlEGfgrILSzrhkHc44J2OBw==
X-Google-Smtp-Source: AGHT+IE2TD3mcdg9qAax1VoYDY/yTuv41aG+a5xNuJLSiW9RCK7h0wL0oxjupUYN1A9aWv+pqg0YQQ==
X-Received: by 2002:a05:6512:2807:b0:502:d35b:5058 with SMTP id
 cf7-20020a056512280700b00502d35b5058mr2101718lfb.4.1698408300149; 
 Fri, 27 Oct 2023 05:05:00 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c19d200b00401b242e2e6sm4962968wmq.47.2023.10.27.05.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 05:04:59 -0700 (PDT)
Date: Fri, 27 Oct 2023 15:04:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 1/2] fbdev/imsttfb: fix double free in probe()
Message-ID: <014c0272-0d53-4625-8517-e8b4aa68f4dd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheng Wang <zyytlz.wz@163.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The init_imstt() function calls framebuffer_release() on error and then
the probe() function calls it again.  It should only be done in probe.

Fixes: 518ecb6a209f ("fbdev: imsttfb: Fix error path of imsttfb_probe()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/video/fbdev/imsttfb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index e7e03e920729..acb943f85700 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1421,7 +1421,6 @@ static int init_imstt(struct fb_info *info)
 	if ((info->var.xres * info->var.yres) * (info->var.bits_per_pixel >> 3) > info->fix.smem_len
 	    || !(compute_imstt_regvals(par, info->var.xres, info->var.yres))) {
 		printk("imsttfb: %ux%ux%u not supported\n", info->var.xres, info->var.yres, info->var.bits_per_pixel);
-		framebuffer_release(info);
 		return -ENODEV;
 	}
 
@@ -1453,14 +1452,11 @@ static int init_imstt(struct fb_info *info)
 	              FBINFO_HWACCEL_FILLRECT |
 	              FBINFO_HWACCEL_YPAN;
 
-	if (fb_alloc_cmap(&info->cmap, 0, 0)) {
-		framebuffer_release(info);
+	if (fb_alloc_cmap(&info->cmap, 0, 0))
 		return -ENODEV;
-	}
 
 	if (register_framebuffer(info) < 0) {
 		fb_dealloc_cmap(&info->cmap);
-		framebuffer_release(info);
 		return -ENODEV;
 	}
 
-- 
2.42.0

