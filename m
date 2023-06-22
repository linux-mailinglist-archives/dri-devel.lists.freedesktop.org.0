Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ACF73B170
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED2910E607;
	Fri, 23 Jun 2023 07:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE4510E508
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:56:52 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b515ec39feso12622505ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687424211; x=1690016211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=02DUTqACM/aSl9866C36A3I60VPYUs4OjMZ7Yfrc1/o=;
 b=H+1EjwPIJiQm5S0OenD/xh0iPse4xpKj+qmkmBU/srKV3WPi3ULtA4pLp++dC5Bqh9
 7BlRLloRVIKfQ42/hs1T7Du0cHLmrcEPoZEBW7JCQkTGLYx1UQ3fbHqq8+O3YFu52yg3
 0+mCV5UtaM+1WMi4gyiYw8XnFCdNZ/oJcDwzQAYJvzkblrrUfBpPXXo27BHoXCIIli5o
 hjfG1EZpMvdsdRL66NPCU/nz333dm9KHMwYWw99s85mydOWvyhkPwMLzowDcLeXpMtBs
 G9dmlhU3PRkH82ZAs6EjGsULbQMB1pyMMS03ZQNG2aou+qooblLYB2n9++fqbuAHUsk3
 kqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687424211; x=1690016211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=02DUTqACM/aSl9866C36A3I60VPYUs4OjMZ7Yfrc1/o=;
 b=b59dNDFNaNaRa/RpLktFEdpSx9JOF6dMPLPau6s0leoMFrEpAQ9Hv674pvGVRfYXVD
 A4iZ0WVNZM7F/QL6tYntO0176atu2uYLhv6UKno8Nrk4LEm1CF8Inuyvd75CrkYlbSy8
 obrAndttd4c8OwcFXMLiYZ8untj1j+7N5qgEMPzIoDcP1KZwQNhib2b1UVtAk+Y7UjOB
 LT5l1qxaiU+aT1CXAvIml0ZDl6NPhIMuGaW/xPFgntvrVTxj0rn/k3HniPt/HPXFjCod
 a7rZVFkYtIJ4KkPPVtba8cQiRL0ID/BRRBXQKm5GHjQJNRs1iruthVAXOJlEFBD7KLTT
 2Vjw==
X-Gm-Message-State: AC+VfDwe5+Qp+pFawFMAH9mBqHouRFUyggrYhWh6eyrVkrvqVQjTq/bJ
 hOrU6pbQ8+6YPfELRGOYLEgaAA==
X-Google-Smtp-Source: ACHHUZ4bv27VnKnfH9aSIwqm+pi4rG014ro45egLBBsO6iOayIjodJqPa/Ct3mSpE0n2zy/iA6cg+A==
X-Received: by 2002:a17:902:ecc6:b0:1b1:9272:55e2 with SMTP id
 a6-20020a170902ecc600b001b1927255e2mr21755968plh.3.1687424211650; 
 Thu, 22 Jun 2023 01:56:51 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b001b549fce345sm4806971plw.230.2023.06.22.01.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:56:51 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Subject: [PATCH 21/29] fs: super: dynamically allocate the s_shrink
