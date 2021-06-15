Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5833A7423
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 04:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45A86E1D6;
	Tue, 15 Jun 2021 02:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA246E1D6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 02:38:55 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id q25so12124674pfh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 19:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XQEEdyk0NzKb35RO0y38pkKvyWvf0lxEsS58qIRhZcM=;
 b=csiw/WfS29jheZnkm94OQ4yhoiGR2OjIoj9LZItuvnR7+r8BRa7Ul3+TLW56kaMygX
 pOTKKfLS1c5qtDgvrsbVTmryY4Jcks4EjSi5v2hgSsjEgUr81669Cd/yuwq4w/BOeb9+
 zEdmD2PQpRm/AVcOcUfV6d79spsn1qjxAxzg7LL2fct2AmOP/MAtWX1SM8APsjujmZ79
 nEHylOmlxpiL0GTvWjUtKqGm82ITAy6vfyy9m2fjNf2JsZos5V7NHiSVKdZeX56ZAlrb
 AZMvIS9/F2NxPKPR2uRsrzO5rgVT2bkon0isYdGBgnftSo/6OcGU30CjgCEW2BLbJHiL
 di8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XQEEdyk0NzKb35RO0y38pkKvyWvf0lxEsS58qIRhZcM=;
 b=FruxTreYzKzClvcCLN8rV7UuqAD9z1vTGnpzI3ng97UQxPLEMWneGQy+b0KwP/yKtq
 6oingaD9JDZSwJrJk1vriDsFvodDg4kXdEEKjAt2kjdVqlMSNIvud/Cs0rv4YQ/S3M6P
 YT2hMfdW5G/jg3aNs6z67zs/PMgDTMwGx3jLHl5XsekG+WbimuXVR5V9ycYz2TjUUsYG
 TqhTxpQhKx01v4XF3YQ0G7Lu29A6hJxdz6qociO35k9VhsSlgqG4fPeOl+AFy8iVOv8l
 GpxfEwa9iq3JcS0wIKQDuWidG8usJWrDcKMwLHnR/FkTeOuA36hPHgOvDU1MHvTHv1vS
 bqKQ==
X-Gm-Message-State: AOAM532QXls0+0DN2aQP6ccEmaVl05SfClgEKxolsWy5SgeBOBiv8KmQ
 me4QviJ8h+PcYRqNGfRpplU=
X-Google-Smtp-Source: ABdhPJyaiilAsFiEUsynNx2CFjcrxs+pNl9qDqxB9K/57S4yFR9jE9Y0VjAxz+Gwf/y4biQTQ3nhfQ==
X-Received: by 2002:a65:5b0d:: with SMTP id y13mr19853174pgq.165.1623724734847; 
 Mon, 14 Jun 2021 19:38:54 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id b133sm14102623pfb.36.2021.06.14.19.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 19:38:54 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 1/2] drm: Add a locked version of drm_is_current_master
Date: Tue, 15 Jun 2021 10:36:44 +0800
Message-Id: <20210615023645.6535-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615023645.6535-1-desmondcheongzx@gmail.com>
References: <20210615023645.6535-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
 drivers/gpu/drm/drm_auth.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 232abbba3686..c6bf52c310a9 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -61,6 +61,8 @@
  * trusted clients.
  */
 
+static bool drm_is_current_master_locked(struct drm_file *fpriv);
+
 int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct drm_auth *auth = data;
@@ -223,7 +225,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_unlock;
 
-	if (drm_is_current_master(file_priv))
+	if (drm_is_current_master_locked(file_priv))
 		goto out_unlock;
 
 	if (dev->master) {
@@ -272,7 +274,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_unlock;
 
-	if (!drm_is_current_master(file_priv)) {
+	if (!drm_is_current_master_locked(file_priv)) {
 		ret = -EINVAL;
 		goto out_unlock;
 	}
@@ -321,7 +323,7 @@ void drm_master_release(struct drm_file *file_priv)
 	if (file_priv->magic)
 		idr_remove(&file_priv->master->magic_map, file_priv->magic);
 
-	if (!drm_is_current_master(file_priv))
+	if (!drm_is_current_master_locked(file_priv))
 		goto out;
 
 	drm_legacy_lock_master_cleanup(dev, master);
@@ -342,6 +344,13 @@ void drm_master_release(struct drm_file *file_priv)
 	mutex_unlock(&dev->master_mutex);
 }
 
+static bool drm_is_current_master_locked(struct drm_file *fpriv)
+{
+	lockdep_assert_held_once(&fpriv->master->dev->master_mutex);
+
+	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
+}
+
 /**
  * drm_is_current_master - checks whether @priv is the current master
  * @fpriv: DRM file private
@@ -354,7 +363,13 @@ void drm_master_release(struct drm_file *file_priv)
  */
 bool drm_is_current_master(struct drm_file *fpriv)
 {
-	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
+	bool ret;
+
+	mutex_lock(&fpriv->master->dev->master_mutex);
+	ret = drm_is_current_master_locked(fpriv);
+	mutex_unlock(&fpriv->master->dev->master_mutex);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_is_current_master);
 
-- 
2.25.1

