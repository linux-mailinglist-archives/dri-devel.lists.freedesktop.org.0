Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E8E73B166
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1329110E601;
	Fri, 23 Jun 2023 07:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-46.mta1.migadu.com (out-46.mta1.migadu.com
 [IPv6:2001:41d0:203:375::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C51210E506
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:50:25 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1687423235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IxIKmzzZi67lG9XSJDebD80o50peuZjA/0wHZiu4cuU=;
 b=H8s1pQs4VGCf5n+ceh0zwRdlcTNNqN2Py3KDQXuVt1RkndP77diVR1uYW4KzkPkjEIKsys
 H7QDJljwElq7g1TzIAkvNua8zzlhkxB0H11gFgOBfIt7JJ6zRRMu3JZw1CdR8an7OABUut
 k6NXXYI9vzZtztWWnS9SmS/quoFvciQ=
From: Qi Zheng <qi.zheng@linux.dev>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Subject: [PATCH 05/29] drm/panfrost: dynamically allocate the drm-panfrost
 shrinker
Date: Thu, 22 Jun 2023 08:39:08 +0000
Message-Id: <20230622083932.4090339-6-qi.zheng@linux.dev>
In-Reply-To: <20230622083932.4090339-1-qi.zheng@linux.dev>
References: <20230622083932.4090339-1-qi.zheng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Fri, 23 Jun 2023 07:26:31 +0000
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
Cc: linux-bcache@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-raid@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 Qi Zheng <zhengqi.arch@bytedance.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Qi Zheng <zhengqi.arch@bytedance.com>

In preparation for implementing lockless slab shrink,
we need to dynamically allocate the drm-panfrost shrinker,
so that it can be freed asynchronously using kfree_rcu().
Then it doesn't need to wait for RCU read-side critical
section when releasing the struct panfrost_device.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 24 ++++++++++---------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index b0126b9fbadc..e667e5689353 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -118,7 +118,7 @@ struct panfrost_device {
 
 	struct mutex shrinker_lock;
 	struct list_head shrinker_list;
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 	struct panfrost_devfreq pfdevfreq;
 };
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index bf0170782f25..2a5513eb9e1f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -18,8 +18,7 @@
 static unsigned long
 panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct panfrost_device *pfdev =
-		container_of(shrinker, struct panfrost_device, shrinker);
+	struct panfrost_device *pfdev = shrinker->private_data;
 	struct drm_gem_shmem_object *shmem;
 	unsigned long count = 0;
 
@@ -65,8 +64,7 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
 static unsigned long
 panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct panfrost_device *pfdev =
-		container_of(shrinker, struct panfrost_device, shrinker);
+	struct panfrost_device *pfdev = shrinker->private_data;
 	struct drm_gem_shmem_object *shmem, *tmp;
 	unsigned long freed = 0;
 
@@ -100,10 +98,15 @@ panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 void panfrost_gem_shrinker_init(struct drm_device *dev)
 {
 	struct panfrost_device *pfdev = dev->dev_private;
-	pfdev->shrinker.count_objects = panfrost_gem_shrinker_count;
-	pfdev->shrinker.scan_objects = panfrost_gem_shrinker_scan;
-	pfdev->shrinker.seeks = DEFAULT_SEEKS;
-	WARN_ON(register_shrinker(&pfdev->shrinker, "drm-panfrost"));
+
+	pfdev->shrinker = shrinker_alloc_and_init(panfrost_gem_shrinker_count,
+						  panfrost_gem_shrinker_scan, 0,
+						  DEFAULT_SEEKS, 0, pfdev);
+	if (pfdev->shrinker &&
+	    register_shrinker(pfdev->shrinker, "drm-panfrost")) {
+		shrinker_free(pfdev->shrinker);
+		WARN_ON(1);
+	}
 }
 
 /**
@@ -116,7 +119,6 @@ void panfrost_gem_shrinker_cleanup(struct drm_device *dev)
 {
 	struct panfrost_device *pfdev = dev->dev_private;
 
-	if (pfdev->shrinker.nr_deferred) {
-		unregister_shrinker(&pfdev->shrinker);
-	}
+	if (pfdev->shrinker->nr_deferred)
+		unregister_and_free_shrinker(pfdev->shrinker);
 }
-- 
2.30.2

