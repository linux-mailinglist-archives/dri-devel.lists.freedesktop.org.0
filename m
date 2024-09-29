Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AD4989397
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 09:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD7110E138;
	Sun, 29 Sep 2024 07:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869CD10E138;
 Sun, 29 Sep 2024 07:51:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 966185C1045;
 Sun, 29 Sep 2024 07:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DD6C4CEC5;
 Sun, 29 Sep 2024 07:51:18 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] Revert "drm/radeon: use GEM references instead of TTMs"
Date: Sun, 29 Sep 2024 15:50:58 +0800
Message-ID: <20240929075058.3542013-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit fd69ef05029f9beb7b031ef96e7a36970806a670.

The original patch causes NULL pointer references:

[   21.620856] CPU 3 Unable to handle kernel paging request at virtual address 0000000000000000, era == 9000000004bf61d8, ra == 9000000004bf61d4
[   21.717958] Oops[#1]:
[   21.803205] CPU: 3 UID: 0 PID: 706 Comm: Xorg Not tainted 6.11.0+ #1708
[   21.894451] Hardware name: Loongson Loongson-3A5000-7A1000-1w-CRB/Loongson-LS3A5000-7A1000-1w-CRB, BIOS vUDK2018-LoongArch-V2.0.0-prebeta9 10/21/2022
[   21.996576] pc 9000000004bf61d8 ra 9000000004bf61d4 tp 9000000110560000 sp 9000000110563d40
[   22.094731] a0 000000000000002d a1 9000000000580788 a2 9000000000584d78 a3 9000000005678f40
[   22.193513] a4 9000000005678f38 a5 9000000110563b70 a6 0000000000000001 a7 0000000000000001
[   22.291993] t0 0000000000000000 t1 78315f0d31fceafb t2 0000000000000000 t3 00000000000003c4
[   22.389868] t4 9000000101d65840 t5 0000000000000003 t6 0000000000000003 t7 ffffffffffffffff
[   22.488326] t8 0000000000000001 u0 9000000120c31e20 s9 9000000110563ec0 s0 90000001107e0868
[   22.587345] s1 ffff80000230c000 s2 9000000120c31e48 s3 9000000120c31e00 s4 90000001063b0000
[   22.685908] s5 9000000120c31e20 s6 0000000000000122 s7 0000000000000100 s8 000055555c079570
[   22.785169]    ra: 9000000004bf61d4 drm_gem_object_free+0x24/0x70
[   22.881896]   ERA: 9000000004bf61d8 drm_gem_object_free+0x28/0x70
[   22.978212]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[   23.076423]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[   23.153679] [drm] amdgpu kernel modesetting enabled.
[   23.173074]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
[   23.365633]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[   23.459680] ESTAT: 00010000 [PIL] (IS= ECode=1 EsubCode=0)
[   23.554473]  BADV: 0000000000000000
[   23.646222]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
[   23.740356] Modules linked in: amdgpu rfkill nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct drm_exec amdxcps
[   23.973584] Process Xorg (pid: 706, threadinfo=000000005fc343eb, task=000000007bdfdf49)
[   24.080528] Stack : 9000000120d86000 ffff8000021bb1c0 0000000000000000 ffff8000022a6bcc
[   24.188191]         0000000000000122 9000000120c31d08 900000010e04a400 9000000120c31e00
[   24.295420]         90000001063b0008 9000000120c31c00 90000001063b0000 ffff80000219c54c
[   24.402622]         00000000000000b4 90000001063b0170 90000001063b0008 9000000120c31c00
[   24.509242]         9000000120c31ce0 90000000043966f8 000055555c0922c0 000055555c082ac0
[   24.615887]         000055555597b000 0000000000000000 90000001034af840 90000001063f7928
[   24.723086]         90000001063b00d0 9000000120c31c00 90000001063b0008 9000000004396844
[   24.830582]         90000001017901a0 90000001017901a0 900000010e7e6718 00000000000a001b
[   24.937455]         90000001228b86c0 9000000003ad5904 000055555c082da0 0000000000000000
[   25.043806]         000055555c082ac0 90000001228b86c0 0000000000000000 9000000003acfb58
[   25.149701]         ...
[   25.248708] Call Trace:
[   25.248710] [<9000000004bf61d8>] drm_gem_object_free+0x28/0x70
[   25.447554] [<ffff8000021bb1bc>] radeon_bo_unref+0x3c/0x60 [radeon]
[   25.549201] [<ffff8000022a6bc8>] radeon_vm_fini+0x188/0x2c0 [radeon]
[   25.650751] [<ffff80000219c548>] radeon_driver_postclose_kms+0x188/0x1e0 [radeon]
[   25.753856] [<90000000043966f4>] drm_file_free+0x214/0x2a0
[   25.854893] [<9000000004396840>] drm_release+0xc0/0x160
[   25.954337] [<9000000003ad5900>] __fput+0x100/0x340
[   26.052437] [<9000000003acfb54>] sys_close+0x34/0xa0
[   26.148701] [<9000000004c04170>] do_syscall+0xb0/0x160

The root cause is obj->funcs is NULL in drm_gem_object_free(). Only
fbdev bo is created by radeon_gem_object_create() and has valid 'funcs'.

Maybe there is a better way to fix this bug, but since amdgpu driver
also use ttm helpers in amdgpu_bo_ref()/amdgpu_bo_unref() now, I think
it is also reasonable to just revert the original commit.
---
 drivers/gpu/drm/radeon/radeon_gem.c    | 2 +-
 drivers/gpu/drm/radeon/radeon_object.c | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 9735f4968b86..210e8d43bb23 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -88,7 +88,7 @@ static void radeon_gem_object_free(struct drm_gem_object *gobj)
 
 	if (robj) {
 		radeon_mn_unregister(robj);
-		ttm_bo_put(&robj->tbo);
+		radeon_bo_unref(&robj);
 	}
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index d0e4b43d155c..450ff7daa46c 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -256,15 +256,18 @@ struct radeon_bo *radeon_bo_ref(struct radeon_bo *bo)
 	if (bo == NULL)
 		return NULL;
 
-	drm_gem_object_get(&bo->tbo.base);
+	ttm_bo_get(&bo->tbo);
 	return bo;
 }
 
 void radeon_bo_unref(struct radeon_bo **bo)
 {
+	struct ttm_buffer_object *tbo;
+
 	if ((*bo) == NULL)
 		return;
-	drm_gem_object_put(&(*bo)->tbo.base);
+	tbo = &((*bo)->tbo);
+	ttm_bo_put(tbo);
 	*bo = NULL;
 }
 
-- 
2.43.5

