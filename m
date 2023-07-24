Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A849075EFF8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC6810E2AF;
	Mon, 24 Jul 2023 09:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0449110E2B0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 09:48:55 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1b8c364ad3bso8860485ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 02:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690192134; x=1690796934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hg2vi+2AAPCRuQsciRtLylYUMTgaXzyfBXLGSnv8etw=;
 b=aydgK7bn0QggjlQydoxB8/wzzA4TXTh5kAH1HczgG5x53kEUfwsZTHfAy7Oll8B5Eb
 /u8m2Fx+yVNF796ZZc3s2XmC1YIubtCHa+WaPaj49PGcqhNB+vofNP25+pjGYzLsUBey
 s8mU5+/TbPuzYxlgD12Kt4jsZqhjhd4Zmfvq3eYOMY75uxvK9h6vyhatsfe9xzUUvBHR
 65A0XriwgvV356EN5StwdT8HNZN8xypzwNZbI9gp5ddxZgA9hT9j3WwIFAc65w94K4S5
 JlPP5IHsQz3xceBVdVld1V5OEs83EDOwKVmAaZghdPj/BNMPCYQ+scOGPe5A3YPCuRcv
 ewxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690192134; x=1690796934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hg2vi+2AAPCRuQsciRtLylYUMTgaXzyfBXLGSnv8etw=;
 b=Scd38Bo3wNiXjf0fkPu2opB2bw7ZvQPS1k6zCer7XIVmZ+8C819ubfV5sVzv/oNk+d
 P1fbgcP1mQA5suUBEM9lC3BYASi3hlUmO9h8N0hIkKvfXNvH+HnegWx+EsB4BRh5eUKC
 CDuYmyN7Jmv6jrvsh7oshSVbkIfat6dDK4GZhZk0mGIhZi0Ye8SoZWbvVWn5hJo7dUpW
 nRIoU+HgSKioPyjQVYNTIeTKO95bnG6pRNkGZ8stCq+hJYyCbFdajMWsysF/6QqySu6m
 RplNSjOsggFldo9Mej1XGX8Nbfh2Wb4ZQW1waYJ8iSmv4URx6X+cNkgg1IxfaGWvON4l
 /Xuw==
X-Gm-Message-State: ABy/qLY1yY46KP2iBPopPrj10wx+vhdA5G6XuKHaMTFqWe3/1993WydC
 koLqkdbNJkOK9/Jr97pIulJhNg==
X-Google-Smtp-Source: APBJJlFlbX7MjF6Gs1NiwvX/ojXDY5CFLHX7jflUqBVL6eloGiFWEtkN1YdVHiZpjmt9ZeBQxK8/kg==
X-Received: by 2002:a17:902:ecd2:b0:1b8:b4f6:1327 with SMTP id
 a18-20020a170902ecd200b001b8b4f61327mr12294253plh.6.1690192134533; 
 Mon, 24 Jul 2023 02:48:54 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:48:54 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v2 19/47] mm: thp: dynamically allocate the thp-related
 shrinkers
Date: Mon, 24 Jul 2023 17:43:26 +0800
Message-Id: <20230724094354.90817-20-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
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

Use new APIs to dynamically allocate the thp-zero and thp-deferred_split
shrinkers.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/huge_memory.c | 69 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 24 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 8c94b34024a2..4db5a1834d81 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -65,7 +65,11 @@ unsigned long transparent_hugepage_flags __read_mostly =
 	(1<<TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG)|
 	(1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG);
 
-static struct shrinker deferred_split_shrinker;
+static struct shrinker *deferred_split_shrinker;
+static unsigned long deferred_split_count(struct shrinker *shrink,
+					  struct shrink_control *sc);
+static unsigned long deferred_split_scan(struct shrinker *shrink,
+					 struct shrink_control *sc);
 
 static atomic_t huge_zero_refcount;
 struct page *huge_zero_page __read_mostly;
