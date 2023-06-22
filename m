Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3449373B15B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3BB10E5FD;
	Fri, 23 Jun 2023 07:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573D710E14C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:56:20 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-543a37c5c03so1091254a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687424180; x=1690016180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DX6SUDFVJBECNsblFEChPYzpO8xY8cES72+0dMzxuzQ=;
 b=J0xdX/HVFp5YYG4TfcvtFJvRxLyQLKtNeoVYCgaC2J+nRoYDa/BzwrOrCj094o0cZq
 1xReHr0GJ1hygdSXflfCN7O6Wd3k5bnTYjzGehkNWElkKcnI57FpdEY2zo1QIhRivIfW
 Vn3A6HH2yEtIwY+bYcUHLIMQK61OnnzFACK07hJ1eCTN8lHwm9h5Rchf6mt0xuf3bmH2
 YrMt/i+taGwUAGQfmqtCpero+/nADk45X1pPDnlfELgRkE2o8P26K8ugc6xZW6o9l2x2
 0OyQF06tkzpnptZeoSrMW5oczymeBmy807qxrTJz07x7dVgWrGVUEsLlXTXBF7IGucek
 WQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687424180; x=1690016180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DX6SUDFVJBECNsblFEChPYzpO8xY8cES72+0dMzxuzQ=;
 b=QaIETmxhoTMhPAQp0vrbkIPtOub7b2nV/O9JFYznoEVjHPL7rM9po5M0cYJS4kAOPx
 mXsGxXzYswEJZWjc6cbg5ER6eAJPCsrHe8575yE1ME/kxNH5nuFw7ocdJTK6b7GdG/Fk
 cVCzqFrwEAakM1PBu25yu/j3QOA5U1ZWASei2OoChqSrPL104bhwf+pxiMT64vQSOeQs
 xrTfVTsl2UB5Vu2SMv2a5AocIhGr8bH4PsYQewuB4m7zvRNtWbgyAOixyM0o5W8OgYOr
 ly+7wR0MKq5oGcvizttuYP4RM9IZjDCi3Qz1U6zZqvbudK14yIWNKtIdcXLa33i+racS
 73vg==
X-Gm-Message-State: AC+VfDx1iExgKPCI+tgkITLAyiMFKvNMN2eSncIewyWqCOV8cH5wtUNc
 o3WXKlN6+1RL5epeoeSgJPSlpw==
X-Google-Smtp-Source: ACHHUZ6cRwGFUE7wdLf8WreSOUecoWuLPpHsSO23aKngJIhhKsUdOoFlGAyrZhuJGN3RD5MvXrHaNg==
X-Received: by 2002:a17:903:2452:b0:1a9:581b:fbaa with SMTP id
 l18-20020a170903245200b001a9581bfbaamr20887740pls.2.1687424179969; 
 Thu, 22 Jun 2023 01:56:19 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b001b549fce345sm4806971plw.230.2023.06.22.01.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:56:19 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Subject: [PATCH 17/29] xfs: dynamically allocate the xfs-buf shrinker
Date: Thu, 22 Jun 2023 16:53:23 +0800
Message-Id: <20230622085335.77010-18-zhengqi.arch@bytedance.com>
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
we need to dynamically allocate the xfs-buf shrinker,
so that it can be freed asynchronously using kfree_rcu().
Then it doesn't need to wait for RCU read-side critical
section when releasing the struct xfs_buftarg.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/xfs/xfs_buf.c | 25 ++++++++++++++-----------
 fs/xfs/xfs_buf.h |  2 +-
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 15d1e5a7c2d3..6657d285d26f 100644
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
+	unregister_and_free_shrinker(btp->bt_shrinker);
 	ASSERT(percpu_counter_sum(&btp->bt_io_count) == 0);
 	percpu_counter_destroy(&btp->bt_io_count);
 	list_lru_destroy(&btp->bt_lru);
@@ -2021,15 +2019,20 @@ xfs_alloc_buftarg(
 	if (percpu_counter_init(&btp->bt_io_count, 0, GFP_KERNEL))
 		goto error_lru;
 
-	btp->bt_shrinker.count_objects = xfs_buftarg_shrink_count;
-	btp->bt_shrinker.scan_objects = xfs_buftarg_shrink_scan;
-	btp->bt_shrinker.seeks = DEFAULT_SEEKS;
-	btp->bt_shrinker.flags = SHRINKER_NUMA_AWARE;
-	if (register_shrinker(&btp->bt_shrinker, "xfs-buf:%s",
-			      mp->m_super->s_id))
+	btp->bt_shrinker = shrinker_alloc_and_init(xfs_buftarg_shrink_count,
+						   xfs_buftarg_shrink_scan,
+						   0, DEFAULT_SEEKS,
+						   SHRINKER_NUMA_AWARE, btp);
+	if (!btp->bt_shrinker)
 		goto error_pcpu;
+
+	if (register_shrinker(btp->bt_shrinker, "xfs-buf:%s",
+			      mp->m_super->s_id))
+		goto error_shrinker;
 	return btp;
 
+error_shrinker:
+	shrinker_free(btp->bt_shrinker);
 error_pcpu:
 	percpu_counter_destroy(&btp->bt_io_count);
 error_lru:
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

