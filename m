Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2F87EEC45
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 07:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF4810E11C;
	Fri, 17 Nov 2023 06:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE48410E111;
 Fri, 17 Nov 2023 06:35:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLQcHZv8loLz39gad6jHuabWN7rDyYIBpk2otsrw0l6oSgY1BmrZuxttsCdfyg82RBd5O5oJFZtbCMsTjem03IzLY2ua5KPlSsvx0tmeRGcUcJpMbPzW46FNxsz/uEMprAPsosLAoCQHmO42A7SjRqpKCeV2TBPNeTWZDVZaKi/kvzBfVsoBcrCG4o/ibGygnGEZsPORQC9FBhcxHCpt6a6u4Ii6orqD+XKbx25sQdft/UuYWVkrSNfZTIS3urWkyGDE42pJ9OUyyWtWGz22XErmIMlDfzYrPbHb7Vn7RP72AEl/gjTQ62eio5mcWf4NFScn08ghkHkxWRg06s8GWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utqT0GoXNtgkFsEOZh8Ot0x74ADAXtxSRE9lA+ye8uU=;
 b=br/x8f4fpsLh9T3QN0y8n5l3vkO8L7FDZqxCw6DXIlJwVpM06MbYsoiRkmKd42bPhN/YkFEqXTPsxs4vDaAP2zoLITvML4M4I8aQwjOF3IYU5XQ2jz+qxhzlIXBYw/oVb9At5taxbNM7NfGW4GpMTQoMFQlm5HCvdFxIisaR9x/uP43Wpw30pi31u0YlFOExmDcc24w9Lgami01stIYRAeE5Ssc6F7Uh2pzmZf36xK5Oyak/Fux8evfrfzy294J93blDqLhk23xHs6qP/y19G2ocPw8T6uek9l1o9tCjHpeYggSTtXx4uguQAmjv0tBtz5kEJRp/7EQUlUtvW0sc0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utqT0GoXNtgkFsEOZh8Ot0x74ADAXtxSRE9lA+ye8uU=;
 b=Yz6rLMpFq2FwQoELhi5zZ/gIbeg03NrzEVZoigSJRmfP3TqNmL3mJpM5b744FnlNrlmMvNJ8Bih1eSskclJ3eY4NIToO+moahHc7SIgC3ny8D1taT9L5lRRvBpSIsvWh3b07C0NErSX2S5TYyMlJmtZ+HQWU+pKUrez/QnLZIDU=
