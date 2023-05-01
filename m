Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E8D6F2CA6
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 05:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1020210E28A;
	Mon,  1 May 2023 03:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D3A10E283;
 Mon,  1 May 2023 03:02:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D0BA616E2;
 Mon,  1 May 2023 03:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D9CC433EF;
 Mon,  1 May 2023 03:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682910164;
 bh=A2H6GC4eKndBpAZDUyNhli+yUatkHx6u9mgxEnDvNQ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UAg6qSxtRwE/Mq+ul80mi9vCQFQgWic4bqy3DMmPhgIsaWuxqo9R9Uqe4Z2iH+hCk
 iR13QNXanEu7Hcm1FHjr4WBbILzM5gWjAdYmIiEffrzn22ca8ARaJIA75G6otzc+Vj
 J8Elp1CHZIH0McsEpppSEvthPDfDpfPA2Fckrkaa+MOcjh1muqyI0W3LbSM/3UNrrX
 TpCCtLw18SBAy8j4mcWoJIZZcvNbzDE8Tu53IPpBo80HzlAJ01cHRp1QXGdoyZDALt
 exbfY1es8ANvU3Cmoj5nWSNMth3NS34ucZFkwoJkAk+H6LajZVcX7GmkPnUpPZY4rW
 42DkrHk4euQvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 03/33] drm/amd/display: Correct DML calculation to
 align HW formula
Date: Sun, 30 Apr 2023 23:01:57 -0400
Message-Id: <20230501030227.3254266-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501030227.3254266-1-sashal@kernel.org>
References: <20230501030227.3254266-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, mairacanal@riseup.net, Jun.Lei@amd.com,
 Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 nathan@kernel.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 Paul Hsieh <Paul.Hsieh@amd.com>, Daniel.Miess@amd.com,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>, Dmytro.Laktyushkin@amd.com,
 yang.lee@linux.alibaba.com, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Hsieh <Paul.Hsieh@amd.com>

[ Upstream commit 26a9f53198c955b15161da48cdb51041a38d5325 ]

[Why]
In 2560x1440@240p eDP panel, some use cases will enable MPC
combine with RGB MPO then underflow happened. This case is
not allowed from HW formula. 

[How]
Correct eDP, DP and DP2 output bpp calculation to align HW
formula.

Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Paul Hsieh <Paul.Hsieh@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/dml/dcn31/display_mode_vba_31.c        | 298 ++++++++++++------
 .../dc/dml/dcn314/display_mode_vba_314.c      | 298 ++++++++++++------
 2 files changed, 392 insertions(+), 204 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index b612edb144172..77094035a26af 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -4305,11 +4305,11 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							v->AudioSampleRate[k],
 							v->AudioSampleLayout[k],
 							v->ODMCombineEnablePerState[i][k]);
