Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F05243B6D16
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 05:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444766E7D9;
	Tue, 29 Jun 2021 03:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2935E6E5D5;
 Tue, 29 Jun 2021 03:38:09 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id kt19so3627588pjb.2;
 Mon, 28 Jun 2021 20:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9loa3KpkDErmzl3oFkCvkO2WisLBmhfHvqpUa9ZzsPk=;
 b=G7FSVe14ahODXBDr0BOl1sQvrjwoxJUpI+MZtNh+UHqMdVWVWqOPj9MivvWStR06X2
 Vhl0o617/jXzrD2xhg0wzaIulK1dXs6+HOz3c/ctcekjnNww7k1FBEuoY7idtNVJ3amv
 1bfmmtJ3vOsuGdYfVIamfuq4pZZTYIpoAPtGjJ798uZuVK58VkxX10viO7AEk7YJqYKo
 tELSjSxKmsLswcWvtsFDpGYeIda7VqPY0d4NzEb48dabA+8QIvRSv8QLlGtyAcjTmUrE
 ZcROH930Oj2nikUjPRjLBGYcbilDuLMSFkKtwsry3KNrjSL/CSPivDzNfTP3qH8KT1og
 nTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9loa3KpkDErmzl3oFkCvkO2WisLBmhfHvqpUa9ZzsPk=;
 b=QYjNb0tet4aty60f3X8EzMqiiV69EwnUtJjZBBZgIl46XyqhvFuKfjax9jSs7tz7q/
 6htY72JJsJMGpB1E5oAeURV9h6kb4se6oRiBBaaX75TtpfgcG7HMD1lBt8SguGyySG3E
 Zp0QqdFYvQV+efDlBGcgemhvmfoqGcdPbj71KVKtAhb2JKSy/SDH4mMXY2ZHxWYUmHpZ
 O54FCJTJIdkt3VL8IdzDezWSgJecxNZeFquui4tk4digH/whDdV8+A7jXvTwwCZJentO
 BdGyLZMTHcZSFk94DoT4z4lNaWu2DWEmAO16QdEo8a2bWxZSG+Gq168F16U9+O1W4lAi
 Eijw==
X-Gm-Message-State: AOAM532X5HOPMQWahZbfZU0/VQh1fo2J1LJtdPChFmAFaMqzTG713pI1
 3Mu1nlBn99tA17/yVNx4ExM=
X-Google-Smtp-Source: ABdhPJz/D9J1b63CEbXwSJs5uTLWoJbI5YphlETAMKdvibCjAxl3gOTyEuTaqfZxVIYE6+eijIDgng==
X-Received: by 2002:a17:90a:ea82:: with SMTP id
 h2mr10814482pjz.203.1624937888846; 
 Mon, 28 Jun 2021 20:38:08 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id d129sm14769076pfd.218.2021.06.28.20.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 20:38:08 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v5 2/3] drm: add a locked version of drm_is_current_master
Date: Tue, 29 Jun 2021 11:37:05 +0800
Message-Id: <20210629033706.20537-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629033706.20537-1-desmondcheongzx@gmail.com>
References: <20210629033706.20537-1-desmondcheongzx@gmail.com>
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

