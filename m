Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E57EBC0B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 04:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B556210E40A;
	Wed, 15 Nov 2023 03:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B7C10E40A;
 Wed, 15 Nov 2023 03:35:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 77949B8187E;
 Wed, 15 Nov 2023 03:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3E6C433C8;
 Wed, 15 Nov 2023 03:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700019351;
 bh=2WGgb7yNtdhFlSqoQXfIwyPXflWYu3Ndlt45lPMjquY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OFl7CBSV17NnEFp374Uv1hrZZzwnACxy8DxaQ0OcQ1BPWyM/lb4DewTxrosgWejsX
 CunNK29Ag1QudJzLcW/B4D0ZNOmptMyOZnmC63IgoaYbo9Z36erJRYA62zaNC5pA4V
 ginNNHBcUvr+x0djdGuQxKoUuCzIaROIbPuJH0+hNyH2KupegyxNhYUrMclA1i+Uat
 qxuM/X3Sw/yD5LtNDjbC5YAVwdS4AEctX20XCBQg9fp3jMCHw2HAm28E/lbo/MuvFm
 V7ovzSnCPu40NcASk779YxMCQLZucXjdryWo4t5xJPHUtqWITc6/08/5wyJux2/AG+
 TaPor7LEd+Lgg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 5/6] drm/amdgpu: fix software pci_unplug on some
 chips
Date: Tue, 14 Nov 2023 22:34:49 -0500
Message-ID: <20231115033459.1228900-5-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115033459.1228900-1-sashal@kernel.org>
References: <20231115033459.1228900-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.11
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
Cc: Sasha Levin <sashal@kernel.org>, tao.zhou1@amd.com, kevinyang.wang@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, YiPeng.Chai@amd.com,
 Luben Tuikov <luben.tuikov@amd.com>, Stanley.Yang@amd.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

[ Upstream commit 4638e0c29a3f2294d5de0d052a4b8c9f33ccb957 ]

When software 'pci unplug' using IGT is executed we got a sysfs directory
entry is NULL for differant ras blocks like hdp, umc, etc.
Before call 'sysfs_remove_file_from_group' and 'sysfs_remove_group'
check that 'sd' is  not NULL.

[  +0.000001] RIP: 0010:sysfs_remove_group+0x83/0x90
[  +0.000002] Code: 31 c0 31 d2 31 f6 31 ff e9 9a a8 b4 00 4c 89 e7 e8 f2 a2 ff ff eb c2 49 8b 55 00 48 8b 33 48 c7 c7 80 65 94 82 e8 cd 82 bb ff <0f> 0b eb cc 66 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90
[  +0.000001] RSP: 0018:ffffc90002067c90 EFLAGS: 00010246
[  +0.000002] RAX: 0000000000000000 RBX: ffffffff824ea180 RCX: 0000000000000000
[  +0.000001] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[  +0.000001] RBP: ffffc90002067ca8 R08: 0000000000000000 R09: 0000000000000000
[  +0.000001] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[  +0.000001] R13: ffff88810a395f48 R14: ffff888101aab0d0 R15: 0000000000000000
[  +0.000001] FS:  00007f5ddaa43a00(0000) GS:ffff88841e800000(0000) knlGS:0000000000000000
[  +0.000002] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0.000001] CR2: 00007f8ffa61ba50 CR3: 0000000106432000 CR4: 0000000000350ef0
[  +0.000001] Call Trace:
[  +0.000001]  <TASK>
[  +0.000001]  ? show_regs+0x72/0x90
[  +0.000002]  ? sysfs_remove_group+0x83/0x90
[  +0.000002]  ? __warn+0x8d/0x160
[  +0.000001]  ? sysfs_remove_group+0x83/0x90
[  +0.000001]  ? report_bug+0x1bb/0x1d0
[  +0.000003]  ? handle_bug+0x46/0x90
[  +0.000001]  ? exc_invalid_op+0x19/0x80
[  +0.000002]  ? asm_exc_invalid_op+0x1b/0x20
[  +0.000003]  ? sysfs_remove_group+0x83/0x90
[  +0.000001]  dpm_sysfs_remove+0x61/0x70
[  +0.000002]  device_del+0xa3/0x3d0
[  +0.000002]  ? ktime_get_mono_fast_ns+0x46/0xb0
[  +0.000002]  device_unregister+0x18/0x70
[  +0.000001]  i2c_del_adapter+0x26d/0x330
[  +0.000002]  arcturus_i2c_control_fini+0x25/0x50 [amdgpu]
[  +0.000236]  smu_sw_fini+0x38/0x260 [amdgpu]
[  +0.000241]  amdgpu_device_fini_sw+0x116/0x670 [amdgpu]
[  +0.000186]  ? mutex_lock+0x13/0x50
[  +0.000003]  amdgpu_driver_release_kms+0x16/0x40 [amdgpu]
[  +0.000192]  drm_minor_release+0x4f/0x80 [drm]
[  +0.000025]  drm_release+0xfe/0x150 [drm]
[  +0.000027]  __fput+0x9f/0x290
[  +0.000002]  ____fput+0xe/0x20
[  +0.000002]  task_work_run+0x61/0xa0
[  +0.000002]  exit_to_user_mode_prepare+0x150/0x170
[  +0.000002]  syscall_exit_to_user_mode+0x2a/0x50

Cc: Hawking Zhang <hawking.zhang@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 7d5019a884024..2003be3390aab 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1380,7 +1380,8 @@ static void amdgpu_ras_sysfs_remove_bad_page_node(struct amdgpu_device *adev)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
 
-	sysfs_remove_file_from_group(&adev->dev->kobj,
+	if (adev->dev->kobj.sd)
+		sysfs_remove_file_from_group(&adev->dev->kobj,
 				&con->badpages_attr.attr,
 				RAS_FS_NAME);
 }
@@ -1397,7 +1398,8 @@ static int amdgpu_ras_sysfs_remove_feature_node(struct amdgpu_device *adev)
 		.attrs = attrs,
 	};
 
-	sysfs_remove_group(&adev->dev->kobj, &group);
+	if (adev->dev->kobj.sd)
+		sysfs_remove_group(&adev->dev->kobj, &group);
 
 	return 0;
 }
@@ -1444,7 +1446,8 @@ int amdgpu_ras_sysfs_remove(struct amdgpu_device *adev,
 	if (!obj || !obj->attr_inuse)
 		return -EINVAL;
 
-	sysfs_remove_file_from_group(&adev->dev->kobj,
+	if (adev->dev->kobj.sd)
+		sysfs_remove_file_from_group(&adev->dev->kobj,
 				&obj->sysfs_attr.attr,
 				RAS_FS_NAME);
 	obj->attr_inuse = 0;
-- 
2.42.0

