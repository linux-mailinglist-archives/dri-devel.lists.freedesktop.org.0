Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD5C6FFA3D
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 21:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694A610E5D8;
	Thu, 11 May 2023 19:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0C110E5D8;
 Thu, 11 May 2023 19:38:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CD1063AEE;
 Thu, 11 May 2023 19:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8474EC433D2;
 Thu, 11 May 2023 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683833893;
 bh=nH05vNMzANaFoKW5fkpkAp/sZeYynjms0EzxIcx13lQ=;
 h=From:To:Cc:Subject:Date:From;
 b=T6HwKghNXhf3ww8tMhUrSPehrdDHRdoa6UWd6zEhvPHmcHfyfYzD7wy6+l06sg6fe
 PDMLUpsaN8/NN9FJca0gW8zhv7hIOlucxIjzGlKAlALQu6DPQtFwpLgGBQ4fWxJxYj
 SPZjIxp4wDRuvA+HDAI045GbNgkiFvL77KIlsCEJceRqE5GIoz15QaWEPJDJtcw4ED
 x+a12GNxwLECb9rMRDz1Uy7wpH62g/1Vd1a4REJBtE5p/Dx8oXLezUimxxxV9AyxIW
 aoKoctC+Y++WzDN34SQojaZHY+g9kOBPMmk5HGRQ3f9PzrcywIuDWtiN2hKrzgqAt8
 o3YUKoLwneNlQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 01/11] drm/amdgpu: release gpu full access after
 "amdgpu_device_ip_late_init"
Date: Thu, 11 May 2023 15:37:44 -0400
Message-Id: <20230511193757.623114-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Sasha Levin <sashal@kernel.org>, andrey.grodzovsky@amd.com,
 lijo.lazar@amd.com, Chong Li <chongli2@amd.com>,
 dri-devel@lists.freedesktop.org, Amaranath.Somalapuram@amd.com,
 Bokun.Zhang@amd.com, JingWen.Chen2@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, YiPeng.Chai@amd.com, mario.limonciello@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chong Li <chongli2@amd.com>

[ Upstream commit 38eecbe086a4e52f54b2bbda8feba65d44addbef ]

[WHY]
 Function "amdgpu_irq_update()" called by "amdgpu_device_ip_late_init()" is an atomic context.
 We shouldn't access registers through KIQ since "msleep()" may be called in "amdgpu_kiq_rreg()".

[HOW]
 Move function "amdgpu_virt_release_full_gpu()" after function "amdgpu_device_ip_late_init()",
 to ensure that registers be accessed through RLCG instead of KIQ.

Call Trace:
  <TASK>
  show_stack+0x52/0x69
  dump_stack_lvl+0x49/0x6d
  dump_stack+0x10/0x18
  __schedule_bug.cold+0x4f/0x6b
  __schedule+0x473/0x5d0
  ? __wake_up_klogd.part.0+0x40/0x70
  ? vprintk_emit+0xbe/0x1f0
  schedule+0x68/0x110
  schedule_timeout+0x87/0x160
  ? timer_migration_handler+0xa0/0xa0
  msleep+0x2d/0x50
  amdgpu_kiq_rreg+0x18d/0x1f0 [amdgpu]
  amdgpu_device_rreg.part.0+0x59/0xd0 [amdgpu]
  amdgpu_device_rreg+0x3a/0x50 [amdgpu]
  amdgpu_sriov_rreg+0x3c/0xb0 [amdgpu]
  gfx_v10_0_set_gfx_eop_interrupt_state.constprop.0+0x16c/0x190 [amdgpu]
  gfx_v10_0_set_eop_interrupt_state+0xa5/0xb0 [amdgpu]
  amdgpu_irq_update+0x53/0x80 [amdgpu]
  amdgpu_irq_get+0x7c/0xb0 [amdgpu]
  amdgpu_fence_driver_hw_init+0x58/0x90 [amdgpu]
  amdgpu_device_init.cold+0x16b7/0x2022 [amdgpu]

Signed-off-by: Chong Li <chongli2@amd.com>
Reviewed-by: JingWen.Chen2@amd.com
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 32 ++++++++++++----------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3d98fc2ad36b0..7543683b2583f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2522,8 +2522,6 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	amdgpu_fru_get_product_info(adev);
 
 init_failed:
-	if (amdgpu_sriov_vf(adev))
-		amdgpu_virt_release_full_gpu(adev, true);
 
 	return r;
 }
@@ -3840,18 +3838,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	r = amdgpu_device_ip_init(adev);
 	if (r) {
-		/* failed in exclusive mode due to timeout */
-		if (amdgpu_sriov_vf(adev) &&
-		    !amdgpu_sriov_runtime(adev) &&
-		    amdgpu_virt_mmio_blocked(adev) &&
-		    !amdgpu_virt_wait_reset(adev)) {
-			dev_err(adev->dev, "VF exclusive mode timeout\n");
-			/* Don't send request since VF is inactive. */
-			adev->virt.caps &= ~AMDGPU_SRIOV_CAPS_RUNTIME;
-			adev->virt.ops = NULL;
-			r = -EAGAIN;
-			goto release_ras_con;
-		}
 		dev_err(adev->dev, "amdgpu_device_ip_init failed\n");
 		amdgpu_vf_error_put(adev, AMDGIM_ERROR_VF_AMDGPU_INIT_FAIL, 0, 0);
 		goto release_ras_con;
@@ -3923,8 +3909,10 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 				   msecs_to_jiffies(AMDGPU_RESUME_MS));
 	}
 
-	if (amdgpu_sriov_vf(adev))
+	if (amdgpu_sriov_vf(adev)) {
+		amdgpu_virt_release_full_gpu(adev, true);
 		flush_delayed_work(&adev->delayed_init_work);
+	}
 
 	r = sysfs_create_files(&adev->dev->kobj, amdgpu_dev_attributes);
 	if (r)
@@ -3961,6 +3949,20 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	return 0;
 
 release_ras_con:
+	if (amdgpu_sriov_vf(adev))
+		amdgpu_virt_release_full_gpu(adev, true);
+
+	/* failed in exclusive mode due to timeout */
+	if (amdgpu_sriov_vf(adev) &&
+		!amdgpu_sriov_runtime(adev) &&
+		amdgpu_virt_mmio_blocked(adev) &&
+		!amdgpu_virt_wait_reset(adev)) {
+		dev_err(adev->dev, "VF exclusive mode timeout\n");
+		/* Don't send request since VF is inactive. */
+		adev->virt.caps &= ~AMDGPU_SRIOV_CAPS_RUNTIME;
+		adev->virt.ops = NULL;
+		r = -EAGAIN;
+	}
 	amdgpu_release_ras_context(adev);
 
 failed:
-- 
2.39.2

