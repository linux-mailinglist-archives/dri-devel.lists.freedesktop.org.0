Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0A775EFB1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD08D10E2A2;
	Mon, 24 Jul 2023 09:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5997310E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 09:47:07 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1bba9539a23so641505ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 02:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690192027; x=1690796827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cYIc2pFR4p2fEyppjqJhI12Ags43zx4+1Vguh7yPn/A=;
 b=Mkbkj7G5CQEOG8iOHz5MrSjilpa0Roglbh/CftNIU9Jg3xNX1k/Xj43vnR/S/54ttk
 C3FfMc3SnotTmowd/+id3GM38yUMYBJBhTZIBUulrrZgzYrxT+SQHGW3axYXz1Mzi2fV
 AsX/jIuEEGTsEz+JOjVZRdbKq3nZcbngqtBBtuQhz8//b37rxmcNc4kjft3yYQbvP1Zj
 84eZDPKog/+vrWIKUYa0yatWxoPJwzUv5rccQj+Dyx2lWBxO8FM5qLWfEajMcNN5ZG2/
 nBaypiLs1PufNQuHjnIpPNYd5QiB7rev3NHLgSVLNHqyhO1fbeGyfmflk+kru7Y0DPcw
 GDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690192027; x=1690796827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cYIc2pFR4p2fEyppjqJhI12Ags43zx4+1Vguh7yPn/A=;
 b=FL1/dyqVVaitjK5HOM4vYvts+K+IWiS0VMFOczxBPckEyup/JDhKhCeeTCkdwc/2VQ
 a9KfclmPZ6PzildB7w8XNfPJdAtdifepXX+0Utyo2CUmM5sHuls3TN5ouCPGD4DEt64E
 9CYPufLXPCd5C5O02NzpQYawyvWZDQg4WaPZyMqqs6x0/22D3DnLeiwleOKGgYWrqUZA
 W1VAe3uY4JbVIBm8Wq4oLM3sthNE1Z5rEs3Tv1vID5YgHg5eeTQkK15Hat+191em2JOI
 UMu59NDEkk/anEVRxRGLn9D5sbI8t7rGVGYw4ZLasQvmTRJNR1yM4u2sd5havOcKZNWO
 draw==
X-Gm-Message-State: ABy/qLbLrMSg3zCsUPeDMBS9rvp257euidKH5dFC4HEadMANA46Jcew/
 69shh8BvNvspvog/ziZgYpcTOg==
X-Google-Smtp-Source: APBJJlE71N8j7jMrL1FzeS7v4yJrry2TgN0JWUZm9wk55uK2Ve/eQ/bXmY0X5mXvJcfiEdGHzkgvbw==
X-Received: by 2002:a17:902:ec8b:b0:1b3:d8ac:8db3 with SMTP id
 x11-20020a170902ec8b00b001b3d8ac8db3mr12337602plg.6.1690192026938; 
 Mon, 24 Jul 2023 02:47:06 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:47:06 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v2 10/47] gfs2: dynamically allocate the gfs2-glock shrinker
Date: Mon, 24 Jul 2023 17:43:17 +0800
Message-Id: <20230724094354.90817-11-zhengqi.arch@bytedance.com>
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

Use new APIs to dynamically allocate the gfs2-glock shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/gfs2/glock.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 1438e7465e30..77da354667d9 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -2046,11 +2046,7 @@ static unsigned long gfs2_glock_shrink_count(struct shrinker *shrink,
 	return vfs_pressure_ratio(atomic_read(&lru_count));
 }
 
-static struct shrinker glock_shrinker = {
-	.seeks = DEFAULT_SEEKS,
-	.count_objects = gfs2_glock_shrink_count,
-	.scan_objects = gfs2_glock_shrink_scan,
-};
+static struct shrinker *glock_shrinker;
 
 /**
  * glock_hash_walk - Call a function for glock in a hash bucket
@@ -2472,13 +2468,19 @@ int __init gfs2_glock_init(void)
 		return -ENOMEM;
 	}
 
-	ret = register_shrinker(&glock_shrinker, "gfs2-glock");
-	if (ret) {
+	glock_shrinker = shrinker_alloc(0, "gfs2-glock");
+	if (!glock_shrinker) {
 		destroy_workqueue(glock_workqueue);
 		rhashtable_destroy(&gl_hash_table);
-		return ret;
+		return -ENOMEM;
 	}
 
+	glock_shrinker->count_objects = gfs2_glock_shrink_count;
+	glock_shrinker->scan_objects = gfs2_glock_shrink_scan;
+	glock_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(glock_shrinker);
+
 	for (i = 0; i < GLOCK_WAIT_TABLE_SIZE; i++)
 		init_waitqueue_head(glock_wait_table + i);
 
@@ -2487,7 +2489,7 @@ int __init gfs2_glock_init(void)
 
 void gfs2_glock_exit(void)
 {
-	unregister_shrinker(&glock_shrinker);
+	shrinker_unregister(glock_shrinker);
 	rhashtable_destroy(&gl_hash_table);
 	destroy_workqueue(glock_workqueue);
 }
-- 
2.30.2

