Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10FBA7B897
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 10:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468DB10EAD2;
	Fri,  4 Apr 2025 08:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qiz8JTNw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF4610EB85
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 08:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743754176;
 bh=/l80GE4l0zkzq350oXLbwk4DWrgEoPFJpZDPEgdLtRk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qiz8JTNwq0a3aj7OoR8dEdW8X7NdXduKal3ZoLP47pRckcj8DONX/gh+H8dWQStpd
 7y1AS2Lj9odCvYWxaCsa+I5mCkxrxIMhe5Qjvxrv/vY0itnIvSKtyb5sfecuMzCh0/
 qbuDY6ubAMSmjGLFvIATHOFxZAaerL7fWa6BDBaxhB1qy6nPnSWc2oH/1UdSvwb0kS
 4691r7c+kkvJ6p/m4CHBRT8ZzGlOhHAd5mr+w6clIgMI6Z5O7bLOSt8YRSh6Rx5v31
 ejm2JFRswodee1VSZiMKytj44/0YUFITZHwyBKtpRAPjAbFkW9lTLSEWRVLVCT0Kss
 KW/4VsGc4F2cw==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9060317E1017;
 Fri,  4 Apr 2025 10:09:36 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 3/5] drm/panthor: Update panthor_mmu::irq::mask when needed
Date: Fri,  4 Apr 2025 10:09:31 +0200
Message-ID: <20250404080933.2912674-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404080933.2912674-1-boris.brezillon@collabora.com>
References: <20250404080933.2912674-1-boris.brezillon@collabora.com>
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

When we clear the faulty bits in the AS mask, we also need to update
the panthor_mmu::irq::mask field otherwise our IRQ handler won't get
called again until the GPU is reset.

Changes in v2:
- Add Liviu's R-b

Changes in v3:
- Add Steve's R-b

Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 12a02e28f50f..7cca97d298ea 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -781,6 +781,7 @@ int panthor_vm_active(struct panthor_vm *vm)
 	if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as)) {
 		gpu_write(ptdev, MMU_INT_CLEAR, panthor_mmu_as_fault_mask(ptdev, as));
 		ptdev->mmu->as.faulty_mask &= ~panthor_mmu_as_fault_mask(ptdev, as);
+		ptdev->mmu->irq.mask |= panthor_mmu_as_fault_mask(ptdev, as);
 		gpu_write(ptdev, MMU_INT_MASK, ~ptdev->mmu->as.faulty_mask);
 	}
 
-- 
2.49.0

