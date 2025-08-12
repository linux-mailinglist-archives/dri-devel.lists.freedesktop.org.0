Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC04B22A9E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 16:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AB810E12C;
	Tue, 12 Aug 2025 14:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WpPY147c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF34E10E12C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 14:34:05 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3b790dbb112so3423623f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755009244; x=1755614044; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=d0Fxdv3cPozgk8mT38gBZEwehheZnULsN2Yve87rnLU=;
 b=WpPY147cJ3ceiotvAXHElcqgOaJcxKl3gSvJsfE2DVH7UdxM7dQmKbjJrohf/g3LdU
 8nQqaw599g+LZFKueI35C1VqZ4M5UpSle86i+mqsEXJmVlNlJh3oysSIFiDCULJkWxZT
 IzprgHcAFoSGGxebcDMORuBQIASmjWNu0vwI7DgA1CxByPSLMrBzOWaRxreV4kqRwSlS
 wtjOcDJuPrN++G5EaKqn6c4RKyOz6vGKPlaXlBlHUG3fp9RQ0oxTVzU/qNgCXNe/CEQ8
 fuTXVRhsmfPYY2xVhYPEW2QPyzALYC3louaGYlxDArvCsviuA9sfDcYjX9QpRbBTIPhc
 kARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755009244; x=1755614044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d0Fxdv3cPozgk8mT38gBZEwehheZnULsN2Yve87rnLU=;
 b=aHU55FUMmt+DsPVRjK5+7drCbFhd5aEmDryfl05Twx7cdyH4Rfb83SuBjxVrsM5Wus
 qRKI0umiQFBhgPgiGRyQgsr/XigzDiiVvr/JaAN3hbdU55hhDMSmnAtJzN6Djh/BS51t
 1cjbBhAMX3oPkb8q1Yw6NsdQhYn/r9JpY/0D2IO7z4+7b0erhkj5kOxazdycWRT7Z6bA
 3eReCqXm0WL3dnt8zAnkuK4safLw8711a0/kgUiKvWwmxlISMgLHS9WnO5Nd6HizhmwP
 rSZ3ctg35a8YRokwQV2rF+YNupxZuRwZ0jRJzoceGmEsKgbOr6jkIYWEuArFU0Dzdeux
 0BdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGZBKnnudn0ZB6Z57XkWN8RKYrjEFQrhrd7r85KZf0GUMsX2gVFbgyLmF9VNbSdFSQWpWCnhBwaTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCQaF6sY3elJQulWUQ7Y0fIsdRmsmVB8eQGcr+z5JvgiHhw7om
 ZE6BP+79X3pVTvNYWPni7YayBJrpiTkaRA0p7nDvplcnQ7dkUseG3Mfe
X-Gm-Gg: ASbGncsg/Kcv5fa4C1PrzcYnnnu371GYIJCKggKLKKa+4bTqLtjwYBV8RsQaxHGMIat
 afQ1y1f8Ue5UrECwmthLFzyl/ZikHPuo4VhBvTRUB4pMfFeFcOgvftWnBQuAKb2oHUMKi5uI6do
 Z0JnimGofcLd0yCUeBmxsK1TQ5okkz5LM6Jf/a+2ocJovJ+mfea7zm6nRgw5O80UW8GL02iZxs9
 fBcy/eEmqXcDzYqj7A1EE+Re/29OrW0p+Fkh5m8bSb3bLTXlcRdiBRgn4hMuhkw0vsGlYgvW1wj
 03Klfm+C5PISJbmszzjxI8a3m3ZQ4+Z+oeI8hS74kgxo/Jk8gQOeiiZAkN7ws5rD2dgsdON/T6q
 mt+vu0Mm00Hn8nP2EdqmS6EMZ1RudIQENwtRmVbVVmaVN
X-Google-Smtp-Source: AGHT+IEN9W8QIdjCjiyzj5kO8EChyogAi2IS3EBC+8vieKm0sHbNVlz5nlzonsC8fWTgKgppdzS8kg==
X-Received: by 2002:a05:6000:178d:b0:3b7:8d2a:b33c with SMTP id
 ffacd0b85a97d-3b910fdb1a8mr2720033f8f.18.1755009243725; 
 Tue, 12 Aug 2025 07:34:03 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15a5:9b00:5e00:c21:21a:c15b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8f5d7deaasm23714363f8f.65.2025.08.12.07.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 07:34:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: simona.vetter@ffwll.ch, tvrtko.ursulin@igalia.com, phasta@mailbox.org,
 airlied@gmail.com, dakr@kernel.org, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: [PATCH 1/2] dma-buf/sw_sync: put fence signaling into work item
