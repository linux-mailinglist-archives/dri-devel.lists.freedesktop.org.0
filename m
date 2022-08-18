Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4B4598938
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 18:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283C210E336;
	Thu, 18 Aug 2022 16:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A61110E336;
 Thu, 18 Aug 2022 16:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tkf27MGOsfSl3o4nlKMoQt4JG5ecK3TGGftAu2UEBHc7BaLAgedrVnvUUpPoGYpBy2QfZ/woWXKH8pZPk5Q//wBnVBzAyu9qJXZ/npMevp6WNdGZkGB1Tp8yqJkjGta2hKLiKxUJuYYToWgH56mz14bsegS1b6yZwGK8s0amPSTa9FybBAA8fAroPI/oqLP8ixRZVNV3yiqrTtQ9HSkr31dd1c6X8KoblCE/V1EXIWLZe2ysYLcMccCNHZJEgSVl5hxUO7yClu3tf8/xMYL7Iu1BcnMA/rJSDx0uFhkQiVzFykVx/5ab00yc/ciBhfrj/azNPt/pl/6CCijPFoz7Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjcZNZoSSnwPw2aU/t2SfKERFw+eYc/AXI0WutQOFXQ=;
 b=E+Z12DmY/2A8xhMkVNzqlqpUoLAbiv7IN7c9pzWH+uqjQgaKZFUbLhCzUzsGUDSIjkR0aydprrrV3eF/OUJFlVaou7tEAkvCKhx3tlLf3D//oXLeaDk5pviNz00M4/s0CG99CJcIv61w1Q7dsPMIoDma54lU20kg+HdYdWHkMpROZO8+KgTN5B3r/EdaA17vsyD0QE6Vl3Hwcco9gaJhwL/DjRrxkq4+d8X2NxPy9fGOy7I5CGu7XDocNZjcuBT1yUQZfSo2anBAK0bR/cvpwbO/fQgGTMJplbE/VnuEvv7REAtHgnR6UOSx3BE/JL2+kFjgfSot7r0Mx7bWm0Ynmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjcZNZoSSnwPw2aU/t2SfKERFw+eYc/AXI0WutQOFXQ=;
 b=15Z9dddzz6CGsO5pokvDJn2yrTGn6Jd0tRCBBE167dTGLcqCHFC0LRqYKZFhuCtvEFDwyz5HO4si2KAzqSBarkAppbbUjDY3GcJfghznv6PT3ZSr19DEs+mrfuZx2wjqZArcWYYNMiiZslvmGdW8dnOZ7e7kRVxwTFFxhg8cDL8=
