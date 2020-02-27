Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8239C172691
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705C56ECE3;
	Thu, 27 Feb 2020 18:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6F489FD4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:15:57 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a5so452383wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oJuPwHngptOj2kXgX+3SAQqLWFZa0tiNWh7f0TdVAh4=;
 b=PovSe8s5WMZaLoTtePg+3o1gQCZYNkEtxlfPnlYcppOytR5VoQln5oxP0U2WCyWkYG
 5SiNIvWxZy2Y+JxqVN0+uK09c+zmlc7THwcgrArFPm0nidX94bsnncOh2ZVo7OyWbLQv
 Txuy+ZDApbp6ayUlYWzpXPOVddDzhLY5obysk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJuPwHngptOj2kXgX+3SAQqLWFZa0tiNWh7f0TdVAh4=;
 b=g++GDnqT19RCOY6CzHCvYAAVztOHVa+RWua9Xwq4W+OVExu+ZhS9L24lKa3OvokLHX
 wqG0ugZMCFPvJ5W1wSM1QqBd4lhlY2PhbEIHepOUMpO0pzIqHR+Ex9QEysIs1Uzg1it3
 EnJjVs2ysTAcVsvpuL/1Afwczvf1yzAgGIP761psDcMbswJ7RD5S6znQ1A/kRX7fVN23
 bxb7tViadytPRhX95Ny9ysCL+DqDzt2b/XgN5/YaPVNXEMX9e96J82iLfrLwOEPp0/4x
 oLFS+4/hBbzZc1Sw+mrmbP/OpsB6/XoUk6ck/wUvQyJQkirRvf86ivVTMtj5S+wMHj+1
 0Jnw==
X-Gm-Message-State: APjAAAW4LRjT7g7C1RzhyDqWB/YgiaNNZk4cHTIV4CZGceY7R/6XPkMX
 I+uU1HSnXRzA8Ctp9lje7dCyH6gBl6c=
X-Google-Smtp-Source: APXvYqzMSrlsPWdHCNQPm1e9Ar/kDBhcxObO/PL6UWqsGqi4T6Q9cnr8giCc0Ik6eNFoVwkd2BX1wg==
X-Received: by 2002:a1c:1fd0:: with SMTP id f199mr6569wmf.113.1582827356208;
 Thu, 27 Feb 2020 10:15:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:55 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 21/51] drm: Use drmm_ for drm_dev_init cleanup
Date: Thu, 27 Feb 2020 19:14:52 +0100
Message-Id: <20200227181522.2711142-22-daniel.vetter@ffwll.ch>
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

Well for the simple stuff at least, vblank, gem and minor cleanup I
want to further split up as a demonstration.

v2: We need to clear drm_device->dev otherwise the debug drm printing
after our cleanup hook (e.g. in drm_manged_release) will chase
released memory and result in a use-after-free. Not really pretty, but
oh well.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 48 ++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 782fd5d6f8b2..1f7ab88d9435 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -580,6 +580,23 @@ static void drm_fs_inode_free(struct inode *inode)
  *    used.
  */
 
+static void drm_dev_init_release(struct drm_device *dev, void *res)
+{
+	drm_legacy_ctxbitmap_cleanup(dev);
+	drm_legacy_remove_map_hash(dev);
+	drm_fs_inode_free(dev->anon_inode);
+
+	put_device(dev->dev);
+	/* Prevent use-after-free in drm_managed_release when debugging is
+	 * enabled. Slightly awkward, but can't really be helped. */
+	dev->dev = NULL;
+	mutex_destroy(&dev->master_mutex);
+	mutex_destroy(&dev->clientlist_mutex);
+	mutex_destroy(&dev->filelist_mutex);
+	mutex_destroy(&dev->struct_mutex);
+	drm_legacy_destroy_members(dev);
+}
+
 /**
  * drm_dev_init - Initialise new DRM device
  * @dev: DRM device
@@ -647,11 +664,15 @@ int drm_dev_init(struct drm_device *dev,
 	mutex_init(&dev->clientlist_mutex);
 	mutex_init(&dev->master_mutex);
 
+	ret = drmm_add_action(dev, drm_dev_init_release, NULL);
+	if (ret)
+		return ret;
+
 	dev->anon_inode = drm_fs_inode_new();
 	if (IS_ERR(dev->anon_inode)) {
 		ret = PTR_ERR(dev->anon_inode);
 		DRM_ERROR("Cannot allocate anonymous inode: %d\n", ret);
-		goto err_free;
+		goto err;
 	}
 
 	if (drm_core_check_feature(dev, DRIVER_RENDER)) {
@@ -688,19 +709,12 @@ int drm_dev_init(struct drm_device *dev,
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_destroy(dev);
 err_ctxbitmap:
-	drm_legacy_ctxbitmap_cleanup(dev);
-	drm_legacy_remove_map_hash(dev);
 err_minors:
 	drm_minor_free(dev, DRM_MINOR_PRIMARY);
 	drm_minor_free(dev, DRM_MINOR_RENDER);
-	drm_fs_inode_free(dev->anon_inode);
-err_free:
-	put_device(dev->dev);
-	mutex_destroy(&dev->master_mutex);
-	mutex_destroy(&dev->clientlist_mutex);
-	mutex_destroy(&dev->filelist_mutex);
-	mutex_destroy(&dev->struct_mutex);
-	drm_legacy_destroy_members(dev);
+err:
+	drm_managed_release(dev);
+
 	return ret;
 }
 EXPORT_SYMBOL(drm_dev_init);
@@ -763,20 +777,8 @@ void drm_dev_fini(struct drm_device *dev)
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_destroy(dev);
 
-	drm_legacy_ctxbitmap_cleanup(dev);
-	drm_legacy_remove_map_hash(dev);
-	drm_fs_inode_free(dev->anon_inode);
-
 	drm_minor_free(dev, DRM_MINOR_PRIMARY);
 	drm_minor_free(dev, DRM_MINOR_RENDER);
-
-	put_device(dev->dev);
-
-	mutex_destroy(&dev->master_mutex);
-	mutex_destroy(&dev->clientlist_mutex);
-	mutex_destroy(&dev->filelist_mutex);
-	mutex_destroy(&dev->struct_mutex);
-	drm_legacy_destroy_members(dev);
 }
 EXPORT_SYMBOL(drm_dev_fini);
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
