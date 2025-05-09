Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7DBAB1753
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 16:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA78010E2C4;
	Fri,  9 May 2025 14:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mlFaRE7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CD510E26D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 14:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xcMcmNP1V8nnDAsJC1Qdyo8awocg5tbRjm5hYQIYwCA=; b=mlFaRE7goJIA7a/dtWhjCovRGq
 A+A6iQc8RvBHnZOCzA0XKdfCzoMcwk4G2LzosXd24ED+Z53q2pUrAtpltZJ2/4BYRrrGJr5CV8AbM
 adlbmTJMl0YaAM1Bh9J6zShqOX1OdPK1h8MZPH39ne6BfMrfqDLHYNdRD8O01dET+lgrDAW9AReD4
 CkDp3LnnuN92oSLxm1NvjJuEn+qydL9Xl8p9irqBBRFUu+CFK1i6vJZ4yKBIRyAlI+7ni7/uoQjN4
 CWgQTnGj3Yk1srYMBGR7moMYGw8tW6yTPUROXcCE6W3CICq8kJv58fF0BcfTxkEDD35uvZiAe/9jj
 sGh7VhPA==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uDObs-005mcX-BF; Fri, 09 May 2025 16:26:32 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Kees Cook <keescook@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH] drm: drm_auth: Convert mutex usage to guard(mutex)
Date: Fri,  9 May 2025 11:26:27 -0300
Message-ID: <20250509142627.639419-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Replace open-coded mutex handling with cleanup.h guard(mutex). This
simplifies the code and removes the "goto unlock" pattern.

Tested with igt tests core_auth and core_setmaster.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---

For more information about guard(mutex):
https://www.kernel.org/doc/html/latest/core-api/cleanup.html
---
 drivers/gpu/drm/drm_auth.c | 64 ++++++++++++++------------------------
 1 file changed, 23 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 22aa015df387..d6bf605b4b90 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -95,7 +95,7 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 	struct drm_auth *auth = data;
 	int ret = 0;
 
-	mutex_lock(&dev->master_mutex);
+	guard(mutex)(&dev->master_mutex);
 	if (!file_priv->magic) {
 		ret = idr_alloc(&file_priv->master->magic_map, file_priv,
 				1, 0, GFP_KERNEL);
@@ -103,7 +103,6 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			file_priv->magic = ret;
 	}
 	auth->magic = file_priv->magic;
-	mutex_unlock(&dev->master_mutex);
 
 	drm_dbg_core(dev, "%u\n", auth->magic);
 
@@ -118,13 +117,12 @@ int drm_authmagic(struct drm_device *dev, void *data,
 
 	drm_dbg_core(dev, "%u\n", auth->magic);
 
-	mutex_lock(&dev->master_mutex);
+	guard(mutex)(&dev->master_mutex);
 	file = idr_find(&file_priv->master->magic_map, auth->magic);
 	if (file) {
 		file->authenticated = 1;
 		idr_replace(&file_priv->master->magic_map, NULL, auth->magic);
 	}
-	mutex_unlock(&dev->master_mutex);
 
 	return file ? 0 : -EINVAL;
 }
@@ -248,41 +246,33 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 {
 	int ret;
 
-	mutex_lock(&dev->master_mutex);
+	guard(mutex)(&dev->master_mutex);
 
 	ret = drm_master_check_perm(dev, file_priv);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	if (drm_is_current_master_locked(file_priv))
-		goto out_unlock;
+		return ret;
 
-	if (dev->master) {
-		ret = -EBUSY;
-		goto out_unlock;
-	}
+	if (dev->master)
+		return -EBUSY;
 
-	if (!file_priv->master) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
+	if (!file_priv->master)
+		return -EINVAL;
 
-	if (!file_priv->is_master) {
-		ret = drm_new_set_master(dev, file_priv);
-		goto out_unlock;
-	}
+	if (!file_priv->is_master)
+		return drm_new_set_master(dev, file_priv);
 
 	if (file_priv->master->lessor != NULL) {
 		drm_dbg_lease(dev,
 			      "Attempt to set lessee %d as master\n",
 			      file_priv->master->lessee_id);
-		ret = -EINVAL;
-		goto out_unlock;
+		return -EINVAL;
 	}
 
 	drm_set_master(dev, file_priv, false);
-out_unlock:
-	mutex_unlock(&dev->master_mutex);
+
 	return ret;
 }
 
@@ -299,33 +289,27 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 {
 	int ret;
 
-	mutex_lock(&dev->master_mutex);
+	guard(mutex)(&dev->master_mutex);
 
 	ret = drm_master_check_perm(dev, file_priv);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
-	if (!drm_is_current_master_locked(file_priv)) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
+	if (!drm_is_current_master_locked(file_priv))
+		return -EINVAL;
 
-	if (!dev->master) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
+	if (!dev->master)
+		return -EINVAL;
 
 	if (file_priv->master->lessor != NULL) {
 		drm_dbg_lease(dev,
 			      "Attempt to drop lessee %d as master\n",
 			      file_priv->master->lessee_id);
-		ret = -EINVAL;
-		goto out_unlock;
+		return -EINVAL;
 	}
 
 	drm_drop_master(dev, file_priv);
-out_unlock:
-	mutex_unlock(&dev->master_mutex);
+
 	return ret;
 }
 
@@ -337,7 +321,7 @@ int drm_master_open(struct drm_file *file_priv)
 	/* if there is no current master make this fd it, but do not create
 	 * any master object for render clients
 	 */
-	mutex_lock(&dev->master_mutex);
+	guard(mutex)(&dev->master_mutex);
 	if (!dev->master) {
 		ret = drm_new_set_master(dev, file_priv);
 	} else {
@@ -345,7 +329,6 @@ int drm_master_open(struct drm_file *file_priv)
 		file_priv->master = drm_master_get(dev->master);
 		spin_unlock(&file_priv->master_lookup_lock);
 	}
-	mutex_unlock(&dev->master_mutex);
 
 	return ret;
 }
@@ -355,7 +338,7 @@ void drm_master_release(struct drm_file *file_priv)
 	struct drm_device *dev = file_priv->minor->dev;
 	struct drm_master *master;
 
-	mutex_lock(&dev->master_mutex);
+	guard(mutex)(&dev->master_mutex);
 	master = file_priv->master;
 	if (file_priv->magic)
 		idr_remove(&file_priv->master->magic_map, file_priv->magic);
@@ -376,7 +359,6 @@ void drm_master_release(struct drm_file *file_priv)
 	/* drop the master reference held by the file priv */
 	if (file_priv->master)
 		drm_master_put(&file_priv->master);
-	mutex_unlock(&dev->master_mutex);
 }
 
 /**
-- 
2.49.0

