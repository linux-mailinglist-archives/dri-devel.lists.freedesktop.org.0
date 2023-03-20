Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 795296C072A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 01:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F68A10E10D;
	Mon, 20 Mar 2023 00:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E3F10E0EB;
 Mon, 20 Mar 2023 00:55:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E3E961122;
 Mon, 20 Mar 2023 00:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4E1C4339B;
 Mon, 20 Mar 2023 00:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679273715;
 bh=f9FdH9zwOoW1vm4Ust8+KYJDSMeinCSbsWbTMuDnivI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=an9VXBi0X9g1lmmouXq0wNZ5W9ene9ftnwuzbBh96bQHIA9qB5kSgZQLXO5ursC4q
 whEF0YH9zKFJfamA0PtuszOELqp/oiHdfO7AXShbFG8CYGpPMK+JHfIJXFyVPg3r1U
 hCDmCvFkG03hMC8GVtwX28OADw91eYICa4dps8ju20gFxgUejM39eTHKgi2TO6utkT
 L8cYaWJ6seeefu9h2M0Kc4DvAseKFG6C5jiZsXbdbvUTxqdOgN9ptaP7dimRYM2MTG
 oNuFWY52qP9nDmke+jXm8A+sCPa0JPGJGlE7nq4Dcnm0GF3ZeVk45k7wJTMuNUwNcK
 ZYrrxRfulANqQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 28/29] drm/amdgpu: Fix call trace warning and hang
 when removing amdgpu device
Date: Sun, 19 Mar 2023 20:54:10 -0400
Message-Id: <20230320005413.1428452-28-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320005413.1428452-1-sashal@kernel.org>
References: <20230320005413.1428452-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Philip.Yang@amd.com,
 Guchun Chen <guchun.chen@amd.com>, sunpeng.li@amd.com,
 lyndonli <Lyndon.Li@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: lyndonli <Lyndon.Li@amd.com>

[ Upstream commit 93bb18d2a873d2fa9625c8ea927723660a868b95 ]

On GPUs with RAS enabled, below call trace and hang are observed when
shutting down device.

v2: use DRM device unplugged flag instead of shutdown flag as the check to
prevent memory wipe in shutdown stage.

[ +0.000000] RIP: 0010:amdgpu_vram_mgr_fini+0x18d/0x1c0 [amdgpu]
[ +0.000001] PKRU: 55555554
[ +0.000001] Call Trace:
[ +0.000001] <TASK>
[ +0.000002] amdgpu_ttm_fini+0x140/0x1c0 [amdgpu]
[ +0.000183] amdgpu_bo_fini+0x27/0xa0 [amdgpu]
[ +0.000184] gmc_v11_0_sw_fini+0x2b/0x40 [amdgpu]
[ +0.000163] amdgpu_device_fini_sw+0xb6/0x510 [amdgpu]
[ +0.000152] amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
[ +0.000090] drm_dev_release+0x28/0x50 [drm]
[ +0.000016] devm_drm_dev_init_release+0x38/0x60 [drm]
[ +0.000011] devm_action_release+0x15/0x20
[ +0.000003] release_nodes+0x40/0xc0
[ +0.000001] devres_release_all+0x9e/0xe0
[ +0.000001] device_unbind_cleanup+0x12/0x80
[ +0.000003] device_release_driver_internal+0xff/0x160
[ +0.000001] driver_detach+0x4a/0x90
[ +0.000001] bus_remove_driver+0x6c/0xf0
[ +0.000001] driver_unregister+0x31/0x50
[ +0.000001] pci_unregister_driver+0x40/0x90
[ +0.000003] amdgpu_exit+0x15/0x120 [amdgpu]

Signed-off-by: lyndonli <Lyndon.Li@amd.com>
Reviewed-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index cfd78c4a45baa..4feedf518a191 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1312,7 +1312,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 
 	if (!bo->resource || bo->resource->mem_type != TTM_PL_VRAM ||
 	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE) ||
-	    adev->in_suspend || adev->shutdown)
+	    adev->in_suspend || drm_dev_is_unplugged(adev_to_drm(adev)))
 		return;
 
 	if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
-- 
2.39.2

