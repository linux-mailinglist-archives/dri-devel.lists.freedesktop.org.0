Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BB7A89D96
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9240B10E75B;
	Tue, 15 Apr 2025 12:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JfH7XsGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54DE10E757;
 Tue, 15 Apr 2025 12:19:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4230B5C57D9;
 Tue, 15 Apr 2025 12:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85831C4CEE5;
 Tue, 15 Apr 2025 12:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744719553;
 bh=COvRNNF786kYGi8CjZYmPlrfxrjGI6tMrD6MDqpsP14=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JfH7XsGAmFx5ngYrAkEkA4JmaHVN3Q3GYrKKTkmVqE+yulpJOGRvsLOkobdtTwOVS
 uvHIr9FJU29TknobKd5XqDD+pKl3CCQPzzKUUe9E0xsAId0XOFEIshjFAAqV+XKAsR
 6EKtG+VarvyUJxfaVtifWWOeUScsthvHRxnzEfeEKesk3Oq+jPIPQOW6HRdjnZUgAz
 /xaDvFrFPPr+40qGFcG+ZA64FKIuLuoSkNOkeTijdo/1og3emz7Yj9GSEklD0eynkh
 EuQes8WKSAlKkDirHIta+vQrePOjKBHqKPVkrWXfVQbG9cLTyn9DjhogJ4K7+9KRbG
 jaLBYOACSBWcA==
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
Subject: [PATCH v2 1/2] drm/nouveau: Fix WARN_ON in
 nouveau_fence_context_kill()
Date: Tue, 15 Apr 2025 14:19:00 +0200
Message-ID: <20250415121900.55719-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415121900.55719-2-phasta@kernel.org>
References: <20250415121900.55719-2-phasta@kernel.org>
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

Nouveau is mostly designed in a way that it's expected that fences only
ever get signaled through nouveau_fence_signal(). However, in at least
one other place, nouveau_fence_done(), can signal fences, too. If that
happens (race) a signaled fence remains in the pending list for a while,
until it gets removed by nouveau_fence_update().

Should nouveau_fence_context_kill() run in the meantime, this would be
a bug because the function would attempt to set an error code on an
already signaled fence.

Have nouveau_fence_context_kill() check for a fence being signaled.

Cc: <stable@vger.kernel.org> # v5.10+
Fixes: ea13e5abf807 ("drm/nouveau: signal pending fences when channel has been killed")
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7622587f149e..6ded8c2b6d3b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -90,7 +90,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 	while (!list_empty(&fctx->pending)) {
 		fence = list_entry(fctx->pending.next, typeof(*fence), head);
 
-		if (error)
+		if (error && !dma_fence_is_signaled_locked(&fence->base))
 			dma_fence_set_error(&fence->base, error);
 
 		if (nouveau_fence_signal(fence))
-- 
2.48.1

