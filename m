Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C8EA881E4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F2410E5BF;
	Mon, 14 Apr 2025 13:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Urp0phb3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8FB10E5BB;
 Mon, 14 Apr 2025 13:27:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CDFDA4A540;
 Mon, 14 Apr 2025 13:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0185CC4CEEB;
 Mon, 14 Apr 2025 13:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744637276;
 bh=PNaP345gDSSlxLCmwD5j7Q5zUx3k3pb511nj8ViwC28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Urp0phb3LQJBjCnNWZ0Rmx3qlgewZXlnRKfflWGQkjqw0gh/YKhbaZ05t6Vh1iywo
 N+EnhRaUPpE2ZMqXhwHD2dGbVntu7pwKE3gk21JG5ZtutEFP9BWYgeN40nvX08Q6x5
 QsMzDo+vzrKnqC1ybTurlFohoupT899kD6KMR8jOUVJnRPCPXlqQC59YAnWeWff+Qc
 WkXWkyQlNuhp3V0pv/v1MaZ/qr7yV7jZjwcGR73kEstnfuWYfjgkOd1AWtxAKflnPE
 POgpnusFSjXi56UMqFJ2m5bJJNgN+IeKDC0cF+Jo7u4oDM+f+xVbte/EhIaQKABuyb
 1IKYQIM/3dGDQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Emily Deng <Emily.Deng@amd.com>, Jonathan Kim <jonathan.kim@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 13/34] drm/amdkfd: sriov doesn't support per
 queue reset
Date: Mon, 14 Apr 2025 09:27:07 -0400
Message-Id: <20250414132729.679254-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132729.679254-1-sashal@kernel.org>
References: <20250414132729.679254-1-sashal@kernel.org>
MIME-Version: 1.0
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

From: Emily Deng <Emily.Deng@amd.com>

[ Upstream commit ba6d8f878d6180d4d0ed0574479fc1e232928184 ]

Disable per queue reset for sriov.

Signed-off-by: Emily Deng <Emily.Deng@amd.com>
Reviewed-by: Jonathan Kim <jonathan.kim@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 9476e30d6baa1..f45fb81cacd2f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1999,7 +1999,8 @@ static void kfd_topology_set_capabilities(struct kfd_topology_device *dev)
 			dev->node_props.capability |=
 				HSA_CAP_TRAP_DEBUG_PRECISE_MEMORY_OPERATIONS_SUPPORTED;
 
-		dev->node_props.capability |= HSA_CAP_PER_QUEUE_RESET_SUPPORTED;
+		if (!amdgpu_sriov_vf(dev->gpu->adev))
+			dev->node_props.capability |= HSA_CAP_PER_QUEUE_RESET_SUPPORTED;
 	} else {
 		dev->node_props.debug_prop |= HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX10 |
 					HSA_DBG_WATCH_ADDR_MASK_HI_BIT;
-- 
2.39.5

