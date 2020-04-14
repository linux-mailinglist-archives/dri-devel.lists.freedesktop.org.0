Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC691A9410
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E0A6E86A;
	Wed, 15 Apr 2020 07:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 383 seconds by postgrey-1.36 at gabe;
 Tue, 14 Apr 2020 11:41:50 UTC
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745AE89A0E;
 Tue, 14 Apr 2020 11:41:50 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.122])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 8F71F4E1434;
 Tue, 14 Apr 2020 19:35:23 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Bernard Zhao <bernard@vivo.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>, Oak Zeng <Oak.Zeng@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Alex Sierra <alex.sierra@amd.com>,
 Huang Rui <ray.huang@amd.com>, Kent Russell <kent.russell@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Optimized division operation to shift operation
Date: Tue, 14 Apr 2020 04:35:08 -0700
Message-Id: <1586864113-30682-1-git-send-email-bernard@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VOS01LS0tLT0pCTUpNTFlXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nxw6Ajo*Tjg1TwoNNAg1Fz4v
 Lk0KFDJVSlVKTkNNQ01PSklIQk5OVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSUlZV1kIAVlBT0NPSTcG
X-HM-Tid: 0a717878efd19376kuws8f71f4e1434
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Cc: kernel@vivo.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some processors, the / operate will call the compiler`s div lib,
which is low efficient, We can replace the / operation with shift,
so that we can replace the call of the division library with one
shift assembly instruction.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index b205039..66cd078 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -175,10 +175,10 @@ static int gmc_v6_0_mc_load_microcode(struct amdgpu_device *adev)
 	amdgpu_ucode_print_mc_hdr(&hdr->header);
 
 	adev->gmc.fw_version = le32_to_cpu(hdr->header.ucode_version);
-	regs_size = le32_to_cpu(hdr->io_debug_size_bytes) / (4 * 2);
+	regs_size = le32_to_cpu(hdr->io_debug_size_bytes) >> 3;
 	new_io_mc_regs = (const __le32 *)
 		(adev->gmc.fw->data + le32_to_cpu(hdr->io_debug_array_offset_bytes));
-	ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
+	ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) >> 2;
 	new_fw_data = (const __le32 *)
 		(adev->gmc.fw->data + le32_to_cpu(hdr->header.ucode_array_offset_bytes));
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 9da9596..ca26d63 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -193,10 +193,10 @@ static int gmc_v7_0_mc_load_microcode(struct amdgpu_device *adev)
 	amdgpu_ucode_print_mc_hdr(&hdr->header);
 
 	adev->gmc.fw_version = le32_to_cpu(hdr->header.ucode_version);
-	regs_size = le32_to_cpu(hdr->io_debug_size_bytes) / (4 * 2);
+	regs_size = le32_to_cpu(hdr->io_debug_size_bytes) >> 3;
 	io_mc_regs = (const __le32 *)
 		(adev->gmc.fw->data + le32_to_cpu(hdr->io_debug_array_offset_bytes));
-	ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
+	ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) >> 2;
 	fw_data = (const __le32 *)
 		(adev->gmc.fw->data + le32_to_cpu(hdr->header.ucode_array_offset_bytes));
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 27d83204..295039c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -318,10 +318,10 @@ static int gmc_v8_0_tonga_mc_load_microcode(struct amdgpu_device *adev)
 	amdgpu_ucode_print_mc_hdr(&hdr->header);
 
 	adev->gmc.fw_version = le32_to_cpu(hdr->header.ucode_version);
-	regs_size = le32_to_cpu(hdr->io_debug_size_bytes) / (4 * 2);
+	regs_size = le32_to_cpu(hdr->io_debug_size_bytes) >> 3;
 	io_mc_regs = (const __le32 *)
 		(adev->gmc.fw->data + le32_to_cpu(hdr->io_debug_array_offset_bytes));
-	ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
+	ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) >> 2;
 	fw_data = (const __le32 *)
 		(adev->gmc.fw->data + le32_to_cpu(hdr->header.ucode_array_offset_bytes));
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
