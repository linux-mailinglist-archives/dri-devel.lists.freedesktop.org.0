Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD35965D3AB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 14:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1D110E1C6;
	Wed,  4 Jan 2023 13:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892A710E0B0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 13:03:17 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A4696602D15;
 Wed,  4 Jan 2023 13:03:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672837396;
 bh=3maEX1d1f8xpnzpb1QQTbDCOTjvxdkWQfrmVFNuBow8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WQopY4GD3X5+VIKxrY00APt97BC9fewByqqeQsOkpzQPV5251PPQK2qyuvsNHRPI0
 Mmge1dFVqUW4Nv5IOtZ3bAlC6BxpqQ0o3ZHZq3rFobxAH+2qoWOHpKEuG9NRQIC3ge
 0G7WzGdhzB7xfEz4vx2UEytessV+AITbVh0CBuQd3mC5ka4/SrnwnKdjUFhvw/Vo/3
 EWiYt0E7FR13J2UPPxIAXKA+VuGLgN5VHXHuF+R0mzAsniw1OiLgqpDjdVE3XSI4RE
 697Pm+DGyj2rlkoEGZugwcDCdI1QSYALit4e+HwAfRXCk58sI+yS7Q8CnC/QL1awbG
 gnTyqtix/vovQ==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH RFC 3/4] drm/panfrost: Add a helper to retrieve MMU context
 stats
Date: Wed,  4 Jan 2023 14:03:07 +0100
Message-Id: <20230104130308.3467806-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104130308.3467806-1-boris.brezillon@collabora.com>
References: <20230104130308.3467806-1-boris.brezillon@collabora.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For now we only gather a few memory usage stats that we'll expose
through fdinfo, but this can be extended if needed.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_mmu.h | 10 ++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 454799d5a0ef..80c6e0e17195 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -435,6 +435,31 @@ addr_to_mapping(struct panfrost_device *pfdev, int as, u64 addr)
 	return mapping;
 }
 
+void panfrost_mmu_get_stats(struct panfrost_mmu *mmu,
+			    struct panfrost_mmu_stats *stats)
+{
+	struct drm_mm_node *node;
+
+	memset(stats, 0, sizeof(*stats));
+
+	spin_lock(&mmu->mm_lock);
+	drm_mm_for_each_node(node, &mmu->mm) {
+		struct panfrost_gem_mapping *mapping;
+		struct panfrost_gem_object *bo;
+
+		mapping = container_of(node, struct panfrost_gem_mapping, mmnode);
+		bo = mapping->obj;
+
+		stats->all += bo->base.base.size;
+		stats->resident += bo->resident_size;
+		if (bo->base.madv > 0)
+			stats->purgeable += bo->resident_size;
+		if (bo->base.base.dma_buf)
+			stats->shared += bo->base.base.size;
+	}
+	spin_unlock(&mmu->mm_lock);
+}
+
 #define NUM_FAULT_PAGES (SZ_2M / PAGE_SIZE)
 
 static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/panfrost/panfrost_mmu.h
index cc2a0d307feb..bbffd39deaf3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
@@ -8,6 +8,13 @@ struct panfrost_gem_mapping;
 struct panfrost_file_priv;
 struct panfrost_mmu;
 
+struct panfrost_mmu_stats {
+	u64 all;
+	u64 resident;
+	u64 purgeable;
+	u64 shared;
+};
+
 int panfrost_mmu_map(struct panfrost_gem_mapping *mapping);
 void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping);
 
@@ -22,4 +29,7 @@ struct panfrost_mmu *panfrost_mmu_ctx_get(struct panfrost_mmu *mmu);
 void panfrost_mmu_ctx_put(struct panfrost_mmu *mmu);
 struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev);
 
+void panfrost_mmu_get_stats(struct panfrost_mmu *mmu,
+			    struct panfrost_mmu_stats *stats);
+
 #endif
-- 
2.38.1

