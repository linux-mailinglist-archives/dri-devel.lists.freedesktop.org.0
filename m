Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48654191FC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 12:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27EF89C1F;
	Mon, 27 Sep 2021 10:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B18389C1F;
 Mon, 27 Sep 2021 10:07:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E90E60F6C;
 Mon, 27 Sep 2021 10:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632737228;
 bh=RSSh9gBBPVrUSqkquOGPV4KwAsLDi9ZDTrtzfbfg4TM=;
 h=From:To:Cc:Subject:Date:From;
 b=T1DT11BJaQ5L8SWfsWcX12m1MgjijPg4lxFmZpVmA9dCBvbAr3ga9jPADMSey4xZp
 z12Ek41HD89l5uCQy85IIKB9zNdvFUwSsGLThDK9XdHYtuxtSsdepMWPqZBF5eaT7U
 /N4Mi6aGOqJiEcOM39Ma3xIVwIDpg/tRSmGpSJfSE6RnWEA6Zjs+xsNSvXJU5myRVD
 pA1nvwAj9VEpSKQGr1oCR3q9T8B155urYlW18PYOD+o2uLEFQP/6kC5hB0rEH7cA5+
 jDR0Bp6ecH/ppVq6pUYpkF5eMCuEjsmNugvS8WVrraUN+WsotmWa/80xSiK5M32jgY
 VpfNffSpRU2eQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Jun Lei <Jun.Lei@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Anson Jacob <Anson.Jacob@amd.com>,
 Stylon Wang <stylon.wang@amd.com>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [RESEND] drm/amdgpu: fix enum odm_combine_mode mismatch
Date: Mon, 27 Sep 2021 12:06:27 +0200
Message-Id: <20210927100659.1431744-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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

A conversion from 'bool' to 'enum odm_combine_mode' was incomplete,
and gcc warns about this with many instances of

display/dc/dml/dcn20/display_mode_vba_20.c:3899:44: warning: implicit conversion from 'enum <anonymous>' to 'enum
odm_combine_mode' [-Wenum-conversion]
 3899 |     locals->ODMCombineEnablePerState[i][k] = false;

Change the ones that we get a warning for, using the same numerical
values to leave the behavior unchanged.

Fixes: 5fc11598166d ("drm/amd/display: expand dml structs")
Link: https://lore.kernel.org/all/20201026210039.3884312-3-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I cannot tell if this is the correct conversion, please review
carefully.

Tested on v5.15-rc2, please just ignore if a patch is already pending
for v5.15.

I got now reply to this patch when I originally sent it. With -Werror
being the default now, it is still needed to make the driver build, please
have another look.
---
 .../amd/display/dc/dml/dcn20/display_mode_vba_20.c   |  8 ++++----
 .../amd/display/dc/dml/dcn20/display_mode_vba_20v2.c | 10 +++++-----
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c   | 12 ++++++------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index f34bc3c8da41..69c41e3e3ba2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -3901,14 +3901,14 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = mode_lib->vba.PixelClock[k] / 2
 							* (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
 
-				locals->ODMCombineEnablePerState[i][k] = false;
+				locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
 				mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
 				if (mode_lib->vba.ODMCapability) {
 					if (locals->PlaneRequiredDISPCLKWithoutODMCombine > mode_lib->vba.MaxDispclkRoundedDownToDFSGranularity) {
-						locals->ODMCombineEnablePerState[i][k] = true;
+						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
 						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
 					} else if (locals->HActive[k] > DCN20_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
-						locals->ODMCombineEnablePerState[i][k] = true;
+						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
 						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
 					}
 				}
@@ -3961,7 +3961,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				locals->RequiredDISPCLK[i][j] = 0.0;
 				locals->DISPCLK_DPPCLK_Support[i][j] = true;
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-					locals->ODMCombineEnablePerState[i][k] = false;
+					locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
 					if (locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]) {
 						locals->NoOfDPP[i][j][k] = 1;
 						locals->RequiredDPPCLK[i][j][k] = locals->MinDPPCLKUsingSingleDPP[k]
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
index 719949ad49ed..3c8c03496611 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
@@ -4012,17 +4012,17 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 					mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = mode_lib->vba.PixelClock[k] / 2
 							* (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
 
-				locals->ODMCombineEnablePerState[i][k] = false;
+				locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
 				mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
 				if (mode_lib->vba.ODMCapability) {
 					if (locals->PlaneRequiredDISPCLKWithoutODMCombine > MaxMaxDispclkRoundedDown) {
-						locals->ODMCombineEnablePerState[i][k] = true;
+						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
 						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
 					} else if (locals->DSCEnabled[k] && (locals->HActive[k] > DCN20_MAX_DSC_IMAGE_WIDTH)) {
-						locals->ODMCombineEnablePerState[i][k] = true;
+						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
 						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
 					} else if (locals->HActive[k] > DCN20_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
-						locals->ODMCombineEnablePerState[i][k] = true;
+						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
 						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
 					}
 				}
@@ -4075,7 +4075,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
 				locals->RequiredDISPCLK[i][j] = 0.0;
 				locals->DISPCLK_DPPCLK_Support[i][j] = true;
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-					locals->ODMCombineEnablePerState[i][k] = false;
+					locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
 					if (locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]) {
 						locals->NoOfDPP[i][j][k] = 1;
 						locals->RequiredDPPCLK[i][j][k] = locals->MinDPPCLKUsingSingleDPP[k]
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index ffbe93b4d0c0..971a5af92118 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -3983,17 +3983,17 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = mode_lib->vba.PixelClock[k] / 2
 							* (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
 
-				locals->ODMCombineEnablePerState[i][k] = false;
+				locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
 				mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
 				if (mode_lib->vba.ODMCapability) {
 					if (locals->PlaneRequiredDISPCLKWithoutODMCombine > MaxMaxDispclkRoundedDown) {
-						locals->ODMCombineEnablePerState[i][k] = true;
+						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
 						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
 					} else if (locals->DSCEnabled[k] && (locals->HActive[k] > DCN21_MAX_DSC_IMAGE_WIDTH)) {
-						locals->ODMCombineEnablePerState[i][k] = true;
+						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
 						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
 					} else if (locals->HActive[k] > DCN21_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
-						locals->ODMCombineEnablePerState[i][k] = true;
+						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
 						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
 					}
 				}
@@ -4046,7 +4046,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				locals->RequiredDISPCLK[i][j] = 0.0;
 				locals->DISPCLK_DPPCLK_Support[i][j] = true;
 				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-					locals->ODMCombineEnablePerState[i][k] = false;
+					locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
 					if (locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]) {
 						locals->NoOfDPP[i][j][k] = 1;
 						locals->RequiredDPPCLK[i][j][k] = locals->MinDPPCLKUsingSingleDPP[k]
@@ -5222,7 +5222,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			mode_lib->vba.ODMCombineEnabled[k] =
 					locals->ODMCombineEnablePerState[mode_lib->vba.VoltageLevel][k];
 		} else {
-			mode_lib->vba.ODMCombineEnabled[k] = false;
+			mode_lib->vba.ODMCombineEnabled[k] = dm_odm_combine_mode_disabled;
 		}
 		mode_lib->vba.DSCEnabled[k] =
 				locals->RequiresDSC[mode_lib->vba.VoltageLevel][k];
-- 
2.29.2

