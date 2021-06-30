Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122A43B858B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 16:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2668C6E9F8;
	Wed, 30 Jun 2021 14:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456616E9F8;
 Wed, 30 Jun 2021 14:55:59 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id l11so1912278pji.5;
 Wed, 30 Jun 2021 07:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtdxbqSeV/2csKmNSvUS45gYT6/rPtvycxiemXQFqoE=;
 b=PN6u8eiDV5DESHx+RsGe9Co74bFfrnP5XFh9U/KxoIUqISzrMtaU//FSpndLXYaEqO
 OPpVb6Qnlf0NNoNtmSX04iiIdE/1duZpMXrBLDCHq3At7L7bmbsFZOpBkifbO05YhCmt
 tDyhD3PUKSnBSIUZfOHjnrs9+QdlUdUjkStg4R+6kZmP+2F+auyDszxxwYOp3jg/VKXr
 CsDay4+9a9xTXQDIa3mbw9h9WekB4bFnjHOk3Ks4doCy4dRagcNZQHPjKVlMAKuv7RJF
 2MORgECv93S+0LPXLTWkWQjzxTTHFqOoTC3x5zy4cVRTPLGEkRJSVjh7wiiftXVPs/5E
 R7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtdxbqSeV/2csKmNSvUS45gYT6/rPtvycxiemXQFqoE=;
 b=ZgN3y5THuLr4UgClZxMkL6J2zyF/g8o7UzKG3q6LzbAl2sid9axh1b+TVyz1fXVeSO
 ZMKI2C910HM1J3aN5TVEVafs43etLQw8Q0owmqg5W8e2lJXzz0HZyD7UwM8Lm7CEpkhO
 udnrIjrTiF9JMdHaTgxBnDdlzKieg84rJB/GNC6AgVfMGiPB4gtEwgg5pUfAqDNNIHeh
 1UO7XKX3aPSKdj3HkKVvjvI/+oijBcxf9QTnzPqNDwYR/IP9qwhHDBxReAlgvpR0QqIr
 WYLZcP98aDfNjo2aE7NsmqyrV/NETZzlJ6QY6hV+0JxTANk5Fha4b7EkE5Qi77hPOSKX
 PxDA==
X-Gm-Message-State: AOAM533noyK91nMTbjEQvf9E9Sk94L8NwxTCna6k8FojHaXC7qmF+Cp8
 tdH6OXb/qzf/YZJgqxnGvV8=
X-Google-Smtp-Source: ABdhPJw8QsA5Ov2ap/McNShIZ3+kvdZIh2SptPjBMN/D7nE5je4eczXEAJ8ur1RuJs5yWKKQVsAeDg==
X-Received: by 2002:a17:902:b210:b029:11a:bf7b:1a83 with SMTP id
 t16-20020a170902b210b029011abf7b1a83mr32636110plr.84.1625064958876; 
 Wed, 30 Jun 2021 07:55:58 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id d13sm7157234pjr.49.2021.06.30.07.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 07:55:58 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v6 3/4] drm: add a locked version of drm_is_current_master
Date: Wed, 30 Jun 2021 22:54:03 +0800
Message-Id: <20210630145404.5958-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630145404.5958-1-desmondcheongzx@gmail.com>
References: <20210630145404.5958-1-desmondcheongzx@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While checking the master status of the DRM file in
drm_is_current_master(), the device's master mutex should be
held. Without the mutex, the pointer fpriv->master may be freed
concurrently by another process calling drm_setmaster_ioctl(). This
could lead to use-after-free errors when the pointer is subsequently
dereferenced in drm_lease_owner().

The callers of drm_is_current_master() from drm_auth.c hold the
device's master mutex, but external callers do not. Hence, we implement
drm_is_current_master_locked() to be used within drm_auth.c, and
modify drm_is_current_master() to grab the device's master mutex
before checking the master status.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 51 ++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f00e5abdbbf4..ab1863c5a5a0 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -61,6 +61,35 @@
  * trusted clients.
  */
 
+static bool drm_is_current_master_locked(struct drm_file *fpriv)
+{
+	lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
+
+	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
+}
+
+/**
+ * drm_is_current_master - checks whether @priv is the current master
+ * @fpriv: DRM file private
+ *
+ * Checks whether @fpriv is current master on its device. This decides whether a
+ * client is allowed to run DRM_MASTER IOCTLs.
+ *
+ * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
+ * - the current master is assumed to own the non-shareable display hardware.
+ */
+bool drm_is_current_master(struct drm_file *fpriv)
+{
+	bool ret;
+
+	mutex_lock(&fpriv->minor->dev->master_mutex);
+	ret = drm_is_current_master_locked(fpriv);
+	mutex_unlock(&fpriv->minor->dev->master_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_is_current_master);
+
 int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct drm_auth *auth = data;
@@ -223,7 +252,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_unlock;
 
-	if (drm_is_current_master(file_priv))
+	if (drm_is_current_master_locked(file_priv))
 		goto out_unlock;
 
 	if (dev->master) {
@@ -272,7 +301,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_unlock;
 
-	if (!drm_is_current_master(file_priv)) {
+	if (!drm_is_current_master_locked(file_priv)) {
 		ret = -EINVAL;
 		goto out_unlock;
 	}
@@ -321,7 +350,7 @@ void drm_master_release(struct drm_file *file_priv)
 	if (file_priv->magic)
 		idr_remove(&file_priv->master->magic_map, file_priv->magic);
 
-	if (!drm_is_current_master(file_priv))
+	if (!drm_is_current_master_locked(file_priv))
 		goto out;
 
 	drm_legacy_lock_master_cleanup(dev, master);
@@ -342,22 +371,6 @@ void drm_master_release(struct drm_file *file_priv)
 	mutex_unlock(&dev->master_mutex);
 }
 
-/**
- * drm_is_current_master - checks whether @priv is the current master
- * @fpriv: DRM file private
- *
- * Checks whether @fpriv is current master on its device. This decides whether a
- * client is allowed to run DRM_MASTER IOCTLs.
- *
- * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
- * - the current master is assumed to own the non-shareable display hardware.
- */
-bool drm_is_current_master(struct drm_file *fpriv)
-{
-	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
-}
-EXPORT_SYMBOL(drm_is_current_master);
-
 /**
  * drm_master_get - reference a master pointer
  * @master: &struct drm_master
-- 
2.25.1

