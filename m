Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AF1774E34
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 00:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D9A10E116;
	Tue,  8 Aug 2023 22:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9913B10E115
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 22:22:50 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 30CF166071F7;
 Tue,  8 Aug 2023 23:22:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691533369;
 bh=VWCWv3TF6qDjaauYLhA34kcdzVSNugilzQyUxtVWXX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UH/RXcUK9/pOVCvakVoSWzoFiqvKMUQ/pMFDjWja3BohYJ9v5p1kXFwIuqS+fzfeo
 jXu5RjCk3H3HdmpMY5/yhGE6vB4pY2lBNnSpNM+bUBSCZwexsk0rPJFQUTREEeosOt
 PYD08tEceRK5GIBT0GahnidF5hG9cwGyXxaZvtlXzhHnHsBazb4R2uCzPz6cfVCKtZ
 4sfV+UMTUkukz2lYNdlajzF33F9OKGbTF3w5biiF3nGNWPBKyQkMc3xtrql6agY3Rw
 Org3I/QO0aXsA7gxPdBuoR/VcjhhfYTYVKxl2b/XzG7x+LASPMNbnrIkiLLYm6oAmu
 4Efj3q7HBC1Bw==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: robh@kernel.org, steven.price@arm.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 2/2] drm/panfrost: Add drm memory stats display through fdinfo
Date: Tue,  8 Aug 2023 23:22:39 +0100
Message-ID: <20230808222240.1016623-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230808222240.1016623-1-adrian.larumbe@collabora.com>
References: <20230808222240.1016623-1-adrian.larumbe@collabora.com>
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
Cc: adrian.larumbe@collabora.com, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For drm_show_memory_stats to produce a more accurate report, provide a new
Panfrost DRM object callback that decides whether an object is resident in
memory or eligible for purging.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c |  8 ++++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c | 16 ++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 65fdc0e4c7cb..46e8e69479c0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -441,11 +441,14 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 	args->retained = drm_gem_shmem_madvise(&bo->base, args->madv);
 
 	if (args->retained) {
-		if (args->madv == PANFROST_MADV_DONTNEED)
+		if (args->madv == PANFROST_MADV_DONTNEED) {
 			list_move_tail(&bo->base.madv_list,
 				       &pfdev->shrinker_list);
-		else if (args->madv == PANFROST_MADV_WILLNEED)
+			bo->is_purgable = true;
+		} else if (args->madv == PANFROST_MADV_WILLNEED) {
 			list_del_init(&bo->base.madv_list);
+			bo->is_purgable = false;
+		}
 	}
 
 out_unlock_mappings:
@@ -546,6 +549,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
 
+	drm_show_memory_stats(p, file);
 }
 
 static const struct file_operations panfrost_drm_driver_fops = {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 3c812fbd126f..80ab1521a14e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -195,6 +195,21 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
 	return drm_gem_shmem_pin(&bo->base);
 }
 
+static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj)
+{
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+	struct panfrost_device *pfdev = obj->dev->dev_private;
+	unsigned int res = 0;
+
+	mutex_lock(&pfdev->shrinker_lock);
+	res |= (bo->is_purgable) ? DRM_GEM_OBJECT_PURGEABLE : 0;
+	mutex_unlock(&pfdev->shrinker_lock);
+
+	res |= (bo->base.pages) ? DRM_GEM_OBJECT_RESIDENT : 0;
+
+	return res;
+}
+
 static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.free = panfrost_gem_free_object,
 	.open = panfrost_gem_open,
@@ -206,6 +221,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = drm_gem_shmem_object_mmap,
+	.status = panfrost_gem_status,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index ad2877eeeccd..e06f7ceb8f73 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -38,6 +38,7 @@ struct panfrost_gem_object {
 
 	bool noexec		:1;
 	bool is_heap		:1;
+	bool is_purgable	:1;
 };
 
 struct panfrost_gem_mapping {
-- 
2.41.0