Date: Tue, 12 Aug 2025 16:34:01 +0200
Message-ID: <20250812143402.8619-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
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

From: Christian König <ckoenig@able.fritz.box>

Offload signaling fence in the sw_sync component into a work item to
improve testing the real world signaling conditions.

Needs more testing before pushing it upstream!

Signed-off-by: Christian König <ckoenig@able.fritz.box>
---
 drivers/dma-buf/sw_sync.c    | 25 ++++++++++++++-----------
 drivers/dma-buf/sync_debug.h |  2 ++
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 3c20f1d31cf5..43b8ac32482d 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -80,6 +80,7 @@ struct sw_sync_get_deadline {
 
 #define SW_SYNC_HAS_DEADLINE_BIT	DMA_FENCE_FLAG_USER_BITS
 
+static void sync_timeline_signal(struct work_struct *work);
 static const struct dma_fence_ops timeline_fence_ops;
 
 static inline struct sync_pt *dma_fence_to_sync_pt(struct dma_fence *fence)
@@ -110,6 +111,7 @@ static struct sync_timeline *sync_timeline_create(const char *name)
 
 	obj->pt_tree = RB_ROOT;
 	INIT_LIST_HEAD(&obj->pt_list);
+	INIT_WORK(&obj->signal_work, sync_timeline_signal);
 	spin_lock_init(&obj->lock);
 
 	sync_timeline_debug_add(obj);
@@ -123,6 +125,7 @@ static void sync_timeline_free(struct kref *kref)
 		container_of(kref, struct sync_timeline, kref);
 
 	sync_timeline_debug_remove(obj);
+	flush_work(&obj->signal_work);
 
 	kfree(obj);
 }
@@ -199,23 +202,20 @@ static const struct dma_fence_ops timeline_fence_ops = {
 
 /**
  * sync_timeline_signal() - signal a status change on a sync_timeline
- * @obj:	sync_timeline to signal
- * @inc:	num to increment on timeline->value
+ * @work: the work item
  *
- * A sync implementation should call this any time one of it's fences
- * has signaled or has an error condition.
+ * Signal all fences where the sequence number indicate to do so.
  */
-static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
+static void sync_timeline_signal(struct work_struct *work)
 {
+	struct sync_timeline *obj = container_of(work, typeof(*obj),
+						 signal_work);
 	LIST_HEAD(signalled);
 	struct sync_pt *pt, *next;
 
 	trace_sync_timeline(obj);
 
 	spin_lock_irq(&obj->lock);
-
-	obj->value += inc;
-
 	list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
 		if (!timeline_fence_signaled(&pt->base))
 			break;
@@ -227,7 +227,6 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 
 		dma_fence_signal_locked(&pt->base);
 	}
-
 	spin_unlock_irq(&obj->lock);
 
 	list_for_each_entry_safe(pt, next, &signalled, link) {
@@ -394,11 +393,15 @@ static long sw_sync_ioctl_inc(struct sync_timeline *obj, unsigned long arg)
 		return -EFAULT;
 
 	while (value > INT_MAX)  {
-		sync_timeline_signal(obj, INT_MAX);
+		obj->value += INT_MAX;
+
+		schedule_work(&obj->signal_work);
+		flush_work(&obj->signal_work);
 		value -= INT_MAX;
 	}
 
-	sync_timeline_signal(obj, value);
+	obj->value += value;
+	schedule_work(&obj->signal_work);
 
 	return 0;
 }
diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
index 02af347293d0..a1b03c48d82a 100644
--- a/drivers/dma-buf/sync_debug.h
+++ b/drivers/dma-buf/sync_debug.h
@@ -17,6 +17,7 @@
 #include <linux/rbtree.h>
 #include <linux/spinlock.h>
 #include <linux/dma-fence.h>
+#include <linux/workqueue.h>
 
 #include <linux/sync_file.h>
 #include <uapi/linux/sync_file.h>
@@ -40,6 +41,7 @@ struct sync_timeline {
 
 	struct rb_root		pt_tree;
 	struct list_head	pt_list;
+	struct work_struct	signal_work;
 	spinlock_t		lock;
 
 	struct list_head	sync_timeline_list;
-- 
2.43.0

