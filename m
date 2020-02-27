Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E2117268F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669226E44C;
	Thu, 27 Feb 2020 18:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1A76ECED
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:15:55 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t23so443033wmi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ONYCQId/Lp3FCDlAAvJmwBxOy0NZM9plHkZx81NotgQ=;
 b=QQuJuyWSgHkLv4FXjDS0mbiEXuXoNgICif77ao4J7Ps7Qhe0TobDRZOhb1n0+wOzhI
 QSeTjRVjBMSLhjI1cbijoPxcKpNp4Dwti/slljC5jleCuCv9RmShNg1gsao4JdSyttV3
 lsQdSOvOo0IGrRctC2Bdi9Gk5bq/bmwLuqavo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ONYCQId/Lp3FCDlAAvJmwBxOy0NZM9plHkZx81NotgQ=;
 b=ONgvBUGxKw6jWpeoWDWIqiRxLCldXtRDv+MUxtBBdELD/ufWmePm/v49tQL7bgNwT0
 ZCKfK52I3pVB4Ah6bN6gyYhocOb8IjpwsyjYCGBpcFfmk3Ymjnk3UMd0vQpgAa6Klnnr
 KU2ylyxUoTnkpC1MG1N1QQ3zUAydM0HQjW7PAxk9A0oG+lyunEmbVhmjtSQV08qNtcMO
 KxDPpk2heG6XBsf3FhctOALSHp0mwmVP+gXyyN771xzyAPjjW8OGt91z6xrhu0kDlWRg
 EKWmb7BzTKJ5nLbgzLliaGDpDS62Y3NKiAzLvk3MG/ZlzXhPRuAPEkvIbLuJVOQUBpP4
 3LNA==
X-Gm-Message-State: APjAAAWtJOX4Y2wPGGGHVBJj6FRMlKrI6GAGvY9sXJVZBzs69ya3P2ye
 /qddRxvbasZyJSlhyi1pOG55iVyOMEI=
X-Google-Smtp-Source: APXvYqxQXjpADoadgdOIPpA/uMlyDWPtNkMbPVCnhLzgHrxlPZj8hyi+1mNvX62i11IFav27AEhjzQ==
X-Received: by 2002:a1c:9c96:: with SMTP id f144mr48330wme.98.1582827353634;
 Thu, 27 Feb 2020 10:15:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:53 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 19/51] drm: Cleanups after drmm_add_final_kfree rollout
Date: Thu, 27 Feb 2020 19:14:50 +0100
Message-Id: <20200227181522.2711142-20-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de
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
