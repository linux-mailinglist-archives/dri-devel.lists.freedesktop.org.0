Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 983B0764B95
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23EC10E542;
	Thu, 27 Jul 2023 08:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B734310E542
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:15:46 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-682eef7d752so205252b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445746; x=1691050546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+VUr/yqCBhRzWtIhjCO81y0MQsQ8/nBil0vz0xF6BE=;
 b=TaRPl345AKbrAIMueUHfPwp1x6uI6QP6FYTf0gbRl5pBKvfKuQ+QWduLyPJpV8ScsL
 Q5TivksWMgrstH3HdJCskaPbEKYgZ24uChwqAdIFrOrWwAa2WQwZ8NT8kZyVgbNoH85T
 do2ODt4uNF4INjJdWRp+atPQdybcUxTwq7Q7CB0q5LWN8BolV4yvFIRahlHyro/xVHih
 Vepy/KyZesG0IyAMF6CRgG8Mi1ITRqBiZ02IP7raj5LrBsVY5eCkMeBoD4m40xyPsJDZ
 tcd1kL8KzTvRLgjfGcyP08MdoeQiDGrvVHZmsG1n2bLc4Z4qfZKKlhoGJ8kGn6E5dkaY
 Cwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445746; x=1691050546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V+VUr/yqCBhRzWtIhjCO81y0MQsQ8/nBil0vz0xF6BE=;
 b=jiX+gtDS1gRHHRABB76Djrk0FMrwP9bjSId1z9Cydc801a2lmFy3ain+m3NXdH0H+5
 /lVqitNF+15IMoxzIq4FheU9mvC4VsLWVmvseWKCgRPnh+d1SLPCycgO5okY7Y84Py9S
 N3h7n+VL0y/yhIJiL18WUcXQvKJl4N7YqXXXDseyR2aMrgr18N2V9qUmB7bNBcQWLGzw
 BZ1hgOAmaF7Yzyimz0W6UuIr6RfIt3uOgk2ThEEjChvT8mwCRagO6F+H+T/cl+iKxy+H
 wjsnaj9toFW2VHc5j8cvqI9YVkcgbkDIvWlEROY+7ueAPMGb/9Zi1mU46gVSW8fX1Pi3
 A8Tg==
X-Gm-Message-State: ABy/qLZrigNYVD10lM+pjTJXNVm1h0Jv6Daa8F778n0Ca2F4nBwfd6/k
 K1zUyvUxh3EVl627KG3aktk5QQ==
X-Google-Smtp-Source: APBJJlEPnp3RDXXbUxyHg3EG2jnu2Scq2lS38vCuYEIB7nQxuybwzYpkjm+dcqMi61BwYttNjNAkLg==
X-Received: by 2002:aa7:84d0:0:b0:686:bf43:60fa with SMTP id
 x16-20020aa784d0000000b00686bf4360famr5267613pfn.0.1690445746275; 
 Thu, 27 Jul 2023 01:15:46 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:15:45 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v3 49/49] mm: shrinker: convert shrinker_rwsem to mutex
Date: Thu, 27 Jul 2023 16:05:02 +0800
Message-Id: <20230727080502.77895-50-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now there are no readers of shrinker_rwsem, so we can simply replace it
with mutex lock.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/md/dm-cache-metadata.c |  2 +-
 fs/super.c                     |  2 +-
 mm/shrinker.c                  | 28 ++++++++++++++--------------
 mm/shrinker_debug.c            | 14 +++++++-------
 4 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/md/dm-cache-metadata.c b/drivers/md/dm-cache-metadata.c
