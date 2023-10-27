Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C7E7DA198
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 22:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740C210EA37;
	Fri, 27 Oct 2023 20:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA23510EA37;
 Fri, 27 Oct 2023 20:04:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vyzwu3UuECCc1ALfH36Tm1KJAFwKU34UDwqd7y7xlOqx+rRY003aRkAGwVuIz1PwLZHhHCJ7bSHMSZucyuBIgViSLUFLtHsqteqd6z+YH/lXgrbX8jGRB8KTcqA26OkJwecXeWHX4B07WW7/gvEt1A6+u5ogk25ApI9WqM9jgtk7y2/xgc6w/GYGwZO2QYZZGcFMeKvOyYYTwdS3JfeYdcXiWJnoFUwLKpRIhAzsUGLmmS1brWbIox8KuANl5b3E6Z437JY9+N0/Xdvjo1U4Sl7al5ToonxIojTcq0MSXwUvyfVKsw+5ASjAN5he8kC1v13JTerKmlVaM9N+Vnbq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhEHfucRpKcA215R1tM7JYpwIAIBZJRpPjeHkHhnGzc=;
 b=CWQ+dKAVLRukElHAX56TLOeFDEpuSemp3gqfvvYFUecMAB6zfZs6Tiy6RX74O+oWUc2FAPUDOV9joqlJpobhulb6xsz7M4VVzE0EkQ6kgYeOQib+ZEMCOEW19dr0AsUCWHmUvekQTCcMo777R2MM/rBd0nARJqZCHUiQRwrkDA/49jZFzm8fq8rAL70u99F5mARq6BBKZFl0XBymp3taLlWJCd1Elte55B82qDFcREwGemMS81WBYrdnIIV0dILnqofVmdKBzRmXWrDMjkBMGtb+NHd0nt5ttHMEWnp5VdfmAh2S6871EbEFc/CuJ6miHf31nYVaMSzkvhyGsvgqRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhEHfucRpKcA215R1tM7JYpwIAIBZJRpPjeHkHhnGzc=;
 b=dqqL3nxyQUf7TOn3MBGozyfXy38wtCuoIKBCAcxD8e0IX1NliQDhEV73FIGDgfcT6kCmP72jLn484hOOi85j5xMF6YrhwhiAAeHrBr19NmDbDOYzNu4WfDE/bpqakY5PoOeePbGQWwmHnKtOFzQIOeZ1p4/cpyd/Cz4tufBETSg=
