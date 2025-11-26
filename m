Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B001BC89175
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A385310E590;
	Wed, 26 Nov 2025 09:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="edhOiOc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1903410E58C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764150639;
 bh=FWOQUkW4kdNa9gfuRLUMNrYDRLGTAbNG/SFwqMDOmwY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=edhOiOc0uHD1Mc+ZGpdIOaBn2Ivo7xQunfH1wo5sKinXvqbWZTJMQHW0gkYi3fhtW
 GOkdGpnTHGZ/Iw1aMzxs4rMIX0mUi5MKPpw1z7Yrcl+BAjIaOuT9NL2tJrWTul3psB
 hEe6x7Hz2H/rmV+0HtAzVcIOQf1rxAGLJmFsvkoYghdWz44GAzEkXCXPN1TzGTRLEe
 a8ApJVm5lgIKUU9eAkVW6OmvdpqrWfpPwgq68P8yeS4Jhs2ay50Lxo73MbPnQYEXmK
 3WeJ/Ne9luI0rTRsRRZpVBE7AUk+HK9HiLHtP7i2a4dwtXrFBlN3WxL7duYfq7RA2z
 J1n+LOBorrmmA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 609CD17E12E2;
 Wed, 26 Nov 2025 10:50:39 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
Subject: [PATCH v3 2/6] drm/panthor: Kill lock_region()
Date: Wed, 26 Nov 2025 10:50:25 +0100
Message-ID: <20251126095029.3579267-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126095029.3579267-1-boris.brezillon@collabora.com>
References: <20251126095029.3579267-1-boris.brezillon@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The meat in lock_region() is about packing a region range into a
single u64. The rest is just a regular reg write plus a
as_send_cmd_and_wait() call that can easily be inlined in
mmu_hw_do_operation_locked().

v2:
- New patch

v3:
- Don't LOCK is the region has a zero size

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 186048fc2c25..752d88e61aec 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -538,14 +538,12 @@ static int as_send_cmd_and_wait(struct panthor_device *ptdev, u32 as_nr, u32 cmd
 	return status;
 }
 
-static int lock_region(struct panthor_device *ptdev, u32 as_nr,
-		       u64 region_start, u64 size)
+static u64 pack_region_range(struct panthor_device *ptdev, u64 region_start, u64 size)
 {
 	u8 region_width;
-	u64 region;
 	u64 region_end = region_start + size;
 
-	if (!size)
+	if (drm_WARN_ON_ONCE(&ptdev->base, !size))
 		return 0;
 
 	/*
@@ -565,11 +563,7 @@ static int lock_region(struct panthor_device *ptdev, u32 as_nr,
 	 */
 	region_start &= GENMASK_ULL(63, region_width);
 
-	region = region_width | region_start;
-
-	/* Lock the region that needs to be updated */
-	gpu_write64(ptdev, AS_LOCKADDR(as_nr), region);
-	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_LOCK);
+	return region_width | region_start;
 }
 
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
@@ -581,6 +575,9 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 
 	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
 
+	if (!size)
+		return 0;
+
 	switch (op) {
 	case AS_COMMAND_FLUSH_MEM:
 		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
@@ -602,7 +599,10 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	 * power it up
 	 */
 
-	ret = lock_region(ptdev, as_nr, iova, size);
+	/* Lock the region that needs to be updated */
+	gpu_write64(ptdev, AS_LOCKADDR(as_nr),
+		    pack_region_range(ptdev, iova, size));
+	ret = as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_LOCK);
 	if (ret)
 		return ret;
 
-- 
2.51.1

