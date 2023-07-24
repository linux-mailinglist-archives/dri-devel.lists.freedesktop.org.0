Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F124E75E69D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE9110E23B;
	Mon, 24 Jul 2023 01:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B249D10E23D;
 Mon, 24 Jul 2023 01:21:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 38FD960F02;
 Mon, 24 Jul 2023 01:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC8CC43395;
 Mon, 24 Jul 2023 01:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161697;
 bh=h0lbYusjsLR4jeJPqZG35r1XLxciahssI8+IRRwxdgU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PktDHyNkvdO4K0ldZuxe/1MnlTBvHPmPH7akb8FxtsE4lkus2PV0Whlq8bUW799Ly
 8/SowYBCoBzLUZP9Qz1G0X28OyvRu74QiYP4Eod0Qorq5dRcQcc0gkcpPS5dHj3LZM
 iziwABkAbRMP+H65ijlHTALOiX34CwY0Dkaaj2Q6gJtg8Fv+32FGf/Z0m3cShJmiwJ
 ilfGIvq/FeGo1lakNx2HX/C0fr1JjWf4DBweY8sGtcKqUi2RrntZnStQO6EQVL7jMH
 PKfztL0dGTX0KeBDEGjI9qkHHGnlvx9F/5VFyvadPEMJQnXHK4U2aRDkFu6magUcu0
 YHvtYVfImQaBQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 05/41] drm/amdgpu: fix memory leak in mes self test
Date: Sun, 23 Jul 2023 21:20:38 -0400
Message-Id: <20230724012118.2316073-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012118.2316073-1-sashal@kernel.org>
References: <20230724012118.2316073-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
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
Cc: Sasha Levin <sashal@kernel.org>, Jack Xiao <Jack.Xiao@amd.com>,
 Victor.Zhao@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Jiadong.Zhu@amd.com,
 christian.koenig@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jack Xiao <Jack.Xiao@amd.com>

[ Upstream commit 31d7c3a4fc3d312a0646990767647925d5bde540 ]

The fences associated with mes queue have to be freed
up during amdgpu_ring_fini.

Signed-off-by: Jack Xiao <Jack.Xiao@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index d3558c34d406c..296b2d5976af7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -361,6 +361,8 @@ void amdgpu_ring_fini(struct amdgpu_ring *ring)
 		amdgpu_bo_free_kernel(&ring->ring_obj,
 				      &ring->gpu_addr,
 				      (void **)&ring->ring);
+	} else {
+		kfree(ring->fence_drv.fences);
 	}
 
 	dma_fence_put(ring->vmid_wait);
-- 
2.39.2

