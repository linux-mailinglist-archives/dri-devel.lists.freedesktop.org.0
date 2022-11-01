Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81D06148D1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 12:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4DA10E391;
	Tue,  1 Nov 2022 11:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B63310E38F;
 Tue,  1 Nov 2022 11:30:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76F41615D4;
 Tue,  1 Nov 2022 11:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B7BC433D7;
 Tue,  1 Nov 2022 11:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667302206;
 bh=Jihi+eO85z7Z056MqHxc/Cn4Z8SMENDYNRLcV01aesQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xe3H+YCutFcLW7wSoqveyHkvkj67ub5sRX10sgMvDQYlKHkFmiaQobm8pYmM/3zjF
 mhvSRBYhfWpxiq3XH4zH+e1wAAq/v0mpzh/teMlWVAKfYce+suunjk0xauOxkuLgYr
 P3g5/zb06pJEIBM4YCPN1jm71gQve1TrKJNgAivtANYLhfCFgYG6ugltaraVZz1CAw
 xJBX+wXZA8zt/8vCZkD/7QWgMLIyEIebKZbBU0gjXJuBU9/h5uxGhwNUO5DAazLfoF
 4u8zeLUI1sQlQuq5EURjbf9e2g9xdRU3aRmGsGbfpsO/7khSmw4AzeUKZwfsG/LoKA
 aYpOv132MaIBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 17/19] drm/amdgpu: set vm_update_mode=0 as
 default for Sienna Cichlid in SRIOV case
Date: Tue,  1 Nov 2022 07:29:17 -0400
Message-Id: <20221101112919.799868-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101112919.799868-1-sashal@kernel.org>
References: <20221101112919.799868-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: lijo.lazar@amd.com, dri-devel@lists.freedesktop.org, PengJu.Zhou@amd.com,
 victor.skvortsov@amd.com, Sasha Levin <sashal@kernel.org>, guchun.chen@amd.com,
 bernard@vivo.com, marmarek@invisiblethingslab.com,
 amd-gfx@lists.freedesktop.org, Jingwen.Chen2@amd.com, Philip.Yang@amd.com,
 Victor.Zhao@amd.com, qiang.yu@amd.com, Felix Kuehling <Felix.Kuehling@amd.com>,
 Danijel Slivka <danijel.slivka@amd.com>, Xinhui.Pan@amd.com, Gavin.Wan@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Danijel Slivka <danijel.slivka@amd.com>

[ Upstream commit 65f8682b9aaae20c2cdee993e6fe52374ad513c9 ]

For asic with VF MMIO access protection avoid using CPU for VM table updates.
CPU pagetable updates have issues with HDP flush as VF MMIO access protection
blocks write to mmBIF_BX_DEV0_EPF0_VF0_HDP_MEM_COHERENCY_FLUSH_CNTL register
during sriov runtime.

v3: introduce virtualization capability flag AMDGPU_VF_MMIO_ACCESS_PROTECT
which indicates that VF MMIO write access is not allowed in sriov runtime

Signed-off-by: Danijel Slivka <danijel.slivka@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 6 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h | 4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   | 6 +++++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index a0803425b456..b508126a9738 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -706,6 +706,12 @@ void amdgpu_detect_virtualization(struct amdgpu_device *adev)
 			adev->virt.caps |= AMDGPU_PASSTHROUGH_MODE;
 	}
 
+	if (amdgpu_sriov_vf(adev) && adev->asic_type == CHIP_SIENNA_CICHLID)
+		/* VF MMIO access (except mailbox range) from CPU
+		 * will be blocked during sriov runtime
+		 */
+		adev->virt.caps |= AMDGPU_VF_MMIO_ACCESS_PROTECT;
+
 	/* we have the ability to check now */
 	if (amdgpu_sriov_vf(adev)) {
 		switch (adev->asic_type) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
index 9adfb8d63280..ce31d4fdee93 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
@@ -31,6 +31,7 @@
 #define AMDGPU_SRIOV_CAPS_IS_VF        (1 << 2) /* this GPU is a virtual function */
 #define AMDGPU_PASSTHROUGH_MODE        (1 << 3) /* thw whole GPU is pass through for VM */
 #define AMDGPU_SRIOV_CAPS_RUNTIME      (1 << 4) /* is out of full access mode */
+#define AMDGPU_VF_MMIO_ACCESS_PROTECT  (1 << 5) /* MMIO write access is not allowed in sriov runtime */
 
 /* all asic after AI use this offset */
 #define mmRCC_IOV_FUNC_IDENTIFIER 0xDE5
@@ -278,6 +279,9 @@ struct amdgpu_video_codec_info;
 #define amdgpu_passthrough(adev) \
 ((adev)->virt.caps & AMDGPU_PASSTHROUGH_MODE)
 
+#define amdgpu_sriov_vf_mmio_access_protection(adev) \
+((adev)->virt.caps & AMDGPU_VF_MMIO_ACCESS_PROTECT)
+
 static inline bool is_virtual_machine(void)
 {
 #ifdef CONFIG_X86
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index fd37bb39774c..01710cd0d972 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3224,7 +3224,11 @@ void amdgpu_vm_manager_init(struct amdgpu_device *adev)
 	 */
 #ifdef CONFIG_X86_64
 	if (amdgpu_vm_update_mode == -1) {
-		if (amdgpu_gmc_vram_full_visible(&adev->gmc))
+		/* For asic with VF MMIO access protection
+		 * avoid using CPU for VM table updates
+		 */
+		if (amdgpu_gmc_vram_full_visible(&adev->gmc) &&
+		    !amdgpu_sriov_vf_mmio_access_protection(adev))
 			adev->vm_manager.vm_update_mode =
 				AMDGPU_VM_USE_CPU_FOR_COMPUTE;
 		else
-- 
2.35.1

