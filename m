Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCED171813
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00736ECC8;
	Thu, 27 Feb 2020 12:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978496EC96;
 Thu, 27 Feb 2020 12:03:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m16so2958358wrx.11;
 Thu, 27 Feb 2020 04:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0cvkhpWMFxiLIeolS0V7/Qo+W3ZK761sN/9Z7LM3iPc=;
 b=Kfug0CJRpde9XowA2nK2NNaW5lx1rUpjSYu8G4JseK84jXXjX6+qOHMxwTsPAlpXXd
 1Z4SYEhLlLyqt+Nn6ZaWsF8Kb+ZX5KnEUIbWJzQF9FAQdruIwhXjli6XAnBUcdvu3hK9
 9EMW5/fZUMYYsUrh8VHokFrfHPL0QDk+t9MNpfp4yBwu2nRwjIT5vdrcXIHhLi898GF3
 u91OBgKR5jGTktue2OzE7RKHow6L0Y4iv6waxFzz1iDCkWLchsuRsVqHzC9hPmg0u3ay
 nHyKdEPcSSCB7CbUgIQHIfQo1SJH5RLwr2SKi7FuTqNwGa5ao7H+MstVcCiJk/GtKmVw
 4Bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0cvkhpWMFxiLIeolS0V7/Qo+W3ZK761sN/9Z7LM3iPc=;
 b=AIo4ZyZRvx8lXChsWLfwzke5p0FGzCUUVUJ6pK5gIkevwGKq6pVrKNafL6RF+74a1F
 LHqCMrAd6lqDb8mPNaQvcsrH6K8ezFacVkltugTA1XOtEwpl/Ttx5RbIsbhrftgf2mZq
 1ANXyWuXsC7mshpK+Byr9Drdv+Y9ojrutym1n5HK1lPYev1J9sKpFEoK++Lct8wiQLuS
 RlUty2elyCuFa6JPbwcsvm8qcd5R7WDHLiTaphGkHj1cq+uU6IjINJdiXskMOfT/vx9U
 SntHctYgY0HUNRL3F/6HHZ7aQWsbbopi/qJNpd6XnnphnQyCRGCx/wMhji17559BE6se
 wf8Q==
X-Gm-Message-State: APjAAAXU8ivNbA1sc97ZGn71KG+RisAAzbUhAA6fsT8+qDheKx6vWOUr
 r59UP9/NUy4i9gHYWhHkQMU=
X-Google-Smtp-Source: APXvYqzcuxChGggWOSGvgfmoFNlVgp9QCuNqVaQ/y8Pchnv7mZ3b6MlfEcjxIgveqSKd5RdWwh0h1Q==
X-Received: by 2002:a05:6000:12d1:: with SMTP id
 l17mr4335111wrx.327.1582805011298; 
 Thu, 27 Feb 2020 04:03:31 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:30 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH 12/21] drm/msm: remove checks for return value of drm_debugfs
 functions.
Date: Thu, 27 Feb 2020 15:02:23 +0300
Message-Id: <20200227120232.19413-13-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227120232.19413-1-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
drm_debugfs_create_files() never fail), drm_debugfs_create_files() does
not fail, and should return void. This change therefore removes the
checks of its return value in drm/msm and subsequent error handling.

These changes also enable the changing of various debugfs_init()
functions to return void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 18 +++++-------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 14 +++-----------
 drivers/gpu/drm/msm/msm_debugfs.c         | 21 ++++++---------------
 drivers/gpu/drm/msm/msm_debugfs.h         |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h             |  2 +-
 5 files changed, 16 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index 075ecce4b5e0..8cae2ca4af6b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -148,27 +148,19 @@ reset_set(void *data, u64 val)
 DEFINE_SIMPLE_ATTRIBUTE(reset_fops, NULL, reset_set, "%llx\n");
 
 
-int a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
+void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 {
 	struct drm_device *dev;
-	int ret;
 
 	if (!minor)
-		return 0;
+		return;
 
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
-
-	return 0;
 }
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
index 1c74381a4fc9..3c958f311bbc 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -214,31 +214,22 @@ int msm_debugfs_late_init(struct drm_device *dev)
 	return ret;
 }
 
-int msm_debugfs_init(struct drm_minor *minor)
+void msm_debugfs_init(struct drm_minor *minor)
 {
 	struct drm_device *dev = minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
-	int ret;
+	int ret = 0;
 
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
 
 	if (priv->kms && priv->kms->funcs->debugfs_init) {
-		ret = priv->kms->funcs->debugfs_init(priv->kms, minor);
-		if (ret)
-			return ret;
+		priv->kms->funcs->debugfs_init(priv->kms, minor);
 	}
-
-	return ret;
 }
 #endif
 
diff --git a/drivers/gpu/drm/msm/msm_debugfs.h b/drivers/gpu/drm/msm/msm_debugfs.h
index 2b91f8c178ad..ef58f66abbb3 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.h
+++ b/drivers/gpu/drm/msm/msm_debugfs.h
@@ -8,7 +8,7 @@
 #define __MSM_DEBUGFS_H__
 
 #ifdef CONFIG_DEBUG_FS
-int msm_debugfs_init(struct drm_minor *minor);
+void msm_debugfs_init(struct drm_minor *minor);
 #endif
 
 #endif /* __MSM_DEBUGFS_H__ */
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index be5bc2e8425c..6ccae4ba905c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -57,7 +57,7 @@ struct msm_gpu_funcs {
 	void (*show)(struct msm_gpu *gpu, struct msm_gpu_state *state,
 			struct drm_printer *p);
 	/* for generation specific debugfs: */
-	int (*debugfs_init)(struct msm_gpu *gpu, struct drm_minor *minor);
+	void (*debugfs_init)(struct msm_gpu *gpu, struct drm_minor *minor);
 #endif
 	unsigned long (*gpu_busy)(struct msm_gpu *gpu);
 	struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
