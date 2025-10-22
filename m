Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C44BFD20F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 18:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B4510E809;
	Wed, 22 Oct 2025 16:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="HjoYVDdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BD410E80E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:21:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761150069; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lGCaflefZf9vW0sZUzl5R9DP8UEulwgyXUiaW+glHfUz31zKUpTCTtzJhn7nKRV0XYHMe7hwwkqRlSa6DNzkt2GWlia9O4YhjkvqdkVVK26uawqepgwLMmFOxxCjLnYK2zAf72kvwsYU66EU6Zi/alQaHMmDkjkIijxYYPMrAGU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761150069;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FdcrSneWicl1pfGMcZk6PTeqOTBE1QoowN6eLnXOcgU=; 
 b=H/uwlob0aAvM70DEBoKO/53Mu77vNhN7nV3svwqA6OZXj1Q6xieeknEwj66tK4ofB4Xf9p4A4IdPW5bZbAQvfXfcsKcAEkxBaitzg6enV8Di4F5cfOMwui4ZPwCgKiQyceNyTS3xXWS7PC/vy2LSLVcG9efvqFg04Lf/pbR8Bfs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761150068; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=FdcrSneWicl1pfGMcZk6PTeqOTBE1QoowN6eLnXOcgU=;
 b=HjoYVDdPhe2UO4MEseYlCzsf5PLSkSqmQ3FBRRpzmXJYnVSgD+EsF1o8xOmD2lBO
 QQW8K+SkhZYDmAJBDqyWPe+4t7rnakJ4ZJOOGeB85q9hxtMI7pc4+4efkg7d7kQPxYi
 5PV1jfVkEizK87x9AmLdRXkEczkClnEiczdwOHWE=
Received: by mx.zohomail.com with SMTPS id 1761150066573669.259808258432;
 Wed, 22 Oct 2025 09:21:06 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drm/rockchip: Set VOP for the DRM DMA device
Date: Wed, 22 Oct 2025 19:19:48 +0300
Message-ID: <20251022161948.199731-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.51.0
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

Use VOP for DMA operations performed by DRM core. Rockchip DRM driver
is backed by a virtual device that isn't IOMMU-capable, while VOP is the
actual display controller device backed by IOMMU. Fixes "swiotlb buffer
is full" warning messages originated from GEM prime code paths.

Note, that backporting is non-trivial as this depends on 143ec8d3f9396
("drm/prime: Support dedicated DMA device for dma-buf imports"), which
landed in v6.16 and 421be3ee36a4 ("drm/rockchip: Refactor IOMMU
initialisation"), which landed in v5.19.

Reported-by: Daniel Stone <daniels@collabora.com>
Fixes: 2048e3286f34 ("drm: rockchip: Add basic drm driver")
Cc: stable@vger.kernel.org # v6.16+
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index eb77bde9f628..e693160e9b7f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -96,6 +96,9 @@ void rockchip_drm_dma_init_device(struct drm_device *drm_dev,
 		private->iommu_dev = ERR_PTR(-ENODEV);
 	else if (!private->iommu_dev)
 		private->iommu_dev = dev;
+
+	if (!IS_ERR(private->iommu_dev))
+		drm_dev_set_dma_dev(drm_dev, private->iommu_dev);
 }
 
 static int rockchip_drm_init_iommu(struct drm_device *drm_dev)
-- 
2.51.0

