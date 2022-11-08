Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3417621A05
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C2710E4C7;
	Tue,  8 Nov 2022 17:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB6DD10E4C7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:06:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 239B01FB;
 Tue,  8 Nov 2022 09:06:34 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F308E3F703;
 Tue,  8 Nov 2022 09:06:26 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: robh@kernel.org,
	tomeu.vizoso@collabora.com,
	steven.price@arm.com
Subject: [PATCH] drm/panfrost: Split io-pgtable requests properly
Date: Tue,  8 Nov 2022 17:06:19 +0000
Message-Id: <49e54bb4019cd06e01549b106d7ac37c3d182cd3.1667927179.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.36.1.dirty
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
Cc: linux-arm-kernel@lists.infradead.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Although we don't use 1GB block mappings, we still need to split
map/unmap requests at 1GB boundaries to match what io-pgtable expects.
Fix that, and add some explanation to make sense of it all.

Fixes: 3740b081795a ("drm/panfrost: Update io-pgtable API")
Reported-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
The previous diff turned out to be not quite right, so I've not
included Dmitry's Tested-by given for that.
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index e246d914e7f6..4e83a1891f3e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -250,13 +250,22 @@ void panfrost_mmu_reset(struct panfrost_device *pfdev)
 
 static size_t get_pgsize(u64 addr, size_t size, size_t *count)
 {
+	/*
+	 * io-pgtable only operates on multiple pages within a single table
+	 * entry, so we need to split at boundaries of the table size, i.e.
+	 * the next block size up. The distance from address A to the next
+	 * boundary of block size B is logically B - A % B, but in unsigned
+	 * two's complement where B is a power of two we get the equivalence
+	 * B - A % B == (B - A) % B == (n * B - A) % B, and choose n = 0 :)
+	 */
 	size_t blk_offset = -addr % SZ_2M;
 
 	if (blk_offset || size < SZ_2M) {
 		*count = min_not_zero(blk_offset, size) / SZ_4K;
 		return SZ_4K;
 	}
-	*count = size / SZ_2M;
+	blk_offset = -addr % SZ_1G ?: SZ_1G;
+	*count = min(blk_offset, size) / SZ_2M;
 	return SZ_2M;
 }
 
-- 
2.36.1.dirty

