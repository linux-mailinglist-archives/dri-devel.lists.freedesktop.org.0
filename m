Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588EDAC0A95
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 13:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A961B10E85E;
	Thu, 22 May 2025 11:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mDIbxyiZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877D810E85E;
 Thu, 22 May 2025 11:26:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D28B25C4D64;
 Thu, 22 May 2025 11:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E439BC4CEEF;
 Thu, 22 May 2025 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747913175;
 bh=CnZnWn6ntljL6kA9ykEa/hUWKpXAg+RdkVBAJ2M5hTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mDIbxyiZ1DuwuWTn5m+GtIuBKKrDSncUcCv5+/5YJsLQx6jJi6AebZYQ3PDWRSUZd
 MaRkFdQ+/ycZU7T5S8DFx3riDaPvyn+ed+htnbjzinpdEOxb6wueOZWCD394VTz48U
 9xXNfpaBOhAudPsQUakdYu92cJzrM/yNjsNIQks80x1zRhVockqrg5jaXeWt/MPZpV
 DygL45FsPInJWapUWh1lx2nIkgutOF3afqgbJQU0LH45pegjY4vXFXThU7OK2s2Sy/
 XApLrPEBbBKZNwhIBKviGzcoZhMtISGQZQawXVlI1p9gJ0xYdsLaMbqbdMe8hi1U1c
 qoO6p8J7O1FbA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence context
Date: Thu, 22 May 2025 13:25:41 +0200
Message-ID: <20250522112540.161411-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522112540.161411-2-phasta@kernel.org>
References: <20250522112540.161411-2-phasta@kernel.org>
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

dma_fence_is_signaled_locked(), which is used in
nouveau_fence_context_kill(), can signal fences below the surface
through a callback.

There is neither need for nor use in doing that when killing a fence
context.

Replace dma_fence_is_signaled_locked() with __dma_fence_is_signaled(), a
function which only checks, never signals.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index d5654e26d5bc..993b3dcb5db0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -88,7 +88,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 
 	spin_lock_irqsave(&fctx->lock, flags);
 	list_for_each_entry_safe(fence, tmp, &fctx->pending, head) {
-		if (error && !dma_fence_is_signaled_locked(&fence->base))
+		if (error && !__dma_fence_is_signaled(&fence->base))
 			dma_fence_set_error(&fence->base, error);
 
 		if (nouveau_fence_signal(fence))
-- 
2.49.0

