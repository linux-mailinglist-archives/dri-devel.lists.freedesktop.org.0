Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8025780AE5B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 21:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C181E10EB33;
	Fri,  8 Dec 2023 20:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC5F10EB33;
 Fri,  8 Dec 2023 20:56:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQBDbttfAFknIglnfvqdSV2D19iUu4ZpkDCbD0jtf59xg5q3VYfgHyyV488cai+RCX5NpiYUPWKiMTCxvcbZeTroOtGtj90PK1fYzGS3564Y9wJ0Vftfvi9sr9ef4EVvJ18eGH7xNr0l8qyuHFmhwXNBbF8aARAU+ZF2SpyKJg3pLTmrql/mm61NXJmwYcsjG1UYGVcQa3ma1ygOatIbVNxexdjcrp+KelDqekw63aa8hhZSwPwYXC18wmL3+6KS1H9E0l9O1gc4YaATneUAMStAVtq60sz5mPbSUBf8q7Z+Xb+fYX6h+pn55wp+HQjbDFSZa7hIOTZ5N/PtMrcg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdCcDfiyCQUgbOtx3bLB69Wnj4Sqg7qqFoWVKwdtYs4=;
 b=KXuzc/kB1ZICy/hovkfeXG00m05o52CaQosEkked8NHxMbBfFqXeF1px7cvx0rMl3PXJfcX4h4pdbqRhYBoR4Nk0WjqFkQS3d/uHbCg1J//SnMWT4z1Ul1ZR9cQb397lLsK662iAyss+U77D4muKZezHV7UqpCg264y6+O1M3+A7c8tZk/7IqJsk/sllOTiXwyp216VOvlDGZTX4N9AgDSgEVsMvV/HAzI5SJWkkRPC2NFSq5eQYxJVU6vpH9nY0fqT0bnNSRRJbErbYecpXwpzTo9Y262PyZlTTru7yVxizNFqraLNBhwkE/mheNZrNe4d+cYuLZ+kXV/NnDAdShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdCcDfiyCQUgbOtx3bLB69Wnj4Sqg7qqFoWVKwdtYs4=;
 b=5ESUrUdAGs4RMKAKsGrmopoK4KbOqMppVbYME+kqF6/BEgU+JcNmqSPq5l52+NlSRQ2eSJlfOUmn+b0oYqSzueH5ILMU67Bdgf0B75H9bRplN6Fp8RaqCRKur6CFM0YELjYunxXQ/IAECPzP3fKXBS68xZJkJaYB9Hwbl2RW6Qw=
