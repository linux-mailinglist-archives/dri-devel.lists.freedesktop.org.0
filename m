Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B62977E75
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 13:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D1F10E170;
	Fri, 13 Sep 2024 11:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Pudgir7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B6E10E170
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 11:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1726226845;
 bh=en8re2uW73eYoZm7yd2dyxyvT6vHkRIsHE+c+urBGBw=;
 h=From:To:Cc:Subject:Date:From;
 b=Pudgir7NY7DQOErNWClj4CZ+SKvXoK1c6VUMZUagyU4di/FSmfY2wDtwzstykbn1x
 Z5pfhqPIhxpJmPlCDFEUoRxXyS9nDIpmjJrekSi0dxmbLouBX4EF0qxIoJuSn6n6PI
 HOGRgT0RrwUS7pLtqWGQj6UX+4FApS9PIAaqoHy4638i3nWB0xOD6RH2MmUl1I17bv
 IMeJBslj7vvcJhlcHFoE0JH6IisbMXIhz4vtsQCENZQ8cWROIGkvU6B0K2PIljJaiq
 MzJjVh4BBsRDYSPwtX5Unup+c3GsNOFHBNFPpR3bSwMiHGU/08dlofBPh5md5PQ0i1
 Pzr5aY+xclO3w==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 78D8A17E1097;
 Fri, 13 Sep 2024 13:27:25 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH] drm/panthor: Lock the VM resv before calling
 drm_gpuvm_bo_obtain_prealloc()
Date: Fri, 13 Sep 2024 13:27:22 +0200
Message-ID: <20240913112722.492144-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.0
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

drm_gpuvm_bo_obtain_prealloc() will call drm_gpuvm_bo_put() on our
pre-allocated BO if the <BO,VM> association exists. Given we
only have one ref on preallocated_vm_bo, drm_gpuvm_bo_destroy() will
be called immediately, and we have to hold the VM resv lock when
calling this function.

Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 37f1885c54c7..aa12ed2acfcf 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1251,9 +1251,17 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 		goto err_cleanup;
 	}
 
+	/* drm_gpuvm_bo_obtain_prealloc() will call drm_gpuvm_bo_put() on our
+	 * pre-allocated BO if the <BO,VM> association exists. Given we
+	 * only have one ref on preallocated_vm_bo, drm_gpuvm_bo_destroy() will
+	 * be called immediately, and we have to hold the VM resv lock when
+	 * calling this function.
+	 */
+	dma_resv_lock(panthor_vm_resv(vm), NULL);
 	mutex_lock(&bo->gpuva_list_lock);
 	op_ctx->map.vm_bo = drm_gpuvm_bo_obtain_prealloc(preallocated_vm_bo);
 	mutex_unlock(&bo->gpuva_list_lock);
+	dma_resv_unlock(panthor_vm_resv(vm));
 
 	/* If the a vm_bo for this <VM,BO> combination exists, it already
 	 * retains a pin ref, and we can release the one we took earlier.
-- 
2.46.0

