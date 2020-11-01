Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 240052A2090
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECEE6E12D;
	Sun,  1 Nov 2020 17:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426796E12D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 17:40:24 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 77F421F44AA4;
 Sun,  1 Nov 2020 17:40:22 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] drm/panfrost: Fix a deadlock between the shrinker and madvise
 path
Date: Sun,  1 Nov 2020 18:40:16 +0100
Message-Id: <20201101174016.839110-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Christian Hewitt <christianshewitt@gmail.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

panfrost_ioctl_madvise() and panfrost_gem_purge() acquire the mappings
and shmem locks in different orders, thus leading to a potential
the mappings lock first.

Fixes: bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
Cc: <stable@vger.kernel.org>
Cc: Christian Hewitt <christianshewitt@gmail.com>
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c          |  4 +---
 drivers/gpu/drm/panfrost/panfrost_gem.h          |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c | 14 +++++++++++---
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index cdf1a8754eba..0c0243eaee81 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -105,14 +105,12 @@ void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping)
 	kref_put(&mapping->refcount, panfrost_gem_mapping_release);
 }
 
-void panfrost_gem_teardown_mappings(struct panfrost_gem_object *bo)
+void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo)
 {
 	struct panfrost_gem_mapping *mapping;
 
-	mutex_lock(&bo->mappings.lock);
 	list_for_each_entry(mapping, &bo->mappings.list, node)
 		panfrost_gem_teardown_mapping(mapping);
-	mutex_unlock(&bo->mappings.lock);
 }
 
 int panfrost_gem_open(struct drm_gem_object *obj, struct drm_file *file_priv)
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index b3517ff9630c..8088d5fd8480 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -82,7 +82,7 @@ struct panfrost_gem_mapping *
 panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
 			 struct panfrost_file_priv *priv);
 void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping);
-void panfrost_gem_teardown_mappings(struct panfrost_gem_object *bo);
+void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
 
 void panfrost_gem_shrinker_init(struct drm_device *dev);
 void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index 288e46c40673..1b9f68d8e9aa 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -40,18 +40,26 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+	bool ret = false;
 
 	if (atomic_read(&bo->gpu_usecount))
 		return false;
 
-	if (!mutex_trylock(&shmem->pages_lock))
+	if (!mutex_trylock(&bo->mappings.lock))
 		return false;
 
-	panfrost_gem_teardown_mappings(bo);
+	if (!mutex_trylock(&shmem->pages_lock))
+		goto unlock_mappings;
+
+	panfrost_gem_teardown_mappings_locked(bo);
 	drm_gem_shmem_purge_locked(obj);
+	ret = true;
 
 	mutex_unlock(&shmem->pages_lock);
-	return true;
+
+unlock_mappings:
+	mutex_unlock(&bo->mappings.lock);
+	return ret;
 }
 
 static unsigned long
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
