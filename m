Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2BF8BF0C5
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B4C112FEB;
	Tue,  7 May 2024 23:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AJIOPI26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E288B112FEB;
 Tue,  7 May 2024 23:11:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 262FCCE1757;
 Tue,  7 May 2024 23:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6B3C4DDE0;
 Tue,  7 May 2024 23:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715123487;
 bh=Izw35QVQsTLTzboznqrLCxwrPV1y5ztO80AnI0ghQyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AJIOPI26LC95GJQBdn31FpfE5GTZzQLNkcqDkUEq4yj/tDVFiD2I5GjsRh2J/Mi+T
 Ifu88OZkeBVNdGtaR2unCdMLNCkG5R00gNUp2/Z54nXgffO7xqS1WnZjeOWRKIZZ2K
 MtRgrM2RA+S5BBwnWPUbUhqMwXTbCQQ1gJtp8KCHduen/5YsnS/MN6EPtxQtGwbJP2
 RMA7Lk7ed61FvLcCygqz3GjNzB59iZa2nzToYvnTFAk1NRbWC2Tm6xXwekD5kimr7q
 BWKmGoEV9lWjpmDBkJqize/rXD6hco+QJQLf09oJRjGiN/XWfjqe/yRayl0JZ/Exxi
 4wMirhQ3wuujw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mukul Joshi <mukul.joshi@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 28/43] drm/amdgpu: Fix VRAM memory accounting
Date: Tue,  7 May 2024 19:09:49 -0400
Message-ID: <20240507231033.393285-28-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507231033.393285-1-sashal@kernel.org>
References: <20240507231033.393285-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.30
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

From: Mukul Joshi <mukul.joshi@amd.com>

[ Upstream commit f06446ef23216090d1ee8ede1a7d7ae430c22dcc ]

Subtract the VRAM pinned memory when checking for available memory
in amdgpu_amdkfd_reserve_mem_limit function since that memory is not
available for use.

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 15c5a2533ba60..704567885c7a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -213,7 +213,7 @@ int amdgpu_amdkfd_reserve_mem_limit(struct amdgpu_device *adev,
 	    (kfd_mem_limit.ttm_mem_used + ttm_mem_needed >
 	     kfd_mem_limit.max_ttm_mem_limit) ||
 	    (adev && xcp_id >= 0 && adev->kfd.vram_used[xcp_id] + vram_needed >
-	     vram_size - reserved_for_pt)) {
+	     vram_size - reserved_for_pt - atomic64_read(&adev->vram_pin_size))) {
 		ret = -ENOMEM;
 		goto release;
 	}
-- 
2.43.0

