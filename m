Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B96164182
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4BD6EB30;
	Wed, 19 Feb 2020 10:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A696EB3D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:49 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a9so6139146wmj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Awh1scCBZDnbimNWmMKzFzKs8NB+SPqvHt1ZzjCLXAI=;
 b=FmvyzuSl+pmrkYjBI0DeBrdSGOIE1lfL7FXOjhs/m+oB8RasJiMok7FRdA1KwrxNk7
 AFA9L1n2UDW8INzF8mWugQlol2Q1DSGzq7r83MaWOn8J1uvEwuJkkP5JCY7hIxnj6aKl
 fS0McxE6pQS2oEA0AfnRd14do/Z+NPGClHnWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Awh1scCBZDnbimNWmMKzFzKs8NB+SPqvHt1ZzjCLXAI=;
 b=g2czl2Hgt0pRx+71ivZzJxwFPbJLcyETBXnxF5clo2nOOjb8vm/3KFhoBM/FukBR5y
 QjIAKtsnIZJQudIhaa+j0ma74yDnvhef/pv5YU+Mhj+8ucxI1fRAsJTarOj1E0pDt5ad
 +CKTh9Fzn1PzY9r73oHvC49tvkQDqEOyB55t4pbdJwAlQDO01R/aTrVI9tGqHO1Tcqfk
 ULOs3y6h7mNMtKMHC16v9kCet5Z1crzZfPXnngPm+A9VJBmOGg7LHnOK4utELHZvzRD0
 WcIsHYgTPmz098cqY3e+xZvb7ieLU9UU2EY79Zbl2GyEWsNLpbaRD6WNk0LOEQ2D4cHa
 xktA==
X-Gm-Message-State: APjAAAUGoEyDrzskOc/nr2Ganq/X0B/H+fe1GbZtBj8HE02K4EhCuvv3
 wdqsjvdJzVwDfIXS8KruFx16akSbfoQ=
X-Google-Smtp-Source: APXvYqx2SvHJQwuUcvRrt4QP5p4B0FlZZeW3EYRcYR9yNJMPIuCmhlKP3LfR87UDeWPB8Nt74GVMww==
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr8890698wme.153.1582107707851; 
 Wed, 19 Feb 2020 02:21:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:47 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/52] drm/vgem: Use drmm_add_final_kfree
Date: Wed, 19 Feb 2020 11:20:44 +0100
Message-Id: <20200219102122.1607365-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

v2: After drm_dev_init/drmm_add_final_kfree we need to clean up
everything through a drm_dev_put. Rework the unwind code to match
that.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Eric Anholt <eric@anholt.net>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 909eba43664a..7486014e9149 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -39,6 +39,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_prime.h>
 
 #include "vgem_drv.h"
@@ -432,8 +433,6 @@ static void vgem_release(struct drm_device *dev)
 
 	platform_device_unregister(vgem->platform);
 	drm_dev_fini(&vgem->drm);
-
-	kfree(vgem);
 }
 
 static struct drm_driver vgem_driver = {
@@ -489,16 +488,19 @@ static int __init vgem_init(void)
 			   &vgem_device->platform->dev);
 	if (ret)
 		goto out_unregister;
+	drmm_add_final_kfree(&vgem_device->drm, vgem_device);
 
 	/* Final step: expose the device/driver to userspace */
-	ret  = drm_dev_register(&vgem_device->drm, 0);
+	ret = drm_dev_register(&vgem_device->drm, 0);
 	if (ret)
-		goto out_fini;
+		goto out_put;
 
 	return 0;
 
-out_fini:
-	drm_dev_fini(&vgem_device->drm);
+out_put:
+	drm_dev_put(&vgem_device->drm);
+	return ret;
+
 out_unregister:
 	platform_device_unregister(vgem_device->platform);
 out_free:
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
