Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B197D6EFFD5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 05:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169D310EA7A;
	Thu, 27 Apr 2023 03:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2FD10EA7A;
 Thu, 27 Apr 2023 03:30:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXEXjLa91Kdj1cOB5rbZuJgDm72xIGpcrNk2MtkRmtGVA2i50vor8Q7NjIRXsar5SRkFz4s0xjidBMAKZmQduIGXI33uLv3sisbOWqHhXnMKu9LAqGlNfYZ1sWAgWcZSju2EMXj0KlpWdp6EkCTF9RoMp404UHXsHHdAu5hhQAp6yaE/N7QFWaiFmyOZyv2aRZCW0oDL34tuKJhHmCLPZfuSq9F8++8kjoD3rIgNQfqULoJ092gOK4il5siWKjDTBcEJUwiUQDioMvUZth6CqmfkUeP5AO8XRK/yFUfo5saGoiilTIulNDwCZ36PA2qgz1uVoYeIMRSy0VRg36PcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAKSgdvJsDIVaqiHLip41YB9fxC47D787sfsyoWr/gg=;
 b=jxc4hI2FpGSZOI53t4hT7ff4ixo5elNDb44foJ+ikiSbLF1uvRunfsQqrJLymvCTaUKPWKN3hEC8XHJctuo6fAOsRL4RPfxYtvBLhefaY8PiWGwgenRWYMW8CrzZeaMPV5qjL+j/tR37gh07+aGz9stZ2c8fBgPLJNdld5Ef9ozQWdchFwGXn7LkPjGZvc6t0D8+hfBoSItoqB07U8UWebLYK2n5aoOoCOuvqQw/id3WfK3ilGp864YmPqx2i6nUmIq6VJxY73+8E4xFFmKAYsDM5wtUe1Qxf4DMEeEOdRlYXx+KNpHYbAEFcCQhnyxtcxBKstsFblUboM9I3rodDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAKSgdvJsDIVaqiHLip41YB9fxC47D787sfsyoWr/gg=;
 b=LkCre7QtcVxc7VvkzTYNE0CYW2IFNS+hPfn1KE23GGh4JTZhuCgReERxqzWqz4Ko4o7/CGKWzM6YtkjWIi34+ot9CJaDVgVi/3UUsf9h+x8tL3ubGV5+Kj/5QtbAg41330I7h0MriD8STs4Fv6tCUJ/IlrIVPF02dd9QUvrTOQs=