index acffed750e3e..9e0c69958587 100644
--- a/drivers/md/dm-cache-metadata.c
+++ b/drivers/md/dm-cache-metadata.c
@@ -1828,7 +1828,7 @@ int dm_cache_metadata_abort(struct dm_cache_metadata *cmd)
 	 * Replacement block manager (new_bm) is created and old_bm destroyed outside of
 	 * cmd root_lock to avoid ABBA deadlock that would result (due to life-cycle of
 	 * shrinker associated with the block manager's bufio client vs cmd root_lock).
-	 * - must take shrinker_rwsem without holding cmd->root_lock
+	 * - must take shrinker_mutex without holding cmd->root_lock
 	 */
 	new_bm = dm_block_manager_create(cmd->bdev, DM_CACHE_METADATA_BLOCK_SIZE << SECTOR_SHIFT,
 					 CACHE_MAX_CONCURRENT_LOCKS);
diff --git a/fs/super.c b/fs/super.c
index 68b3877af941..fdde72e2a357 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -54,7 +54,7 @@ static char *sb_writers_name[SB_FREEZE_LEVELS] = {
  * One thing we have to be careful of with a per-sb shrinker is that we don't
  * drop the last active reference to the superblock from within the shrinker.
  * If that happens we could trigger unregistering the shrinker from within the
- * shrinker path and that leads to deadlock on the shrinker_rwsem. Hence we
+ * shrinker path and that leads to deadlock on the shrinker_mutex. Hence we
  * take a passive reference to the superblock to avoid this from occurring.
  */
 static unsigned long super_cache_scan(struct shrinker *shrink,
diff --git a/mm/shrinker.c b/mm/shrinker.c
index a12dede5d21f..3d44a335ef3c 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -8,7 +8,7 @@
 #include "internal.h"
 
 LIST_HEAD(shrinker_list);
-DECLARE_RWSEM(shrinker_rwsem);
+DEFINE_MUTEX(shrinker_mutex);
 
 #ifdef CONFIG_MEMCG
 static int shrinker_nr_max;
@@ -80,7 +80,7 @@ int alloc_shrinker_info(struct mem_cgroup *memcg)
 	int nid, ret = 0;
 	int array_size = 0;
 
-	down_write(&shrinker_rwsem);
+	mutex_lock(&shrinker_mutex);
 	array_size = shrinker_unit_size(shrinker_nr_max);
 	for_each_node(nid) {
 		info = kvzalloc_node(sizeof(*info) + array_size, GFP_KERNEL, nid);
@@ -91,7 +91,7 @@ int alloc_shrinker_info(struct mem_cgroup *memcg)
 			goto err;
 		rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_info, info);
 	}
-	up_write(&shrinker_rwsem);
+	mutex_unlock(&shrinker_mutex);
 
 	return ret;
 
@@ -104,7 +104,7 @@ static struct shrinker_info *shrinker_info_protected(struct mem_cgroup *memcg,
 						     int nid)
 {
 	return rcu_dereference_protected(memcg->nodeinfo[nid]->shrinker_info,
-					 lockdep_is_held(&shrinker_rwsem));
+					 lockdep_is_held(&shrinker_mutex));
 }
 
 static struct shrinker_info *shrinker_info_rcu(struct mem_cgroup *memcg,
@@ -161,7 +161,7 @@ static int expand_shrinker_info(int new_id)
 	if (!root_mem_cgroup)
 		goto out;
 
-	lockdep_assert_held(&shrinker_rwsem);
+	lockdep_assert_held(&shrinker_mutex);
 
 	new_size = shrinker_unit_size(new_nr_max);
 	old_size = shrinker_unit_size(shrinker_nr_max);
@@ -224,7 +224,7 @@ static int shrinker_memcg_alloc(struct shrinker *shrinker)
 	if (mem_cgroup_disabled())
 		return -ENOSYS;
 
-	down_write(&shrinker_rwsem);
+	mutex_lock(&shrinker_mutex);
 	id = idr_alloc(&shrinker_idr, shrinker, 0, 0, GFP_KERNEL);
 	if (id < 0)
 		goto unlock;
@@ -238,7 +238,7 @@ static int shrinker_memcg_alloc(struct shrinker *shrinker)
 	shrinker->id = id;
 	ret = 0;
 unlock:
-	up_write(&shrinker_rwsem);
+	mutex_unlock(&shrinker_mutex);
 	return ret;
 }
 
@@ -248,7 +248,7 @@ static void shrinker_memcg_remove(struct shrinker *shrinker)
 
 	BUG_ON(id < 0);
 
-	lockdep_assert_held(&shrinker_rwsem);
+	lockdep_assert_held(&shrinker_mutex);
 
 	idr_remove(&shrinker_idr, id);
 }
