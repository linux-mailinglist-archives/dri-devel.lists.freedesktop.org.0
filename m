Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6E62502C6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 18:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806586E2EA;
	Mon, 24 Aug 2020 16:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F84189DC7;
 Mon, 24 Aug 2020 16:36:16 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E50022D71;
 Mon, 24 Aug 2020 16:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598286976;
 bh=jt5GKF3ZUZW3OriJu/VnqqbbvLcI5MlWdu6ygcpUs44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MznGpjvl0b7rn7EM//s0WCtb7ExOpKi1UsCD4v2/rOSvsIEyOIw9FmOAWqsyp9M4f
 oh+bvOXe1EzA/KNJOf5IFNK2vLpNa56PsQzsF1P3qNUoC5f1eAA9kJooEsja+ugHAL
 J24JRklOt80mmZEadtAkLgj7auZPAlAsH9ftj5ow=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 53/63] drm/amdgpu: fix NULL pointer access issue
 when unloading driver
Date: Mon, 24 Aug 2020 12:34:53 -0400
Message-Id: <20200824163504.605538-53-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824163504.605538-1-sashal@kernel.org>
References: <20200824163504.605538-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Guchun Chen <guchun.chen@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guchun Chen <guchun.chen@amd.com>

[ Upstream commit 1a68d96f81b8e7eb2a121fbf9abf9e5974e58832 ]

When unloading driver by "modprobe -r amdgpu", one NULL pointer
dereference bug occurs in ras debugfs releasing. The cause is the
duplicated debugfs_remove, as drm debugfs_root dir has been cleaned
up already by drm_minor_unregister.

BUG: kernel NULL pointer dereference, address: 00000000000000a0
PGD 0 P4D 0
Oops: 0002 [#1] SMP PTI
CPU: 11 PID: 1526 Comm: modprobe Tainted: G           OE     5.6.0-guchchen #1
Hardware name: System manufacturer System Product Name/TUF Z370-PLUS GAMING II, BIOS 0411 09/21/2018
RIP: 0010:down_write+0x15/0x40
Code: eb de e8 7e 17 72 ff cc cc cc cc cc cc cc cc cc cc cc cc cc cc 0f 1f 44 00 00 53 48 89 fb e8 92
d8 ff ff 31 c0 ba 01 00 00 00 <f0> 48 0f b1 13 75 0f 65 48 8b 04 25 c0 8b 01 00 48 89 43 08 5b c3
RSP: 0018:ffffb1590386fcd0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 00000000000000a0 RCX: 0000000000000000
RDX: 0000000000000001 RSI: ffffffff85b2fcc2 RDI: 00000000000000a0
RBP: ffffb1590386fd30 R08: ffffffff85b2fcc2 R09: 000000000002b3c0
R10: ffff97a330618c40 R11: 00000000000005f6 R12: ffff97a3481beb40
R13: 00000000000000a0 R14: ffff97a3481beb40 R15: 0000000000000000
FS:  00007fb11a717540(0000) GS:ffff97a376cc0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000000000a0 CR3: 00000004066d6006 CR4: 00000000003606e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 simple_recursive_removal+0x63/0x370
 ? debugfs_remove+0x60/0x60
 debugfs_remove+0x40/0x60
 amdgpu_ras_fini+0x82/0x230 [amdgpu]
 ? __kernfs_remove.part.17+0x101/0x1f0
 ? kernfs_name_hash+0x12/0x80
 amdgpu_device_fini+0x1c0/0x580 [amdgpu]
 amdgpu_driver_unload_kms+0x3e/0x70 [amdgpu]
 amdgpu_pci_remove+0x36/0x60 [amdgpu]
 pci_device_remove+0x3b/0xb0
 device_release_driver_internal+0xe5/0x1c0
 driver_detach+0x46/0x90
 bus_remove_driver+0x58/0xd0
 pci_unregister_driver+0x29/0x90
 amdgpu_exit+0x11/0x25 [amdgpu]
 __x64_sys_delete_module+0x13d/0x210
 do_syscall_64+0x5f/0x250
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Signed-off-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 50fe08bf2f727..5472fd26b3aa8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1240,7 +1240,6 @@ void amdgpu_ras_debugfs_remove(struct amdgpu_device *adev,
 	if (!obj || !obj->ent)
 		return;
 
-	debugfs_remove(obj->ent);
 	obj->ent = NULL;
 	put_obj(obj);
 }
@@ -1254,7 +1253,6 @@ static void amdgpu_ras_debugfs_remove_all(struct amdgpu_device *adev)
 		amdgpu_ras_debugfs_remove(adev, &obj->head);
 	}
 
-	debugfs_remove_recursive(con->dir);
 	con->dir = NULL;
 }
 /* debugfs end */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
