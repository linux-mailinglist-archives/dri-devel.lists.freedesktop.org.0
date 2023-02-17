Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFF069B630
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 00:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB95210E070;
	Fri, 17 Feb 2023 23:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393F710E070;
 Fri, 17 Feb 2023 23:09:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiUAPfHEo3TZMXz+09ZJJ4ekSzibVeaQzkNFxmJakbHISxH0YbV9DAvLrv1brJaEPpVNdIbcIl2CvQWaFvcSK5mRZtg1SKYU9H98Y3VSOxxHDjFiJkddcnQOuH36U57Pm0X+2AXThq8T/GnNJDHz9T5775YuSXnQg3nwpWtaV754Q0MPs7jWSmlFff/oY8rXWWFqb3Ii6PdWPHO0Y8cJSqQJfOJNGpIf+7ZDIsQfXP2LyYOyNZR5e2pXI177fFcFdXfs7knvLEmeNCRTmSdw0e+0apXzGY5wZS2gX/DHzuWD6H881pZyZ+/voDuwhDKLdsgHjKeH39x9dcqt1E2/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5klC3J1aKA2ec1mlKwNoE0AsDyDvl76BMVRTFNV84A=;
 b=gxrykyvDTo1G4IByUd1ESkQ4A1APLGuIKThrIvS2stEt4V4Mtt3j4ZvqLwLLkFYiZQQWSrZHl1tJHr46XHyYP807pMsybUZGZIXFCwgyMYOTMr7PbqxbzadND2996rGMXwnh3iBFOdjYUh9ytLTDW3IynqzgbGTtAubj4BVyu+hW9P8NN5Y7Nocui3TLFVu+XPUuETXskm7dc5yeVoDcGVNH6crdpCT8rYz4BTjcHfvHsHEPVCUwx94Jg2ULmgPS6TYxONLkK06v4AlCUUD/7qB3XEDjW3FgouhMFn5N8344ioCDdSOVuhYWvJSYp3yLhocogpkHYTJ08a4dsUH7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5klC3J1aKA2ec1mlKwNoE0AsDyDvl76BMVRTFNV84A=;
 b=mpBnAcGIrOyP56KWqNK021yCPxwiYG5Uog8I/H0Ru8MWhiJoVUPaia0FXNf2+sN4TFFzbuuN1mVdcFHLz6UqfiqsyADynMdEl8XLWYqoF1+Ww7YJuiwcsowdVAohE++G7x91UBQ3O+xyG4XWuC7sRu5XZRkZh/jDTG+7mtfFDsQ=
