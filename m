Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CA293767D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 12:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B920E10EBA9;
	Fri, 19 Jul 2024 10:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ko4M6Yhs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0784F10EBA8;
 Fri, 19 Jul 2024 10:09:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E5A68CE1A80;
 Fri, 19 Jul 2024 10:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65670C32782;
 Fri, 19 Jul 2024 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721383777;
 bh=LnprOpQKJebgHBLc3MRc+ciaLm/ZxS3i/QrqnzrELrw=;
 h=From:To:Cc:Subject:Date:From;
 b=ko4M6YhsG3I1WkWIGxaERB1sFtkbU4OUzQkOTmCejfMWjmvaWrr7032GvDkSoQi3T
 3FZ3nUznUN5+X/HZ2IMKgSnebyYGuJEreAVOlEwpYQJk8xVrcBSV+W/63lsRE62/i2
 DO/RUMfSj4mnKOlx89GX/8uSJBmyAqSAFOeHNJxvgywJhj5gztZWSk+6ElyUKdx+ad
 6NQF0+ONz71lM/QB3M7XT9z1IjrFeemU5DFOB4xMoQBOqK+uEQJpicdOTdnbp/g0BF
 rTVLU5kwiwh9JVWcz+5BCbgh2KRYgoRqEAiFjX8KlLx0OYVdGUc4ex4hjbmluA7Js7
 L5pMEMDB1/1zg==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Alex Hung <alex.hung@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Roman Li <roman.li@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: Use a constant format string for amdgpu_ucode_request
Date: Fri, 19 Jul 2024 12:08:28 +0200
Message-Id: <20240719100929.94365-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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

From: Arnd Bergmann <arnd@arndb.de>

Multiple files in amdgpu call amdgpu_ucode_request() with a fw_name
variable that the compiler cannot check for being a valid format string,
as seen by enabling the (default-disabled) -Wformat-security option:

drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c: In function 'amdgpu_mes_init_microcode':
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1517:61: error: format not a string literal and no format arguments [-Werror=format-security]
 1517 |         r = amdgpu_ucode_request(adev, &adev->mes.fw[pipe], fw_name);
      |                                                             ^~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c: In function 'amdgpu_uvd_sw_init':
drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:263:9: error: format not a string literal and no format arguments [-Werror=format-security]
  263 |         r = amdgpu_ucode_request(adev, &adev->uvd.fw, fw_name);
      |         ^
drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c: In function 'amdgpu_vce_sw_init':
drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:161:9: error: format not a string literal and no format arguments [-Werror=format-security]
  161 |         r = amdgpu_ucode_request(adev, &adev->vce.fw, fw_name);
      |         ^
drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c: In function 'amdgpu_umsch_mm_init_microcode':
drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c:590:9: error: format not a string literal and no format arguments [-Werror=format-security]
  590 |         r = amdgpu_ucode_request(adev, &adev->umsch_mm.fw, fw_name);
      |         ^
drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c: In function 'amdgpu_cgs_get_firmware_info':
drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c:417:72: error: format not a string literal and no format arguments [-Werror=format-security]
  417 |                         err = amdgpu_ucode_request(adev, &adev->pm.fw, fw_name);
      |                                                                        ^~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'load_dmcu_fw':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2221:9: error: format not a string literal and no format arguments [-Werror=format-security]
 2221 |         r = amdgpu_ucode_request(adev, &adev->dm.fw_dmcu, fw_name_dmcu);
      |         ^
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'dm_init_microcode':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5147:9: error: format not a string literal and no format arguments [-Werror=format-security]
 5147 |         r = amdgpu_ucode_request(adev, &adev->dm.dmub_fw, fw_name_dmub);
      |         ^

Change these all to use a "%s" format with the actual name as an argument,
to let the compiler prove this to be correct.

