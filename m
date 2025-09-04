Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECACB4340F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CD110E99C;
	Thu,  4 Sep 2025 07:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="BC90s7RV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C854810E99C;
 Thu,  4 Sep 2025 07:33:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756971194; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BZ2ckkvb0Mq/f9c1jiZADoyv5zTkliUo8FpglhP6/2G3APPBMALSFcVOK0dE7N6G9Tz5PwrDmS3B09yezVvrMsK1CiOx6k8xD+ppNRYnNfpOVyhcUUh0IlfesNFQxwfTdL73Uq5LU8oTVc65PmnaGeif+Ix/j1HVTMiq7ebq9vo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756971194;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=oOmHUEYP4hvZPCCzkI8xwnbPllmMO5rCcbMG2UcPsWU=; 
 b=dKjjHLxpmlV+AQErGuosmw3ywwEIwu9+yxOjyQ/65UoKqsqkF5BSzMTPEIRZ6kbN8gLJYnO0pCfdsEJQDJDrhs5e/YrbjZo359pgNqkmE04/C3z49i18ACODR30wmwGATRM1ii5hJBlE3uhMiN+kksMC/lm4s5IgnZfnOfbqSUI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756971193; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=oOmHUEYP4hvZPCCzkI8xwnbPllmMO5rCcbMG2UcPsWU=;
 b=BC90s7RVYAKzOJVgDkT0v7rkNzL+dwoTYdVFyGPuRGwIdFzxN9YRIgI4iZEJVQA4
 J5+dXxsf7FTUMyheQWnnTeKtF96jlKcEMqolhJzeaHuLsHcceshPZKxUF3Q0vIBt2DJ
 OcF6yjGVpoRqGkC/0zXSQhdpn3D1Nqb27K5Y3Z3X60mWZPLtD0NqNdKRK50bbO7s6X+
 QWYw8iOFUBoFqyGyfZ7zfdRtirloLHIoGiAOcBP5G8UDko6uY0xGD7MBCgLm3EzYX+L
 knBCD028Z94p5WnILSwTUFF+d7xfBf/yz03oq9My0OdnT2FscBHnMuQ4Phi0oxuD2Xh
 BeeRR4qryA==
Received: by mx.zohomail.com with SMTPS id 1756971190990998.7721644912724;
 Thu, 4 Sep 2025 00:33:10 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 5/7] drm/etnaviv: prepare for shared_context support for
 iommuv2
Date: Thu,  4 Sep 2025 15:31:49 +0800
Message-ID: <20250904073151.686227-6-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904073151.686227-1-uwu@icenowy.me>
References: <20250904073151.686227-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

As we have some unfortunate GPUs with IOMMUv2 but broken PTA (reloading
a different page table at runtime always fails), shared_context is now
not a v1-only thing.

Move it out of the v1 struct in the union.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v2.

 drivers/gpu/drm/etnaviv/etnaviv_iommu.c |  8 ++++----
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h   | 22 +++++++---------------
 2 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
index afe5dd6a9925b..6fdce63b9971a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
@@ -39,7 +39,7 @@ static void etnaviv_iommuv1_free(struct etnaviv_iommu_context *context)
 	dma_free_wc(context->global->dev, PT_SIZE, v1_context->pgtable_cpu,
 		    v1_context->pgtable_dma);
 
-	context->global->v1.shared_context = NULL;
+	context->global->shared_context = NULL;
 
 	kfree(v1_context);
 }
@@ -136,8 +136,8 @@ etnaviv_iommuv1_context_alloc(struct etnaviv_iommu_global *global)
 	 * a stop the world operation, so we only support a single shared
 	 * context with this version.
 	 */
-	if (global->v1.shared_context) {
-		context = global->v1.shared_context;
+	if (global->shared_context) {
+		context = global->shared_context;
 		etnaviv_iommu_context_get(context);
 		mutex_unlock(&global->lock);
 		return context;
@@ -163,7 +163,7 @@ etnaviv_iommuv1_context_alloc(struct etnaviv_iommu_global *global)
 	mutex_init(&context->lock);
 	INIT_LIST_HEAD(&context->mappings);
 	drm_mm_init(&context->mm, GPU_MEM_START, PT_ENTRIES * SZ_4K);
-	context->global->v1.shared_context = context;
+	context->global->shared_context = context;
 
 	mutex_unlock(&global->lock);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
index 7f8ac01785474..2ec4acda02bc6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
@@ -49,21 +49,13 @@ struct etnaviv_iommu_global {
 
 	u32 memory_base;
 
-	/*
-	 * This union holds members needed by either MMUv1 or MMUv2, which
-	 * can not exist at the same time.
-	 */
-	union {
-		struct {
-			struct etnaviv_iommu_context *shared_context;
-		} v1;
-		struct {
-			/* P(age) T(able) A(rray) */
-			u64 *pta_cpu;
-			dma_addr_t pta_dma;
-			DECLARE_BITMAP(pta_alloc, ETNAVIV_PTA_ENTRIES);
-		} v2;
-	};
+	struct etnaviv_iommu_context *shared_context;
+	struct {
+		/* P(age) T(able) A(rray) */
+		u64 *pta_cpu;
+		dma_addr_t pta_dma;
+		DECLARE_BITMAP(pta_alloc, ETNAVIV_PTA_ENTRIES);
+	} v2;
 };
 
 struct etnaviv_iommu_context {
-- 
2.51.0

