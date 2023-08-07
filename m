Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FC9772004
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 13:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A4710E268;
	Mon,  7 Aug 2023 11:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDDD10E268
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 11:13:24 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-790b9d7d643so44488039f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1691406804; x=1692011604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4VJlLpDqVGiuvI83ez+3bl7yR5bVuWalBgtTU2vfBLE=;
 b=i2oZ2Se5RaRdFd0q9t3NqBTv/dUkxD/p2SyHpAjMjg/XHGqyx1ejwAfepurqt3olXd
 4JrDoh1Y9dLDoFntnleeQjfq8XZjg4nTjOSD4Duga+gvfwhzkhg3QVfdrOJlicPQaYUD
 v5DwTanMH6RhkvK4rWOetuDFETnSCGxcV41PCfrrWGGU2b+vPg8IYLTIauqtUI6qQnyf
 JDKJFxqA5C/eh/Oo8gwkHqwPIIO1pJg4e68ItW2uJIdbbavFER6b/PwVILGTxzeWrF6b
 lEtQmpfrwSnO090W7cEUPihusqog8pTCjc32QMYuqZWzqkk8YiBOx308Pfsd+2Yt04OK
 T2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691406804; x=1692011604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4VJlLpDqVGiuvI83ez+3bl7yR5bVuWalBgtTU2vfBLE=;
 b=cFpSLvdpQamXc4kpbuzC8d9sI1HmTJjV3e/Rls15cDwh3zxK6ALRFIK3fdzjW2lGCd
 X6Xp9/q5rjhWWYwlFGm6P133R6yu0dJW9Fi0sz0fREsI78QYutr6XMMTJEB75VoVlgB+
 7So/xQaiRmGKHuBcNIrjHEfr/kqSefHZ5n66XsJADiTApcGvfCzlxLVhrHhCS85CEFRr
 FrT6TM/7jHYjBmU0QQphzibhMraDE56DR2Tw8ntj87i2X73b0FNfREDu9hHEo2QLEw1N
 ERpBDT+ARP9kt3xlt0hQxAgu4hfFXG1+2kSBPp+hEg64bjNba4UQoWNJ5bP9dg9PBM63
 AVIg==
X-Gm-Message-State: ABy/qLZccVspbzMN69o+vR68uvjrtLWMeVyzvDhEUzjQb2IrU1U7900A
 Sgz7zoAmtv8D9E56axIoTojBvQ==
X-Google-Smtp-Source: APBJJlG6KxjpSP18cuDMGPLwCal+2Q6XOYkRmOlR+93TSEU+QOz0TNU1VRvfHZPrdEq648UTFq+gsw==
X-Received: by 2002:a92:d944:0:b0:349:3c78:fd14 with SMTP id
 l4-20020a92d944000000b003493c78fd14mr13499018ilq.1.1691406803912; 
 Mon, 07 Aug 2023 04:13:23 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:13:23 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 simon.horman@corigine.com, dlemoal@kernel.org
Subject: [PATCH v4 16/48] quota: dynamically allocate the dquota-cache shrinker
Date: Mon,  7 Aug 2023 19:09:04 +0800
Message-Id: <20230807110936.21819-17-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
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
index 9e72bfe8bbad..c303cffdf433 100644
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
@@ -2956,6 +2950,7 @@ static int __init dquot_init(void)
 {
 	int i, ret;
 	unsigned long nr_hash, order;
+	struct shrinker *dqcache_shrinker;
 
 	printk(KERN_NOTICE "VFS: Disk quotas %s\n", __DQUOT_VERSION__);
 
@@ -2990,8 +2985,15 @@ static int __init dquot_init(void)
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

