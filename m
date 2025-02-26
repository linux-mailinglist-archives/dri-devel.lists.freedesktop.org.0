Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C0EA469C5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 19:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DA410E216;
	Wed, 26 Feb 2025 18:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="TvS8Ydr0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6360710E1E3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:31:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740594658; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OBPimUTTbJBUcZAEnuh+cmcaTAV2uh4S0GfhqH0E3lwRa1DLcygCvHtoEDfir4HtkYeskCeTrFSW9kD77PYKj8q1WzLEvn4hM2vqtp7nbNSUPohSvm/xw81wv24gqead5FDv1mluu5ztURdN6RxfAXzkwctkctdxdQGgODznwyk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740594658;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=YY9UB9QqJl0T5xiBriz83/LgyNLSUl2IzTYyotSKQJk=; 
 b=a9J21SMWWqYZWxiXeImHc32/jOu55Foz9TI71hCK6ADNeFNobPaXc/dxY81rLLz//pCcradDI/DKW6ASE6BDiWkC+WSvVuC1uLS3tuo05/WIUINUibt1Sth7XI8yY+9+Ea9VGsMT2PoNX/CrD8jTGFDZZUfftDSsIiWoBwCcIRg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740594658; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=YY9UB9QqJl0T5xiBriz83/LgyNLSUl2IzTYyotSKQJk=;
 b=TvS8Ydr0cz4jT0AOGYFPH97WmfRbhdbNaEjOIaBtG2xWsHaOZfO/YJKEHU5lc0Rv
 yFB8wNUoR43Ri9V7WGKMxn4ACsMmKgQcrA0W+bMR+X8V2EXtIGouQX3p6oA0XSu+tKy
 gqRfaVCEZDM9r+Od+fU9KMBirfQ0It0dsJv5yNQU=
Received: by mx.zohomail.com with SMTPS id 1740594655428919.8263975363499;
 Wed, 26 Feb 2025 10:30:55 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [RFC PATCH 1/4] drm/panfrost: Use GPU_MMU_FEATURES_VA_BITS/PA_BITS
 macros
Date: Wed, 26 Feb 2025 15:30:40 -0300
Message-ID: <20250226183043.140773-2-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
References: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
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

As done in panthor, define and use these GPU_MMU_FEATURES_* macros,
which makes code easier to read and reuse.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c  | 6 ++++--
 drivers/gpu/drm/panfrost/panfrost_regs.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index b91019cd5acb..7df2c8d5b0ae 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -615,6 +615,8 @@ static void panfrost_drm_mm_color_adjust(const struct drm_mm_node *node,
 
 struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
 {
+	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(pfdev->features.mmu_features);
+	u32 pa_bits = GPU_MMU_FEATURES_PA_BITS(pfdev->features.mmu_features);
 	struct panfrost_mmu *mmu;
 
 	mmu = kzalloc(sizeof(*mmu), GFP_KERNEL);
@@ -633,8 +635,8 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
 
 	mmu->pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= SZ_4K | SZ_2M,
-		.ias		= FIELD_GET(0xff, pfdev->features.mmu_features),
-		.oas		= FIELD_GET(0xff00, pfdev->features.mmu_features),
+		.ias		= va_bits,
+		.oas		= pa_bits,
 		.coherent_walk	= pfdev->coherent,
 		.tlb		= &mmu_tlb_ops,
 		.iommu_dev	= pfdev->dev,
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index c7bba476ab3f..b5f279a19a08 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -16,6 +16,8 @@
 #define   GROUPS_L2_COHERENT		BIT(0)	/* Cores groups are l2 coherent */
 
 #define GPU_MMU_FEATURES		0x014	/* (RO) MMU features */
+#define  GPU_MMU_FEATURES_VA_BITS(x)	((x) & GENMASK(7, 0))
+#define  GPU_MMU_FEATURES_PA_BITS(x)	(((x) >> 8) & GENMASK(7, 0))
 #define GPU_AS_PRESENT			0x018	/* (RO) Address space slots present */
 #define GPU_JS_PRESENT			0x01C	/* (RO) Job slots present */
 
-- 
2.47.2

