Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E45177F509
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 13:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629A610E452;
	Thu, 17 Aug 2023 11:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C144710E452
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 11:24:48 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1befe39630bso1866955ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 04:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692271488; x=1692876288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7bwmZAFhPRfqsSPFwB3IV8LJcvLn4gI9V7ELWjZ+Dw=;
 b=E667FU1q5yUbFYqx9BwHEJkdNAgKfidWcc5ZgjhQQ/mESjGah7FzWCA300/igNm9V3
 iELPRn+pzOK/NtZ+GP4yOP+jMtWST+yUR68q9CpS5n9zjZZGhZfyu7/xo/HJFBwFsgdS
 Fn2bIiASzCPYYzQ8hJlk3AtvoZUod5eY7ys6Lly6upo9qdeEMtkENep5f6dARROB8Qtv
 3eSp2HAIS/Zfh5EDeYYzF8GMIWSCZ6wmum3AMCbPgzO+3hsAVAsjBi9fOix0lM4b6AEH
 46KmG8k7sUEmxdKHvkXOGiZfxhdT/VBl9qeYF1l77ZmXhkuGTPaCq3PQ0MHkM/+lNa1w
 TnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692271488; x=1692876288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q7bwmZAFhPRfqsSPFwB3IV8LJcvLn4gI9V7ELWjZ+Dw=;
 b=fV+J6XYRx/FNzYGwx/tFJtCQoF4qXtwPPT/LyV0I9yAlRE0YQ+GWQdS9Mzywt+RlF7
 E1SxgF4uQUZ60CTnt8F1x61fSdXIe5Q2EtIZSI2JQbYlDQ6eQQuFnZ1TanLf4EjC0hmr
 Nzj6+1vNjHaVdBgRF4kAQjgYbRtTU6nsPKR+ulBPrMrxouK3w93BS7coDq97VF9ytgaJ
 IBdbE+bAXvkX7xgpq/Te9MelsvJK7amL6jSVczu0DeguYOmE/BwMXb3W7mRS5OsGZcQj
 t4Ukv5WFhytpAfQwdHU2xFQC/Jsr2Xoyp0W+313YMderHsW22zVzcaJT2C0mw1ox5TFc
 9wXQ==
X-Gm-Message-State: AOJu0YwhWDfnSb0KLB+IfVLDmynJeDmkqN2IqmXd3sVHKouPjGOm/cUu
 eDbCbGdVIMKTB7I98P9+Jq4rkQ==
X-Google-Smtp-Source: AGHT+IFkvJTgDp0SXlu0lQRx4ok9QX20WzaEZhlm1VB3qb5n/lSGDntzihW5jKwOury0iV0Wn4jxUQ==
X-Received: by 2002:a17:903:1208:b0:1b8:aded:524c with SMTP id
 l8-20020a170903120800b001b8aded524cmr5464540plh.1.1692271488357; 
 Thu, 17 Aug 2023 04:24:48 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 jd22-20020a170903261600b001bde877a7casm7229309plb.264.2023.08.17.04.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 04:24:47 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 joel@joelfernandes.org, christian.koenig@amd.com
Subject: [PATCH v2 3/5] mm: shrinker: remove redundant shrinker_rwsem in
 debugfs operations
Date: Thu, 17 Aug 2023 19:24:00 +0800
Message-Id: <20230817112402.77010-4-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230817112402.77010-1-zhengqi.arch@bytedance.com>
References: <20230817112402.77010-1-zhengqi.arch@bytedance.com>
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
Cc: linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The debugfs_remove_recursive() will wait for debugfs_file_put() to return,
so the shrinker will not be freed when doing debugfs operations (such as
shrinker_debugfs_count_show() and shrinker_debugfs_scan_write()), so there
is no need to hold shrinker_rwsem during debugfs operations.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/shrinker_debug.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
index ee0cddb4530f..e4ce509f619e 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -51,17 +51,12 @@ static int shrinker_debugfs_count_show(struct seq_file *m, void *v)
 	struct mem_cgroup *memcg;
 	unsigned long total;
 	bool memcg_aware;
-	int ret, nid;
+	int ret = 0, nid;
 
 	count_per_node = kcalloc(nr_node_ids, sizeof(unsigned long), GFP_KERNEL);
 	if (!count_per_node)
 		return -ENOMEM;
 
-	ret = down_read_killable(&shrinker_rwsem);
-	if (ret) {
-		kfree(count_per_node);
-		return ret;
-	}
 	rcu_read_lock();
 
 	memcg_aware = shrinker->flags & SHRINKER_MEMCG_AWARE;
@@ -94,7 +89,6 @@ static int shrinker_debugfs_count_show(struct seq_file *m, void *v)
 	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)) != NULL);
 
 	rcu_read_unlock();
-	up_read(&shrinker_rwsem);
 
 	kfree(count_per_node);
 	return ret;
@@ -119,7 +113,6 @@ static ssize_t shrinker_debugfs_scan_write(struct file *file,
 	struct mem_cgroup *memcg = NULL;
 	int nid;
 	char kbuf[72];
-	ssize_t ret;
 
 	read_len = size < (sizeof(kbuf) - 1) ? size : (sizeof(kbuf) - 1);
 	if (copy_from_user(kbuf, buf, read_len))
@@ -148,12 +141,6 @@ static ssize_t shrinker_debugfs_scan_write(struct file *file,
 		return -EINVAL;
 	}
 
-	ret = down_read_killable(&shrinker_rwsem);
-	if (ret) {
-		mem_cgroup_put(memcg);
-		return ret;
-	}
-
 	sc.nid = nid;
 	sc.memcg = memcg;
 	sc.nr_to_scan = nr_to_scan;
@@ -161,7 +148,6 @@ static ssize_t shrinker_debugfs_scan_write(struct file *file,
 
 	shrinker->scan_objects(shrinker, &sc);
 
-	up_read(&shrinker_rwsem);
 	mem_cgroup_put(memcg);
 
 	return size;
-- 
2.30.2

