Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E254A881F0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1815110E5C8;
	Mon, 14 Apr 2025 13:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ixdHXDA1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272A510E529;
 Mon, 14 Apr 2025 13:28:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9AA625C5565;
 Mon, 14 Apr 2025 13:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D028C4CEEC;
 Mon, 14 Apr 2025 13:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744637287;
 bh=c4bb7948CzGoj3oK8R1FhfxFgh0zTsJGIPCWe8mgqO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ixdHXDA1oaXbJ/ajJJx/tnZGSTWVfbw19e9orAdL7Oik1ZXGBOEtcZBxtTS0JnMbo
 Yoa5S5s8606JbsHIbZB9b+SkLGk3TEnYNaSixzpjHYd6whDPzHhdWz5MEk3o/yyvcR
 JDnGmUJxpA1vyTKGjbQMorGbrluD5mhbGI7XQWDM6/ZFUtVDWR/k4ItyPyW8xvYYmM
 e+NEdtvKt5Wp1zTS3HWu3RTPYxrvUkqAUeOVmtsTqRQ6xrBsDBMwomele/SgzcYHFl
 VXnNRgZcOoijVxknRrtSGMo1CD4wI8ek9sM2yHPweRLsXNGhRh9o0NC23CbjzMpRyx
 sLVBQEN209/BQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>, Pak Nin Lui <pak.lui@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 airlied@gmail.com, simona@ffwll.ch, sumit.semwal@linaro.org,
 Yunxiang.Li@amd.com, tvrtko.ursulin@igalia.com, matthew.auld@intel.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 6.13 15/34] drm/amdgpu: allow pinning DMA-bufs into
 VRAM if all importers can do P2P
Date: Mon, 14 Apr 2025 09:27:09 -0400
Message-Id: <20250414132729.679254-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132729.679254-1-sashal@kernel.org>
References: <20250414132729.679254-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.11
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

From: Christian König <christian.koenig@amd.com>

[ Upstream commit f5e7fabd1f5c65b2e077efcdb118cfa67eae7311 ]

Try pinning into VRAM to allow P2P with RDMA NICs without ODP
support if all attachments can do P2P. If any attachment can't do
P2P just pin into GTT instead.

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Tested-by: Pak Nin Lui <pak.lui@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 25 +++++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 8e81a83d37d84..83390143c2e9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -72,11 +72,25 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
  */
 static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
 {
-	struct drm_gem_object *obj = attach->dmabuf->priv;
-	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+	struct dma_buf *dmabuf = attach->dmabuf;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(dmabuf->priv);
+	u32 domains = bo->preferred_domains;
 
-	/* pin buffer into GTT */
-	return amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
+	dma_resv_assert_held(dmabuf->resv);
+
+	/*
+	 * Try pinning into VRAM to allow P2P with RDMA NICs without ODP
+	 * support if all attachments can do P2P. If any attachment can't do
+	 * P2P just pin into GTT instead.
+	 */
+	list_for_each_entry(attach, &dmabuf->attachments, node)
+		if (!attach->peer2peer)
+			domains &= ~AMDGPU_GEM_DOMAIN_VRAM;
+
+	if (domains & AMDGPU_GEM_DOMAIN_VRAM)
+		bo->flags |= AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
+
+	return amdgpu_bo_pin(bo, domains);
 }
 
 /**
@@ -131,9 +145,6 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
 		r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 		if (r)
 			return ERR_PTR(r);
-
-	} else if (bo->tbo.resource->mem_type != TTM_PL_TT) {
-		return ERR_PTR(-EBUSY);
 	}
 
 	switch (bo->tbo.resource->mem_type) {
-- 
2.39.5

