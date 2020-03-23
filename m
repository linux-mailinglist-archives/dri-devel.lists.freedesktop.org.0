Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AF118F75D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72A16E1A8;
	Mon, 23 Mar 2020 14:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842E86E134
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b12so1951611wmj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H/yC9zcGVJQRMNkebHNAs39uCTPN4vaETvcX0k/sDfs=;
 b=WiGWKEbg7IxYAWAFHZy0x1BireoEP5hm+PhXXjlshO4EnSmews2rRM9FaSSrihvYce
 cJilZuG60Ve/WYAd0mKEwUXDWxXsIe4zvR9MkFM6qvwsCt6Qg7ZjQ2bFMB+MvUeV48Y6
 YlYPc7lD9tvsbRr+b2p4G9UgO6LUPMSYNDv7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/yC9zcGVJQRMNkebHNAs39uCTPN4vaETvcX0k/sDfs=;
 b=koHpe+4ZT/qSQOYQQ5SVHFyUPkBChrmnr6gtLSoXlswCbR7B3RWFN0fShv7UEPK4He
 ihfCqjB2MZ8CbifM/D+JGzQL4633XWzu9TmKWgXADoxwfPB89HOc/M+pu1Uk0yyldR6p
 fS11igi4cR0Fp3pdk2ouDIVMOBhzbAzPanqCrct04XpDWqoA4zRBwCjDplJCDKoCoUVz
 7UpU7wcBHTfk0/MDNsSrMUYZd7qu6RFRh2fzf6g/WRaf2b7nH5FwMsELBbOfe/2zlLpp
 VtMWG8NTtIdIIhA6/hRaFtUMZ/HW9USiw1LaMaoXHaQo4GJkzj6DNTmnpnXnQmydGvQW
 Y10w==
X-Gm-Message-State: ANhLgQ2TuzAwqxP03jiFvwwIOvTnbxzUSPPSpltKNIAh10bKKcqYBzBi
 NX4g7tJBARfW/RJRpG628UQfVOcUBSSL6g==
X-Google-Smtp-Source: ADFU+vvhZ83HwyPLL2HkEvEPHeQC7IvbaQqI2yxBOTjHzuvPYM28jniGbG/4RqjmoaXFmk9e1Z7rLA==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr12006696wmc.138.1584975015729; 
 Mon, 23 Mar 2020 07:50:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:15 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/51] drm/vkms: Use drmm_add_final_kfree
Date: Mon, 23 Mar 2020 15:49:13 +0100
Message-Id: <20200323144950.3018436-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Tested-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
