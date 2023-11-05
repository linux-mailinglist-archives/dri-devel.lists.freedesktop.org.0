Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E06497E1448
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 17:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2215210E0CA;
	Sun,  5 Nov 2023 16:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.gentoo.org (mail.gentoo.org
 [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145AA10E0CA;
 Sun,  5 Nov 2023 16:07:07 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] amdgpu: Adjust kmalloc_array calls for new -Walloc-size
Date: Sun,  5 Nov 2023 16:06:50 +0000
Message-ID: <20231105160652.374422-1-sam@gentoo.org>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <87wmuwo7i3.fsf@gentoo.org>
References: <87wmuwo7i3.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, Sam James <sam@gentoo.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GCC 14 introduces a new -Walloc-size included in -Wextra which errors out
on various files in drivers/gpu/drm/amd/amdgpu like:
```
amdgpu_amdkfd_gfx_v8.c:241:15: error: allocation of insufficient size ‘4’ for type ‘uint32_t[2]’ {aka ‘unsigned int[2]'} with size ‘8’ [-Werror=alloc-size]
```

This is because each HQD_N_REGS is actually a uint32_t[2]. Move the * 2 to
the size argument so GCC sees we're allocating enough.

Originally did 'sizeof(uint32_t) * 2' for the size but a friend suggested
'sizeof(**dump)' better communicates the intent.

Link: https://lore.kernel.org/all/87wmuwo7i3.fsf@gentoo.org/
Signed-off-by: Sam James <sam@gentoo.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c   | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c   | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c   | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 625db444df1c..0ba15dcbe4e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -200,7 +200,7 @@ int kgd_arcturus_hqd_sdma_dump(struct amdgpu_device *adev,
 #undef HQD_N_REGS
 #define HQD_N_REGS (19+6+7+10)
 
-	*dump = kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c
index 490c8f5ddb60..ca7238b5535b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c
@@ -141,7 +141,7 @@ static int kgd_gfx_v9_4_3_hqd_sdma_dump(struct amdgpu_device *adev,
 		(*dump)[i++][1] = RREG32(addr);         \
 	} while (0)
 
-	*dump = kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
index 6bf448ab3dff..ca4a6b82817f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
@@ -214,7 +214,7 @@ static int kgd_hqd_dump(struct amdgpu_device *adev,
 		(*dump)[i++][1] = RREG32(addr);		\
 	} while (0)
 
-	*dump = kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
@@ -301,7 +301,7 @@ static int kgd_hqd_sdma_dump(struct amdgpu_device *adev,
 #undef HQD_N_REGS
 #define HQD_N_REGS (19+4)
 
-	*dump = kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
index cd06e4a6d1da..0f3e2944edd7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
@@ -238,7 +238,7 @@ static int kgd_hqd_dump(struct amdgpu_device *adev,
 		(*dump)[i++][1] = RREG32(addr);		\
 	} while (0)
 
-	*dump = kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
@@ -324,7 +324,7 @@ static int kgd_hqd_sdma_dump(struct amdgpu_device *adev,
 #undef HQD_N_REGS
 #define HQD_N_REGS (19+4+2+3+7)
 
-	*dump = kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 51011e8ee90d..a3355b90aac5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -365,7 +365,7 @@ int kgd_gfx_v9_hqd_dump(struct amdgpu_device *adev,
 		(*dump)[i++][1] = RREG32(addr);		\
 	} while (0)
 
-	*dump = kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
@@ -462,7 +462,7 @@ static int kgd_hqd_sdma_dump(struct amdgpu_device *adev,
 #undef HQD_N_REGS
 #define HQD_N_REGS (19+6+7+10)
 
-	*dump = kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
-- 
2.42.1

