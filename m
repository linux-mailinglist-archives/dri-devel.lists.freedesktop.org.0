Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963CC8366E0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1D610F28F;
	Mon, 22 Jan 2024 15:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B64910F330;
 Mon, 22 Jan 2024 15:08:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D1AB6CE2AEE;
 Mon, 22 Jan 2024 15:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3618DC433A6;
 Mon, 22 Jan 2024 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936079;
 bh=rG2lZ5Jlezilxef3z+18eTsHr4Nwxo2hriUqKm7kyTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uJS/7mn+O3W+4+FRFpFYnDFWvFN1kAqSGxaUzniNibZpGInPB8SwkHNcH84G8PSHo
 Lwz1g7gFKrSg91jiw1Nk6OkKBqpd6m32RgSa5rZFEOEWw8QFGIWZW2PAAHrtKlucIX
 xZuN+HlOaB3+sYzvURZAhuenvMiKqMvPXx0ETj1Arhws4B0MAkbNx5d/C1Zai4iXbB
 Ga7YQHFFD7VuehmzJqgDCJr7BYkMy+GlQHwVmWq0p6Nukx8DDVwtZ06+bot05sW4Hi
 y/wgxcM+uOvgwXSSNPff5dNYIjQUJf8/zyVMQaZzRLh7zUOwprKAN2pRAnGcXJ8usH
 N8D8fpF8sEExQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 60/73] drm/amdgpu: Fix ecc irq enable/disable
 unpaired
Date: Mon, 22 Jan 2024 10:02:14 -0500
Message-ID: <20240122150432.992458-60-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150432.992458-1-sashal@kernel.org>
References: <20240122150432.992458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.13
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
Cc: Sasha Levin <sashal@kernel.org>, mukul.joshi@amd.com, Xinhui.Pan@amd.com,
 srinivasan.shanmugam@amd.com, dri-devel@lists.freedesktop.org,
 Philip.Yang@amd.com, Felix.Kuehling@amd.com, Tao Zhou <tao.zhou1@amd.com>,
 rajneesh.bhardwaj@amd.com, asad.kamal@amd.com, lijo.lazar@amd.com,
 le.ma@amd.com, "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 christian.koenig@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Stanley.Yang" <Stanley.Yang@amd.com>

[ Upstream commit a32c6f7f5737cc7e31cd7ad5133f0d96fca12ea6 ]

The ecc_irq is disabled while GPU mode2 reset suspending process,
but not be enabled during GPU mode2 reset resume process.

Changed from V1:
	only do sdma/gfx ras_late_init in aldebaran_mode2_restore_ip
	delete amdgpu_ras_late_resume function

Changed from V2:
	check umc ras supported before put ecc_irq

Signed-off-by: Stanley.Yang <Stanley.Yang@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/aldebaran.c | 26 +++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c |  4 ++++
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c |  5 +++++
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  |  4 ++++
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/aldebaran.c b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
index 2b97b8a96fb4..fa6193535d48 100644
--- a/drivers/gpu/drm/amd/amdgpu/aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
@@ -333,6 +333,7 @@ aldebaran_mode2_restore_hwcontext(struct amdgpu_reset_control *reset_ctl,
 {
 	struct list_head *reset_device_list = reset_context->reset_device_list;
 	struct amdgpu_device *tmp_adev = NULL;
+	struct amdgpu_ras *con;
 	int r;
 
 	if (reset_device_list == NULL)
@@ -358,7 +359,30 @@ aldebaran_mode2_restore_hwcontext(struct amdgpu_reset_control *reset_ctl,
 		 */
 		amdgpu_register_gpu_instance(tmp_adev);
 
-		/* Resume RAS */
+		/* Resume RAS, ecc_irq */
+		con = amdgpu_ras_get_context(tmp_adev);
+		if (!amdgpu_sriov_vf(tmp_adev) && con) {
+			if (tmp_adev->sdma.ras &&
+				tmp_adev->sdma.ras->ras_block.ras_late_init) {
+				r = tmp_adev->sdma.ras->ras_block.ras_late_init(tmp_adev,
+						&tmp_adev->sdma.ras->ras_block.ras_comm);
+				if (r) {
+					dev_err(tmp_adev->dev, "SDMA failed to execute ras_late_init! ret:%d\n", r);
+					goto end;
+				}
+			}
+
+			if (tmp_adev->gfx.ras &&
+				tmp_adev->gfx.ras->ras_block.ras_late_init) {
+				r = tmp_adev->gfx.ras->ras_block.ras_late_init(tmp_adev,
+						&tmp_adev->gfx.ras->ras_block.ras_comm);
+				if (r) {
+					dev_err(tmp_adev->dev, "GFX failed to execute ras_late_init! ret:%d\n", r);
+					goto end;
+				}
+			}
+		}
+
 		amdgpu_ras_resume(tmp_adev);
 
 		/* Update PSP FW topology after reset */
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index fa87a85e1017..62ecf4d89cb9 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -1141,6 +1141,10 @@ static int gmc_v10_0_hw_fini(void *handle)
 
 	amdgpu_irq_put(adev, &adev->gmc.vm_fault, 0);
 
+	if (adev->gmc.ecc_irq.funcs &&
+		amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__UMC))
+		amdgpu_irq_put(adev, &adev->gmc.ecc_irq, 0);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index e3b76fd28d15..3d797a1adef3 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -974,6 +974,11 @@ static int gmc_v11_0_hw_fini(void *handle)
 	}
 
 	amdgpu_irq_put(adev, &adev->gmc.vm_fault, 0);
+
+	if (adev->gmc.ecc_irq.funcs &&
+		amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__UMC))
+		amdgpu_irq_put(adev, &adev->gmc.ecc_irq, 0);
+
 	gmc_v11_0_gart_disable(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 89550d3df68d..f9f43742e9ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -2413,6 +2413,10 @@ static int gmc_v9_0_hw_fini(void *handle)
 
 	amdgpu_irq_put(adev, &adev->gmc.vm_fault, 0);
 
+	if (adev->gmc.ecc_irq.funcs &&
+		amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__UMC))
+		amdgpu_irq_put(adev, &adev->gmc.ecc_irq, 0);
+
 	return 0;
 }
 
-- 
2.43.0

