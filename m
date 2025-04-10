Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E611AA83E7F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D07910E82B;
	Thu, 10 Apr 2025 09:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G99ccvzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41E510E81A;
 Thu, 10 Apr 2025 09:24:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 65B88A49ADC;
 Thu, 10 Apr 2025 09:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF2DC4CEE9;
 Thu, 10 Apr 2025 09:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744277093;
 bh=3P7s4nXmSskx7iFVqJGduWVlN7qiQQvgN5d+ysuJyiI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G99ccvzBekwF9w28ZdrT3WI90UdaES2VHm6CttD7Z3rn10sY7nJBSVjBweaIBtSBz
 du7leLWJhVQRElmAZ+QWxL6MM1c9xjK9xurwfHmTWf4rBsj4SrqH2xgHTtlAWZyc8m
 R701q5aFobVxj/Mgn244Kus6EqysQ5ITd2sT8irG140N3vX3HC2pAOTTuWxHMfshsg
 mBlu5qQIy6UZ2fNtBOwi3YTUReLyAvIVmGzdC9LflXh5eVQxd5cgvDDFITTV54rUbS
 BJkuBdN6GqLzGBeGyrRlw1xTN/hy9hz7DywZyN0CAzHcpWBGAloL5P84pp2OYRwPf+
 jhIt5jr10fNmA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Philipp Stanner <phasta@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
Date: Thu, 10 Apr 2025 11:24:17 +0200
Message-ID: <20250410092418.135258-3-phasta@kernel.org>
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

Nouveau currently relies on the assumption that dma_fences will only
ever get signaled through nouveau_fence_signal(), which takes care of
removing a signaled fence from the list nouveau_fence_chan.pending.

This self-imposed rule is violated in nouveau_fence_done(), where
dma_fence_is_signaled() (somewhat surprisingly, considering its name)
can signal the fence without removing it from the list. This enables
accesses to already signaled fences through the list, which is a bug.

In particular, it can race with nouveau_fence_context_kill(), which
would then attempt to set an error code on an already signaled fence,
which is illegal.

In nouveau_fence_done(), the call to nouveau_fence_update() already
ensures to signal all ready fences. Thus, the signaling potentially
performed by dma_fence_is_signaled() is actually not necessary.

Replace the call to dma_fence_is_signaled() with
nouveau_fence_base_is_signaled().

Cc: <stable@vger.kernel.org> # 4.10+, precise commit not to be determined
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7cc84472cece..33535987d8ed 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -274,7 +274,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
 			nvif_event_block(&fctx->event);
 		spin_unlock_irqrestore(&fctx->lock, flags);
 	}
-	return dma_fence_is_signaled(&fence->base);
+	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);
 }
 
 static long
-- 
2.48.1

