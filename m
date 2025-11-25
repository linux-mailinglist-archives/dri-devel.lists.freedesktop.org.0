Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7124BC84897
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 11:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC7210E3B3;
	Tue, 25 Nov 2025 10:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NREo4+7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CF710E3B5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 10:45:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E25A744467;
 Tue, 25 Nov 2025 10:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5ABBC16AAE;
 Tue, 25 Nov 2025 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764067510;
 bh=b40CBQbpmrn39IDJo2j+aqddbwBINyUrJXie1Z8VPgM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NREo4+7nJdmXm9UvCZRXHEbHRMtgunXpdGbY/wtW3ueYDYKmwz/7e1H48GEes7T4y
 wkZb6Mbn9a0TviyPBBPPHNOvQ3hyjrbMnYZczbw4qpTj8wVraIca5X0NSca0KR9tAw
 Rt6twcam+j+JqJZzRSH5dUKOz1i3y16qvZXDyc/KTbuN1zbjtXdjirV/m+jJbOxNTo
 4uSSMqgo5zO+Qq2E0MWgyMtHm8GoRE/B6fX7VROUSbp9rHM/O7sPQro18+7cDBPkLb
 wji0k83/NgY+VXNXEhA2qHIjXyYYSlfytwFPHSO0x7FKeZTHwmZa9iGYnhTDkyxHC1
 5FayGFZRLqxDw==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 2/2] dma-buf/dma-fence: Unify return codes for signalled fences
Date: Tue, 25 Nov 2025 11:44:44 +0100
Message-ID: <20251125104443.82974-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125104443.82974-2-phasta@kernel.org>
References: <20251125104443.82974-2-phasta@kernel.org>
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

Almost all users of dma_fence_signal() ignore the return code which
would indicate that the fence was already signaled. The same return code
by dma_fence_add_callback() cannot be ignored, however, because it's
needed to detect races.

For an already signaled fence, dma_fence_signal() returns -EINVAL,
whereas dma_fence_add_callback() returns -ENOENT.

Unify the error codes by having dma_fence_signal() return -ENOENT, too.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 3a48896ded62..09d97624e647 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -373,7 +373,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 	lockdep_assert_held(fence->lock);
 
 	if (unlikely(__dma_fence_is_signaled(fence)))
-		return -EINVAL;
+		return -ENOENT;
 
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
-- 
2.49.0

