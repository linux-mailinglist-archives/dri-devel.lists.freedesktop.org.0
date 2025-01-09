Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEA4A0825E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 22:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0829310E491;
	Thu,  9 Jan 2025 21:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W+881NUz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9E910E491
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 21:45:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 385075C5762;
 Thu,  9 Jan 2025 21:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D83E4C4CED2;
 Thu,  9 Jan 2025 21:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736459147;
 bh=x1Etwqy25T2cCi3wQmsU8C/+30NvCYSgEUW/RuFb1GE=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=W+881NUzEB1Sjz413b7vJxit7iDCuZGxGhKLN9I8VgLQBVx3Gg0J6bobscHPLphRS
 TIk5s2iXc1FIqCQ6GKNyNUCHqLTiOKyLrxQPkNNyd8B3U4vUlSwkIgbWtFmewZ90YN
 1jn2lt/0k7/VKDTDAenQBqEmcaKJ664gci36kl3payTay+clwsRVSzXTAXf876o1f9
 08ZqOdeE7k+13DM6mxBXDoBwJscr8kwJ8e3xoJUGsJsOX1H+prRb3wr6lFC/FB3Sdm
 qmTsEfNrktjinIhYuyLreArFOhoCNx+b+Fly3o6w0ktgCj5PXgsl8Ge4x3Pe4F2KmN
 kCqT5PE/BKy6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id CDDBBE7719A;
 Thu,  9 Jan 2025 21:45:47 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Thu, 09 Jan 2025 22:45:46 +0100
Subject: [PATCH] drm/virtio: Support partial maps of GEM objects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-virtgpu-gem-partial-map-v1-1-a914b48776bd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIlDgGcC/x3MTQqAIBBA4avErBvQSqGuEi2kJhvoR8aKILx70
 vJbvPdCJGGK0BUvCN0c+dgzdFnAuLjdE/KUDZWqjNKqxZvl9OFCTxsGJye7FTcXsK4NjY2yxk4
 ach2EZn7+cz+k9AG7IPqtaQAAAA==
X-Change-ID: 20250109-virtgpu-gem-partial-map-335ec40656d1
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736459146; l=1210;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=6LaFAVHHmrz+1IfVs72P1kiVYM0D1mQ7zg4Ht9kbRhU=;
 b=a9a4yi1JLL93u7BZpaJzIF6IITCFbBFAUMuKnh7fGXMrwgkF7Il9gEb5VBIkbOhjguOZiL1zz
 12Ar6JMxxb5AnfUsdFILyBjAOjDb96QbUMLStBIL0vBG1sNmoeNR72p
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
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
Reply-To: fnkl.kernel@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Those are useful to implement coherent cross-vm mmap.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_vram.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 25df81c027837c248a746e41856b5aa7e216b8d5..64e2c6dbdd678ac4c0da89fdd4c9dbf937c2c335 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -56,12 +56,11 @@ static int virtio_gpu_vram_mmap(struct drm_gem_object *obj,
 	else if (vram->map_info == VIRTIO_GPU_MAP_CACHE_UNCACHED)
 		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
-	/* Partial mappings of GEM buffers don't happen much in practice. */
-	if (vm_size != vram->vram_node.size)
+	if (vm_size > vram->vram_node.size)
 		return -EINVAL;
 
 	ret = io_remap_pfn_range(vma, vma->vm_start,
-				 vram->vram_node.start >> PAGE_SHIFT,
+				 (vram->vram_node.start >> PAGE_SHIFT) + vma->vm_pgoff,
 				 vm_size, vma->vm_page_prot);
 	return ret;
 }

---
base-commit: 643e2e259c2b25a2af0ae4c23c6e16586d9fd19c
change-id: 20250109-virtgpu-gem-partial-map-335ec40656d1


