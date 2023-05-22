Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183AE70BC4A
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFC910E2EA;
	Mon, 22 May 2023 11:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22EF10E2EA;
 Mon, 22 May 2023 11:51:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6186F6179D;
 Mon, 22 May 2023 11:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2EBC4339B;
 Mon, 22 May 2023 11:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684756279;
 bh=TRV8Ny4PJMXTeyf3oIo1EZT/b+jnBF0oOM2xdHt1ejw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lsvk8ncsJzq6J/GHSZvjZVawAB94qDoWC6ys2sgjuJaP5QNX10ARI3Qp5eL8l1VVq
 9MTWkFCzshBJdQfHusdOiTCdXKTM8r2bpRwDXPIp5o81CBHnR6/ZyjbvFoGdENPb+h
 Wavnsq+Hzzu77LtogSIvbxOdUyf5HySLQRz+dLNHw/X4yHfvVVnWqF0NXPtwUPqJ0y
 zPN3DV0/8tr3p3U/16CpyXY+q5fUZOcH2FqpFmnKGzBASV/4VVpio4vJ/qU3wkA2RX
 OLvBYSEXWqIRs7ghJPmG1fGg7DxfPSZMj2dyQlkaLmsPkGAPXM54JGDlAloZWJWvK9
 E1a3u8u34pR4Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Subject: [PATCH 4/5] drm/amdgpu: use %pad format string for dma_addr_t
Date: Mon, 22 May 2023 13:50:31 +0200
Message-Id: <20230522115047.1169839-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522115047.1169839-1-arnd@kernel.org>
References: <20230522115047.1169839-1-arnd@kernel.org>
MIME-Version: 1.0
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Le Ma <le.ma@amd.com>,
 amd-gfx@lists.freedesktop.org, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

DMA addresses can be shorter than u64, which results in a broken debug output:

drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c: In function 'amdgpu_gart_table_ram_alloc':
drivers/gpu/drm/amd/amdgpu/amdgpu.h:41:22: error: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Werror=format=]
drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c:146:9: note: in expansion of macro 'dev_info'
  146 |         dev_info(adev->dev, "%s dma_addr:%llx\n", __func__, dma_addr);

Use the special %pad format string and pass the DMA address by reference.

Fixes: d020a29b6b58 ("drm/amdgpu: Allocate GART table in RAM for AMD APU")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
index a070adf30c88..73b8cca35bab 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
@@ -143,7 +143,7 @@ int amdgpu_gart_table_ram_alloc(struct amdgpu_device *adev)
 		return -EFAULT;
 	}
 
-	dev_info(adev->dev, "%s dma_addr:%llx\n", __func__, dma_addr);
+	dev_info(adev->dev, "%s dma_addr:%pad\n", __func__, &dma_addr);
 	/* Create SG table */
 	sg = kmalloc(sizeof(*sg), GFP_KERNEL);
 	if (!sg) {
-- 
2.39.2

