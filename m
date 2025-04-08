Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E998A805F3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B1110E683;
	Tue,  8 Apr 2025 12:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H2uuPMwq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A4610E683
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 12:22:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7AC10A4106F;
 Tue,  8 Apr 2025 12:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F5CC4CEEA;
 Tue,  8 Apr 2025 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744114960;
 bh=ARlaPxjwhPhDoB9L/imRcfXdn1v5REAzpHVuhMnz+Bs=;
 h=From:To:Cc:Subject:Date:From;
 b=H2uuPMwq2KAc8X12Yow30IXlWQi9nW0kPLtUWTjtb23hznGTn7+hmvZoqf9L4H5dc
 Kvjd91MTdPzdzNK8sCdN085er4UL2HyIiItLZ1iLPMJ2gqdpzMjDfLSh9OJlrKvXBe
 voZC3NS+WHSf0/ixpp1DviVfmbK0RRtaQVsBeD40/M0PO353pt+aiOLcDsm9LdaeYn
 d5xfrforOzFeqtM+AyfAfPU66h2RorRN1Xbkkc9/FQe2I6JCrnSB7epue89bEk+OQD
 WAZh3Z4rY8DZyxoRV6nA/jecrOBcCq7MS0GkfbRaO8VyaKvHYtgA8Akl9DoM30VyVy
 /ZA6hrGKspzPw==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] dma-fence: Document signaling in dma_fence_is_signaled()
 explicitly
Date: Tue,  8 Apr 2025 14:22:18 +0200
Message-ID: <20250408122217.61530-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
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

The current documentation of dma_fence_is_signaled() and
dma_fence_is_signaled_locked() does not explicitly mention that those
functions can signal the fence.

Furthermore, the documentation of the return value reads as if the
returned boolean only describes whether dma_fence_signal() (or similar)
had been called before this function call already. That's not the case,
since dma_fence_ops.signaled() usually just checks through the sequence
number whether the hardware is finished with a fence. That doesn't mean
a signaling function has been called already.

Make the documentation clearer.

Move the Return: documentation to the end, since that's the officially
recommended docu style.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/linux/dma-fence.h | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e7ad819962e3..939df0ab3224 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -407,14 +407,21 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
  *                                is signaled yet.
  * @fence: the fence to check
  *
- * Returns true if the fence was already signaled, false if not. Since this
- * function doesn't enable signaling, it is not guaranteed to ever return
- * true if dma_fence_add_callback(), dma_fence_wait() or
+ * Checks whether the fence was already signaled, and, if not, whether
+ * &struct dma_fence_ops.signaled indicates that it should be signaled. If so,
+ * the fence gets signaled here.
+ *
+ * Since this function doesn't enable signaling, it is not guaranteed to ever
+ * return true if dma_fence_add_callback(), dma_fence_wait() or
  * dma_fence_enable_sw_signaling() haven't been called before.
  *
  * This function requires &dma_fence.lock to be held.
  *
  * See also dma_fence_is_signaled().
+ *
+ * Return: true if the fence was already signaled, or if
+ * &struct dma_fence_ops.signaled is implemented and indicates that this fence
+ * can be treated as signaled; false otherwise.
  */
 static inline bool
 dma_fence_is_signaled_locked(struct dma_fence *fence)
@@ -434,9 +441,12 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
  * dma_fence_is_signaled - Return an indication if the fence is signaled yet.
  * @fence: the fence to check
  *
- * Returns true if the fence was already signaled, false if not. Since this
- * function doesn't enable signaling, it is not guaranteed to ever return
- * true if dma_fence_add_callback(), dma_fence_wait() or
+ * Checks whether the fence was already signaled, and, if not, whether
+ * &struct dma_fence_ops.signaled indicates that it should be signaled. If so,
+ * the fence gets signaled here.
+ *
+ * Since this function doesn't enable signaling, it is not guaranteed to ever
+ * return true if dma_fence_add_callback(), dma_fence_wait() or
  * dma_fence_enable_sw_signaling() haven't been called before.
  *
  * It's recommended for seqno fences to call dma_fence_signal when the
@@ -445,6 +455,10 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
  * value of this function before calling hardware-specific wait instructions.
  *
  * See also dma_fence_is_signaled_locked().
+ *
+ * Return: true if the fence was already signaled, or if
+ * &struct dma_fence_ops.signaled is implemented and indicates that this fence
+ * can be treated as signaled; false otherwise.
  */
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
-- 
2.48.1

