Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0269BC37
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 22:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFA010E2AD;
	Sat, 18 Feb 2023 21:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1B110E0B1;
 Sat, 18 Feb 2023 21:15:54 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id e6so1636592plt.4;
 Sat, 18 Feb 2023 13:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=792an2SD05nhQRGBlD0Pg2RQ7VfR74mQEP4A4mqZ6Pk=;
 b=HM20qQN2yIU6PxWiMZEoSu3nueB6cRdZunRf/0WsasLxrWwG6jTJzi54FYZ5B5NZGd
 oiDKEt41GpKHkAkJ5gTVtA1j+PltUu0tI95VttL8G5W+qQnSbySKu7+cSjvKNge6QQ5J
 Pj2F3mRJmuteKR/t3CJoExZNh0GN57mlIvR6bySQe8r5eZLlOCXNqZxX5bjf/dupH9z3
 IXqeOipa7lBiO9XbbbNImG/WCaemmgM46GgIE8Xh55pnP/LLLgxjXjr+DHt1NcdxFObQ
 14PQ97rq81/QGaBdPs+HGfOyKwPzT8UnCAi8zNIuZLDmVStTVtSKfIFcJehu18xb5BVp
 cE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=792an2SD05nhQRGBlD0Pg2RQ7VfR74mQEP4A4mqZ6Pk=;
 b=vXBfxvLRtICYkfvG2MSsUABQQ4b1R1yiq/B7Yo3fLhmTOzA0htBrr5+igN2Y/uQGss
 09heXYMLAXHMugfVcpKN41TPLKuNx0oYQlIHJpgFrPi5r5RqRGMcdyMh4GiNuLSt+csF
 4i4eOum+Onk0/bvpm15PEC4DVIR9A/9jWcshtBRNheUbA8ZSQ5ocWlFmfi+31bJjKCNn
 L/JBchlP4bSA4VaFpBQtDMMomlItbjP5k+OfpbxosoMKtRKS4pKbd7RIoefVw64iiGng
 fpMNeaW2RVq6GmJpe/Dz96PH9X+Bw2ldoZpPG26+1JaVDui+8TQNOYcR7i06ZDh7EYio
 gFjA==
X-Gm-Message-State: AO0yUKV8QHdB90yUmyfVmgmNJnAgXiOKil0HP9HG4diAAPcvZMMHJafp
 CBvugnFsCi2s0KMTLqlVTVQJaC+E7qM=
X-Google-Smtp-Source: AK7set/QRHtfFq0gaLBBtupUc42V0jJFczyxE24VpZirzrpITI3ga4mB8wxlcDavsOCQ4hY8/UcUUA==
X-Received: by 2002:a17:90a:357:b0:233:f990:d646 with SMTP id
 23-20020a17090a035700b00233f990d646mr1577488pjf.35.1676754953521; 
 Sat, 18 Feb 2023 13:15:53 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 bv21-20020a17090af19500b00231261061a5sm1254130pjb.5.2023.02.18.13.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 13:15:53 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/14] dma-buf/dma-resv: Add a way to set fence deadline
Date: Sat, 18 Feb 2023 13:15:47 -0800
Message-Id: <20230218211608.1630586-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230218211608.1630586-1-robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a way to set a deadline on remaining resv fences according to the
requested usage.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/dma-resv.c | 19 +++++++++++++++++++
 include/linux/dma-resv.h   |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 1c76aed8e262..0c86f6d577ab 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -684,6 +684,25 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
 }
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
+/**
+ * dma_resv_set_deadline - Set a deadline on reservation's objects fences
+ * @obj: the reservation object
+ * @usage: controls which fences to include, see enum dma_resv_usage.
+ * @deadline: the requested deadline (MONOTONIC)
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