@@ -229,11 +233,7 @@ static unsigned long shrink_huge_zero_page_scan(struct shrinker *shrink,
 	return 0;
 }
 
-static struct shrinker huge_zero_page_shrinker = {
-	.count_objects = shrink_huge_zero_page_count,
-	.scan_objects = shrink_huge_zero_page_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *huge_zero_page_shrinker;
 
 #ifdef CONFIG_SYSFS
 static ssize_t enabled_show(struct kobject *kobj,
@@ -454,6 +454,40 @@ static inline void hugepage_exit_sysfs(struct kobject *hugepage_kobj)
 }
 #endif /* CONFIG_SYSFS */
 
+static int thp_shrinker_init(void)
+{
+	huge_zero_page_shrinker = shrinker_alloc(0, "thp-zero");
+	if (!huge_zero_page_shrinker)
+		return -ENOMEM;
+
+	deferred_split_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE |
+						 SHRINKER_MEMCG_AWARE |
+						 SHRINKER_NONSLAB,
+						 "thp-deferred_split");
+	if (!deferred_split_shrinker) {
+		shrinker_free_non_registered(huge_zero_page_shrinker);
+		return -ENOMEM;
+	}
+
+	huge_zero_page_shrinker->count_objects = shrink_huge_zero_page_count;
+	huge_zero_page_shrinker->scan_objects = shrink_huge_zero_page_scan;
+	huge_zero_page_shrinker->seeks = DEFAULT_SEEKS;
+	shrinker_register(huge_zero_page_shrinker);
+
+	deferred_split_shrinker->count_objects = deferred_split_count;
+	deferred_split_shrinker->scan_objects = deferred_split_scan;
+	deferred_split_shrinker->seeks = DEFAULT_SEEKS;
+	shrinker_register(deferred_split_shrinker);
+
+	return 0;
+}
+
+static void thp_shrinker_exit(void)
+{
+	shrinker_unregister(huge_zero_page_shrinker);
+	shrinker_unregister(deferred_split_shrinker);
+}
+
 static int __init hugepage_init(void)
 {
 	int err;
@@ -482,12 +516,9 @@ static int __init hugepage_init(void)
 	if (err)
 		goto err_slab;
 
-	err = register_shrinker(&huge_zero_page_shrinker, "thp-zero");
-	if (err)
-		goto err_hzp_shrinker;
-	err = register_shrinker(&deferred_split_shrinker, "thp-deferred_split");
+	err = thp_shrinker_init();
 	if (err)
-		goto err_split_shrinker;
+		goto err_shrinker;
 
 	/*
 	 * By default disable transparent hugepages on smaller systems,
@@ -505,10 +536,8 @@ static int __init hugepage_init(void)
 
 	return 0;
 err_khugepaged:
-	unregister_shrinker(&deferred_split_shrinker);
-err_split_shrinker:
-	unregister_shrinker(&huge_zero_page_shrinker);
-err_hzp_shrinker:
+	thp_shrinker_exit();
+err_shrinker:
 	khugepaged_destroy();
 err_slab:
 	hugepage_exit_sysfs(hugepage_kobj);
@@ -2851,7 +2880,7 @@ void deferred_split_folio(struct folio *folio)
 #ifdef CONFIG_MEMCG
 		if (memcg)
 			set_shrinker_bit(memcg, folio_nid(folio),
-					 deferred_split_shrinker.id);
+					 deferred_split_shrinker->id);
 #endif
 	}
 	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
@@ -2925,14 +2954,6 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
 	return split;
 }
 
-static struct shrinker deferred_split_shrinker = {
-	.count_objects = deferred_split_count,
-	.scan_objects = deferred_split_scan,
-	.seeks = DEFAULT_SEEKS,
-	.flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE |
-		 SHRINKER_NONSLAB,
-};
-
 #ifdef CONFIG_DEBUG_FS
 static void split_huge_pages_all(void)
 {
-- 
2.30.2

