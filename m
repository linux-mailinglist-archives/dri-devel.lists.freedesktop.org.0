Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A58F1C93F3
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6ACF6E9FD;
	Thu,  7 May 2020 15:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F966E9FB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h9so6852707wrt.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jjaPRtS4t8e+SlwEyKM0PGuZDmAIPfDdFGxrBhUDOv8=;
 b=VsUGaxPYISIvknMlbqxeeljyQW0l2OKyC3hX8sHcja+jlyypg41a3+F2DpbFRydMs6
 aG4dHIFzCOwOAbacV5LuOJWpJ16IgC2sJv+vqr0zVOb/juw/9Wo14oSK1YYlGYt435fQ
 YL8iwKmdpsjudMCT5Fs/cSQhIi1lty//jIVaftLX+l7AuUTHpaTd4CM4/7DdPCOo6X9C
 Lrcl/Ki8JEMTYXGaPRV9lymOfajEHMLA8GvROlGh8A9c+0cl8jv0LtPgfjiT9n83cbDW
 LMeEHWhT2nYBNF2qVKR7pjCPW5u8ld0GmUBV1UMeDIDluzi5j9wJHrUba7Y1RqKZgTtk
 2e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jjaPRtS4t8e+SlwEyKM0PGuZDmAIPfDdFGxrBhUDOv8=;
 b=sPE73YsvqVTk8jk6a628AiS4GZ9/43hK4nSyFfKDABY/kmtuBnu4A3xD9pt61DWffl
 NlPvrNA02vegKCdpZduJqa/FqwApaPYcmKcBFw/F9xnlw0xMfyqIzSOQ8YgwLxgneAvF
 qg8wL/4H9NcTuiJRIfyhaxY9vEAd22ZYi0eDHGvX7LL6KxeYr4kj0S1jwSjVMElvgJCv
 OrX2YMkQE9t4Da/H/dav6qY0oUf1YsmWXRgutR7uhTKSo67r72MOLpcTz13BcTyp9EE2
 oOeNbuF0Rymx81OsBXCAjd74vJ5WQpXDE/ID7eoFLCcVwpdONCOXesyQA/JCm+3R/46R
 1dmA==
X-Gm-Message-State: AGi0PubF7eiVMjE/h2uX/bTovwPlSFJJ7Y73VljvPvLtxJfQZ7QuUA7a
 41yKnLCz5fnLcoznTJSP4mqQXxus
X-Google-Smtp-Source: APiQypIbSa80NBaium+B/+j8KljCX2X1gmLmV9LOCDdqqgco1ru/qThm9KARVys2CnmgLPkrw2rDRA==
X-Received: by 2002:a5d:650c:: with SMTP id x12mr15292678wru.425.1588864262288; 
 Thu, 07 May 2020 08:11:02 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:01 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/36] drm: remove drm_driver::gem_free_object
Date: Thu,  7 May 2020 16:07:54 +0100
Message-Id: <20200507150822.114464-9-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

No drivers set the callback, so remove it all together.

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 22 +++-------------------
 include/drm/drm_drv.h     |  8 --------
 include/drm/drm_gem.h     |  5 +++--
 3 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 12fa121d0966..dab8763b2e73 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -975,15 +975,10 @@ drm_gem_object_free(struct kref *kref)
 		container_of(kref, struct drm_gem_object, refcount);
 	struct drm_device *dev = obj->dev;
 
-	if (obj->funcs) {
+	if (obj->funcs)
 		obj->funcs->free(obj);
-	} else if (dev->driver->gem_free_object_unlocked) {
+	else if (dev->driver->gem_free_object_unlocked)
 		dev->driver->gem_free_object_unlocked(obj);
-	} else if (dev->driver->gem_free_object) {
-		WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
-		dev->driver->gem_free_object(obj);
-	}
 }
 EXPORT_SYMBOL(drm_gem_object_free);
 
@@ -999,21 +994,10 @@ EXPORT_SYMBOL(drm_gem_object_free);
 void
 drm_gem_object_put_unlocked(struct drm_gem_object *obj)
 {
-	struct drm_device *dev;
-
 	if (!obj)
 		return;
 
-	dev = obj->dev;
-
-	if (dev->driver->gem_free_object) {
-		might_lock(&dev->struct_mutex);
-		if (kref_put_mutex(&obj->refcount, drm_gem_object_free,
-				&dev->struct_mutex))
-			mutex_unlock(&dev->struct_mutex);
-	} else {
-		kref_put(&obj->refcount, drm_gem_object_free);
-	}
+	kref_put(&obj->refcount, drm_gem_object_free);
 }
 EXPORT_SYMBOL(drm_gem_object_put_unlocked);
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 6d457652f199..e6eff508f687 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -327,14 +327,6 @@ struct drm_driver {
 	 */
 	void (*debugfs_init)(struct drm_minor *minor);
 
-	/**
-	 * @gem_free_object: deconstructor for drm_gem_objects
-	 *
-	 * This is deprecated and should not be used by new drivers. Use
-	 * &drm_gem_object_funcs.free instead.
-	 */
-	void (*gem_free_object) (struct drm_gem_object *obj);
-
 	/**
 	 * @gem_free_object_unlocked: deconstructor for drm_gem_objects
 	 *
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 0b375069cd48..ec2d24a60a76 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -272,8 +272,9 @@ struct drm_gem_object {
 	 * attachment point for the device. This is invariant over the lifetime
 	 * of a gem object.
 	 *
-	 * The &drm_driver.gem_free_object callback is responsible for cleaning
-	 * up the dma_buf attachment and references acquired at import time.
+	 * The &drm_driver.gem_free_object_unlocked callback is responsible for
+	 * cleaning up the dma_buf attachment and references acquired at import
+	 * time.
 	 *
 	 * Note that the drm gem/prime core does not depend upon drivers setting
 	 * this field any more. So for drivers where this doesn't make sense
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
