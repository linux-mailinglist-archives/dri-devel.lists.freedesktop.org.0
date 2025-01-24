Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6D4A1BE36
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 23:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BE410E051;
	Fri, 24 Jan 2025 22:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Yvld86VO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC03B10E051
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 22:01:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB5B95C6117;
 Fri, 24 Jan 2025 22:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A091C4CEE0;
 Fri, 24 Jan 2025 22:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737756079;
 bh=qLE2mO+ojZP3WRe77I73qtaKHV6sBKQCsfMgEoo6rjY=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=Yvld86VOJTczcfHrXZTiG8qfjUSC5KNew+1btbukzUqd7SfwI75QI60zflIy5ewlQ
 uF2Vd1FSs+LNvYucGOhWd3meaI5qdSRSiAPHlyf6S2hu3ksIXBBIZyz3FAB8qNbl1m
 SR7EUmPrB8qulijDa0N1Ehtjw9k/UpIN+vGNo4xfnCPsm5eNMBJ4ip/W/CRTZtnvNF
 LQBpnZRvGTeSHotpQVq1pVVQnmEwhB1OYhPtHf8bTSyiMJijBSnuRpuQ82/LlTsZsb
 JqC3mZNzvEgpR0o3xeViB29OPAVAMLKnNLUZtSK5+nCNAH5GzT8bSExnQ/B3Jw0vD7
 9JpfXrChk+hZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 81715C02181;
 Fri, 24 Jan 2025 22:01:19 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Fri, 24 Jan 2025 23:01:14 +0100
Subject: [PATCH RESEND] drm/virtio: Align host mapping request to maximum
 platform page size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-virtgpu-mixed-page-size-v1-1-480403790bac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737756078; l=1565;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=kZPtOSFoeKdYXDLiLMAu8imjAvkE+p3WWhtPNO7Zvzo=;
 b=9MWmwPjL413A+tDyynDLKuMS7XAcdCm2U6agLSkGrU1BjPo6jk642e7xrktGylUClUBhL0LTk
 StEaXCSrM8CCsIbzHXfKyb9W9PYGTmeIRjq3ZrgkqACvU4B9QKlVrW3
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

This allows running different page sizes between host and guest on
platforms that support mixed page sizes.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_vram.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 25df81c027837c248a746e41856b5aa7e216b8d5..8a0577c2170ec9c12cad12be57f9a41c14f04660 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -138,6 +138,12 @@ bool virtio_gpu_is_vram(struct virtio_gpu_object *bo)
 	return bo->base.base.funcs == &virtio_gpu_vram_funcs;
 }
 
+#if defined(__powerpc64__) || defined(__aarch64__) || defined(__mips__) || defined(__loongarch__)
+#define MAX_PAGE_SIZE 65536
+#else
+#define MAX_PAGE_SIZE PAGE_SIZE
+#endif
+
 static int virtio_gpu_vram_map(struct virtio_gpu_object *bo)
 {
 	int ret;
@@ -150,8 +156,8 @@ static int virtio_gpu_vram_map(struct virtio_gpu_object *bo)
 		return -EINVAL;
 
 	spin_lock(&vgdev->host_visible_lock);
-	ret = drm_mm_insert_node(&vgdev->host_visible_mm, &vram->vram_node,
-				 bo->base.base.size);
+	ret = drm_mm_insert_node_generic(&vgdev->host_visible_mm, &vram->vram_node,
+					 bo->base.base.size, MAX_PAGE_SIZE, 0, 0);
 	spin_unlock(&vgdev->host_visible_lock);
 
 	if (ret)

---
base-commit: 643e2e259c2b25a2af0ae4c23c6e16586d9fd19c
change-id: 20250109-virtgpu-mixed-page-size-282b8f4a02fc
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>


