Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058F34B2641
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE41910EBCB;
	Fri, 11 Feb 2022 12:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC7A10EB99
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:11 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id y22so10769698eju.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YfNrY+//r79cs+UAGc7GlGpicg5Di/TUEj40cJQiglM=;
 b=JUMjx0fM7wz+R2e/lMgycaU0CnPVsRTe3kG8+Ir+VE6TBgdUCFrKnC5726C5cOWsLj
 TsoeejHRply89SlMruPGVYT+k86JeeLhlwh5iMBj/edJByT3r+1KkjK9M7Vp0CC6ZoV6
 C46+Rz8wZwHe+B7ESrSoqnkzbSywj8HvFd/OAW9PVory1gWNBcOEvqVTKoK0C2Sa3AS4
 pCgfOyQiqhZD9rPiHw+jovGuEmkeNQXRS9Q92xS/b0fKu6iwHq5a8CRIiUmlnx81Pj73
 MIG+M1Itu/WG2uwRu1IYOxoA+6fmEuq73AXixHNwmrcdSzYnRvzldk7Q1iCYxhbb2Ama
 0zHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YfNrY+//r79cs+UAGc7GlGpicg5Di/TUEj40cJQiglM=;
 b=qIQ9ZplMFenEgFm/lYxxbJyGu+IhnUPiN4MxA4zRVwdj7iKE86QJDqIWz1P1LmvN6p
 PfLsbAUbkjRfXaydR4nKBjqq6h1SA979BxhuF+WYNwekcOsI3ECijwShnhTeKyHqqfyz
 pJPzTOOtT5lEmioCh3f7KRt9ixsj4YRzUwz+X8LN69A6VuhyDxcGl3IXjC1EnrKtXee3
 doNzx4nzOZbjfg3twDXZQxOyS39AdkCYkwPZoT7PvVlflrhTeXdrGF9dcVDGfBrcmuXN
 fKm08FpsGYtVyafmPtNVn8FYH93CaFT8Fnd0PQGbu33fNbjxa487LaoKmAr/7PUyJ/8e
 rhqg==
X-Gm-Message-State: AOAM5322jbnCdjG9sKe7zuJZcFFatcMZQDdWMpXiN5dHJvxQU/aVWLTR
 bEuxmzEA8j0IMxeUnFkfV3XaMHkhWx4=
X-Google-Smtp-Source: ABdhPJxLR0+cXCa2zndDnGDBhO40hP0PrRd+bLr9w4b6YjoEiI7HvBHV9KG7ypp2x1ESHD0V726W3w==
X-Received: by 2002:a17:907:3e08:: with SMTP id
 hp8mr1301429ejc.366.1644583809949; 
 Fri, 11 Feb 2022 04:50:09 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:09 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 03/23] dma-buf: add dma_resv_get_singleton v2
Date: Fri, 11 Feb 2022 13:49:43 +0100
Message-Id: <20220211125003.918447-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
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

Add a function to simplify getting a single fence for all the fences in
the dma_resv object.

v2: fix ref leak in error handling

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 52 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   |  2 ++
 2 files changed, 54 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index bc652ce4e9a9..005fbe61103e 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -34,6 +34,7 @@
  */
 
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-array.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
@@ -648,6 +649,57 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
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
index 202cc65d0621..08512c1e215d 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -449,6 +449,8 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
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