Received: from DS7PR05CA0057.namprd05.prod.outlook.com (2603:10b6:8:2f::21) by
 MN2PR12MB3022.namprd12.prod.outlook.com (2603:10b6:208:ce::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.10; Thu, 18 Aug 2022 16:49:56 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::34) by DS7PR05CA0057.outlook.office365.com
 (2603:10b6:8:2f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.4 via Frontend
 Transport; Thu, 18 Aug 2022 16:49:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 16:49:55 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 18 Aug
 2022 11:49:53 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amd/display: fix i386 frame size warning
Date: Thu, 18 Aug 2022 12:48:47 -0400
Message-ID: <20220818164848.68729-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 107670bc-3afd-46ac-68f4-08da8139ae05
X-MS-TrafficTypeDiagnostic: MN2PR12MB3022:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w3zIfZ2Z36pVV00KOzl8/hfUVfmPpn+kPRSOwPwxUfO0p06wiA7Zc5zzpfbycXUDPB3vL5SDWdGkpzUErfeRJSheu8LaQTexwcjzBuZYmt7trkUM3DAJd/i17ZXhMB5xJ86e6RJjro4jxF2cr/IFP6nGrgKzfDfEpp0j2hHbbcfhEdmlKwf6SxRyrT3iT4BbsFiuRo6MUhmawItVT9tIUYqpolw13IYF4AsNLHMaRPSUKF5aLT8QdSzPDmL4zryKGjfEo4RGo0noI2LTBx3lJRA4o3Wae+FuulzJGSzv7llnwcXhvYyjUyxK+qo7up5A/MlddTB4YHIqgAWZMcIAn9H4a8EeUThpkLK3cNviO5C3EdCpRqE0A88BQBl+dX0J8XAucjovXmCs9uc5JtI9l0IK3bXAqAZFd3RNq9kBv/pcrTHLXD6vxr4aywqExMqOcT/0SkxXJeZpOxwYHg/f3DvXwF9GsQ273qyYxxDHpJAacwxliw820FNDaO6e8EbNxloMoLNIwbA47bz2H6pW/ambcNCJzrdkHzzpaDt/FdExr73lbES1UIh/Pw6fOkCF72vxG06wNbPRawLC9zq2JoX9ePrfeSGV7h8o0zGFsX7c9sWyZQvCaxIIVaKt/fm3F6aGPkqgKMeNr1q2VJy5DqdnzZcp/kuekPEI180DxFFtLbRD02hDjR9lIkNwCkF8yK7Z4I7CMhqLOzt7GUvXEVUp3ycKgGQIaGVefj8rUo0xmcKkahf3fEO7XMqIX9gi+SUDWMzYjAhPjPFBMRFCbyEtF//iRhTbKLRGVoZThUJO2/e/8VZeVFtfHMSy1btY6ZlRuYps8DPjJdWJR3PnsdULUuNSPgOj6iyi9IImKDU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(36840700001)(40470700004)(46966006)(426003)(8676002)(356005)(7696005)(36756003)(47076005)(83380400001)(36860700001)(82740400003)(6916009)(82310400005)(40460700003)(54906003)(1076003)(19627235002)(40480700001)(478600001)(26005)(336012)(186003)(6666004)(316002)(41300700001)(16526019)(2616005)(81166007)(30864003)(2906002)(44832011)(86362001)(4326008)(5660300002)(70206006)(8936002)(70586007)(36900700001)(16060500005)(44824005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 16:49:55.8118 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 107670bc-3afd-46ac-68f4-08da8139ae05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3022
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, David Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Bing Guo <Bing.Guo@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Addresses the following warning:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3596:6: error: stack frame size (2092) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
     ^

UseMinimumDCFCLK() is eating away at
dml30_ModeSupportAndSystemConfigurationFull()'s stack space, so use a
pointer to struct vba_vars_st instead of passing lots of large arrays
as parameters by value.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../dc/dml/dcn30/display_mode_vba_30.c        | 295 ++++--------------
 1 file changed, 63 insertions(+), 232 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 876b321b30ca..b7fa003ffe06 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -396,64 +396,10 @@ static void CalculateUrgentBurstFactor(
 
 static void UseMinimumDCFCLK(
 		struct display_mode_lib *mode_lib,
-		int MaxInterDCNTileRepeaters,
+		struct vba_vars_st *v,
 		int MaxPrefetchMode,
-		double FinalDRAMClockChangeLatency,
-		double SREnterPlusExitTime,
-		int ReturnBusWidth,
-		int RoundTripPingLatencyCycles,
-		int ReorderingBytes,
-		int PixelChunkSizeInKByte,
-		int MetaChunkSize,
-		bool GPUVMEnable,
-		int GPUVMMaxPageTableLevels,
-		bool HostVMEnable,
-		int NumberOfActivePlanes,
-		double HostVMMinPageSize,
-		int HostVMMaxNonCachedPageTableLevels,
-		bool DynamicMetadataVMEnabled,
-		enum immediate_flip_requirement ImmediateFlipRequirement,
-		bool ProgressiveToInterlaceUnitInOPP,
-		double MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
-		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
-		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
-		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly,
-		int VTotal[],
-		int VActive[],
-		int DynamicMetadataTransmittedBytes[],
-		int DynamicMetadataLinesBeforeActiveRequired[],
-		bool Interlace[],
-		double RequiredDPPCLK[][2][DC__NUM_DPP__MAX],
-		double RequiredDISPCLK[][2],
-		double UrgLatency[],
-		unsigned int NoOfDPP[][2][DC__NUM_DPP__MAX],
-		double ProjectedDCFCLKDeepSleep[][2],
-		double MaximumVStartup[][2][DC__NUM_DPP__MAX],
-		double TotalVActivePixelBandwidth[][2],
-		double TotalVActiveCursorBandwidth[][2],
-		double TotalMetaRowBandwidth[][2],
-		double TotalDPTERowBandwidth[][2],
-		unsigned int TotalNumberOfActiveDPP[][2],
-		unsigned int TotalNumberOfDCCActiveDPP[][2],
-		int dpte_group_bytes[],
-		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
-		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
-		unsigned int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
-		unsigned int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
-		int BytePerPixelY[],
-		int BytePerPixelC[],
-		int HTotal[],
-		double PixelClock[],
-		double PDEAndMetaPTEBytesPerFrame[][2][DC__NUM_DPP__MAX],
-		double DPTEBytesPerRow[][2][DC__NUM_DPP__MAX],
-		double MetaRowBytes[][2][DC__NUM_DPP__MAX],
-		bool DynamicMetadataEnable[],
-		double VActivePixelBandwidth[][2][DC__NUM_DPP__MAX],
-		double VActiveCursorBandwidth[][2][DC__NUM_DPP__MAX],
-		double ReadBandwidthLuma[],
-		double ReadBandwidthChroma[],
-		double DCFCLKPerState[],
-		double DCFCLKState[][2]);
+		int ReorderingBytes);
+
 static void CalculatePixelDeliveryTimes(
 		unsigned int NumberOfActivePlanes,
 		double VRatio[],
@@ -4692,66 +4638,7 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	}
 
 	if (v->UseMinimumRequiredDCFCLK == true) {
-		UseMinimumDCFCLK(
-				mode_lib,
-				v->MaxInterDCNTileRepeaters,
-				MaxPrefetchMode,
-				v->FinalDRAMClockChangeLatency,
-				v->SREnterPlusExitTime,
-				v->ReturnBusWidth,
-				v->RoundTripPingLatencyCycles,
-				ReorderingBytes,
-				v->PixelChunkSizeInKByte,
-				v->MetaChunkSize,
-				v->GPUVMEnable,
-				v->GPUVMMaxPageTableLevels,
-				v->HostVMEnable,
-				v->NumberOfActivePlanes,
-				v->HostVMMinPageSize,
-				v->HostVMMaxNonCachedPageTableLevels,
-				v->DynamicMetadataVMEnabled,
-				v->ImmediateFlipRequirement[0],
-				v->ProgressiveToInterlaceUnitInOPP,
-				v->MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
-				v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
-				v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
-				v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly,
-				v->VTotal,
-				v->VActive,
-				v->DynamicMetadataTransmittedBytes,
-				v->DynamicMetadataLinesBeforeActiveRequired,
-				v->Interlace,
-				v->RequiredDPPCLK,
-				v->RequiredDISPCLK,
-				v->UrgLatency,
-				v->NoOfDPP,
-				v->ProjectedDCFCLKDeepSleep,
-				v->MaximumVStartup,
-				v->TotalVActivePixelBandwidth,
-				v->TotalVActiveCursorBandwidth,
-				v->TotalMetaRowBandwidth,
-				v->TotalDPTERowBandwidth,
-				v->TotalNumberOfActiveDPP,
-				v->TotalNumberOfDCCActiveDPP,
-				v->dpte_group_bytes,
-				v->PrefetchLinesY,
-				v->PrefetchLinesC,
-				v->swath_width_luma_ub_all_states,
-				v->swath_width_chroma_ub_all_states,
-				v->BytePerPixelY,
-				v->BytePerPixelC,
-				v->HTotal,
-				v->PixelClock,
-				v->PDEAndMetaPTEBytesPerFrame,
-				v->DPTEBytesPerRow,
-				v->MetaRowBytes,
-				v->DynamicMetadataEnable,
-				v->VActivePixelBandwidth,
-				v->VActiveCursorBandwidth,
-				v->ReadBandwidthLuma,
-				v->ReadBandwidthChroma,
-				v->DCFCLKPerState,
-				v->DCFCLKState);
+		UseMinimumDCFCLK(mode_lib, v, MaxPrefetchMode, ReorderingBytes);
 
 		if (v->ClampMinDCFCLK) {
 			/* Clamp calculated values to actual minimum */
@@ -6610,77 +6497,21 @@ static double CalculateUrgentLatency(
 	return ret;
 }
 
-
 static void UseMinimumDCFCLK(
 		struct display_mode_lib *mode_lib,
-		int MaxInterDCNTileRepeaters,
+		struct vba_vars_st *v,
 		int MaxPrefetchMode,
-		double FinalDRAMClockChangeLatency,
-		double SREnterPlusExitTime,
-		int ReturnBusWidth,
-		int RoundTripPingLatencyCycles,
-		int ReorderingBytes,
-		int PixelChunkSizeInKByte,
-		int MetaChunkSize,
-		bool GPUVMEnable,
-		int GPUVMMaxPageTableLevels,
-		bool HostVMEnable,
-		int NumberOfActivePlanes,
-		double HostVMMinPageSize,
-		int HostVMMaxNonCachedPageTableLevels,
-		bool DynamicMetadataVMEnabled,
-		enum immediate_flip_requirement ImmediateFlipRequirement,
-		bool ProgressiveToInterlaceUnitInOPP,
-		double MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
-		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
-		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
-		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly,
-		int VTotal[],
-		int VActive[],
-		int DynamicMetadataTransmittedBytes[],
-		int DynamicMetadataLinesBeforeActiveRequired[],
-		bool Interlace[],
-		double RequiredDPPCLK[][2][DC__NUM_DPP__MAX],
-		double RequiredDISPCLK[][2],
-		double UrgLatency[],
-		unsigned int NoOfDPP[][2][DC__NUM_DPP__MAX],
-		double ProjectedDCFCLKDeepSleep[][2],
-		double MaximumVStartup[][2][DC__NUM_DPP__MAX],
-		double TotalVActivePixelBandwidth[][2],
-		double TotalVActiveCursorBandwidth[][2],
-		double TotalMetaRowBandwidth[][2],
-		double TotalDPTERowBandwidth[][2],
-		unsigned int TotalNumberOfActiveDPP[][2],
-		unsigned int TotalNumberOfDCCActiveDPP[][2],
-		int dpte_group_bytes[],
-		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
-		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
-		unsigned int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
-		unsigned int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
-		int BytePerPixelY[],
-		int BytePerPixelC[],
-		int HTotal[],
-		double PixelClock[],
-		double PDEAndMetaPTEBytesPerFrame[][2][DC__NUM_DPP__MAX],
-		double DPTEBytesPerRow[][2][DC__NUM_DPP__MAX],
-		double MetaRowBytes[][2][DC__NUM_DPP__MAX],
-		bool DynamicMetadataEnable[],
-		double VActivePixelBandwidth[][2][DC__NUM_DPP__MAX],
-		double VActiveCursorBandwidth[][2][DC__NUM_DPP__MAX],
-		double ReadBandwidthLuma[],
-		double ReadBandwidthChroma[],
-		double DCFCLKPerState[],
-		double DCFCLKState[][2])
+		int ReorderingBytes)
 {
 	double   NormalEfficiency = 0;
 	double   PTEEfficiency = 0;
 	double   TotalMaxPrefetchFlipDPTERowBandwidth[DC__VOLTAGE_STATES][2] = { { 0 } };
 	unsigned int i, j, k;
 
-	NormalEfficiency =  (HostVMEnable == true ? PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData
-			: PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly) / 100.0;
-	PTEEfficiency =  (HostVMEnable == true ? PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly
-			/ PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData : 1.0);
+	NormalEfficiency =  (v->HostVMEnable == true ? v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData
+			: v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly) / 100.0;
+	PTEEfficiency =  (v->HostVMEnable == true ? v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly
+			/ v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData : 1.0);
 	for (i = 0; i < mode_lib->soc.num_states; ++i) {
 		for (j = 0; j <= 1; ++j) {
 			double PixelDCFCLKCyclesRequiredInPrefetch[DC__NUM_DPP__MAX] = { 0 };
@@ -6698,58 +6529,58 @@ static void UseMinimumDCFCLK(
 			double MinimumTvmPlus2Tr0 = 0;
 
 			TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = 0;
-			for (k = 0; k < NumberOfActivePlanes; ++k) {
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 				TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = TotalMaxPrefetchFlipDPTERowBandwidth[i][j]
-					+ NoOfDPP[i][j][k] * DPTEBytesPerRow[i][j][k] / (15.75 * HTotal[k] / PixelClock[k]);
+					+ v->NoOfDPP[i][j][k] * v->DPTEBytesPerRow[i][j][k] / (15.75 * v->HTotal[k] / v->PixelClock[k]);
 			}
 
-			for (k = 0; k <= NumberOfActivePlanes - 1; ++k) {
-				NoOfDPPState[k] = NoOfDPP[i][j][k];
+			for (k = 0; k <= v->NumberOfActivePlanes - 1; ++k) {
+				NoOfDPPState[k] = v->NoOfDPP[i][j][k];
 			}
 
-			MinimumTWait = CalculateTWait(MaxPrefetchMode, FinalDRAMClockChangeLatency, UrgLatency[i], SREnterPlusExitTime);
-			NonDPTEBandwidth = TotalVActivePixelBandwidth[i][j] + TotalVActiveCursorBandwidth[i][j] + TotalMetaRowBandwidth[i][j];
-			DPTEBandwidth =  (HostVMEnable == true || ImmediateFlipRequirement == dm_immediate_flip_required) ?
-					TotalMaxPrefetchFlipDPTERowBandwidth[i][j] : TotalDPTERowBandwidth[i][j];
-			DCFCLKRequiredForAverageBandwidth = dml_max3(ProjectedDCFCLKDeepSleep[i][j],
-					(NonDPTEBandwidth + TotalDPTERowBandwidth[i][j]) / ReturnBusWidth / (MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation / 100),
-					(NonDPTEBandwidth + DPTEBandwidth / PTEEfficiency) / NormalEfficiency / ReturnBusWidth);
-
-			ExtraLatencyBytes = CalculateExtraLatencyBytes(ReorderingBytes, TotalNumberOfActiveDPP[i][j], PixelChunkSizeInKByte, TotalNumberOfDCCActiveDPP[i][j],
-					MetaChunkSize, GPUVMEnable, HostVMEnable, NumberOfActivePlanes, NoOfDPPState, dpte_group_bytes,
-					PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData, PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
-					HostVMMinPageSize, HostVMMaxNonCachedPageTableLevels);
-			ExtraLatencyCycles = RoundTripPingLatencyCycles + 32 + ExtraLatencyBytes / NormalEfficiency / ReturnBusWidth;
-			for (k = 0; k < NumberOfActivePlanes; ++k) {
+			MinimumTWait = CalculateTWait(MaxPrefetchMode, v->FinalDRAMClockChangeLatency, v->UrgLatency[i], v->SREnterPlusExitTime);
+			NonDPTEBandwidth = v->TotalVActivePixelBandwidth[i][j] + v->TotalVActiveCursorBandwidth[i][j] + v->TotalMetaRowBandwidth[i][j];
+			DPTEBandwidth =  (v->HostVMEnable == true || v->ImmediateFlipRequirement[0] == dm_immediate_flip_required) ?
+					TotalMaxPrefetchFlipDPTERowBandwidth[i][j] : v->TotalDPTERowBandwidth[i][j];
+			DCFCLKRequiredForAverageBandwidth = dml_max3(v->ProjectedDCFCLKDeepSleep[i][j],
+					(NonDPTEBandwidth + v->TotalDPTERowBandwidth[i][j]) / v->ReturnBusWidth / (v->MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation / 100),
+					(NonDPTEBandwidth + DPTEBandwidth / PTEEfficiency) / NormalEfficiency / v->ReturnBusWidth);
+
+			ExtraLatencyBytes = CalculateExtraLatencyBytes(ReorderingBytes, v->TotalNumberOfActiveDPP[i][j], v->PixelChunkSizeInKByte, v->TotalNumberOfDCCActiveDPP[i][j],
+					v->MetaChunkSize, v->GPUVMEnable, v->HostVMEnable, v->NumberOfActivePlanes, NoOfDPPState, v->dpte_group_bytes,
+					v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData, v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+					v->HostVMMinPageSize, v->HostVMMaxNonCachedPageTableLevels);
+			ExtraLatencyCycles = v->RoundTripPingLatencyCycles + 32 + ExtraLatencyBytes / NormalEfficiency / v->ReturnBusWidth;
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 				double DCFCLKCyclesRequiredInPrefetch = { 0 };
 				double ExpectedPrefetchBWAcceleration = { 0 };
 				double PrefetchTime = { 0 };
 
-				PixelDCFCLKCyclesRequiredInPrefetch[k] = (PrefetchLinesY[i][j][k] * swath_width_luma_ub_all_states[i][j][k] * BytePerPixelY[k]
-					+ PrefetchLinesC[i][j][k] * swath_width_chroma_ub_all_states[i][j][k] * BytePerPixelC[k]) / NormalEfficiency / ReturnBusWidth;
-				DCFCLKCyclesRequiredInPrefetch = 2 * ExtraLatencyCycles / NoOfDPPState[k] + PDEAndMetaPTEBytesPerFrame[i][j][k] / PTEEfficiency
-					/ NormalEfficiency / ReturnBusWidth *  (GPUVMMaxPageTableLevels > 2 ? 1 : 0) + 2 * DPTEBytesPerRow[i][j][k] / PTEEfficiency
-					/ NormalEfficiency / ReturnBusWidth + 2 * MetaRowBytes[i][j][k] / NormalEfficiency / ReturnBusWidth + PixelDCFCLKCyclesRequiredInPrefetch[k];
-				PrefetchPixelLinesTime[k] = dml_max(PrefetchLinesY[i][j][k], PrefetchLinesC[i][j][k]) * HTotal[k] / PixelClock[k];
-				ExpectedPrefetchBWAcceleration = (VActivePixelBandwidth[i][j][k] + VActiveCursorBandwidth[i][j][k]) / (ReadBandwidthLuma[k] + ReadBandwidthChroma[k]);
-				DynamicMetadataVMExtraLatency[k] = (GPUVMEnable == true && DynamicMetadataEnable[k] == true && DynamicMetadataVMEnabled == true) ?
-						UrgLatency[i] * GPUVMMaxPageTableLevels *  (HostVMEnable == true ? HostVMMaxNonCachedPageTableLevels + 1 : 1) : 0;
-				PrefetchTime = (MaximumVStartup[i][j][k] - 1) * HTotal[k] / PixelClock[k] - MinimumTWait - UrgLatency[i] * ((GPUVMMaxPageTableLevels <= 2 ? GPUVMMaxPageTableLevels
-						: GPUVMMaxPageTableLevels - 2) * (HostVMEnable == true ? HostVMMaxNonCachedPageTableLevels + 1 : 1) - 1) - DynamicMetadataVMExtraLatency[k];
+				PixelDCFCLKCyclesRequiredInPrefetch[k] = (v->PrefetchLinesY[i][j][k] * v->swath_width_luma_ub_all_states[i][j][k] * v->BytePerPixelY[k]
+					+ v->PrefetchLinesC[i][j][k] * v->swath_width_chroma_ub_all_states[i][j][k] * v->BytePerPixelC[k]) / NormalEfficiency / v->ReturnBusWidth;
+				DCFCLKCyclesRequiredInPrefetch = 2 * ExtraLatencyCycles / NoOfDPPState[k] + v->PDEAndMetaPTEBytesPerFrame[i][j][k] / PTEEfficiency
+					/ NormalEfficiency / v->ReturnBusWidth *  (v->GPUVMMaxPageTableLevels > 2 ? 1 : 0) + 2 * v->DPTEBytesPerRow[i][j][k] / PTEEfficiency
+					/ NormalEfficiency / v->ReturnBusWidth + 2 * v->MetaRowBytes[i][j][k] / NormalEfficiency / v->ReturnBusWidth + PixelDCFCLKCyclesRequiredInPrefetch[k];
+				PrefetchPixelLinesTime[k] = dml_max(v->PrefetchLinesY[i][j][k], v->PrefetchLinesC[i][j][k]) * v->HTotal[k] / v->PixelClock[k];
+				ExpectedPrefetchBWAcceleration = (v->VActivePixelBandwidth[i][j][k] + v->VActiveCursorBandwidth[i][j][k]) / (v->ReadBandwidthLuma[k] + v->ReadBandwidthChroma[k]);
+				DynamicMetadataVMExtraLatency[k] = (v->GPUVMEnable == true && v->DynamicMetadataEnable[k] == true && v->DynamicMetadataVMEnabled == true) ?
+						v->UrgLatency[i] * v->GPUVMMaxPageTableLevels *  (v->HostVMEnable == true ? v->HostVMMaxNonCachedPageTableLevels + 1 : 1) : 0;
+				PrefetchTime = (v->MaximumVStartup[i][j][k] - 1) * v->HTotal[k] / v->PixelClock[k] - MinimumTWait - v->UrgLatency[i] * ((v->GPUVMMaxPageTableLevels <= 2 ? v->GPUVMMaxPageTableLevels
+						: v->GPUVMMaxPageTableLevels - 2) * (v->HostVMEnable == true ? v->HostVMMaxNonCachedPageTableLevels + 1 : 1) - 1) - DynamicMetadataVMExtraLatency[k];
 
 				if (PrefetchTime > 0) {
 					double ExpectedVRatioPrefetch = { 0 };
 					ExpectedVRatioPrefetch = PrefetchPixelLinesTime[k] / (PrefetchTime * PixelDCFCLKCyclesRequiredInPrefetch[k] / DCFCLKCyclesRequiredInPrefetch);
 					DCFCLKRequiredForPeakBandwidthPerPlane[k] = NoOfDPPState[k] * PixelDCFCLKCyclesRequiredInPrefetch[k] / PrefetchPixelLinesTime[k]
 						* dml_max(1.0, ExpectedVRatioPrefetch) * dml_max(1.0, ExpectedVRatioPrefetch / 4) * ExpectedPrefetchBWAcceleration;
-					if (HostVMEnable == true || ImmediateFlipRequirement == dm_immediate_flip_required) {
+					if (v->HostVMEnable == true || v->ImmediateFlipRequirement[0] == dm_immediate_flip_required) {
 						DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKRequiredForPeakBandwidthPerPlane[k]
-							+ NoOfDPPState[k] * DPTEBandwidth / PTEEfficiency / NormalEfficiency / ReturnBusWidth;
+							+ NoOfDPPState[k] * DPTEBandwidth / PTEEfficiency / NormalEfficiency / v->ReturnBusWidth;
 					}
 				} else {
-					DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKPerState[i];
+					DCFCLKRequiredForPeakBandwidthPerPlane[k] = v->DCFCLKPerState[i];
 				}
-				if (DynamicMetadataEnable[k] == true) {
+				if (v->DynamicMetadataEnable[k] == true) {
 					double TsetupPipe = { 0 };
 					double TdmbfPipe = { 0 };
 					double TdmsksPipe = { 0 };
@@ -6757,49 +6588,49 @@ static void UseMinimumDCFCLK(
 					double AllowedTimeForUrgentExtraLatency = { 0 };
 
 					CalculateDynamicMetadataParameters(
-							MaxInterDCNTileRepeaters,
-							RequiredDPPCLK[i][j][k],
-							RequiredDISPCLK[i][j],
-							ProjectedDCFCLKDeepSleep[i][j],
-							PixelClock[k],
-							HTotal[k],
-							VTotal[k] - VActive[k],
-							DynamicMetadataTransmittedBytes[k],
-							DynamicMetadataLinesBeforeActiveRequired[k],
-							Interlace[k],
-							ProgressiveToInterlaceUnitInOPP,
+							v->MaxInterDCNTileRepeaters,
+							v->RequiredDPPCLK[i][j][k],
+							v->RequiredDISPCLK[i][j],
+							v->ProjectedDCFCLKDeepSleep[i][j],
+							v->PixelClock[k],
+							v->HTotal[k],
+							v->VTotal[k] - v->VActive[k],
+							v->DynamicMetadataTransmittedBytes[k],
+							v->DynamicMetadataLinesBeforeActiveRequired[k],
+							v->Interlace[k],
+							v->ProgressiveToInterlaceUnitInOPP,
 							&TsetupPipe,
 							&TdmbfPipe,
 							&TdmecPipe,
 							&TdmsksPipe);
-					AllowedTimeForUrgentExtraLatency = MaximumVStartup[i][j][k] * HTotal[k] / PixelClock[k] - MinimumTWait - TsetupPipe
+					AllowedTimeForUrgentExtraLatency = v->MaximumVStartup[i][j][k] * v->HTotal[k] / v->PixelClock[k] - MinimumTWait - TsetupPipe
 							- TdmbfPipe - TdmecPipe - TdmsksPipe - DynamicMetadataVMExtraLatency[k];
 					if (AllowedTimeForUrgentExtraLatency > 0) {
 						DCFCLKRequiredForPeakBandwidthPerPlane[k] = dml_max(DCFCLKRequiredForPeakBandwidthPerPlane[k],
 								ExtraLatencyCycles / AllowedTimeForUrgentExtraLatency);
 					} else {
-						DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKPerState[i];
+						DCFCLKRequiredForPeakBandwidthPerPlane[k] = v->DCFCLKPerState[i];
 					}
 				}
 			}
 			DCFCLKRequiredForPeakBandwidth = 0;
-			for (k = 0; k <= NumberOfActivePlanes - 1; ++k) {
+			for (k = 0; k <= v->NumberOfActivePlanes - 1; ++k) {
 				DCFCLKRequiredForPeakBandwidth = DCFCLKRequiredForPeakBandwidth + DCFCLKRequiredForPeakBandwidthPerPlane[k];
 			}
-			MinimumTvmPlus2Tr0 = UrgLatency[i] * (GPUVMEnable == true ? (HostVMEnable == true ?
-					(GPUVMMaxPageTableLevels + 2) * (HostVMMaxNonCachedPageTableLevels + 1) - 1 : GPUVMMaxPageTableLevels + 1) : 0);
-			for (k = 0; k < NumberOfActivePlanes; ++k) {
+			MinimumTvmPlus2Tr0 = v->UrgLatency[i] * (v->GPUVMEnable == true ? (v->HostVMEnable == true ?
+					(v->GPUVMMaxPageTableLevels + 2) * (v->HostVMMaxNonCachedPageTableLevels + 1) - 1 : v->GPUVMMaxPageTableLevels + 1) : 0);
+			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 				double MaximumTvmPlus2Tr0PlusTsw = { 0 };
-				MaximumTvmPlus2Tr0PlusTsw = (MaximumVStartup[i][j][k] - 2) * HTotal[k] / PixelClock[k] - MinimumTWait - DynamicMetadataVMExtraLatency[k];
+				MaximumTvmPlus2Tr0PlusTsw = (v->MaximumVStartup[i][j][k] - 2) * v->HTotal[k] / v->PixelClock[k] - MinimumTWait - DynamicMetadataVMExtraLatency[k];
 				if (MaximumTvmPlus2Tr0PlusTsw <= MinimumTvmPlus2Tr0 + PrefetchPixelLinesTime[k] / 4) {
-					DCFCLKRequiredForPeakBandwidth = DCFCLKPerState[i];
+					DCFCLKRequiredForPeakBandwidth = v->DCFCLKPerState[i];
 				} else {
 					DCFCLKRequiredForPeakBandwidth = dml_max3(DCFCLKRequiredForPeakBandwidth, 2 * ExtraLatencyCycles
 							/ (MaximumTvmPlus2Tr0PlusTsw - MinimumTvmPlus2Tr0 - PrefetchPixelLinesTime[k] / 4),
 						(2 * ExtraLatencyCycles + PixelDCFCLKCyclesRequiredInPrefetch[k]) / (MaximumTvmPlus2Tr0PlusTsw - MinimumTvmPlus2Tr0));
 				}
 			}
-			DCFCLKState[i][j] = dml_min(DCFCLKPerState[i], 1.05 * (1 + mode_lib->vba.PercentMarginOverMinimumRequiredDCFCLK / 100)
+			v->DCFCLKState[i][j] = dml_min(v->DCFCLKPerState[i], 1.05 * (1 + mode_lib->vba.PercentMarginOverMinimumRequiredDCFCLK / 100)
 					* dml_max(DCFCLKRequiredForAverageBandwidth, DCFCLKRequiredForPeakBandwidth));
 		}
 	}
-- 
2.37.1

