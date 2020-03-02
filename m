Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841D517671A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C7B6E892;
	Mon,  2 Mar 2020 22:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCF06E892
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j16so1888203wrt.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDITxS+VI70VCY6Cb+FkmQ51wSHJ+8GTYBtMBK0lEgU=;
 b=Pasd4OjNbgv23sXans6bcPf/rluqKDCH+MquNJAbZoX5VCTODL8+a47w0yZJhtEO5G
 SFVLxr9Iq8sDTV00CbqxleGgNMVnIbuWR0q7i2J5UhOntf4FaxtorKTMLtfL9QA1UqUh
 0lmkYbM1pMWkp7NUBPlMjIL0zgdlrkHSpk4nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDITxS+VI70VCY6Cb+FkmQ51wSHJ+8GTYBtMBK0lEgU=;
 b=hZpptSCoTT4wPoFwEGWNKlgGrGR1s9FRJ8bCPK+seZezTSfpWkW8GuTHR4Em9Xf5xX
 n5DKypVJS+r8mV+801yq9yXlnbq4pjPywuT4lOqv3pdE+ChN/RZtM6Zkg4JvE44z8umV
 FgwF4nrJc2APnz0puOdaa3BEj6xVqXUPB46zuOU/0zWc5q30Og/UIvyZ+ptZPdPJZZUZ
 ffBlCu048eW8i0P19/DrYCfH5f1sikfoopiFcEXHelUgHUf9iOU0mXOiu5mEISYmlN/1
 wr1REgw0PbLC8cvod2WFBy2vK2Muqv64xzN0GNJLfpvJA/roMRQvGqiXbnRz/7/9i8U7
 sdcw==
X-Gm-Message-State: ANhLgQ2Tn26e/h87irjRcIktvp6DwYPR5IBoI0KYj3oxsfrAwE34Soaf
 lNz/94YY/9spbHNGvP5nO0MGXRlOvL0=
X-Google-Smtp-Source: ADFU+vvG1hzx4rmYOuwxU6uv9vRfq7AIUj33XOmgpvsubccV3C9AD1SP1kWMJhfDdTpgJnFndakd2Q==
X-Received: by 2002:adf:b19d:: with SMTP id q29mr1569649wra.211.1583188027291; 
 Mon, 02 Mar 2020 14:27:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:06 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 21/51] drm: Use drmm_ for drm_dev_init cleanup
Date: Mon,  2 Mar 2020 23:26:01 +0100
Message-Id: <20200302222631.3861340-22-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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
index ef79c03e311c..23e5b0e7e041 100644
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