Received: from CH5PR03CA0009.namprd03.prod.outlook.com (2603:10b6:610:1f1::22)
 by PH7PR12MB6905.namprd12.prod.outlook.com (2603:10b6:510:1b7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Fri, 27 Oct
 2023 20:04:03 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:610:1f1:cafe::9d) by CH5PR03CA0009.outlook.office365.com
 (2603:10b6:610:1f1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24 via Frontend
 Transport; Fri, 27 Oct 2023 20:04:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Fri, 27 Oct 2023 20:04:02 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 27 Oct
 2023 15:04:01 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-6.7
Date: Fri, 27 Oct 2023 16:03:43 -0400
Message-ID: <20231027200343.57132-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|PH7PR12MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: fd038b1a-3860-4daf-1db9-08dbd727dd99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bvvY4DD4jCpkfVI5OE2dYk960d64QRuKG2i5HTOQIqMhVOuMvA/dKHxfR53cchvQBaRywc5RGuVQKxSD81rLQd9IpAEa/JhROKoiRtBBNBDucNV76CzGnfB1pguYH9zzZ+vZdqqpne8LY6KQUghAKMuHcxfjCoG2k0gTS1iN8jy/0Zt1eoPtrZYrrJOw7KoJPOqTHjPOSxBPY68UIcBRPtbLSL5iVk26PzZfLZ0atnxtOvPLIaFywLWa91tCO3oEY2qhKvwRMvX4c5Qpcbbu3E+BDmvCpx1yNjxW8M2+sAm5gBzLEPRM4k1oNXc+7F/V9x9qx4ZFszHaCSdESpmjy3U0toN7zcXMbRByQsmt+mr+11zzZur1H8v7Y+fRdlHPjDlT2eXo6RDdWjVnuZeKXOH9sUWWaIPlkszQejQZizj5m3ASRJqCGYY0dSmVe7kLZHkgaCtsA6hjygHZGDNolikp5vNjfqaIK9+wlk19BJ2wFswQmTjT6PRDJsmVL0cbDjyhfaY01dU6L8QkthmteJy/veWpJmtnXFDVmP94CCRSk3En9BOtcsbKh6jTdW+EGgNdowKMZuwkZvlcTEGIVWfaRF0GdMbP06v2Wz4EkIUshw6rOINlKPzgagqwUD/DS/5XD/o1H9sCyb8ZDLtXUdyRNwDqrM4+DVlt1V46d6sIuADV5hrnRr0t/wFBNdhtg2cCqkQoP43XNFaWQV+hFXwzQX5lEdTcgqtKuy79ZIF40pvNaFP6RUFR/hERp2IK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(82310400011)(1800799009)(46966006)(36840700001)(40470700004)(40480700001)(8936002)(40460700003)(8676002)(2906002)(41300700001)(30864003)(4326008)(4001150100001)(5660300002)(6666004)(81166007)(2616005)(7696005)(36756003)(26005)(1076003)(336012)(356005)(426003)(82740400003)(36860700001)(47076005)(70206006)(316002)(16526019)(70586007)(110136005)(86362001)(478600001)(83380400001)(966005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 20:04:02.3615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd038b1a-3860-4daf-1db9-08dbd727dd99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6905
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

The following changes since commit 5258dfd4a6adb5f45f046b0dd2e73c680f880d9d:

  usb: typec: altmodes/displayport: fixup drm internal api change vs new user. (2023-10-27 07:55:41 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.7-2023-10-27

for you to fetch changes up to dd3dd9829bf9a4ecd55482050745efdd9f7f97fc:

  drm/amdgpu: Remove unused variables from amdgpu_show_fdinfo (2023-10-27 14:23:01 -0400)

----------------------------------------------------------------
amd-drm-next-6.7-2023-10-27:

amdgpu:
- RAS fixes
- Seamless boot fixes
- NBIO 7.7 fix
- SMU 14.0 fixes
- GC 11.5 fixes
- DML2 fixes
- ASPM fixes
- VPE fixes
- Misc code cleanups
- SRIOV fixes
- Add some missing copyright notices
- DCN 3.5 fixes
- FAMS fixes
- Backlight fix
- S/G display fix
- fdinfo cleanups
- EXT_COHERENT fixes for APU and NUMA systems

amdkfd:
- Misc fixes
- Misc code cleanups
- SVM fixes

----------------------------------------------------------------
Agustin Gutierrez (1):
      drm/amd/display: Remove power sequencing check

Alex Hung (2):
      drm/amd/display: Revert "drm/amd/display: allow edp updates for virtual signal"
      drm/amd/display: Set emulated sink type to HDMI accordingly.

Alvin Lee (1):
      drm/amd/display: Update FAMS sequence for DCN30 & DCN32

Aric Cyr (1):
      drm/amd/display: 3.2.256

Aurabindo Pillai (1):
      drm/amd/display: add interface to query SubVP status

Candice Li (2):
      drm/amdgpu: Identify data parity error corrected in replay mode
      drm/amdgpu: Retrieve CE count from ce_count_lo_chip in EccInfo table

David Francis (1):
      drm/amdgpu: Add EXT_COHERENT support for APU and NUMA systems

Fangzhi Zuo (1):
      drm/amd/display: Fix MST Multi-Stream Not Lighting Up on dcn35

George Shen (1):
      drm/amd/display: Update SDP VSC colorimetry from DP test automation request

Hamza Mahfooz (1):
      drm/amd/display: fix S/G display enablement

Hugo Hu (1):
      drm/amd/display: reprogram det size while seamless boot

Ilya Bakoulin (1):
      drm/amd/display: Fix shaper using bad LUT params

Iswara Nagulendran (1):
      drm/amd/display: Read before writing Backlight Mode Set Register

James Zhu (1):
      drm/amdxcp: fix amdxcp unloads incompletely

Jesse Zhang (1):
      drm/amdkfd: Fix shift out-of-bounds issue

Jiadong Zhu (2):
      drm/amd/pm: drop unneeded dpm features disablement for SMU 14.0.0
      drm/amdgpu: add tmz support for GC IP v11.5.0

Kenneth Feng (1):
      drm/amd/amdgpu: avoid to disable gfxhub interrupt when driver is unloaded

Lang Yu (1):
      drm/amdgpu/vpe: correct queue stop programing

Li Ma (2):
      drm/amdgpu: modify if condition in nbio_v7_7.c
      drm/amd/amdgpu: fix the GPU power print error in pm info

Lijo Lazar (4):
      drm/amdgpu: Add API to get full IP version
      drm/amdgpu: Use discovery table's subrevision
      drm/amdgpu: Add a read to GFX v9.4.3 ring test
      drm/amdgpu: Use pcie domain of xcc acpi objects

Lin.Cao (2):
      drm/amdgpu remove restriction of sriov max_pfn on Vega10
      drm/amd: check num of link levels when update pcie param

Ma Jun (1):
      drm/amd/pm: Fix the return value in default case

Mario Limonciello (4):
      drm/amd: Disable ASPM for VI w/ all Intel systems
      drm/amd: Disable PP_PCIE_DPM_MASK when dynamic speed switching not supported
      drm/amd: Move AMD_IS_APU check for ASPM into top level function
      drm/amd: Explicitly disable ASPM when dynamic switching disabled

Michael Strauss (1):
      drm/amd/display: Disable SYMCLK32_SE RCO on DCN314

Mukul Joshi (1):
      drm/amdgpu: Fix typo in IP discovery parsing

Nicholas Kazlauskas (2):
      drm/amd/display: Revert "Improve x86 and dmub ips handshake"
      drm/amd/display: Fix IPS handshake for idle optimizations

Philip Yang (2):
      Revert "drm/amdkfd:remove unused code"
      Revert "drm/amdkfd: Use partial migrations in GPU page faults"

Qu Huang (1):
      drm/amdgpu: Fix a null pointer access when the smc_rreg pointer is NULL

Rob Clark (1):
      drm/amdgpu: Remove duplicate fdinfo fields

Rodrigo Siqueira (5):
      drm/amd/display: Set the DML2 attribute to false in all DCNs older than version 3.5
      drm/amd/display: Fix DMUB errors introduced by DML2
      drm/amd/display: Correct enum typo
      drm/amd/display: Add prefix to amdgpu crtc functions
      drm/amd/display: Add prefix for plane functions

Samson Tam (2):
      drm/amd/display: fix num_ways overflow error
      drm/amd/display: add null check for invalid opps

Srinivasan Shanmugam (1):
      drm/amdkfd: Address 'remap_list' not described in 'svm_range_add'

Stylon Wang (3):
      drm/amd/display: Add missing copyright notice in DMUB
      drm/amd/display: Fix copyright notice in DML2 code
      drm/amd/display: Fix copyright notice in DC code

Sung Joon Kim (2):
      drm/amd/display: Add a check for idle power optimization
      drm/amd/display: Fix HDMI framepack 3D test issue

Swapnil Patel (1):
      drm/amd/display: Reduce default backlight min from 5 nits to 1 nits

Tao Zhou (4):
      drm/amd/pm: record mca debug mode in RAS
      drm/amdgpu: enable RAS poison mode for APU
      drm/amdgpu: bypass RAS error reset in some conditions
      drm/amdgpu: get RAS poison status from DF v4_6_2

Umio Yasuno (1):
      drm/amdgpu: Remove unused variables from amdgpu_show_fdinfo

Wenjing Liu (2):
      drm/amd/display: add pipe resource management callbacks to DML2
      drm/amd/display: implement map dc pipe with callback in DML2

Yang Wang (2):
      drm/amdgpu: fix find ras error node error
      drm/amdgpu: refine ras error kernel log print

Yifan Zhang (1):
      drm/amd/pm: call smu_cmn_get_smc_version in is_mode1_reset_supported.

 drivers/gpu/drm/amd/amdgpu/Makefile                |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |   9 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 136 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |   2 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |   4 -
 drivers/gpu/drm/amd/amdgpu/df_v4_6_2.c             |  34 ++
 drivers/gpu/drm/amd/amdgpu/df_v4_6_2.h             |  31 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  40 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  10 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |   2 -
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   3 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   3 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |  32 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |  12 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   5 +-
 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c              |  18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           | 150 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 154 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   9 +-
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c        |   7 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   7 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  48 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   4 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 542 +++++++++++----------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  26 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  11 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   4 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  26 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   1 +
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |   1 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   1 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   3 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   1 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_dccg.h    |  18 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_init.c    |  18 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_init.h    |  18 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |  19 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.h    |  18 +
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |   2 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |  23 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   1 +
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   5 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   1 +
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   9 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   9 +-
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dpp.c   |   2 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dpp.h   |   2 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dsc.c   |   2 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dsc.h   |   2 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dwb.h   |   2 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_hubbub.c    |   2 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_hubbub.h    |   2 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.c  |   2 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.h  |   2 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_init.c  |   2 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_init.h  |   2 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_mmhubbub.c  |   2 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_mmhubbub.h  |   2 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_opp.c   |   2 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_opp.h   |   2 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c  |   2 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.h  |   2 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.c   |   2 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.h   |   2 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_resource.c  |   7 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_resource.h  |   2 +
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |   4 +-
 drivers/gpu/drm/amd/display/dc/dml2/cmntypes.h     |   2 +
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   2 +
 .../display/dc/dml2/display_mode_core_structs.h    |   2 +
 .../amd/display/dc/dml2/display_mode_lib_defines.h |   2 +
 .../drm/amd/display/dc/dml2/display_mode_util.c    |   2 +
 .../drm/amd/display/dc/dml2/display_mode_util.h    |   2 +
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    | 148 ++++++
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.h    |   2 +
 .../gpu/drm/amd/display/dc/dml2/dml2_dc_types.h    |   2 +
 .../drm/amd/display/dc/dml2/dml2_internal_types.h  |   2 +
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |   2 +
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.h    |   2 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c  |   2 +
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   4 +
 .../amd/display/dc/dml2/dml2_translation_helper.h  |   2 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |   2 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   2 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |  18 +
 drivers/gpu/drm/amd/display/dc/dml2/dml_assert.h   |   2 +
 .../gpu/drm/amd/display/dc/dml2/dml_depedencies.h  |   2 +
 drivers/gpu/drm/amd/display/dc/dml2/dml_logging.h  |   2 +
 drivers/gpu/drm/amd/display/dc/hdcp/Makefile       |   2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   6 +
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  21 +-
 .../drm/amd/display/dc/hwss/dcn303/dcn303_hwseq.c  |  19 +
 .../drm/amd/display/dc/hwss/dcn303/dcn303_hwseq.h  |  19 +
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |  11 +
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  39 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h    |   3 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  10 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |   2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   1 +
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |   2 +-
 .../amd/display/dc/irq/dcn303/irq_service_dcn303.c |  19 +
 .../amd/display/dc/irq/dcn303/irq_service_dcn303.h |  19 +
 drivers/gpu/drm/amd/display/dc/irq_types.h         |   6 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |   6 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   3 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  11 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.c |  19 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.h |  19 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   1 +
 drivers/gpu/drm/amd/display/include/signal_types.h |   1 -
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   7 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   5 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   1 +
 137 files changed, 1474 insertions(+), 698 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/df_v4_6_2.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/df_v4_6_2.h
