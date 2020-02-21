Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8C1688B7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0DD6F531;
	Fri, 21 Feb 2020 21:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F556F525
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:03:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w15so3536307wru.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Awh1scCBZDnbimNWmMKzFzKs8NB+SPqvHt1ZzjCLXAI=;
 b=ZWSVPHjDTuKKPhSfysZ6Gff5Klk5d+PxVqDyQ5CkrTOgcMpVChZO7pvZcXC+LFMHev
 c11px2SEQSH/7pJkU1HWWHYYB9Nj4eqD2l5vLi6rsCH9Tuct84vMF00zuOUd3eEt93MZ
 ZArkUPBXTumYewKShaUO/kYM+Wp3lGA5c3BYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Awh1scCBZDnbimNWmMKzFzKs8NB+SPqvHt1ZzjCLXAI=;
 b=oAU+fSn1lSI3qa2s8+zh7n5nsW6ivXsLF5XkWGAI0EcBbkertsgrsZEvqnJuu7alPW
 oMf2u+vxPVdPEpd0//LvrGlsZDF7Z4iJMA67+zwkzdcrjcigVZRXDjU3A7stvgqHskVG
 Y6Q4sIofsGsnkfL5qET5kvJ6Fe1AoHyeBC6CZuZ/7pLjk0/vuC/cl48+vDhowCkQDkfw
 uWdMiPx8PI5+5+W43fn5EJpGHMOi6TGo+8AxbUAt9N0cwZ8IeUjXeyLXvY69rtsJ7OAf
 jI0JdXHIgFlCVbXbjZPoZbXFVDvQCWNwFmFCrMDv4QmSo8hm7oxv8G6SymZRMPiyOxUI
 vcfw==
X-Gm-Message-State: APjAAAXk+zo//M4zfk6Vr8ODTldLL2Ke+tNNzEJtoRbZ5U+mFIMk6oN/
 2qJzMnUugg9EhYDP5/dB4MrrR6cpMt0=
X-Google-Smtp-Source: APXvYqz1YAgpxDOH1raQBIMQtKlBRNoJqzoBLnIGZ8lcCDJudDScahnP2J4rnUWEbcwt1tbUfvLRoA==
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr23003305wrw.184.1582319025487; 
 Fri, 21 Feb 2020 13:03:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:03:44 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/51] drm/vgem: Use drmm_add_final_kfree
Date: Fri, 21 Feb 2020 22:02:41 +0100
Message-Id: <20200221210319.2245170-14-daniel.vetter@ffwll.ch>
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
