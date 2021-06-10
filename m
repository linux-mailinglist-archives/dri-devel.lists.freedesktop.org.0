Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 574603A2818
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45B96EC91;
	Thu, 10 Jun 2021 09:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC746EC8E;
 Thu, 10 Jun 2021 09:18:04 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so5992348wmq.0; 
 Thu, 10 Jun 2021 02:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JVobQsZTPFsYsVCxBp6A6usqvoqIwJaIiEhjza5mjko=;
 b=iIbQHZsNRhyJVD4JD990ADpAon+nSuconH3dO1YEEeoXxZokSWwvIweUuESfs/Y/oM
 oyZqMvx3APxfGrBIJXxO1SubxMif7cD5+KCb//jwfm+QF4fjltc5eXbZrLcyyA8xQpnh
 A8fPX143nPXj2ZM1kbwIM2Cbb+RjFA5pA2yBdshELIifPIbWDTE2ke9EdTuckmwcyVk4
 XLvHzOSLulqI9PoQtPc7lJOl5xgW1Rkj5PwAnfiyrfU5CJbyWaJ2I2WfXYU3ZGwjo3zl
 NbHtuZmhfHtNB2F6BoHyRxUeezXswbXUbIvXdy7cpgVD4nmUxnxMhgyvKYHCYAWfllrQ
 l9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JVobQsZTPFsYsVCxBp6A6usqvoqIwJaIiEhjza5mjko=;
 b=lq1GVgB6x4prvOeWUIG/1qL26IGmkWTOra1Bwq3wwMsxlJQEVTfSMwJokU1WqJKKxY
 aGhLM8Clo+LeCzfYv5k8VOKGDgioe2s7dNSjDj3/vobpcKzBoZNpJ2hl4GT1XShjAkry
 mKEv0UDTf8MPUIB2l7TjPFhr4+2OZyaWDN9QN/4yYX5CKWsK/iXNDk7s/vY5dFVSiom+
 D2xHGBBQpJ04jOZpdkoJhmJjJEoWspt8Sy+FzRx5IPe39HmtT0Ue0vZdFJB9nkdyTOh1
 BRvsj7bktAm3mnV+MoEScwAEmDDkviJfrj1odWsuWX5F4RMqQFZdMK47NtYtSSvElrKm
 g1vA==
X-Gm-Message-State: AOAM531kfKMnhqGf5Uih3uxNRSTzXUXJZo7nuwQPU87f641RNB2eSnYM
 XHuBS2dOcTDE+4x7MKfCKjM=
X-Google-Smtp-Source: ABdhPJx9jFS46PJDSTjDOqWw8hh0BtBxUPMkQyGe7MhQjhq16Cu0/T2V8QFq9A11V/U8H6ubWpYdZw==
X-Received: by 2002:a05:600c:3b13:: with SMTP id
 m19mr4000783wms.53.1623316683173; 
 Thu, 10 Jun 2021 02:18:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:561f:e43a:edf5:8f95])
 by smtp.gmail.com with ESMTPSA id v8sm3087445wrc.29.2021.06.10.02.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:18:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] dma-buf: some dma_fence_chain improvements
Date: Thu, 10 Jun 2021 11:17:54 +0200
Message-Id: <20210610091800.1833-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610091800.1833-1-christian.koenig@amd.com>
References: <20210610091800.1833-1-christian.koenig@amd.com>
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

The callback and the irq work are never used at the same
time. Putting them into an union saves us 24 bytes and
makes the structure only 120 bytes in size.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c | 2 +-
 include/linux/dma-fence-chain.h   | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 7d129e68ac70..1b4cb3e5cec9 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -137,6 +137,7 @@ static void dma_fence_chain_cb(struct dma_fence *f, struct dma_fence_cb *cb)
 	struct dma_fence_chain *chain;
 
 	chain = container_of(cb, typeof(*chain), cb);
+	init_irq_work(&chain->work, dma_fence_chain_irq_work);
 	irq_work_queue(&chain->work);
 	dma_fence_put(f);
 }
@@ -239,7 +240,6 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 	rcu_assign_pointer(chain->prev, prev);
 	chain->fence = fence;
 	chain->prev_seqno = 0;
-	init_irq_work(&chain->work, dma_fence_chain_irq_work);
 
 	/* Try to reuse the context of the previous chain node. */
 	if (prev_chain && __dma_fence_is_later(seqno, prev->seqno, prev->ops)) {
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index 10462a029da2..9d6a062be640 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -25,12 +25,14 @@
  */
 struct dma_fence_chain {
 	struct dma_fence base;
-	spinlock_t lock;
 	struct dma_fence __rcu *prev;
 	u64 prev_seqno;
 	struct dma_fence *fence;
-	struct dma_fence_cb cb;
-	struct irq_work work;
+	union {
+		struct dma_fence_cb cb;
+		struct irq_work work;
+	};
+	spinlock_t lock;
 };
 
 extern const struct dma_fence_ops dma_fence_chain_ops;
-- 
2.25.1

