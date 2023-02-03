Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0817668A527
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 23:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9946E10E92D;
	Fri,  3 Feb 2023 22:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C7810E08F;
 Fri,  3 Feb 2023 22:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmqAvcW/jdR8594gjn2KGUyUSQCgs4slhvl9vQCDYASFCbhmkd2VUQfgEgnQgfne3O00Due/RVJrqScVuYE93SVSup6Z70Y5OoFPAvdhwR5JhftWeNOu0WqzFrE3al6Xijjkxsm2XBv558QY5Vyx7T/Xw8LlC+6T3tIVfppXIocAi5Ot9OipL3M2B1XY3guFAta+Jhj76uwN3q50Bc99p3v8Nhq/ZS3v7CP/9Glr2JFkQulGrl/DCIv1zYLHhO7BmdJsYcyNw3K5udtx9/Wv64uSsb7iBBXecpCQUGWkPAlqct+YS1WlfSwxN+Isvns9gDBg1m2dk3mFxJRDxorQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYwD96zJPLYWsohqwlRQxqC0RLWqUCqQPxaKJivMmvo=;
 b=Z8xDwzE/z9Mx6rrXeeRfLEBfVirdZ/mqibIy5JtfUQCCqaXJL9MS+PxtAjsa18sB38F9Wt1qqjKipvDRgmjaqW3fPoB3BxxWxrKaNoUHfjnXhoHma2nLqSoVHq39Ya10J3FQMKFuLcJDgLr5JkDablBu6TqQiEtm6efNOsBTrJV4w1UsmLem43r0PWVV1qKPG2245+Zw+BUEprI2GtNZKzpGNl5lHxo36uvS28RIak77MjMy67+zHpzRQS/Q29wgQVvz/k1mp26GEbWuYUQIDHT5GK9cfxid4gPSOPL7uZKKLoZJwiFSEYGI1hRhbfJjzMwUhKWFMU6t9maEt95ZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYwD96zJPLYWsohqwlRQxqC0RLWqUCqQPxaKJivMmvo=;
 b=DqcagsmGTFALuTUfFCqt6bgD7GmcGbnTJXvrfBSi06wKzEqrLjx28BBUmjSIQEBnezonpmg17wdF4UaKgUgXyWVDYV/5AqFL/Nol0GeijXnUHA4yeRggU4wnykT/VcdZVoZet4IE998LAp+IOc2cfIWl4abf2TxOm2Cku4/vRhc=
