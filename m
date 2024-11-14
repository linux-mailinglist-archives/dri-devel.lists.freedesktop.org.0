Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442CB9C8891
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 12:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB5E10E217;
	Thu, 14 Nov 2024 11:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NVLmr8dA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F4C10E217
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 11:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7IeRST0VBQ3+gYFfk/J115s6DSd8hwDUAroeoxjlrnM=; b=NVLmr8dAfjug1JchtS9NLlx0Xc
 IQyCJvpiXCyrkgMCaZZV6gLiQqdYs7IWhqXUc1WXwstegANcRB/wekHoiQVIVkc/xWMFMbER3ohym
 7bhhQwW9CRM+lhmjbAmkKWudQBaWUBwzwmjEdun/JnBGmaz4b+HsVKTmCwqjpoguntWV5JLW1JNnR
 GlSiqi4p+ID7LlVJEjZe4Xsx3ahfg3oH2lpPSqObm6iuYwbG3J/7NTMOaMLtdf6lKIqTk43zTOOny
 06SxkkQcszCel/fUnmU6mXyncCFsXiNDoOxsuIbLMMqAj2wlQTTPylbnk8hEJ7CsxLv6OScwDZ3qY
 dmcsAwVA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tBXoY-006m86-R1; Thu, 14 Nov 2024 12:15:06 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
Subject: [PATCH 2/2] dma-fence: Add a single fence fast path for fence merging
Date: Thu, 14 Nov 2024 11:15:00 +0000
Message-ID: <20241114111500.77358-2-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241114111500.77358-1-tursulin@igalia.com>
References: <20241114111500.77358-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Testing some workloads in two different scenarios, such as games running
under Gamescope on a Steam Deck, or vkcube under a Plasma desktop, shows
that in a significant portion of calls the dma_fence_unwrap_merge helper
is called with just a single unsignalled fence.

Therefore it is worthile to add a fast path for that case and so bypass
the memory allocation and insertion sort attempts.

Tested scenarios:

1) Hogwarts Legacy under Gamescope

~1500 calls per second to __dma_fence_unwrap_merge.

Percentages per number of fences buckets, before and after checking for
signalled status, sorting and flattening:

   N       Before      After
   0       0.85%
   1      69.80%        ->   The new fast path.
  2-9     29.36%        9%   (Ie. 91% of this bucket flattened to 1 fence)
 10-19
 20-40
  50+

2) Cyberpunk 2077 under Gamescope

~2400 calls per second.

   N       Before      After
   0       0.71%
   1      52.53%        ->    The new fast path.
  2-9     44.38%      50.60%  (Ie. half resolved to a single fence)
 10-19     2.34%
 20-40     0.06%
  50+

3) vkcube under Plasma

90 calls per second.

   N       Before      After
   0
   1
  2-9      100%         0%   (Ie. all resolved to a single fence)
 10-19
 20-40
  50+

In the case of vkcube all invocations in the 2-9 bucket were actually
just two input fences.

v2:
 * Correct local variable name and hold on to unsignaled reference. (Chistian)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Friedrich Vock <friedrich.vock@gmx.de>
---
 drivers/dma-buf/dma-fence-unwrap.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 26cad03340ce..03bdaa4d57db 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -84,8 +84,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 					   struct dma_fence **fences,
 					   struct dma_fence_unwrap *iter)
 {
+	struct dma_fence *tmp, *unsignaled = NULL, **array;
 	struct dma_fence_array *result;
-	struct dma_fence *tmp, **array;
 	ktime_t timestamp;
 	int i, j, count;
 
@@ -94,6 +94,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 	for (i = 0; i < num_fences; ++i) {
 		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
 			if (!dma_fence_is_signaled(tmp)) {
+				dma_fence_put(unsignaled);
+				unsignaled = dma_fence_get(tmp);
 				++count;
 			} else {
 				ktime_t t = dma_fence_timestamp(tmp);
@@ -107,9 +109,16 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 	/*
 	 * If we couldn't find a pending fence just return a private signaled
 	 * fence with the timestamp of the last signaled one.
+	 *
+	 * Or if there was a single unsignaled fence left we can return it
+	 * directly and early since that is a major path on many workloads.
 	 */
 	if (count == 0)
 		return dma_fence_allocate_private_stub(timestamp);
+	else if (count == 1)
+		return unsignaled;
+
+	dma_fence_put(unsignaled);
 
 	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
 	if (!array)
-- 
2.46.0

