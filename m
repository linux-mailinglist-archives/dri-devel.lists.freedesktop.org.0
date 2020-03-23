Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C418F761
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41C16E184;
	Mon, 23 Mar 2020 14:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407A16E1B5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f3so17416810wrw.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wbQinXd5DZXxt7LdVAdqB2f0eyOj50kSIUYvaFBmLN8=;
 b=eq4ziTidBhyZBroI35ycA2HCNRnZOjZKi3rnMt8A5Xg7kuQlUPvPsK+JoYVgt67wG2
 QLAqoP/T/DLWeM49FZGSR4Sg5FM+nswQ5PRHJf6G2V2mbab/aarBTwgaphv70q2nm1+K
 UyMHucqvMd8e3NuuS5cLx5t6AmUW/OejZL6/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wbQinXd5DZXxt7LdVAdqB2f0eyOj50kSIUYvaFBmLN8=;
 b=Dh9Rb2Sx/CawxUKkw7T9qKOp8dZhq9fDSY98tb0UMWLqT8mgKf0Ec+2haP9lu+eyrf
 P50OFQfjrjCdfJowcz4449T5xUe9AMom/ZzXhhXmgblQNA5qP61FOUc/jyKNmPI+U1YT
 oddu7y2v771aFR4PiFW/bQ7rD0hb22IXEBmZ84NZvwQfBwI+K2flOuB0npC1S2LfAAW7
 J9YBXcY7re9gS0VJd20xoc0oNRW7hkY11INn+5OAaTDSMWin+bHxpadEZ2/hP4A9f1vk
 2NIry7y+l3wyX3e/BhxIuzb45JAZZBXMNsxe3293QsLuLBNZkrHjBqnq60NoyEAO+5HK
 C9mg==
X-Gm-Message-State: ANhLgQ2ka3MGGspAosL1jeIz89W1M1WcARBfi3JK5x4iB+cReRFS1p92
 +ciit0jQsVWMuCBzm4jmrUMtR00qoyAY0g==
X-Google-Smtp-Source: ADFU+vuSS/hf88juTiTl9KVrdD+swSmePhb7SJ2g/kWk43JgmWcomRRI3zskGlP7zXrPisLv+mOEkA==
X-Received: by 2002:adf:9321:: with SMTP id 30mr29271818wro.330.1584975023424; 
 Mon, 23 Mar 2020 07:50:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:22 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 19/51] drm: Cleanups after drmm_add_final_kfree rollout
Date: Mon, 23 Mar 2020 15:49:18 +0100
Message-Id: <20200323144950.3018436-20-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few things:
- Update the example driver in the documentation.
- We can drop the old kfree in drm_dev_release.
- Add a WARN_ON check in drm_dev_register to make sure everyone calls
  drmm_add_final_kfree and there's no leaks.

v2: Restore the full cleanup, I accidentally left some moved code
behind when fixing the bisectability of the series.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 877ded348b6e..7f9d7ea543a0 100644
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
@@ -837,10 +836,7 @@ static void drm_dev_release(struct kref *ref)
 
 	drm_managed_release(dev);
 
-	if (!dev->driver->release && !dev->managed.final_kfree) {
-		WARN_ON(!list_empty(&dev->managed.resources));
-		kfree(dev);
-	} else if (dev->managed.final_kfree)
+	if (dev->managed.final_kfree)
 		kfree(dev->managed.final_kfree);
 }
 
@@ -961,6 +957,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	if (!driver->load)
 		drm_mode_config_validate(dev);
 
+	WARN_ON(!dev->managed.final_kfree);
+
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_lock(&drm_global_mutex);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