Received: from CY5PR04CA0019.namprd04.prod.outlook.com (2603:10b6:930:1e::22)
 by LV2PR12MB5751.namprd12.prod.outlook.com (2603:10b6:408:17d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 06:34:58 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:930:1e:cafe::4b) by CY5PR04CA0019.outlook.office365.com
 (2603:10b6:930:1e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 06:34:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Fri, 17 Nov 2023 06:34:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 00:34:56 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.7
Date: Fri, 17 Nov 2023 01:34:41 -0500
Message-ID: <20231117063441.4883-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|LV2PR12MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: 4afe0fda-dfcf-43c6-6cd9-08dbe7375161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I7M4YF9PsZTHfRdo7t174jZVbwElONsTu742wraLxq/oy0FKgWaO/0Fn5XI9gML81X5HzTnHo1r2BEGoxF1qY7E/mDPpn2HS+w/PYQvVkasQmxoki4kDRohQ8xR7l7oDItmtb4Brz7GsJM0TSptALbUyJp6zXNqO4EoGqFZmSTamDxej22XbP0/EbrZks2f0eE5h3ARg7JHrpPyEgoYndv6qrr8nGogH03F3iyqWRmu0Ymqfy9Rdf5BTzVSTp0tCJrV1RSDZT/roOqzCvPT/P4IvY75F480B3MYuDOXK3Qa60ELRG1FxenBGGUPVi4TZUJzG4Cbqf8K6OC+ZLjOgtn5cynDJwGyGU+YBPT8rCM6Pc577gmLExeiMCeLpw90QvBOzhvuocWxygDftXzPwzWiuUStub+3pbtbObrFqIdSmZU+OIdcXtlw6+jWGYxAoeSIVHn+txlox935MFKoQqudX+lqnlXawF5fmSziNkgGt8YuUoVNC9EgNhNDH2iMsQVYvCUaoDMOd4Sv7VvVJCnCLYhumKNLtwPBmLQXE9yrM8cY4zqAgIBfj8nqDs+r3WaAjnWS2YbC2nPnUMr10DVrj5Z7HNKbrIfxBkBlkXcuFquDZPnYaJYDHwaJAFFtcG8VJmCshdGvv5Mglhmu03tBheEKfayONLBUCecfMpOX0BI+rPKRt16M0+lFx8bcu7EZe8gMOy0CeN48z4FB4rF++m5vqpq18kagCvbCapUA/ljdB+FFHnT6DUx1X7LTJ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(82310400011)(64100799003)(186009)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(47076005)(16526019)(26005)(7696005)(82740400003)(4326008)(5660300002)(8676002)(36860700001)(8936002)(1076003)(2906002)(2616005)(40480700001)(110136005)(70586007)(6666004)(86362001)(70206006)(478600001)(40460700003)(316002)(966005)(36756003)(336012)(426003)(41300700001)(4001150100001)(83380400001)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 06:34:57.6676 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afe0fda-dfcf-43c6-6cd9-08dbe7375161
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5751
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

Hi Dave, Sima,

Fixes for 6.7.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.7-2023-11-17

for you to fetch changes up to e8c2d3e25b844ad8f7c8b269a7cfd65285329264:

  drm/amdgpu/gmc9: disable AGP aperture (2023-11-17 00:58:41 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.7-2023-11-17:

amdgpu:
- DMCUB fixes
- SR-IOV fix
- GMC9 fix
- Documentation fix
- DSC MST fix
- CS chunk parsing fix
- SMU13.0.6 fixes
- 8K tiled display fix
- Fix potential NULL pointer dereferences
- Cursor lag fix
- Backlight fix
- DCN s0ix fix
- XGMI fix
- DCN encoder disable logic fix
- AGP aperture fixes

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu/gmc11: fix logic typo in AGP check
      drm/amdgpu: add a module parameter to control the AGP aperture
      drm/amdgpu/gmc11: disable AGP aperture
      drm/amdgpu/gmc10: disable AGP aperture
      drm/amdgpu/gmc9: disable AGP aperture

Asad Kamal (2):
      drm/amd/pm: Update metric table for smu v13_0_6
      drm/amd/pm: Fill pcie error counters for gpu v1_4

Duncan Ma (1):
      drm/amd/display: Negate IPS allow and commit bits

Fangzhi Zuo (1):
      drm/amd/display: Fix DSC not Enabled on Direct MST Sink

José Pekkarinen (1):
      drm/amd/display: fix NULL dereference

Le Ma (1):
      drm/amdgpu: finalizing mem_partitions at the end of GMC v9 sw_fini

Lewis Huang (1):
      drm/amd/display: Change the DMCUB mailbox memory location from FB to inbox

Lijo Lazar (1):
      drm/amd/pm: Don't send unload message for reset

Mario Limonciello (1):
      drm/amd/display: fix a NULL pointer dereference in amdgpu_dm_i2c_xfer()

Muhammad Ahmed (1):
      drm/amd/display: Add null checks for 8K60 lightup

Nicholas Kazlauskas (1):
      drm/amd/display: Guard against invalid RPTR/WPTR being set

Nicholas Susanto (1):
      drm/amd/display: Fix encoder disable logic

Paul Hsieh (1):
      drm/amd/display: Clear dpcd_sink_ext_caps if not set

Shiwu Zhang (1):
      drm/amdgpu: add and populate the port num into xgmi topology info

Srinivasan Shanmugam (1):
      drm/amdgpu: Address member 'ring' not described in 'amdgpu_ vce, uvd_entity_init()'

Tianci Yin (1):
      drm/amd/display: Enable fast plane updates on DCN3.2 and above

Victor Lu (1):
      drm/amdgpu: Do not program VF copy regs in mmhub v1.8 under SRIOV (v2)

Yang Wang (1):
      drm/amdgpu: fix ras err_data null pointer issue in amdgpu_ras.c

YuanShang (1):
      drm/amdgpu: correct chunk_ptr to a pointer to chunk.

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 10 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  5 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  5 ++-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  7 +--
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |  6 +--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 24 ++++++-----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  5 +--
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 29 ++++++-------
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   | 18 ++++----
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  6 +--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  3 ++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       | 10 ++---
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  1 +
 .../display/dc/dcn35/dcn35_dio_stream_encoder.c    | 10 ++---
 .../gpu/drm/amd/display/dc/link/link_detection.c   |  3 ++
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        | 22 ++++++----
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    | 50 +++++++++++++++++-----
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    | 10 ++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 10 ++++-
 26 files changed, 160 insertions(+), 84 deletions(-)
