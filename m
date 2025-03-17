Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8DEA65469
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 15:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95E910E419;
	Mon, 17 Mar 2025 14:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="CuOvvq35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6480510E41A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:55:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742223287; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OTSg/VC2IGga6wDSSNvyVK/Xmjg+hUW1YRb4w27FyEinA0QlN0hozBlg4TTygJdO6DZGMhhOeDCCLlZPDJJUbjqrsW/SyWP5ha3XilYHFoow4eqt2uO1HB5ZNHFjENmBXo2rLpe0xN9qlpMvILg6gbyOuwzwEyuq2GWUmdqjA4E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742223287;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/36wnDksYJenqr18EDga6w9FrfsLJVGTJJNpjssiTcY=; 
 b=H2zA7WCgXkM2Cezbua7rNecG0myfsyvSL6R6GFlvEVhZzYw70lCf6QQqbE/l+sczZoTSQeeeWUtFJ35aO/WnNZZV+JgO388TOIzT8b/5W5N0pjab6+s6pL81Fp/tjcZvLV7Q8jvIE1lKDQkHJAFhemgXc56OCMuH6wEcBYEM4p8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742223287; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=/36wnDksYJenqr18EDga6w9FrfsLJVGTJJNpjssiTcY=;
 b=CuOvvq35QjzOPELMyDcL4nxs1MfcloU97Xivbii8B68wmIhiERaYHjtbqopQhMHR
 3ZFYk9D9y9eyiOBACh6sJfAXG1CLevr7/cdRQHoVcdgDdJy3tL052v28bT3GXxjljsG
 i5gf3NwWHdDr144Ov9ZYYbZ7N/ALXxdbyIXhancA=
Received: by mx.zohomail.com with SMTPS id 1742223283714299.71380915725615;
 Mon, 17 Mar 2025 07:54:43 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v4 2/6] drm/panfrost: Use GPU_MMU_FEATURES_VA_BITS/PA_BITS
 macros
Date: Mon, 17 Mar 2025 11:52:41 -0300
Message-ID: <20250317145245.910566-3-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
References: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
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
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c  | 6 ++++--
 drivers/gpu/drm/panfrost/panfrost_regs.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 9e6f198ef5c1b..294f86b3c25e7 100644
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
index c7bba476ab3f3..b5f279a19a084 100644
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

