Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9024764B00
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E806710E535;
	Thu, 27 Jul 2023 08:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BDC10E535
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:13:21 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-66d6a9851f3so168655b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445600; x=1691050400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+7Rjo519K3FhaZ9jqPWNUITMom2L2BqSXFVMuCYJXE=;
 b=iCbLBUqUt9Nmpfx9vnMv71z6ZoxeAA3Kwx+3hOoXd1GaTMzDfIKBdQZJLnwkBZI0pa
 Lp64e3iwzE/rImCGGIb1ibgUBPxOPSIGFFuuYRtSxlo+aqH0+DTZDA4mGtoxEeFwJjn7
 eVXRc7yr9jM32bf+/xn99rZxVedfvtJlhFw9fGMGNkAD3ORupJUg3X+ANXG24/AH/vl7
 jpmLaXt1oCEYJ/yvLZ0XDwvzYMWndPPs0hfwCexWDUJDE/XQyc02dMzlI6K63u7Ep8SN
 XNSeVfJxqvuXvz57tL/Yxcln+9J35CIKIXgWOW2mH/cpcfLsA9vX9cNULDu6wCRYP4Zg
 0nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445600; x=1691050400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+7Rjo519K3FhaZ9jqPWNUITMom2L2BqSXFVMuCYJXE=;
 b=YbpRnG5ZPD7n4/FGjCwApXibyg7L1u4G2XI+86EqS028cPavVRDYHEYXAUbmjGCrOJ
 WlR3LHe/G1Wozu8qTojiQSsccxOUTiNuMNA8cCLL/rtNZqs+j5V8Uj8d4F9mB73IYDMT
 mgtvB/D8zxwJiz7pGU6XT1cqHM4wS//xiTkbyIi7UNHjUSrjLO202YDQVzLf9CLlDSpU
 ewXEYaeMHhdy21FzbpiN0otpjSeMGPwfc7ns0Qyr8zNVpJDnJKBOBD+PVpVs8APdtwsx
 06bUXR1aOCP/YwWjpct8eRE9AMTnUOSpk9KBQMwYSZ1G6bLkN/Im5H7+6liMUmMr26zV
 oClg==
X-Gm-Message-State: ABy/qLZxhlI6LNQkXbhqnC2ZxWsK/i533VDCSTp7k2Uzl6VTIp5o2d58
 hRdekZSB7gePM+T2wSpnXsfRVg==
X-Google-Smtp-Source: APBJJlFVIfpGcg6LJptv9vKKDXXp5NoXAxRgeIF2Co73Rpi3BTRYlDiWRgj+jM16dBQ5q2UaSpGRNg==
X-Received: by 2002:a05:6a20:729a:b0:100:b92b:e8be with SMTP id
 o26-20020a056a20729a00b00100b92be8bemr5583609pzk.2.1690445600629; 
 Thu, 27 Jul 2023 01:13:20 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:13:20 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v3 37/49] nfsd: dynamically allocate the nfsd-reply shrinker
Date: Thu, 27 Jul 2023 16:04:50 +0800
Message-Id: <20230727080502.77895-38-zhengqi.arch@bytedance.com>
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the nfsd-reply shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct nfsd_net.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Chuck Lever <chuck.lever@oracle.com>
Acked-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfsd/netns.h    |  2 +-
 fs/nfsd/nfscache.c | 31 ++++++++++++++++---------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/fs/nfsd/netns.h b/fs/nfsd/netns.h
