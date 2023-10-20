Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3EF7D168A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 21:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6013A10E5E2;
	Fri, 20 Oct 2023 19:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3107A10E5E0;
 Fri, 20 Oct 2023 19:51:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HD+n+1GHGFtkeexWLrgxjyTGn+A05w+6Zvzt8VPvze4lHi0frjW1/xEyL+sL/RhrWwjuoQWbtOdzJzaJ7SgVzcdQlpQJXvjCVO88iFAwQfboJkPYv5LeXVU9Mihtp588QIz/fGB+T6MC+cCrNPBXZaUmzU7Z1BCvP21xKb+CU7BIf0SG7Jg6hGJY4lZIBgCKMI4eAvv3XgxxJ67R31UyEdW4HAc9CJ6hUNO6vQ0Uev6RUiLGV4IqMzb5r7jSzbQa+W3hg2BKzpnkAwpQNVnP200WwV1SU/Tqngxy3BrfJ9YM2byr3Wf0UYIq0Mx/dkbnpB0oPSbPjAXSI+/RIHTojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKAf9j/w9jFu9Kmp5wtow6pkBgdKbtRdvBnRf66tAh8=;
 b=J5kNENkAnlMjBBV+X1GFgPiS+hYZRDPPjgXB6iKz7DSaVkmgvDg0QZqZN4BKzUwHhgjFjqRAyXkQ2EUDaovYK2kwFkMlElpPokfxZ+skGOiVsnrZ/Xz4doMDvhF6dvm472522MJMVn+84H7iV0AC8H20IYxFY+LYN+5aRCH6oRM4Me+gX49lfHeWAB0z77pqXBO+TssoPVZjN2hXDkecnhAe5RGWm6EiNMaCG1QNynU+bjKZ0m0lxnW2bv8nEyXSeTVRkHz/ZvLXrbPQ0Bv9FqaArxFQgXqz3o8Yy/SuwiK8tFHR45yP6h6wIdQg2WpSWFRN+6apybO/kghXvYu6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKAf9j/w9jFu9Kmp5wtow6pkBgdKbtRdvBnRf66tAh8=;
 b=X0Q3YMXkw1/SGe/tkHPWE79aZJs/eTvyFnRJdcXlOjtLKmeW+1Ny+7KZ22P6QG4xOhJ3EQHDNArxQ5XphYkoqQLB6TkgbckuSCI2QrN01Xh+zlFkZMocCjfOym0XTl+TFocRGXWDKOtVDvKFrc9msLE8u7sVsQqaqaZbk8jXJU0=
