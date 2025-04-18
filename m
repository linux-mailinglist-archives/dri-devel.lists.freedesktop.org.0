Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE190A93B2C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 18:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D29010E22D;
	Fri, 18 Apr 2025 16:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hN6DalVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F3010E22D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xLAK2xXuZaAsgmHtoJ/XCuqujdUf3BOf63ZnuLjhSW4=; b=hN6DalVXtLwZcqRM5bk645weBw
 kR2OPHBFXwhr2Yozl07+z3lazhPQxbhjzq77spydzpCsQGL+ENuTEXYQUb45gYtfbBKLfynoG4SY4
 oWl9aPPAiduCeKV6dtZ8N9knQsyY91akhyXPDEpyijYcQr7DbcnapX2eJEUEZu1J5/w/b1eqw974C
 pM3JJMvR3xrKqRWXd369lodseMWBDRsEGtGbXsDVlxrKBnE4eO4k1vIqGPsgrw7zXCll9M+cZYdZ1
 eRTretr4C60X4FsFTgBzz6u6I3ee6rz/czsvaZl0KPjjjv9C51BcVZOIC10arFDhlGAVmpmChlXd/
 kEUziTxg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u5ono-001Hbt-NR; Fri, 18 Apr 2025 18:42:56 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC 2/4] dma-fence: Slightly safer dma_fence_set_deadline
Date: Fri, 18 Apr 2025 17:42:44 +0100
Message-ID: <20250418164246.72426-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
References: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
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

Similar to the previous patch lets precede the fence->ops dereference with
the signaled check. This reduces the window to hit the race where sync
file can get into a signaled DRM scheduler fence which was left "dangling"
after the driver had potentially torn down the corresponding internal
state.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f0cdd3e99d36..b3f085a65910 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -968,7 +968,7 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
  */
 void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 {
-	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
+	if (!dma_fence_is_signaled(fence) && fence->ops->set_deadline)
 		fence->ops->set_deadline(fence, deadline);
 }
 EXPORT_SYMBOL(dma_fence_set_deadline);
-- 
2.48.0