@@ -299,7 +299,7 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 		parent = root_mem_cgroup;
 
 	/* Prevent from concurrent shrinker_info expand */
-	down_write(&shrinker_rwsem);
+	mutex_lock(&shrinker_mutex);
 	for_each_node(nid) {
 		child_info = shrinker_info_protected(memcg, nid);
 		parent_info = shrinker_info_protected(parent, nid);
@@ -312,7 +312,7 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 			}
 		}
 	}
-	up_write(&shrinker_rwsem);
+	mutex_unlock(&shrinker_mutex);
 }
 #else
 static int shrinker_memcg_alloc(struct shrinker *shrinker)
@@ -708,11 +708,11 @@ void shrinker_register(struct shrinker *shrinker)
 		return;
 	}
 
-	down_write(&shrinker_rwsem);
+	mutex_lock(&shrinker_mutex);
 	list_add_tail_rcu(&shrinker->list, &shrinker_list);
 	shrinker->flags |= SHRINKER_REGISTERED;
 	shrinker_debugfs_add(shrinker);
-	up_write(&shrinker_rwsem);
+	mutex_unlock(&shrinker_mutex);
 
 	init_completion(&shrinker->done);
 	/*
@@ -745,7 +745,7 @@ void shrinker_free(struct shrinker *shrinker)
 		wait_for_completion(&shrinker->done);
 	}
 
-	down_write(&shrinker_rwsem);
+	mutex_lock(&shrinker_mutex);
 	if (shrinker->flags & SHRINKER_REGISTERED) {
 		/*
 		 * Lookups on the shrinker are over and will fail in the future,
@@ -760,7 +760,7 @@ void shrinker_free(struct shrinker *shrinker)
 
 	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
 		shrinker_memcg_remove(shrinker);
-	up_write(&shrinker_rwsem);
+	mutex_unlock(&shrinker_mutex);
 
 	if (debugfs_entry)
 		shrinker_debugfs_remove(debugfs_entry, debugfs_id);
diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
index 506257585408..368fa0484a44 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -7,7 +7,7 @@
 #include <linux/memcontrol.h>
 
 /* defined in vmscan.c */
-extern struct rw_semaphore shrinker_rwsem;
+extern struct mutex shrinker_mutex;
 extern struct list_head shrinker_list;
 
 static DEFINE_IDA(shrinker_debugfs_ida);
@@ -163,7 +163,7 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
 	char buf[128];
 	int id;
 
-	lockdep_assert_held(&shrinker_rwsem);
+	lockdep_assert_held(&shrinker_mutex);
 
 	/* debugfs isn't initialized yet, add debugfs entries later. */
 	if (!shrinker_debugfs_root)
@@ -220,7 +220,7 @@ int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
 	if (!new)
 		return -ENOMEM;
 
-	down_write(&shrinker_rwsem);
+	mutex_lock(&shrinker_mutex);
 
 	old = shrinker->name;
 	shrinker->name = new;
@@ -238,7 +238,7 @@ int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
 			shrinker->debugfs_entry = entry;
 	}
 
-	up_write(&shrinker_rwsem);
+	mutex_unlock(&shrinker_mutex);
 
 	kfree_const(old);
 
@@ -251,7 +251,7 @@ struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
 {
 	struct dentry *entry = shrinker->debugfs_entry;
 
-	lockdep_assert_held(&shrinker_rwsem);
+	lockdep_assert_held(&shrinker_mutex);
 
 	shrinker_debugfs_name_free(shrinker);
 
@@ -279,14 +279,14 @@ static int __init shrinker_debugfs_init(void)
 	shrinker_debugfs_root = dentry;
 
 	/* Create debugfs entries for shrinkers registered at boot */
-	down_write(&shrinker_rwsem);
+	mutex_lock(&shrinker_mutex);
 	list_for_each_entry(shrinker, &shrinker_list, list)
 		if (!shrinker->debugfs_entry) {
 			ret = shrinker_debugfs_add(shrinker);
 			if (ret)
 				break;
 		}
-	up_write(&shrinker_rwsem);
+	mutex_unlock(&shrinker_mutex);
 
 	return ret;
 }
-- 
2.30.2

