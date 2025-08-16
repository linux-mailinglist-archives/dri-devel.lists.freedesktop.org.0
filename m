Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37703B28B97
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 09:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1833910E2E7;
	Sat, 16 Aug 2025 07:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="F/nRtus4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C8E10E2E7;
 Sat, 16 Aug 2025 07:50:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755330596; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SnNrqvFDzgNV5KJ3LbmREpj4lP9rVFATsmMgKcd5J68M27/MoPHtT1SufEGnPkBJqpMIdhu1Ghoat3wRlZwt8HVBVFTxAnAuL3fb/JrwFOjFUXRZTtmuSDmlzT8qgpTsxGKXtQ1SklhLmE0dTyqT1ueCenM04Q6X2D4xZfhSpww=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755330596;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=JoRCF6ssZwmH7R938xLhOJLH6I8iPbEeE3FkzT0OL4I=; 
 b=d79zLvaW2ZE1XwPjonVBq98wiOfcPe4rvQGgUqzGsrMt7PboLu3xda7vViUhokeLNfv+UdM+AoaHpXQzKqACD2vbCy44bpD5ZicNVeRwk+xAAcFn/uzlA0f8Sq/Cbb33jDqXLpNge0UPMlK0JWhzrUcTsfoc9KR8zP42AfXI3fk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755330596; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=JoRCF6ssZwmH7R938xLhOJLH6I8iPbEeE3FkzT0OL4I=;
 b=F/nRtus4XTVwvujBNyWX5E0zTKi12Rm8SQlz4pKqTnKxKqisCqwDQ5UQHJ8wnrQ8
 9BwJrnuRGWtwHNqQ4j4/VvBYRmFaOrZs4sCP5DJLgejTMUJ/3vUnQ7onShVqht9pzd/
 wncsAgwvSGs8g5eONFnoRHylwa8i/nVgrovAo98bnVGlDRkjY+XgmxA2zyXzsfT4/GI
 nfwgzynMpucRQ07lipj+Ul+sTAHjAgzeH4Vxo6DfxTWs16vPdL63IYD2R6YJfdnJP+h
 rugoHM1Sgb+dC9rjhYjTk82Eu8Mku41p/8s42rRJ1dK3s49unqnWDV+Ll3ORsiqvQfD
 UuE8TmImww==
Received: by mx.zohomail.com with SMTPS id 1755330593074146.76093361763662;
 Sat, 16 Aug 2025 00:49:53 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 5/7] drm/etnaviv: prepare for shared_context support for
 iommuv2
Date: Sat, 16 Aug 2025 15:47:55 +0800
Message-ID: <20250816074757.2559055-6-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816074757.2559055-1-uwu@icenowy.me>
References: <20250816074757.2559055-1-uwu@icenowy.me>
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
2.50.1

