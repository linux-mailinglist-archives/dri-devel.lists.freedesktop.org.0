Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA575EF89
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2102C10E29C;
	Mon, 24 Jul 2023 09:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304B010E29C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 09:46:07 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b867f9198dso8893955ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690191967; x=1690796767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vu9DfqGDIkVtY7CS+mn/8y6VlhAfp+/Q2ofuaCWar5Q=;
 b=ZITiOrrWh+FheWM3chZFCAM8bc3YrsEgqzfm5Am/axy3dDhyTEHWaCIE6CxJlUheOx
 RF45EA9aOXE5By7kx/OP7STghpSD/KEB/oF3GrXK+Myxe/+Fwg6k+PP3FURA3cxLYMYy
 QPmEGcQxgz/g2uZ3I+YFETVsDVpSfeGJ/6AYCWm2OW7IkIAxCPa+wrGdNlr2psYdQiso
 l4rMdXxvPMn1WtqWv/dfO7wx6DqTx5ztQcgxaNLtyw9DkIVWCy3gu8FnfH++DQ/RAVD5
 IA2z6EzP9oeF3tWiBWkf5RokEJVb120E1SPLRv9Xx8rFVupecJKnGVj8I/3khxvVhjBZ
 QV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690191967; x=1690796767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vu9DfqGDIkVtY7CS+mn/8y6VlhAfp+/Q2ofuaCWar5Q=;
 b=VylcKEyrarn/35K8OM8ldCnPp93sp3M1vgfE7Ccdf6uNoENvc/OqlK+IKB4IRi7gEK
 xTQ9YCKKmvJNNovckDWewkZbPLt0LqGsVgO6XdqO+LZSEcpc7JhwuaWJdRfb7/siF/dm
 sXqyLIaFHDDDlJ/M8gzn6z5NK1t9yz3BghrOj+bAAHgly2yBPG6uB5LtfZicpzAmNVbn
 FBUCxMvKW8iNq2/YhQkbzjv2UiJWff23OxXGb2Q2Gry9895N7/yhWILkQ0Q+Qwqd9oUs
 1it2Xa0JX5ZQFzUluq69Z5u+ej0P2bXy4ZS/K/j8251SKgw8BZQCZopM7I40hDhh1f3U
 tIRg==
X-Gm-Message-State: ABy/qLak49V68QSn5SoBX0izE6nYLRfufdIJMLCAuGwlvwdb6iOrZuzD
 XSOHWFCBYHN2ohc+AynMxap1cA==
X-Google-Smtp-Source: APBJJlGrsdFKJ71ukJT79kDa1W+M4ztJszdSUa3mf2ArYfnWEb5YwD/wtpSbLXe4wEi7ibAUftTBwg==
X-Received: by 2002:a17:902:ecd2:b0:1b8:b4f6:1327 with SMTP id
 a18-20020a170902ecd200b001b8b4f61327mr12288935plh.6.1690191966684; 
 Mon, 24 Jul 2023 02:46:06 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:46:06 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v2 05/47] binder: dynamically allocate the android-binder
 shrinker
Date: Mon, 24 Jul 2023 17:43:12 +0800
Message-Id: <20230724094354.90817-6-zhengqi.arch@bytedance.com>
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

Use new APIs to dynamically allocate the android-binder shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/android/binder_alloc.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index e3db8297095a..019981d65e1e 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -1053,11 +1053,7 @@ binder_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 			    NULL, sc->nr_to_scan);
 }
 
-static struct shrinker binder_shrinker = {
-	.count_objects = binder_shrink_count,
-	.scan_objects = binder_shrink_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *binder_shrinker;
 
 /**
  * binder_alloc_init() - called by binder_open() for per-proc initialization
@@ -1077,19 +1073,30 @@ void binder_alloc_init(struct binder_alloc *alloc)
 
 int binder_alloc_shrinker_init(void)
 {
-	int ret = list_lru_init(&binder_alloc_lru);
+	int ret;
 
-	if (ret == 0) {
-		ret = register_shrinker(&binder_shrinker, "android-binder");
-		if (ret)
-			list_lru_destroy(&binder_alloc_lru);
+	ret = list_lru_init(&binder_alloc_lru);
+	if (ret)
+		return ret;
+
+	binder_shrinker = shrinker_alloc(0, "android-binder");
+	if (!binder_shrinker) {
+		list_lru_destroy(&binder_alloc_lru);
+		return -ENOMEM;
 	}
-	return ret;
+
+	binder_shrinker->count_objects = binder_shrink_count;
+	binder_shrinker->scan_objects = binder_shrink_scan;
+	binder_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(binder_shrinker);
+
+	return 0;
 }
 
 void binder_alloc_shrinker_exit(void)
 {
-	unregister_shrinker(&binder_shrinker);
+	shrinker_unregister(binder_shrinker);
 	list_lru_destroy(&binder_alloc_lru);
 }
 
-- 
2.30.2

