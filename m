Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA3645A55A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F686E808;
	Tue, 23 Nov 2021 14:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1B96E59F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:30 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so2734838wmd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6H/ngFKC9poxGUW/buF3Z6IUXcBgboVM+XR0Uqd9ot8=;
 b=M4/xhPjOBKzleBS57cpHfNRoq3nzkZDtU3rcnNA5M7yoqTW/GkLN3Go0GFKYwFwe8V
 pWfW1D9Qq2Uiy8eVugNtps+xEdeYlycLSKNtEPPtjWNxEUIIYLuQZW0+4YAYfONPLeZE
 UrTkTO9uGFHcyNU3a56i6EETimPyNUoHvmNKAy3dg9gWr6keZw/8gCTNo7QSwB9ddfZJ
 qQnEgmFZxZxOtin+uZxgd1Y8WIWINAxRobeiiFVibIpNN1WoZPPxp3rqS9WEzzveNPae
 ITBBAf+RRaR2xVVkR7S4jbF0fE8VnRJYaOLUnVGrXFjjSIbZNHg/HAXDxZte9CzyNG6r
 H/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6H/ngFKC9poxGUW/buF3Z6IUXcBgboVM+XR0Uqd9ot8=;
 b=kHKvY7G2wENWe/TPdssVslyGqJraY+JcSb/ZhTsw7yjP0CM+Ooe7XVMPeCnc5B+sg6
 ePSOQwZ6SR2Sd7Om4Cd/4opHQI+WujKQTBRKQQzTUoaPnZocHp+9O2UmztfTVaHyYZTk
 qANwFRnKDCyc4XjdDzTsa+wvSLVsrJwaU/wpGjxoUP5IrW0T1zEdkDmQH+3kzKwBuCds
 b3LGqGcJDtwQKlMBs0P4lEkgNBnrcXQuQf7A0934uM7OKeT4xgFGnpRPRpnlOmVXTTj/
 oMcORKF91kKv2fxIiPLWl9how6ceUjOjafiqPoMr0eM0j1AE7C4upztV3aLdfMhZG4hI
 SOKw==
X-Gm-Message-State: AOAM530dJpDmjfM4xrRXzblj0t7BJjuppzIEEa/6aCsVrjlFG4I/OyX+
 uT2KPKSM7v/Aj1US3pz378Q=
X-Google-Smtp-Source: ABdhPJxXb7SYBCRj2Ub2g+4sXnWVWktbYjdK81QMPFY4KhRBrf8naWsp1xWADtOextjGaVzR61Wo8A==
X-Received: by 2002:a1c:2685:: with SMTP id m127mr3661518wmm.42.1637677289034; 
 Tue, 23 Nov 2021 06:21:29 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:28 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 08/26] dma-buf: add dma_resv_get_singleton
Date: Tue, 23 Nov 2021 15:20:53 +0100
Message-Id: <20211123142111.3885-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 50 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 0a69f4b7e6b5..f91ca023b550 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -34,6 +34,7 @@
  */
 
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-array.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
@@ -721,6 +722,55 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
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
index 09b676b87c35..082f77b7bc63 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -440,6 +440,8 @@ void dma_resv_prune(struct dma_resv *obj);
 void dma_resv_prune_unlocked(struct dma_resv *obj);
 int dma_resv_get_fences(struct dma_resv *obj, bool write,
 			unsigned int *num_fences, struct dma_fence ***fences);
+int dma_resv_get_singleton(struct dma_resv *obj, bool write,
+			   struct dma_fence **fence);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
-- 
2.25.1

