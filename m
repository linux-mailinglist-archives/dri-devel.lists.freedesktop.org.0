Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA3BCFA2D3
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 19:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484D910E117;
	Tue,  6 Jan 2026 18:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="boNJeQdF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE66710E4AE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 13:01:34 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so7217235e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 05:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767704493; x=1768309293; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dSheufKc+UUOwl3UwE5ES46jacAULchaJm+bYEcyVi4=;
 b=boNJeQdFs3cqNwUAZc0iTrbhQFPKD0vgpW1qQ7gbmdgUfr7EhRTBzCQByduBxjB6GQ
 Yyyu4BUB715vt4nkUE6dMuxK2TGdK/UXRZ/5heklCl3r34ECH7uoMCvf0+61uIRq0epm
 TX/jQGIaCMmt37rfoYjr41lg8yER8IJPshlHOLKozQSG/EFybbg+762WfzrUVCi11gqi
 BTyP/T5WIqPrUt93EznK32Iaj4zTcNUI4QO236b9XxIl2XnG/ySVQ9ntZWw151NqzdkA
 hGJnIe8iOav5txRC3D/NfGVjO15Kn1kt67k/PDsR8vTP5+gPxN+d1XhIxeN+2LPcYzpI
 z7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767704493; x=1768309293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dSheufKc+UUOwl3UwE5ES46jacAULchaJm+bYEcyVi4=;
 b=mXTlULLlKJhDVflFtepcnz4o2FUcxFZOvg90b9hbOiYoTBys3bESJ6zQqm66zGqKDG
 MI6V2V2e1G12pT34zZhMGFZTcPYFkUSkvYzHEQWkWwDyBKD895S3kTsMhbzCGBcmTgCE
 jDhW5DTDyv5StUr5HNBZpk6gAR/inDYxc3z5/16crzAQrigDZtwJsBS56/H9u1a1DecA
 80OQVHkLU0/BpqIpUwzWiSEImvmTpdpDnEyAWNCcq6ptxZghclZoMLQp2/NMsAMxy0Bx
 A3ux8dNv/PKrpS37OSK8FaJRCiaBgHJu2topLwBTtZe5KCGH8jJmw12K3OYF3TCY3JnS
 WuAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqUGP0Quvb0+lmcXsDGFNsZhVsM5SiV4D9LJw6/rUOf2YRCaOXf9BwKjybowmMfxBCud3tAc+eQpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYriJKIs3oRHQ3z/nCnD9FPysBFcVSEp5yvxqnyWJad7vio/V2
 IJ6x7b272LHCu+mZg2t19/TNR9l7sLmzLM28QxWc8UpVyPZuOhtCgd1N
X-Gm-Gg: AY/fxX7tyRwCcWRx94j7Eddp7BE50CdGMMSQYSburM1H+z03BV7x+oMXlu+5sTYnjVK
 coKprjlY6nooqVQP9GL+koT8fe9uBYpxlgFTcBYBXtG3f3Is4jDoKC+KbhfQoEGE1h5p08I6hC0
 RKyZoBxhlOPMWvdyIEoYbX/WppeoVStN1n28QGdK2/i9HRcciiNiblFq4beIq0JmGjHyP1l5awe
 2caO20OgU1/+k7OvLpqZOp6ae9qn8R/jbEjrmvfNv+oeGyMINrMSziBe2UF1y7UvaNGGz+uHxLf
 Z4uGMJidyL69X2ziQK2Tw4wtYz5T0QYEA74APpNjqcl5XXSE9n1x6ALgFCr6LLb4T4DiKRC6/kb
 mYfKycrnF5CoctMtmdSIqlHqh1q8t1QcMibUrhsKFjs26SwEA61T5JZYViwxwwjF0mEDFexAWDQ
 qY/yWV8MFdb3EmLKalj7sJ9EYJfPzGQ4Y+KYnMOkE=
X-Google-Smtp-Source: AGHT+IEen1tffLOVS9PvaIgplGvgYv0apDsv1cligNcSYLsf8i0OcV+jJyALYwNJooMKHM+mPmAwiw==
X-Received: by 2002:a05:600c:3b27:b0:477:8a29:582c with SMTP id
 5b1f17b1804b1-47d7f0a1804mr33634755e9.34.1767704493290; 
 Tue, 06 Jan 2026 05:01:33 -0800 (PST)
Received: from ionutnechita-arz2022.local
 ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f68f69dsm42684065e9.1.2026.01.06.05.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 05:01:32 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <superm1@kernel.org>,
 Ionut Nechita <ionut_n2001@yahoo.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/amdgpu: Fix TLB flush failures after hibernation
 resume
Date: Tue,  6 Jan 2026 14:59:33 +0200
Message-ID: <20260106125929.25214-6-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106125929.25214-3-sunlightlinux@gmail.com>
References: <20260106125929.25214-3-sunlightlinux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 06 Jan 2026 18:32:23 +0000
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

From: Ionut Nechita <ionut_n2001@yahoo.com>

After resume from hibernation, the amdgpu driver experiences TLB
flush failures with errors:

  amdgpu: TLB flush failed for PASID xxxxx
  amdgpu: failed to write reg 28b4 wait reg 28c6
  amdgpu: failed to write reg 1a6f4 wait reg 1a706

