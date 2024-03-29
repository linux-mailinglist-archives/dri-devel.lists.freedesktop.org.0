Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FA3891997
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 13:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0887D1126C3;
	Fri, 29 Mar 2024 12:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EbSNCjXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FE31126D7;
 Fri, 29 Mar 2024 12:41:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 61A7561926;
 Fri, 29 Mar 2024 12:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2115BC433F1;
 Fri, 29 Mar 2024 12:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711716116;
 bh=hv27gBKDYQLW2061t6d9jJ8tcdDAnzxAdPCX0nu7cU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EbSNCjXzbN8r2U3/ds6q6voMyp5LhZMsVxQrZsV6RZF3K16Ik2spfw82JNPF81o2S
 Lcs6gH7CnmVjaCXnBacsxEq57ZjqWIqD6i4T/R652bEmlXV90Hz0LxzpMO7HOIwJdS
 /qDo12bAZxzcW5bx6MfPAatxUCqp7UePq4fWqAA0h2Ciz7QuKi9S2hcn/GEi0tQBhG
 zANha42EgMfjqY0NnBVQVvc/Rl5kIiuOoMotxovgWsjELHL6ZdRmpYeVi38BFVRLey
 gRR57YORFcxtrt5EdKsrnuKbGx/FIUHmheCl+Qn4zejyfYLWJjfQLahRBxaBhsKjKM
 wphNsM0591n0w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 mario.limonciello@amd.com, Hawking.Zhang@amd.com, lijo.lazar@amd.com,
 candice.li@amd.com, le.ma@amd.com, victorchengchi.lu@amd.com,
 shashank.sharma@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 62/98] drm/amd/amdgpu: Fix potential ioremap()
 memory leaks in amdgpu_device_init()
Date: Fri, 29 Mar 2024 08:37:33 -0400
Message-ID: <20240329123919.3087149-62-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329123919.3087149-1-sashal@kernel.org>
References: <20240329123919.3087149-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.2
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

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit eb4f139888f636614dab3bcce97ff61cefc4b3a7 ]

This ensures that the memory mapped by ioremap for adev->rmmio, is
properly handled in amdgpu_device_init(). If the function exits early
due to an error, the memory is unmapped. If the function completes
successfully, the memory remains mapped.

Reported by smatch:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4337 amdgpu_device_init() warn: 'adev->rmmio' from ioremap() not released on lines: 4035,4045,4051,4058,4068,4337

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5c381216df623..1d681298a4893 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4025,8 +4025,10 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	 * early on during init and before calling to RREG32.
 	 */
 	adev->reset_domain = amdgpu_reset_create_reset_domain(SINGLE_DEVICE, "amdgpu-reset-dev");
-	if (!adev->reset_domain)
-		return -ENOMEM;
+	if (!adev->reset_domain) {
+		r = -ENOMEM;
+		goto unmap_memory;
+	}
 
 	/* detect hw virtualization here */
 	amdgpu_detect_virtualization(adev);
@@ -4036,20 +4038,20 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	r = amdgpu_device_get_job_timeout_settings(adev);
 	if (r) {
 		dev_err(adev->dev, "invalid lockup_timeout parameter syntax\n");
-		return r;
+		goto unmap_memory;
 	}
 
 	/* early init functions */
 	r = amdgpu_device_ip_early_init(adev);
 	if (r)
-		return r;
+		goto unmap_memory;
 
 	amdgpu_device_set_mcbp(adev);
 
 	/* Get rid of things like offb */
 	r = drm_aperture_remove_conflicting_pci_framebuffers(adev->pdev, &amdgpu_kms_driver);
 	if (r)
-		return r;
+		goto unmap_memory;
 
 	/* Enable TMZ based on IP_VERSION */
 	amdgpu_gmc_tmz_set(adev);
@@ -4059,7 +4061,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	if (adev->gmc.xgmi.supported) {
 		r = adev->gfxhub.funcs->get_xgmi_info(adev);
 		if (r)
-			return r;
+			goto unmap_memory;
 	}
 
 	/* enable PCIE atomic ops */
@@ -4328,6 +4330,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 failed:
 	amdgpu_vf_error_trans_all(adev);
 
+unmap_memory:
+	iounmap(adev->rmmio);
 	return r;
 }
 
-- 
2.43.0

