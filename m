Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F411385231D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 01:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B14510E23D;
	Tue, 13 Feb 2024 00:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TNon0623";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720E510E23D;
 Tue, 13 Feb 2024 00:19:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7EE7E6101E;
 Tue, 13 Feb 2024 00:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923D9C433F1;
 Tue, 13 Feb 2024 00:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707783570;
 bh=YtZoeSc5wThDzrqhQZJibdxh6/kPDakwPfAOeT08oRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TNon0623S6n1nNqshilUgpLxj4aKpvMlq6rHfLzXuWN10BjzXF7VqpQkMBp96Zb/u
 LRCubuodZnx7nwBHWkqiFsjj8elZnZsuETScUFqZn78rJFfq13S1EqIg3yJy/+3iou
 R8eP9trz3XeV/4ex3MX+Fte6WFLYv11xXI8rV54LKhMxP/TLypqsZ6p1xMbXSBoXes
 7iPDNnyjM8t+wfgwHnfs2XYAcL9fxvEkcZp5vK5z6ZUg/OyOTXrVbAcS0xlXxIMYa9
 LxKZhWI23rUlXGTrzMoAIqhIJKfJB8+tUAlBr2c/rjF15I8z8fRWHuJt6teFvmq86w
 RyBZP1FShvxog==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@redhat.com>,
 Sasha Levin <sashal@kernel.org>, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, airlied@redhat.com, bskeggs@redhat.com,
 dan.carpenter@linaro.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.7 35/58] drm/nouveau: nvkm_gsp_radix3_sg() should
 use nvkm_gsp_mem_ctor()
Date: Mon, 12 Feb 2024 19:17:41 -0500
Message-ID: <20240213001837.668862-35-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213001837.668862-1-sashal@kernel.org>
References: <20240213001837.668862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.4
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

From: Timur Tabi <ttabi@nvidia.com>

[ Upstream commit 34e659f34a7559ecfd9c1f5b24d4c291f3f54711 ]

Function nvkm_gsp_radix3_sg() uses nvkm_gsp_mem objects to allocate the
radix3 tables, but it unnecessarily creates those objects manually
instead of using the standard nvkm_gsp_mem_ctor() function like the
rest of the code does.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240202230608.1981026-2-ttabi@nvidia.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 9ee58e2a0eb2..09e2eb1369cb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1938,20 +1938,20 @@ nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_radix3 *rx3)
  * See kgspCreateRadix3_IMPL
  */
 static int
-nvkm_gsp_radix3_sg(struct nvkm_device *device, struct sg_table *sgt, u64 size,
+nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
 		   struct nvkm_gsp_radix3 *rx3)
 {
 	u64 addr;
 
 	for (int i = ARRAY_SIZE(rx3->mem) - 1; i >= 0; i--) {
 		u64 *ptes;
-		int idx;
+		size_t bufsize;
+		int ret, idx;
 
-		rx3->mem[i].size = ALIGN((size / GSP_PAGE_SIZE) * sizeof(u64), GSP_PAGE_SIZE);
-		rx3->mem[i].data = dma_alloc_coherent(device->dev, rx3->mem[i].size,
-						      &rx3->mem[i].addr, GFP_KERNEL);
-		if (WARN_ON(!rx3->mem[i].data))
-			return -ENOMEM;
+		bufsize = ALIGN((size / GSP_PAGE_SIZE) * sizeof(u64), GSP_PAGE_SIZE);
+		ret = nvkm_gsp_mem_ctor(gsp, bufsize, &rx3->mem[i]);
+		if (ret)
+			return ret;
 
 		ptes = rx3->mem[i].data;
 		if (i == 2) {
@@ -1991,7 +1991,7 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 		if (ret)
 			return ret;
 
-		ret = nvkm_gsp_radix3_sg(gsp->subdev.device, &gsp->sr.sgt, len, &gsp->sr.radix3);
+		ret = nvkm_gsp_radix3_sg(gsp, &gsp->sr.sgt, len, &gsp->sr.radix3);
 		if (ret)
 			return ret;
 
@@ -2194,7 +2194,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	memcpy(gsp->sig.data, data, size);
 
 	/* Build radix3 page table for ELF image. */
-	ret = nvkm_gsp_radix3_sg(device, &gsp->fw.mem.sgt, gsp->fw.len, &gsp->radix3);
+	ret = nvkm_gsp_radix3_sg(gsp, &gsp->fw.mem.sgt, gsp->fw.len, &gsp->radix3);
 	if (ret)
 		return ret;
 
-- 
2.43.0