Received: from BN9PR03CA0090.namprd03.prod.outlook.com (2603:10b6:408:fc::35)
 by BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 22:03:37 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::ae) by BN9PR03CA0090.outlook.office365.com
 (2603:10b6:408:fc::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31 via Frontend
 Transport; Fri, 3 Feb 2023 22:03:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.31 via Frontend Transport; Fri, 3 Feb 2023 22:03:37 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Feb
 2023 16:03:35 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-next-6.3
Date: Fri, 3 Feb 2023 17:03:16 -0500
Message-ID: <20230203220316.8580-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT040:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2d9617-393e-43ab-825d-08db0632805a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WdeKi3zebDDG6Zn85tRxt9weooVgJ6yeoeIBbo6kG74cMcfwkE2Hepb2SWWlnHOqeSCT144+rO3G6+6bOZs/2Fu3M9n9RMUHS0mplZ56YQCIHOhMLeQkqVkgC+4q3/ZekS8v94RpW2/efQHN2JlxsUAp8yFYMKSn3qiFD3bl7+TgUOVqB8Ln4rS9fyxxAEvvzSzq5CwwMg3opW+PbOWn4QtlwmAfrnx2PXzSAmfyCZZWJ2BP99yseyKuRhbGFYETO8OVuRgACYWoexN2tCoXmrSCAs1yGFtPdxBuDIoxEKRpM5WcwQE53VjXUWrjKrkt0dGg3/SsHvKPO3RZV+7QRQbYEGJ2fjVRV+jfIdkQFpqZPH2Jh+k2UhsHi79nG1zjo+SWbozwcft8CTdfOOSgTwCYaX9gvGTvNYuOJ3ygrdwR0GSiXqvfdk8G0UHMvKZcAtWGcz+dI04KvBtp54vzuPM5la37HKBGMPuiJ9jnyGgUpmv4asaj4NdT0pDAmzUu5H3jSdI90ZlcGTpGyx/dRIbWTfchaNxH0azZX2iupZSC4hC7XRdZjuHlkT/xXuoaxQ8Cl0GI+v2qIHocTYWZOmDBjWn5Ae/qJw0XhlOJb5H3IuHqIStusrhdk8x1nK8O2CSXprNV2yj3+CsxDOrqM33kx4hjhlrZGIFdAYRtiLqZ+L/WavIwd+Yk7JDIRQQ3
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199018)(46966006)(40470700004)(36840700001)(5660300002)(86362001)(336012)(41300700001)(8936002)(6666004)(1076003)(4326008)(47076005)(70586007)(66574015)(36860700001)(70206006)(8676002)(478600001)(16526019)(26005)(966005)(36756003)(186003)(110136005)(83380400001)(82310400005)(2616005)(2906002)(40460700003)(356005)(40480700001)(81166007)(7696005)(316002)(82740400003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 22:03:37.4135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2d9617-393e-43ab-825d-08db0632805a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572
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

More stuff for 6.3.  Mostly bug fixes.

The following changes since commit aebd8f0c6f8280ba35bc989f4a9ea47469d3589a:

  Merge v6.2-rc6 into drm-next (2023-01-31 12:23:23 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.3-2023-02-03

for you to fetch changes up to 69ed0c5d44d72051b13e65384e9d9354c45d5e14:

  Revert "drm/amd/display: disable S/G display on DCN 3.1.4" (2023-02-03 15:42:42 -0500)

----------------------------------------------------------------
amd-drm-next-6.3-2023-02-03:

amdgpu:
- PCI hotplug fixes
- Allow S0ix without BIOS support
- GC11 fixes
- DCN 3.2.x fixes
- Enable freesync over PCon
- DSC fix
- DCN 3.1.4 fixes
- NBIO 4.3 fix
- Misc code cleanups and spelling fixes
- Temporarily disable S/G on DCN 2.1 and 3.1.2/3
- Fix and re-enable S/G on DCN 3.1.4
- Re-enable the AGP aperture on GMC 11.x

----------------------------------------------------------------
Alex Deucher (6):
      drm/amd/display: Properly handle additional cases where DCN is not supported
      drm/amd/display: disable S/G display on DCN 2.1.0
      drm/amd/display: disable S/G display on DCN 3.1.2/3
      drm/amd/display: properly handling AGP aperture in vm setup
      Revert "Revert "drm/amdgpu/gmc11: enable AGP aperture""
      Revert "drm/amd/display: disable S/G display on DCN 3.1.4"

Aric Cyr (2):
      drm/amd/display: Revert "avoid disable otg when dig was disabled"
      drm/amd/display: 3.2.221

Daniel Miess (3):
      drm/amd/display: Correct bw_params population
      drm/amd/display: Add missing brackets in calculation
      drm/amd/display: Adjust downscaling limits for dcn314

Evan Quan (1):
      drm/amdgpu: enable HDP SD for gfx 11.0.3

Fangzhi Zuo (1):
      drm/amd/display: Add Debug Log for MST and PCON

George Shen (1):
      drm/amd/display: Unassign does_plane_fit_in_mall function from dcn3.2

Graham Sider (1):
      drm/amdgpu: update wave data type to 3 for gfx11

Guilherme G. Piccoli (1):
      drm/amd/display: Trivial swizzle-related code clean-ups

Hersen Wu (1):
      drm/amd/display: fix linux dp link lost handled only one time

Jonathan Neuschäfer (1):
      drm/amdgpu: Fix a typo ("boradcast")

Leon Huang (1):
      drm/amd/display: Fix only one ABM pipe enabled under ODM combined case

Mario Limonciello (2):
      drm/amd: Allow s0ix without BIOS support
      drm/amd: Fix initialization for nbio 4.3.0

Mustapha Ghaddar (1):
      drm/amd/display: Add Function declaration in dc_link

Nicholas Kazlauskas (2):
      drm/amd/display: Fix Z8 support configurations
      drm/amd/display: Reset DMUB mailbox SW state after HW reset

Samson Tam (1):
      drm/amd/display: fix MALL size hardcoded for DCN321

Sung Joon Kim (1):
      drm/amd/display: Enable Freesync over PCon

Tim Huang (1):
      drm/amd/pm: drop unneeded dpm features disablement for SMU 13.0.4/11

Tom Rix (2):
      drm/amd/display: reduce else-if to else in dcn10_blank_pixel_data()
      drm/amd/display: reduce else-if to else in dcn32_calculate_dlg_params()

Vitaly Prosyak (2):
      Revert "drm/amdgpu: TA unload messages are not actually sent to psp when amdgpu is uninstalled"
      drm/amdgpu: always sending PSP messages LOAD_ASD and UNLOAD_TA

Vladimir Stempen (1):
      drm/amd/display: fix FCLK pstate change underflow

Wenjing Liu (1):
      drm/amd/display: add rc_params_override option in dc_dsc_config

Yifan Zha (1):
      drm/amdgpu: Remove writing GRBM_GFX_CNTL in RLCG interface under SRIOV

Yiqing Yao (1):
      drm/amdgpu: Enable vclk dclk node for gc11.0.3

ye xingchen (1):
      drm/amdgpu/display: remove duplicate include header in files

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  16 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   2 -
 drivers/gpu/drm/amd/amdgpu/df_v1_7.c               |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |   7 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c          |   6 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 130 +++++++++++++++++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  67 ++++++-----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  45 ++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  12 ++
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |  31 +++--
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |  26 +----
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   1 -
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |  24 ++++
 drivers/gpu/drm/amd/display/dc/dc_link.h           |  30 +++++
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |  36 +++++-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   9 ++
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   8 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   6 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |   2 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   1 -
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   1 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |  14 +--
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   6 +-
 drivers/gpu/drm/amd/display/dc/dsc/dscc_types.h    |   5 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c   |  10 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |  24 ----
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |  12 ++
 .../drm/amd/display/include/ddc_service_types.h    |   1 +
 .../drm/amd/display/modules/inc/mod_info_packet.h  |   4 +-
 .../amd/display/modules/info_packet/info_packet.c  |   4 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  14 +++
 44 files changed, 435 insertions(+), 176 deletions(-)
