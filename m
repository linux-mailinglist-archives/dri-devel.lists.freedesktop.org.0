Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFECA88205
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D02510E5CB;
	Mon, 14 Apr 2025 13:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iVXAXUee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F2410E5CD;
 Mon, 14 Apr 2025 13:29:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CCAB6A400D4;
 Mon, 14 Apr 2025 13:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F4DC4CEE2;
 Mon, 14 Apr 2025 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744637357;
 bh=c4bb7948CzGoj3oK8R1FhfxFgh0zTsJGIPCWe8mgqO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iVXAXUeeFIpbuFrX1dt9n5owMHjvrN0THlc3RDTVhG/9QhBg7NlJOD8mxsnDigNar
 JBWor0hZC+yxq4jVix51Y2dWZqkBwdNiPELjU1U4sBWQ6tTaQkOduj4KISU6M+xNyc
 3fG4oF7sNvSRTVmwaWSHO/h4PKbnXAJofj4r8JOrImr7IaKWZdaAyfWISvv1or9ufl
 2tXYTOGxPc5g45W+xiWZf/bA8q8YsJ9fkY41lUywjhWtAWErrhMeC+mFU0OeHxV8+b
 oXxnw3MKKFeUj30uvFghqMHO0PFGXqtNzm8IJN8PhjO7S8VXcQPfmhz9VN+CejvF+1
 gYK6wCc7kI26A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>, Pak Nin Lui <pak.lui@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 airlied@gmail.com, simona@ffwll.ch, sumit.semwal@linaro.org,
 Yunxiang.Li@amd.com, matthew.auld@intel.com, tvrtko.ursulin@igalia.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 6.12 11/30] drm/amdgpu: allow pinning DMA-bufs into
 VRAM if all importers can do P2P
Date: Mon, 14 Apr 2025 09:28:28 -0400
Message-Id: <20250414132848.679855-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132848.679855-1-sashal@kernel.org>
References: <20250414132848.679855-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.23
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

