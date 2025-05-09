Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1A9AB189E
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 17:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A87810EA79;
	Fri,  9 May 2025 15:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EAo+5oKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0130B10EA64;
 Fri,  9 May 2025 15:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yoH2w/m32RB9xtTZruVpdjXWYhuRfWOTzKZ/CjeZfKs=; b=EAo+5oKqYdoyi3638+IXEe6R1a
 NntDdVE9ZUrmYtGUw2xUDPOGtS4do/7wbiuYt7b+HdtZFJwz1P/POdSQC4xwkX1SbOod4GLLEaZ90
 6oU2okqcR4Gi4EP3speDU0pUZq3h7+PR8OJVRwr24QzUC4kelf6ltDOkH2bhRZeSS/2OLA0jZVvmr
 B/GV4Lg8ZYr7ZsYyjulixpW0ZxkObdfD+fAwFcfI4fBKYURiD4LZfxtHjd/1QXK49i3q7jfdPIjww
 HxZ6mbv0FVq3o9VPGFGogRbWI9IVcOXEpCMeH6oeRB6/0ebo/XRDOsGDXqKB/rGJdgum2xwQEvDmw
 KD0/BPfQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uDPfI-005oEe-Uf; Fri, 09 May 2025 17:34:09 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC v2 04/13] dma-fence: Move array and chain checks to flags
Date: Fri,  9 May 2025 16:33:43 +0100
Message-ID: <20250509153352.7187-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the goal of reducing the need for drivers to touch fence->ops, we
add explicit flags for struct dma_fence_array and struct dma_fence_chain
and make the respective helpers (dma_fence_is_array() and
dma_fence_is_chain()) use them.

This also allows us to remove the exported symbols for the respective
operation tables.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/dma-fence-array.c | 2 +-
 drivers/dma-buf/dma-fence-chain.c | 2 +-
 include/linux/dma-fence.h         | 9 ++++-----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 6657d4b30af9..daf444f5d228 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -167,7 +167,6 @@ const struct dma_fence_ops dma_fence_array_ops = {
 	.release = dma_fence_array_release,
 	.set_deadline = dma_fence_array_set_deadline,
 };
-EXPORT_SYMBOL(dma_fence_array_ops);
 
 /**
  * dma_fence_array_alloc - Allocate a custom fence array
@@ -207,6 +206,7 @@ void dma_fence_array_init(struct dma_fence_array *array,
 	spin_lock_init(&array->lock);
 	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
 		       context, seqno);
+	__set_bit(DMA_FENCE_FLAG_ARRAY_BIT, &array->base.flags);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
 	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a8a90acf4f34..f4abe41fb092 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -225,7 +225,6 @@ const struct dma_fence_ops dma_fence_chain_ops = {
 	.release = dma_fence_chain_release,
 	.set_deadline = dma_fence_chain_set_deadline,
 };
-EXPORT_SYMBOL(dma_fence_chain_ops);
 
 /**
  * dma_fence_chain_init - initialize a fence chain
@@ -263,6 +262,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 
 	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
 			 context, seqno);
+	__set_bit(DMA_FENCE_FLAG_CHAIN_BIT, &chain->base.flags);
 
 	/*
 	 * Chaining dma_fence_chain container together is only allowed through
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index ac6535716dbe..5bafd0a5f1f1 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -98,6 +98,8 @@ struct dma_fence {
 
 enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_SEQNO64_BIT,
+	DMA_FENCE_FLAG_ARRAY_BIT,
+	DMA_FENCE_FLAG_CHAIN_BIT,
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
@@ -632,9 +634,6 @@ struct dma_fence *dma_fence_get_stub(void);
 struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp);
 u64 dma_fence_context_alloc(unsigned num);
 
-extern const struct dma_fence_ops dma_fence_array_ops;
-extern const struct dma_fence_ops dma_fence_chain_ops;
-
 /**
  * dma_fence_is_array - check if a fence is from the array subclass
  * @fence: the fence to test
@@ -643,7 +642,7 @@ extern const struct dma_fence_ops dma_fence_chain_ops;
  */
 static inline bool dma_fence_is_array(struct dma_fence *fence)
 {
-	return fence->ops == &dma_fence_array_ops;
+	return test_bit(DMA_FENCE_FLAG_ARRAY_BIT, &fence->flags);
 }
 
 /**
@@ -654,7 +653,7 @@ static inline bool dma_fence_is_array(struct dma_fence *fence)
  */
 static inline bool dma_fence_is_chain(struct dma_fence *fence)
 {
-	return fence->ops == &dma_fence_chain_ops;
+	return test_bit(DMA_FENCE_FLAG_CHAIN_BIT, &fence->flags);
 }
 
 /**
-- 
2.48.0

