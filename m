Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D6E32B58C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 08:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F5A89DAB;
	Wed,  3 Mar 2021 07:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2823D6E332
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 01:19:14 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id l2so15143283pgb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Mar 2021 17:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ypMTERcVtpg5jCXcHwsz4DpXkFUI/PvVeSgPYAoMEfQ=;
 b=qe1FCFzSpXeKTPVC/cVrFVo/YIPlCexDKruPqa+/aP6ppsasDwfAyOb6m2yS1H0+Wo
 d7VDL0fu0tNGbPZTJp+YYHjjtd+ng3cam1q4M93dM+SJ7gzecUI+3JzLSljbfQ8obw2e
 4gG7OWWs4enPAv5Vla7YtkPHcw5LRkjBz6rU935M9S896BSrjN7xBc03QC7PoTdOGjTw
 OzG470uyoiC4WS5SfjCxkObGrVeTRwBgRJWefokkPBYuJug31WhJDcJWIGeJlp6C/e4y
 c4GhcsH0fa7ol0DKMfpsK3xPSqKCUlP3lJZoiVILLLcsIM5L04lkY3RyJMacQQj+H6Zh
 X5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ypMTERcVtpg5jCXcHwsz4DpXkFUI/PvVeSgPYAoMEfQ=;
 b=ACkTd5lLa6+LcpSwAJNhr6QvTimajZxe2AMrOExq52err4FD84WSoywoDSZcNkXS13
 BzXk7VgX/gXzqEpAw4NglwQE/mSSKZ91J/6bimoqKAN8GDT4HT3P6DOv4Bgd8ocBe28H
 QV4EmfEbz+9z5VIA4zBM+/eIUeffHww7rveuACjbXi2PxKXP2ARvPXddqafvfrwRVls0
 UpkJTyPB14eKMiKjrD/00c9kLuXvJCsqwPlqzcfxCdOG4gM2WVP6SM8erHTqCxjv2fOI
 vAGD/uv8D1X92R52daIWkguQx+PCLrM2l+AuwBvDnJivKoCFOXNFLxNCVmSjYZ8uwPhq
 0UCg==
X-Gm-Message-State: AOAM533fB/mBZwwemugxxs2ISHOB+1oD8I7zLA0pgsjR8EOpQSohh+8M
 4PGOOAXgoI3NqR2Ujna3R9wcG36eZzWqnA==
X-Google-Smtp-Source: ABdhPJzDi1Oi40lAi7Q04zE5HT1QwXxQYbMUIl1eJqtFb3MXbHo2A5NYH4MMvBNeN8L5QPg8As7PKg==
X-Received: by 2002:a63:fa4d:: with SMTP id g13mr20554587pgk.201.1614734353371; 
 Tue, 02 Mar 2021 17:19:13 -0800 (PST)
Received: from localhost.localdomain ([174.127.229.57])
 by smtp.googlemail.com with ESMTPSA id y23sm21945712pfo.50.2021.03.02.17.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:19:12 -0800 (PST)
From: Anthony DeRossi <ajderossi@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Fix TTM page pool accounting
Date: Tue,  2 Mar 2021 17:17:25 -0800
Message-Id: <20210303011723.22512-1-ajderossi@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Mar 2021 07:40:16 +0000
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
Cc: madhav.chauhan@amd.com, airlied@redhat.com, ray.huang@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Freed pages are not subtracted from the allocated_pages counter in
ttm_pool_type_fini(), causing a leak in the count on device removal.
The next shrinker invocation loops forever trying to free pages that are
no longer in the pool:

  rcu: INFO: rcu_sched self-detected stall on CPU
  rcu:  3-....: (9998 ticks this GP) idle=54e/1/0x4000000000000000 softirq=434857/434857 fqs=2237
    (t=10001 jiffies g=2194533 q=49211)
  NMI backtrace for cpu 3
  CPU: 3 PID: 1034 Comm: kswapd0 Tainted: P           O      5.11.0-com #1
  Hardware name: System manufacturer System Product Name/PRIME X570-PRO, BIOS 1405 11/19/2019
  Call Trace:
   <IRQ>
   ...
   </IRQ>
   sysvec_apic_timer_interrupt+0x77/0x80
   asm_sysvec_apic_timer_interrupt+0x12/0x20
  RIP: 0010:mutex_unlock+0x16/0x20
  Code: e7 48 8b 70 10 e8 7a 53 77 ff eb aa e8 43 6c ff ff 0f 1f 00 65 48 8b 14 25 00 6d 01 00 31 c9 48 89 d0 f0 48 0f b1 0f 48 39 c2 <74> 05 e9 e3 fe ff ff c3 66 90 48 8b 47 20 48 85 c0 74 0f 8b 50 10
  RSP: 0018:ffffbdb840797be8 EFLAGS: 00000246
  RAX: ffff9ff445a41c00 RBX: ffffffffc02a9ef8 RCX: 0000000000000000
  RDX: ffff9ff445a41c00 RSI: ffffbdb840797c78 RDI: ffffffffc02a9ac0
  RBP: 0000000000000080 R08: 0000000000000000 R09: ffffbdb840797c80
  R10: 0000000000000000 R11: fffffffffffffff5 R12: 0000000000000000
  R13: 0000000000000000 R14: 0000000000000084 R15: ffffffffc02a9a60
   ttm_pool_shrink+0x7d/0x90 [ttm]
   ttm_pool_shrinker_scan+0x5/0x20 [ttm]
   do_shrink_slab+0x13a/0x1a0
   shrink_slab+0xcb/0x2f0
   shrink_node+0x2c8/0x6c0
   balance_pgdat+0x2f7/0x580
   kswapd+0x17c/0x300
   ? wait_woken+0x70/0x70
   ? balance_pgdat+0x580/0x580
   kthread+0xff/0x140
   ? kthread_park+0x80/0x80
   ret_from_fork+0x22/0x30

debugfs shows the incorrect total:

  $ cat /sys/kernel/debug/dri/0/ttm_page_pool
            --- 0--- --- 1--- --- 2--- --- 3--- --- 4--- --- 5--- --- 6--- --- 7--- --- 8--- --- 9--- ---10---
  wc      :        0        0        0        0        0        0        0        0        0        0        0
  uc      :        0        0        0        0        0        0        0        0        0        0        0
  wc 32   :        0        0        0        0        0        0        0        0        0        0        0
  uc 32   :        0        0        0        0        0        0        0        0        0        0        0
  DMA uc  :        0        0        0        0        0        0        0        0        0        0        0
  DMA wc  :        0        0        0        0        0        0        0        0        0        0        0
  DMA     :        0        0        0        0        0        0        0        0        0        0        0

  total   :     3029 of  8244261

Using ttm_pool_type_take() to remove pages from the pool before freeing
them correctly accounts for the freed pages.

Fixes: d099fc8f540a ("drm/ttm: new TT backend allocation pool v3")
Signed-off-by: Anthony DeRossi <ajderossi@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 74bf1c84b637..f6df79034805 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -258,13 +258,13 @@ static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
 /* Remove a pool_type from the global shrinker list and free all pages */
 static void ttm_pool_type_fini(struct ttm_pool_type *pt)
 {
-	struct page *p, *tmp;
+	struct page *p;
 
 	mutex_lock(&shrinker_lock);
 	list_del(&pt->shrinker_list);
 	mutex_unlock(&shrinker_lock);
 
-	list_for_each_entry_safe(p, tmp, &pt->pages, lru)
+	while ((p = ttm_pool_type_take(pt)))
 		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
