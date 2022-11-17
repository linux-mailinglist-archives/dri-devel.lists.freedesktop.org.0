Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6495E62D21B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 05:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421C210E52B;
	Thu, 17 Nov 2022 04:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD63F10E52A;
 Thu, 17 Nov 2022 04:04:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNiYPdQZC5UCufLHd5FezvP06VoNDDI/SnGLAXpnfEjajI1JzfjOAfm8RbVHdvTQm9Y8xQKAWytwPwBspXpcz8RsIZXCFFeaHvBTSJHNfCv2WGLn068Xs5Ysy0tkA/rrSNpLcwxQMrPiI8Ajl1xgODhsoINR5VJceXoJtEErmFpymWIZqRLgm1e0ZGCgeCr69cmACHStzV0U9gomooMp5lEOgQWQcZoKrixhsDwu3GdG6xr3zf1pKD5vcpfJflT5aFkxoFay3IdDGuGlXMYSoiUZJV3asaTGTHvkkZbLhLb4iKNIAsdZenHv9fvbpAPZdvmXiAlKy9mR2E4/HlOvLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1HvR4SP8bWT5AmGa9cePwhRMjHmnA6KUqd9q9oX+pU=;
 b=V0Cw73yZTbBNvU7GVtY9LOkdOYQgw7nhA02Wiv/cwnYmtsHehXcQc2TUksG7b9xKQXYPr9JxX23nAMXAtp5+4cfD6N9Ee5Sz8IUoj2SRl39MCmuKCqK823XEmAPoBOF/6HICHpVYvWV/KACZsf8H/Ky1PmyG4j/PmCDY5k0deUR5bo3dzp7y//mGuCvq1+74JweOn7lyHBLzuxA2+uvkQpEOd6iJkGntJ6vErc6yUdKPrh7DQ+1jWvoeRxA/3zsQURJ4uSuFRTNRekyxkqfBxabVjBTco1qeoDsa9nYoxRpC4o6CMOjVwKowJPfZhF8QgCL98cPuPDjeCa3JnRFrtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1HvR4SP8bWT5AmGa9cePwhRMjHmnA6KUqd9q9oX+pU=;
 b=JSqPrE0fP3+znYt0pauVp4fOlzYdBR/pLaYMxaVhpUhBvblsI5D87tam1WK6oZcM3Uigv4EdaE3VhS8Tde0Pafjih1e42eXxjwKAjDs8PBxf8a/fT3UTh1TVbKQLkCsbGV8NkCrTCjDkG1rxjJK3zqJpCFUEh+pagpXmv2y0wF8=
