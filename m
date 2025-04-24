Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFE9A9AE44
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 15:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36E910E7F4;
	Thu, 24 Apr 2025 13:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B2Lh/mpy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1D510E7F4;
 Thu, 24 Apr 2025 13:03:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6B74868462;
 Thu, 24 Apr 2025 13:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28138C4CEE3;
 Thu, 24 Apr 2025 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745499793;
 bh=aWijLvZAk3fD5Xw7QJX+kfKWe8iN4WqFGm8B7OBvTTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B2Lh/mpyg6zo+cLFVviRJDnFZi/nBDGg4DimbXpvlTQPFJiblEFLaBttf30J/tfsL
 qAiIkN7UqUdvtJ3oviCRcQdw+aZPD74DZjw1mW7wMFZeu4cq332zYeolBw3Ni+Ts13
 zYDMuWsBQ4oEKZ3+BCah67nZ1Pne1kWE5F9lFI0dMvRArtuDx/NHh0Eb80YYCRWoIy
 9ntNY7IX/zvmeALASoFEz25PO3JJrgeIrAMiuNuGEIXNruZ/Mj4TiveYn5Dec5Mb7y
 7+acEDob32ANTDERpLbBHcbgALkO2RVmCXYrih2oGEbtUOB+4SIEn4xNytpBX+rXBk
 mEkgiMFZMc4Jg==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 3/4] drm/nouveau: Simplify nouveau_fence_done()
Date: Thu, 24 Apr 2025 15:02:53 +0200
Message-ID: <20250424130254.42046-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250424130254.42046-2-phasta@kernel.org>
References: <20250424130254.42046-2-phasta@kernel.org>
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

nouveau_fence_done() contains an if branch that checks whether a
nouveau_fence has either of the two existing nouveau_fence backend ops,
which will always evaluate to true.

Remove the surplus check.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 2b79bcb7da16..fb9811938c82 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -249,21 +249,19 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 bool
 nouveau_fence_done(struct nouveau_fence *fence)
 {
-	if (fence->base.ops == &nouveau_fence_ops_legacy ||
-	    fence->base.ops == &nouveau_fence_ops_uevent) {
-		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
-		struct nouveau_channel *chan;
-		unsigned long flags;
+	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
+	struct nouveau_channel *chan;
+	unsigned long flags;
 
-		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
-			return true;
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
+		return true;
+
+	spin_lock_irqsave(&fctx->lock, flags);
+	chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
+	if (chan)
+		nouveau_fence_update(chan, fctx);
+	spin_unlock_irqrestore(&fctx->lock, flags);
 
-		spin_lock_irqsave(&fctx->lock, flags);
-		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
-		if (chan)
-			nouveau_fence_update(chan, fctx);
-		spin_unlock_irqrestore(&fctx->lock, flags);
-	}
 	return dma_fence_is_signaled(&fence->base);
 }
 
-- 
2.48.1

