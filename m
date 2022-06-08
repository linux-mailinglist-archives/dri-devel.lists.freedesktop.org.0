Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A45543D98
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 22:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2247011371F;
	Wed,  8 Jun 2022 20:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12C411370E;
 Wed,  8 Jun 2022 20:30:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F32DEbCUPxgoZ9/f/6mkWzp2LEW6+ukbmvj+uRZmqzwR/T1JJKGCPHhp0IJDFfV8JiH71Tprc7gqjCZJqcAI1A8bkx5YB/umyTQb4EEuQXi12XLiLzzntUdlqOw6Q+xL6J54lpAi1TidrnU5PgxFHji0y6Knk3oKljpct+BzP79UQrQox65qw3MxLiQ1ApOFf3kfCkvWEGq5SKPftGbM7zIR54q7cn8ugjRyn3397zm9LUA1KI0O/QergXQAVhByZyjbqhboHeLTtglB1mZm6SHAK+bt4Ty/855uoewxZNX9M8n2aG+kj6IhaaL/5/ZOq4s9iH5rv0IbC5/Q3pX82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D1LgjqTUY3/JEehlQob0JLyfS9HI4j/6xrHOSytP9E=;
 b=N0M2bmzWXkDZskTpAOSlKhSZ7R2eeB4zIryW6q0+HcPpZ4ZT5dopNnykLBSSd8kNFKV8VeZyp9bPP4GhSGEYAPPvzg8Th3K+AdZAYxOirv+Vbudi2kcInQjLe5MAILcjd5994lSiyy+OT9R0Nzb5mBGszVuMXXbo2Yqcv0LIEkTg9GEuJparpI396i+eFG01csnt0LbxGNEgXhn++9hoHvv3Rs5TEKKGdZ1WqLBpFxSZp4NJhcnHGSLtWomt0NPilZgVM+XIEjFHNqU7onOORA5zTVfvf9TsdJgoPkhroMSwPpZNXTHyGWUNGHr/eBSwvVfoRAvxEZbRVVqTqaV11A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/D1LgjqTUY3/JEehlQob0JLyfS9HI4j/6xrHOSytP9E=;
 b=Or5OUhsEHSIl0pvRFdvARJ4dPBBoH2A3X2nesCxhtfWO156+d17l8JMC4X7OPL7vXBKWj1pSOfH9cQpNbIYIZQA0OteBqQ637Gs15AbfdDrwROiFEyNxiFjU+3mhiD+kUYVZS2IJEqNU4v6p4URAnK5ds4tS4rciMCsc5mA/cZ0=
Received: from BN8PR16CA0002.namprd16.prod.outlook.com (2603:10b6:408:4c::15)
 by SA1PR12MB5659.namprd12.prod.outlook.com (2603:10b6:806:236::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Wed, 8 Jun
 2022 20:30:24 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::6) by BN8PR16CA0002.outlook.office365.com
 (2603:10b6:408:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17 via Frontend
 Transport; Wed, 8 Jun 2022 20:30:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Wed, 8 Jun 2022 20:30:23 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 8 Jun
 2022 15:30:22 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-5.19
Date: Wed, 8 Jun 2022 16:30:08 -0400
Message-ID: <20220608203008.6187-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e16a2ccf-e7ed-4da8-32c0-08da498db6f8
X-MS-TrafficTypeDiagnostic: SA1PR12MB5659:EE_
X-Microsoft-Antispam-PRVS: <SA1PR12MB565951BC39DE45FFE5EC6888F7A49@SA1PR12MB5659.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tzR3i6Ym9GMCjGrxGAlTeV2BSVRfQoYAl2hS9mHLHP5UW+dk/uqw105d4Tsm8uMYreMirwITG8fPoy5d9WDylMwND3Ia5+tG7NuULkBkDiemF3JsA2pFQ2HRkwDrWjFatN4u0iM58yVTUWyk8ljPWBZ5FS7648wLtIA1CJPQuUuw3qNizl0B5JoQPF5LHWkgVElo3IhlXqY52jVLFxtVQ/kg0OawXr8DsEa2P7mjIOQHmVpk4pVeaNAoutdDrcUkavFYc4wldLXY9rru7YkUJ2X2ddrXj/9G53hzCyC0XnlcYmF1SO0M38QSP9Hdjs/bYxdczHal1b7WQuC8a8nDzJXCYetUKAws6gVR3LY0MqcSyw31w35m2QaBQRrCqnqTNjCZ97gXYZrJyzD54kXcVawyXIg67hOeARzhJ7yBMaUFN9M6X6PciiNuuTo52MKA23LGVhb/680AKGP/FQA5kCvWzKRMJjFXXcuchCphPAaT6N2myv7ZhcPQlIFeeLsCUf5u4G4Gf2GvD4fJ02iupMB6TtLSFLq9e0r84APWNEN6Fb3lQMqvMDHiceqc09H9sOpX/KL88cs8KidhjZi9WhJOiVkXoYB8guZ/EtpKfskmgseOUu4CaolzAjNHb+246vfCK4F7JDqO5ehjGvLHemvgTxyPUnXXdWct1LvhJCfh2/PsDVkVSUrTlYN0PtT9/tOOiGlESQDHStThMzR7sQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36756003)(1076003)(2616005)(316002)(336012)(47076005)(6666004)(26005)(966005)(40460700003)(86362001)(83380400001)(110136005)(186003)(7696005)(81166007)(4326008)(70206006)(16526019)(66574015)(8936002)(426003)(508600001)(5660300002)(356005)(70586007)(2906002)(82310400005)(8676002)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 20:30:23.4500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e16a2ccf-e7ed-4da8-32c0-08da498db6f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5659
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

