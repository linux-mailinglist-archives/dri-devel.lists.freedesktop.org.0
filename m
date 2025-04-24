Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CC8A9AE48
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 15:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63CD10E7FF;
	Thu, 24 Apr 2025 13:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D80R/pEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7000810E7FA;
 Thu, 24 Apr 2025 13:03:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C825068458;
 Thu, 24 Apr 2025 13:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860FEC4CEEB;
 Thu, 24 Apr 2025 13:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745499796;
 bh=USBXckrnH4EXDRA/UJxzzOnVtw+ramkDN3MksP0nTXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D80R/pExgLSr8RGT1pxOAbZY1lIfYUMaR5c2H3A3/A3AXn3+K50MfkS4OtV/N3V6z
 GOXn0ZIAVZ5N/DYBNY3FkUbsM6zO810QMgBXenSp3drHLhEnZdY/kg3ct+lfG6LbaX
 MmZRQ8XlOrkXRMJgkQtQob3wlo1wRG1Nnf1q1ztBNCY3EIqs7WXZq3QcPgfAp7YJL7
 5Wvy8mPE/hsMkQJxJNWKkKSa7fIhgp7L8FnQ9D+eifbeVvxWl1FJlc5PQjsFfuVxaA
 K8tY5jhApZru9r/6JFU9ru3qUbSPw2JjHpwABtqdj7dt8EQtRypHdglTJFtwVVoq82
 24i857xMrskmg==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 4/4] drm/nouveau: Check dma_fence in canonical way
Date: Thu, 24 Apr 2025 15:02:54 +0200
Message-ID: <20250424130254.42046-6-phasta@kernel.org>
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

In nouveau_fence_done(), a fence is checked for being signaled by
manually evaluating the base fence's bits. This can be done in a
canonical manner through dma_fence_is_signaled().

Replace the bit-check with dma_fence_is_signaled().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index fb9811938c82..d5654e26d5bc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -253,7 +253,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
 	struct nouveau_channel *chan;
 	unsigned long flags;
 
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
+	if (dma_fence_is_signaled(&fence->base))
 		return true;
 
 	spin_lock_irqsave(&fctx->lock, flags);
-- 
2.48.1

