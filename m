Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD3A775C2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 09:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F88310E508;
	Tue,  1 Apr 2025 07:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="feGbwsMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB0510E508
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743494235;
 bh=JWRGpYm56b0dG3DBf290K/7ZlqNJXjrkyeJZihqgQoM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=feGbwsMndh3Eawigq4Y274q6vEIcojITVmTBYB7R79TLgLENbq405dAOUKkSRhCSz
 T5aBz+IxRHIdC7PqmsCiZrLbOaRsbKEyI5cGPFNo3IZdw8LjkX7/jamA8qlR76cjX1
 9pq0P3Z/rjDayxumk4oy5iN6BPRPm53sY74TWRz5OF7m06xl0sKeAIoqanyR4T2fMa
 qG/jrzIBUKBqqwOS0OG3tCpdXsuxHjgVhbjrb4zC5bqynprZZv+Vvvy4ETQ0OomZXF
 spgphKugBv5mmB9Zwa6suLZihpDIyUlOksnPOJ3Vvmp8Ih/eqUbANHmCfFBXZpNR6W
 YIxPX05us45+A==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0253F17E0FAF;
 Tue,  1 Apr 2025 09:57:14 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH 2/3] drm/panthor: Update panthor_mmu::irq::mask when needed
Date: Tue,  1 Apr 2025 09:57:09 +0200
Message-ID: <20250401075710.2638950-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401075710.2638950-1-boris.brezillon@collabora.com>
References: <20250401075710.2638950-1-boris.brezillon@collabora.com>
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

Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
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
2.48.1

