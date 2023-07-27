Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66873764A63
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B57810E51F;
	Thu, 27 Jul 2023 08:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339B910E51F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:09:17 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-682eef7d752so203894b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445357; x=1691050157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1//FAyntSoVVhHGcFkYF5rOUv8OYZDaOr/FI52lXs1g=;
 b=WprFfHhwxvgCbIOGEhvz/77THpnE+uaWMbMuLLIIDpVeL3Jz2616v8wLFkzo7HZvSd
 TNFFTtJffBxh3fLTgZ0hA52iTzwFJ1lb7YC8GT96AcRGLEmRK6UnsPg5TF0WeT/gBbXI
 n3D8mngVfbe3MYXC32UZAJFJiGuaHBVIWM9CunOWIYu990kGDPAj43N4rpm3m8rpgsHd
 02xW2JacWcelFq3TAnDCLUfDJo66VYYZvDcSFvyxJpg5YwEtAXcJf/FphGWJu7IrCr2v
 NhF0NyS2ftTWJJ0Gd6+a6tHW0SZpG4hIgkFC42XLIYM9ZEOFnWGm8ZzCwBndTMQ8KaY8
 M1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445357; x=1691050157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1//FAyntSoVVhHGcFkYF5rOUv8OYZDaOr/FI52lXs1g=;
 b=bS+u2Qi8aGNGUn96s+baHb7FcisWfGa7esySniC7V0y80kiElGiO5gvKK6kXmo75R8
 awI0R8BrtFokQhirnc8wLNjyf5xiT1zH8z5kF5kGu4ktRhUcnWKdk4KD6ve6/pQLEtwN
 z7v7BezL5U6FmgINjbE04dxwxp85f4Fz7/92uh9AArpdJDsvEVvEd/W95lZIfmqW3jR4
 vPxJdeck3v+iivUCmBgQm9A2nSmVP0LcN/1PO3v7pT7qAbxjY8aeDg36NTUmZx9kMqeK
 r4QqO8yIhF2eOdJYdyhKrncQ40awH6BW3YaRx4v/5zJuFiO+uM0MVZ9CxPy1wkJ7pLAY
 lmMg==
X-Gm-Message-State: ABy/qLaBdrGJEoq2AKiwds1txGY4hPbko1oMcVwjwV1AWWzfMIYkM3yt
 o9dAY5eZOUvWAfQTBck5578TDA==
X-Google-Smtp-Source: APBJJlHvmYnqUEfQMupLlQUSLLnEPxVICkIYSDMBUwnFYoQAuRxCEO7ekKLA8kJr4NX0LnRrY6UJ3A==
X-Received: by 2002:a05:6a00:13a3:b0:676:2a5c:7bc5 with SMTP id
 t35-20020a056a0013a300b006762a5c7bc5mr5229938pfg.1.1690445356761; 
 Thu, 27 Jul 2023 01:09:16 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:09:16 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v3 17/49] quota: dynamically allocate the dquota-cache shrinker
Date: Thu, 27 Jul 2023 16:04:30 +0800
Message-Id: <20230727080502.77895-18-zhengqi.arch@bytedance.com>
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
 Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new APIs to dynamically allocate the dquota-cache shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/quota/dquot.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index e8232242dd34..8883e6992f7c 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -791,12 +791,6 @@ dqcache_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
 	percpu_counter_read_positive(&dqstats.counter[DQST_FREE_DQUOTS]));
 }
 
-static struct shrinker dqcache_shrinker = {
-	.count_objects = dqcache_shrink_count,
-	.scan_objects = dqcache_shrink_scan,
-	.seeks = DEFAULT_SEEKS,
-};
-
 /*
  * Safely release dquot and put reference to dquot.
  */
@@ -2957,6 +2951,7 @@ static int __init dquot_init(void)
 {
 	int i, ret;
 	unsigned long nr_hash, order;
+	struct shrinker *dqcache_shrinker;
 
 	printk(KERN_NOTICE "VFS: Disk quotas %s\n", __DQUOT_VERSION__);
 
@@ -2991,8 +2986,15 @@ static int __init dquot_init(void)
 	pr_info("VFS: Dquot-cache hash table entries: %ld (order %ld,"
 		" %ld bytes)\n", nr_hash, order, (PAGE_SIZE << order));
 
-	if (register_shrinker(&dqcache_shrinker, "dquota-cache"))
-		panic("Cannot register dquot shrinker");
+	dqcache_shrinker = shrinker_alloc(0, "dquota-cache");
+	if (!dqcache_shrinker)
+		panic("Cannot allocate dquot shrinker");
+
+	dqcache_shrinker->count_objects = dqcache_shrink_count;
+	dqcache_shrinker->scan_objects = dqcache_shrink_scan;
+	dqcache_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(dqcache_shrinker);
 
 	return 0;
 }
-- 
2.30.2

