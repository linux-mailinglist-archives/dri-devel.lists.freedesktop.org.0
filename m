Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E811746385D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763F06EA30;
	Tue, 30 Nov 2021 14:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784626E91B;
 Tue, 30 Nov 2021 14:57:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40A2BB81A37;
 Tue, 30 Nov 2021 14:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3169C53FC7;
 Tue, 30 Nov 2021 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283779;
 bh=UWaPvN5oZyn4yvPCKhSxfQUZAcXLn6ZBTjeLOgP5BQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aF8i41X2dMXw3T2J1ufEf37t8yQ/qSdeUerzrfCBT6KVbCBztyFSGaTxuFfHSHPKZ
 360379Ms0GjdzJNJ0wkqRXhaO4CnJDokRu/Vyp1flrxe3YI3YKMYebVaJkHGPD7Tse
 aaC60pv2nVeU0yhUlDOrco13TU4HcN754Vq5btjCtXYCpBtAvt+AaPQD+Azc4xPYs4
 0DlXMnKQVAjbFW6zGACbyTXFlkOqG2twAE5OFAwa4nfXVY3rnbDUG1fPuDXOhvaH4W
 Z6Asua+2r8Uq+ckBxq7vks6sRKPuwiLpTIO3pV5C8NSa5b2rGDKUrIKpTh8X6gsy45
 pHYctUSmoeqQg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 56/68] drm/amdgpu: Fix double free of dmabuf
Date: Tue, 30 Nov 2021 09:46:52 -0500
Message-Id: <20211130144707.944580-56-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: xinhui pan <xinhui.pan@amd.com>

[ Upstream commit 4eb6bb649fe041472ddd00f94870c0b86ef49d34 ]

amdgpu_amdkfd_gpuvm_free_memory_of_gpu drop dmabuf reference increased in
amdgpu_gem_prime_export.
amdgpu_bo_destroy drop dmabuf reference increased in
amdgpu_gem_prime_import.

So remove this extra dma_buf_put to avoid double free.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
Tested-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index cdf46bd0d8d5b..3862470c7f1eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -644,12 +644,6 @@ kfd_mem_attach_dmabuf(struct amdgpu_device *adev, struct kgd_mem *mem,
 	if (IS_ERR(gobj))
 		return PTR_ERR(gobj);
 
-	/* Import takes an extra reference on the dmabuf. Drop it now to
-	 * avoid leaking it. We only need the one reference in
-	 * kgd_mem->dmabuf.
-	 */
-	dma_buf_put(mem->dmabuf);
-
 	*bo = gem_to_amdgpu_bo(gobj);
 	(*bo)->flags |= AMDGPU_GEM_CREATE_PREEMPTIBLE;
 	(*bo)->parent = amdgpu_bo_ref(mem->bo);
-- 
2.33.0

