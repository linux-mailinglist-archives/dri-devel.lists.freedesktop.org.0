Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C008F461491
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DF76FA65;
	Mon, 29 Nov 2021 12:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91686FA5F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q3so13408420wru.5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6AcIBFyYiDz9TRlGiyxrwcI9ljYqwbYG6/Pwbh2ETwE=;
 b=TdRsP8iCJo2IHFSFvo7K9yfGR4NULK1xGumbieOyuHPWp69FprJgXUjY8wec3jLrFH
 eJuLHGvb5pF1u7S4EXZAdgT8c1lsKTzc80OaZV3yNsUHg/PeGYHb5Uv23E4epMNxX0bC
 bXWR/iWOLWMg/SpnmOmk+kmu1E+VddY7tVjHk4jrUDwy2Xd9fm1zYyMLjspXti4Y32fj
 8drNBqdR16igm/emGDwMEaZS6YRmc/tKT7qwBUeQmGSkRekpTkGVZI0KunhydOjZzw4M
 tTqSaeir+pIOQfdbDQFNJhpanZQuH84ZECu/HUI0UCtjE/1vrLC3xS704krJYD9ar2TD
 kBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6AcIBFyYiDz9TRlGiyxrwcI9ljYqwbYG6/Pwbh2ETwE=;
 b=SF1DWZFkuZruhH8r6/G58LnocrNKZ4ENhRqcDeBflrQBHhdMUK4Jj5CxY72MuhI0Ms
 LLjOPVkVH9cDKAPOXuHxARii+/EzH9va7hwDQLGpwaFdLulqf/1ytP/kpuGBbDyr7oHa
 3o0WYRqTxWC0yLgjA9FAR+04lWNjfnW+VAjT7IamSLErVfJH+cMLxVeBgA+8EA82rQNk
 aRAR286ci1bXLYaE2/k+lZ2rW7IBXH1H8ZSrDAqG/wt3Ts4OIAb7yEO7W10MIkcodTZV
 6iDiaPxQcVl6ixAIur77qb9T8IAG5GxfdjLB2HrnqIjspP0OL8UWHoSMsZcMgoOSXSvP
 VUOQ==
X-Gm-Message-State: AOAM531VblazTHud0Eyr0lPdNPCI3T/dtIVSW1n0kN+hFKuqcCbkLhTJ
 gWD5ak3Ly68drWOIkQU6tXw=
X-Google-Smtp-Source: ABdhPJybnk67gP2iTmueOltDIky3wv5MJpDuaPFOAyThlF5UK7AISycgT9cnZepuObF2CKwjX2vHKg==
X-Received: by 2002:a5d:4ed1:: with SMTP id s17mr34901850wrv.310.1638187630147; 
 Mon, 29 Nov 2021 04:07:10 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:09 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 08/28] dma-buf: add dma_resv_get_singleton v2
Date: Mon, 29 Nov 2021 13:06:39 +0100
Message-Id: <20211129120659.1815-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a function to simplify getting a single fence for all the fences in
the dma_resv object.

v2: fix ref leak in error handling

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 52 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   |  2 ++
 2 files changed, 54 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 480c305554a1..694716a3d66d 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -34,6 +34,7 @@
  */
 
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-array.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
@@ -657,6 +658,57 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences);
 
+/**
+ * dma_resv_get_singleton - Get a single fence for all the fences
+ * @obj: the reservation object
+ * @write: true if we should return all fences
+ * @fence: the resulting fence
+ *
+ * Get a single fence representing all the fences inside the resv object.
+ * Returns either 0 for success or -ENOMEM.
+ *
+ * Warning: This can't be used like this when adding the fence back to the resv
+ * object since that can lead to stack corruption when finalizing the
+ * dma_fence_array.
+ */
+int dma_resv_get_singleton(struct dma_resv *obj, bool write,
+			   struct dma_fence **fence)
+{
+	struct dma_fence_array *array;
+	struct dma_fence **fences;
+	unsigned count;
+	int r;
+
+	r = dma_resv_get_fences(obj, write, &count, &fences);
+        if (r)
+		return r;
+
+	if (count == 0) {
+		*fence = NULL;
+		return 0;
+	}
+
+	if (count == 1) {
+		*fence = fences[0];
+		kfree(fences);
+		return 0;
+	}
+
+	array = dma_fence_array_create(count, fences,
+				       dma_fence_context_alloc(1),
+				       1, false);
+	if (!array) {
+		while (count--)
+			dma_fence_put(fences[count]);
+		kfree(fences);
+		return -ENOMEM;
+	}
+
+	*fence = &array->base;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
+
 /**
  * dma_resv_wait_timeout - Wait on reservation's objects
  * shared and/or exclusive fences.
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index fa2002939b19..cdfbbda6f600 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -438,6 +438,8 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 int dma_resv_get_fences(struct dma_resv *obj, bool write,
 			unsigned int *num_fences, struct dma_fence ***fences);
+int dma_resv_get_singleton(struct dma_resv *obj, bool write,
+			   struct dma_fence **fence);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
-- 
2.25.1

