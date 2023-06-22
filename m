Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7873B158
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2112510E5FA;
	Fri, 23 Jun 2023 07:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-54.mta1.migadu.com (out-54.mta1.migadu.com [95.215.58.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92C910E504
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:50:23 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1687423256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UVc05N8TOGwuUUKoNz87gDn866CFxAmc8E1rcih1bqo=;
 b=pIkop2eQR4AzcvFtx0fKC5u74SQHEPst+ye/aRaIN/XLkXx9ENeAfcG9GarTuIM0jnpWjY
 wc1vZF+DfrPQmzmeUXoRrgWlfs5txUtNbBR8RjUQS7TF9I112ROw+Fu0aprW/Xjax/gTyt
 /OzCXh22MrqgNQholBQLGjBVav3coLY=
From: Qi Zheng <qi.zheng@linux.dev>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Subject: [PATCH 08/29] md/raid5: dynamically allocate the md-raid5 shrinker
Date: Thu, 22 Jun 2023 08:39:11 +0000
Message-Id: <20230622083932.4090339-9-qi.zheng@linux.dev>
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
we need to dynamically allocate the md-raid5 shrinker,
so that it can be freed asynchronously using kfree_rcu().
Then it doesn't need to wait for RCU read-side critical
section when releasing the struct r5conf.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/md/raid5.c | 28 +++++++++++++++++-----------
 drivers/md/raid5.h |  2 +-
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index f4eea1bbbeaf..4866cad1ad62 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7391,7 +7391,7 @@ static void free_conf(struct r5conf *conf)
 
 	log_exit(conf);
 
-	unregister_shrinker(&conf->shrinker);
+	unregister_and_free_shrinker(conf->shrinker);
 	free_thread_groups(conf);
 	shrink_stripes(conf);
 	raid5_free_percpu(conf);
@@ -7439,7 +7439,7 @@ static int raid5_alloc_percpu(struct r5conf *conf)
 static unsigned long raid5_cache_scan(struct shrinker *shrink,
 				      struct shrink_control *sc)
 {
-	struct r5conf *conf = container_of(shrink, struct r5conf, shrinker);
+	struct r5conf *conf = shrink->private_data;
 	unsigned long ret = SHRINK_STOP;
 
 	if (mutex_trylock(&conf->cache_size_mutex)) {
@@ -7460,7 +7460,7 @@ static unsigned long raid5_cache_scan(struct shrinker *shrink,
 static unsigned long raid5_cache_count(struct shrinker *shrink,
 				       struct shrink_control *sc)
 {
-	struct r5conf *conf = container_of(shrink, struct r5conf, shrinker);
+	struct r5conf *conf = shrink->private_data;
 
 	if (conf->max_nr_stripes < conf->min_nr_stripes)
 		/* unlikely, but not impossible */
@@ -7695,16 +7695,21 @@ static struct r5conf *setup_conf(struct mddev *mddev)
 	 * it reduces the queue depth and so can hurt throughput.
 	 * So set it rather large, scaled by number of devices.
 	 */
-	conf->shrinker.seeks = DEFAULT_SEEKS * conf->raid_disks * 4;
-	conf->shrinker.scan_objects = raid5_cache_scan;
-	conf->shrinker.count_objects = raid5_cache_count;
-	conf->shrinker.batch = 128;
-	conf->shrinker.flags = 0;
-	ret = register_shrinker(&conf->shrinker, "md-raid5:%s", mdname(mddev));
+	conf->shrinker = shrinker_alloc_and_init(raid5_cache_count,
+						 raid5_cache_scan, 128,
+						 DEFAULT_SEEKS * conf->raid_disks * 4,
+						 0, conf);
+	if (!conf->shrinker) {
+		pr_warn("md/raid:%s: couldn't allocate shrinker.\n",
+			mdname(mddev));
+		goto abort;
+	}
+
+	ret = register_shrinker(conf->shrinker, "md-raid5:%s", mdname(mddev));
 	if (ret) {
 		pr_warn("md/raid:%s: couldn't register shrinker.\n",
 			mdname(mddev));
-		goto abort;
+		goto abort_shrinker;
 	}
 
 	sprintf(pers_name, "raid%d", mddev->new_level);
@@ -7717,7 +7722,8 @@ static struct r5conf *setup_conf(struct mddev *mddev)
 	}
 
 	return conf;
-
+abort_shrinker:
+	shrinker_free(conf->shrinker);
  abort:
 	if (conf)
 		free_conf(conf);
diff --git a/drivers/md/raid5.h b/drivers/md/raid5.h
index 6a92fafb0748..806f84681599 100644
--- a/drivers/md/raid5.h
+++ b/drivers/md/raid5.h
@@ -670,7 +670,7 @@ struct r5conf {
 	wait_queue_head_t	wait_for_stripe;
 	wait_queue_head_t	wait_for_overlap;
 	unsigned long		cache_state;
-	struct shrinker		shrinker;
+	struct shrinker		*shrinker;
 	int			pool_size; /* number of disks in stripeheads in pool */
 	spinlock_t		device_lock;
 	struct disk_info	*disks;
-- 
2.30.2

