Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9786FFA50
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 21:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8980010E5E4;
	Thu, 11 May 2023 19:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3198110E5E2;
 Thu, 11 May 2023 19:38:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B44765130;
 Thu, 11 May 2023 19:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2059EC433D2;
 Thu, 11 May 2023 19:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683833927;
 bh=sFUO+vpzCiWBGoO+srCvWTH4pb/exyaIQBM2bCBCvFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ciMVh49fteftCG6g+4FahaOds9X2K9pf+m/KFoLr+z08GP57T1d4VaP8hufpNGdIy
 A0/m8Hc45f8jK7S5q5QO5qdKGbkXxNxdC4rDTdi0+BBKkYq8t5MIYvw8dI2V+1p7kj
 65A5pCph3mbg9bqUwJ58vfpSq0MdRe3E6BxCG/qATVAptCS8O/JdM68gTlv2MYALPk
 L62BPudvub5DmLhur54mgqMmRQXEuj2b/cWDRBUTKBXXA8s59sFKGWEpcd7a8c40i/
 SMShTqc3soakquzxUg8ixUsQKkEj9a3i2Ra4I/FFWGeRDaeQ2Pd0P1IoFrEHzV7bKF
 Teiu7lV8tyBOg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 11/11] drm/amdgpu: Use the default reset when
 loading or reloading the driver
Date: Thu, 11 May 2023 15:37:54 -0400
Message-Id: <20230511193757.623114-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230511193757.623114-1-sashal@kernel.org>
References: <20230511193757.623114-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, andrey.grodzovsky@amd.com,
 lijo.lazar@amd.com, Amaranath.Somalapuram@amd.com,
 lyndonli <Lyndon.Li@amd.com>, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 Yunxiang Li <Yunxiang.Li@amd.com>, YiPeng.Chai@amd.com,
 mario.limonciello@amd.com, Feifei Xu <Feifei.Xu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Bokun.Zhang@amd.com,
 Kenneth Feng <kenneth.feng@amd.com>, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: lyndonli <Lyndon.Li@amd.com>

[ Upstream commit 4eea7fb980dc44545a32eec92e2662053b34cd9d ]

Below call trace and errors are observed when reloading
amdgpu driver with the module parameter reset_method=3.

It should do a default reset when loading or reloading the
driver, regardless of the module parameter reset_method.

v2: add comments inside and modify commit messages.

[  +2.180243] [drm] psp gfx command ID_LOAD_TOC(0x20) failed
and response status is (0x0)
[  +0.000011] [drm:psp_hw_start [amdgpu]] *ERROR* Failed to load toc
[  +0.000890] [drm:psp_hw_start [amdgpu]] *ERROR* PSP tmr init failed!
[  +0.020683] [drm:amdgpu_fill_buffer [amdgpu]] *ERROR* Trying to
clear memory with ring turned off.
[  +0.000003] RIP: 0010:amdgpu_bo_release_notify+0x1ef/0x210 [amdgpu]
[  +0.000004] Call Trace:
[  +0.000003]  <TASK>
[  +0.000008]  ttm_bo_release+0x2c4/0x330 [amdttm]
[  +0.000026]  amdttm_bo_put+0x3c/0x70 [amdttm]
[  +0.000020]  amdgpu_bo_free_kernel+0xe6/0x140 [amdgpu]
[  +0.000728]  psp_v11_0_ring_destroy+0x34/0x60 [amdgpu]
[  +0.000826]  psp_hw_init+0xe7/0x2f0 [amdgpu]
[  +0.000813]  amdgpu_device_fw_loading+0x1ad/0x2d0 [amdgpu]
[  +0.000731]  amdgpu_device_init.cold+0x108e/0x2002 [amdgpu]
[  +0.001071]  ? do_pci_enable_device+0xe1/0x110
[  +0.000011]  amdgpu_driver_load_kms+0x1a/0x160 [amdgpu]
[  +0.000729]  amdgpu_pci_probe+0x179/0x3a0 [amdgpu]

Signed-off-by: lyndonli <Lyndon.Li@amd.com>
Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7543683b2583f..b1a2d4b0918fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3557,6 +3557,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	int r, i;
 	bool px = false;
 	u32 max_MBps;
+	int tmp;
 
 	adev->shutdown = false;
 	adev->flags = flags;
@@ -3778,7 +3779,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 				}
 			}
 		} else {
+			tmp = amdgpu_reset_method;
+			/* It should do a default reset when loading or reloading the driver,
+			 * regardless of the module parameter reset_method.
+			 */
+			amdgpu_reset_method = AMD_RESET_METHOD_NONE;
 			r = amdgpu_asic_reset(adev);
+			amdgpu_reset_method = tmp;
 			if (r) {
 				dev_err(adev->dev, "asic reset on init failed\n");
 				goto failed;
-- 
2.39.2

