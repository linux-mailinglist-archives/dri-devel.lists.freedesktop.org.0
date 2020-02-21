Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDF11688B5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65F16F547;
	Fri, 21 Feb 2020 21:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A54C6F528
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:03:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so3528687wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oJuPwHngptOj2kXgX+3SAQqLWFZa0tiNWh7f0TdVAh4=;
 b=Px3lXT3G93Sut2XeIaoB+HfSoHm25UtUZOiQ05ca8/hMtJkqgnZBlR+s7iwxrEYC9m
 +GDLFYsgNTgzwBL1VyqinKba/Rb5WZ4GjmAPvt1JXKuFRmhbVfoW8oP3EUFB9fM6nih6
 QtkNIHgr7dT7TGJ0BSzujK9wjY1l1OMUwxKto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJuPwHngptOj2kXgX+3SAQqLWFZa0tiNWh7f0TdVAh4=;
 b=rpjWype82r9jrZorNOUK+2PIzn240iQO11J5/02/0438iHX8OAHG+z2eSOKU56LvKz
 uyP38APazR2iHtuGZe7ADUIF4UQBu5xXhpuY3wlGI7xK4+BKn0NIFW2QYe6xK+t8lnTM
 fkYzzTZXbl/hTy6KUFvfIRZBOFo3OMGzfPbChnQfh2WMxIJmr0nHKUfboTyh6C6g2v1V
 f/utdI7zPndArp+rShdEn0dVlZCAIwYKcOqc8L4qPzTyyZ1R9lEJzzmHGd1PW2f0smeo
 3ubhYBOBYO6tNh88kFPWmWwDjQcvK0zY+6uOCZqY5O1ThrpovRtKJ6aPFWIV2mVvImFg
 81eg==
X-Gm-Message-State: APjAAAVG9AcGqOvk176e9u3eCpGvP2d/RZH5Ed/UXo0J81j9R7xEA0Ao
 wxSQwyPYz2/g/wLnKeBGJqVUyfono/Q=
X-Google-Smtp-Source: APXvYqytQpj+2RevwB7Ls9gXFRAnCvY+btia8YDmHyeh92gaSFGB4RPxLhGmig6lkzH6BCCY9wxH5w==
X-Received: by 2002:a5d:6408:: with SMTP id z8mr50401978wru.122.1582319035636; 
 Fri, 21 Feb 2020 13:03:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:03:54 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 21/51] drm: Use drmm_ for drm_dev_init cleanup
Date: Fri, 21 Feb 2020 22:02:49 +0100
Message-Id: <20200221210319.2245170-22-daniel.vetter@ffwll.ch>
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
