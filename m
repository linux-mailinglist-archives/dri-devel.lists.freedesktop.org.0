Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DFB3BCC4D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A7F6E0F6;
	Tue,  6 Jul 2021 11:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085846E0F0;
 Tue,  6 Jul 2021 11:16:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBADD61C4B;
 Tue,  6 Jul 2021 11:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570175;
 bh=XG2alfW7p0og5n94F1WMOp1RHZFRNXwJcmw3c7IxHrQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PLqdfjP9fnyhFg2OR/NxP1seVgkdzyLurJBDljm7HxnWGPDcjcce+IpHEi/yvF2YS
 t6kE0ioTE/nsZ0iInn7QTTimOmR/c2zTGvFBQpCW2fr5T8WOG7VmtV18GHGH9644NE
 OLxjF6SFXehu7kcFFvrY/wqBLabhwrKY8S3k1VLJpxupPLJmSk2Ps7TipuQKxF19Jz
 22B2bW0tFJUpGCcjAozvNdv2xy5QmvyEKFE7Sex+Y7Qmoask5xIjeR3mixgp0z44nM
 VeIGBtJ1+5OQRwH1DADapuzE3nW7k3Tq8Q6f39SLVaCjxXo0DNawOBjlY7PPUQCmZH
 4ZKJ9tzLQ965Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 093/189] drm/amd/display: Fix off-by-one error in
 DML
Date: Tue,  6 Jul 2021 07:12:33 -0400
Message-Id: <20210706111409.2058071-93-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Stylon Wang <stylon.wang@amd.com>, Sasha Levin <sashal@kernel.org>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wesley Chalmers <Wesley.Chalmers@amd.com>

[ Upstream commit e4e3678260e9734f6f41b4325aac0b171833a618 ]

[WHY]
For DCN30 and later, there is no data in DML arrays indexed by state at
index num_states.

Signed-off-by: Wesley Chalmers <Wesley.Chalmers@amd.com>
Reviewed-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Acked-by: Stylon Wang <stylon.wang@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index af7d57602b2c..db6bb7ea5316 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -2053,7 +2053,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 			v->DISPCLKWithoutRamping,
 			v->DISPCLKDPPCLKVCOSpeed);
 	v->MaxDispclkRoundedToDFSGranularity = RoundToDFSGranularityDown(
-			v->soc.clock_limits[mode_lib->soc.num_states].dispclk_mhz,
+			v->soc.clock_limits[mode_lib->soc.num_states - 1].dispclk_mhz,
 			v->DISPCLKDPPCLKVCOSpeed);
 	if (v->DISPCLKWithoutRampingRoundedToDFSGranularity
 			> v->MaxDispclkRoundedToDFSGranularity) {
@@ -3958,20 +3958,20 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {
 				v->PlaneRequiredDISPCLKWithoutODMCombine = v->PixelClock[k] * (1.0 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0)
 						* (1.0 + v->DISPCLKRampingMargin / 100.0);
-				if ((v->PlaneRequiredDISPCLKWithoutODMCombine >= v->MaxDispclk[i] && v->MaxDispclk[i] == v->MaxDispclk[mode_lib->soc.num_states]
-						&& v->MaxDppclk[i] == v->MaxDppclk[mode_lib->soc.num_states])) {
+				if ((v->PlaneRequiredDISPCLKWithoutODMCombine >= v->MaxDispclk[i] && v->MaxDispclk[i] == v->MaxDispclk[mode_lib->soc.num_states - 1]
+						&& v->MaxDppclk[i] == v->MaxDppclk[mode_lib->soc.num_states - 1])) {
 					v->PlaneRequiredDISPCLKWithoutODMCombine = v->PixelClock[k] * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
 				}
 				v->PlaneRequiredDISPCLKWithODMCombine2To1 = v->PixelClock[k] / 2 * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0)
 						* (1 + v->DISPCLKRampingMargin / 100.0);
-				if ((v->PlaneRequiredDISPCLKWithODMCombine2To1 >= v->MaxDispclk[i] && v->MaxDispclk[i] == v->MaxDispclk[mode_lib->soc.num_states]
-						&& v->MaxDppclk[i] == v->MaxDppclk[mode_lib->soc.num_states])) {
+				if ((v->PlaneRequiredDISPCLKWithODMCombine2To1 >= v->MaxDispclk[i] && v->MaxDispclk[i] == v->MaxDispclk[mode_lib->soc.num_states - 1]
+						&& v->MaxDppclk[i] == v->MaxDppclk[mode_lib->soc.num_states - 1])) {
 					v->PlaneRequiredDISPCLKWithODMCombine2To1 = v->PixelClock[k] / 2 * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
 				}
 				v->PlaneRequiredDISPCLKWithODMCombine4To1 = v->PixelClock[k] / 4 * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0)
 						* (1 + v->DISPCLKRampingMargin / 100.0);
-				if ((v->PlaneRequiredDISPCLKWithODMCombine4To1 >= v->MaxDispclk[i] && v->MaxDispclk[i] == v->MaxDispclk[mode_lib->soc.num_states]
-						&& v->MaxDppclk[i] == v->MaxDppclk[mode_lib->soc.num_states])) {
+				if ((v->PlaneRequiredDISPCLKWithODMCombine4To1 >= v->MaxDispclk[i] && v->MaxDispclk[i] == v->MaxDispclk[mode_lib->soc.num_states - 1]
+						&& v->MaxDppclk[i] == v->MaxDppclk[mode_lib->soc.num_states - 1])) {
 					v->PlaneRequiredDISPCLKWithODMCombine4To1 = v->PixelClock[k] / 4 * (1 + v->DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
 				}
 
-- 
2.30.2

