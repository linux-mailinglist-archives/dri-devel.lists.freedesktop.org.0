Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFB873B156
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E7610E5F3;
	Fri, 23 Jun 2023 07:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D25010E501
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:54:27 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b5466bc5f8so9652385ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687424067; x=1690016067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIt8zXdDCaGLXCE6rKF2JMKvp8G2AK8nuTQphjV73ms=;
 b=cC13yiK2b2HqEC2WYanx92tTHG9ibgrmYLbrgzYcUarLdydxeypI53cwuyYhjaQzJp
 onJq4vBBmMajr1poWh86FQTLq2y1xSvoknQDzCFUhqc78tS5eFxPwQt8ueUiPUlQcGJ1
 NoUMAyqrL7rvWv1XaJ4CPnN6K7xK1sRx+XiYPW8paVbE3vb5Wkc4IFamUXhI7GXmfwho
 QPeLUm4YlUE0P3+vsMp1UZZv6g44Pla+Jp2DOFJOg6O2qS7xw748UZa1YIoXHuTtcdry
 A4esVq8CH+pV+6r7bJr/mBJgAfFPjM5J1TM9ToGnDJSCePlm9yunBGrnuwbojkh7OG6q
 rFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687424067; x=1690016067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qIt8zXdDCaGLXCE6rKF2JMKvp8G2AK8nuTQphjV73ms=;
 b=cYAhihpoFiSRFEhHZ5lEEVMPhBmPqYFOU8oor6KnVfIYotcvZU9AEaqDe3SqreOAnw
 oBnRwCyysJm8Ep6sI8/f5B0VzwkI3d1fVOV3DIyoN5VLB2bIMPv+f6ukEuWoj2QulqSG
 qTyEGzx5VxkDfqZmotft2v39YK+6gSlYefb5r3swyn/ufq0UFx+qGfV++/qH/1gKWwMv
 fDD0E5QM8WGNYAtlmbs/RbB7NUx/1Kq/0z03RNzPGjakb6cxoX5QJPCblvSChP7ULrld
 elMzU3qJ8aBJd7dWkZPTA6Dcs4f5WHK1ZfadOyLy6KsuMthzhvm/qpys/o5y2eh42MwM
 0OZA==
X-Gm-Message-State: AC+VfDzf+RFHLVEJGh5YYarvyN2EaX3CbbdJR8RgfRyKzbV2UbeO6NjX
 sLR1zTtZ3RXrUbuJBFLMR7OgtQ==
X-Google-Smtp-Source: ACHHUZ68xppE2OzenI0HziNaJw5pBbhsLnOSkDmr33RiuwGHaNU1efiGcJgTbt3uCyHHsLierWgKoQ==
X-Received: by 2002:a17:902:d489:b0:1ae:4567:2737 with SMTP id
 c9-20020a170902d48900b001ae45672737mr21909019plg.2.1687424067136; 
 Thu, 22 Jun 2023 01:54:27 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b001b549fce345sm4806971plw.230.2023.06.22.01.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:54:26 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Subject: [PATCH 03/29] drm/i915: dynamically allocate the i915_gem_mm shrinker
Date: Thu, 22 Jun 2023 16:53:09 +0800
Message-Id: <20230622085335.77010-4-zhengqi.arch@bytedance.com>
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
we need to dynamically allocate the i915_gem_mm shrinker,
so that it can be freed asynchronously by using kfree_rcu().
Then it doesn't need to wait for RCU read-side critical
section when releasing the struct drm_i915_private.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 27 ++++++++++----------
 drivers/gpu/drm/i915/i915_drv.h              |  3 ++-
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 214763942aa2..4dcdace26a08 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -284,8 +284,7 @@ unsigned long i915_gem_shrink_all(struct drm_i915_private *i915)
 static unsigned long
 i915_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct drm_i915_private *i915 =
-		container_of(shrinker, struct drm_i915_private, mm.shrinker);
+	struct drm_i915_private *i915 = shrinker->private_data;
 	unsigned long num_objects;
 	unsigned long count;
 
@@ -302,8 +301,8 @@ i915_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 	if (num_objects) {
 		unsigned long avg = 2 * count / num_objects;
 
-		i915->mm.shrinker.batch =
-			max((i915->mm.shrinker.batch + avg) >> 1,
+		i915->mm.shrinker->batch =
+			max((i915->mm.shrinker->batch + avg) >> 1,
 			    128ul /* default SHRINK_BATCH */);
 	}
 
@@ -313,8 +312,7 @@ i915_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 static unsigned long
 i915_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct drm_i915_private *i915 =
-		container_of(shrinker, struct drm_i915_private, mm.shrinker);
+	struct drm_i915_private *i915 = shrinker->private_data;
 	unsigned long freed;
 
 	sc->nr_scanned = 0;
@@ -422,12 +420,15 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 
 void i915_gem_driver_register__shrinker(struct drm_i915_private *i915)
 {
-	i915->mm.shrinker.scan_objects = i915_gem_shrinker_scan;
-	i915->mm.shrinker.count_objects = i915_gem_shrinker_count;
-	i915->mm.shrinker.seeks = DEFAULT_SEEKS;
-	i915->mm.shrinker.batch = 4096;
-	drm_WARN_ON(&i915->drm, register_shrinker(&i915->mm.shrinker,
-						  "drm-i915_gem"));
+	i915->mm.shrinker = shrinker_alloc_and_init(i915_gem_shrinker_count,
+						    i915_gem_shrinker_scan,
+						    4096, DEFAULT_SEEKS, 0,
+						    i915);
+	if (i915->mm.shrinker &&
+	    register_shrinker(i915->mm.shrinker, "drm-i915_gem")) {
+		shrinker_free(i915->mm.shrinker);
+		drm_WARN_ON(&i915->drm, 1);
+	}
 
 	i915->mm.oom_notifier.notifier_call = i915_gem_shrinker_oom;
 	drm_WARN_ON(&i915->drm, register_oom_notifier(&i915->mm.oom_notifier));
@@ -443,7 +444,7 @@ void i915_gem_driver_unregister__shrinker(struct drm_i915_private *i915)
 		    unregister_vmap_purge_notifier(&i915->mm.vmap_notifier));
 	drm_WARN_ON(&i915->drm,
 		    unregister_oom_notifier(&i915->mm.oom_notifier));
-	unregister_shrinker(&i915->mm.shrinker);
+	unregister_and_free_shrinker(i915->mm.shrinker);
 }
 
 void i915_gem_shrinker_taints_mutex(struct drm_i915_private *i915,
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index b4cf6f0f636d..06b04428596d 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -163,7 +163,8 @@ struct i915_gem_mm {
 
 	struct notifier_block oom_notifier;
 	struct notifier_block vmap_notifier;
-	struct shrinker shrinker;
+
+	struct shrinker *shrinker;
 
 #ifdef CONFIG_MMU_NOTIFIER
 	/**
-- 
2.30.2

