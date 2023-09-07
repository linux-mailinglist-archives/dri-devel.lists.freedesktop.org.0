Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE2B796F47
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 05:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3BA10E752;
	Thu,  7 Sep 2023 03:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AF510E750;
 Thu,  7 Sep 2023 03:31:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T35wgflTM9bcuGO2CXkkWvVsMaJztCzcG5Ex1K+j4HWq4pLoVzcY2DT6c/9+esVLigWDvLeLf6DitkdBLOhQ4NFEqa0IXt037ItrXQqaGDRFnBG4K6UAXTO+AgT02yoT3BFh4PdUpNud050paERGcl9QFO66VhLuh8PzDm9skmlhgWsNaqxWABNQ9KgEFA/h6+qVgq9e7eQ55tBSd/sx/KbQB0Px8zWHVOz9wIl4aZJlhMixuJq4lfc3D/BizXB6mK1v9O9KT1t4sAau6omZodejTh1YpcfwtTV2+u/a8qmyNsj39LH+Je5i8sSHtAhSTsvoVTkdvMVlintn+BPZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzIE4mY6pYjpHszS5eLEDgPZvVb8G2DYmObnE5xB754=;
 b=f991iJmE861pwy5UIZTEROZIUuvXxcfEadA+Sn+3qbA5hB2Y3566T1D3zJOQ0CWWic2ufXhTr3mjmLvIPauex2RG7OZbua+KG6SMaibB0whM/x4vtWrMnLcqVCYxRUND18ZIPF2eg0fFSETfdBRe8t7Zkuhq3GHwFbt6AOlUVh02z5tMbE2x835DYrsdHFg4oa02D8Xi6KzXoe2PZCjBiFy3CLWE5IAtOWUAtN5Ygyo/wYErodDqQJlO9rygTcsUpnx6aNn8ksNKPrT6iq6P4JLAXpcCRUpSKDw4tJzyXg8hD4vZQp+3OsqQx46AutmMR9XuuKrlnBN7EE83AslWeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzIE4mY6pYjpHszS5eLEDgPZvVb8G2DYmObnE5xB754=;
 b=cwy/z7aMicL3VRZYiTwYiszVBZyLDclw7tNTWtvueZIDCKkfwDG05pquE1r/J1iDNOT0WAXJnHS7U5wbie7Lq1uZ6A3QFp+9t5uhDh0ZfMXL28k2QweK8zxxL33iFrlmxnwxqVBYNEvk2abw1v1GleBo7AUHdhWTwS2CBE8tQmk=
