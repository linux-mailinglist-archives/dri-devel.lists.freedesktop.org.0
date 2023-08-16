Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F37E77DC75
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABDB10E308;
	Wed, 16 Aug 2023 08:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC2E10E308
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:36:02 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68844c0af5dso553850b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692174962; x=1692779762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v13l7IPlOPgFsnMxGKXfyNRR5BVZeBzBNEaAsOIHoYU=;
 b=Cya0FxlqQyLZEroXNZk/xmAruZD4t2yH2du/O66Ed0VRPZDEOyZPRffBcEvP7HuEOA
 LBh84tW86g14ySan22a5QNsb0cry8ZMRVhKdpQ7IwM6x6CXd+aHB1uLMFM7LKnBIEidW
 MxKYco8X9KuAaEu/tQZmOH7YKbH1kkg+D4smGVZHtQo4/2ttPh2MOdtMrmR6FWZ71O5C
 hxTJnXYDLk9lIPZ5IpP3Xo1WYZhQHzfJJDwDlHN+js+BDpEOp9bf7emx7MSjJ4NzGyId
 DfLKmdnvHJtnO3OOV1eURaCwflNGnEsTjNw1DynpEsLeKdmNr/5gemJjZDlP6LR1sQGo
 VwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692174962; x=1692779762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v13l7IPlOPgFsnMxGKXfyNRR5BVZeBzBNEaAsOIHoYU=;
 b=iK2XZ5f6uL/WuNGYXdZu/EOmRDUfJONdkjfer7xwquvXLxayY3520dVhEYQHZ0Vy0p
 JeHy9mDLvMsJXIXFaKvhJtx1YfYJ+0N9eRumLdoBh+di88MBnAMhON3Rxpt2GpsAAbcC
 fxue/yo9P/NTz0EtkSc8EmEn/FULSr6SJB+zYQ451TkXUVDiGcnnedn3QGFtGG2OS0/o
 co1/2vuakrvdG6W6s6OQlqEf4p7gJW3nZ2UbOM0Z+pKpKrYeIiUzS94KhUqa1zhMlPhQ
 WcoR6krwf4RqmQyD0AqCz0T92qljAkBEALN1GtQ3jTAIVN/sMAxrfOlplyeDGw6U/Amd
 3mFw==
X-Gm-Message-State: AOJu0YzvEdjEHCwdy8hkBjCNXsZtTB/Z2ddVbcZSmwsguz+Pk02M4Obq
 hh/+yy29Mpr8t/oFWZm5ADh8xA==
X-Google-Smtp-Source: AGHT+IE+pqjEsxtDBKCnfOYW5hSpBYIW97yeRg+vb7eGqw4ZPe5gd676obnQEAvZzfvbXIOzGXycpA==
X-Received: by 2002:a05:6a20:4281:b0:145:3bd9:1377 with SMTP id
 o1-20020a056a20428100b001453bd91377mr2045479pzj.5.1692174962033; 
 Wed, 16 Aug 2023 01:36:02 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a639510000000b005658d3a46d7sm7506333pgd.84.2023.08.16.01.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 01:36:01 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 joel@joelfernandes.org, christian.koenig@amd.com
Subject: [PATCH 3/5] mm: shrinker: remove redundant shrinker_rwsem in debugfs
 operations
Date: Wed, 16 Aug 2023 16:34:17 +0800
Message-Id: <20230816083419.41088-4-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230816083419.41088-1-zhengqi.arch@bytedance.com>
References: <20230816083419.41088-1-zhengqi.arch@bytedance.com>
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
index 3ab53fad8876..61702bdc1af4 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -49,17 +49,12 @@ static int shrinker_debugfs_count_show(struct seq_file *m, void *v)
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
@@ -92,7 +87,6 @@ static int shrinker_debugfs_count_show(struct seq_file *m, void *v)
 	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)) != NULL);
 
 	rcu_read_unlock();
-	up_read(&shrinker_rwsem);
 
 	kfree(count_per_node);
 	return ret;
@@ -117,7 +111,6 @@ static ssize_t shrinker_debugfs_scan_write(struct file *file,
 	struct mem_cgroup *memcg = NULL;
 	int nid;
 	char kbuf[72];
-	ssize_t ret;
 
 	read_len = size < (sizeof(kbuf) - 1) ? size : (sizeof(kbuf) - 1);
 	if (copy_from_user(kbuf, buf, read_len))
@@ -146,12 +139,6 @@ static ssize_t shrinker_debugfs_scan_write(struct file *file,
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
@@ -159,7 +146,6 @@ static ssize_t shrinker_debugfs_scan_write(struct file *file,
 
 	shrinker->scan_objects(shrinker, &sc);
 
-	up_read(&shrinker_rwsem);
 	mem_cgroup_put(memcg);
 
 	return size;
-- 
2.30.2

