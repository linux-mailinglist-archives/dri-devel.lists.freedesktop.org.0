Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E66467720E4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 13:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F46310E27A;
	Mon,  7 Aug 2023 11:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17ECC10E27A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 11:17:52 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-26890669c8eso932536a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 04:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1691407071; x=1692011871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jaqVlo27zysQOw4inLaa7RWYi61naAqQm5GJ5upJpN4=;
 b=STte4jf7FhwqVhw4SDsuIf9ArKOz7aaezU9GQvpwx72Qohuw9VAsNSdsTliApCOiZv
 hZglRc835HN169D4rPdYFdfBD3Qzmlb6nb7pOyd5sRW5/Q53h6lgQrbmmsvusnFxieMS
 3gEtEAPOYNwIuSKOCZt36UxF2L3eT/vOSqmUXX+knGy5r/m2K69NUUZ1EZhY9Qhw5qzB
 8KZjkXC6v5RjXBHEQfQqjwk13t5nh8R+eLAxTypf0xdr6jeYUU8V2GMJD0vc04NJ7YiJ
 wDeEObjpas42qIWcxQ3ypCHSoS50Jk57/3cVZMKwNJGNUHm8wBkxvAyimm97ZuR/Kr/P
 R5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691407071; x=1692011871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jaqVlo27zysQOw4inLaa7RWYi61naAqQm5GJ5upJpN4=;
 b=TKTS9fHZwfZOazCkKY2qyUw5yZBfP5hBx8d9IWxvURZllfblzTVf8wAQJtdA5hgvCN
 AzmgP4FRrW8BHPrfkaWnmTLzk/CKHcGFgbubIoUxFKdHYNPz80GjUcmj5H3c3wYwiiVT
 JAosGXjnyit2G9/p/IBRmraHPngRflwmcuyaXsNQnZv2+ZfkRfU3RQXmFExQ2sMeq3Hz
 V2Aie/ICW49xWY2gdEtwNhsmPdncHixa9RgC7jywvP8M/OSbWJqFQqrMBSwBxxvftAPq
 4MPb5hJ5CRjE1Cqm3qBNPkx3A3YemOB/UBe44A19YlUne9tNvpmlDibRe47okh+leJPu
 Kfhg==
X-Gm-Message-State: AOJu0YwiB7WOfxMcE6rp3RoCaC1ivFUkApIEbdrWk3ax1y99mHd0e6E+
 rtjzW0b8pVAWNZvRNFZ9EFkPJw==
X-Google-Smtp-Source: AGHT+IHBSjfm4qMxfKY1o30DsQrf62j+YLyyzQgOSjZX7MvZKQZkongUtrzUOFN5xrnWaoCKIehpOA==
X-Received: by 2002:a17:90a:9c3:b0:269:41cf:7212 with SMTP id
 61-20020a17090a09c300b0026941cf7212mr4969668pjo.4.1691407071669; 
 Mon, 07 Aug 2023 04:17:51 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:17:51 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 simon.horman@corigine.com, dlemoal@kernel.org
Subject: [PATCH v4 37/48] xfs: dynamically allocate the xfs-buf shrinker
Date: Mon,  7 Aug 2023 19:09:25 +0800
Message-Id: <20230807110936.21819-38-zhengqi.arch@bytedance.com>
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

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the xfs-buf shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct xfs_buftarg.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/xfs/xfs_buf.c | 25 ++++++++++++++-----------
 fs/xfs/xfs_buf.h |  2 +-
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 15d1e5a7c2d3..715730fc91cb 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -1906,8 +1906,7 @@ xfs_buftarg_shrink_scan(
 	struct shrinker		*shrink,
 	struct shrink_control	*sc)
 {
-	struct xfs_buftarg	*btp = container_of(shrink,
-					struct xfs_buftarg, bt_shrinker);
+	struct xfs_buftarg	*btp = shrink->private_data;
 	LIST_HEAD(dispose);
 	unsigned long		freed;
 
@@ -1929,8 +1928,7 @@ xfs_buftarg_shrink_count(
 	struct shrinker		*shrink,
 	struct shrink_control	*sc)
 {
-	struct xfs_buftarg	*btp = container_of(shrink,
-					struct xfs_buftarg, bt_shrinker);
+	struct xfs_buftarg	*btp = shrink->private_data;
 	return list_lru_shrink_count(&btp->bt_lru, sc);
 }
 
@@ -1938,7 +1936,7 @@ void
 xfs_free_buftarg(
 	struct xfs_buftarg	*btp)
 {
-	unregister_shrinker(&btp->bt_shrinker);
+	shrinker_free(btp->bt_shrinker);
 	ASSERT(percpu_counter_sum(&btp->bt_io_count) == 0);
 	percpu_counter_destroy(&btp->bt_io_count);
 	list_lru_destroy(&btp->bt_lru);
@@ -2021,13 +2019,18 @@ xfs_alloc_buftarg(
 	if (percpu_counter_init(&btp->bt_io_count, 0, GFP_KERNEL))
 		goto error_lru;
 
-	btp->bt_shrinker.count_objects = xfs_buftarg_shrink_count;
-	btp->bt_shrinker.scan_objects = xfs_buftarg_shrink_scan;
-	btp->bt_shrinker.seeks = DEFAULT_SEEKS;
-	btp->bt_shrinker.flags = SHRINKER_NUMA_AWARE;
-	if (register_shrinker(&btp->bt_shrinker, "xfs-buf:%s",
-			      mp->m_super->s_id))
+	btp->bt_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "xfs-buf:%s",
+					  mp->m_super->s_id);
+	if (!btp->bt_shrinker)
 		goto error_pcpu;
+
+	btp->bt_shrinker->count_objects = xfs_buftarg_shrink_count;
+	btp->bt_shrinker->scan_objects = xfs_buftarg_shrink_scan;
+	btp->bt_shrinker->seeks = DEFAULT_SEEKS;
+	btp->bt_shrinker->private_data = btp;
+
+	shrinker_register(btp->bt_shrinker);
+
 	return btp;
 
 error_pcpu:
diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index 549c60942208..4e6969a675f7 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -102,7 +102,7 @@ typedef struct xfs_buftarg {
 	size_t			bt_logical_sectormask;
 
 	/* LRU control structures */
-	struct shrinker		bt_shrinker;
+	struct shrinker		*bt_shrinker;
 	struct list_lru		bt_lru;
 
 	struct percpu_counter	bt_io_count;
-- 
2.30.2

