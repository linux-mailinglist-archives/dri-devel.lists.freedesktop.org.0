Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D165985A76
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2196C10E9DB;
	Wed, 25 Sep 2024 12:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MEE1yHzr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F4A10E9DE;
 Wed, 25 Sep 2024 12:08:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4ACB5C5BFE;
 Wed, 25 Sep 2024 12:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C8CC4CECD;
 Wed, 25 Sep 2024 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727266093;
 bh=hcjXj2b6DyEXX6sx67kGasHZ8IDL964jReM/A2+m9es=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MEE1yHzrtnni5LbFGqHSJ7NP2WBcCafWeVHfPiQVpxCw7sTt2RpBMsk9nPf+tmkdI
 CXZSXk/NCWn4sg3BI+8wBf9rP8rSw5bVtad3HI+1XrNB+Y73ozb5mYchWPbO63IfW+
 E4ww1DnvBS+dg4np+OhNqIKjppMg5RTVNoxk6paEso2M23fMqLgjJ0XA2L/mrVNfGt
 sn6dFmW5BkOjCaovT1xNEswVy6vj13P5wtNFiyqEpZuGemwDY7WR7Nxq+iXKKKFdCB
 4gxPrNRmSTLk2GMO69ZSXS21fhqZfIEU5qb7N0lAqYWpwd0p2uAns0nDtFAK19lE4J
 B6pc7E7ajtMww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Victor Skvortsov <victor.skvortsov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Jun.Ma2@amd.com, kevinyang.wang@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sathishkumar.sundararaju@amd.com,
 boyuan.zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 170/197] drm/amdgpu: Block MMR_READ IOCTL in reset
Date: Wed, 25 Sep 2024 07:53:09 -0400
Message-ID: <20240925115823.1303019-170-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
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

From: Victor Skvortsov <victor.skvortsov@amd.com>

[ Upstream commit 9e823f307074c0f82b5f6044943b0086e3079bed ]

Register access from userspace should be blocked until
reset is complete.

Signed-off-by: Victor Skvortsov <victor.skvortsov@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 43 ++++++++++++++++++-------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 977cde6d13626..6d4e774b6cedc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -43,6 +43,7 @@
 #include "amdgpu_gem.h"
 #include "amdgpu_display.h"
 #include "amdgpu_ras.h"
+#include "amdgpu_reset.h"
 #include "amd_pcie.h"
 
 void amdgpu_unregister_gpu_instance(struct amdgpu_device *adev)
@@ -778,6 +779,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 				    ? -EFAULT : 0;
 	}
 	case AMDGPU_INFO_READ_MMR_REG: {
+		int ret = 0;
 		unsigned int n, alloc_size;
 		uint32_t *regs;
 		unsigned int se_num = (info->read_mmr_reg.instance >>
@@ -787,24 +789,37 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 				   AMDGPU_INFO_MMR_SH_INDEX_SHIFT) &
 				  AMDGPU_INFO_MMR_SH_INDEX_MASK;
 
+		if (!down_read_trylock(&adev->reset_domain->sem))
+			return -ENOENT;
+
 		/* set full masks if the userspace set all bits
 		 * in the bitfields
 		 */
-		if (se_num == AMDGPU_INFO_MMR_SE_INDEX_MASK)
+		if (se_num == AMDGPU_INFO_MMR_SE_INDEX_MASK) {
 			se_num = 0xffffffff;
-		else if (se_num >= AMDGPU_GFX_MAX_SE)
-			return -EINVAL;
-		if (sh_num == AMDGPU_INFO_MMR_SH_INDEX_MASK)
+		} else if (se_num >= AMDGPU_GFX_MAX_SE) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		if (sh_num == AMDGPU_INFO_MMR_SH_INDEX_MASK) {
 			sh_num = 0xffffffff;
-		else if (sh_num >= AMDGPU_GFX_MAX_SH_PER_SE)
-			return -EINVAL;
+		} else if (sh_num >= AMDGPU_GFX_MAX_SH_PER_SE) {
+			ret = -EINVAL;
+			goto out;
+		}
 
-		if (info->read_mmr_reg.count > 128)
-			return -EINVAL;
+		if (info->read_mmr_reg.count > 128) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		regs = kmalloc_array(info->read_mmr_reg.count, sizeof(*regs), GFP_KERNEL);
-		if (!regs)
-			return -ENOMEM;
+		if (!regs) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
 		alloc_size = info->read_mmr_reg.count * sizeof(*regs);
 
 		amdgpu_gfx_off_ctrl(adev, false);
@@ -816,13 +831,17 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 					      info->read_mmr_reg.dword_offset + i);
 				kfree(regs);
 				amdgpu_gfx_off_ctrl(adev, true);
-				return -EFAULT;
+				ret = -EFAULT;
+				goto out;
 			}
 		}
 		amdgpu_gfx_off_ctrl(adev, true);
 		n = copy_to_user(out, regs, min(size, alloc_size));
 		kfree(regs);
-		return n ? -EFAULT : 0;
+		ret = (n ? -EFAULT : 0);
+out:
+		up_read(&adev->reset_domain->sem);
+		return ret;
 	}
 	case AMDGPU_INFO_DEV_INFO: {
 		struct drm_amdgpu_info_device *dev_info;
-- 
2.43.0

