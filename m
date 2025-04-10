Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE59FA83E84
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE64E10E83D;
	Thu, 10 Apr 2025 09:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C5snF0yF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4DD10E838;
 Thu, 10 Apr 2025 09:25:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 06EB2A49ADF;
 Thu, 10 Apr 2025 09:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101E6C4CEEE;
 Thu, 10 Apr 2025 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744277101;
 bh=wrafJtqld39LFoxCo2SLkSTX/FGJSOSUY67ueylsNZ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C5snF0yFfuHVhKnz4fzbkr7N2cym2tQmHOziG7+aRCRCWasD+/UnDEi925ipTORDP
 Wllj9EDzOrQkfEb3kkIdAgm760RdsWjtxZuezrG57jUYgIie2Z4zE6LovCxgPMKgjD
 mGRrykuwDjycfvx0rte/JH1LoiVw+WlhSdK7dcs19SCy9UohKXvfDGRgXwoNQTOsWe
 gq2klvgoxFUBcS6EWbcNLxeYTv2J5wGCScq0/4HHaPDDPuaj8DHcnaVqeAInHaBcQh
 oR+qu6Dl0/n8tt3KC/PX+a0yyjM7pt2grisyXo05OvExoyMrD/ZIZ43z/8Z/TojS1W
 dVQqt4Guny3Bg==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 3/3] drm/nouveau: Add helper to check base fence
Date: Thu, 10 Apr 2025 11:24:19 +0200
Message-ID: <20250410092418.135258-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410092418.135258-2-phasta@kernel.org>
References: <20250410092418.135258-2-phasta@kernel.org>
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

Nouveau, unfortunately, checks whether a dma_fence is already siganled
at various different places with, at times, different methods. In
nouveau_fence_update() it generally signals all fences the hardware is
done with by evaluating the sequence number. That mechanism then has no
way to tell the caller nouveau_fence_done() whether a particular fence
is actually signaled, which is why the internal bits of the dma_fence
get checked.

This can be made more readable by providing a new wrapper, which can
then later be helpful to solve an unrelated bug.

Add nouveau_fence_base_is_signaled().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index db6f4494405c..0d58a81b3402 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -256,6 +256,12 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 	return ret;
 }
 
+static inline bool
+nouveau_fence_base_is_signaled(struct nouveau_fence *fence)
+{
+	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);
+}
+
 bool
 nouveau_fence_done(struct nouveau_fence *fence)
 {
@@ -263,7 +269,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
 	struct nouveau_channel *chan;
 	unsigned long flags;
 
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
+	if (nouveau_fence_base_is_signaled(fence))
 		return true;
 
 	spin_lock_irqsave(&fctx->lock, flags);
@@ -272,7 +278,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
 		nvif_event_block(&fctx->event);
 	spin_unlock_irqrestore(&fctx->lock, flags);
 
-	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);
+	return nouveau_fence_base_is_signaled(fence);
 }
 
 static long
-- 
2.48.1

