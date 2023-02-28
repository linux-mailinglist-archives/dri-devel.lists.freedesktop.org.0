Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 554086A6303
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 23:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AB010E12E;
	Tue, 28 Feb 2023 22:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E523F10E103;
 Tue, 28 Feb 2023 22:58:46 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id v11so8577721plz.8;
 Tue, 28 Feb 2023 14:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677625126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MUhwCn+Xf/Lh0tYXdZ7kyW7NLgJoG2FRHZEn6JIAUnU=;
 b=iGeMiebQfqsdLsgfABMInDPpT0eCDWnY0bzKQhv2CEK5EhNIGoZOLHqDdURijdTLsT
 +PiOl3C4N/66W6S4Zn1dpELV3QiV6uZw6GL7FtQmAqYXs/dp7KpDi1rY3SSGsRw2IuKJ
 MYDpJa/CAyYlfptDxaiFX5Sxk0RHd210tlZZzX/ENHFKYfyjSLeN83Jd673nhkqFlhks
 3lS6d83mRgRQLMOGjTQ4NIpV1LbsLGQj3ZY20dWXxMKTJl7wAGjuSYTymviyFVONhDQO
 /h1ixSkuGOQocfvMea8hCQFO6Q9jMGq0BUJ2pGhX06po7S3fI5IzEn/BykmD7GfNwsqN
 Cknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677625126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MUhwCn+Xf/Lh0tYXdZ7kyW7NLgJoG2FRHZEn6JIAUnU=;
 b=WhxvAZrugn4tPopNgfK7zMsoXaP9n5TDbyEpYdKQG2T5KHpjdz/1YUNxLEWZdiweNA
 pBCqqdzjFcrvVpWip1SMVPq/rQem/vHxUmA7LnhG+1wNXcVzzmFKxxa6XNHm1UfqU/L1
 QvHiogx3BWBAjeF3cCqDpUxLjiAk3m4ehwi7kTpod5mXK8TVv2k6roh40q/ka2KMlifm
 tu9u34S0sCqklk1sUv6gZxCaBYQTSLsK6qvQoBbaz5t9t3yL8DbSWTIg+pvlDbrI+erI
 E/jEOW9JqVHj1w2wx6h0h1CjvVoQc6A3GBsE6869gSPQ3xPqfr74nTb2XXwW/XPos5W6
 txKQ==
X-Gm-Message-State: AO0yUKVgpJTfIYxv6x2yGsst99yoYXJ/228WcNJkbsHCnzDrkMnRuYPk
 b0eh1kIlcsZiNktgvclip/POj24b2s8=
X-Google-Smtp-Source: AK7set/qSAFUDC45HBseJqwMlAjQHk2jNVtF8Z2udb0yAH2yK0d9B7OWEfmAbvw/WktVeXd6kfqeNw==
X-Received: by 2002:a17:903:2303:b0:19a:a546:2959 with SMTP id
 d3-20020a170903230300b0019aa5462959mr14042960plh.19.1677625126132; 
 Tue, 28 Feb 2023 14:58:46 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a170902e98400b0019a82ff8c38sm7028424plb.29.2023.02.28.14.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:58:45 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 04/16] dma-buf/dma-resv: Add a way to set fence deadline
Date: Tue, 28 Feb 2023 14:58:08 -0800
Message-Id: <20230228225833.2920879-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228225833.2920879-1-robdclark@gmail.com>
References: <20230228225833.2920879-1-robdclark@gmail.com>
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

