Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CD56A376D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B7D10E32B;
	Mon, 27 Feb 2023 02:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A2C10E32A;
 Mon, 27 Feb 2023 02:09:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 33DCB60DC6;
 Mon, 27 Feb 2023 02:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2200C433EF;
 Mon, 27 Feb 2023 02:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463753;
 bh=rQxYrJD3g4LgoxFVKeR+kXDNSUDuXB1g06cX4FsxdZ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D/I2AbLU68c6Z/yO/5rJUrBzMGtmlHeLJJfkiP7vuaBT7C3mBXV6bbyl09Uw0j2ZP
 pQKmYYksBXMgNSGTiic4XNkYpwSXj8sQiypmK4Y7KIGIWpoA1sLQoFeMUM7Hc4KXAQ
 00KQ4aK/R4x4HTM91B/5W6dTdQCGWZIyhQnRlgJYDkRftPQxU2M+WQOH9c1ZPvy5Lr
 JEvf0HhfpMUimdzTRWZ7NrJ8aECC8yhFsIlXfHAjj98NvAa+79rsl9ymr8o59zyLBG
 rhiDspgy4KT23VyuZLI+FXj8WeJ/DlZJKeGOeAyR2kA+EOv1qyvSAmdP+tn086Z6s9
 zVcK2QkL0as4g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 06/25] drm/radeon: free iio for atombios when
 driver shutdown
Date: Sun, 26 Feb 2023 21:08:29 -0500
Message-Id: <20230227020855.1051605-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020855.1051605-1-sashal@kernel.org>
References: <20230227020855.1051605-1-sashal@kernel.org>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, Liwei Song <liwei.song@windriver.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Liwei Song <liwei.song@windriver.com>

[ Upstream commit 4773fadedca918faec443daaca5e4ea1c0ced144 ]

Fix below kmemleak when unload radeon driver:

unreferenced object 0xffff9f8608ede200 (size 512):
  comm "systemd-udevd", pid 326, jiffies 4294682822 (age 716.338s)
  hex dump (first 32 bytes):
    00 00 00 00 c4 aa ec aa 14 ab 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000062fadebe>] kmem_cache_alloc_trace+0x2f1/0x500
    [<00000000b6883cea>] atom_parse+0x117/0x230 [radeon]
    [<00000000158c23fd>] radeon_atombios_init+0xab/0x170 [radeon]
    [<00000000683f672e>] si_init+0x57/0x750 [radeon]
    [<00000000566cc31f>] radeon_device_init+0x559/0x9c0 [radeon]
    [<0000000046efabb3>] radeon_driver_load_kms+0xc1/0x1a0 [radeon]
    [<00000000b5155064>] drm_dev_register+0xdd/0x1d0
    [<0000000045fec835>] radeon_pci_probe+0xbd/0x100 [radeon]
    [<00000000e69ecca3>] pci_device_probe+0xe1/0x160
    [<0000000019484b76>] really_probe.part.0+0xc1/0x2c0
    [<000000003f2649da>] __driver_probe_device+0x96/0x130
    [<00000000231c5bb1>] driver_probe_device+0x24/0xf0
    [<0000000000a42377>] __driver_attach+0x77/0x190
    [<00000000d7574da6>] bus_for_each_dev+0x7f/0xd0
    [<00000000633166d2>] driver_attach+0x1e/0x30
    [<00000000313b05b8>] bus_add_driver+0x12c/0x1e0

iio was allocated in atom_index_iio() called by atom_parse(),
but it doesn't got released when the dirver is shutdown.
Fix this kmemleak by free it in radeon_atombios_fini().

Signed-off-by: Liwei Song <liwei.song@windriver.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 92905ebb7b459..1c005e0ddd388 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1022,6 +1022,7 @@ void radeon_atombios_fini(struct radeon_device *rdev)
 {
 	if (rdev->mode_info.atom_context) {
 		kfree(rdev->mode_info.atom_context->scratch);
+		kfree(rdev->mode_info.atom_context->iio);
 	}
 	kfree(rdev->mode_info.atom_context);
 	rdev->mode_info.atom_context = NULL;
-- 
2.39.0

