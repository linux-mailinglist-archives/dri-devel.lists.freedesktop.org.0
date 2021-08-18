Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000F33EFDEB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 09:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAAF6E45C;
	Wed, 18 Aug 2021 07:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039426E45C;
 Wed, 18 Aug 2021 07:40:47 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id 7so1267503pfl.10;
 Wed, 18 Aug 2021 00:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mFOgIpjzv+0bmcGv4vm2OOJINfqELHBLGwipgYh0veE=;
 b=o+x1KZlkVTKqKNyo5p3TLMCoT0qWpyoPnNTtq+ITkI4Pzgmqcny9JnnM6+BU32Ic++
 NIHLgw53T6dLUv4xSKK8r51aNniDvQ256JSzhIFWVVBCxd8yiYCtzftljjsKNkgI5T9a
 uVuTiOrkTpn378RVUD7dUnndTDVWNJOnjwXaJrR5wihPkrhlaezlgg83nqDCMXWOY1Ww
 C+8x5Ub+11oRbFZInkBkF8WSnGMY9Yui8rSGNBlTPjq5y4kkvfCGzvD5Y9Dn0cG8nEL9
 3Bm8bUE/ETlXNItyff701RIdDHlHTrmfLXV2HgwhJy2IE1LVstkrXOJwBlc2/60be+zB
 SLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mFOgIpjzv+0bmcGv4vm2OOJINfqELHBLGwipgYh0veE=;
 b=Ff4/78FNj6/gronOuxr7RcL30wuSV4XUxGdasp5+DBw5K4LF5cRMX9m5AmMCvecrMf
 e3YUmFWbTmzVGLLOvFwKmaXUo0P/TYNcqMjr6lwc86AJfvbWDitqF1qJBJKuwuJBdnT2
 gLEzLlWaWK9Bce8rJyCAMjNLl2QTu9XOoZaXkjwchO9NYtsyBuVeo6ygNnhdQKtzyt/v
 ISPIIeHiYNCKItX2QCXST07yuIlK2juIWdCqhrFpQU+iJC4J+qmAjeUvZKIfDK6eFwLC
 ZtCEuXmLROB0Bj3+hVyZy/bpg4N9Vk1FVSGSlGyi4I2ZGpKwhBmsAs/ffXzJWkYZMITA
 +c1w==
X-Gm-Message-State: AOAM533BdFLt7IS7HItm3BVNEQz0qHLfG4brD4oPnx65frpUfrphvHfn
 szEi2O9j5HXUtT+6KarvX1Y=
X-Google-Smtp-Source: ABdhPJxBMmWazD9VqaTxeOw102ORy+uNq4+YO72IPobEWWxoH8LISt1jcYAt8BMciaPRg1MZYxt1pA==
X-Received: by 2002:a63:b1a:: with SMTP id 26mr7471369pgl.12.1629272446700;
 Wed, 18 Aug 2021 00:40:46 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:40:46 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3 4/9] drm: fix potential null ptr dereferences in drm_{auth,
 ioctl}
Date: Wed, 18 Aug 2021 15:38:19 +0800
Message-Id: <20210818073824.1560124-5-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are three areas where we dereference struct drm_master without
checking if the pointer is non-NULL.

1. drm_getmagic is called from the ioctl_handler. Since
DRM_IOCTL_GET_MAGIC has no ioctl flags, drm_getmagic is run without
any check that drm_file.master has been set.

2. Similarly, drm_getunique is called from the ioctl_handler, but
DRM_IOCTL_GET_UNIQUE has no ioctl flags. So there is no guarantee that
drm_file.master has been set.

3. drm_master_release can also be called without having a
drm_file.master set. Here is one error path:
  drm_open():
    drm_open_helper():
      drm_master_open():
        drm_new_set_master(); <--- returns -ENOMEM,
                                   drm_file.master not set
      drm_file_free():
        drm_master_release(); <--- NULL ptr dereference
                                   (file_priv->master->magic_map)

Fix these by checking if the master pointers are NULL before use.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c  | 16 ++++++++++++++--
 drivers/gpu/drm/drm_ioctl.c |  5 +++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f9267b21556e..b7230604496b 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -95,11 +95,18 @@ EXPORT_SYMBOL(drm_is_current_master);
 int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct drm_auth *auth = data;
+	struct drm_master *master;
 	int ret = 0;
 
 	mutex_lock(&dev->master_mutex);
+	master = file_priv->master;
+	if (!master) {
+		mutex_unlock(&dev->master_mutex);
+		return -EINVAL;
+	}
+
 	if (!file_priv->magic) {
-		ret = idr_alloc(&file_priv->master->magic_map, file_priv,
+		ret = idr_alloc(&master->magic_map, file_priv,
 				1, 0, GFP_KERNEL);
 		if (ret >= 0)
 			file_priv->magic = ret;
@@ -355,8 +362,12 @@ void drm_master_release(struct drm_file *file_priv)
 
 	mutex_lock(&dev->master_mutex);
 	master = file_priv->master;
+
+	if (!master)
+		goto unlock;
+
 	if (file_priv->magic)
-		idr_remove(&file_priv->master->magic_map, file_priv->magic);
+		idr_remove(&master->magic_map, file_priv->magic);
 
 	if (!drm_is_current_master_locked(file_priv))
 		goto out;
@@ -379,6 +390,7 @@ void drm_master_release(struct drm_file *file_priv)
 		drm_master_put(&file_priv->master);
 		spin_unlock(&dev->master_lookup_lock);
 	}
+unlock:
 	mutex_unlock(&dev->master_mutex);
 }
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 26f3a9ede8fe..4d029d3061d9 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -121,6 +121,11 @@ int drm_getunique(struct drm_device *dev, void *data,
 
 	mutex_lock(&dev->master_mutex);
 	master = file_priv->master;
+	if (!master) {
+		mutex_unlock(&dev->master_mutex);
+		return -EINVAL;
+	}
+
 	if (u->unique_len >= master->unique_len) {
 		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
 			mutex_unlock(&dev->master_mutex);
-- 
2.25.1

