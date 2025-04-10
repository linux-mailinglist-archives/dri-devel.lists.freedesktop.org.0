Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2507CA83E81
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A407F10E834;
	Thu, 10 Apr 2025 09:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GmhViSG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860D210E830;
 Thu, 10 Apr 2025 09:24:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2DD60A49ADB;
 Thu, 10 Apr 2025 09:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6D3C4CEEA;
 Thu, 10 Apr 2025 09:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744277097;
 bh=fFdMV2U0ELCA71kU/Js1/s2xdWAGWoCmvbLagHCp6Ps=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GmhViSG+psu5bFsa1vh+rEKrjVmrud1pcWUvaM07hvbfUEK0ZH+1pQOCYEYvRbjqR
 XrOd70Kq5VGsayWgaSW+t4nP3sUK7A9PXrMUGluOvRM1beWmjJKmj6Xf4QRubGG5Os
 jqWNJPMMqg1LYn/ftvxwTajdA+WZQ2J8l9UPPnuSl3uYqrmWVJXbJMaWKDljrLw5fL
 nHG6o9VREB7b96AZRbMSZNfuG+zf1zE9PtumlnXx42OVDrdRJtjgqK78VLmzXC8hk1
 KCN6HRmJyTWdrepHbUG0zAqxKq5sTBrPAD51dD2rJyaAS3wwe0BL1tANs6UQu5AqCJ
 X3gVlSCd9cG3Q==
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
Subject: [PATCH 2/3] drm/nouveau: Remove surplus if-branch
Date: Thu, 10 Apr 2025 11:24:18 +0200
Message-ID: <20250410092418.135258-4-phasta@kernel.org>
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

nouveau_fence_done() contains an if-branch which checks for the
existence of either of two fence backend ops. Those two are the only
backend ops existing in Nouveau, however; and at least one backend ops
must be in use for the entire driver to be able to work. The if branch
is, therefore, surplus.

Remove the if-branch.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 33535987d8ed..db6f4494405c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -259,21 +259,19 @@ nouveau_fence_emit(struct nouveau_fence *fence)
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
+	if (chan && nouveau_fence_update(chan, fctx))
+		nvif_event_block(&fctx->event);
+	spin_unlock_irqrestore(&fctx->lock, flags);
 
-		spin_lock_irqsave(&fctx->lock, flags);
-		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
-		if (chan && nouveau_fence_update(chan, fctx))
-			nvif_event_block(&fctx->event);
-		spin_unlock_irqrestore(&fctx->lock, flags);
-	}
 	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);
 }
 
-- 
2.48.1

