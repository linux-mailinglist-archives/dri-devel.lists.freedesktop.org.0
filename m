Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECBF73B191
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B37C10E623;
	Fri, 23 Jun 2023 07:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C968A10E14C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:54:51 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6664ac3be47so1328438b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687424091; x=1690016091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=161EjO+w9TmzA/a8qJytM8fXp/e7+Gx/R5PIlDH2uAk=;
 b=VsUY2aigV4ZcD/zqH6R6qf5YjeDjgcBdr5DWNiFL+xj8FWQJXfxqjN+JjtQQqPUTZU
 y/hvwjl2otPmZYcL1mDMWeSCzXx77cZKx3CoOlix2I89OTP/XqbmazxkdkRcxT8IoFUn
 2QEonOktxP7xKSbe3Xt0JkWeJ0vXY7bYmU0ntULjSwRJaXbaN1TAoEufMFnqYH3EWbZ2
 epggxRJm4wrl127Vz5WoCbm7/HM2e7h8o7U+VP/mEnC0Icgf0KIm3PI/NPbIYz3ozq3C
 dpiJUcJ4yXe7UOxEIQJgQOohxTSbyOV1lnJIMgAbmswsZtfNIYimqUElkeBCjB3tvm0/
 8Aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687424091; x=1690016091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=161EjO+w9TmzA/a8qJytM8fXp/e7+Gx/R5PIlDH2uAk=;
 b=JMD8PqbSAtvXAL3DUglRH61sPr6gf+ylWW80U+oKQljvDQmIUURuGeWBayhIaZIKoJ
 2MM6TMEPgroYhSEo5QEJZC3qN9NPZ8LtvMpYVlxlAM/0e5XnTlTw44gKQ3BDVPyQ2WfJ
 p0J6Rj5LcXUPZ76+CtjAYWBKngqw8OyXO2xyw2gmAJ0vnXYZUaa0IC4hoj181kcrqZIi
 KcYpCY+mMdpLrKSoxj2uqDr/X5ylsxF+jt6jF+vRbyOpiHu/WulrANi7eNFq9Gea6Lsh
 lqxho5HgRTnvYF9JhguHAhjBAbs1BEkEwVQDkMS4lKmRaPslleH1eHVCbOn8bqRtp9s4
 wmzA==
X-Gm-Message-State: AC+VfDzVEkbIdOAyTvo13RKHNj65SSb3Tz3tgZ67M4s7DmatnRKd7TdP
 qGLfpjj5t2MDo9qwZxYp0NzXiQ==
X-Google-Smtp-Source: ACHHUZ6Zp8ahuhiEYJqMKGH6XvbaL5lpWamc0XC/4KRVYsGWUu1w4+GFAcXsiV5/9t8MrDqgvh99eg==
X-Received: by 2002:a17:902:ea01:b0:1b3:e842:40a7 with SMTP id
 s1-20020a170902ea0100b001b3e84240a7mr20959635plg.1.1687424091188; 
 Thu, 22 Jun 2023 01:54:51 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b001b549fce345sm4806971plw.230.2023.06.22.01.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:54:50 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Subject: [PATCH 06/29] dm: dynamically allocate the dm-bufio shrinker
Date: Thu, 22 Jun 2023 16:53:12 +0800
Message-Id: <20230622085335.77010-7-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for implementing lockless slab shrink,
we need to dynamically allocate the dm-bufio shrinker,
so that it can be freed asynchronously using kfree_rcu().
Then it doesn't need to wait for RCU read-side critical
section when releasing the struct dm_bufio_client.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/md/dm-bufio.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index eea977662e81..9472470d456d 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -963,7 +963,7 @@ struct dm_bufio_client {
 
 	sector_t start;
 
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 	struct work_struct shrink_work;
 	atomic_long_t need_shrink;
 
@@ -2385,7 +2385,7 @@ static unsigned long dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink
 {
 	struct dm_bufio_client *c;
 
-	c = container_of(shrink, struct dm_bufio_client, shrinker);
+	c = shrink->private_data;
 	atomic_long_add(sc->nr_to_scan, &c->need_shrink);
 	queue_work(dm_bufio_wq, &c->shrink_work);
 
@@ -2394,7 +2394,7 @@ static unsigned long dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink
 
 static unsigned long dm_bufio_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
 {
-	struct dm_bufio_client *c = container_of(shrink, struct dm_bufio_client, shrinker);
+	struct dm_bufio_client *c = shrink->private_data;
 	unsigned long count = cache_total(&c->cache);
 	unsigned long retain_target = get_retain_buffers(c);
 	unsigned long queued_for_cleanup = atomic_long_read(&c->need_shrink);
@@ -2507,14 +2507,15 @@ struct dm_bufio_client *dm_bufio_client_create(struct block_device *bdev, unsign
 	INIT_WORK(&c->shrink_work, shrink_work);
 	atomic_long_set(&c->need_shrink, 0);
 
-	c->shrinker.count_objects = dm_bufio_shrink_count;
-	c->shrinker.scan_objects = dm_bufio_shrink_scan;
-	c->shrinker.seeks = 1;
-	c->shrinker.batch = 0;
-	r = register_shrinker(&c->shrinker, "dm-bufio:(%u:%u)",
+	c->shrinker = shrinker_alloc_and_init(dm_bufio_shrink_count,
+					      dm_bufio_shrink_scan, 0, 1, 0, c);
+	if (!c->shrinker)
+		goto bad;
+
+	r = register_shrinker(c->shrinker, "dm-bufio:(%u:%u)",
 			      MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));
 	if (r)
-		goto bad;
+		goto bad_shrinker;
 
 	mutex_lock(&dm_bufio_clients_lock);
 	dm_bufio_client_count++;
@@ -2524,6 +2525,8 @@ struct dm_bufio_client *dm_bufio_client_create(struct block_device *bdev, unsign
 
 	return c;
 
+bad_shrinker:
+	shrinker_free(c->shrinker);
 bad:
 	while (!list_empty(&c->reserved_buffers)) {
 		struct dm_buffer *b = list_to_buffer(c->reserved_buffers.next);
@@ -2554,7 +2557,7 @@ void dm_bufio_client_destroy(struct dm_bufio_client *c)
 
 	drop_buffers(c);
 
-	unregister_shrinker(&c->shrinker);
+	unregister_and_free_shrinker(c->shrinker);
 	flush_work(&c->shrink_work);
 
 	mutex_lock(&dm_bufio_clients_lock);
-- 
2.30.2

