Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E03A697E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 17:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C910289DD5;
	Mon, 14 Jun 2021 15:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C42989D8E;
 Mon, 14 Jun 2021 15:02:28 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id q15so8841091pgg.12;
 Mon, 14 Jun 2021 08:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RzDEDEpKBts6WNgQTxPyJR77ugNq0XTyo2edIkuGISA=;
 b=c7p5ZyWkblyeOc02Ule8fxjbb5vcHADAStMUSZXgY/Z9P0NcjVnr3Qrty9TUMiXaa6
 Uyp7DlGp34QsrZTSpQu2jHFZBDjYRCx3PkGgP7HYKZ7nchXcFnQPK6ZP49JLN3pID7Nq
 UahXGtROhEgvDnoRAUdWZgBtfqketLiOCiB76pxsnGai0Xx9g8yIIGwYd9UXgDhbxAvj
 /403+lRSoExBjQRLzPgMKqNs2QRDNqVb9y8EXLHhZWkqfn/wWKi42EfHCPt+d/APLxvy
 bRwHPUPehJrXFdN9lxmAxdHWQPsncnIeFkRiIKfxpgO9fM/4Oh7kjwDbzMr/4h6NYv18
 qeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RzDEDEpKBts6WNgQTxPyJR77ugNq0XTyo2edIkuGISA=;
 b=AhSLDN9er8W2x+NyR5sEBt3YcpsBDjkmRo0PQMolGoWrKHGguSWuJ+H+fJD1dBqipo
 hMnVImwar27vFc1cCG+LcO49ci14y2sG/la5kjWDUqRqzdzZYyr7/rY8OSWD+gcpWkVn
 hzmdPPc+vrjZF8nWzonkoSrIFq8kg/I6ZHqO3urGLiJUNlmJaBwjEXa9ZMfN7cW/nmat
 V1W7a49dwFTEsbw5ENp6qWyPWETAzvXIBilJ39C9zU3c8kLLHidjsIit8wHkAXNwDqjQ
 g+BuXaVRGkQ39raxJXpiJlDRN//aJSyZnsq18c+Dk+7sjybMiN6irDRkzl7fyiXw3hLb
 HLXQ==
X-Gm-Message-State: AOAM532jnTgcpOapmvNQFgHMzCr71CVqNkbrPKLGEjZ+YFPu/oGnyViY
 1Fvr8QzWLgX969T8zWxPHJ2GBttmDCM=
X-Google-Smtp-Source: ABdhPJzwb3/RHK7wDcLYlRy6N9DIv5cLskk99lnqJQ5GlUoNBwWTK3dABhbu2k9f1vFfvCIUp9LG/Q==
X-Received: by 2002:a63:5f46:: with SMTP id t67mr17835519pgb.37.1623682947164; 
 Mon, 14 Jun 2021 08:02:27 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 n23sm13217072pff.93.2021.06.14.08.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:02:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Add debugfs to trigger shrinker
Date: Mon, 14 Jun 2021 08:06:18 -0700
Message-Id: <20210614150618.729610-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Just for the purposes of testing.  Write to it the # of objects to scan,
read back the # freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c      | 28 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h          |  4 ++++
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 18 +++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index d611cc8e54a4..7a2b53d35e6b 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -108,6 +108,31 @@ static const struct file_operations msm_gpu_fops = {
 	.release = msm_gpu_release,
 };
 
+static unsigned long last_shrink_freed;
+
+static int
+shrink_get(void *data, u64 *val)
+{
+	*val = last_shrink_freed;
+
+	return 0;
+}
+
+static int
+shrink_set(void *data, u64 val)
+{
+	struct drm_device *dev = data;
+
+	last_shrink_freed = msm_gem_shrinker_shrink(dev, val);
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(shrink_fops,
+			shrink_get, shrink_set,
+			"0x%08llx\n");
+
+
 static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -226,6 +251,9 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
+	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
+		dev, &shrink_fops);
+
 	if (priv->kms && priv->kms->funcs->debugfs_init)
 		priv->kms->funcs->debugfs_init(priv->kms, minor);
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3352125ce428..b58c9d1cc5f1 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -296,6 +296,10 @@ bool msm_use_mmu(struct drm_device *dev);
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
+#ifdef CONFIG_DEBUG_FS
+unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan);
+#endif
+
 void msm_gem_shrinker_init(struct drm_device *dev);
 void msm_gem_shrinker_cleanup(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 1187ecf9d647..0f1b29ee04a9 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -145,6 +145,24 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	return (freed > 0) ? freed : SHRINK_STOP;
 }
 
+#ifdef CONFIG_DEBUG_FS
+unsigned long
+msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct shrink_control sc = {
+		.nr_to_scan = nr_to_scan,
+	};
+	int ret;
+
+	fs_reclaim_acquire(GFP_KERNEL);
+	ret = msm_gem_shrinker_scan(&priv->shrinker, &sc);
+	fs_reclaim_release(GFP_KERNEL);
+
+	return ret;
+}
+#endif
+
 /* since we don't know any better, lets bail after a few
  * and if necessary the shrinker will be invoked again.
  * Seems better than unmapping *everything*
-- 
2.31.1

