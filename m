Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF7FA89D99
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A684210E761;
	Tue, 15 Apr 2025 12:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hAeoNV51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0296D10E75D;
 Tue, 15 Apr 2025 12:19:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6AAE961366;
 Tue, 15 Apr 2025 12:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71888C4CEDD;
 Tue, 15 Apr 2025 12:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744719556;
 bh=ExuwwuQWLzkJuGGpl9n1F27u16tfXGWUJL91Td9VQ/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hAeoNV51pdhfYpi5SMPjAlS9s8O23JXovV8fv06NO08eoHRGlibgpic+MlVsAqeJc
 MMwpxy35qteiXy3naYT2DqF7eAFZjrrhmV0fDHSDmyq0EjB4OEiDZ721GIgiBxV+LE
 aIKwW+x+2Ns5RWixNq91VMPxsD3LRE0+5SVvmJsygLy1eCFyfX1tnX7xfOwKXCwm1K
 /r0ktlz++7z1VRTtNiX5fBbTBBwwtPw01tgUa7iZ/1Nlv/nkWXHmSmIQzCZ2mkfaJ8
 8pGc8XYasDthBwD0ohlAZjewKdGnW3t1nsZqPfH3pcysXEFP+vQed6MX2hwDbRdq1J
 c6t1lm/y+laBg==
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
Subject: [PATCH v2 2/2] drm/nouveau: nouveau_fence: Standardize list iterations
Date: Tue, 15 Apr 2025 14:19:01 +0200
Message-ID: <20250415121900.55719-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415121900.55719-2-phasta@kernel.org>
References: <20250415121900.55719-2-phasta@kernel.org>
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

nouveau_fence.c iterates over lists in a non-canonical way. Since the
operations done are just basic for-each-loops, they should be written in
the standard form.

Use for_each_safe() instead of the custom loop iterations.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 6ded8c2b6d3b..60d961b43488 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -84,11 +84,12 @@ void
 nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 {
 	struct nouveau_fence *fence;
+	struct list_head *pos, *tmp;
 	unsigned long flags;
 
 	spin_lock_irqsave(&fctx->lock, flags);
-	while (!list_empty(&fctx->pending)) {
-		fence = list_entry(fctx->pending.next, typeof(*fence), head);
+	list_for_each_safe(pos, tmp, &fctx->pending) {
+		fence = list_entry(pos, struct nouveau_fence, head);
 
 		if (error && !dma_fence_is_signaled_locked(&fence->base))
 			dma_fence_set_error(&fence->base, error);
@@ -131,11 +132,12 @@ static int
 nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
 {
 	struct nouveau_fence *fence;
+	struct list_head *pos, *tmp;
 	int drop = 0;
 	u32 seq = fctx->read(chan);
 
-	while (!list_empty(&fctx->pending)) {
-		fence = list_entry(fctx->pending.next, typeof(*fence), head);
+	list_for_each_safe(pos, tmp, &fctx->pending) {
+		fence = list_entry(pos, struct nouveau_fence, head);
 
 		if ((int)(seq - fence->base.seqno) < 0)
 			break;
-- 
2.48.1

