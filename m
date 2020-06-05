Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DE21EF9C4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88626E8F7;
	Fri,  5 Jun 2020 13:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E2E6E8F7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:58:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CF535AD48;
 Fri,  5 Jun 2020 13:58:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH 11/14] drm/mgag200: Separate device initialization into
 allocation
Date: Fri,  5 Jun 2020 15:58:00 +0200
Message-Id: <20200605135803.19811-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605135803.19811-1-tzimmermann@suse.de>
References: <20200605135803.19811-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Embedding the DRM device instance in struct mga_device will require
changes to device allocation. Moving the device initialization into
its own functions gets it out of the way.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 32 ++++++++++++++++++---------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index f8bb24199643d..926437a27a228 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -43,17 +43,11 @@ static struct drm_driver mgag200_driver = {
  * DRM device
  */
 
-static int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
+static int mgag200_device_init(struct mga_device *mdev, unsigned long flags)
 {
-	struct mga_device *mdev;
+	struct drm_device *dev = mdev->dev;
 	int ret, option;
 
-	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
-	if (mdev == NULL)
-		return -ENOMEM;
-	dev->dev_private = (void *)mdev;
-	mdev->dev = dev;
-
 	mdev->flags = mgag200_flags_from_driver_data(flags);
 	mdev->type = mgag200_type_from_driver_data(flags);
 
@@ -83,15 +77,33 @@ static int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 
 	ret = mgag200_mm_init(mdev);
 	if (ret)
-		goto err_mm;
+		return ret;
 
 	ret = mgag200_modeset_init(mdev);
 	if (ret) {
 		drm_err(dev, "Fatal error during modeset init: %d\n", ret);
-		goto err_mm;
+		return ret;
 	}
 
 	return 0;
+}
+
+static int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
+{
+	struct mga_device *mdev;
+	int ret;
+
+	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
+	if (mdev == NULL)
+		return -ENOMEM;
+	dev->dev_private = (void *)mdev;
+	mdev->dev = dev;
+
+	ret = mgag200_device_init(mdev, flags);
+	if (ret)
+		goto err_mm;
+
+	return 0;
 
 err_mm:
 	dev->dev_private = NULL;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
