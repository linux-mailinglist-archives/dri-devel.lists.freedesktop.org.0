Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9139B6BAFF1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 13:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F143510E052;
	Wed, 15 Mar 2023 12:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0082E10E052;
 Wed, 15 Mar 2023 12:10:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.101.196.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id BA15241FB9; 
 Wed, 15 Mar 2023 12:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1678882225;
 bh=8EFN3s1YBGw+XJzxDq8BOR1GtZMD+11bJZblpHMeHfM=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=hdp71cWKJQoiO3f9FT1GwnaRpiTTe24QrX1hyze4MMgWPtQhao39l3Uc9R196LRIq
 iQeK/JpCDm+u3CvXLQrht72vgvIvEGi0nrfRfE9622z3OEq24egGPto0pgBwoHp9pf
 zzsLOWaFkcXaxXaex0bietq2Ig5SCanZj7OYsowWm0MDG3hYDjjDTACOaYgnNYIhe1
 bEdVyX4aCZOx0vYl2FOcvpbZ1qozbJ1XssqokOHI2v8sZ7MKoM9pKp1dMRU7obQvYs
 5LE5YCj19shhvzCN6ySwfV/mt/RrUwsVUWL6q1RaMmdWE8aSnAtIa4pGDmAJ8XMwVX
 p7S9+PPOF9oQQ==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Subject: [PATCH v2] drm/amdgpu/nv: Apply ASPM quirk on Intel ADL + AMD Navi
Date: Wed, 15 Mar 2023 20:07:23 +0800
Message-Id: <20230315120726.427486-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Lijo Lazar <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 amd-gfx@lists.freedesktop.org, Jiansong Chen <Jiansong.Chen@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Victor Zhao <Victor.Zhao@amd.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 Veerabadhran Gopalakrishnan <veerabadhran.gopalakrishnan@amd.com>,
 Evan Quan <evan.quan@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Richard Gong <richard.gong@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Leo Liu <leo.liu@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S2idle resume freeze can be observed on Intel ADL + AMD WX5500. This is
caused by commit 0064b0ce85bb ("drm/amd/pm: enable ASPM by default").

The root cause is still not clear for now.

So extend and apply the ASPM quirk from commit e02fe3bc7aba
("drm/amdgpu: vi: disable ASPM on Intel Alder Lake based systems"), to
workaround the issue on Navi cards too.

Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2458
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 - Rename the quirk function.

 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 +++++++++++++++
 drivers/gpu/drm/amd/amdgpu/nv.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c            | 17 +----------------
 4 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 164141bc8b4a..5f3b139c1f99 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1272,6 +1272,7 @@ void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
 int amdgpu_device_pci_reset(struct amdgpu_device *adev);
 bool amdgpu_device_need_post(struct amdgpu_device *adev);
 bool amdgpu_device_should_use_aspm(struct amdgpu_device *adev);
+bool amdgpu_device_aspm_support_quirk(void);
 
 void amdgpu_cs_report_moved_bytes(struct amdgpu_device *adev, u64 num_bytes,
 				  u64 num_vis_bytes);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c4a4e2fe6681..05a34ff79e78 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -80,6 +80,10 @@
 
 #include <drm/drm_drv.h>
 
+#if IS_ENABLED(CONFIG_X86)
+#include <asm/intel-family.h>
+#endif
+
 MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
@@ -1356,6 +1360,17 @@ bool amdgpu_device_should_use_aspm(struct amdgpu_device *adev)
 	return pcie_aspm_enabled(adev->pdev);
 }
 
+bool amdgpu_device_aspm_support_quirk(void)
+{
+#if IS_ENABLED(CONFIG_X86)
+	struct cpuinfo_x86 *c = &cpu_data(0);
+
+	return !(c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
+#else
+	return true;
+#endif
+}
+
 /* if we get transitioned to only one device, take VGA back */
 /**
  * amdgpu_device_vga_set_decode - enable/disable vga decode
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 855d390c41de..26733263913e 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -578,7 +578,7 @@ static void nv_pcie_gen3_enable(struct amdgpu_device *adev)
 
 static void nv_program_aspm(struct amdgpu_device *adev)
 {
-	if (!amdgpu_device_should_use_aspm(adev))
+	if (!amdgpu_device_should_use_aspm(adev) || !amdgpu_device_aspm_support_quirk())
 		return;
 
 	if (!(adev->flags & AMD_IS_APU) &&
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 12ef782eb478..ceab8783575c 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -81,10 +81,6 @@
 #include "mxgpu_vi.h"
 #include "amdgpu_dm.h"
 
-#if IS_ENABLED(CONFIG_X86)
-#include <asm/intel-family.h>
-#endif
-
 #define ixPCIE_LC_L1_PM_SUBSTATE	0x100100C6
 #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK	0x00000001L
 #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK	0x00000002L
@@ -1138,24 +1134,13 @@ static void vi_enable_aspm(struct amdgpu_device *adev)
 		WREG32_PCIE(ixPCIE_LC_CNTL, data);
 }
 
-static bool aspm_support_quirk_check(void)
-{
-#if IS_ENABLED(CONFIG_X86)
-	struct cpuinfo_x86 *c = &cpu_data(0);
-
-	return !(c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
-#else
-	return true;
-#endif
-}
-
 static void vi_program_aspm(struct amdgpu_device *adev)
 {
 	u32 data, data1, orig;
 	bool bL1SS = false;
 	bool bClkReqSupport = true;
 
-	if (!amdgpu_device_should_use_aspm(adev) || !aspm_support_quirk_check())
+	if (!amdgpu_device_should_use_aspm(adev) || !amdgpu_device_aspm_support_quirk())
 		return;
 
 	if (adev->flags & AMD_IS_APU ||
-- 
2.34.1

