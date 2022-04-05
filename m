Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 807D14F370A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B5810E274;
	Tue,  5 Apr 2022 14:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A32610E274
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 14:11:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F15B323A;
 Tue,  5 Apr 2022 07:11:22 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 441513F5A1;
 Tue,  5 Apr 2022 07:11:22 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: liviu.dudau@arm.com,
	brian.starkey@arm.com
Subject: [PATCH] drm/arm/malidp: Stop using iommu_present()
Date: Tue,  5 Apr 2022 15:11:18 +0100
Message-Id: <5049994e6c2ba92c2f30d51850c8929136d0f8ca.1649167878.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
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
Cc: iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

iommu_get_domain_for_dev() is already perfectly happy to return NULL
if the given device has no IOMMU. Drop the unnecessary check.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/arm/malidp_planes.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 0562bdaac00c..81d9f5004025 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -310,17 +310,13 @@ static int malidp_se_check_scaling(struct malidp_plane *mp,
 
 static u32 malidp_get_pgsize_bitmap(struct malidp_plane *mp)
 {
-	u32 pgsize_bitmap = 0;
+	struct iommu_domain *mmu_dom;
 
-	if (iommu_present(&platform_bus_type)) {
-		struct iommu_domain *mmu_dom =
-			iommu_get_domain_for_dev(mp->base.dev->dev);
+	mmu_dom = iommu_get_domain_for_dev(mp->base.dev->dev);
+	if (mmu_dom)
+		return mmu_dom->pgsize_bitmap;
 
-		if (mmu_dom)
-			pgsize_bitmap = mmu_dom->pgsize_bitmap;
-	}
-
-	return pgsize_bitmap;
+	return 0;
 }
 
 /*
-- 
2.28.0.dirty