Fixes: e5a7d047f41b ("drm/amd: Use `amdgpu_ucode_*` helpers for CGS")
Fixes: 52215e2a5d4a ("drm/amd: Use `amdgpu_ucode_*` helpers for VCE")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c           | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c           | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c      | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c           | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c           | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
index c3d89088123d..16153d275d7a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
@@ -414,7 +414,7 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
 				return -EINVAL;
 			}
 
-			err = amdgpu_ucode_request(adev, &adev->pm.fw, fw_name);
+			err = amdgpu_ucode_request(adev, &adev->pm.fw, "%s", fw_name);
 			if (err) {
 				DRM_ERROR("Failed to load firmware \"%s\"", fw_name);
 				amdgpu_ucode_release(&adev->pm.fw);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index e499d6ba306b..5d89a9a6f910 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1514,7 +1514,7 @@ int amdgpu_mes_init_microcode(struct amdgpu_device *adev, int pipe)
 			 pipe == AMDGPU_MES_SCHED_PIPE ? "" : "1");
 	}
 
-	r = amdgpu_ucode_request(adev, &adev->mes.fw[pipe], fw_name);
+	r = amdgpu_ucode_request(adev, &adev->mes.fw[pipe], "%s", fw_name);
 	if (r && need_retry && pipe == AMDGPU_MES_SCHED_PIPE) {
 		dev_info(adev->dev, "try to fall back to %s_mes.bin\n", ucode_prefix);
 		r = amdgpu_ucode_request(adev, &adev->mes.fw[pipe],
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
index fbc2852278e1..6162582d0aa2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -587,7 +587,7 @@ int amdgpu_umsch_mm_init_microcode(struct amdgpu_umsch_mm *umsch)
 		break;
 	}
 
-	r = amdgpu_ucode_request(adev, &adev->umsch_mm.fw, fw_name);
+	r = amdgpu_ucode_request(adev, &adev->umsch_mm.fw, "%s", fw_name);
 	if (r) {
 		release_firmware(adev->umsch_mm.fw);
 		adev->umsch_mm.fw = NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 07d930339b07..775c09d57222 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -260,7 +260,7 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
-	r = amdgpu_ucode_request(adev, &adev->uvd.fw, fw_name);
+	r = amdgpu_ucode_request(adev, &adev->uvd.fw, "%s", fw_name);
 	if (r) {
 		dev_err(adev->dev, "amdgpu_uvd: Can't validate firmware \"%s\"\n",
 			fw_name);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 968ca2c84ef7..51b045de409d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -158,7 +158,7 @@ int amdgpu_vce_sw_init(struct amdgpu_device *adev, unsigned long size)
 		return -EINVAL;
 	}
 
-	r = amdgpu_ucode_request(adev, &adev->vce.fw, fw_name);
+	r = amdgpu_ucode_request(adev, &adev->vce.fw, "%s", fw_name);
 	if (r) {
 		dev_err(adev->dev, "amdgpu_vce: Can't validate firmware \"%s\"\n",
 			fw_name);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7e7929f24ae4..80b7dc651f6b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2218,7 +2218,7 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
 		return 0;
 	}
 
-	r = amdgpu_ucode_request(adev, &adev->dm.fw_dmcu, fw_name_dmcu);
+	r = amdgpu_ucode_request(adev, &adev->dm.fw_dmcu, "%s", fw_name_dmcu);
 	if (r == -ENODEV) {
 		/* DMCU firmware is not necessary, so don't raise a fuss if it's missing */
 		DRM_DEBUG_KMS("dm: DMCU firmware not found\n");
@@ -5144,7 +5144,7 @@ static int dm_init_microcode(struct amdgpu_device *adev)
 		/* ASIC doesn't support DMUB. */
 		return 0;
 	}
-	r = amdgpu_ucode_request(adev, &adev->dm.dmub_fw, fw_name_dmub);
+	r = amdgpu_ucode_request(adev, &adev->dm.dmub_fw, "%s", fw_name_dmub);
 	return r;
 }
 
-- 
2.39.2

