Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0759F1688B3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4474D6F544;
	Fri, 21 Feb 2020 21:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781506F531
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:03:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id u6so3559611wrt.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jfKWZZU6Yo+Zwjdd+Cefvuzj8Pr73ZnaVy/LVnilzqI=;
 b=bRcFNSGcJ0GbNy4AQUm+iJKRR5RlxRTnzHWWWzV8bB2qvUoUbwJEFzAb4YC6PQtc1t
 7C0+7vOf1QtNRJ2yqC8Xl2rCSEUURlLBjHL76owUR90MCv3t1yM1m12dSdm0makPrrHp
 2IoXN4Ye+zXkLbyd/K9J39zSIR2uNsOuY1640=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jfKWZZU6Yo+Zwjdd+Cefvuzj8Pr73ZnaVy/LVnilzqI=;
 b=GDeCfdkMkIUtoegDEuEIZ5NggacRxMmUzug6U4YHAtGzFYJEfQ4qwJ5WoLgLBsrBtU
 6z5AdWaIEPwp5lBASh3kpmoNyc32OpceIp9i1Wgoiwxb5AheauugoYujhEbLC3C/+aIo
 nLqSyMiJm1AnxmTlISIX8dV0sy4JJVA+m3cH7e2YRez7ww7dQSyzKBdAu+RQI2VHgY/Z
 bGglBm7MT81pxpd1lCy0j2H5/IqWZ5Q1D+exjOJNjQ2A5rdisxHWh4jxd5ookz+zF/b5
 HWguw3XRq07pj48XkeF09iJx+fg8lAwVoYkvQbYOFBaNS8xDUBKm1dAn7coPZf5UVn7Z
 h3Lw==
X-Gm-Message-State: APjAAAUhM27xbMNJPWIp4LUoGGyTeGSukmr0EktA7y9i+zJL+9HtHcTl
 tdxEza/eGetK933hJgU3t74S2KJRXkQ=
X-Google-Smtp-Source: APXvYqyzrMi2ROtAfdIlgbylKaoeHtR5Ts6udb0KEliPEhi2azE7M6n/pXPR7HWKCjyuczZVjnXe1Q==
X-Received: by 2002:a5d:6292:: with SMTP id k18mr49905345wru.256.1582319027775; 
 Fri, 21 Feb 2020 13:03:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:03:45 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/51] drm/vkms: Use drmm_add_final_kfree
Date: Fri, 21 Feb 2020 22:02:42 +0100
Message-Id: <20200221210319.2245170-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

v2: After drm_dev_init/drmm_add_final_kfree we need to clean up
everything through a drm_dev_put. Rework the unwind code to match
that.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 860de052e820..2f35fe789343 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -21,6 +21,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -158,13 +159,14 @@ static int __init vkms_init(void)
 			   &vkms_device->platform->dev);
 	if (ret)
 		goto out_unregister;
+	drmm_add_final_kfree(&vkms_device->drm, vkms_device);
 
 	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
 					   DMA_BIT_MASK(64));
 
 	if (ret) {
 		DRM_ERROR("Could not initialize DMA support\n");
-		goto out_fini;
+		goto out_put;
 	}
 
 	vkms_device->drm.irq_enabled = true;
@@ -172,25 +174,25 @@ static int __init vkms_init(void)
 	ret = drm_vblank_init(&vkms_device->drm, 1);
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
-		goto out_fini;
+		goto out_put;
 	}
 
 	ret = vkms_modeset_init(vkms_device);
 	if (ret)
-		goto out_fini;
+		goto out_put;
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
 	if (ret)
-		goto out_fini;
+		goto out_put;
 
 	return 0;
 
-out_fini:
-	drm_dev_fini(&vkms_device->drm);
+out_put:
+	drm_dev_put(&vkms_device->drm);
+	return ret;
 
 out_unregister:
 	platform_device_unregister(vkms_device->platform);
-
 out_free:
 	kfree(vkms_device);
 	return ret;
@@ -205,8 +207,6 @@ static void __exit vkms_exit(void)
 
 	drm_dev_unregister(&vkms_device->drm);
 	drm_dev_put(&vkms_device->drm);
-
-	kfree(vkms_device);
 }
 
 module_init(vkms_init);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
