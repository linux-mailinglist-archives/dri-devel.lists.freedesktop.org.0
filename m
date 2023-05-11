Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899D46FFA8B
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 21:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DB510E5EB;
	Thu, 11 May 2023 19:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B8010E5EB;
 Thu, 11 May 2023 19:40:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0218A6510F;
 Thu, 11 May 2023 19:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BA1C433EF;
 Thu, 11 May 2023 19:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683834051;
 bh=Wsbnd3j87NrJBY2663heNyKZbgPwIBlAvROKWO/lE4w=;
 h=From:To:Cc:Subject:Date:From;
 b=TMWcJ4zdn6UQQb+JIGxVsbe1vTlwiLTw8ujXQRQ3ZINsC+Oa3+LczgbqYz/7XdprU
 yvj8p4skfyL/ZtSS9vUFavP/9v+O4EY+CmjeFe1ifPJnsHmn+uEofyk5lFC7ESbpK9
 dRnavqzLuv98Lsa5ZtTTpLOEbiJZ8qChWYnPHh9XLPJOSssixmGtgXNElJm2oVgBhH
 p+FkL7yFm0+lYK08xlrK9cUoSFm0r8Rh/Rn25s1QDiTcXr2XFDP8nA/bDwNazX0jqe
 UnhZheGzsfPER4u1phsayYNbi4v9saxCtGgiQow29uU8bhVnfJhcAlpr200sEH/wE9
 hQg5YkrKh/p9w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 1/5] drm/amdgpu: release gpu full access after
 "amdgpu_device_ip_late_init"
Date: Thu, 11 May 2023 15:40:18 -0400
Message-Id: <20230511194025.623614-1-sashal@kernel.org>
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
index 2f51789d98181..7e940a3bba978 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2509,8 +2509,6 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	amdgpu_fru_get_product_info(adev);
 
 init_failed:
-	if (amdgpu_sriov_vf(adev))
-		amdgpu_virt_release_full_gpu(adev, true);
 
 	return r;
 }
@@ -3755,18 +3753,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
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
@@ -3845,8 +3831,10 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 				   msecs_to_jiffies(AMDGPU_RESUME_MS));
 	}
 
-	if (amdgpu_sriov_vf(adev))
+	if (amdgpu_sriov_vf(adev)) {
+		amdgpu_virt_release_full_gpu(adev, true);
 		flush_delayed_work(&adev->delayed_init_work);
+	}
 
 	r = sysfs_create_files(&adev->dev->kobj, amdgpu_dev_attributes);
 	if (r)
@@ -3881,6 +3869,20 @@ int amdgpu_device_init(struct amdgpu_device *adev,
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