Date: Thu, 22 Jun 2023 16:53:27 +0800
Message-Id: <20230622085335.77010-22-zhengqi.arch@bytedance.com>
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
we need to dynamically allocate the s_shrink, so that
it can be freed asynchronously using kfree_rcu(). Then
it doesn't need to wait for RCU read-side critical
section when releasing the struct super_block.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/btrfs/super.c   |  2 +-
 fs/kernfs/mount.c  |  2 +-
 fs/proc/root.c     |  2 +-
 fs/super.c         | 38 ++++++++++++++++++++++----------------
 include/linux/fs.h |  2 +-
 5 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index f1dd172d8d5b..fad4ded26c80 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -1513,7 +1513,7 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 			error = -EBUSY;
 	} else {
 		snprintf(s->s_id, sizeof(s->s_id), "%pg", bdev);
-		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s", fs_type->name,
+		shrinker_debugfs_rename(s->s_shrink, "sb-%s:%s", fs_type->name,
 					s->s_id);
 		btrfs_sb(s)->bdev_holder = fs_type;
 		error = btrfs_fill_super(s, fs_devices, data);
diff --git a/fs/kernfs/mount.c b/fs/kernfs/mount.c
index d49606accb07..2657ff1181f1 100644
--- a/fs/kernfs/mount.c
+++ b/fs/kernfs/mount.c
@@ -256,7 +256,7 @@ static int kernfs_fill_super(struct super_block *sb, struct kernfs_fs_context *k
 	sb->s_time_gran = 1;
 
 	/* sysfs dentries and inodes don't require IO to create */
-	sb->s_shrink.seeks = 0;
+	sb->s_shrink->seeks = 0;
 
 	/* get root inode, initialize and unlock it */
 	down_read(&kf_root->kernfs_rwsem);
diff --git a/fs/proc/root.c b/fs/proc/root.c
index a86e65a608da..22b78b28b477 100644
--- a/fs/proc/root.c
+++ b/fs/proc/root.c
@@ -188,7 +188,7 @@ static int proc_fill_super(struct super_block *s, struct fs_context *fc)
 	s->s_stack_depth = FILESYSTEM_MAX_STACK_DEPTH;
 
 	/* procfs dentries and inodes don't require IO to create */
-	s->s_shrink.seeks = 0;
+	s->s_shrink->seeks = 0;
 
 	pde_get(&proc_root);
 	root_inode = proc_get_inode(s, &proc_root);
diff --git a/fs/super.c b/fs/super.c
index 2e83c8cd435b..791342bb8ac9 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -67,7 +67,7 @@ static unsigned long super_cache_scan(struct shrinker *shrink,
 	long	dentries;
 	long	inodes;
 
-	sb = container_of(shrink, struct super_block, s_shrink);
+	sb = shrink->private_data;
 
 	/*
 	 * Deadlock avoidance.  We may hold various FS locks, and we don't want
@@ -120,7 +120,7 @@ static unsigned long super_cache_count(struct shrinker *shrink,
 	struct super_block *sb;
 	long	total_objects = 0;
 
-	sb = container_of(shrink, struct super_block, s_shrink);
+	sb = shrink->private_data;
 
 	/*
 	 * We don't call trylock_super() here as it is a scalability bottleneck,
@@ -182,7 +182,10 @@ static void destroy_unused_super(struct super_block *s)
 	security_sb_free(s);
 	put_user_ns(s->s_user_ns);
 	kfree(s->s_subtype);
-	free_prealloced_shrinker(&s->s_shrink);
+	if (s->s_shrink) {
+		free_prealloced_shrinker(s->s_shrink);
+		shrinker_free(s->s_shrink);
+	}
 	/* no delays needed */
 	destroy_super_work(&s->destroy_work);
 }
@@ -259,16 +262,19 @@ static struct super_block *alloc_super(struct file_system_type *type, int flags,
 	s->s_time_min = TIME64_MIN;
 	s->s_time_max = TIME64_MAX;
 
-	s->s_shrink.seeks = DEFAULT_SEEKS;
-	s->s_shrink.scan_objects = super_cache_scan;
-	s->s_shrink.count_objects = super_cache_count;
-	s->s_shrink.batch = 1024;
-	s->s_shrink.flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE;
-	if (prealloc_shrinker(&s->s_shrink, "sb-%s", type->name))
+	s->s_shrink = shrinker_alloc_and_init(super_cache_count,
+					      super_cache_scan, 1024,
+					      DEFAULT_SEEKS,
+					      SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE,
+					      s);
+	if (!s->s_shrink)
+		goto fail;
+
+	if (prealloc_shrinker(s->s_shrink, "sb-%s", type->name))
 		goto fail;
-	if (list_lru_init_memcg(&s->s_dentry_lru, &s->s_shrink))
+	if (list_lru_init_memcg(&s->s_dentry_lru, s->s_shrink))
 		goto fail;
-	if (list_lru_init_memcg(&s->s_inode_lru, &s->s_shrink))
+	if (list_lru_init_memcg(&s->s_inode_lru, s->s_shrink))
 		goto fail;
 	return s;
 
@@ -326,7 +332,7 @@ void deactivate_locked_super(struct super_block *s)
 {
 	struct file_system_type *fs = s->s_type;
 	if (atomic_dec_and_test(&s->s_active)) {
-		unregister_shrinker(&s->s_shrink);
+		unregister_and_free_shrinker(s->s_shrink);
 		fs->kill_sb(s);
 
 		/*
@@ -599,7 +605,7 @@ struct super_block *sget_fc(struct fs_context *fc,
 	hlist_add_head(&s->s_instances, &s->s_type->fs_supers);
 	spin_unlock(&sb_lock);
 	get_filesystem(s->s_type);
-	register_shrinker_prepared(&s->s_shrink);
+	register_shrinker_prepared(s->s_shrink);
 	return s;
 
 share_extant_sb:
@@ -678,7 +684,7 @@ struct super_block *sget(struct file_system_type *type,
 	hlist_add_head(&s->s_instances, &type->fs_supers);
 	spin_unlock(&sb_lock);
 	get_filesystem(type);
-	register_shrinker_prepared(&s->s_shrink);
+	register_shrinker_prepared(s->s_shrink);
 	return s;
 }
 EXPORT_SYMBOL(sget);
@@ -1308,7 +1314,7 @@ int get_tree_bdev(struct fs_context *fc,
 		down_write(&s->s_umount);
 	} else {
 		snprintf(s->s_id, sizeof(s->s_id), "%pg", bdev);
-		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s",
+		shrinker_debugfs_rename(s->s_shrink, "sb-%s:%s",
 					fc->fs_type->name, s->s_id);
 		sb_set_blocksize(s, block_size(bdev));
 		error = fill_super(s, fc);
@@ -1381,7 +1387,7 @@ struct dentry *mount_bdev(struct file_system_type *fs_type,
 		down_write(&s->s_umount);
 	} else {
 		snprintf(s->s_id, sizeof(s->s_id), "%pg", bdev);
-		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s",
+		shrinker_debugfs_rename(s->s_shrink, "sb-%s:%s",
 					fs_type->name, s->s_id);
 		sb_set_blocksize(s, block_size(bdev));
 		error = fill_super(s, data, flags & SB_SILENT ? 1 : 0);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 53e0b5e98046..dd6f8ce28385 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1228,7 +1228,7 @@ struct super_block {
 
 	const struct dentry_operations *s_d_op; /* default d_op for dentries */
 
-	struct shrinker s_shrink;	/* per-sb shrinker handle */
+	struct shrinker *s_shrink;	/* per-sb shrinker handle */
 
 	/* Number of inodes with nlink == 0 but still referenced */
 	atomic_long_t s_remove_count;
-- 
2.30.2

