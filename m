Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E092DF2E9
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 04:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FCC89CE2;
	Sun, 20 Dec 2020 03:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC3C89A8C;
 Sun, 20 Dec 2020 03:35:05 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 06/10] drm/amdkfd: Fix leak in dmabuf import
Date: Sat, 19 Dec 2020 22:34:53 -0500
Message-Id: <20201220033457.2728519-6-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201220033457.2728519-1-sashal@kernel.org>
References: <20201220033457.2728519-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 Kent Russell <kent.russell@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Felix Kuehling <Felix.Kuehling@amd.com>

[ Upstream commit c897934da15f182ce99536007f8ef61c4748c07e ]

Release dmabuf reference before returning from kfd_ioctl_import_dmabuf.
amdgpu_amdkfd_gpuvm_import_dmabuf takes a reference to the underlying
GEM BO and doesn't keep the reference to the dmabuf wrapper.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Kent Russell <kent.russell@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 1d3cd5c50d5f2..4a0ef9268918c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1664,6 +1664,7 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 	}
 
 	mutex_unlock(&p->mutex);
+	dma_buf_put(dmabuf);
 
 	args->handle = MAKE_HANDLE(args->gpu_id, idr_handle);
 
@@ -1673,6 +1674,7 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->kgd, (struct kgd_mem *)mem);
 err_unlock:
 	mutex_unlock(&p->mutex);
+	dma_buf_put(dmabuf);
 	return r;
 }
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
