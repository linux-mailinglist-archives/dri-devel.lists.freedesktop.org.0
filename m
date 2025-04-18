Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F4DA93B2D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 18:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8DA88284;
	Fri, 18 Apr 2025 16:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nKrVR1xf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE14A10E227
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 16:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4WPfSXeAEODr1AUUK9CaRpGZT0pWQlVpRkQ4IxPlesM=; b=nKrVR1xfEAqqjQabN8+82G1MPp
 7lUJRfjrEKaJcnLpwqpShPqUOSViQmIdqFhsk0vG3SZQT/7jtEBjmD9aSi9mw5lWJ3Nn0SzDq+k9W
 fonlDsf3kULz+5Tws1qnVK47GPx3gYJlCeACIdvC4+CLY9km15ltdrL4Un1Yk32UnkGp1HZA95dKZ
 kF5Ocno4Ie6r/BzpWfCrE9tAUijObwb+AnaVLbU5H+kvwqwU/cqMLV5Q2kHkyaJL2ncqekD0jhNFJ
 qfVM8GwGUKHVCaj2sHaMQPdRFBjSFKpdeGoFseqSAV4luOe/tcz2orkT/ABTp5jKTHFmbfnHwKYSQ
 //ukr+eQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u5onq-001Hc7-5M; Fri, 18 Apr 2025 18:42:58 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC 4/4] drm/xe: Keep module reference while there are active fences
Date: Fri, 18 Apr 2025 17:42:46 +0100
Message-ID: <20250418164246.72426-5-tvrtko.ursulin@igalia.com>
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

Continuing the theme from previous patches. This time round we deal with
the problem that it is possible to unbind the driver from the PCI device
with an active sync file fence.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 0b4f12be3692..209ed6ca78d9 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -37,7 +37,16 @@ void xe_hw_fence_module_exit(void)
 
 static struct xe_hw_fence *fence_alloc(void)
 {
-	return kmem_cache_zalloc(xe_hw_fence_slab, GFP_KERNEL);
+	struct xe_hw_fence *fence;
+
+	if (!try_module_get(THIS_MODULE))
+		return NULL;
+
+	fence = kmem_cache_zalloc(xe_hw_fence_slab, GFP_KERNEL);
+	if (!fence)
+		module_put(THIS_MODULE);
+
+	return fence;
 }
 
 static void fence_free(struct rcu_head *rcu)
@@ -189,6 +198,7 @@ static void xe_hw_fence_release(struct dma_fence *dma_fence)
 
 	XE_WARN_ON(!list_empty(&fence->irq_link));
 	call_rcu(&dma_fence->rcu, fence_free);
+	module_put(THIS_MODULE);
 }
 
 static const struct dma_fence_ops xe_hw_fence_ops = {
@@ -235,6 +245,7 @@ struct dma_fence *xe_hw_fence_alloc(void)
 void xe_hw_fence_free(struct dma_fence *fence)
 {
 	fence_free(&fence->rcu);
+	module_put(THIS_MODULE);
 }
 
 /**
-- 
2.48.0

