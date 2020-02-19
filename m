Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02BA1641A5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CE96EB62;
	Wed, 19 Feb 2020 10:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E7A6EB57
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id n3so3666701wmk.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjVhUH7zbHcsa41VUx/uj7E36n3v+QpbT1j8xCe4w8c=;
 b=ZFEgmxmBmaOurWVI9aVvHBBVbi8jEFViS8jbG3pXw3J47rPWmUkhmtBzJdOdmQNCZi
 FdbDei23uETvhNfDlVqiI4XdLuTBgzwUngddDIzb9DzvPivS5juoV8hwFz42SUkut/hD
 3upSFQ3q89YEDDdxE4JcZY6r9LmFbgkhnkf20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PjVhUH7zbHcsa41VUx/uj7E36n3v+QpbT1j8xCe4w8c=;
 b=LGLFTUiXgoldwTX5fjO2hrwJG/EiRQcnlt5agd1RIA5vwWnouBVhRxRGvYgJk81BrA
 C++kM8x4CuN3IxYKiN3oYd5FhpDbriprYiHHqQAd+KdldQ4/mwHeWeap4VT8IRX+Xs/J
 e+C+YvTZbX1vjJ1oxc64Gs3WEVWVZtw+M2QwHPadEdnvNA+mqg0FpHb6f30OFevu3iJV
 yFDCO67ADxFw3H2O2MlWUo8oAjbyZRr7IRPAY7M30iL3Wjq7VnJYSDtt86JZBzegpqxx
 l1EP7AOMLlzmFwEvDxx6rJ8oc/DInSTjYEbk8zRzaoSJcOTJmSV5i49MVkuxJW3XDEQC
 74GQ==
X-Gm-Message-State: APjAAAW46gl2PrXLHZNZ4B8LSKY+380p2cCZDoN7wmgl5Tj2A7vwWkI0
 rwU2ELWqGrRhFcFElmJuKLaLQh90hME=
X-Google-Smtp-Source: APXvYqyQPimGbtYLdEUXWCHZ856exVNGDRM2NggBj1M6XoTv80pu8BCSCI4lWbOmgd6YbxLFGfKXIw==
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr9098181wmj.27.1582107716715; 
 Wed, 19 Feb 2020 02:21:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:56 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 21/52] drm: Handle dev->unique with drmm_
Date: Wed, 19 Feb 2020 11:20:51 +0100
Message-Id: <20200219102122.1607365-22-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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

We need to add a drmm_kstrdup for this, but let's start somewhere.

This is not exactly perfect onion unwinding, but it's jsut a kfree so
doesn't really matter at all.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c     |  5 ++---
 drivers/gpu/drm/drm_managed.c | 16 ++++++++++++++++
 include/drm/drm_managed.h     |  1 +
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 1ee606b4a4f9..782fd5d6f8b2 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -777,7 +777,6 @@ void drm_dev_fini(struct drm_device *dev)
 	mutex_destroy(&dev->filelist_mutex);
 	mutex_destroy(&dev->struct_mutex);
 	drm_legacy_destroy_members(dev);
-	kfree(dev->unique);
 }
 EXPORT_SYMBOL(drm_dev_fini);
 
@@ -1063,8 +1062,8 @@ EXPORT_SYMBOL(drm_dev_unregister);
  */
 int drm_dev_set_unique(struct drm_device *dev, const char *name)
 {
-	kfree(dev->unique);
-	dev->unique = kstrdup(name, GFP_KERNEL);
+	drmm_kfree(dev, dev->unique);
+	dev->unique = drmm_kstrdup(dev, name, GFP_KERNEL);
 
 	return dev->unique ? 0 : -ENOMEM;
 }
diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index ee7c7253af61..d8a484e19830 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -147,6 +147,22 @@ void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
 }
 EXPORT_SYMBOL(drmm_kmalloc);
 
+char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp)
+{
+	size_t size;
+	char *buf;
+
+	if (!s)
+		return NULL;
+
+	size = strlen(s) + 1;
+	buf = drmm_kmalloc(dev, size, gfp);
+	if (buf)
+		memcpy(buf, s, size);
+	return buf;
+}
+EXPORT_SYMBOL_GPL(drmm_kstrdup);
+
 void drmm_kfree(struct drm_device *dev, void *data)
 {
 	struct drmres *dr = NULL, *tmp;
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index 75f2c8932c69..240edd395e88 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -21,5 +21,6 @@ static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, gfp_t gfp)
 {
 	return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
 }
+char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
 
 void drmm_kfree(struct drm_device *dev, void *data);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