Received: from DM5PR08CA0049.namprd08.prod.outlook.com (2603:10b6:4:60::38) by
 CH0PR12MB8506.namprd12.prod.outlook.com (2603:10b6:610:18a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.22; Thu, 27 Apr 2023 03:30:43 +0000
Received: from DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::80) by DM5PR08CA0049.outlook.office365.com
 (2603:10b6:4:60::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21 via Frontend
 Transport; Thu, 27 Apr 2023 03:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT108.mail.protection.outlook.com (10.13.172.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.22 via Frontend Transport; Thu, 27 Apr 2023 03:30:43 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 26 Apr
 2023 22:30:42 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.4
Date: Wed, 26 Apr 2023 23:30:12 -0400
Message-ID: <20230427033012.7668-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT108:EE_|CH0PR12MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b3367a-a2eb-4aae-bf3a-08db46cfc828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sm4dicrvrvvSmbMtZD0hVHczh7j7ldNJOKcuLjYWeUvJgtm20roaBWGS5wZ0cgXLgf2SsyCKMiHcz58vT8ggC3UBrKYa+wy8OXST1x4/uwP/kxjCh2WEkFFJE9A/MqIE03KlyiGiVeUDTIb8Z72Pi1tHWhY7Chu1Opd41WUNLWuuEMxae4ikXDMVO8V74PDigg9nR4jQr/HmvgWWLWzm9d6Ho9mtDOyJktomXkAIgtf+ZBONboyu8utVOf+WMJSqVby5NXBdG0fQnza/fYIl3h4zPCmvviYwmP8HlAKSI6ifsD/oTcbMFkDZ/sJ+aQKv3hihNzHMdccf2QzusV4026d0dMaDsd4J2Ry61cJWmJ55g+WuZeY48fAVviiOtllUKGbeoDKDi1rbAO36RvPtKnl6Y9EgLeJPQ3TK5+DvkRIadrDPFqqugtcZL3PvBwwgAlorRTmguWmU58M82UsM4YAl4OlLi46oyRgwiS9gyDIlpoG3VOF4dSzGb7C+4er+B7+k68H8eAfnKHtY9NS6aFx9FBa0cNJfmZwHZBYig2b7FrORDRgsnKHNacw7XlGqGRRVu73FBbKBoL1050gt347p2j1AIzJFwRCrod5sPA0FhGI6iHDCKweF2jmlRqvC3rG1XZfgWzl+qV87/ZYnNAEPhurT8F8QMToU/kpgRywrW9sDS29kWoZqBiDcVSDb
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199021)(40470700004)(36840700001)(46966006)(86362001)(36756003)(82310400005)(2906002)(40460700003)(40480700001)(7696005)(36860700001)(6666004)(16526019)(2616005)(47076005)(83380400001)(336012)(186003)(426003)(1076003)(26005)(966005)(4326008)(70206006)(110136005)(70586007)(478600001)(356005)(316002)(82740400003)(5660300002)(41300700001)(8676002)(81166007)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 03:30:43.2564 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b3367a-a2eb-4aae-bf3a-08db46cfc828
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8506
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

Fixes for 6.4.  A bit bigger than usual since it's two weeks worth.  Mostly
display fixes.

The following changes since commit e82c98f2ca439356d5595ba8c9cd782f993f6f8c:

  Merge tag 'amd-drm-next-6.4-2023-04-14' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-04-17 10:54:59 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.4-2023-04-26

for you to fetch changes up to d893f39320e1248d1c97fde0d6e51e5ea008a76b:

  drm/amd/display: Lowering min Z8 residency time (2023-04-26 22:53:58 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.4-2023-04-26:

amdgpu:
- SR-IOV fixes
- DCN 3.2 fixes
- DC mclk handling fixes
- eDP fixes
- SubVP fixes
- HDCP regression fix
- DSC fixes
- DC FP fixes
- DCN 3.x fixes
- Display flickering fix when switching between vram and gtt
- Z8 power saving fix
- Fix hang when skipping modeset

----------------------------------------------------------------
Alex Hung (1):
      drm/amd/display: allow edp updates for virtual signal

Alvin Lee (1):
      drm/amd/display: Reduce SubVP + DRR stretch margin

Aurabindo Pillai (5):
      drm/amd/display: Fix hang when skipping modeset
      drm/amd/display: remove incorrect early return
      drm/amd/display: Fixes for dcn32_clk_mgr implementation
      drm/amd/display: Do not clear GPINT register when releasing DMUB from reset
      drm/amd/display: Update bounding box values for DCN321

Chong Li (1):
      drm/amdgpu: release gpu full access after "amdgpu_device_ip_late_init"

Cruise Hung (1):
      drm/amd/display: Reset OUTBOX0 r/w pointer on DMUB reset

Hamza Mahfooz (1):
      drm/amd/display: fix flickering caused by S/G mode

Hersen Wu (3):
      drm/amd/display: fix memleak in aconnector->timing_requested
      drm/amd/display: fix access hdcp_workqueue assert
      drm/amd/display: Return error code on DSC atomic check failure

Igor Kravchenko (1):
      drm/amd/display: Set min_width and min_height capability for DCN30

Jane Jian (1):
      drm/amdgpu/vcn: fix mmsch ctx table size

Jasdeep Dhillon (1):
      drm/amd/display: Isolate remaining FPU code in DCN32

Jingwen Zhu (1):
      drm/amd/display: Improvement for handling edp link training fails

Josip Pavic (1):
      drm/amd/display: copy dmub caps to dc on dcn31

Leo Chen (1):
      drm/amd/display: Lowering min Z8 residency time

Michael Mityushkin (1):
      drm/amd/display: Apply correct panel mode when reinitializing hardware

Rodrigo Siqueira (8):
      drm/amd/display: Update bouding box values for DCN32
      drm/amd/display: Add missing mclk update
      drm/amd/display: Adjust code identation and other minor details
      drm/amd/display: Set maximum VStartup if is DCN201
      drm/amd/display: Set dp_rate to dm_dp_rate_na by default
      drm/amd/display: Remove wrong assignment of DP link rate
      drm/amd/display: Use pointer in the memcpy
      drm/amd/display: Add missing WA and MCLK validation

Tianci Yin (1):
      drm/amd/display: Disable migration to ensure consistency of per-CPU variable

Tom Rix (2):
      drm/amd/pm: change pmfw_decoded_link_width, speed variables to globals
      drm/amd/display: set variable dccg314_init storage-class-specifier to static

Wesley Chalmers (2):
      drm/amd/display: Do not set drr on pipe commit
      drm/amd/display: Block optimize on consecutive FAMS enables

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  32 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  34 +++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   1 -
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  17 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     |   2 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   5 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   3 +
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  19 ++-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   9 ++
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |  25 ++-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   4 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |   2 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |  46 +++---
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   | 178 +++++++++++----------
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |  18 ++-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  17 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |   2 +
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |  24 +--
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   5 +
 .../display/dc/link/protocols/link_dp_training.c   |   5 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |   3 +-
 drivers/gpu/drm/amd/display/include/signal_types.h |   1 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   3 +
 31 files changed, 300 insertions(+), 172 deletions(-)