Received: from DM6PR07CA0061.namprd07.prod.outlook.com (2603:10b6:5:74::38) by
 SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.28; Thu, 7 Sep
 2023 03:31:04 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::58) by DM6PR07CA0061.outlook.office365.com
 (2603:10b6:5:74::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30 via Frontend
 Transport; Thu, 7 Sep 2023 03:31:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Thu, 7 Sep 2023 03:31:03 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Sep
 2023 22:31:02 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.6
Date: Wed, 6 Sep 2023 23:30:48 -0400
Message-ID: <20230907033049.7811-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: baa092b6-012d-4e31-64d2-08dbaf52dd73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RZleDL5Zs8ySJ0rYH4E/kECNLelbfdcYOGl0OBFoBJB/m/ikmnBIF/1sVXqCc/EdXapq+orrCFjhB5gLX7Y8js+EfDwbtJdlvIl/8ouB5KfzGWJ6ndk7tyWR5lHHxw35Lp7SCjweAs+ZOOn9xL8sAGx8UNmu9vwiiX9UrDNRpOm9aLF/RfZD1uAXu5DFhcjlDtlOL/8cUP/t8rLIQsluc+SQzK9r5lfOyRRZZe2rGuTFCv3T5We3Lwch/xWUUKO3RUt+lqqm1xfMUwmXiH0mN0XC0uusyZy9kMT7lDEEvII3SFfbS/r7kzf1SgJwhgay390McqiT07taLIxRuH8s+HPatCNOaL5QFrmEMaC/zqhq43r0f52yEYMFJ7f86p/4LsWSyjvUHYHfcNpa7XjWXS3ADQkS5rUOAA3XVIEh821WF+wGmN37GviK8qiEGCiTvckHgkmnTAUz0piMf0vKfbo7rPbSD4F8ASUt3NBdgYrs4loxS+XN4LFaoOUO5ewfIeVhQOaIh2SnSOxuoh3X2WBonkuUEODpgzukXgSUAvHZn6CdN8YbJTyvm9MRtdn8//dFSIaE/TrnwkcgVIZgZSopLVl1DQE7i1BKERx4ho368JteFyxnZD6FhCxCFtb7a8gTYgCWCfS34I/ta2oHoXQmPmBn5W5AKSVoXGUqqIK2uQFtIMcw9YOPYoIniKC28tbbQfXtXL4beKQWe4XTOFz4KQRCWPv3HaQhpeEtPjYo/P14En5KJrAI410XwaLd
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(186009)(82310400011)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(41300700001)(7696005)(81166007)(966005)(356005)(6666004)(82740400003)(2616005)(26005)(1076003)(16526019)(40460700003)(83380400001)(426003)(336012)(47076005)(66574015)(36860700001)(70586007)(110136005)(36756003)(316002)(2906002)(40480700001)(70206006)(86362001)(4326008)(5660300002)(8936002)(8676002)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 03:31:03.9625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baa092b6-012d-4e31-64d2-08dbaf52dd73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950
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

Fixes for 6.6.  Bigger than usual since this is ~3 weeks of fixes.

The following changes since commit 3698a75f5a98d0a6599e2878ab25d30a82dd836a:

  Merge tag 'drm-intel-next-fixes-2023-08-24' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-08-25 12:55:55 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.6-2023-09-06

for you to fetch changes up to fbe1a9e0c78134db7e7f48322ab7d6a0530f2ee2:

  drm/amdgpu: Restrict bootloader wait to SMUv13.0.6 (2023-09-06 22:11:51 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.6-2023-09-06:

amdgpu:
- Display replay fixes
- Fixes for headless boards
- Fix documentation breakage
- RAS fixes
- Handle newer IP discovery tables
- SMU 13.0.6 fixes
- SR-IOV fixes
- Display vstartup fixes
- NBIO 7.9 fixes
- Display scaling mode fixes
- Debugfs power reporting fix
- GC 9.4.3 fixes
- Dirty framebuffer fixes for fbcon
- eDP fixes
- DCN 3.1.5 fix
- Display ODM fixes
- GPU core dump fix
- Re-enable zops property now that IGT test is fixed
- Fix possible UAF in CS code
- Cursor degamma fix

amdkfd:
- HMM fixes
- Interrupt masking fix
- GFX11 MQD fixes

----------------------------------------------------------------
Alex Deucher (1):
      drm/amd/pm: fix debugfs pm_info output

Alex Sierra (2):
      drm/amdkfd: retry after EBUSY is returned from hmm_ranges_get_pages
      drm/amdkfd: use mask to get v9 interrupt sq data bits correctly

André Almeida (1):
      drm/amdgpu: Allocate coredump memory in a nonblocking way

Asad Kamal (3):
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amd/pm: Add critical temp for GC v9.4.3
      drm/amd/pm: Fix critical temp unit of SMU v13.0.6

Bhawanpreet Lakha (1):
      drm/amd/display: Enable Replay for static screen use cases

Bokun Zhang (1):
      drm/amdgpu/pm: Add notification for no DC support

Candice Li (1):
      drm/amdgpu: Only support RAS EEPROM on dGPU platform

Christian König (1):
      drm/amdgpu: fix amdgpu_cs_p1_user_fence

ChunTao Tso (1):
      drm/amd/display: set minimum of VBlank_nom

Fudong Wang (1):
      drm/amd/display: Add smu write msg id fail retry process

Gabe Teeger (1):
      drm/amd/display: Remove wait while locked

Hamza Mahfooz (7):
      drm/amd/display: fix mode scaling (RMX_.*)
      drm/amdgpu: register a dirty framebuffer callback for fbcon
      drm/amd/display: register edp_backlight_control() for DCN301
      Revert "Revert "drm/amd/display: Implement zpos property""
      Revert "drm/amd/display: Remove v_startup workaround for dcn3+"
      drm/amd/display: limit the v_startup workaround to ASICs older than DCN3.1
      drm/amd/display: prevent potential division by zero errors

Hawking Zhang (4):
      drm/amdgpu: Fix the return for gpu mode1_reset
      drm/amdgpu: Add umc_info v4_0 structure
      drm/amdgpu: Support query ecc cap for aqua_vanjaram
      drm/amdgpu: Free ras cmd input buffer properly

Horace Chen (1):
      drm/amdkfd: use correct method to get clock under SRIOV

Jay Cornwall (1):
      drm/amdkfd: Add missing gfx11 MQD manager callbacks

Le Ma (2):
      drm/amdgpu: update mall info v2 from discovery
      drm/amdgpu: update gc_info v2_1 from discovery

Lijo Lazar (6):
      Documentation/gpu: Update amdgpu documentation
      drm/amdgpu: Unset baco dummy mode on nbio v7.9
      drm/amdgpu: Add bootloader status check
      drm/amdgpu: Add bootloader wait for PSP v13
      drm/amdgpu: Add SMU v13.0.6 default reset methods
      drm/amdgpu: Restrict bootloader wait to SMUv13.0.6

Mangesh Gadre (2):
      drm/amdgpu: Remove SRAM clock gater override by driver
      drm/amdgpu: Updated TCP/UTCL1 programming

Melissa Wen (1):
      drm/amd/display: enable cursor degamma for DCN3+ DRM legacy gamma

Ovidiu Bunea (1):
      drm/amd/display: Roll back unit correction

Rajneesh Bhardwaj (1):
      drm/amdgpu: Hide xcp partition sysfs under SRIOV

Reza Amini (1):
      drm/amd/display: Correct unit conversion for vstartup

Samir Dhume (1):
      drm/amdgpu/jpeg - skip change of power-gating state for sriov

SungHuai Wang (1):
      drm/amd/display: fix static screen detection setting

Tao Zhou (1):
      drm/amdgpu: use read-modify-write mode for gfx v9_4_3 SQ setting

Wenjing Liu (3):
      Partially revert "drm/amd/display: update add plane to context logic with a new algorithm"
      drm/amd/display: update blank state on ODM changes
      drm/amd/display: always switch off ODM before committing more streams

YiPeng Chai (1):
      drm/amdgpu: Enable ras for mp0 v13_0_6 sriov

 Documentation/gpu/amdgpu/driver-misc.rst           |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |  18 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  18 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  30 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  15 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  26 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  11 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  15 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  26 ++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   6 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  18 ++++
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  40 ++++++-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  24 ++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   9 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  16 +++
 drivers/gpu/drm/amd/display/dc/Makefile            |   1 +
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |  20 +++-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  68 ++++++++----
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  47 ++------
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |  17 +++
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h |   2 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  | 118 ++++++++++++++++++++-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |  25 +----
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |  21 +++-
 .../drm/amd/display/modules/freesync/freesync.c    |   9 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   2 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |  18 ++++
 drivers/gpu/drm/amd/include/discovery.h            |  38 ++++++-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  11 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   5 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h   |   5 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   4 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |  16 ++-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   2 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  54 +++++++++-
 50 files changed, 632 insertions(+), 180 deletions(-)
