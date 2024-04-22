Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C343E8AC3A7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 07:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91745112784;
	Mon, 22 Apr 2024 05:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126FE112784;
 Mon, 22 Apr 2024 05:27:04 +0000 (UTC)
X-QQ-mid: bizesmtp83t1713763605tapnhxvm
X-QQ-Originating-IP: IlITxjeKZMItJ6L/mAP+PlOCOE5Up/4g6uFI5ptulAM=
Received: from localhost.localdomain ( [123.114.60.34])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 22 Apr 2024 13:26:43 +0800 (CST)
X-QQ-SSF: 01400000000000E0L000000A0000000
X-QQ-FEAT: 3M0okmaRx3jJF+U+0sbRbMtRZ+cqdB72lcfAEiXlzzlf5ijaRGDqdQi0oLasc
 OKrVIjRsrdJAYl+DnzY3uCPY3LJ2NG8Kdu/uojBPeNPib2ltLG1+VHvWe+cQH5Xov4uExIk
 e/XYRDWzd5eFgdHrB427tEwBAk4yZMMKOL8UG3gGwXDVzQzcuFSnLaWjcWKsqd/fXxUffNQ
 V0+38LRNd9JX0o6bqq1fjLyn+vierbhBeBswBy0J2xzF+y3Qy24M7WDHbsEYTdTAxg0omI4
 9agGSmCz4ON0XFpA4tHHSttXd6bB3YqdvWuLsQndl6+obQXYbp+JU49gzc3Lh720rd94eLD
 C+EvQxJd4EUXK3DmqcHl4hXerj1ZpYubr2ZAIT3G7W7UK3euzb24+vEjbOcb4TUPLvq5Nod
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1870312449968284138
From: Qiang Ma <maqianga@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, srinivasan.shanmugam@amd.com,
 Arunpravin.PaneerSelvam@amd.com, maqianga@uniontech.com, le.ma@amd.com,
 Felix.Kuehling@amd.com, mukul.joshi@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fixup bad vram size on gmc v6 and v7
Date: Mon, 22 Apr 2024 13:26:08 +0800
Message-Id: <20240422052608.5297-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4a-0
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

Some boards(like Oland PRO: 0x1002:0x6613) seem to have
garbage in the upper 16 bits of the vram size register,
kern log as follows:

[    6.000000] [drm] Detected VRAM RAM=2256537600M, BAR=256M
[    6.007812] [drm] RAM width 64bits GDDR5
[    6.031250] [drm] amdgpu: 2256537600M of VRAM memory ready

This is obviously not true, check for this and clamp the size
properly. Fixes boards reporting bogus amounts of vram,
kern log as follows:

[    2.789062] [drm] Probable bad vram size: 0x86800800
[    2.789062] [drm] Detected VRAM RAM=2048M, BAR=256M
[    2.789062] [drm] RAM width 64bits GDDR5
[    2.789062] [drm] amdgpu: 2048M of VRAM memory ready

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 11 +++++++++--
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 13 ++++++++++---
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index 23b478639921..3703695f7789 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -309,8 +309,15 @@ static int gmc_v6_0_mc_init(struct amdgpu_device *adev)
 	}
 	adev->gmc.vram_width = numchan * chansize;
 	/* size in MB on si */
-	adev->gmc.mc_vram_size = RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
-	adev->gmc.real_vram_size = RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
+	tmp = RREG32(mmCONFIG_MEMSIZE);
+	/* some boards may have garbage in the upper 16 bits */
+	if (tmp & 0xffff0000) {
+		DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
+		if (tmp & 0xffff)
+			tmp &= 0xffff;
+	}
+	adev->gmc.mc_vram_size = tmp * 1024ULL * 1024ULL;
+	adev->gmc.real_vram_size = adev->gmc.mc_vram_size;
 
 	if (!(adev->flags & AMD_IS_APU)) {
 		r = amdgpu_device_resize_fb_bar(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 3da7b6a2b00d..1df1fc578ff6 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -316,10 +316,10 @@ static void gmc_v7_0_mc_program(struct amdgpu_device *adev)
 static int gmc_v7_0_mc_init(struct amdgpu_device *adev)
 {
 	int r;
+	u32 tmp;
 
 	adev->gmc.vram_width = amdgpu_atombios_get_vram_width(adev);
 	if (!adev->gmc.vram_width) {
-		u32 tmp;
 		int chansize, numchan;
 
 		/* Get VRAM informations */
@@ -363,8 +363,15 @@ static int gmc_v7_0_mc_init(struct amdgpu_device *adev)
 		adev->gmc.vram_width = numchan * chansize;
 	}
 	/* size in MB on si */
-	adev->gmc.mc_vram_size = RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
-	adev->gmc.real_vram_size = RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
+	tmp = RREG32(mmCONFIG_MEMSIZE);
+	/* some boards may have garbage in the upper 16 bits */
+	if (tmp & 0xffff0000) {
+		DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
+		if (tmp & 0xffff)
+			tmp &= 0xffff;
+	}
+	adev->gmc.mc_vram_size = tmp * 1024ULL * 1024ULL;
+	adev->gmc.real_vram_size = adev->gmc.mc_vram_size;
 
 	if (!(adev->flags & AMD_IS_APU)) {
 		r = amdgpu_device_resize_fb_bar(adev);
-- 
2.20.1

