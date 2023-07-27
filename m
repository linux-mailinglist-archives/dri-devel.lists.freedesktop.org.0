Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014D6764A76
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253D310E51E;
	Thu, 27 Jul 2023 08:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85B310E51E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:09:53 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-686f6231bdeso113080b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445393; x=1691050193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHU8OaKZwBmHAPsd+ulZSL5GxfVyMtJ49ZlHBntG+/k=;
 b=Ws66ywmifmcLi+WS7kmIq1OGsH1BFTj57lSknLEKHfbjZoq0FCk32P7hFix2O77y/C
 4VExY7boGbko1TLXa8rf04m6+c8ScNg+Ye07GBCAr/bT75kG0yI8bdxHraEPkF+rcUYR
 8BmftTtO1b4i7ZeslsgPT7KHdxn3xY8ziOGXEmWj+FzniwFS8tNvAxdGJbvq/4djXF38
 gQDVTQD96XEDgWvn9v9d4yLEL0qbZzBxPnvHBbbs4StP2CGFCs0AHk/pzAfhLwFN3LYv
 MATNwQY8c4ti2yb34XlOR1fjl5eoQUN5qPDBlkMol6h4RrCuQdh3qGqhSkTUZQAnG9Jo
 zXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445393; x=1691050193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHU8OaKZwBmHAPsd+ulZSL5GxfVyMtJ49ZlHBntG+/k=;
 b=hieyATFy5LTTYB2rIxAoNGvU3Bmhm+p4gsxT7j4KImeD53GmDZ/lOCnam0DMNYCU+M
 WZkGyRI3N4b6YFghGeTtDL64RZHwVDUX+gdtONfMYUwYYs0OT8G1jVdsWtjEIr8tnJzS
 O0zx2xlh9iww2R4yWWDDHDTCUshIXzeqeloCO6fmbZeFMUq2IO8PHDNLlHj8P1pa3Dls
 8c2ohE+bWQ5y+ac81o5ICOOt89q1lttAKGtJmfKlbUJM/qARCTHC7/IPaWVZQeBaBPfq
 oi9W3nHSrRldn9b/xrMbBL0F6ue+SQqweoFXtA7HzK9omIxZ9PsDZpwyYU8oBVwPw6tt
 Dbnw==
X-Gm-Message-State: ABy/qLbQxTuidMm5GXqOlGh8UPyuUO2ZtW9RzKKiJXmc7YmiqSgNVCex
 76qCeCp2b3BgT/qsdVKEzfH3+A==
X-Google-Smtp-Source: APBJJlFl46sZLt7x9x1yarGXcrDY9BzfubiI/ML/2A4f5iYMwILGEdxBDjTGuKdYIeQS2k9MfMDqhg==
X-Received: by 2002:a05:6a00:4a0e:b0:677:3439:874a with SMTP id
 do14-20020a056a004a0e00b006773439874amr5199798pfb.3.1690445393467; 
 Thu, 27 Jul 2023 01:09:53 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:09:53 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v3 20/49] rcu: dynamically allocate the rcu-kfree shrinker
Date: Thu, 27 Jul 2023 16:04:33 +0800
Message-Id: <20230727080502.77895-21-zhengqi.arch@bytedance.com>
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

Use new APIs to dynamically allocate the rcu-kfree shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 kernel/rcu/tree.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index cb1caefa8bd0..6d2f82f79c65 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -3449,13 +3449,6 @@ kfree_rcu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 	return freed == 0 ? SHRINK_STOP : freed;
 }
 
-static struct shrinker kfree_rcu_shrinker = {
-	.count_objects = kfree_rcu_shrink_count,
-	.scan_objects = kfree_rcu_shrink_scan,
-	.batch = 0,
-	.seeks = DEFAULT_SEEKS,
-};
-
 void __init kfree_rcu_scheduler_running(void)
 {
 	int cpu;
@@ -4931,6 +4924,7 @@ static void __init kfree_rcu_batch_init(void)
 {
 	int cpu;
 	int i, j;
+	struct shrinker *kfree_rcu_shrinker;
 
 	/* Clamp it to [0:100] seconds interval. */
 	if (rcu_delay_page_cache_fill_msec < 0 ||
@@ -4962,8 +4956,18 @@ static void __init kfree_rcu_batch_init(void)
 		INIT_DELAYED_WORK(&krcp->page_cache_work, fill_page_cache_func);
 		krcp->initialized = true;
 	}
-	if (register_shrinker(&kfree_rcu_shrinker, "rcu-kfree"))
-		pr_err("Failed to register kfree_rcu() shrinker!\n");
+
+	kfree_rcu_shrinker = shrinker_alloc(0, "rcu-kfree");
+	if (!kfree_rcu_shrinker) {
+		pr_err("Failed to allocate kfree_rcu() shrinker!\n");
+		return;
+	}
+
+	kfree_rcu_shrinker->count_objects = kfree_rcu_shrink_count;
+	kfree_rcu_shrinker->scan_objects = kfree_rcu_shrink_scan;
+	kfree_rcu_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(kfree_rcu_shrinker);
 }
 
 void __init rcu_init(void)
-- 
2.30.2

