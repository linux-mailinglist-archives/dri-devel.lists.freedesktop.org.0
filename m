Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBEC73B171
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9503F10E617;
	Fri, 23 Jun 2023 07:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D1E10E501
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:54:35 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1b52418c25bso12031065ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687424075; x=1690016075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ftOXXP2bfTIIt8St3T9822C8Mz+yI5OAEWwVCqdxqi8=;
 b=AF1n71Ibzw+/eJzW8ZfFCXm2Gb4L6rcgcO3MWUfrJXSOCg2q4/6sdbKki+cciYNMm8
 euETZJp/Yv9okGd+5XPvMxEgndnOAmqccUN3sNROxfnHbIeAfCrF3CESQGiUHVaKUyC0
 MpSE/83T59YTQuiU5NMvjWSDBOsWVTepqqBeQE1tIy9JZFyOQuULXF0wbqj90XyCa0gR
 wARDSKvxEvJy+BtXj+ipth/FF0Y38R/9qPz9cOOh0wy/h6cCvspbbaNHGZoc8L1j5F66
 eXHRgIUKfoLp9EhNKNNczQL499XVYbOwcbEp2A8mZxNkm++j1bZaQj9vcnyBlktuqhCK
 186Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687424075; x=1690016075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ftOXXP2bfTIIt8St3T9822C8Mz+yI5OAEWwVCqdxqi8=;
 b=M5xUu1ux8dNmSp3QR6rKJ8OqIUz+GfBH1omZLYYmPUSQOxl7Ig95GxuN/fELfuCLqK
 aqW7yuHSxpReGf7d09MnWNdlHhElBi1LyEZKxhjBjofCnxWWcmaTEES/57zU/zTqxbxr
 i74YbSIoQfJAVInom6ViWJYru9bGzfHx5HpxFE2iCeHbM6WAr0xl3n0A6nd1JnGC1Zr6
 0pgE/LdNZf/LsfB9sK8xv+1YeT5PcGnxZS59zja1kBGpXh+jBe9JCOwSKAHewjhkTycf
 2ppdyptduClprkea4d7Wux3W1W3R7MI5qeLboKbddg0a1IhhYL7khBHiRXyXpVAIptEx
 xQfA==
X-Gm-Message-State: AC+VfDxdFE8hkyXgF0MZAapWRG7TPJdUk+9178Uf4PL6mWgbO6wPFMkP
 sVZFN/ek/cT5mjGd7JHvvCZbNw==
X-Google-Smtp-Source: ACHHUZ5hV1GhQPf78RPEQj8dLuXzVGGtbX4uDKxYqhUuZR/F2WM6CQGQNWMXHDLRseslqPACLVPKJA==
X-Received: by 2002:a17:903:1246:b0:1b3:d8ac:8db3 with SMTP id
 u6-20020a170903124600b001b3d8ac8db3mr21942648plh.6.1687424075082; 
 Thu, 22 Jun 2023 01:54:35 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b001b549fce345sm4806971plw.230.2023.06.22.01.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:54:34 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Subject: [PATCH 04/29] drm/msm: dynamically allocate the drm-msm_gem shrinker
Date: Thu, 22 Jun 2023 16:53:10 +0800
Message-Id: <20230622085335.77010-5-zhengqi.arch@bytedance.com>
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
we need to dynamically allocate the drm-msm_gem shrinker,
so that it can be freed asynchronously using kfree_rcu().
Then it doesn't need to wait for RCU read-side critical
section when releasing the struct msm_drm_private.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/gpu/drm/msm/msm_drv.h          |  2 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 25 ++++++++++++++-----------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e13a8cbd61c9..4f3ba55058cd 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -217,7 +217,7 @@ struct msm_drm_private {
 	} vram;
 
 	struct notifier_block vmap_notifier;
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 	struct drm_atomic_state *pm_state;
 
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index f38296ad8743..db7582ae1f19 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -34,8 +34,7 @@ static bool can_block(struct shrink_control *sc)
 static unsigned long
 msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct msm_drm_private *priv =
-		container_of(shrinker, struct msm_drm_private, shrinker);
+	struct msm_drm_private *priv = shrinker->private_data;
 	unsigned count = priv->lru.dontneed.count;
 
 	if (can_swap())
@@ -100,8 +99,7 @@ active_evict(struct drm_gem_object *obj)
 static unsigned long
 msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct msm_drm_private *priv =
-		container_of(shrinker, struct msm_drm_private, shrinker);
+	struct msm_drm_private *priv = shrinker->private_data;
 	struct {
 		struct drm_gem_lru *lru;
 		bool (*shrink)(struct drm_gem_object *obj);
@@ -151,7 +149,7 @@ msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
 	int ret;
 
 	fs_reclaim_acquire(GFP_KERNEL);
-	ret = msm_gem_shrinker_scan(&priv->shrinker, &sc);
+	ret = msm_gem_shrinker_scan(priv->shrinker, &sc);
 	fs_reclaim_release(GFP_KERNEL);
 
 	return ret;
@@ -213,10 +211,15 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 void msm_gem_shrinker_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	priv->shrinker.count_objects = msm_gem_shrinker_count;
-	priv->shrinker.scan_objects = msm_gem_shrinker_scan;
-	priv->shrinker.seeks = DEFAULT_SEEKS;
-	WARN_ON(register_shrinker(&priv->shrinker, "drm-msm_gem"));
+
+	priv->shrinker = shrinker_alloc_and_init(msm_gem_shrinker_count,
+						 msm_gem_shrinker_scan, 0,
+						 DEFAULT_SEEKS, 0, priv);
+	if (priv->shrinker &&
+	    register_shrinker(priv->shrinker, "drm-msm_gem")) {
+		shrinker_free(priv->shrinker);
+		WARN_ON(1);
+	}
 
 	priv->vmap_notifier.notifier_call = msm_gem_shrinker_vmap;
 	WARN_ON(register_vmap_purge_notifier(&priv->vmap_notifier));
@@ -232,8 +235,8 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 
-	if (priv->shrinker.nr_deferred) {
+	if (priv->shrinker->nr_deferred) {
 		WARN_ON(unregister_vmap_purge_notifier(&priv->vmap_notifier));
-		unregister_shrinker(&priv->shrinker);
+		unregister_and_free_shrinker(priv->shrinker);
 	}
 }
-- 
2.30.2

