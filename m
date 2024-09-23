Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC63E97E495
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 03:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141DB10E35B;
	Mon, 23 Sep 2024 01:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="HQvEo2ER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9034C10E354;
 Mon, 23 Sep 2024 01:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=55Nb5AnSiTpPJhse4SS8idw+5d/f+IiBGFBN3Nv8730=; b=HQvEo2ER4bfHmAEy
 09EZG1516ULKSO4q2DZ1yqxtraHnmIqob7x18XJqHT8laCaba1d5XBG7n/iSBTZaP8UAoFVADESqJ
 7Qs/qDxjbdYd7smmr9m4gsTAGdLqvAffYWbNgCTgWDdNhTXKBfRew7K1H6km+MXtbrzkRdeQfc4BD
 TXKJalG/+2jrKVBNPtiPqJyOkEdr6ojLG7FrksQy1imdtL7OJmPJQWn8kpMWe2sP2LZAWJwdLqB03
 T4j3SZHecJ9tZMBfDc8q/XdMeUpSdzeY4E/EExKEswF1zpHBKkdKsn1M3dYy50E103asO+nxsWb9c
 lk4Ei4M5jNb2miULMw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1ssXoy-006k2k-02;
 Mon, 23 Sep 2024 01:25:00 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/5] drm/amdgpu: Remove unused amdgpu_gmc_vram_cpu_pa
Date: Mon, 23 Sep 2024 02:24:44 +0100
Message-ID: <20240923012446.4965-4-linux@treblig.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923012446.4965-1-linux@treblig.org>
References: <20240923012446.4965-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

amdgpu_gmc_vram_cpu_pa has been unused since commit
087451f372bf ("drm/amdgpu: use generic fb helpers instead of setting up AMD own's.")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 12 ------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 17a19d49d30a..58b5c436ad15 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -1065,18 +1065,6 @@ uint64_t amdgpu_gmc_vram_pa(struct amdgpu_device *adev, struct amdgpu_bo *bo)
 	return amdgpu_gmc_vram_mc2pa(adev, amdgpu_bo_gpu_offset(bo));
 }
 
-/**
- * amdgpu_gmc_vram_cpu_pa - calculate vram buffer object's physical address
- * from CPU's view
- *
- * @adev: amdgpu_device pointer
- * @bo: amdgpu buffer object
- */
-uint64_t amdgpu_gmc_vram_cpu_pa(struct amdgpu_device *adev, struct amdgpu_bo *bo)
-{
-	return amdgpu_bo_gpu_offset(bo) - adev->gmc.vram_start + adev->gmc.aper_base;
-}
-
 int amdgpu_gmc_vram_checking(struct amdgpu_device *adev)
 {
 	struct amdgpu_bo *vram_bo = NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
index 4d951a1baefa..e0bed91dd5a0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
@@ -447,7 +447,6 @@ void amdgpu_gmc_get_vbios_allocations(struct amdgpu_device *adev);
 void amdgpu_gmc_init_pdb0(struct amdgpu_device *adev);
 uint64_t amdgpu_gmc_vram_mc2pa(struct amdgpu_device *adev, uint64_t mc_addr);
 uint64_t amdgpu_gmc_vram_pa(struct amdgpu_device *adev, struct amdgpu_bo *bo);
-uint64_t amdgpu_gmc_vram_cpu_pa(struct amdgpu_device *adev, struct amdgpu_bo *bo);
 int amdgpu_gmc_vram_checking(struct amdgpu_device *adev);
 int amdgpu_gmc_sysfs_init(struct amdgpu_device *adev);
 void amdgpu_gmc_sysfs_fini(struct amdgpu_device *adev);
-- 
2.46.1

