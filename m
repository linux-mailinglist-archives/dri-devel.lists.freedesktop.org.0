Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E5479A6D7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590EB10E217;
	Mon, 11 Sep 2023 09:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A6C10E217
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:45:43 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1befe39630bso9363845ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 02:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1694425543; x=1695030343;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hCA0ApwXV5FyQtvOpmWRZ9XMHHHCgvXZoPv/VlrFSS0=;
 b=glcqGT6+d5nuoiGxIsU2XFg3MI2iAN9Jmpdg53QSZl3c4UJSk0qoJc4RbagMO98yQn
 KJUOTD0EEs7NAOck8mRw1HuMHX6MENjthmMsgWIloHeOG4QM4jBZyTVfwGRYogux8gVy
 dytpato/hTjrs02kaFkwT0BokA6K3CzhC5rJVDn+ClsimCpkGkPE3/JncI1wlD/iyU+3
 xAXe3PGwa1idAGX6mc+7rhtRb5+4pFTuCBQJ7QQN4cON3V1CHAYYE9H/pKMuMo0+23i8
 PNfMDZgRpPY3OUlthdh4oMe3XscJqtyTA8T77gUS9iWaSuLDIqM+VCvT6fNtJx02QB6k
 R+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694425543; x=1695030343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hCA0ApwXV5FyQtvOpmWRZ9XMHHHCgvXZoPv/VlrFSS0=;
 b=cLjOudWj2vQIdbp8rWfqSBgEoLDJ8iCM10kelQgfQyZtil1QS+JZc6JJH8MKFi+pl6
 sVqjk7nvxhW2YubXhWSSb4mQWANp64Vv8Xevoff/vS08NAKM0rFcPbQFjqJhDOfslTkn
 MvI0eFF9sixH1aO7vBLeoyZWYInKj4McG0rssD0aUC5vl5KS9xGRYFx9FlFv+jVRqlH2
 1HpkBFoj9AFBD3S/G4CifpG6HOfCwbcXqGAcQJJMiokBgP8hC6PJ6WhDuIgBLXw0pbBl
 3MOLMK8+HhisajmG+4A1zFqeDxklqg5vEWr4Z7nrqDmsgdH/ocplQnBYtb3pNB8PcLwX
 /g5Q==
X-Gm-Message-State: AOJu0YzDfjucioQXebOlIxbhAZ2AFIMdCQmHLazfrnugxwF9vo2vvVIY
 MjzDmKIy5nsRG2u8Ia7bMMCoOQ==
X-Google-Smtp-Source: AGHT+IHdDCNX66HmyeFeumyllN+fvmvJwteuvjAREsMUnnfysYcrCUJrxwo3wRPJ4iCHNwAnAJyjKg==
X-Received: by 2002:a17:902:ecd2:b0:1bb:ac37:384b with SMTP id
 a18-20020a170902ecd200b001bbac37384bmr11076107plh.6.1694425543157; 
 Mon, 11 Sep 2023 02:45:43 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 az7-20020a170902a58700b001bdc2fdcf7esm5988188plb.129.2023.09.11.02.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 02:45:42 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v6 04/45] drm/ttm: dynamically allocate the drm-ttm_pool
 shrinker
Date: Mon, 11 Sep 2023 17:44:03 +0800
Message-Id: <20230911094444.68966-5-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230911094444.68966-1-zhengqi.arch@bytedance.com>
References: <20230911094444.68966-1-zhengqi.arch@bytedance.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new APIs to dynamically allocate the drm-ttm_pool shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Christian Koenig <christian.koenig@amd.com>
CC: Huang Rui <ray.huang@amd.com>
CC: David Airlie <airlied@gmail.com>
CC: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/ttm/ttm_pool.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 648ca70403a7..fe610a3cace0 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -73,7 +73,7 @@ static struct ttm_pool_type global_dma32_uncached[MAX_ORDER + 1];
 
 static spinlock_t shrinker_lock;
 static struct list_head shrinker_list;
-static struct shrinker mm_shrinker;
+static struct shrinker *mm_shrinker;
 static DECLARE_RWSEM(pool_shrink_rwsem);
 
 /* Allocate pages of size 1 << order with the given gfp_flags */
@@ -749,8 +749,8 @@ static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
 	struct shrink_control sc = { .gfp_mask = GFP_NOFS };
 
 	fs_reclaim_acquire(GFP_KERNEL);
-	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(&mm_shrinker, &sc),
-		   ttm_pool_shrinker_scan(&mm_shrinker, &sc));
+	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
+		   ttm_pool_shrinker_scan(mm_shrinker, &sc));
 	fs_reclaim_release(GFP_KERNEL);
 
 	return 0;
@@ -794,10 +794,17 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 			    &ttm_pool_debugfs_shrink_fops);
 #endif
 
-	mm_shrinker.count_objects = ttm_pool_shrinker_count;
-	mm_shrinker.scan_objects = ttm_pool_shrinker_scan;
-	mm_shrinker.seeks = 1;
-	return register_shrinker(&mm_shrinker, "drm-ttm_pool");
+	mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");
+	if (!mm_shrinker)
+		return -ENOMEM;
+
+	mm_shrinker->count_objects = ttm_pool_shrinker_count;
+	mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
+	mm_shrinker->seeks = 1;
+
+	shrinker_register(mm_shrinker);
+
+	return 0;
 }
 
 /**
@@ -817,6 +824,6 @@ void ttm_pool_mgr_fini(void)
 		ttm_pool_type_fini(&global_dma32_uncached[i]);
 	}
 
-	unregister_shrinker(&mm_shrinker);
+	shrinker_free(mm_shrinker);
 	WARN_ON(!list_empty(&shrinker_list));
 }
-- 
2.30.2

