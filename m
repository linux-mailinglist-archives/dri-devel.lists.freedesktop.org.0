Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5026B73B14B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB8910E5EC;
	Fri, 23 Jun 2023 07:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB23810E4FC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:55:48 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-51f64817809so680062a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687424148; x=1690016148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eFTuD75yazkbkprx1nDK+J2a+gsKcpdTH5uLLFxlsCE=;
 b=YL01pLqxeJdJ3yx7vlwGwrScHLp900A8hEE3Wf+RWJNlhx4L8kHsp9yLDKLvMKBCnC
 3rsy/Bt3MovGZd9xDykjB2GgcKTKrjV0UKR/p/LUcqeAgCcK1oeyqL4lKiu0nVi2NGBN
 TaYF2c0QLLlLRjtauaahzpKEMrC5bmEQ14igH5gpZVZzZ5PZmJEXxyLsPSab+WZLJtP7
 soRQ7v+HKrW5nh3UOzeGEOAr+30lPAAddvMLxo2KnZ7MK/KtFrltdlmvaznhvWw7dzRl
 oronsxPEPE0DLPq3etiyjPQ96cDhygWHhtXaurPBhnnq3MU+faq6ga287Qti+jNFsnPy
 uaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687424148; x=1690016148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eFTuD75yazkbkprx1nDK+J2a+gsKcpdTH5uLLFxlsCE=;
 b=Q1XPQ7IOTA7/m51TG/vDGHqozDKu6WAe7OpuMZrzu1ai9FhTXcE6RiMhDg4vTfiTjW
 mvgMJRhFFuRRScK6istqQLTkqdoqD0W00c4DUHqDnLMwr9sVWk8gYAtkeXA8BzcTK6Dx
 Ozaj+9q06cY9jN0/IwbHjSmcdOux2dbskL7grg49BtWFwTY9MJ/6cIP/07uXNmiZMKUC
 7X3v2XAKjPXxSQGRmAbBXuTqgQyj5kcty79htQc8IPLY6Ta3kTljauRAD+zPb/z2q68A
 F08xnkYzkmXNVOIPsNHHtsQ58ga0c0+jtrtctIF8dNpX2klnbuar8jyfw0RSe6hb95BY
 XPyg==
X-Gm-Message-State: AC+VfDx0Qn/qQ7J9y7waerbwNmG+Dn1bRcH0gv6ujd85H2EBbnDkL1v5
 mabMxDsn0OiEv6j9MhM6XdR+3w==
X-Google-Smtp-Source: ACHHUZ6jVuCzKKZsdSS1vKWkjhi+wc7lz2Kfe1cJ6l4zUout3MX707Lbn9nWcxBb7Ur8w7srUJ3z+g==
X-Received: by 2002:a17:903:2451:b0:1b0:34c6:3bf2 with SMTP id
 l17-20020a170903245100b001b034c63bf2mr21540496pls.5.1687424148210; 
 Thu, 22 Jun 2023 01:55:48 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b001b549fce345sm4806971plw.230.2023.06.22.01.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:55:47 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Subject: [PATCH 13/29] ext4: dynamically allocate the ext4-es shrinker
Date: Thu, 22 Jun 2023 16:53:19 +0800
Message-Id: <20230622085335.77010-14-zhengqi.arch@bytedance.com>
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
we need to dynamically allocate the ext4-es shrinker,
so that it can be freed asynchronously using kfree_rcu().
Then it doesn't need to wait for RCU read-side critical
section when releasing the struct ext4_sb_info.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/ext4/ext4.h           |  2 +-
 fs/ext4/extents_status.c | 21 ++++++++++++---------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 0a2d55faa095..1bd150d454f5 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1651,7 +1651,7 @@ struct ext4_sb_info {
 	__u32 s_csum_seed;
 
 	/* Reclaim extents from extent status tree */
-	struct shrinker s_es_shrinker;
+	struct shrinker *s_es_shrinker;
 	struct list_head s_es_list;	/* List of inodes with reclaimable extents */
 	long s_es_nr_inode;
 	struct ext4_es_stats s_es_stats;
diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
index 9b5b8951afb4..fea82339f4b4 100644
--- a/fs/ext4/extents_status.c
+++ b/fs/ext4/extents_status.c
@@ -1596,7 +1596,7 @@ static unsigned long ext4_es_count(struct shrinker *shrink,
 	unsigned long nr;
 	struct ext4_sb_info *sbi;
 
-	sbi = container_of(shrink, struct ext4_sb_info, s_es_shrinker);
+	sbi = shrink->private_data;
 	nr = percpu_counter_read_positive(&sbi->s_es_stats.es_stats_shk_cnt);
 	trace_ext4_es_shrink_count(sbi->s_sb, sc->nr_to_scan, nr);
 	return nr;
@@ -1605,8 +1605,7 @@ static unsigned long ext4_es_count(struct shrinker *shrink,
 static unsigned long ext4_es_scan(struct shrinker *shrink,
 				  struct shrink_control *sc)
 {
-	struct ext4_sb_info *sbi = container_of(shrink,
-					struct ext4_sb_info, s_es_shrinker);
+	struct ext4_sb_info *sbi = shrink->private_data;
 	int nr_to_scan = sc->nr_to_scan;
 	int ret, nr_shrunk;
 
@@ -1690,15 +1689,19 @@ int ext4_es_register_shrinker(struct ext4_sb_info *sbi)
 	if (err)
 		goto err3;
 
-	sbi->s_es_shrinker.scan_objects = ext4_es_scan;
-	sbi->s_es_shrinker.count_objects = ext4_es_count;
-	sbi->s_es_shrinker.seeks = DEFAULT_SEEKS;
-	err = register_shrinker(&sbi->s_es_shrinker, "ext4-es:%s",
+	sbi->s_es_shrinker = shrinker_alloc_and_init(ext4_es_count, ext4_es_scan,
+						     0, DEFAULT_SEEKS, 0, sbi);
+	if (!sbi->s_es_shrinker)
+		goto err4;
+
+	err = register_shrinker(sbi->s_es_shrinker, "ext4-es:%s",
 				sbi->s_sb->s_id);
 	if (err)
-		goto err4;
+		goto err5;
 
 	return 0;
+err5:
+	shrinker_free(sbi->s_es_shrinker);
 err4:
 	percpu_counter_destroy(&sbi->s_es_stats.es_stats_shk_cnt);
 err3:
@@ -1716,7 +1719,7 @@ void ext4_es_unregister_shrinker(struct ext4_sb_info *sbi)
 	percpu_counter_destroy(&sbi->s_es_stats.es_stats_cache_misses);
 	percpu_counter_destroy(&sbi->s_es_stats.es_stats_all_cnt);
 	percpu_counter_destroy(&sbi->s_es_stats.es_stats_shk_cnt);
-	unregister_shrinker(&sbi->s_es_shrinker);
+	unregister_and_free_shrinker(sbi->s_es_shrinker);
 }
 
 /*
-- 
2.30.2