-				} else if (v->Output[k] == dm_dp || v->Output[k] == dm_edp) {
+				} else if (v->Output[k] == dm_dp || v->Output[k] == dm_edp || v->Output[k] == dm_dp2p0) {
 					if (v->DSCEnable[k] == true) {
 						v->RequiresDSC[i][k] = true;
 						v->LinkDSCEnable = true;
-						if (v->Output[k] == dm_dp) {
+						if (v->Output[k] == dm_dp || v->Output[k] == dm_dp2p0) {
 							v->RequiresFEC[i][k] = true;
 						} else {
 							v->RequiresFEC[i][k] = false;
@@ -4317,107 +4317,201 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 					} else {
 						v->RequiresDSC[i][k] = false;
 						v->LinkDSCEnable = false;
-						v->RequiresFEC[i][k] = false;
-					}
-
-					v->Outbpp = BPP_INVALID;
-					if (v->PHYCLKPerState[i] >= 270.0) {
-						v->Outbpp = TruncToValidBPP(
-								(1.0 - v->Downspreading / 100.0) * 2700,
-								v->OutputLinkDPLanes[k],
-								v->HTotal[k],
-								v->HActive[k],
-								v->PixelClockBackEnd[k],
-								v->ForcedOutputLinkBPP[k],
-								v->LinkDSCEnable,
-								v->Output[k],
-								v->OutputFormat[k],
-								v->DSCInputBitPerComponent[k],
-								v->NumberOfDSCSlices[k],
-								v->AudioSampleRate[k],
-								v->AudioSampleLayout[k],
-								v->ODMCombineEnablePerState[i][k]);
-						v->OutputBppPerState[i][k] = v->Outbpp;
-						// TODO: Need some other way to handle this nonsense
-						// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR"
-					}
-					if (v->Outbpp == BPP_INVALID && v->PHYCLKPerState[i] >= 540.0) {
-						v->Outbpp = TruncToValidBPP(
-								(1.0 - v->Downspreading / 100.0) * 5400,
-								v->OutputLinkDPLanes[k],
-								v->HTotal[k],
-								v->HActive[k],
-								v->PixelClockBackEnd[k],
-								v->ForcedOutputLinkBPP[k],
-								v->LinkDSCEnable,
-								v->Output[k],
-								v->OutputFormat[k],
-								v->DSCInputBitPerComponent[k],
-								v->NumberOfDSCSlices[k],
-								v->AudioSampleRate[k],
-								v->AudioSampleLayout[k],
-								v->ODMCombineEnablePerState[i][k]);
-						v->OutputBppPerState[i][k] = v->Outbpp;
-						// TODO: Need some other way to handle this nonsense
-						// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR2"
-					}
-					if (v->Outbpp == BPP_INVALID && v->PHYCLKPerState[i] >= 810.0) {
-						v->Outbpp = TruncToValidBPP(
-								(1.0 - v->Downspreading / 100.0) * 8100,
-								v->OutputLinkDPLanes[k],
-								v->HTotal[k],
-								v->HActive[k],
-								v->PixelClockBackEnd[k],
-								v->ForcedOutputLinkBPP[k],
-								v->LinkDSCEnable,
-								v->Output[k],
-								v->OutputFormat[k],
-								v->DSCInputBitPerComponent[k],
-								v->NumberOfDSCSlices[k],
-								v->AudioSampleRate[k],
-								v->AudioSampleLayout[k],
-								v->ODMCombineEnablePerState[i][k]);
-						v->OutputBppPerState[i][k] = v->Outbpp;
-						// TODO: Need some other way to handle this nonsense
-						// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR3"
-					}
-					if (v->Outbpp == BPP_INVALID && v->PHYCLKD18PerState[i] >= 10000.0 / 18) {
-						v->Outbpp = TruncToValidBPP(
-								(1.0 - v->Downspreading / 100.0) * 10000,
-								4,
-								v->HTotal[k],
-								v->HActive[k],
-								v->PixelClockBackEnd[k],
-								v->ForcedOutputLinkBPP[k],
-								v->LinkDSCEnable,
-								v->Output[k],
-								v->OutputFormat[k],
-								v->DSCInputBitPerComponent[k],
-								v->NumberOfDSCSlices[k],
-								v->AudioSampleRate[k],
-								v->AudioSampleLayout[k],
-								v->ODMCombineEnablePerState[i][k]);
-						v->OutputBppPerState[i][k] = v->Outbpp;
-						//v->OutputTypeAndRatePerState[i][k] = v->Output[k] & "10x4";
+						if (v->Output[k] == dm_dp2p0) {
+							v->RequiresFEC[i][k] = true;
+						} else {
+							v->RequiresFEC[i][k] = false;
+						}
 					}
-					if (v->Outbpp == BPP_INVALID && v->PHYCLKD18PerState[i] >= 12000.0 / 18) {
-						v->Outbpp = TruncToValidBPP(
-								12000,
-								4,
-								v->HTotal[k],
-								v->HActive[k],
-								v->PixelClockBackEnd[k],
-								v->ForcedOutputLinkBPP[k],
-								v->LinkDSCEnable,
-								v->Output[k],
-								v->OutputFormat[k],
-								v->DSCInputBitPerComponent[k],
-								v->NumberOfDSCSlices[k],
-								v->AudioSampleRate[k],
-								v->AudioSampleLayout[k],
-								v->ODMCombineEnablePerState[i][k]);
-						v->OutputBppPerState[i][k] = v->Outbpp;
-						//v->OutputTypeAndRatePerState[i][k] = v->Output[k] & "12x4";
+					if (v->Output[k] == dm_dp2p0) {
+						v->Outbpp = BPP_INVALID;
+						if ((v->OutputLinkDPRate[k] == dm_dp_rate_na || v->OutputLinkDPRate[k] == dm_dp_rate_uhbr10) &&
+							v->PHYCLKD18PerState[k] >= 10000.0 / 18.0) {
+							v->Outbpp = TruncToValidBPP(
+									(1.0 - v->Downspreading / 100.0) * 10000,
+									v->OutputLinkDPLanes[k],
+									v->HTotal[k],
+									v->HActive[k],
+									v->PixelClockBackEnd[k],
+									v->ForcedOutputLinkBPP[k],
+									v->LinkDSCEnable,
+									v->Output[k],
+									v->OutputFormat[k],
+									v->DSCInputBitPerComponent[k],
+									v->NumberOfDSCSlices[k],
+									v->AudioSampleRate[k],
+									v->AudioSampleLayout[k],
+									v->ODMCombineEnablePerState[i][k]);
+							if (v->Outbpp == BPP_INVALID && v->PHYCLKD18PerState[k] < 13500.0 / 18.0 &&
+								v->DSCEnable[k] == true && v->ForcedOutputLinkBPP[k] == 0) {
+								v->RequiresDSC[i][k] = true;
+								v->LinkDSCEnable = true;
+								v->Outbpp = TruncToValidBPP(
+										(1.0 - v->Downspreading / 100.0) * 10000,
+										v->OutputLinkDPLanes[k],
+										v->HTotal[k],
+										v->HActive[k],
+										v->PixelClockBackEnd[k],
+										v->ForcedOutputLinkBPP[k],
+										v->LinkDSCEnable,
+										v->Output[k],
+										v->OutputFormat[k],
+										v->DSCInputBitPerComponent[k],
+										v->NumberOfDSCSlices[k],
+										v->AudioSampleRate[k],
+										v->AudioSampleLayout[k],
+										v->ODMCombineEnablePerState[i][k]);
+							}
+							v->OutputBppPerState[i][k] = v->Outbpp;
+							// TODO: Need some other way to handle this nonsense
+							// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " UHBR10"
+						}
+						if (v->Outbpp == BPP_INVALID &&
+							(v->OutputLinkDPRate[k] == dm_dp_rate_na || v->OutputLinkDPRate[k] == dm_dp_rate_uhbr13p5) &&
+							v->PHYCLKD18PerState[k] >= 13500.0 / 18.0) {
+							v->Outbpp = TruncToValidBPP(
+									(1.0 - v->Downspreading / 100.0) * 13500,
+									v->OutputLinkDPLanes[k],
+									v->HTotal[k],
+									v->HActive[k],
+									v->PixelClockBackEnd[k],
+									v->ForcedOutputLinkBPP[k],
+									v->LinkDSCEnable,
+									v->Output[k],
+									v->OutputFormat[k],
+									v->DSCInputBitPerComponent[k],
+									v->NumberOfDSCSlices[k],
+									v->AudioSampleRate[k],
+									v->AudioSampleLayout[k],
+									v->ODMCombineEnablePerState[i][k]);
+							if (v->Outbpp == BPP_INVALID && v->PHYCLKD18PerState[k] < 20000.0 / 18.0 &&
+								v->DSCEnable[k] == true && v->ForcedOutputLinkBPP[k] == 0) {
+								v->RequiresDSC[i][k] = true;
+								v->LinkDSCEnable = true;
+								v->Outbpp = TruncToValidBPP(
+										(1.0 - v->Downspreading / 100.0) * 13500,
+										v->OutputLinkDPLanes[k],
+										v->HTotal[k],
+										v->HActive[k],
+										v->PixelClockBackEnd[k],
+										v->ForcedOutputLinkBPP[k],
+										v->LinkDSCEnable,
+										v->Output[k],
+										v->OutputFormat[k],
+										v->DSCInputBitPerComponent[k],
+										v->NumberOfDSCSlices[k],
+										v->AudioSampleRate[k],
+										v->AudioSampleLayout[k],
+										v->ODMCombineEnablePerState[i][k]);
+							}
+							v->OutputBppPerState[i][k] = v->Outbpp;
+							// TODO: Need some other way to handle this nonsense
+							// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " UHBR13p5"
+						}
+						if (v->Outbpp == BPP_INVALID &&
+							(v->OutputLinkDPRate[k] == dm_dp_rate_na || v->OutputLinkDPRate[k] == dm_dp_rate_uhbr20) &&
+							v->PHYCLKD18PerState[k] >= 20000.0 / 18.0) {
+							v->Outbpp = TruncToValidBPP(
+									(1.0 - v->Downspreading / 100.0) * 20000,
+									v->OutputLinkDPLanes[k],
+									v->HTotal[k],
+									v->HActive[k],
+									v->PixelClockBackEnd[k],
+									v->ForcedOutputLinkBPP[k],
+									v->LinkDSCEnable,
+									v->Output[k],
+									v->OutputFormat[k],
+									v->DSCInputBitPerComponent[k],
+									v->NumberOfDSCSlices[k],
+									v->AudioSampleRate[k],
+									v->AudioSampleLayout[k],
+									v->ODMCombineEnablePerState[i][k]);
+							if (v->Outbpp == BPP_INVALID && v->DSCEnable[k] == true &&
+								v->ForcedOutputLinkBPP[k] == 0) {
+								v->RequiresDSC[i][k] = true;
+								v->LinkDSCEnable = true;
+								v->Outbpp = TruncToValidBPP(
+										(1.0 - v->Downspreading / 100.0) * 20000,
+										v->OutputLinkDPLanes[k],
+										v->HTotal[k],
+										v->HActive[k],
+										v->PixelClockBackEnd[k],
+										v->ForcedOutputLinkBPP[k],
+										v->LinkDSCEnable,
+										v->Output[k],
+										v->OutputFormat[k],
+										v->DSCInputBitPerComponent[k],
+										v->NumberOfDSCSlices[k],
+										v->AudioSampleRate[k],
+										v->AudioSampleLayout[k],
+										v->ODMCombineEnablePerState[i][k]);
+							}
+							v->OutputBppPerState[i][k] = v->Outbpp;
+							// TODO: Need some other way to handle this nonsense
+							// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " UHBR20"
+						}
+					} else {
+						v->Outbpp = BPP_INVALID;
+						if (v->PHYCLKPerState[i] >= 270.0) {
+							v->Outbpp = TruncToValidBPP(
+									(1.0 - v->Downspreading / 100.0) * 2700,
+									v->OutputLinkDPLanes[k],
+									v->HTotal[k],
+									v->HActive[k],
+									v->PixelClockBackEnd[k],
+									v->ForcedOutputLinkBPP[k],
+									v->LinkDSCEnable,
+									v->Output[k],
+									v->OutputFormat[k],
+									v->DSCInputBitPerComponent[k],
+									v->NumberOfDSCSlices[k],
+									v->AudioSampleRate[k],
+									v->AudioSampleLayout[k],
+									v->ODMCombineEnablePerState[i][k]);
+							v->OutputBppPerState[i][k] = v->Outbpp;
+							// TODO: Need some other way to handle this nonsense
+							// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR"
+						}
+						if (v->Outbpp == BPP_INVALID && v->PHYCLKPerState[i] >= 540.0) {
+							v->Outbpp = TruncToValidBPP(
+									(1.0 - v->Downspreading / 100.0) * 5400,
+									v->OutputLinkDPLanes[k],
+									v->HTotal[k],
+									v->HActive[k],
+									v->PixelClockBackEnd[k],
+									v->ForcedOutputLinkBPP[k],
+									v->LinkDSCEnable,
+									v->Output[k],
+									v->OutputFormat[k],
+									v->DSCInputBitPerComponent[k],
+									v->NumberOfDSCSlices[k],
+									v->AudioSampleRate[k],
+									v->AudioSampleLayout[k],
+									v->ODMCombineEnablePerState[i][k]);
+							v->OutputBppPerState[i][k] = v->Outbpp;
+							// TODO: Need some other way to handle this nonsense
+							// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR2"
+						}
+						if (v->Outbpp == BPP_INVALID && v->PHYCLKPerState[i] >= 810.0) {
+							v->Outbpp = TruncToValidBPP(
+									(1.0 - v->Downspreading / 100.0) * 8100,
+									v->OutputLinkDPLanes[k],
+									v->HTotal[k],
+									v->HActive[k],
+									v->PixelClockBackEnd[k],
+									v->ForcedOutputLinkBPP[k],
+									v->LinkDSCEnable,
+									v->Output[k],
+									v->OutputFormat[k],
+									v->DSCInputBitPerComponent[k],
+									v->NumberOfDSCSlices[k],
+									v->AudioSampleRate[k],
+									v->AudioSampleLayout[k],
+									v->ODMCombineEnablePerState[i][k]);
+							v->OutputBppPerState[i][k] = v->Outbpp;
+							// TODO: Need some other way to handle this nonsense
+							// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR3"
+						}
 					}
 				}
 			} else {
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 3afd3c80e6da8..69516cfdbc64a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -4403,11 +4403,11 @@ void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_
 							v->AudioSampleRate[k],
 							v->AudioSampleLayout[k],
 							v->ODMCombineEnablePerState[i][k]);
-				} else if (v->Output[k] == dm_dp || v->Output[k] == dm_edp) {
+				} else if (v->Output[k] == dm_dp || v->Output[k] == dm_edp || v->Output[k] == dm_dp2p0) {
 					if (v->DSCEnable[k] == true) {
 						v->RequiresDSC[i][k] = true;
 						v->LinkDSCEnable = true;
-						if (v->Output[k] == dm_dp) {
+						if (v->Output[k] == dm_dp || v->Output[k] == dm_dp2p0) {
 							v->RequiresFEC[i][k] = true;
 						} else {
 							v->RequiresFEC[i][k] = false;
@@ -4415,107 +4415,201 @@ void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_
 					} else {
 						v->RequiresDSC[i][k] = false;
 						v->LinkDSCEnable = false;
-						v->RequiresFEC[i][k] = false;
-					}
-
-					v->Outbpp = BPP_INVALID;
-					if (v->PHYCLKPerState[i] >= 270.0) {
-						v->Outbpp = TruncToValidBPP(
-								(1.0 - v->Downspreading / 100.0) * 2700,
-								v->OutputLinkDPLanes[k],
-								v->HTotal[k],
-								v->HActive[k],
-								v->PixelClockBackEnd[k],
-								v->ForcedOutputLinkBPP[k],
-								v->LinkDSCEnable,
-								v->Output[k],
-								v->OutputFormat[k],
-								v->DSCInputBitPerComponent[k],
-								v->NumberOfDSCSlices[k],
-								v->AudioSampleRate[k],
-								v->AudioSampleLayout[k],
-								v->ODMCombineEnablePerState[i][k]);
-						v->OutputBppPerState[i][k] = v->Outbpp;
-						// TODO: Need some other way to handle this nonsense
-						// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR"
-					}
-					if (v->Outbpp == BPP_INVALID && v->PHYCLKPerState[i] >= 540.0) {
-						v->Outbpp = TruncToValidBPP(
-								(1.0 - v->Downspreading / 100.0) * 5400,
-								v->OutputLinkDPLanes[k],
-								v->HTotal[k],
-								v->HActive[k],
-								v->PixelClockBackEnd[k],
-								v->ForcedOutputLinkBPP[k],
-								v->LinkDSCEnable,
-								v->Output[k],
-								v->OutputFormat[k],
-								v->DSCInputBitPerComponent[k],
-								v->NumberOfDSCSlices[k],
-								v->AudioSampleRate[k],
-								v->AudioSampleLayout[k],
-								v->ODMCombineEnablePerState[i][k]);
-						v->OutputBppPerState[i][k] = v->Outbpp;
-						// TODO: Need some other way to handle this nonsense
-						// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR2"
-					}
-					if (v->Outbpp == BPP_INVALID && v->PHYCLKPerState[i] >= 810.0) {
-						v->Outbpp = TruncToValidBPP(
-								(1.0 - v->Downspreading / 100.0) * 8100,
-								v->OutputLinkDPLanes[k],
-								v->HTotal[k],
-								v->HActive[k],
-								v->PixelClockBackEnd[k],
-								v->ForcedOutputLinkBPP[k],
-								v->LinkDSCEnable,
-								v->Output[k],
-								v->OutputFormat[k],
-								v->DSCInputBitPerComponent[k],
-								v->NumberOfDSCSlices[k],
-								v->AudioSampleRate[k],
-								v->AudioSampleLayout[k],
-								v->ODMCombineEnablePerState[i][k]);
-						v->OutputBppPerState[i][k] = v->Outbpp;
-						// TODO: Need some other way to handle this nonsense
-						// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR3"
-					}
-					if (v->Outbpp == BPP_INVALID && v->PHYCLKD18PerState[i] >= 10000.0 / 18) {
-						v->Outbpp = TruncToValidBPP(
-								(1.0 - v->Downspreading / 100.0) * 10000,
-								4,
-								v->HTotal[k],
-								v->HActive[k],
-								v->PixelClockBackEnd[k],
-								v->ForcedOutputLinkBPP[k],
-								v->LinkDSCEnable,
-								v->Output[k],
-								v->OutputFormat[k],
-								v->DSCInputBitPerComponent[k],
-								v->NumberOfDSCSlices[k],
-								v->AudioSampleRate[k],
-								v->AudioSampleLayout[k],
-								v->ODMCombineEnablePerState[i][k]);
-						v->OutputBppPerState[i][k] = v->Outbpp;
-						//v->OutputTypeAndRatePerState[i][k] = v->Output[k] & "10x4";
+						if (v->Output[k] == dm_dp2p0) {
+							v->RequiresFEC[i][k] = true;
+						} else {
+							v->RequiresFEC[i][k] = false;
+						}
 					}
-					if (v->Outbpp == BPP_INVALID && v->PHYCLKD18PerState[i] >= 12000.0 / 18) {
-						v->Outbpp = TruncToValidBPP(
-								12000,
-								4,
-								v->HTotal[k],
-								v->HActive[k],
-								v->PixelClockBackEnd[k],
-								v->ForcedOutputLinkBPP[k],
-								v->LinkDSCEnable,
-								v->Output[k],
-								v->OutputFormat[k],
-								v->DSCInputBitPerComponent[k],
-								v->NumberOfDSCSlices[k],
-								v->AudioSampleRate[k],
-								v->AudioSampleLayout[k],
-								v->ODMCombineEnablePerState[i][k]);
-						v->OutputBppPerState[i][k] = v->Outbpp;
-						//v->OutputTypeAndRatePerState[i][k] = v->Output[k] & "12x4";
+					if (v->Output[k] == dm_dp2p0) {
+						v->Outbpp = BPP_INVALID;
+						if ((v->OutputLinkDPRate[k] == dm_dp_rate_na || v->OutputLinkDPRate[k] == dm_dp_rate_uhbr10) &&
+							v->PHYCLKD18PerState[k] >= 10000.0 / 18.0) {
+							v->Outbpp = TruncToValidBPP(
+									(1.0 - v->Downspreading / 100.0) * 10000,
+									v->OutputLinkDPLanes[k],
+									v->HTotal[k],
+									v->HActive[k],
+									v->PixelClockBackEnd[k],
+									v->ForcedOutputLinkBPP[k],
+									v->LinkDSCEnable,
+									v->Output[k],
+									v->OutputFormat[k],
+									v->DSCInputBitPerComponent[k],
+									v->NumberOfDSCSlices[k],
+									v->AudioSampleRate[k],
+									v->AudioSampleLayout[k],
+									v->ODMCombineEnablePerState[i][k]);
+							if (v->Outbpp == BPP_INVALID && v->PHYCLKD18PerState[k] < 13500.0 / 18.0 &&
+								v->DSCEnable[k] == true && v->ForcedOutputLinkBPP[k] == 0) {
+								v->RequiresDSC[i][k] = true;
+								v->LinkDSCEnable = true;
+								v->Outbpp = TruncToValidBPP(
+										(1.0 - v->Downspreading / 100.0) * 10000,
+										v->OutputLinkDPLanes[k],
+										v->HTotal[k],
+										v->HActive[k],
+										v->PixelClockBackEnd[k],
+										v->ForcedOutputLinkBPP[k],
+										v->LinkDSCEnable,
+										v->Output[k],
+										v->OutputFormat[k],
+										v->DSCInputBitPerComponent[k],
+										v->NumberOfDSCSlices[k],
+										v->AudioSampleRate[k],
+										v->AudioSampleLayout[k],
+										v->ODMCombineEnablePerState[i][k]);
+							}
+							v->OutputBppPerState[i][k] = v->Outbpp;
+							// TODO: Need some other way to handle this nonsense
+							// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " UHBR10"
+						}
+						if (v->Outbpp == BPP_INVALID &&
+							(v->OutputLinkDPRate[k] == dm_dp_rate_na || v->OutputLinkDPRate[k] == dm_dp_rate_uhbr13p5) &&
+							v->PHYCLKD18PerState[k] >= 13500.0 / 18.0) {
+							v->Outbpp = TruncToValidBPP(
+									(1.0 - v->Downspreading / 100.0) * 13500,
+									v->OutputLinkDPLanes[k],
+									v->HTotal[k],
+									v->HActive[k],
+									v->PixelClockBackEnd[k],
+									v->ForcedOutputLinkBPP[k],
+									v->LinkDSCEnable,
+									v->Output[k],
+									v->OutputFormat[k],
+									v->DSCInputBitPerComponent[k],
+									v->NumberOfDSCSlices[k],
+									v->AudioSampleRate[k],
+									v->AudioSampleLayout[k],
+									v->ODMCombineEnablePerState[i][k]);
+							if (v->Outbpp == BPP_INVALID && v->PHYCLKD18PerState[k] < 20000.0 / 18.0 &&
+								v->DSCEnable[k] == true && v->ForcedOutputLinkBPP[k] == 0) {
+								v->RequiresDSC[i][k] = true;
+								v->LinkDSCEnable = true;
+								v->Outbpp = TruncToValidBPP(
+										(1.0 - v->Downspreading / 100.0) * 13500,
+										v->OutputLinkDPLanes[k],
+										v->HTotal[k],
+										v->HActive[k],
+										v->PixelClockBackEnd[k],
+										v->ForcedOutputLinkBPP[k],
+										v->LinkDSCEnable,
+										v->Output[k],
+										v->OutputFormat[k],
+										v->DSCInputBitPerComponent[k],
+										v->NumberOfDSCSlices[k],
+										v->AudioSampleRate[k],
+										v->AudioSampleLayout[k],
+										v->ODMCombineEnablePerState[i][k]);
+							}
+							v->OutputBppPerState[i][k] = v->Outbpp;
+							// TODO: Need some other way to handle this nonsense
+							// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " UHBR13p5"
+						}
+						if (v->Outbpp == BPP_INVALID &&
+							(v->OutputLinkDPRate[k] == dm_dp_rate_na || v->OutputLinkDPRate[k] == dm_dp_rate_uhbr20) &&
+							v->PHYCLKD18PerState[k] >= 20000.0 / 18.0) {
+							v->Outbpp = TruncToValidBPP(
+									(1.0 - v->Downspreading / 100.0) * 20000,
+									v->OutputLinkDPLanes[k],
+									v->HTotal[k],
+									v->HActive[k],
+									v->PixelClockBackEnd[k],
+									v->ForcedOutputLinkBPP[k],
+									v->LinkDSCEnable,
+									v->Output[k],
+									v->OutputFormat[k],
+									v->DSCInputBitPerComponent[k],
+									v->NumberOfDSCSlices[k],
+									v->AudioSampleRate[k],
+									v->AudioSampleLayout[k],
+									v->ODMCombineEnablePerState[i][k]);
+							if (v->Outbpp == BPP_INVALID && v->DSCEnable[k] == true &&
+								v->ForcedOutputLinkBPP[k] == 0) {
+								v->RequiresDSC[i][k] = true;
+								v->LinkDSCEnable = true;
+								v->Outbpp = TruncToValidBPP(
+										(1.0 - v->Downspreading / 100.0) * 20000,
+										v->OutputLinkDPLanes[k],
+										v->HTotal[k],
+										v->HActive[k],
+										v->PixelClockBackEnd[k],
+										v->ForcedOutputLinkBPP[k],
+										v->LinkDSCEnable,
+										v->Output[k],
+										v->OutputFormat[k],
+										v->DSCInputBitPerComponent[k],
+										v->NumberOfDSCSlices[k],
+										v->AudioSampleRate[k],
+										v->AudioSampleLayout[k],
+										v->ODMCombineEnablePerState[i][k]);
+							}
+							v->OutputBppPerState[i][k] = v->Outbpp;
+							// TODO: Need some other way to handle this nonsense
+							// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " UHBR20"
+						}
+					} else {
+						v->Outbpp = BPP_INVALID;
+						if (v->PHYCLKPerState[i] >= 270.0) {
+							v->Outbpp = TruncToValidBPP(
+									(1.0 - v->Downspreading / 100.0) * 2700,
+									v->OutputLinkDPLanes[k],
+									v->HTotal[k],
+									v->HActive[k],
+									v->PixelClockBackEnd[k],
+									v->ForcedOutputLinkBPP[k],
+									v->LinkDSCEnable,
+									v->Output[k],
+									v->OutputFormat[k],
+									v->DSCInputBitPerComponent[k],
+									v->NumberOfDSCSlices[k],
+									v->AudioSampleRate[k],
+									v->AudioSampleLayout[k],
+									v->ODMCombineEnablePerState[i][k]);
+							v->OutputBppPerState[i][k] = v->Outbpp;
+							// TODO: Need some other way to handle this nonsense
+							// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR"
+						}
+						if (v->Outbpp == BPP_INVALID && v->PHYCLKPerState[i] >= 540.0) {
+							v->Outbpp = TruncToValidBPP(
+									(1.0 - v->Downspreading / 100.0) * 5400,
+									v->OutputLinkDPLanes[k],
+									v->HTotal[k],
+									v->HActive[k],
+									v->PixelClockBackEnd[k],
+									v->ForcedOutputLinkBPP[k],
+									v->LinkDSCEnable,
+									v->Output[k],
+									v->OutputFormat[k],
+									v->DSCInputBitPerComponent[k],
+									v->NumberOfDSCSlices[k],
+									v->AudioSampleRate[k],
+									v->AudioSampleLayout[k],
+									v->ODMCombineEnablePerState[i][k]);
+							v->OutputBppPerState[i][k] = v->Outbpp;
+							// TODO: Need some other way to handle this nonsense
+							// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR2"
+						}
+						if (v->Outbpp == BPP_INVALID && v->PHYCLKPerState[i] >= 810.0) {
+							v->Outbpp = TruncToValidBPP(
+									(1.0 - v->Downspreading / 100.0) * 8100,
+									v->OutputLinkDPLanes[k],
+									v->HTotal[k],
+									v->HActive[k],
+									v->PixelClockBackEnd[k],
+									v->ForcedOutputLinkBPP[k],
+									v->LinkDSCEnable,
+									v->Output[k],
+									v->OutputFormat[k],
+									v->DSCInputBitPerComponent[k],
+									v->NumberOfDSCSlices[k],
+									v->AudioSampleRate[k],
+									v->AudioSampleLayout[k],
+									v->ODMCombineEnablePerState[i][k]);
+							v->OutputBppPerState[i][k] = v->Outbpp;
+							// TODO: Need some other way to handle this nonsense
+							// v->OutputTypeAndRatePerState[i][k] = v->Output[k] & " HBR3"
+						}
 					}
 				}
 			} else {
-- 
2.39.2