Received: from DM6PR17CA0014.namprd17.prod.outlook.com (2603:10b6:5:1b3::27)
 by DS7PR12MB6240.namprd12.prod.outlook.com (2603:10b6:8:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 23:09:50 +0000
Received: from DS1PEPF0000E640.namprd02.prod.outlook.com
 (2603:10b6:5:1b3:cafe::34) by DM6PR17CA0014.outlook.office365.com
 (2603:10b6:5:1b3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15 via Frontend
 Transport; Fri, 17 Feb 2023 23:09:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E640.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6134.14 via Frontend Transport; Fri, 17 Feb 2023 23:09:50 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 Feb
 2023 17:09:49 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-next-6.3
Date: Fri, 17 Feb 2023 18:09:30 -0500
Message-ID: <20230217230930.64821-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E640:EE_|DS7PR12MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: e12857c4-9e32-4d93-0d7c-08db113c1268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ig2ImpSTT+bEmcHrjWNwx/IGlsogSftkKM4eiXqwVcvQDwIKj44p8tDXAO+ACI2yA6txMC0/bObjYiyeFPd5qDhLutY44Hke9ZNP+FBaMIqkSvJx8zqsOXLCMBtlKtDSLWJ7/FkR8BZp4NS6G8npCYAELUEF/A9G8tU833gjmI/7PfA9JTXw/63LVtVFkkvC7d2Yx+R6uAJw8YsdmIUa/o62c81yNpz8ttOqWYUvfzm36wBeGP11sMoUr4ViqYjc5yHpI2rSJofA9VaT4mrqmtGjJTygWRkiw+0XaSTRLAgrmx6duG5weCJYhP+r2uhuerd+0tBtLpGakWycOY3Rca9mLXIdDaxgG1mY7Iw7XM81o+EjOORldyJxHufrFRj/sOTFs5qUDosysZeJx60SfTMUVxjka0sP9NTB+93ZrqD/YTPwv4XroAzuF3GXGhEotT4RAJKd0po5P8dt3U8HZ+AnYjZGx41Kliy7LCUncsmS18ovu/bNf830EyldjUBXNuhyIUJIKTOsYMzJj9lHOLdYh8dNb3wZycKNu1SwpuRyVi7nkSZIEj8Mlb10WM69sNRWxYvDyEwp5KYBe9VIelkMngXyTLN6HgsJbfqZkC7vWN7sjB7artTK9/ZTj7tMtnvrhMHA8/qTgEIMKr4F/ZGKMajdePLN16VFJm3kQh92U0OBPtAkpXx1SeI4Pv5e
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199018)(46966006)(40470700004)(36840700001)(356005)(36756003)(86362001)(81166007)(40460700003)(478600001)(70586007)(110136005)(316002)(70206006)(4326008)(8676002)(966005)(7696005)(6666004)(82310400005)(41300700001)(1076003)(2906002)(8936002)(36860700001)(40480700001)(5660300002)(30864003)(47076005)(16526019)(26005)(186003)(83380400001)(2616005)(426003)(82740400003)(336012)(66899018)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 23:09:50.6169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e12857c4-9e32-4d93-0d7c-08db113c1268
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E640.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240
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

Fixes for 6.3.  The big change here is the splitting of dc_link.c into
multiple smaller files.

The following changes since commit 69ed0c5d44d72051b13e65384e9d9354c45d5e14:

  Revert "drm/amd/display: disable S/G display on DCN 3.1.4" (2023-02-03 15:42:42 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.3-2023-02-17

for you to fetch changes up to 80c6d6804f31451848a3956a70c2bcb1f07cfcb0:

  drm/amd/display: disable SubVP + DRR to prevent underflow (2023-02-15 22:26:22 -0500)

----------------------------------------------------------------
amd-drm-next-6.3-2023-02-17:

amdgpu:
- GC 11 fixes
- Display fixes
- Backlight cleanup
- SMU13 fixes
- SMU7 regression fix
- GFX9 sw queues fix
- AGP fix for GMC 11
- W1 warning fixes
- S/G display fixes
- Misc spelling fixes
- Driver unload fix
- DCN 3.1.4 fixes
- Display code reorg fixes
- Rotation fixes

----------------------------------------------------------------
Alex Deucher (7):
      drm/amd/pm/smu7: move variables to where they are used
      drm/amdgpu/gmc11: fix system aperture set when AGP is enabled
      drm/amd/display: minor cleanup of vm_setup
      drm/amdgpu: add S/G display parameter
      Revert "drm/amd/display: disable S/G display on DCN 3.1.2/3"
      Revert "drm/amd/display: disable S/G display on DCN 2.1.0"
      Revert "drm/amd/display: disable S/G display on DCN 3.1.5"

Alvin Lee (2):
      drm/amd/display: Set max vratio for prefetch to 7.9 for YUV420 MPO
      drm/amd/display: Fix prefetch vratio check

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.153.0

Aric Cyr (2):
      drm/amd/display: 3.2.222
      drm/amd/display: Promote DAL to 3.2.223

Arnd Bergmann (2):
      drm/amdgpu: fix enum odm_combine_mode mismatch
      drm/amd/display: fix link_validation build failure

Arthur Grillo (6):
      drm/amd/display: Turn global functions into static
      drm/amd/display: Add function prototypes to headers
      drm/amd/amdgpu: Add function prototypes to headers
      drm/amd/display: Add previously missing includes
      drm/amd/display: Fix excess arguments on kernel-doc
      drm/amd/display: Make variables declaration inside ifdef guard

Aurabindo Pillai (3):
      drm/amd/display: Fix null pointer deref error on rotation
      drm/amd/display: fix k1 k2 divider programming for phantom streams
      drm/amd/display: disable SubVP + DRR to prevent underflow

Ayush Gupta (1):
      drm/amd/display: temporary fix for page faulting

Bhawanpreet Lakha (1):
      drm/amd/display: Add support for multiple overlay planes

Charlene Liu (1):
      drm/amd/display: add NULL pointer check

Colin Ian King (1):
      drm/amd/display: Fix spelling mistakes of function name in error message

Daniel Miess (1):
      Revert "drm/amd/display: Correct bw_params population"

Deepak R Varma (2):
      drm/amd/display: Remove duplicate/repeating expression
      drm/amd/display: Remove duplicate/repeating expressions

Evan Quan (3):
      drm/amd/pm: add SMU 13.0.7 missing GetPptLimit message mapping
      drm/amd/pm: bump SMU 13.0.0 driver_if header version
      drm/amd/pm: bump SMU 13.0.7 driver_if header version

Friedrich Vock (1):
      drm/amdgpu: Use the TGID for trace_amdgpu_vm_update_ptes

Guilherme G. Piccoli (1):
      drm/amdgpu/fence: Fix oops due to non-matching drm_sched init/fini

Hamza Mahfooz (2):
      drm/amd/display: fix read errors pertaining to dp_lttpr_status_show()
      drm/amd/display: don't call dc_interrupt_set() for disabled crtcs

Hans de Goede (1):
      drm/amd/display: Drop CONFIG_BACKLIGHT_CLASS_DEVICE ifdefs

Jack Xiao (1):
      drm/amd/amdgpu: fix warning during suspend

Jane Jian (1):
      drm/amdgpu/smu: skip pptable init under sriov

JesseZhang (1):
      amd/amdgpu: remove test ib on hw ring

Jiapeng Chong (2):
      drm/amd/display: Remove the unused variable ds_port
      drm/amd/display: Remove the unused variable pre_connection_type

Jingwen Zhu (1):
      drm/amd/display: avoid disable otg when dig was disabled

Jonathan Gray (2):
      drm/amd/display: avoid unaligned access warnings
      drm/amd/pm: avoid unaligned access warnings

Kenneth Feng (2):
      drm/amd/amdgpu: enable athub cg 11.0.3
      drm/amd/amdgpu: implement mode2 reset on smu_v13_0_10

Kent Russell (2):
      drm/amdgpu: Fix incorrect filenames in sysfs comments
      drm/amdgpu: Add unique_id support for GC 11.0.1/2

Leo (Hanghong) Ma (2):
      drm/amd/display: Add HDMI manufacturer OUI and device id read
      drm/amd/display: Fix FreeSync active bit issue

Leo Li (1):
      drm/amd/display: Fail atomic_check early on normalize_zpos error

Lijo Lazar (1):
      drm/amd/pm: Allocate dummy table only if needed

Ma Jun (1):
      drm/amdgpu: Fix the warning info when unload or remove amdgpu

Melissa Wen (7):
      drm/amd/display: fix cursor offset on rotation 180
      drm/amd/display: ident braces in dcn30_acquire_post_bldn_3dlut correctly
      drm/amd/display: clean code-style issues in dcn30_set_mpc_shaper_3dlut
      drm/amd/display: camel case cleanup in color_gamma file
      drm/amd/display: unset initial value for tf since it's never used
      drm/amd/display: remove unused func declaration from resource headers
      drm/amd/display: remove unused _calculate_degamma_curve function

Mustapha Ghaddar (1):
      drm/amd/display: upstream link_dp_dpia_bw.c

Nasir Osman (2):
      drm/amd/display: Remove stutter only configurations
      drm/amd/display: Disable unbounded request mode during rotation

Nicholas Kazlauskas (4):
      drm/amd/display: Move DCN314 DOMAIN power control to DMCUB
      drm/amd/display: Enable P-state validation checks for DCN314
      drm/amd/display: Update Z8 SR exit/enter latencies
      drm/amd/display: Disable HUBP/DPP PG on DCN314 for now

Qingqing Zhuo (1):
      Revert "drm/amd/display: enable DPG when disabling plane for phantom pipe"

Randy Dunlap (1):
      drm/amd/amdgpu: add complete header search path

Samson Tam (1):
      drm/amd/display: enable DPG when disabling plane for phantom pipe

Tom Chung (1):
      drm/amd/display: Fix video glitch while drag window in PSR-SU

Tom Rix (1):
      drm/amd/display: set should_disable_otg storage-class-specifier to static

Wenjing Liu (5):
      drm/amd/display: break down dc_link.c
      drm/amd/display: do not set RX back to SST mode for non 0 mst stream count
      drm/amd/display: Extract temp drm mst deallocation wa into its own function
      drm/amd/display: on dp link lost event toggle dpms for master pipe only
      drm/amd/display: move public dc link function implementation to dc_link_exports

Wesley Chalmers (2):
      drm/amd/display: Do not set DRR on pipe commit
      drm/amd/display: Do not commit pipe when updating DRR

Xiaogang Chen (1):
      drm/amdkfd: Prevent user space using both svm and kfd api to register same user buffer

Yang Li (2):
      drm/amd/display: Simplify bool conversion
      drm/amd/display: clean up some inconsistent indentings

Ye Xingchen (1):
      drm/amd/display: remove duplicate include header

Yifan Zha (1):
      drm/amdgpu: Revert programming GRBM_GFX_* in RLCG interface to support GFX9

 drivers/gpu/drm/amd/amdgpu/Makefile                |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    1 -
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |    8 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |    4 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c          |    4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   15 +-
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c          |  303 ++
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.h          |   32 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   14 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  122 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |    7 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   76 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   22 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |    1 +
 drivers/gpu/drm/amd/display/dc/Makefile            |    4 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |   31 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   26 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   37 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 4871 +-------------------
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |  103 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  219 +-
 drivers/gpu/drm/amd/display/dc/dc_ddc_types.h      |    3 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    2 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  136 +
 drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h     |   20 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |  125 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  109 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   12 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |    2 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   22 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |    3 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |    6 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   16 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c |    6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   42 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |    9 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h  |    2 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   18 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.h  |    3 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h    |    2 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |    8 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    2 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |    2 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |   24 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |    2 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |    2 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   61 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.h    |    4 +
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |    2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |    2 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h  |    2 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |    8 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |    1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |    2 +
 .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |    8 +-
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |   10 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |   12 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |    2 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |    4 +
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |    7 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |    4 +
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   36 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   21 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.h |    3 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   31 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |    5 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |    1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |    1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |    1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   27 -
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   48 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |    4 -
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |    2 +-
 drivers/gpu/drm/amd/display/dc/link/Makefile       |    9 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |   45 +-
 .../display/dc/link/accessories/link_dp_trace.c    |   10 +-
 .../display/dc/link/accessories/link_dp_trace.h    |    1 +
 .../amd/display/dc/link/accessories/link_fpga.c    |   95 +
 .../amd/display/dc/link/accessories/link_fpga.h    |   30 +
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |   16 +-
 .../amd/display/dc/link/hwss/link_hwss_hpo_dp.c    |    4 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   | 1323 ++++++
 .../gpu/drm/amd/display/dc/link/link_detection.h   |   30 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    | 2528 ++++++++++
 drivers/gpu/drm/amd/display/dc/link/link_dpms.h    |   40 +
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |  577 +++
 drivers/gpu/drm/amd/display/dc/link/link_factory.h |   29 +
 .../gpu/drm/amd/display/dc/link/link_resource.c    |  114 +
 .../gpu/drm/amd/display/dc/link/link_resource.h    |   31 +
 .../gpu/drm/amd/display/dc/link/link_validation.c  |  398 ++
 .../gpu/drm/amd/display/dc/link/link_validation.h  |   28 +
 .../display/dc/link/protocols/link_dp_capability.c |   74 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |    1 +
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |  413 ++
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |   29 -
 .../dc/link/protocols/link_dp_irq_handler.c        |   54 +-
 .../dc/link/protocols/link_dp_irq_handler.h        |    4 -
 .../amd/display/dc/link/protocols/link_dp_phy.c    |   94 +-
 .../amd/display/dc/link/protocols/link_dp_phy.h    |    8 +-
 .../display/dc/link/protocols/link_dp_training.c   |    3 +-
 .../dc/link/protocols/link_dp_training_dpia.c      |    3 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   27 +
 .../drm/amd/display/modules/color/color_gamma.c    |  140 +-
 .../drm/amd/display/modules/color/color_gamma.h    |    3 -
 .../drm/amd/display/modules/freesync/freesync.c    |   12 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |    1 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   18 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    2 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    1 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   14 +-
 .../gpu/drm/amd/pm/powerplay/inc/smu11_driver_if.h |    2 +
 .../gpu/drm/amd/pm/powerplay/inc/smu9_driver_if.h  |    2 +
 .../amd/pm/powerplay/inc/vega12/smu9_driver_if.h   |    2 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   23 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    2 +
 .../swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h   |    2 +
 .../pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h  |    2 +
 .../inc/pmfw_if/smu11_driver_if_sienna_cichlid.h   |    2 +
 .../swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h  |    2 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |    7 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h |   31 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h   |    1 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    6 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   33 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    1 +
 148 files changed, 7488 insertions(+), 5708 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/accessories/link_fpga.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/accessories/link_fpga.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_detection.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_detection.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dpms.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dpms.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_factory.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_factory.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_validation.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_validation.h
