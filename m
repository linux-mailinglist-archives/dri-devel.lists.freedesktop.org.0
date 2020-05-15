Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEA51D4A08
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ACA6EC49;
	Fri, 15 May 2020 09:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E456EC37
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:13 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w64so1947481wmg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C72pARwKzjXLQykIC6Vzm26mksDc4097B9kvNeRj2lQ=;
 b=bWcM5CsDk794wqVx0bpSBzlfNFSUDUV61J7u5+/ewaXeC3gvaqF8isnld4kjSB/Z5y
 +nhEbrdoSf6NIyTFUUNYTf/Gfl6VK5ZeZB6R4+s1Pd9U3k+7ApEojDoDAoWtvQZ2L7g0
 x+qGmBDhSovCD7TOYFT3xuceghhUhcDzgpeuaKSotEKcot7IweD/bVh/LoDcSDgIaZk+
 JIQQybxU4pUxVcBiqzXPcHHQyLlnkeigsC1nQ7SJpFYw3SzGNQh6XGnEV8Tt5oILK4SA
 ML1Ii/yUQKAKYyyXNbZpWayUx8BAMRo9DvZJHGzVYnzrFfGoubBUi0KeUMKWay9JwKkM
 Rq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C72pARwKzjXLQykIC6Vzm26mksDc4097B9kvNeRj2lQ=;
 b=Ls+PN4roTcilDuAv8y++z9olhi7PzLqQhkxZJMrEu7v3yvoloFKUiVCp1HOcmbHr4E
 FdPvsvrgl2QA+UKlQYw8Uw+rbLSmj7EM+aUz5KXysxupE6NW6kPwG/Kl+slV0WHDDN07
 XCJEzddcbnREzNPqq7E7omEf7mtG/MeKY28Axx94nhZ0eIPsQbxz4l7NsABJ2kZmLMXs
 sVCeavDT7WlbKjxzm4KbiP7FQA5RXAtAhjKt0WJzRlbad/jKgPdpZaoaI/eeyVnf8kPM
 JaOAzt5EX/i+TC+Up5DquUfeaCmNkbpM0ICwjtMtALtWKK6yh4aI1em3txwivA7u4q3e
 t6Hg==
X-Gm-Message-State: AOAM531uwZdaN0cqMqnFhUDrvOJN32zhLL637C/dAWRcV0MRdI0sMk5q
 tfuaMBcBWl8ftroI6cwNC7dGw74v
X-Google-Smtp-Source: ABdhPJz+k4vP2BdAa6279uhlUEjN/D0s8KFoxLAA/P6ttFzNdaaAo2Yn1TyKWS2LMTi4NLPGyTUlEQ==
X-Received: by 2002:a7b:cb96:: with SMTP id m22mr3032944wmi.164.1589536451853; 
 Fri, 15 May 2020 02:54:11 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:11 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/38] drm: remove drm_driver::gem_free_object
Date: Fri, 15 May 2020 10:50:49 +0100
Message-Id: <20200515095118.2743122-10-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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