Received: from BL1PR13CA0030.namprd13.prod.outlook.com (2603:10b6:208:256::35)
 by SA3PR12MB7831.namprd12.prod.outlook.com (2603:10b6:806:311::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 19:50:58 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::41) by BL1PR13CA0030.outlook.office365.com
 (2603:10b6:208:256::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8 via Frontend
 Transport; Fri, 20 Oct 2023 19:50:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 20 Oct 2023 19:50:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 14:50:56 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-6.7
Date: Fri, 20 Oct 2023 15:50:42 -0400
Message-ID: <20231020195043.4937-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|SA3PR12MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 5949075d-e9fa-4e46-77af-08dbd1a5e0d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NFhK6Gp9wNJMaJPs2ttcWmFqFrm0JNLtpeTZ1QOTTfNtOPDmMCBpJZGgz2f9d1wmbXkfPEtoqRGaCD+Sv0ozWcd0Er/hJUI65HlRqTLQRC+nHuKdwkqAF248ghP75ePTJwokuzxLsKFzXxiMoYLwMZafs9sdRcaOjApC0RZvgC+w845slAlfkBF+xypJPHwnHtbnZ5d1dCvSEZSWPkfyI9Yw5tykPfojdi7vjr8qt1coJicAvr6G1UHeHvBnI+adauQF2TqHu5Vb0DuausqwU+sZaYXFiZE9GFzzMVNOpXNk9ZPLFsTDExa/ikEVcwtnvsNv2afM7NoNd618DENROeAYW5wxDYNwdC84MBH5YYk6AQdHgYeDaxD5mduSlvWztCJkwN3wQtXVG1mjlN/68YOJAXLW7RyX8PclultpIl4piwH4vYLK3LcCA5y+mD4NkNV2mNy3z8/mRySlP1v2FwdSwKNWv9FAAkKX2ri8dApf3eKqscLpoursKsWAlIsdg76kpDt/IfrCQEe6IOiuc2GcqoXetEW+w9ffPOHRyal0fmhJchnyLdX6v9B6DWp3Nxl0USGA+PU6TzSRQAdVoWbeYtrB63G2ucVI1uNFfqqJwYgcs1bIck9WbZwERYdqU3/wpLk3StYfQcsJiTYLaYYVfVWD1fs+K+12Onv2/WetwqRDc2KNlAdUTEgo8y7GvJwa0Q3drvsYDBRUVtJsFommagSqEIiitJhhdpCP34cVD5mgkS59AGVnhB8aYv9mTnAJT7xybOKAzkG6wTmEJR8mBEiIwwh9RA5ZWzUioCM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(230922051799003)(82310400011)(1800799009)(186009)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(70206006)(478600001)(110136005)(70586007)(966005)(6666004)(7696005)(316002)(5660300002)(40480700001)(36860700001)(47076005)(83380400001)(356005)(82740400003)(81166007)(2616005)(4001150100001)(1076003)(2906002)(40460700003)(36756003)(41300700001)(26005)(426003)(336012)(4326008)(8936002)(86362001)(8676002)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 19:50:57.3742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5949075d-e9fa-4e46-77af-08dbd1a5e0d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7831
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

More updates for 6.7.  Mostly bug fixes.

The following changes since commit 27442758e9b4e083bef3f164a1739475c01f3202:

  Merge tag 'amd-drm-next-6.7-2023-10-13' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-10-18 16:08:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.7-2023-10-20

for you to fetch changes up to 5b2c54e0d0ea09f7a3b500510731878326e1117e:

  drm/amd/display: Fix stack size issue on DML2 (2023-10-20 15:11:29 -0400)

----------------------------------------------------------------
amd-drm-next-6.7-2023-10-20:

amdgpu:
- SMU 13 updates
- UMSCH updates
- DC MPO fixes
- RAS updates
- MES 11 fixes
- Fix possible memory leaks in error pathes
- GC 11.5 fixes
- Kernel doc updates
- PSP updates
- APU IMU fixes
- Misc code cleanups
- SMU 11 fixes
- OD fix
- Frame size warning fixes
- SR-IOV fixes
- NBIO 7.11 updates
- NBIO 7.7 updates
- XGMI fixes
- devcoredump updates

amdkfd:
- Misc code cleanups
- SVM fixes

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu/pm: update SMU 13.0.0 PMFW version check
      drm/amdgpu/mes11: remove aggregated doorbell code
      drm/amdgpu: update to the latest GC 11.5 headers

Alex Sierra (1):
      drm/amdkfd: remap unaligned svm ranges that have split

André Almeida (3):
      drm/amdgpu: Encapsulate all device reset info
      drm/amdgpu: Move coredump code to amdgpu_reset file
      drm/amdgpu: Create version number for coredumps

Asad Kamal (2):
      drm/amdgpu : Add hive ras recovery check
      drm/amdgpu: update retry times for psp BL wait

Bas Nieuwenhuizen (1):
      drm/amd/pm: Handle non-terminated overdrive commands.

Bokun Zhang (4):
      drm/amd/amdgpu/vcn: Add RB decouple feature under SRIOV - P1
      drm/amd/amdgpu/vcn: Add RB decouple feature under SRIOV - P2
      drm/amd/amdgpu/vcn: Add RB decouple feature under SRIOV - P3
      drm/amd/amdgpu/vcn: Add RB decouple feature under SRIOV - P4

Candice Li (1):
      drm/amdgpu: Log UE corrected by replay as correctable error

Colin Ian King (1):
      drm/amd/display: Fix a handful of spelling mistakes in dml_print output

Felix Kuehling (2):
      drm/amdgpu: Fix possible null pointer dereference
      drm/amdgpu: Reserve fences for VM update

Hawking Zhang (2):
      drm/amdgpu: Enable software RAS in vcn v4_0_3
      drm/amdgpu: Add UVD_VCPU_INT_EN2 to dpg sram

Jesse Zhang (1):
      drm/amdkfd:remove unused code

Jiapeng Chong (2):
      drm/amdkfd: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting

Kunwu.Chan (1):
      drm/amd/pm: Fix a memory leak on an error path

Lang Yu (1):
      drm/amdgpu/umsch: add suspend and resume callback

Li Ma (2):
      drm/amdgpu: fix missing stuff in NBIO v7.11
      drm/amdgpu: add clockgating support for NBIO v7.7.1

Ma Jun (1):
      drm/amd/pm: Support for getting power1_cap_min value

Mangesh Gadre (1):
      Revert "drm/amdgpu: Program xcp_ctl registers as needed"

Mario Limonciello (4):
      drm/amd: Add missing kernel doc for prepare_suspend()
      drm/amd: Move microcode init step to early_init()
      drm/amd: Don't parse IMU ucode version if it won't be loaded
      drm/amd: Read IMU FW version from scratch register during hw_init

Nathan Chancellor (1):
      drm/amd/display: Respect CONFIG_FRAME_WARN=0 in DML2

Rodrigo Siqueira (2):
      drm/amd/display: Reduce stack size by splitting function
      drm/amd/display: Fix stack size issue on DML2

Shiwu Zhang (3):
      drm/amdgpu: update the xgmi ta interface header
      drm/amdgpu: prepare the output buffer for GET_PEER_LINKS command
      drm/amdgpu: support the port num info based on the capability flag

Stanley.Yang (4):
      drm/amdgpu: Workaround to skip kiq ring test during ras gpu recovery
      drm/amdgpu: Enable mca debug mode mode when ras enabled
      drm/amdgpu: Fix delete nodes that have been relesed
      drm/amdgpu: Enable RAS feature by default for APU

Stylon Wang (2):
      drm/amd/display: Add missing lines of code in dc.c
      drm/amd/display: Remove brackets in macro to conform to coding style

Tao Zhou (4):
      drm/amdgpu: define ras_reset_error_count function
      drm/amdgpu: replace reset_error_count with amdgpu_ras_reset_error_count
      drm/amdgpu: add set/get mca debug mode operations
      drm/amdgpu: drop status query/reset for GCEA 9.4.3 and MMEA 1.8

Yang Li (4):
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: Remove duplicated include in dce110_hwseq.c
      drm/amd/display: Remove unneeded semicolon
      drm/amd/display: Simplify bool conversion

Yang Wang (1):
      drm/amdgpu: fix typo for amdgpu ras error data print

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   96 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   21 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   49 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   75 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |   80 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |   16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  106 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   83 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   56 -
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |  143 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |   78 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    7 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |    7 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   83 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    2 +
 drivers/gpu/drm/amd/amdgpu/ta_xgmi_if.h            |   62 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |    7 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   71 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |    5 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  103 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    3 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    5 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |  154 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  144 +-
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |    2 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    | 3297 ++++++++++----------
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |    2 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |    2 -
 drivers/gpu/drm/amd/include/amd_shared.h           |    2 +
 .../amd/include/asic_reg/gc/gc_11_5_0_sh_mask.h    |   48 +
 .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |    6 +
 .../include/asic_reg/nbio/nbio_7_11_0_sh_mask.h    |   13 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   22 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   17 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   33 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   33 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   34 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   13 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   36 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   25 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   34 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |    2 +-
 60 files changed, 2613 insertions(+), 2621 deletions(-)
