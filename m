Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A86ADB600
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 18:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0957710E3EA;
	Mon, 16 Jun 2025 16:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="n3V87Fjz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56AA10E33B;
 Mon, 16 Jun 2025 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zyNQaQ/EStVOnSfpJh1vPTOGYEjDmA7Oxvuyblxxg74=; b=n3V87Fjz1YyBu0ocLE878k+c5K
 jXDCq6dx7XcL6YFCbgoABnhzPzg3MLJsGBixwDcXKpmBYFXFXWVa3HgfnJ50pGIVlzLOkajSQh+5y
 bc9FLa99fZLzbZnUIRMQGqN27/XhW4HjIqq73WpqwXllUUngtFACWufCh6PGLQh3u33eSleC1l/i2
 JN730+PLkrTd2KTdhpEsSxGf26rB7qE408d2tPM3fmxGFZRPFPSkm0p20pa689KjggnLQ/ibNyjz2
 GUtBBQK6YIgIzc8TQJknfjINH4D8uxYZ/9IEtnfUskUaJg4iB+Lv7PDTxVTgB/5q7JtFTyAisBz0v
 u3tejBVg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRCFZ-004BtA-67; Mon, 16 Jun 2025 17:59:57 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] dma-fence: Fix sparse warnings due __rcu annotations
Date: Mon, 16 Jun 2025 16:59:52 +0100
Message-ID: <20250616155952.24259-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

__rcu annotations on the return types from dma_fence_driver_name() and
dma_fence_timeline_name() cause sparse to complain because both the
constant signaled strings, and the strings return by the dma_fence_ops are
not __rcu annotated.

For a simple fix it is easiest to cast them with __rcu added and undo the
smarts from the tracpoints side of things. There is no functional change
since the rest is left in place. Later we can consider changing the
dma_fence_ops return types too, and handle all the individual drivers
which define them.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 506aa8b02a8d ("dma-fence: Add safe access helpers and document the rules")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506162214.1eA69hLe-lkp@intel.com/
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c      |  8 ++++----
 include/trace/events/dma_fence.h | 35 +++++---------------------------
 2 files changed, 9 insertions(+), 34 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 3f78c56b58dc..da60d4e68b89 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1109,9 +1109,9 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
 			 "RCU protection is required for safe access to returned string");
 
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		return fence->ops->get_driver_name(fence);
+		return (const char __rcu *)fence->ops->get_driver_name(fence);
 	else
-		return "detached-driver";
+		return (const char __rcu *)"detached-driver";
 }
 EXPORT_SYMBOL(dma_fence_driver_name);
 
@@ -1141,8 +1141,8 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
 			 "RCU protection is required for safe access to returned string");
 
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		return fence->ops->get_driver_name(fence);
+		return (const char __rcu *)fence->ops->get_driver_name(fence);
 	else
-		return "signaled-timeline";
+		return (const char __rcu *)"signaled-timeline";
 }
 EXPORT_SYMBOL(dma_fence_timeline_name);
diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
index 4814a65b68dc..3abba45c0601 100644
--- a/include/trace/events/dma_fence.h
+++ b/include/trace/events/dma_fence.h
@@ -9,37 +9,12 @@
 
 struct dma_fence;
 
-DECLARE_EVENT_CLASS(dma_fence,
-
-	TP_PROTO(struct dma_fence *fence),
-
-	TP_ARGS(fence),
-
-	TP_STRUCT__entry(
-		__string(driver, dma_fence_driver_name(fence))
-		__string(timeline, dma_fence_timeline_name(fence))
-		__field(unsigned int, context)
-		__field(unsigned int, seqno)
-	),
-
-	TP_fast_assign(
-		__assign_str(driver);
-		__assign_str(timeline);
-		__entry->context = fence->context;
-		__entry->seqno = fence->seqno;
-	),
-
-	TP_printk("driver=%s timeline=%s context=%u seqno=%u",
-		  __get_str(driver), __get_str(timeline), __entry->context,
-		  __entry->seqno)
-);
-
 /*
  * Safe only for call sites which are guaranteed to not race with fence
  * signaling,holding the fence->lock and having checked for not signaled, or the
  * signaling path itself.
  */
-DECLARE_EVENT_CLASS(dma_fence_unsignaled,
+DECLARE_EVENT_CLASS(dma_fence,
 
 	TP_PROTO(struct dma_fence *fence),
 
@@ -64,14 +39,14 @@ DECLARE_EVENT_CLASS(dma_fence_unsignaled,
 		  __entry->seqno)
 );
 
-DEFINE_EVENT(dma_fence_unsignaled, dma_fence_emit,
+DEFINE_EVENT(dma_fence, dma_fence_emit,
 
 	TP_PROTO(struct dma_fence *fence),
 
 	TP_ARGS(fence)
 );
 
-DEFINE_EVENT(dma_fence_unsignaled, dma_fence_init,
+DEFINE_EVENT(dma_fence, dma_fence_init,
 
 	TP_PROTO(struct dma_fence *fence),
 
@@ -85,14 +60,14 @@ DEFINE_EVENT(dma_fence, dma_fence_destroy,
 	TP_ARGS(fence)
 );
 
-DEFINE_EVENT(dma_fence_unsignaled, dma_fence_enable_signal,
+DEFINE_EVENT(dma_fence, dma_fence_enable_signal,
 
 	TP_PROTO(struct dma_fence *fence),
 
 	TP_ARGS(fence)
 );
 
-DEFINE_EVENT(dma_fence_unsignaled, dma_fence_signaled,
+DEFINE_EVENT(dma_fence, dma_fence_signaled,
 
 	TP_PROTO(struct dma_fence *fence),
 
-- 
2.48.0