Received: from BN9PR03CA0389.namprd03.prod.outlook.com (2603:10b6:408:f7::34)
 by CY5PR12MB6156.namprd12.prod.outlook.com (2603:10b6:930:24::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Thu, 17 Nov
 2022 04:04:43 +0000
Received: from BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::71) by BN9PR03CA0389.outlook.office365.com
 (2603:10b6:408:f7::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Thu, 17 Nov 2022 04:04:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT087.mail.protection.outlook.com (10.13.177.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 04:04:43 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 16 Nov
 2022 22:04:38 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.1
Date: Wed, 16 Nov 2022 23:04:16 -0500
Message-ID: <20221117040416.6100-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT087:EE_|CY5PR12MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 502273be-814c-49e1-1b99-08dac850dbc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1qjvVOBfi/xBqCCAiqkz1C5ko122nHBEM0GDdgyqQ5m0l+DjkY0slAfXevrdU3YN5dDdpadkT4Twgz2xWTS2Jrd7hlXz1D4dSt3Pn0j0oeHW8/q6u7RA03+WwTx6s/ZdJmjlSntSMKH1R1535Iz8rLHVXs8C+9NFN7Yzp0QXtP0cY3H/I8o9JAYfKgJMW7gwUc2Ps3hXZbMZqW1dFfBnGgGzJ6J7ql1Xjfli8b31GO4Wst6X0Z5nOF0LU823Pd1LDmJwD01AlOoTP3A+tvJ/pBjou9o1Vwm/Fn5tmbs61pn8aT/TkuUMIFLmcAUi3RA4zUKBQ9rSGQ6NNSZqOcz7uEJRa+vYLBv4AkEPc4OJUgD1XsOsqBK0PnQYL6zAphtvj/tmQrK4q91nh8CfjGr/nTAB0zXYub6BWiTeR9vno/oCUHwrfTLWR61djz4Tl62vFoyEzXGtOTXnrXDyngL9AA4YawDI75Rmf7IU6oil492BrRzv+QeaEZAshj1GMH5/sS2D2SVyBd0DoZvgfSqiE7JZVIzMd4y/EvveiVgPO3lTbLkjvzizh6A7y79P9oE6IFYEOmqSiTpljkt0U51cdtEVkp8L1ab3QzLIAIBpHd3Kjf0xOLA04TOUzW6YalVLUdveud9wnK6Le0e2U3a7fh/G+kUd5yYk0O5tpYhARP2o4QsN9plg6GR6hoiUvl5ruCvFbuDkkimZFv7XZS6pa7wIg9m45q08pgZ6szZzLsQDwFC5+1G5hokeRy+/IPdv
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(86362001)(82740400003)(36860700001)(8936002)(5660300002)(2906002)(4001150100001)(47076005)(1076003)(186003)(16526019)(356005)(83380400001)(336012)(426003)(2616005)(81166007)(316002)(4326008)(41300700001)(8676002)(110136005)(82310400005)(478600001)(40480700001)(40460700003)(6666004)(26005)(70206006)(70586007)(7696005)(966005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 04:04:43.4991 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 502273be-814c-49e1-1b99-08dac850dbc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6156
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

Fixes for 6.1.

The following changes since commit 094226ad94f471a9f19e8f8e7140a09c2625abaa:

  Linux 6.1-rc5 (2022-11-13 13:12:55 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.1-2022-11-16

for you to fetch changes up to 4b14841c9a820e484bc8c4c3f5a6fed1bc528cbc:

  drm/amd/pm: fix SMU13 runpm hang due to unintentional workaround (2022-11-15 13:29:06 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.1-2022-11-16:

amdgpu:
- Fix a possible memory leak in ganng submit error path
- DP tunneling fixes
- DCN 3.1 page flip fix
- DCN 3.2.x fixes
- DCN 3.1.4 fixes
- Don't expose degamma on hardware that doesn't support it
- BACO fixes for SMU 11.x
- BACO fixes for SMU 13.x
- Virtual display fix for devices with no display hardware

amdkfd:
- Memory limit regression fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: there is no vbios fb on devices with no display hw (v2)

Candice Li (1):
      drm/amdgpu: Add psp_13_0_10_ta firmware to modinfo

Dillon Varone (3):
      drm/amd/display: Fix prefetch calculations for dcn32
      drm/amd/display: use uclk pstate latency for fw assisted mclk validation dcn32
      drm/amd/display: Set max for prefetch lines on dcn32

Dong Chenchen (1):
      drm/amdgpu: Fix memory leak in amdgpu_cs_pass1

Eric Huang (1):
      drm/amdkfd: Fix a memory limit issue

Evan Quan (3):
      drm/amd/pm: enable runpm support over BACO for SMU13.0.0
      drm/amd/pm: enable runpm support over BACO for SMU13.0.7
      drm/amd/pm: fix SMU13 runpm hang due to unintentional workaround

George Shen (2):
      drm/amd/display: Support parsing VRAM info v3.0 from VBIOS
      drm/amd/display: Fix calculation for cursor CAB allocation

Guchun Chen (1):
      drm/amdgpu: disable BACO support on more cards

Melissa Wen (1):
      drm/amd/display: don't enable DRM CRTC degamma property for DCE

Rodrigo Siqueira (1):
      drm/amd/display: Add HUBP surface flip interrupt handler

Roman Li (1):
      drm/amd/display: Fix optc2_configure warning on dcn314

Stylon Wang (2):
      drm/amd/display: Fix access timeout to DPIA AUX at boot time
      drm/amd/display: Fix invalid DPIA AUX reply causing system hang

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 41 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 32 +++++++++++++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  6 ----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 10 ++++--
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 30 ++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |  1 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |  2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c | 14 +++-----
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 16 ++++++++-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  2 ++
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.h |  2 ++
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |  7 ++--
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 23 ++++++------
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  8 +++++
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       | 10 +-----
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       | 11 ++----
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  4 +++
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  9 +++++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 30 ++++++++++++++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 30 ++++++++++++++--
 26 files changed, 235 insertions(+), 69 deletions(-)
