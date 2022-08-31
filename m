Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A536C5A8805
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 23:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA2710E414;
	Wed, 31 Aug 2022 21:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBD110E3F6;
 Wed, 31 Aug 2022 21:23:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THLgD4uXN1PycZVGBA2QCxpwJuRtxNMQHX8mfCf/7eSyGbrF52U/rS0wdwmlnH6ieRmn2ciUtyimjJAoY7zY/Txg25lsQ8UdsQYPDEICzjfw/7CvbYPKOSsRI8CWAA3QIzKravSzsdU9oGvmsiFkYg5zbb6gRMutU32XHb4iMBlLp+awZ1206AIJl4A74+rTASzwxadf6lvI4bD/W274DjKJ1in8C/2JO5ViQjoZDwfl8VE5PhodkduqY8VqwEwqIhftYuFWYxjBrrhXMS1lkIELf4ee0alztdtuH1P+ZpGguN2HYXYYy+ahf5hMGJ9Z1DX/ZlFb/Ea63uwfSyaV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1CMyWYbvO5U9O/4aM9r6cZfoSFCNHChb+gHYpflWPA=;
 b=cllGBWkVoUmeLgZpVGFeZjGOGVz/3sQ1W89p1jwGsCl3kWQTwcPPR5FPYtH+cXdU9AqoWqr0RNFmtKHCQfTNbYQY9PhuvYuwmvZ2xp4MsCyRfirXuBGgFHfJmdWrENzWX0yB0Sb5TUudSUOhwNkmYEDcr/09jvV0EZHcnCMZjKbA10NUqYxdbM3SlfcJHKyVnAyIsJsrT+fVretSKNfSVXwrw5W48R4RyIolzdVY6st8GQSYYFsImlY8dEzxIr5OHzxO/uM8ZRag4pCyyBd1mWeFyrdjKSbxKkMbB0a1DJg64c5xmfKxzRjmLN31xbh63/qGBCaX4QYlAKYqeQm+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1CMyWYbvO5U9O/4aM9r6cZfoSFCNHChb+gHYpflWPA=;
 b=Pxh5Es3rJXgqkzWrCoRdM2+nmtKNF1OfVMW7198N36kNwfzu5T5Xxo7dmhCjLovMasw0IuwoMXuXGbCXfE+XDTLDtaXXOPgVDq97wMjau23cikxwgkARLIYw3ksNJQ7k5Yb2GgFnTWjVQTnxuvmtuhAg9iPQMD6a7WFtNWiYdZI=
