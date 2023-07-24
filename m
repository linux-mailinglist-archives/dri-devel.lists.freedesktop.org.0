Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D8675E606
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44FC10E215;
	Mon, 24 Jul 2023 01:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF1810E1B7;
 Mon, 24 Jul 2023 01:13:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7609F60F0D;
 Mon, 24 Jul 2023 01:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009CBC433C7;
 Mon, 24 Jul 2023 01:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161233;
 bh=pD3QuC+FL9I7Oo9CGxSLMa8SJh6+uynZu4yKfY2SGlE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vo6G3yzF247T6P+n7KFDzQDYlZYhagbtDYdD9V0IVkqvKtIzOWX0KEG5WgeXSl7st
 F4xdeYtcQWDcOw3fo12f7wksVQbniQyoB+yH6iDCYuIVDevrDpAnnBZSCc6mo+zQIQ
 j4pzwkT6s8OTH2LPbpYXJ4lnr9mAD3AZ4OX0ekcj+6KZjATFeFaZ67jNC9XQneIz6R
 H0PcgrA1mmd6Jcul17M6KzMGDRrGXYWLhKk2tMhymCi2J+YwasRAfK00SAvJxrTwIo
 JMKYEqF/BrteOSVgbmnDhJCh2mQJa3yc9wzm0OoEVlsCA/eb6aTFCEtT0XiTmKkVl+
 wpFMuWq17d5CA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 04/58] drm/amdgpu: fix calltrace warning in
 amddrm_buddy_fini
Date: Sun, 23 Jul 2023 21:12:32 -0400
Message-Id: <20230724011338.2298062-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
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
Cc: Sasha Levin <sashal@kernel.org>, lijo.lazar@amd.com,
 srinivasan.shanmugam@amd.com, katrinzhou@tencent.com,
 Guchun Chen <guchun.chen@amd.com>, Longlong Yao <Longlong.Yao@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, mario.limonciello@amd.com,
 Lyndon.Li@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 candice.li@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Longlong Yao <Longlong.Yao@amd.com>

[ Upstream commit 01382501509871d0799bab6bd412c228486af5bf ]

The following call trace is observed when removing the amdgpu driver, which
is caused by that BOs allocated for psp are not freed until removing.

[61811.450562] RIP: 0010:amddrm_buddy_fini.cold+0x29/0x47 [amddrm_buddy]
[61811.450577] Call Trace:
[61811.450577]  <TASK>
[61811.450579]  amdgpu_vram_mgr_fini+0x135/0x1c0 [amdgpu]
[61811.450728]  amdgpu_ttm_fini+0x207/0x290 [amdgpu]
[61811.450870]  amdgpu_bo_fini+0x27/0xa0 [amdgpu]
[61811.451012]  gmc_v9_0_sw_fini+0x4a/0x60 [amdgpu]
[61811.451166]  amdgpu_device_fini_sw+0x117/0x520 [amdgpu]
[61811.451306]  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
[61811.451447]  devm_drm_dev_init_release+0x4d/0x80 [drm]
[61811.451466]  devm_action_release+0x15/0x20
[61811.451469]  release_nodes+0x40/0xb0
[61811.451471]  devres_release_all+0x9b/0xd0
[61811.451473]  __device_release_driver+0x1bb/0x2a0
[61811.451476]  driver_detach+0xf3/0x140
[61811.451479]  bus_remove_driver+0x6c/0xf0
[61811.451481]  driver_unregister+0x31/0x60
[61811.451483]  pci_unregister_driver+0x40/0x90
[61811.451486]  amdgpu_exit+0x15/0x447 [amdgpu]

For smu v13_0_2, if the GPU supports xgmi, refer to

commit f5c7e7797060 ("drm/amdgpu: Adjust removal control flow for smu v13_0_2"),

it will run gpu recover in AMDGPU_RESET_FOR_DEVICE_REMOVE mode when removing,
which makes all devices in hive list have hw reset but no resume except the
basic ip blocks, then other ip blocks will not call .hw_fini according to
ip_block.status.hw.

Since psp_free_shared_bufs just includes some software operations, so move
it to psp_sw_fini.

Reviewed-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>
Signed-off-by: Longlong Yao <Longlong.Yao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index a150b7a4b4aae..fc58a51cb0c00 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -520,6 +520,8 @@ static int psp_sw_fini(void *handle)
 	kfree(cmd);
 	cmd = NULL;
 
+	psp_free_shared_bufs(psp);
+
 	if (psp->km_ring.ring_mem)
 		amdgpu_bo_free_kernel(&adev->firmware.rbuf,
 				      &psp->km_ring.ring_mem_mc_addr,
@@ -2655,8 +2657,6 @@ static int psp_hw_fini(void *handle)
 
 	psp_ring_destroy(psp, PSP_RING_TYPE__KM);
 
-	psp_free_shared_bufs(psp);
-
 	return 0;
 }
 
-- 
2.39.2

