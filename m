Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564656A8D7A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 00:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B7910E5A9;
	Thu,  2 Mar 2023 23:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2113D10E5A9;
 Thu,  2 Mar 2023 23:54:09 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id p20so942782plw.13;
 Thu, 02 Mar 2023 15:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677801248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MUhwCn+Xf/Lh0tYXdZ7kyW7NLgJoG2FRHZEn6JIAUnU=;
 b=n4k1ckMh3giJvFe1dSs5mXbnyBq7dAtRHbbnbnKXFhK8PYZk8pogyMlFcsBynV1L1H
 l4mvD5qCNioTI2SDCz7INN0q4TWt30+OYzpKAn1SmwUEi6BdXLTh3tqON+zQ34mXNGfC
 lHMc4nJKUOoLL3ZaL9xzGryyZ7zjmnJnIltjSZgzIQH1mC/ZJ4dM0gU/sh0kP7XOZWxq
 BMKsYDWtGLQrZJZZfFXpiM++ER1vgYTvKaPvg39gORhAW1Oqwg/CazEiPjm7a46m1HX/
 N64iIVGysWdZDNdXUCupajwqTLy/tPShN2EL+skRmxJ9mVH5aC8tWqdNyxpSBrZj76av
 +kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677801248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MUhwCn+Xf/Lh0tYXdZ7kyW7NLgJoG2FRHZEn6JIAUnU=;
 b=Yfx5saIH9Fe0CMTai9mETRVvHzAnJOFnwq1SWMXWBRmXfvHDUJ1Mp+FC4aE7HJNQOX
 2pEj/pV0rG51B5GmbxYc5A4NXHYmvia+8zkql/3lJgqL4Opqtt0TepVDke33oa7sqPI1
 KAPTgGVkK/3bdaB+bLgIdTWkwTHG2VFPKnfiAD3ZaLZN/nKJ9qPI9rv7BzcqT9UbGZlv
 Z5Pb3ck4a7EWiNMSObccB4yr4uUiAg0zXnrqGK2xkAligVC7MglMimNOokhTP1M0Ib1y
 xuzhtEyOCIiZIIo7e6p3gdEc2RHOV/QccPuol+AMFdX5NNXFfclrRMzwjzV7/qsJz1iC
 RcoQ==
X-Gm-Message-State: AO0yUKXEHQtnt5IWQypO3/lK2Y16ljYI0AP8nz4BSnYpTI0JFohV00ts
 yc5nDRtpiesUgVpJ6Ex5MN6thSlylmg=
X-Google-Smtp-Source: AK7set921xfMXVsnYw9T4RPmUpLjAtAtAEqhwoqAHYp2Un6T9E9TKJIZ0DgU5t2RL257s06BxTvP2Q==
X-Received: by 2002:a17:902:7594:b0:19e:6659:90db with SMTP id
 j20-20020a170902759400b0019e665990dbmr26033pll.45.1677801248258; 
 Thu, 02 Mar 2023 15:54:08 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 kj15-20020a17090306cf00b0019aa8149cb9sm226754plb.79.2023.03.02.15.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 15:54:07 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 04/15] dma-buf/dma-resv: Add a way to set fence deadline
Date: Thu,  2 Mar 2023 15:53:26 -0800
Message-Id: <20230302235356.3148279-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302235356.3148279-1-robdclark@gmail.com>
References: <20230302235356.3148279-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a way to set a deadline on remaining resv fences according to the
requested usage.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 22 ++++++++++++++++++++++
 include/linux/dma-resv.h   |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 1c76aed8e262..2a594b754af1 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -684,6 +684,28 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
 }
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
+/**
+ * dma_resv_set_deadline - Set a deadline on reservation's objects fences
+ * @obj: the reservation object
+ * @usage: controls which fences to include, see enum dma_resv_usage.
+ * @deadline: the requested deadline (MONOTONIC)
+ *
+ * May be called without holding the dma_resv lock.  Sets @deadline on
+ * all fences filtered by @usage.
+ */
+void dma_resv_set_deadline(struct dma_resv *obj, enum dma_resv_usage usage,
+			   ktime_t deadline)
+{
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+
+	dma_resv_iter_begin(&cursor, obj, usage);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		dma_fence_set_deadline(fence, deadline);
+	}
+	dma_resv_iter_end(&cursor);
+}
+EXPORT_SYMBOL_GPL(dma_resv_set_deadline);
 
 /**
  * dma_resv_test_signaled - Test if a reservation object's fences have been
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 0637659a702c..8d0e34dad446 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -479,6 +479,8 @@ int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
 			   bool intr, unsigned long timeout);
+void dma_resv_set_deadline(struct dma_resv *obj, enum dma_resv_usage usage,
+			   ktime_t deadline);
 bool dma_resv_test_signaled(struct dma_resv *obj, enum dma_resv_usage usage);
 void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
 
-- 
2.39.1