Received: from DM6PR14CA0071.namprd14.prod.outlook.com (2603:10b6:5:18f::48)
 by PH8PR12MB6987.namprd12.prod.outlook.com (2603:10b6:510:1be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 20:56:29 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:18f:cafe::cb) by DM6PR14CA0071.outlook.office365.com
 (2603:10b6:5:18f::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.29 via Frontend
 Transport; Fri, 8 Dec 2023 20:56:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 20:56:29 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 8 Dec
 2023 14:56:27 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.8
Date: Fri, 8 Dec 2023 15:56:13 -0500
Message-ID: <20231208205613.4861-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|PH8PR12MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c8f0c0-6575-4567-7219-08dbf8302680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qBR4RwXzsNHFW+z38uCi3MeGeQxTkKqF4FVXIbjUl/js/Kk4ZTV/aVej9vVTsJcc/bS9Ojj8+plf4hclTktJecYuTcSGaTBz9TjiamLd48gblaUjGnZHULSYj1l9qe++GLnMru952UjaU2iqKLTgHcPAeBg93QOjkLlwz8fIygj5lxCQclZxbVQ2dzPFQHErkeeGRdSXonzCcNBSjWnVHFbEswgrHh6jpuFHuVsylliQNOwUKzsQGdw7ruM0xkVmei2mXMtiPmpBxQwb6PSaxjyuZZL4il9oob1E/I8sfGG46uVe/W/yY013QntT1i1tDQ+rl7qIWhgfnSFzSpKqwKR/LmQ1socvD0Wf44jMcqp+G87a6z8o4a5feBcT+NJHpWo/6gmtou88BEupQeDY3YXemkQino0DUh50FZRikDi68Y0lHZ7m8QJov3LEEuh+3gsiKZnlgUuFNfOkMAzKHpwuw6ea6RTiSfAwv7lqqgKAH4gwX7T/xLe5l5yRg2vdp7Gozu8NT4SZuH9XmIaEblH0LLPuMleq8kPwsghIN8rBfBiuktEaPk963d02duCvbcbZ4Z7xStKaft4YR/t5yOa0PYHkldGwqp66ubAnU8lTETXO1TsbDmd0Rm80n+lTelYpLphAJ8Us8uINawmOqYImhTkoEItpO8J8YfQ4t1wzQYfIHs5zDyopNj7Ydc02pGm61i+I5IGAXfV5f1oRDU+i/uGSD21BT/OlgeKcgj4VeRWNRuGkMfz/8evJNrfqnIqrUTASbezFrcH9nlSLg7pGJJUHOMymhI835BBriObrBMOiRBuL1BuSL/OU0Ex90N9uUhZZ7C2ULB7gqaAeaA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(230173577357003)(230922051799003)(230273577357003)(186009)(1800799012)(82310400011)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(41300700001)(336012)(2616005)(1076003)(426003)(16526019)(26005)(8936002)(47076005)(4326008)(8676002)(966005)(30864003)(5660300002)(316002)(478600001)(110136005)(70586007)(6666004)(83380400001)(7696005)(36860700001)(70206006)(356005)(2906002)(82740400003)(81166007)(86362001)(36756003)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:56:29.0346 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c8f0c0-6575-4567-7219-08dbf8302680
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6987
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

More updates for 6.8.

The following changes since commit 5edfd7d94b0310b74136b666551f1d23711ed445:

  Merge tag 'amd-drm-next-6.8-2023-12-01' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-12-05 12:11:41 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.8-2023-12-08

for you to fetch changes up to 47c4533543af4759b7668a06c1a2ce06cdc71173:

  drm/amdgpu: Enable event log on MES 11 (2023-12-07 17:43:28 -0500)

----------------------------------------------------------------
amd-drm-next-6.8-2023-12-08:

amdgpu:
- SR-IOV fixes
- DCN 3.5 updates
- Backlight fixes
- MST fixes
- DMCUB fixes
- DPIA fixes
- Display powergating updates
- Enable writeback connectors
- Misc code cleanups
- Add more register state debugging for aquavanjaram
- Suspend fix
- Clockgating fixes
- SMU 14 updates
- PSR fixes
- MES logging updates
- Misc fixes

amdkfd:
- SVM fix

radeon:
- Fix potential memory leaks in error paths

----------------------------------------------------------------
Alex Deucher (2):
      drm/amd/display: Increase frame warning limit with KASAN or KCSAN in dml
      drm/amdgpu: fix buffer funcs setting order on suspend

Alex Hung (12):
      drm/amd/display: Avoid virtual stream encoder if not explicitly requested
      drm/amd/display: Initialize writeback connector
      drm/amd/display: Check writeback connectors in create_validate_stream_for_sink
      drm/amd/display: Hande writeback request from userspace
      drm/amd/display: Add writeback enable/disable in dc
      drm/amd/display: Fix writeback_info never got updated
      drm/amd/display: Validate hw_points_num before using it
      drm/amd/display: Fix writeback_info is not removed
      drm/amd/display: Add writeback enable field (wb_enabled)
      drm/amd/display: Setup for mmhubbub3_warmup_mcif with big buffer
      drm/amd/display: Add new set_fc_enable to struct dwbc_funcs
      drm/amd/display: Disable DWB frame capture to emulate oneshot

Alvin Lee (2):
      drm/amd/display: Optimize fast validation cases
      drm/amd/display: Use channel_width = 2 for vram table 3.0

Aric Cyr (1):
      drm/amd/display: 3.2.263

Aurabindo Pillai (1):
      drm/amd: Add a DC debug mask for DML2

Bokun Zhang (2):
      drm/amd/amdgpu: Move vcn4 fw_shared init to a single function
      drm/amd/amdgpu: SRIOV full reset issue with VCN

Charlene Liu (4):
      drm/amd/display: initialize all the dpm level's stutter latency
      drm/amd/display: insert drv-pmfw log + rollback to new context
      drm/amd/display: revert removing otg toggle w/a back when no active display
      drm/amd/display: keep domain24 power on if eDP not exist

Chris Park (1):
      drm/amd/display: Update BIOS FW info table revision

Daniel Miess (1):
      drm/amd/display: Add missing dcn35 RCO registers

Dennis Chan (1):
      drm/amd/display: Fix Replay Desync Error IRQ handler

Dillon Varone (1):
      drm/amd/display: Add dml2 copy functions

Dmitrii Galantsev (1):
      drm/amd/pm: fix pp_*clk_od typo

George Shen (1):
      drm/amd/display: Skip DPIA-specific DP LL automation flag for non-DPIA links

Hamza Mahfooz (1):
      drm/amd/display: fix hw rotated modes when PSR-SU is enabled

Harry Wentland (7):
      drm/amd/display: Skip entire amdgpu_dm build if !CONFIG_DRM_AMD_DC
      drm/amd/display: Create one virtual connector in DC
      drm/amd/display: Skip writeback connector when we get amdgpu_dm_connector
      drm/amd/display: Return drm_connector from find_first_crtc_matching_connector
      drm/amd/display: Use drm_connector in create_stream_for_sink
      drm/amd/display: Create amdgpu_dm_wb_connector
      drm/amd/display: Create fake sink and stream for writeback connector

Hawking Zhang (1):
      drm/amdgpu: Update fw version for boot time error query

Ilya Bakoulin (1):
      drm/amd/display: Fix MST PBN/X.Y value calculations

Ivan Lipski (1):
      drm/amd/display: Add monitor patch for specific eDP

Jiadong Zhu (1):
      drm/amdgpu: disable MCBP by default

Johnson Chen (1):
      drm/amd/display: Fix null pointer

Josip Pavic (1):
      drm/amd/display: Increase scratch buffer size

Krunoslav Kovac (1):
      drm/amd/display: Change dither policy for 10bpc to round

Lewis Huang (1):
      drm/amd/display: Pass pwrseq inst for backlight and ABM

Li Ma (1):
      drm/amd/swsmu: update smu v14_0_0 driver if version and metrics table

Lijo Lazar (6):
      drm/amdgpu: Read aquavanjaram WAFL register state
      drm/amdgpu: Read aquavanjaram USR register state
      drm/amdgpu: Restrict extended wait to PSP v13.0.6
      drm/amdgpu: Add NULL checks for function pointers
      drm/amdgpu: Update HDP 4.4.2 clock gating flags
      drm/amdgpu: Avoid querying DRM MGCG status

Mario Limonciello (1):
      drm/amd/display: Restore guard against default backlight value < 1 nit

Michael Strauss (1):
      drm/amd/display: Only enumerate top local sink as DP2 output

Nicholas Kazlauskas (1):
      drm/amd/display: Pass debug watermarks through to DCN35 DML2

Nicholas Susanto (1):
      drm/amd/display: Fix disable_otg_wa logic

Relja Vojvodic (2):
      drm/amd/display: Add ODM check during pipe split/merge validation
      drm/amd/display: Added delay to DPM log

Rodrigo Siqueira (2):
      drm/amd/display: Adjust code style
      drm/amd/display: Update code comment to be more accurate

Roman Li (1):
      drm/amd/display: Fix array-index-out-of-bounds in dml2

Tom St Denis (1):
      drm/amd/amdgpu: Add SMUIO headers for 10.0.2

Wenjing Liu (1):
      drm/amd/display: add support for DTO genarated dscclk

Xiaogang Chen (1):
      drm/amdkfd: Use partial migrations/mapping for GPU/CPU page faults in SVM

Yang Wang (2):
      drm/amd/pm: support new mca smu error code decoding
      drm/amdgpu: optimize the printing order of error data

Yang Yingliang (1):
      drm/radeon: check the alloc_workqueue return value in radeon_crtc_init()

Yihan Zhu (1):
      drm/amd/display: add MPC MCM 1D LUT clock gating programming

Zhipeng Lu (2):
      drm/radeon/dpm: fix a memleak in sumo_parse_power_table
      drm/radeon/trinity_dpm: fix a memleak in trinity_parse_power_table

shaoyunl (2):
      drm/amdgpu: SW part of MES event log enablement
      drm/amdgpu: Enable event log on MES 11

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h        |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  61 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  17 +
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         | 203 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |   5 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  12 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  15 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  48 +--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           | 146 +++++----
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 176 +++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   9 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |  14 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 359 +++++++++++++++++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  10 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |   3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   6 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  22 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 215 ++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.h   |  36 +++
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  76 ++---
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |  12 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.h   |   2 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  26 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  25 +-
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |  43 ++-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  18 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  80 ++++-
 drivers/gpu/drm/amd/display/dc/dc.h                |  10 +-
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   1 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   4 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |   8 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |   7 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.h  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |  32 ++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |  12 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c   |  23 ++
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h   |   2 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c    |   3 +
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |   3 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  26 ++
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c  |  62 +++-
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.h  |  51 +++
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   4 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |  29 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   3 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  19 ++
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   6 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |  11 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |  29 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   4 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  16 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   3 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |  36 ++-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   4 +
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |   3 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  25 ++
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  22 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/abm.h        |   3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h        |   4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/panel_cntl.h |   2 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  40 ++-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |  59 ++--
 .../dc/link/protocols/link_dp_irq_handler.c        |  18 +-
 .../dc/link/protocols/link_dp_training_dpia.c      |   4 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   4 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |   5 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |   2 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |   2 +
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   2 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  14 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   2 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   1 +
 .../include/asic_reg/smuio/smuio_10_0_2_offset.h   | 102 ++++++
 .../include/asic_reg/smuio/smuio_10_0_2_sh_mask.h  | 184 +++++++++++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  17 +
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |   1 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  10 +
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h |  77 +++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   9 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  46 ++-
 drivers/gpu/drm/radeon/radeon_display.c            |   7 +-
 drivers/gpu/drm/radeon/sumo_dpm.c                  |   4 +-
 drivers/gpu/drm/radeon/trinity_dpm.c               |   4 +-
 97 files changed, 2299 insertions(+), 477 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_10_0_2_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_10_0_2_sh_mask.h
