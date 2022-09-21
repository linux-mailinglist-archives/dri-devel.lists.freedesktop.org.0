Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCD15E5608
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 00:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC1810E51F;
	Wed, 21 Sep 2022 22:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B898110E11B;
 Wed, 21 Sep 2022 22:06:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2OBXFRo6o1r6FejyXfMFd8RFtegdmMBhcHXGsW5FGgzKC8G3fsg7+YO/FPQ1chAJsnIgKW2fyXv0PqnMauYxwSQHLeQ1YGcWcR9qPQKUB4rAgWH1INgYSo3s5RPEmZJbW3gukqVQ61QHx6OBs8UxFuoT7TXTrv1BliivpJhmrq7Q7eZveCZz+CCWv2AZQc8t2xzSiP9Zn0NAkuHisPhtSBVZXkL2uXevIf72rzx16wZa4OMRznsqwU4+WNh9zSFcjPaY78hMv99s8OXWjJTwXCTNxKmH6Q1Ro6sGLzErBCAPY35zvVi7Jn/G4p/X6b86H4HTpVuTC3tbkVqkbWTeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrTgTzOGTWebqxSaqkY1js9zMenYvbxvXWvn5xKKG+Y=;
 b=Y7I+YbjlpPkiYXDTqcwP0eN1L7hN5J2TKXqYgbNPthphcEIN+y8aoDGxodWmPWPxKsnzatnEX8M4A5aDFAS+KLGzIRazYStxN/EtGVWTOy/VJdquSahwFO1If3myQyITWOv9PWs+5rYxj/ck6skZyhLjawWlgisBV3VTjMlYb0pC+qIx32IT9xoc9mGiQwL8OFooORQfIWlMMJ8xT8E3q0DKgxDMC4qYA/rdTkXpqT3Kdzimh+Ua8Bgx3cwgYlUkZ7NDvjLl3UPNxOTONSM/CeTlBTjp2g/N6rPCJEiGA6DWKcNI3VYJon+uBE/pqMXh0YY4CtD32bkDKM7X5UMDLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrTgTzOGTWebqxSaqkY1js9zMenYvbxvXWvn5xKKG+Y=;
 b=otHQYdlYjj/mo3lFpkMuyG/KWLzdIG7kcRQ9MscYDY+w79KqFchjnmHw+CcQQPj3E8OQYP7HMlWOCA9USsCXdUTOQfwYjVPqNIhC2AmeccsFfq1z0laY9u0bv78HVwDJ2Hze5chqjdzH60h4xpPGpnu128wpznJgkr0IR61+AeA=
