Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179C3C89F8A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 14:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEAD10E5EA;
	Wed, 26 Nov 2025 13:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KLN6C2Wx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572D510E5EA;
 Wed, 26 Nov 2025 13:20:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3CB1044346;
 Wed, 26 Nov 2025 13:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D077C113D0;
 Wed, 26 Nov 2025 13:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764163221;
 bh=MN344wm2Ixu5X6Egt125oaRBPXXL6wOJJ8cpucZ04iA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KLN6C2WxyaGLUphoRIvUajESUcR/xNOR+7fMO/ABWSP+mXxmpoAAqQVtXfRLExvTc
 SHrYcieFx+oJIAIIpPsikBV7AlKohQDi3P3L9XlfRc/R0rQyx3hXhfkOxgi1TVkpGR
 vu3+lvtFLZrjiqNSZ3DSkk7SvXT2C7IGLmlY7IAE/e2YBZHik2G2uG86XzNj3goi7q
 oFQqGbp0EeUdB7hxktU5GTHGrf4Ugn2d6Z/GlxFvP8yVotOajkcvYV+PercoshxZqo
 QMnkU/DrukJ2Zqfh5CB4FFW5NbPNqCHSZez5AxeD+gRPeP6pPbCCSHSjlPCt/IGkrw
 38tlRKl6OYtRA==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 3/6] drm/gpu/xe: Ignore dma_fenc_signal() return code
Date: Wed, 26 Nov 2025 14:19:12 +0100
Message-ID: <20251126131914.149445-5-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251126131914.149445-2-phasta@kernel.org>
References: <20251126131914.149445-2-phasta@kernel.org>
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

The return code of dma_fence_signal() is not really useful as there is
nothing reasonable to do if a fence was already signaled. That return
code shall be removed from the kernel.

Ignore dma_fence_signal()'s return code.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index b2a0c46dfcd4..959b30dde724 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
 {
 	struct xe_hw_fence *fence, *next;
 	unsigned long flags;
-	int err;
 	bool tmp;
 
 	if (XE_WARN_ON(!list_empty(&irq->pending))) {
@@ -93,9 +92,9 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
 		spin_lock_irqsave(&irq->lock, flags);
 		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
 			list_del_init(&fence->irq_link);
-			err = dma_fence_signal_locked(&fence->dma);
+			XE_WARN_ON(dma_fence_test_signaled_flag(&fence->dma));
+			dma_fence_signal_locked(&fence->dma);
 			dma_fence_put(&fence->dma);
-			XE_WARN_ON(err);
 		}
 		spin_unlock_irqrestore(&irq->lock, flags);
 		dma_fence_end_signalling(tmp);
-- 
2.49.0

