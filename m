Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E8579A6B5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D805710E1BA;
	Mon, 11 Sep 2023 09:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C779710E1BA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:26:23 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1befe39630bso9331365ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 02:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1694424383; x=1695029183;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7bwmZAFhPRfqsSPFwB3IV8LJcvLn4gI9V7ELWjZ+Dw=;
 b=Jv3bvNpFK+eCokllkGyoGwIpW197d5lytwc+vdzJWSY+wAoaHWfl1lDgk0k9I/ihG2
 R6yu7TZVOl/E2W0W9Wye1Cq0G5PugWPo+rWf4+/b/HuhGMk4NWNHOU1Q9JPcerleWttg
 7yeVkPbzZvUuOi0z6OgHAdA59W7NExqA2c3oVeeO76Sj2e9nVROU7jsEJ+oXYvWB0sUX
 9621R2C+75JKMy4vfhz87oBDNRwHZifQ59ERlpM2Ndzrvx95RfGJNSQSWVXaq/0l3UfS
 yc2EUcKnMpm4sdxyK1axh2AlrOrhmaQiS6XyHF2dT3dkOjY2tKqELfQXLzmffZYhZCdP
 Yj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694424383; x=1695029183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q7bwmZAFhPRfqsSPFwB3IV8LJcvLn4gI9V7ELWjZ+Dw=;
 b=KLyROEXKD1ZQ4eKbP7znyZNWADKV91uDWtMO+dgU9zkt5caqrx0FjRCbVt4rrc7Ecx
 SLO4eclQfqQNvSELQFqWrsk/iaZttoqMlP0XQUXWknDmeb1Vo8tgX2w2/on43qkLDUJ8
 Z2T+MAi6G+ux7DhawQk9PkyCJBjbA7T97DDbEBhgA9ejcFFg87sML3HzbdKG5gs7QBS3
 jZhBXJkBhF4+QzZJHZB2Cir3ljjNEjgunUhZcwyyXuuO/mYjqK6R4bdOyXqHz4kc3GXw
 NUjSTg0PVcmyVlHogh8UeM6na8kTedZRK7JWbMxpdiSDOs6i+5GV5QLCgfIwWGyRy06Q
 h1oQ==
X-Gm-Message-State: AOJu0YyeWNyK3YhzXTLrTvWKzgFt33Jw7/G5Qtv/qVeiXZT6Sp7kl1vm
 lDMVceac2mtvfz/Vlt6yRYE4/A==
X-Google-Smtp-Source: AGHT+IGuwOOmOTYHUBi51KVf+G2IH+LqVvZcIpa/lkU6FOZxO8pwy9QvfijhxoNvFM1VAXL8ZDsGDA==
X-Received: by 2002:a17:902:e546:b0:1bb:9e6e:a9f3 with SMTP id
 n6-20020a170902e54600b001bb9e6ea9f3mr10956272plf.4.1694424383369; 
 Mon, 11 Sep 2023 02:26:23 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a170902788900b001b89466a5f4sm5964623pll.105.2023.09.11.02.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 02:26:23 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 joel@joelfernandes.org, christian.koenig@amd.com, daniel@ffwll.ch
Subject: [PATCH v4 3/4] mm: shrinker: remove redundant shrinker_rwsem in
 debugfs operations
Date: Mon, 11 Sep 2023 17:25:16 +0800
Message-Id: <20230911092517.64141-4-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230911092517.64141-1-zhengqi.arch@bytedance.com>
References: <20230911092517.64141-1-zhengqi.arch@bytedance.com>
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

