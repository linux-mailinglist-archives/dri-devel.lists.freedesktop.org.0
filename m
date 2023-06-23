Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677A773B343
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 11:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4756410E0F0;
	Fri, 23 Jun 2023 09:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACC110E0F0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 09:09:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f9ede60140so4786945e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 02:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687511338; x=1690103338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=eAbdu1nB467ZQj6e5NDmoch5e1Im+ALrCoyg+ebvYvw=;
 b=WJscmMxt+uRRKarevsXNHMpAKaUN8iPheOtvLvUFuc+f7FrjMesGyyJZ1h09gkvC3i
 OkHmg69GTP5KYpyn/6OlyeWCD9Xt/EeJ7lW3Nt7D4xk96yKE9t1yu6KSr4XXxI65BUra
 4/5PcFVWQHqsMIyDXdDqbUPI3lvsn1NJ5tV4hIPoj5Itxzp7HeyMCB5OVR4rJXBhDVHf
 hvtPEBgvlamf1qhT/aHVlSnF64K3OniJMb1D2LzhygwQBookVE4i2uJHqEl2KbCWc8IX
 xCipDUthNILvLsyOe7fnMmOU+d+wshkJlK3I9txhVN44IUFYD0v0VnUGJZ6HEBfwzJvU
 +qlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687511338; x=1690103338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eAbdu1nB467ZQj6e5NDmoch5e1Im+ALrCoyg+ebvYvw=;
 b=HH3vuC11yuaPk3ucZNYXUiO/IU385cZ0WkJSb6+VO2ySkYLDzQKnh1uLa/F0YhSjP3
 wQOzwhXmjKE1QlXL8qaCwbKXVS6nlOYg6FIwRgEo14Xtw/RCo0OGG4Z4hHm4VpjIjHHd
 XmxoguBYG0Pd+2AiHYrXajaDva3+jbwc5eGfs+RcKzKNc1po+m13iI1Bgn3IZL0bkgQ3
 mq+0xQvfRYuACJAIWlvtR8z0M+aFoPMtiWgdl3Y3hzOJT8UBWc8rAkUFWY0jPhjRTTAC
 HWIaPMCJzHlSMMWsVc+iasQ4CjKlD1huYbBR6oW4cVI/ZRjjyy9fq5INbfnkJgmcw8AT
 acrw==
X-Gm-Message-State: AC+VfDyaGpKOAXhIlwirbz0Ap+laVH+vBQPPVeWY9nusiL0bx3/hknfD
 m86tMr1LkThD8k+mEA+fDxg=
X-Google-Smtp-Source: ACHHUZ58iTXNTSdj8rxHnRR+9vaPmFSSyRKu1rgNk97YO5DwT6praBRT9g3Itr6vaZcIZWIJjlt8uw==
X-Received: by 2002:a7b:ce98:0:b0:3fa:7478:64ac with SMTP id
 q24-20020a7bce98000000b003fa747864acmr2816037wmj.25.1687511337554; 
 Fri, 23 Jun 2023 02:08:57 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:156c:b700:4c02:e918:9d6c:809d])
 by smtp.gmail.com with ESMTPSA id
 9-20020a05600c228900b003f9b3588192sm1793084wmf.8.2023.06.23.02.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 02:08:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: juan.hao@nxp.com,
	dri-devel@lists.freedesktop.org,
	Luben.Tuikov@amd.com
Subject: [PATCH] dma-buf: keep the signaling time of merged fences v2
Date: Fri, 23 Jun 2023 11:08:56 +0200
Message-Id: <20230623090856.110456-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Android CTS is testing for that.

v2: use the current time if the fence is still in the signaling path and
the timestamp not yet available.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-unwrap.c | 20 +++++++++++++++++---
 drivers/dma-buf/dma-fence.c        |  5 +++--
 drivers/gpu/drm/drm_syncobj.c      |  2 +-
 include/linux/dma-fence.h          |  2 +-
 4 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 7002bca792ff..46c2d3a474cd 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -66,18 +66,32 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 {
 	struct dma_fence_array *result;
 	struct dma_fence *tmp, **array;
+	ktime_t timestamp;
 	unsigned int i;
 	size_t count;
 
 	count = 0;
+	timestamp = ns_to_ktime(0);
 	for (i = 0; i < num_fences; ++i) {
-		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
-			if (!dma_fence_is_signaled(tmp))
+		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
+			if (!dma_fence_is_signaled(tmp)) {
 				++count;
+			} else if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
+					    &tmp->flags)) {
+				if (ktime_after(tmp->timestamp, timestamp))
+					timestamp = tmp->timestamp;
+			} else {
+				/*
+				 * Use the current time if the fence is
+				 * currently signaling.
+				 */
+				timestamp = ktime_get();
+			}
+		}
 	}
 
 	if (count == 0)
-		return dma_fence_get_stub();
+		return dma_fence_allocate_private_stub(timestamp);
 
 	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
 	if (!array)
diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f177c56269bb..ad076f208760 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -150,10 +150,11 @@ EXPORT_SYMBOL(dma_fence_get_stub);
 
 /**
  * dma_fence_allocate_private_stub - return a private, signaled fence
+ * @timestamp: timestamp when the fence was signaled
  *
  * Return a newly allocated and signaled stub fence.
  */
-struct dma_fence *dma_fence_allocate_private_stub(void)
+struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
 {
 	struct dma_fence *fence;
 
@@ -169,7 +170,7 @@ struct dma_fence *dma_fence_allocate_private_stub(void)
 	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 		&fence->flags);
 
-	dma_fence_signal(fence);
+	dma_fence_signal_timestamp(fence, timestamp);
 
 	return fence;
 }
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 0c2be8360525..04589a35eb09 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -353,7 +353,7 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
  */
 static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
 {
-	struct dma_fence *fence = dma_fence_allocate_private_stub();
+	struct dma_fence *fence = dma_fence_allocate_private_stub(ktime_get());
 
 	if (IS_ERR(fence))
 		return PTR_ERR(fence);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index d54b595a0fe0..0d678e9a7b24 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -606,7 +606,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
 void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
 
 struct dma_fence *dma_fence_get_stub(void);
-struct dma_fence *dma_fence_allocate_private_stub(void);
+struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp);
 u64 dma_fence_context_alloc(unsigned num);
 
 extern const struct dma_fence_ops dma_fence_array_ops;
-- 
2.34.1