Received: from BL1P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::14)
 by SA1PR12MB6895.namprd12.prod.outlook.com (2603:10b6:806:24e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Wed, 21 Sep
 2022 22:06:19 +0000
Received: from BL02EPF0000C405.namprd05.prod.outlook.com
 (2603:10b6:208:2c7:cafe::59) by BL1P222CA0009.outlook.office365.com
 (2603:10b6:208:2c7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Wed, 21 Sep 2022 22:06:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C405.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.11 via Frontend Transport; Wed, 21 Sep 2022 22:06:19 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 21 Sep
 2022 17:06:18 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.0
Date: Wed, 21 Sep 2022 18:06:05 -0400
Message-ID: <20220921220605.6136-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C405:EE_|SA1PR12MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 9287db4f-56f7-42d0-518f-08da9c1d8311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /0Zadc6kcdvFS8uxjlLc46344QnTnYtcuj9Hl6nAnkDLz/2bf+jCfCnR3Jn1VnVTqW1qldPDLT3jl954CMEEPMEspQSdPX4fXJztXTCdsCNgtHshce0hnLVX1IC4EYv7fBOQ3UWUC22FN+9+k7hhiMu/t5cDzAajgBp5+V3HlEO/DsHZY9kR14ZvL9KN3tB574sYzlTyoNf7gEEsmTGsZpY6xyAl1bjEcSNEORkA07ze2qzw47KZ56RPveni9onPF3XxBxEJCfzi8TobpjqYnEoN15psTTG8SgphKNS+rh7XD2jAZeDA2KxlkVDh4AIZF6AydxAYRGuAiT6wT9afttGaQ31/Yh7xUzIkcHEaS0eamcvb8RTcJgOaGwH/IPXkYn0gPYlZrv32XLafbqCRjbfevIR6wb1vvu7Xo46soPBirTKL3SjhcCq63TBonkliCFnnk6jupAXEoIJhmip+rJsGiLZQAjewDnFRsQMoCZmZrFiWHbqnywVq2j+wFNY8UeQ2Y91rG9HbdCzr+NWW3jZe3IA/CRoDL2ahvTHvdzx0T9s8uwoP8ARwKnPG7bhkfYX1K3H03uZyEMehrTfnveNi54FbBXOgrVc7EryR1cjn4aD7cfV3pN7Efpu/WnnTxKHjAX9sBk2lXD4JJosKLCJbKBblmxxKUWjwS3pMAHI3UflK7Fk3723MrH+DjMyFqQX5J+m5s2y6ZnAHfcFSQbyMfQb9cQe3d2oriFcKTeIk7pl6Bo9c8vdxLOKZBgWo
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(7696005)(2616005)(26005)(81166007)(5660300002)(966005)(478600001)(2906002)(82310400005)(356005)(36860700001)(86362001)(40460700003)(336012)(186003)(16526019)(40480700001)(83380400001)(8936002)(82740400003)(6666004)(426003)(47076005)(41300700001)(1076003)(36756003)(316002)(4326008)(70586007)(110136005)(8676002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 22:06:19.2500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9287db4f-56f7-42d0-518f-08da9c1d8311
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C405.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6895
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 6.0.  Mainly fixes for new IPs.  The big change here is the DML
clean up from Nathan to fix the Clang stack usage warnings on the DCN 3.1.4
code which was recently enabled.

The following changes since commit a8671493d2074950553da3cf07d1be43185ef6c6:

  drm/amdgpu: make sure to init common IP before gmc (2022-09-14 14:21:49 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.0-2022-09-21

for you to fetch changes up to f525ed19437d376736bed64ee7bc4afee82f2ba9:

  drm/amd/display: Reduce number of arguments of dml314's CalculateFlipSchedule() (2022-09-21 17:36:57 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.0-2022-09-21:

amdgpu:
- SDMA 6.x fix
- GPUVM TF fix
- DCN 3.2.x fixes
- DCN 3.1.x fixes
- SMU 13.x fixes
- Clang stack size fixes for recently enabled DML code
- Fix drm dirty callback change on non-atomic cases
- USB4 display fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: don't register a dirty callback for non-atomic

Alvin Lee (1):
      drm/amd/display: Only consider pixle rate div policy for DCN32+

Charlene Liu (1):
      drm/amd/display: correct num_dsc based on HW cap

Chris Park (1):
      drm/amd/display: Port DCN30 420 logic to DCN32

Cruise Hung (1):
      drm/amd/display: Fix DP MST timeslot issue when fallback happened

Daniel Miess (1):
      drm/amd/display: Add shift and mask for ICH_RESET_AT_END_OF_LINE

Dmytro Laktyushkin (2):
      drm/amd/display: fix dcn315 memory channel count and width read
      drm/amd/display: increase dcn315 pstate change latency

Evan Quan (2):
      drm/amd/pm: add support for 3794 pptable for SMU13.0.0
      drm/amd/pm: drop the pptable related workarounds for SMU 13.0.0

George Shen (1):
      drm/amd/display: Update dummy P-state search to use DCN32 DML

Hugo Hu (1):
      drm/amd/display: update gamut remap if plane has changed

Leo Li (1):
      drm/amd/display: Fix double cursor on non-video RGB MPO

Meenakshikumar Somasundaram (1):
      drm/amd/display: Display distortion after hotplug 5K tiled display

Michael Strauss (1):
      drm/amd/display: Assume an LTTPR is always present on fixed_vs links

Mukul Joshi (1):
      drm/amdgpu: Update PTE flags with TF enabled

Nathan Chancellor (2):
      drm/amd/display: Reduce number of arguments of dml314's CalculateWatermarksAndDRAMSpeedChangeSupport()
      drm/amd/display: Reduce number of arguments of dml314's CalculateFlipSchedule()

Nicholas Kazlauskas (1):
      drm/amd/display: Disable OTG WA for the plane_state NULL case on DCN314

Yifan Zhang (1):
      drm/amdgpu/mes: zero the sdma_hqd_mask of 2nd SDMA engine for SDMA 6.0.1

zhikzhai (1):
      drm/amd/display: skip audio setup when audio stream is enabled

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   7 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  12 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |  11 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |  14 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |  36 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |  11 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  16 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  17 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h   | 220 -----------
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   1 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |  16 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |   2 -
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |   1 -
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  11 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |   7 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   | 420 +++++----------------
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  46 ++-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |   6 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   2 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |  26 ++
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   4 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  44 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  53 +--
 28 files changed, 309 insertions(+), 698 deletions(-)
