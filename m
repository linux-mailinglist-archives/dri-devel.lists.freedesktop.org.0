Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D556B0D8C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BAE10E628;
	Wed,  8 Mar 2023 15:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278E910E630;
 Wed,  8 Mar 2023 15:53:38 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id a2so18088493plm.4;
 Wed, 08 Mar 2023 07:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678290817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0O2Ww3Cm9WKvcOgcLWcXNiHRtUzq1XNv4cTGeNjGUs=;
 b=cKLTDwB0Xy7r9Ppx1Na+PUt8wGSmaLtS7mPtyVg1TcoZtWLLqiD42GBRsgcTokYjk/
 +o52Z76Vk2/EJPDg6TOZPJ2wr0ebyu/jrWhY2t7jcssnmD56pgTiiS26e/5bAnsbCDkS
 dam2mgWt8Cn5zCaBaM6123GRms9tvWowVnSpqMr5pdj7aDaJkySCCEw2heRKqV8ZHn8n
 fsz0o9F0wOklPSEPkjTOc91tffQHuDWyaycUGr/IKUCWRhozjDBQybV/CKv8NcAaH6rI
 cov6SDsFDN4JEMZujhnJis1V8E65zeWDjoazY2pw+iN3gBWH1T21Ur6IfpIZWNu7NH1b
 8xaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678290817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V0O2Ww3Cm9WKvcOgcLWcXNiHRtUzq1XNv4cTGeNjGUs=;
 b=aFUIYuoXS00t0xSSrvqc3q9p3q+zaBVNXZ8QxRRSRwlvv6VDG+yC9dTwKqOk6P6Mnv
 HTZ1nBppIAu+0fJIR9rmSyuJizI5IGpHF3iWTbWXu+vHAT5JWpfX49D4Kz0NQV0jT3uk
 dcibdQ0uqAhcdX6YTAeeqnct1Niu8fuVRxNxf5exB47Y5V2F/jxTnigbMbsQEcm1XLzf
 CQYOTEe91Gga11Q+2R+jh58SABpQYBrjuuFpB+7SqiS0pCfjnnU6bRWhgfqqJF8eTotW
 h4/qwhywUr1zEOeEtLwLqLfkajNoNF4C6qSpjvqNZZJ22AhpvY5aQ6fRSuoQt/eUZAry
 PDRA==
X-Gm-Message-State: AO0yUKVObIR6yfGhCQYhdfToUANBLlE4guJ5SFhbJFpMUXMc5z//CaOk
 V3hZItJDPjMSSQXwo0FQ6BmBj9/Vsyc=
X-Google-Smtp-Source: AK7set96zWJ64oh1bpggyeyTLr/2ieL59AK11mtNd342xYu679A/tHaLq9ev58BsNkm68KVtEeIcOg==
X-Received: by 2002:a17:902:e80d:b0:19c:cb64:dacc with SMTP id
 u13-20020a170902e80d00b0019ccb64daccmr23386540plg.61.1678290817169; 
 Wed, 08 Mar 2023 07:53:37 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a170902e88e00b0019e88d9bed3sm9969603plg.210.2023.03.08.07.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 07:53:36 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v10 04/15] dma-buf/dma-resv: Add a way to set fence deadline
Date: Wed,  8 Mar 2023 07:52:55 -0800
Message-Id: <20230308155322.344664-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308155322.344664-1-robdclark@gmail.com>
References: <20230308155322.344664-1-robdclark@gmail.com>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Turner <mattst88@gmail.com>, freedreno@lists.freedesktop.org,
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
2.39.2

