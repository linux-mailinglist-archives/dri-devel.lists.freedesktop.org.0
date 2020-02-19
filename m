Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF6E164192
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828B76EB53;
	Wed, 19 Feb 2020 10:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C4A6EB53
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q9so5841135wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ONYCQId/Lp3FCDlAAvJmwBxOy0NZM9plHkZx81NotgQ=;
 b=dLvy7HOYJEWzccfOHnoIHn6w5B78MOhJFrIzKsw1ILVAQC4Cv7xQP+bgZW+MEAykXO
 zYQJ3gdC0lLKVZNne15tFwR7KROY6bD0e9iW03WBUaWzDnzKoEiaQlYAlysSgYucq08h
 aPIb6BZOkMRVL4ukJToIz27niAVj2tuZQfNko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ONYCQId/Lp3FCDlAAvJmwBxOy0NZM9plHkZx81NotgQ=;
 b=cdTH/yJyuE1jxwzL4qNPb914HTy4pmRTPetrWNsHQ6dogg8jUGWlMwJQAM8wMn2vsC
 wc6HP8vFbZoc3nXsJROEkRI91Tcqkempl+lz2hVQgqL8pMhDOUWGf+87jjbYKxJ8xGHi
 kvI9CtXNvr909hyW80m9r50sWVLBZ+Oh0yN29Wqv3WWzrOmS7OmpxllretfbeujD8VCM
 JfMF/fBHx7eFADIchpL672AHXMw4WORT5reohIsSjjw8yytyqdVC0YxXTqr7YtVIO1PQ
 JWu7JfTtduUodlIViCYu2rcXPh9psnUtXhFcfZEvNE5ezTbj23oglYwhSLx5loPwYBIb
 2fvQ==
X-Gm-Message-State: APjAAAXnu/kYVOZGHBogLncpIyrUGSOBIFymLU6kl8E6hEYVUrkrMOgh
 LAUwERLEgA5boTyDP4YyRdC3lZi/iZY=
X-Google-Smtp-Source: APXvYqyaYGuOwJBys7PJ/5pzLfTzLMagXB278Iye0GFbqs8U8fauGZFExXcZt+FrJltEXKpct9Kvjw==
X-Received: by 2002:a1c:720a:: with SMTP id n10mr9068721wmc.103.1582107715664; 
 Wed, 19 Feb 2020 02:21:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:54 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/52] drm: Cleanups after drmm_add_final_kfree rollout
Date: Wed, 19 Feb 2020 11:20:50 +0100
Message-Id: <20200219102122.1607365-21-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few things:
- Update the example driver in the documentation.
- We can drop the old kfree in drm_dev_release.
- Add a WARN_ON check in drm_dev_register to make sure everyone calls
  drmm_add_final_kfree and there's no leaks.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 9e62e28bbc62..1ee606b4a4f9 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -297,8 +297,6 @@ void drm_minor_release(struct drm_minor *minor)
  *
  *		drm_mode_config_cleanup(drm);
  *		drm_dev_fini(drm);
- *		kfree(priv->userspace_facing);
- *		kfree(priv);
  *	}
  *
  *	static struct drm_driver driver_drm_driver = {
@@ -326,10 +324,11 @@ void drm_minor_release(struct drm_minor *minor)
  *			kfree(drm);
  *			return ret;
  *		}
+ *		drmm_add_final_kfree(drm, priv);
  *
  *		drm_mode_config_init(drm);
  *
- *		priv->userspace_facing = kzalloc(..., GFP_KERNEL);
+ *		priv->userspace_facing = drmm_kzalloc(..., GFP_KERNEL);
  *		if (!priv->userspace_facing)
  *			return -ENOMEM;
  *
@@ -834,10 +833,6 @@ static void drm_dev_release(struct kref *ref)
 		dev->driver->release(dev);
 	} else {
 		drm_dev_fini(dev);
-		if (!dev->managed.final_kfree) {
-			WARN_ON(!list_empty(&dev->managed.resources));
-			kfree(dev);
-		}
 	}
 
 	drm_managed_release(dev);
@@ -960,6 +955,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	struct drm_driver *driver = dev->driver;
 	int ret;
 
+	WARN_ON(!dev->managed.final_kfree);
+
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_lock(&drm_global_mutex);
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
