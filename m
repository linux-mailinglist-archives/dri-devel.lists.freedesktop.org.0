Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F14943AA7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF30910E767;
	Thu,  1 Aug 2024 00:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L6nCt9Ee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E5C10E760;
 Thu,  1 Aug 2024 00:17:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A050D6125E;
 Thu,  1 Aug 2024 00:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52912C4AF0C;
 Thu,  1 Aug 2024 00:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471466;
 bh=SWgEroS/GkL8CcFagMVaUBw49wtARMIKIVtQQ+y/E0M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L6nCt9Ee8VfopqLNhGT4Es4GqiQivFc4oBhJe2N7ZNcMznWw6xI5vnrCFa+pFVXzY
 ttOOUBp9tpCLq9F8fz3ohEDI/IRlQzzgaE95nGI0tyqPqPDYmsLpunl8AZI0ILCoOI
 o0CwuR7GU9U0iYU/nYQnUgBCiFmJxoCOm98UpNrf+tDeiRU/9yzqoHczvpGk/wjIJA
 3ckB95gZLq5BPeJBOGHdSWORgrlxANl+VNLUo/piK1uKGMYd6C5F0Oa7gYct0XgIHu
 331h2n9m2JwVMaVq2h0zqFVh4+JvxHUq80lXGFMzq0o5Tzr0yfwvSxSP5BLYv3TJ67
 glWBCE75Ir8qQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bob Zhou <bob.zhou@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Felix.Kuehling@amd.com, Yunxiang.Li@amd.com, yifan1.zhang@amd.com,
 lijo.lazar@amd.com, Hawking.Zhang@amd.com, srinivasan.shanmugam@amd.com,
 mario.limonciello@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 101/121] drm/amdgpu: add missing error handling
 in function amdgpu_gmc_flush_gpu_tlb_pasid
Date: Wed, 31 Jul 2024 20:00:39 -0400
Message-ID: <20240801000834.3930818-101-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Bob Zhou <bob.zhou@amd.com>

[ Upstream commit 9ff2e14cf013fa887e269bdc5ea3cffacada8635 ]

Fix the unchecked return value warning reported by Coverity,
so add error handling.

Signed-off-by: Bob Zhou <bob.zhou@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 08b9dfb653355..1f02d282cfcd7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -720,7 +720,11 @@ int amdgpu_gmc_flush_gpu_tlb_pasid(struct amdgpu_device *adev, uint16_t pasid,
 			ndw += kiq->pmf->invalidate_tlbs_size;
 
 		spin_lock(&adev->gfx.kiq[inst].ring_lock);
-		amdgpu_ring_alloc(ring, ndw);
+		r = amdgpu_ring_alloc(ring, ndw);
+		if (r) {
+			spin_unlock(&adev->gfx.kiq[inst].ring_lock);
+			goto error_unlock_reset;
+		}
 		if (adev->gmc.flush_tlb_needs_extra_type_2)
 			kiq->pmf->kiq_invalidate_tlbs(ring, pasid, 2, all_hub);
 
-- 
2.43.0

