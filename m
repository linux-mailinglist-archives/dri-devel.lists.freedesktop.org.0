Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D134A2E119C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C051D6E87E;
	Wed, 23 Dec 2020 02:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0CC6E876;
 Wed, 23 Dec 2020 02:16:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C347C2222D;
 Wed, 23 Dec 2020 02:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689792;
 bh=KGUIjWyHk5k5wLQRat+bVLgNWSjZT8KzbcmGdtuIDLU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kUYtPTgUDvALT4q+v0FZmvJF+M+63bRNI51g0vbssdKtXLkNZYbCVMGenrDF30FHe
 M9PUGXenA8kJ75AqsySJUkVJeUfX5oroJrvgUgrJILwaBAD4BAVuMpsQEhk/6RgBay
 fNBi3zgIx4zAmDE5JvJAwZemJHuyzV+5CBftKJrwh/872+hCTLkYO6LpbJ/8bgjxJ8
 so1tc0JYcdxbhkdGZgSuKiFEYJrpLOzw+PIKz0TBGigmzucALhnFurw668uUbcDfiS
 EZozNvcjdh7CH2fTsAa5L3dHpE9X2kDQ2pWugy6MpBq+RDhpqf6Q07AuGQq6XnxMCY
 bIP9IQ4anI0wA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 004/217] drm/amd/display: setup system context in
 dm_init
Date: Tue, 22 Dec 2020 21:12:53 -0500
Message-Id: <20201223021626.2790791-4-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Yifan Zhang <yifan1.zhang@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yifan Zhang <yifan1.zhang@amd.com>

[ Upstream commit c0fb85ae02b62bded71110f44e8b0fe34f11260f ]

[why]
display S/G mode fails in Renoir

[how]
Setup system context in dm init.

Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0f7749e9424d4..547928cf284b5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -921,12 +921,67 @@ static void amdgpu_check_debugfs_connector_property_change(struct amdgpu_device
 	}
 }
 
+static void mmhub_read_system_context(struct amdgpu_device *adev, struct dc_phy_addr_space_config *pa_config)
+{
+	uint64_t pt_base;
+	uint32_t logical_addr_low;
+	uint32_t logical_addr_high;
+	uint32_t agp_base, agp_bot, agp_top;
+	PHYSICAL_ADDRESS_LOC page_table_start, page_table_end, page_table_base;
+
+	logical_addr_low  = min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18;
+	pt_base = amdgpu_gmc_pd_addr(adev->gart.bo);
+
+	if (adev->apu_flags & AMD_APU_IS_RAVEN2)
+		/*
+		 * Raven2 has a HW issue that it is unable to use the vram which
+		 * is out of MC_VM_SYSTEM_APERTURE_HIGH_ADDR. So here is the
+		 * workaround that increase system aperture high address (add 1)
+		 * to get rid of the VM fault and hardware hang.
+		 */
+		logical_addr_high = max((adev->gmc.fb_end >> 18) + 0x1, adev->gmc.agp_end >> 18);
+	else
+		logical_addr_high = max(adev->gmc.fb_end, adev->gmc.agp_end) >> 18;
+
+	agp_base = 0;
+	agp_bot = adev->gmc.agp_start >> 24;
+	agp_top = adev->gmc.agp_end >> 24;
+
+
+	page_table_start.high_part = (u32)(adev->gmc.gart_start >> 44) & 0xF;
+	page_table_start.low_part = (u32)(adev->gmc.gart_start >> 12);
+	page_table_end.high_part = (u32)(adev->gmc.gart_end >> 44) & 0xF;
+	page_table_end.low_part = (u32)(adev->gmc.gart_end >> 12);
+	page_table_base.high_part = upper_32_bits(pt_base) & 0xF;
+	page_table_base.low_part = lower_32_bits(pt_base);
+
+	pa_config->system_aperture.start_addr = (uint64_t)logical_addr_low << 18;
+	pa_config->system_aperture.end_addr = (uint64_t)logical_addr_high << 18;
+
+	pa_config->system_aperture.agp_base = (uint64_t)agp_base << 24 ;
+	pa_config->system_aperture.agp_bot = (uint64_t)agp_bot << 24;
+	pa_config->system_aperture.agp_top = (uint64_t)agp_top << 24;
+
+	pa_config->system_aperture.fb_base = adev->gmc.fb_start;
+	pa_config->system_aperture.fb_offset = adev->gmc.aper_base;
+	pa_config->system_aperture.fb_top = adev->gmc.fb_end;
+
+	pa_config->gart_config.page_table_start_addr = page_table_start.quad_part << 12;
+	pa_config->gart_config.page_table_end_addr = page_table_end.quad_part << 12;
+	pa_config->gart_config.page_table_base_addr = page_table_base.quad_part;
+
+	pa_config->is_hvm_enabled = 0;
+
+}
+
+
 static int amdgpu_dm_init(struct amdgpu_device *adev)
 {
 	struct dc_init_data init_data;
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 	struct dc_callback_init init_params;
 #endif
+	struct dc_phy_addr_space_config pa_config;
 	int r;
 
 	adev->dm.ddev = adev_to_drm(adev);
@@ -1030,6 +1085,11 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 
 	dc_hardware_init(adev->dm.dc);
 
+	mmhub_read_system_context(adev, &pa_config);
+
+	// Call the DC init_memory func
+	dc_setup_system_context(adev->dm.dc, &pa_config);
+
 	adev->dm.freesync_module = mod_freesync_create(adev->dm.dc);
 	if (!adev->dm.freesync_module) {
 		DRM_ERROR(
@@ -1073,6 +1133,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 		goto error;
 	}
 
+
 	DRM_DEBUG_DRIVER("KMS initialized.\n");
 
 	return 0;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