index f669444d5336..ab303a8b77d5 100644
--- a/fs/nfsd/netns.h
+++ b/fs/nfsd/netns.h
@@ -177,7 +177,7 @@ struct nfsd_net {
 	/* size of cache when we saw the longest hash chain */
 	unsigned int             longest_chain_cachesize;
 
-	struct shrinker		nfsd_reply_cache_shrinker;
+	struct shrinker		*nfsd_reply_cache_shrinker;
 
 	/* tracking server-to-server copy mounts */
 	spinlock_t              nfsd_ssc_lock;
diff --git a/fs/nfsd/nfscache.c b/fs/nfsd/nfscache.c
index 80621a709510..fd56a52aa5fb 100644
--- a/fs/nfsd/nfscache.c
+++ b/fs/nfsd/nfscache.c
@@ -201,26 +201,29 @@ int nfsd_reply_cache_init(struct nfsd_net *nn)
 {
 	unsigned int hashsize;
 	unsigned int i;
-	int status = 0;
 
 	nn->max_drc_entries = nfsd_cache_size_limit();
 	atomic_set(&nn->num_drc_entries, 0);
 	hashsize = nfsd_hashsize(nn->max_drc_entries);
 	nn->maskbits = ilog2(hashsize);
 
-	nn->nfsd_reply_cache_shrinker.scan_objects = nfsd_reply_cache_scan;
-	nn->nfsd_reply_cache_shrinker.count_objects = nfsd_reply_cache_count;
-	nn->nfsd_reply_cache_shrinker.seeks = 1;
-	status = register_shrinker(&nn->nfsd_reply_cache_shrinker,
-				   "nfsd-reply:%s", nn->nfsd_name);
-	if (status)
-		return status;
-
 	nn->drc_hashtbl = kvzalloc(array_size(hashsize,
 				sizeof(*nn->drc_hashtbl)), GFP_KERNEL);
 	if (!nn->drc_hashtbl)
+		return -ENOMEM;
+
+	nn->nfsd_reply_cache_shrinker = shrinker_alloc(0, "nfsd-reply:%s",
+						       nn->nfsd_name);
+	if (!nn->nfsd_reply_cache_shrinker)
 		goto out_shrinker;
 
+	nn->nfsd_reply_cache_shrinker->scan_objects = nfsd_reply_cache_scan;
+	nn->nfsd_reply_cache_shrinker->count_objects = nfsd_reply_cache_count;
+	nn->nfsd_reply_cache_shrinker->seeks = 1;
+	nn->nfsd_reply_cache_shrinker->private_data = nn;
+
+	shrinker_register(nn->nfsd_reply_cache_shrinker);
+
 	for (i = 0; i < hashsize; i++) {
 		INIT_LIST_HEAD(&nn->drc_hashtbl[i].lru_head);
 		spin_lock_init(&nn->drc_hashtbl[i].cache_lock);
@@ -229,7 +232,7 @@ int nfsd_reply_cache_init(struct nfsd_net *nn)
 
 	return 0;
 out_shrinker:
-	unregister_shrinker(&nn->nfsd_reply_cache_shrinker);
+	kvfree(nn->drc_hashtbl);
 	printk(KERN_ERR "nfsd: failed to allocate reply cache\n");
 	return -ENOMEM;
 }
@@ -239,7 +242,7 @@ void nfsd_reply_cache_shutdown(struct nfsd_net *nn)
 	struct nfsd_cacherep *rp;
 	unsigned int i;
 
-	unregister_shrinker(&nn->nfsd_reply_cache_shrinker);
+	shrinker_free(nn->nfsd_reply_cache_shrinker);
 
 	for (i = 0; i < nn->drc_hashsize; i++) {
 		struct list_head *head = &nn->drc_hashtbl[i].lru_head;
@@ -323,8 +326,7 @@ nfsd_prune_bucket_locked(struct nfsd_net *nn, struct nfsd_drc_bucket *b,
 static unsigned long
 nfsd_reply_cache_count(struct shrinker *shrink, struct shrink_control *sc)
 {
-	struct nfsd_net *nn = container_of(shrink,
-				struct nfsd_net, nfsd_reply_cache_shrinker);
+	struct nfsd_net *nn = shrink->private_data;
 
 	return atomic_read(&nn->num_drc_entries);
 }
@@ -343,8 +345,7 @@ nfsd_reply_cache_count(struct shrinker *shrink, struct shrink_control *sc)
 static unsigned long
 nfsd_reply_cache_scan(struct shrinker *shrink, struct shrink_control *sc)
 {
-	struct nfsd_net *nn = container_of(shrink,
-				struct nfsd_net, nfsd_reply_cache_shrinker);
+	struct nfsd_net *nn = shrink->private_data;
 	unsigned long freed = 0;
 	LIST_HEAD(dispose);
 	unsigned int i;
-- 
2.30.2

