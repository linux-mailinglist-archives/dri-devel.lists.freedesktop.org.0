Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC63C180C6D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6231E6E3E3;
	Tue, 10 Mar 2020 23:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48F16E2E1;
 Tue, 10 Mar 2020 13:31:49 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 6so1410644wmi.5;
 Tue, 10 Mar 2020 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=So9oahFlaIrjXJ1ThfWP2juPDd9ojTlsnsFX+n5YzPw=;
 b=ZR5XmKWXAiVhg6VG1/Vmtep0lZbswooyXZZekEskl/4hMs8H8hmu8TQmapw4thSe9S
 1PqqwAiuPIiw0yz9cD015t9Ym7CrspB440ZxA2kESP3VYUQx0kf5uopRY68k8TV+Zrft
 IPNglbS1TWYH53kveAVrvIPdZUWfEWBTcstVw+AvPzbio5SwEOWhbUZ5chS55ITYLbvm
 pAMhSf8O+pAOLEva3PqR2JHLUJou92a4sWk2nELeI/xddBDC9wDzGRyrsqo75pQxRi2/
 Mv05poS1mbraXU5Ot+kce1QiRcMywfEHOJg1D1FpfKuD9l3q4IiWs7mZseZiLpp84V3g
 etuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=So9oahFlaIrjXJ1ThfWP2juPDd9ojTlsnsFX+n5YzPw=;
 b=Y55C0E8ZyUs0iCXVHhAYR2WRcCztfaDlVz9Z7IRnu4Uyr3+4Qn1LJInVfMzatVkoR2
 nwCe3rfrgD7vWgtl53fkBW4sIh8qHTP0t5DivBY9v4lN+MAURfVaW+M1Hx9LoUg2ypmw
 5tv4r4eakwEb/AVDi6oPW9H52iuFJv1HIt/1KHUiQHIIvUo2ZedpudZ31/MOy43GQazv
 TRf0BxkXlPylNntos25jNayifffkJ4OORO/6PBzrvgeQzA4hByJ+C4C5ZQF6xsFYWYD0
 1Zp1jEkE+VY0F9jwyJRLruhOx+zjP9cEBApw29JWSBU2Kr+uLdMF19QtHtKHfcwaJeWZ
 IT6w==
X-Gm-Message-State: ANhLgQ2ADNNNjMo3QHphsODIJNrGm1n1wM3jIg110Qba2m1QSMgGfTo4
 t63VMi0ZN4umOR6m6KNAcNsKPgl6frY=
X-Google-Smtp-Source: ADFU+vtja3eYb7rLsUWgA36oh7IksgzfIab6tcOPnIf1FXzQ1UNtr9SvKt/Yjk3hcvSpuXQV4ezoTw==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr2200685wmb.73.1583847108295;
 Tue, 10 Mar 2020 06:31:48 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:47 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH v2 08/17] drm/msm: remove checks for return value of
 drm_debugfs_create_files()
Date: Tue, 10 Mar 2020 16:31:12 +0300
Message-Id: <20200310133121.27913-9-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: gregkh@linuxfoundation.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files never
fails and only returns 0. Therefore, the unnecessary checks for its
return value and error handling in various debugfs_init() functions in
drm/msm and have the functions return 0 directly.

v2: have debug functions return 0 instead of void to avoid build
breakage and ensure standalone compilation.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 12 +++---------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 14 +++-----------
 drivers/gpu/drm/msm/msm_debugfs.c         | 13 ++++---------
 3 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index 075ecce4b5e0..011ab6353dbb 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -151,21 +151,15 @@ DEFINE_SIMPLE_ATTRIBUTE(reset_fops, NULL, reset_set, "%llx\n");
 int a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 {
 	struct drm_device *dev;
-	int ret;
 
 	if (!minor)
 		return 0;
 
 	dev = minor->dev;
 
-	ret = drm_debugfs_create_files(a5xx_debugfs_list,
-			ARRAY_SIZE(a5xx_debugfs_list),
-			minor->debugfs_root, minor);
-
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "could not install a5xx_debugfs_list\n");
-		return ret;
-	}
+	drm_debugfs_create_files(a5xx_debugfs_list,
+				 ARRAY_SIZE(a5xx_debugfs_list),
+				 minor->debugfs_root, minor);
 
 	debugfs_create_file("reset", S_IWUGO, minor->debugfs_root, dev,
 			    &reset_fops);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 6650f478b226..41b461128bbc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -259,17 +259,9 @@ static struct drm_info_list mdp5_debugfs_list[] = {
 
 static int mdp5_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
-	int ret;
-
-	ret = drm_debugfs_create_files(mdp5_debugfs_list,
-			ARRAY_SIZE(mdp5_debugfs_list),
-			minor->debugfs_root, minor);
-
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "could not install mdp5_debugfs_list\n");
-		return ret;
-	}
+	drm_debugfs_create_files(mdp5_debugfs_list,
+				 ARRAY_SIZE(mdp5_debugfs_list),
+				 minor->debugfs_root, minor);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 1c74381a4fc9..6378157e1fff 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -220,14 +220,9 @@ int msm_debugfs_init(struct drm_minor *minor)
 	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
-	ret = drm_debugfs_create_files(msm_debugfs_list,
-			ARRAY_SIZE(msm_debugfs_list),
-			minor->debugfs_root, minor);
-
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "could not install msm_debugfs_list\n");
-		return ret;
-	}
+	drm_debugfs_create_files(msm_debugfs_list,
+				 ARRAY_SIZE(msm_debugfs_list),
+				 minor->debugfs_root, minor);
 
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
@@ -238,7 +233,7 @@ int msm_debugfs_init(struct drm_minor *minor)
 			return ret;
 	}
 
-	return ret;
+	return 0;
 }
 #endif
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
