Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0791679A6E8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5E810E208;
	Mon, 11 Sep 2023 09:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1466F10E208
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:48:21 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c3aa44c0faso1785375ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1694425700; x=1695030500;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J+AOjYo5MSUvfxmHTrKdHJPfXG1dzZtS744QdXjNFdA=;
 b=Lw9HIPtMUZeNTDCAr8d3o0moeuMjZXDyj32jrsq6P8GJKJiAIyVyLREUIyTb7PjHaN
 N649V+bnXnN2VGCTIj5oAhNh1UviFpeDSn3/jEplqjckTtt5obEZ17sh/NkfITNs0J4W
 TbEiDs/ChhcOguxwXK3UDHY6Ci0jTLYGQBwUCBEFssSma2ujM+ji3JbzFq6WW+xtFqM1
 Mw5kAaBYSxTPOAbqRkh6iSMRKSxoMwIohqa5LtD9pIjgSPlRfm/Fn+N0PTDa2Oq274Aj
 wQIcAJJUAdm/h+KL51xRcxAyo0UWw6C5co9o6t/kJpGS0MaMA67xS96YiaA36i28bYIR
 ToCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694425700; x=1695030500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J+AOjYo5MSUvfxmHTrKdHJPfXG1dzZtS744QdXjNFdA=;
 b=JOwQYRhZgiTha7KNoEgfmDEFvsu1hR8lZkpk7Rm2G08j0tsI1TkqM2f2c/9EEsVLwU
 wTTw01MGX+J3HbtilUC3zTSpuolAYq7HM0bQ2pTBPnFlPU9IhaB5U9YM1uvFSJJIzzid
 raemrcy6zeEesGxIe2g6HWEwPVsNB9S2pf3FJcfQqq+PxF5zy6ns1xalXrLZbFTZnYRJ
 UA67SQPIf82l9hWo/UtgCSXpxHXQKRNYR9EMUE2i4BQCgYh5TcduHZpEmk3XmmHmNAKl
 0GVcRMp+cYMvfzNk4I9DEAxSEtA7s3NxH8urp6ubQDuJXPEdQc3dp2IJ+n6bY7QJf5BT
 Jw0Q==
X-Gm-Message-State: AOJu0Yx7PFd4KbKq+EGiZ0ErGS8dg4bFa2Qxs3pBjI6JDOr0VM3CdIFP
 QxNNWEJ++jkt8M7isuCq8ohSJA==
X-Google-Smtp-Source: AGHT+IE27vGs/uaz34ojq8+Ua2kGxMGmW1BLKwB00ljr5B+4yLh4dyEjB9Qga47N3yLXlwPZmv4ysw==
X-Received: by 2002:a17:902:e750:b0:1c1:fbec:bc3f with SMTP id
 p16-20020a170902e75000b001c1fbecbc3fmr11508200plf.5.1694425700587; 
 Mon, 11 Sep 2023 02:48:20 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 az7-20020a170902a58700b001bdc2fdcf7esm5988188plb.129.2023.09.11.02.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 02:48:20 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v6 21/45] drm/msm: dynamically allocate the drm-msm_gem
 shrinker
Date: Mon, 11 Sep 2023 17:44:20 +0800
Message-Id: <20230911094444.68966-22-zhengqi.arch@bytedance.com>
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
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-mm@kvack.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the drm-msm_gem shrinker, so that it can be freed
asynchronously via RCU. Then it doesn't need to wait for RCU read-side
critical section when releasing the struct msm_drm_private.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Rob Clark <robdclark@gmail.com>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Sean Paul <sean@poorly.run>
CC: Marijn Suijten <marijn.suijten@somainline.org>
CC: David Airlie <airlied@gmail.com>
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_drv.c          |  4 +++-
 drivers/gpu/drm/msm/msm_drv.h          |  4 ++--
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 33 ++++++++++++++++----------
 3 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4bd028fa7500..7f20249d6071 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -462,7 +462,9 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
-	msm_gem_shrinker_init(ddev);
+	ret = msm_gem_shrinker_init(ddev);
+	if (ret)
+		goto err_msm_uninit;
 
 	if (priv->kms_init) {
 		ret = priv->kms_init(ddev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 02fd6c7d0bb7..e2fc56f161b5 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -221,7 +221,7 @@ struct msm_drm_private {
 	} vram;
 
 	struct notifier_block vmap_notifier;
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 	struct drm_atomic_state *pm_state;
 
@@ -283,7 +283,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan);
 #endif
 
-void msm_gem_shrinker_init(struct drm_device *dev);
+int msm_gem_shrinker_init(struct drm_device *dev);
 void msm_gem_shrinker_cleanup(struct drm_device *dev);
 
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index f38296ad8743..5a7d48c02c4b 100644
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
@@ -148,10 +146,11 @@ msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
 	struct shrink_control sc = {
 		.nr_to_scan = nr_to_scan,
 	};
-	int ret;
+	unsigned long ret = SHRINK_STOP;
 
 	fs_reclaim_acquire(GFP_KERNEL);
-	ret = msm_gem_shrinker_scan(&priv->shrinker, &sc);
+	if (priv->shrinker)
+		ret = msm_gem_shrinker_scan(priv->shrinker, &sc);
 	fs_reclaim_release(GFP_KERNEL);
 
 	return ret;
@@ -210,16 +209,24 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
  *
  * This function registers and sets up the msm shrinker.
  */
-void msm_gem_shrinker_init(struct drm_device *dev)
+int msm_gem_shrinker_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	priv->shrinker.count_objects = msm_gem_shrinker_count;
-	priv->shrinker.scan_objects = msm_gem_shrinker_scan;
-	priv->shrinker.seeks = DEFAULT_SEEKS;
-	WARN_ON(register_shrinker(&priv->shrinker, "drm-msm_gem"));
+
+	priv->shrinker = shrinker_alloc(0, "drm-msm_gem");
+	if (!priv->shrinker)
+		return -ENOMEM;
+
+	priv->shrinker->count_objects = msm_gem_shrinker_count;
+	priv->shrinker->scan_objects = msm_gem_shrinker_scan;
+	priv->shrinker->private_data = priv;
+
+	shrinker_register(priv->shrinker);
 
 	priv->vmap_notifier.notifier_call = msm_gem_shrinker_vmap;
 	WARN_ON(register_vmap_purge_notifier(&priv->vmap_notifier));
+
+	return 0;
 }
 
 /**
@@ -232,8 +239,8 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 
-	if (priv->shrinker.nr_deferred) {
+	if (priv->shrinker) {
 		WARN_ON(unregister_vmap_purge_notifier(&priv->vmap_notifier));
-		unregister_shrinker(&priv->shrinker);
+		shrinker_free(priv->shrinker);
 	}
 }
-- 
2.30.2