Fixes for 5.19.

The following changes since commit bf23729c7a5f44f0e863666b9364a64741fd3241:

  Merge tag 'amd-drm-next-5.19-2022-05-26-2' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-06-01 10:56:11 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.19-2022-06-08

for you to fetch changes up to 431d071286524bd4f9ba2e46b1be87b479220174:

  drm/amdgpu/mes: only invalid/prime icache when finish loading both pipe MES FWs. (2022-06-08 15:39:16 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.19-2022-06-08:

amdgpu:
- DCN 3.1 golden settings fix
- eDP fixes
- DMCUB fixes
- GFX11 fixes and cleanups
- VCN fix for yellow carp
- GMC11 fixes
- RAS fixes
- GPUVM TLB flush fixes
- SMU13 fixes
- VCN3 AV1 regression fix
- VCN2 JPEG fix
- Other misc fixes

amdkfd:
- MMU notifier fix
- Support for more GC 10.3.x families
- Pinned BO handling fix
- Partial migration bug fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: update VCN codec support for Yellow Carp

Alvin (1):
      drm/amd/display: Don't clear ref_dtbclk value

Aric Cyr (1):
      drm/amd/display: 3.2.187

Aurabindo Pillai (1):
      drm/amd/display: remove stale config guards

Candice Li (1):
      drm/amdgpu: Resolve RAS GFX error count issue after cold boot on Arcturus

Christian König (2):
      drm/amdgpu: fix limiting AV1 to the first instance on VCN3
      drm/amdgpu: always flush the TLB on gfx8

Evan Quan (2):
      drm/amd/pm: suppress compile warnings about possible unaligned accesses
      drm/amdgpu: suppress the compile warning about 64 bit type

Guchun Chen (1):
      Revert "drm/amdgpu: Ensure the DMA engine is deactivated during set ups"

Hung, Cruise (1):
      drm/amd/display: Fix DMUB outbox trace in S4 (#4465)

Ilya (1):
      drm/amd/display: Fix possible infinite loop in DP LT fallback

Jesse Zhang (1):
      drm/amdkfd:Fix fw version for 10.3.6

Jiapeng Chong (1):
      drm/amdgpu: make program_imu_rlc_ram static

Joseph Greathouse (1):
      drm/amdgpu: Add MODE register to wave debug info in gfx11

Lang Yu (1):
      drm/amdkfd: add pinned BOs to kfd_bo_list

Leung, Martin (1):
      drm/amd/display: revert Blank eDP on disable/enable drv

Mario Limonciello (1):
      drm/amdkfd: Add GC 10.3.6 and 10.3.7 KFD definitions

Mohammad Zafar Ziya (1):
      drm/amdgpu/jpeg2: Add jpeg vmid update under IB submit

Nicholas Kazlauskas (2):
      drm/amd/display: Pass the new context into disable OTG WA
      Revert "drm/amd/display: Pass the new context into disable OTG WA"

Philip Yang (3):
      drm/amdkfd: Use mmget_not_zero in MMU notifier
      drm/amdgpu: Update PDEs flush TLB if PTB/PDB moved
      drm/amdkfd: Fix partial migration bugs

Roman Li (1):
      drm/amdgpu: fix aper_base for APU

Sherry Wang (1):
      drm/amd/display: Read Golden Settings Table from VBIOS

Stanley.Yang (1):
      drm/amdgpu: fix ras supported check

Sunil Khatri (1):
      drm/amdgpu: enable tmz by default for GC 10.3.7

Yifan Zhang (1):
      drm/amdgpu/mes: only invalid/prime icache when finish loading both pipe MES FWs.

hengzhou (1):
      drm/amd/display: Wait DMCUB to idle state before reset.

sunliming (2):
      drm/amdgpu: fix a missing break in gfx_v11_0_handle_priv_fault
      drm/amdgpu: make gfx_v11_0_rlc_stop static

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  13 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  32 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  13 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   6 ++
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.h             |   1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  36 ++++---
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             | 109 +++++++++------------
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  17 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  18 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   5 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |  11 ++-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h   |   2 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   7 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |   3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 106 +++++++++-----------
 drivers/gpu/drm/amd/display/dc/dc.h                |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |  68 ++++++-------
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c   |   2 -
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |  18 ++--
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |  19 +++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |  11 ++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |   3 +-
 .../drm/amd/display/include/ddc_service_types.h    |   2 +
 .../gpu/drm/amd/pm/swsmu/inc/smu_v11_0_7_pptable.h |   9 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h   |   9 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h |   5 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v13_0_pptable.h   |  10 +-
 37 files changed, 330 insertions(+), 251 deletions(-)
