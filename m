Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F434AA9F92
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E3110E478;
	Mon,  5 May 2025 22:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dArHgBS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A76510E478;
 Mon,  5 May 2025 22:24:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 11CD661F1F;
 Mon,  5 May 2025 22:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC91C4CEEE;
 Mon,  5 May 2025 22:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483877;
 bh=SWyscu+yuF6KYdS2OxLwWlv1eNxyNyI81bj5r+fMogc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dArHgBS6a6klLuOVPzzmqtZAFi9T0BAhpnFRWoIEZHQFf34ICxScdBnOSZU1rKK0v
 e5e+zS7KZg9C4BO1FPaE606ewMtTPQlKksKPDrHbnq52EJ6cbtnpuBRw2FQg5tYfBE
 JYb0+PRj27N9+/eITWIfl4TRdiTe/GqahFcNPzhwMdgSomY9NJBI9+YU7A2LM5+rmC
 OQcbflISQKzBmH1uSRd6v99XL7/wanwvWz+niXifu/PE3DOAVr0VOjKHByQIz/HdZ2
 rhIFYCGFE5I4zkcQUr52Bhm3xZbwNN1s9IvBDaIa/jHnMpFro0LBWW+HmNkT5yvoXv
 bVEadlQNg6uWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, leo.liu@amd.com, sathishkumar.sundararaju@amd.com,
 David.Wu3@amd.com, kevinyang.wang@amd.com, Jane.Jian@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 254/642] drm/amdgpu: Avoid HDP flush on JPEG
 v5.0.1
Date: Mon,  5 May 2025 18:07:50 -0400
Message-Id: <20250505221419.2672473-254-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Lijo Lazar <lijo.lazar@amd.com>

[ Upstream commit a734a717dcfe1ce618301775034e598cb456665b ]

Similar to JPEG v4.0.3, HDP flush shouldn't be performed by JPEG engine.
Keep it empty.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h | 1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
index 88f9771c16869..b2904ee494e04 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
@@ -637,7 +637,7 @@ static uint64_t jpeg_v4_0_3_dec_ring_get_wptr(struct amdgpu_ring *ring)
 			ring->pipe ? (0x40 * ring->pipe - 0xc80) : 0);
 }
 
-static void jpeg_v4_0_3_ring_emit_hdp_flush(struct amdgpu_ring *ring)
+void jpeg_v4_0_3_ring_emit_hdp_flush(struct amdgpu_ring *ring)
 {
 	/* JPEG engine access for HDP flush doesn't work when RRMT is enabled.
 	 * This is a workaround to avoid any HDP flush through JPEG ring.
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h
index 747a3e5f68564..a90bf370a0025 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h
@@ -56,6 +56,7 @@ void jpeg_v4_0_3_dec_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64 seq
 				unsigned int flags);
 void jpeg_v4_0_3_dec_ring_emit_vm_flush(struct amdgpu_ring *ring,
 					unsigned int vmid, uint64_t pd_addr);
+void jpeg_v4_0_3_ring_emit_hdp_flush(struct amdgpu_ring *ring);
 void jpeg_v4_0_3_dec_ring_nop(struct amdgpu_ring *ring, uint32_t count);
 void jpeg_v4_0_3_dec_ring_insert_start(struct amdgpu_ring *ring);
 void jpeg_v4_0_3_dec_ring_insert_end(struct amdgpu_ring *ring);
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
index 40d4c32a8c2a6..f2cc11b3fd68b 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
@@ -655,6 +655,7 @@ static const struct amdgpu_ring_funcs jpeg_v5_0_1_dec_ring_vm_funcs = {
 	.emit_ib = jpeg_v4_0_3_dec_ring_emit_ib,
 	.emit_fence = jpeg_v4_0_3_dec_ring_emit_fence,
 	.emit_vm_flush = jpeg_v4_0_3_dec_ring_emit_vm_flush,
+	.emit_hdp_flush = jpeg_v4_0_3_ring_emit_hdp_flush,
 	.test_ring = amdgpu_jpeg_dec_ring_test_ring,
 	.test_ib = amdgpu_jpeg_dec_ring_test_ib,
 	.insert_nop = jpeg_v4_0_3_dec_ring_nop,
-- 
2.39.5

