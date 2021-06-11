Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E83A419F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 14:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686FC6EE80;
	Fri, 11 Jun 2021 12:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391C46EE7D;
 Fri, 11 Jun 2021 12:03:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id z8so5790856wrp.12;
 Fri, 11 Jun 2021 05:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GivG2fWroyBp8LLT2a2aE/3FmiD4JPvufM2qhUiBXy4=;
 b=vE45B+d9vKwrBHdVHxVDcfh3b1uy59v1xKCcWsIiWo3hX9s3460X/UMJ/I5dy8De5y
 bFzIdIvwhZ07zIelT9CGLpIIgBCvdBVQnUfYNj6nbA1n9UY2dfBSeZNPkvUneO6LnCdG
 6T9d6zU5krzaRUhpNyOhneyEL4HtJBgDKfyXReZZDCtaROP7pRUaumkLDECpv25O42QG
 KdQ+J9NeSP9b//W0yT6roeSAYQWdE+IFxBaLwc3Hi64QGhRB3VSNRi6pmSbVrCg8/JFr
 o8QIJ27CIe14qYDV//w56NYNy47KzsRM1w+8RXBKsG/eLThMVltkjrTARKgkxeGNC9l9
 C4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GivG2fWroyBp8LLT2a2aE/3FmiD4JPvufM2qhUiBXy4=;
 b=SWwJFX7igSD6h1pVILybd9MAA3CE44S+COKKVRH440VvBUwr78xe91Jfm/KtzFtD7B
 nIEm0ZkltqWj7DMn8ifK14Sle58yWJdNtYlJwME9w4VRwMxrGMigsPviN0Bw94EV76gz
 nwJDqQahajGKRg4MIg7sVJ1EXlJlVEFd5X2Q0G0j3KzYfSUfcSzb5dXySf7hRsFDeeuy
 UDLEjX056Gh453y7g9DRDoeXYkvwaaanTvSrLxa+4viqjEX28ZcpF2f5nNaa84Hwvkgq
 9mf63xkLO8Y0qFonkkdJ1zMjx1H56z3oKtJbrr5N2alrzl9Q4Y5Lo/h8rc+KBF4G0gTd
 8HIA==
X-Gm-Message-State: AOAM530DbeWugk7ZwOdv3BpVhl9VEOjZdgXRo3rpczHQxNgnMgloJX1+
 3Lq2tPZAmGZyv83QpJ55ufI=
X-Google-Smtp-Source: ABdhPJwMESRc5qVEx0pEipS19Jmxb3fR0cbxs0DdtwrW8SP0RBEQuTannHqqvy0lPiAIyxqd6WHzPg==
X-Received: by 2002:adf:f94c:: with SMTP id q12mr3587996wrr.417.1623412982985; 
 Fri, 11 Jun 2021 05:03:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:657d:4ae8:def3:d96a])
 by smtp.gmail.com with ESMTPSA id f13sm6898361wrt.86.2021.06.11.05.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 05:03:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] dma-buf: some dma_fence_chain improvements
Date: Fri, 11 Jun 2021 14:02:58 +0200
Message-Id: <20210611120301.10595-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611120301.10595-1-christian.koenig@amd.com>
References: <20210611120301.10595-1-christian.koenig@amd.com>
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
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-fence-chain.c |  2 +-
 include/linux/dma-fence-chain.h   | 27 +++++++++++++++++++++------
 2 files changed, 22 insertions(+), 7 deletions(-)

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
index 10462a029da2..c6eb3aa45668 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -16,21 +16,36 @@
 /**
  * struct dma_fence_chain - fence to represent an node of a fence chain
  * @base: fence base class
- * @lock: spinlock for fence handling
  * @prev: previous fence of the chain
  * @prev_seqno: original previous seqno before garbage collection
  * @fence: encapsulated fence
- * @cb: callback structure for signaling
- * @work: irq work item for signaling
+ * @lock: spinlock for fence handling
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
+		/**
+		 * @cb: callback for signaling
+		 *
+		 * This is used to add the callback for signaling the
+		 * complection of the fence chain. Never used at the same time
+		 * as the irq work.
+		 */
+		struct dma_fence_cb cb;
+
+		/**
+		 * @work: irq work item for signaling
+		 *
+		 * Irq work structure to allow us to add the callback without
+		 * running into lock inversion. Never used at the same time as
+		 * the callback.
+		 */
+		struct irq_work work;
+	};
+	spinlock_t lock;
 };
 
 extern const struct dma_fence_ops dma_fence_chain_ops;
-- 
2.25.1

