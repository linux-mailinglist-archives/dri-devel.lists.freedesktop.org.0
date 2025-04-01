Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78ABA7820B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 20:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BC710E655;
	Tue,  1 Apr 2025 18:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lvyJUU/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DC810E5E6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 18:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743531836;
 bh=HNbAGj/oEaI6L0eOcJmWhu3wfxz+X6mSWO/ZBruvTho=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lvyJUU/KaZdGHpS1a4vJ24jpGt/hwh1lSz2dPgCPUMB2atN1kShNYHC7WU9jAtSDa
 aiyt4JBGH88WAH/RpG+XFsRm+Dk5a4tTDAZqd4KZaITGUkl/9CaGisuCwhOULps44a
 70n3uaonRXlf2v5e01l8QfvhPuQCjFLq/xJBQr/B4B8JJPAnz4QUaYfeAwKrYvUp92
 ElMn0SDo+dXYrsMW5HerFG9StVTnWMjrEURbh1uDgEfTsY5fezjHynvm09f2J4s1OO
 t9zR5L9+6M7AfsPVwMMy3lKSzb7i/HXZWAKe+EAPZekfbKi5MFcCE/5Ag7T1Cu0pxl
 u1b8bwmibxluA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8767517E0FCC;
 Tue,  1 Apr 2025 20:23:56 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 5/5] drm/panthor: Don't update MMU_INT_MASK in
 panthor_mmu_irq_handler()
Date: Tue,  1 Apr 2025 20:23:48 +0200
Message-ID: <20250401182348.252422-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401182348.252422-1-boris.brezillon@collabora.com>
References: <20250401182348.252422-1-boris.brezillon@collabora.com>
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

Interrupts are automatically unmasked in
panthor_mmu_irq_threaded_handler() when the handler returns. Unmasking
prematurely might generate spurious interrupts if the IRQ line is
shared.

Changes in v2:
- New patch

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 4ac95a31907d..7a7993016314 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1719,7 +1719,6 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		 * re-enabled.
 		 */
 		ptdev->mmu->irq.mask = new_int_mask;
-		gpu_write(ptdev, MMU_INT_MASK, new_int_mask);
 
 		if (ptdev->mmu->as.slots[as].vm)
 			ptdev->mmu->as.slots[as].vm->unhandled_fault = true;
-- 
2.49.0

