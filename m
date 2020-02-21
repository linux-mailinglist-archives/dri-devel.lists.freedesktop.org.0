Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB771688AE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257056F53D;
	Fri, 21 Feb 2020 21:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32006F532
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:03:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id n3so3157381wmk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ONYCQId/Lp3FCDlAAvJmwBxOy0NZM9plHkZx81NotgQ=;
 b=Soz+WxFelpQbyEdnwVaRI4oo2Y4tcI/DD/dxCrFcYXm0A/fluiFfVSj/H7cJ6Mi7+5
 RlwYGUJMOYe2fyY+zK+t+uMbH1C3kQZXwKIU5OwnrtCj2Pf6JdHKfQdp8Xupj8NpCSZh
 ajWGY/sJcL0naIXvbEhHl8vCKwIZoiQs75X14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ONYCQId/Lp3FCDlAAvJmwBxOy0NZM9plHkZx81NotgQ=;
 b=pgUzcvAAm/o8QbqWad+fmWLxREf1zClAiUvlpKOcEg6sTtoIBYlBIETAM47WRrERob
 WwXULxw7WvT3r4ReNBLWw7YJv6EdiUquzSVfqALWUc7wtfY3tOBlvkgVrEASWnMTrrsh
 IhuhyC+56GN1dY4UsHWqxIxirmjebY17/vEYZwh23MvG1nJw8SwBITCnJg1R9Lbabj1g
 9TCaebfyX5MpTvkbgR7UEXqvSMaloVaiZA4HTgm5f7PMKtyOrZHvrfcMe85xuxmgT4/8
 c/amseKsnGSFjolBxPkEeO95tSmIvqlJ4nl2R4JfTIffHsMtwk8zls4epkLyVjmpYeq4
 pwEQ==
X-Gm-Message-State: APjAAAUVVF68eRg0XztLcfwgRJ/VJOZI9MyiaAW4aTv4vxDb3lczIfC1
 oPvG2jhCXCJK9lewVrjsPNn2q/TGcZ0=
X-Google-Smtp-Source: APXvYqxpE12SUQdc7vM3FdJpq0AdjPjxVs+gnJt9F7h2CgEqk1rDdIgd298T1UdUVS2bWLSns/YOag==
X-Received: by 2002:a1c:9e89:: with SMTP id h131mr5608286wme.161.1582319033154; 
 Fri, 21 Feb 2020 13:03:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:03:52 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 19/51] drm: Cleanups after drmm_add_final_kfree rollout
Date: Fri, 21 Feb 2020 22:02:47 +0100
Message-Id: <20200221210319.2245170-20-daniel.vetter@ffwll.ch>
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