Received: from DS7PR06CA0041.namprd06.prod.outlook.com (2603:10b6:8:54::10) by
 BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 21:23:29 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::5d) by DS7PR06CA0041.outlook.office365.com
 (2603:10b6:8:54::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Wed, 31 Aug 2022 21:23:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Wed, 31 Aug 2022 21:23:28 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 31 Aug
 2022 16:23:27 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.0
Date: Wed, 31 Aug 2022 17:23:12 -0400
Message-ID: <20220831212312.5921-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90e55d3a-906f-4cc3-531a-08da8b970c5c
X-MS-TrafficTypeDiagnostic: BY5PR12MB4066:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gHNIaX5D6lh/o7tYMQbND/H5TVR+0UmoeJUUKuE7umCDLhf/FA/JNhQmd8maQDvDa6CY65RAxzOCWDnom9mt71UUUjV8ze19emubxtMj1UQnuxuGRN3fAdL4S8wWNuAnrquNTYbKY7M/GhzYlxABEUeHieaZXxediU7hdrwKRPngcsfYVTqm6/3DxDc4AKSPRXntcqRETGPLjFQeQbcHr/q9Rbvbp0k7/kBlXvj65FBdDdaaapatVHgSz0EjNdUI4rUsmcLKHOTGGfUvtGQkhnWJXjaf13Iuapaf/S5w5ZUTx22j6tiSwb/w58IRz3+OWyUKNXgNLKMu0uUcIT53vKLYdMW0InbkLr4kIqki2Q4bwMgxwvj24+9lz2pIsrv5q7UbPsiXaXbAJOi0L0hUqOefYfFa8HClcsvyCxkplQnOr52ETR8gZGlhoMnRZwhL1YkYIKaKEW0UEJjv7G1wXHcwbpuJhkekRTr5H+oUS9vP8Kbw/63G/84BKCwCkbh0EOaI3roFfSY3iO4N5coUqpLDhZYJHYv85EyegaSCEQ5a5Jyes5pjCW/yFn6kd2FywgYbddMF7AxXWB02K7t4L/Lj0EfLkNPy3rS6K7gQDm7xEwVf8+jvwEnvfA+xi4sLvdtfodAr5hLNXt4j/qSblsB/XRsBB7h977JDSopb7P84paoMdK2JNSdw+Dom/MJOc3mwFPIUi3OWNym6RUg1EdxxO/bMc/zrVgO33vTQjIzN9b4oScGSjZQJ6NBNyO7T
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(40470700004)(36840700001)(81166007)(966005)(186003)(316002)(1076003)(8676002)(70586007)(110136005)(70206006)(4326008)(40460700003)(86362001)(36756003)(478600001)(5660300002)(8936002)(41300700001)(356005)(2616005)(82740400003)(82310400005)(6666004)(26005)(2906002)(7696005)(336012)(36860700001)(16526019)(40480700001)(83380400001)(426003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 21:23:28.9108 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e55d3a-906f-4cc3-531a-08da8b970c5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066
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

Fixes for 6.0.  Once again, mainly fixes for new IPs added in 6.0.

The following changes since commit b90cb1053190353cc30f0fef0ef1f378ccc063c5:

  Linux 6.0-rc3 (2022-08-28 15:05:29 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.0-2022-08-31

for you to fetch changes up to 39c84b8e929dbd4f63be7e04bf1a2bcd92b44177:

  drm/amd/amdgpu: skip ucode loading if ucode_size == 0 (2022-08-31 17:02:20 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.0-2022-08-31:

amdgpu:
- FRU error message fix
- MES 11 updates
- DCN 3.2.x fixes
- DCN 3.1.4 fixes
- Fix possible use after free in CS IOCTL
- SMU 13.0.x fixes
- Fix iolink reporting on devices with direct connections to CPU
- GFX10 tap delay firmware fixes

----------------------------------------------------------------
Alex Sierra (1):
      drm/amdgpu: ensure no PCIe peer access for CPU XGMI iolinks

Aurabindo Pillai (4):
      drm/amd/display: Fix CAB cursor size allocation for DCN32/321
      drm/amd/display: disable display fresh from MALL on an edge case for DCN321
      drm/amd/display: use actual cursor size instead of max for CAB allocation
      drm/amd/display: Use correct plane for CAB cursor size allocation

Charlene Liu (1):
      drm/amd/display: fix wrong register access

Chengming Gui (1):
      drm/amd/amdgpu: skip ucode loading if ucode_size == 0

Duncan Ma (1):
      drm/amd/display: Fix OTG H timing reset for dcn314

Ethan Wellenreiter (2):
      drm/amd/display: Re-initialize viewport after pipe merge
      drm/amd/display: Fix check for stream and plane

Evan Quan (3):
      drm/amd/pm: use vbios carried pptable for those supported SKUs
      drm/amd/pm: use vbios carried pptable for all SMU13.0.7 SKUs
      drm/amd/pm: bump SMU 13.0.0 driver_if header version

George Shen (1):
      drm/amd/display: Fix DCN32 DPSTREAMCLK_CNTL programming

Graham Sider (1):
      drm/amdgpu: Update mes_v11_api_def.h

Guchun Chen (1):
      drm/amdgpu: disable FRU access on special SIENNA CICHLID card

Hawking Zhang (1):
      drm/amdgpu: only init tap_delay ucode when it's included in ucode binary

Leo Chen (1):
      drm/amd/display: Missing HPO instance added

Vladimir Stempen (1):
      drm/amd/display: Fix black flash when switching from ODM2to1 to ODMBypass

Wang Fudong (1):
      drm/amd/display: set dig fifo read start level to 7 before dig fifo reset

YuBiao Wang (1):
      drm/amdgpu: Fix use-after-free in amdgpu_cs_ioctl

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |  9 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 60 ++++++++++--------
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  1 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  3 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |  3 +
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |  1 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |  3 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  1 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |  8 +--
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |  5 ++
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c | 68 +++++++++++++++-----
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  9 +++
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |  4 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |  3 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  8 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     | 23 +++----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 72 +++++++++++++++++++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 35 +++++++----
 23 files changed, 234 insertions(+), 96 deletions(-)