Root Cause:
-----------
The KIQ (Kernel Interface Queue) ring is marked as ready
(ring.sched.ready = true) during resume, but the hardware is not
fully functional yet. When TLB invalidation attempts to use KIQ
for register access, the commands fail because the GPU hasn't
completed initialization.

Solution:
---------
1. Add resume_gpu_stable flag (initially false on resume)
2. Force TLB invalidation to use direct MMIO path instead of KIQ
   when resume_gpu_stable is false
3. After ring tests pass in gfx_v9_0_cp_resume(), set
   resume_gpu_stable to true
4. From that point forward, use faster KIQ path for TLB invalidation

This ensures TLB flushes work correctly during early resume while
still benefiting from KIQ-based invalidation after the GPU is stable.

Changes:
--------
- amdgpu.h: Add resume_gpu_stable flag to amdgpu_device
- amdgpu_device.c: Initialize resume_gpu_stable to false on resume
- amdgpu_gmc.c: Check resume_gpu_stable in flush_gpu_tlb_pasid
- gfx_v9_0.c: Set resume_gpu_stable after ring tests pass
- gmc_v9_0.c: Check resume_gpu_stable before using KIQ path

Tested on AMD Cezanne (Renoir) with ROCm workloads after hibernation.
Result: Eliminates TLB flush failures on resume.

Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  6 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c    |  9 +++++++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c      | 10 ++++++++++
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c      |  6 +++++-
 5 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 9f9774f58ce1c..6bf4f6c90164c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1225,6 +1225,7 @@ struct amdgpu_device {
 	bool				in_s4;
 	bool				in_s0ix;
 	suspend_state_t			last_suspend_state;
+	bool				resume_gpu_stable;
 
 	enum pp_mp1_state               mp1_state;
 	struct amdgpu_doorbell_index doorbell_index;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 12201b8e99b3f..440d86ed1e0d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5457,6 +5457,12 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 		goto exit;
 	}
 
+	/*
+	 * Set resume_gpu_stable to false BEFORE KFD resume to ensure
+	 * extended timeouts are used for TLB flushes during hibernation recovery
+	 */
+	adev->resume_gpu_stable = false;
+
 	r = amdgpu_amdkfd_resume(adev, !amdgpu_sriov_vf(adev) && !adev->in_runpm);
 	if (r)
 		goto exit;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 869bceb0fe2c6..83fe30f0ada75 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -731,7 +731,12 @@ int amdgpu_gmc_flush_gpu_tlb_pasid(struct amdgpu_device *adev, uint16_t pasid,
 	if (!down_read_trylock(&adev->reset_domain->sem))
 		return 0;
 
-	if (!adev->gmc.flush_pasid_uses_kiq || !ring->sched.ready) {
+	/*
+	 * After hibernation resume, KIQ may report as ready but not be fully
+	 * functional. Use direct MMIO path until GPU is confirmed stable.
+	 */
+	if (!adev->gmc.flush_pasid_uses_kiq || !ring->sched.ready ||
+	    !adev->resume_gpu_stable) {
 		if (adev->gmc.flush_tlb_needs_extra_type_2)
 			adev->gmc.gmc_funcs->flush_gpu_tlb_pasid(adev, pasid,
 								 2, all_hub,
@@ -835,9 +840,9 @@ void amdgpu_gmc_fw_reg_write_reg_wait(struct amdgpu_device *adev,
 		goto failed_kiq;
 
 	might_sleep();
+
 	while (r < 1 && cnt++ < MAX_KIQ_REG_TRY &&
 	       !amdgpu_reset_pending(adev->reset_domain)) {
-
 		msleep(MAX_KIQ_REG_BAILOUT_INTERVAL);
 		r = amdgpu_fence_wait_polling(ring, seq, MAX_KIQ_REG_WAIT);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 0148d7ff34d99..fbd07b455b915 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -3985,6 +3985,16 @@ static int gfx_v9_0_cp_resume(struct amdgpu_device *adev)
 		amdgpu_ring_test_helper(ring);
 	}
 
+	/*
+	 * After successful ring tests, mark GPU as stable for resume.
+	 * This allows KIQ-based TLB invalidation to be used instead of
+	 * slower direct MMIO path.
+	 */
+	if (!adev->resume_gpu_stable) {
+		adev->resume_gpu_stable = true;
+		dev_info(adev->dev, "GPU rings verified, enabling KIQ path\n");
+	}
+
 	gfx_v9_0_enable_gui_idle_interrupt(adev, true);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 8ad7519f7b581..8a0202f6b3e3c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -855,9 +855,13 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 
 	/* This is necessary for SRIOV as well as for GFXOFF to function
 	 * properly under bare metal
+	 *
+	 * After hibernation resume, KIQ may report as ready but not be fully
+	 * functional. Use direct MMIO path until GPU is confirmed stable.
 	 */
 	if (adev->gfx.kiq[inst].ring.sched.ready &&
-	    (amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev))) {
+	    (amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev)) &&
+	    adev->resume_gpu_stable) {
 		uint32_t req = hub->vm_inv_eng0_req + hub->eng_distance * eng;
 		uint32_t ack = hub->vm_inv_eng0_ack + hub->eng_distance * eng;
 
-- 
2.52.0

