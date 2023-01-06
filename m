Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBF566096E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 23:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B3D10E2C7;
	Fri,  6 Jan 2023 22:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E7810E2C7;
 Fri,  6 Jan 2023 22:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfP2rf6zX195HfEAJoZ/2ubXqmuyFwR9RV/7k523AqN9cEk+1rIN29X7PdlvqPzrpmjDRlff9muaA/McCZwdNg2ZAdEWnA3kpTWPiijpFe3C5LeUxVMdhDWLBJTRNcLTn1qamBLmiJBBD2f5ky/QTfump3tiD6xBOlQFLJWz1YAsuE1a+6L10dya1l6lKZXZksIPjWMQu8ZO3zFDZonOCvr7cbJKG9+gWPcK5sSFegT2JZU07mzujquxOIvn++IfbGcWATSP59Cdop+7s5Mj54CnTTbVI3UiKvHYBPJCl4ttJI9wH9TmlOwz2j43GzikVbtIywVhssqqUbZZF2H5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2J/IZn5Ytj2pZY2JGusEJhh82UN7CERSqvQLFqbUqs=;
 b=WcJkof5fG5ITUouQj4ZsPThpimlD/RVyHfk8a8RF6cvBtknYzHOXOkCyMA+z9ab4wekeFi/z1T6A0NXVL6gfyK1DnYXJ9Ae5SY+HfZwS92J8w/Z2D9X6QV41wrNVBM5PlBL7u92Z164AsLD5F0ISyIl4EuZ0mEaQldZ3eWXVMU5uw11FmPjEeOkFwEk2VrRmTifYoWT6CSVArpQ/p7x/rwnO1WGE+o739vbPpNG7hwvoYGNDGIAg02dTsJBQQ9jJbgdv3/naiW4Q6d15Um5J1XKueNz1lEDj7ShrG5dnkPLKx2QK5Q4ndB2/r9uqNcdsknTjoGiF34/IyzgKlfzLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2J/IZn5Ytj2pZY2JGusEJhh82UN7CERSqvQLFqbUqs=;
 b=FAA2/2fElpkEeEpsLq2lgI12mAQt1Vlr0otKnCA6xrwexxUziSymHy562ihrfSZPFD3GdPtingF0mB7YU4WwU0T8mKs9QsgLYKwGHS7gc1LvBSBwIvVVcy2IHbHg0y5+euGZoEyajqhkfnHxnr2hXqGgtrRW4U8LLavmAs0zcjw=
Received: from BN9PR03CA0741.namprd03.prod.outlook.com (2603:10b6:408:110::26)
 by BN9PR12MB5324.namprd12.prod.outlook.com (2603:10b6:408:105::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 22:21:01 +0000
Received: from BL02EPF00010206.namprd05.prod.outlook.com
 (2603:10b6:408:110:cafe::c9) by BN9PR03CA0741.outlook.office365.com
 (2603:10b6:408:110::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 22:21:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010206.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.15 via Frontend Transport; Fri, 6 Jan 2023 22:21:00 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 6 Jan
 2023 16:20:59 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon, drm drm-next-6.3
Date: Fri, 6 Jan 2023 17:20:37 -0500
Message-ID: <20230106222037.7870-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010206:EE_|BN9PR12MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 09f1f673-6214-48bc-4b22-08daf0344ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ywCIyBOCStogtgik9LAwh8bOHd1ILYs8E+vfbG5jgqTrEnnTXBW+ptUrjhs2Z9N0loEIvI/+fXQ95osXxJ559dUxChzSP4GBon5wRwXJrjJgYPG/xXIdJ9Tv6+HEzDiRk7iASEdfsnrZ+RnABnZh+qQxG0z5mDJJbZm4bE6hGmJWI4QML/3jMFnujR/DyJXM2oV15Y0i2dxlbsDZcucOjpnYozGBlOJAzWDLNvu3idnpIZ6sNXvt55MqKux2wuE36uHJ+CVjPUS0xqvg0VtH1BuWE83WyY8ChWy+hpJUFwb1mkJ9jW4t6ui/BDkZofF9yzXdhWKSNu2spLOG6Al+e0eKJpzw8v7UkZQpQKgFSYhViOaX8phPl+7YOaTjiQ88Oz9xwjQHN7734VsIq2p5sLaZYHfcrGw6z3gA/Rj27hBI47k6U78oPL0iu81e41dYQdiNO2DA02LKwGYCw+LwVUfGWS/KMTq+5Nmu/rWdKt/PQwV2XYY2qrZ3F0JvmM2RGw4vx1pmTnfyPx5hN5nwMyN+QO2EJe2rwcdllUg7YL97+D4lIiIGCS1WQVK7z/e4cR9RHtyqnKw0UitQce0i2UlQ6yalVrsiQG9DF/Zm0va2YC18hfcc++H/PCCBHj9QjQeEJjVozrmgCW50uL/OaV2xFAdUOezad9x0O6GP9qLGZEVFMGw962cKEa0mDBke
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(40460700003)(8676002)(4326008)(5660300002)(70586007)(6666004)(70206006)(41300700001)(8936002)(966005)(316002)(4001150100001)(110136005)(2906002)(7696005)(478600001)(356005)(336012)(82740400003)(26005)(66574015)(47076005)(186003)(426003)(1076003)(2616005)(16526019)(40480700001)(30864003)(81166007)(36756003)(36860700001)(82310400005)(83380400001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 22:21:00.7910 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f1f673-6214-48bc-4b22-08daf0344ab0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5324
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

New stuff for 6.3.

The following changes since commit 7a18e089eff02f17eaee49fc18641f5d16a8284b:

  drm/amd/pm: update SMU13.0.0 reported maximum shader clock (2022-12-15 12:18:08 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.3-2023-01-06

for you to fetch changes up to f6e856e72ce51df1e0fe67aecb5f256fbd4190a6:

  drm/amdgpu: update ta_secureDisplay_if.h to v27.00.00.08 (2023-01-05 11:43:46 -0500)

----------------------------------------------------------------
amd-drm-next-6.3-2023-01-06:

amdgpu:
- secure display support for multiple displays
- DML optimizations
- DCN 3.2 updates
- PSR updates
- DP 2.1 updates
- SR-IOV RAS updates
- VCN RAS support
- SMU 13.x updates
- Switch 1 element arrays to flexible arrays
- Add RAS support for DF 4.3
- Stack size improvements
- S0ix rework
- Soft reset fix
- Allow 0 as a vram limit on APUs
- Display fixes
- Misc code cleanups
- Documentation fixes
- Handle profiling modes for SMU13.x

amdkfd:
- Error handling fixes
- PASID fixes

radeon:
- Switch 1 element arrays to flexible arrays

drm:
- Add DP adaptive sync DPCD definitions

UAPI:
- Add new INFO queries for peak and min sclk/mclk for profile modes on newer chips
  Proposed mesa patch: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/278

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: update ta_secureDisplay_if.h to v27.00.00.08

Alan Liu (3):
      drm/amd/display: Implement multiple secure display
      drm/amd/display: Fix when disabling secure_display
      drm/amd/display: Improvements in secure display

Alex Deucher (9):
      drm/amdgpu/gmc9: don't touch gfxhub registers during S0ix
      drm/amdgpu/gmc10: don't touch gfxhub registers during S0ix
      drm/amdgpu/gmc11: don't touch gfxhub registers during S0ix
      drm/amdgpu: don't mess with SDMA clock or powergating in S0ix
      drm/amdgpu: for S0ix, skip SDMA 5.x+ suspend/resume
      Revert "drm/amdgpu: disallow gfxoff until GC IP blocks complete s2idle resume"
      Revert "drm/amdgpu: force exit gfxoff on sdma resume for rmb s0ix"
      drm/amdgpu: skip MES for S0ix as well since it's part of GFX
      drm/amdkfd: simplify cases

Alexey Kodanev (1):
      drm/amd/display: drop unnecessary NULL checks in debugfs

Alvin Lee (4):
      drm/amd/display: Block subvp if center timing is in use
      drm/amd/display: Clear link res when merging a pipe split
      drm/amd/display: Block FPO / SubVP (DRR) on HDMI VRR configs
      drm/amd/display: Turn on phantom OTG before disabling phantom pipe

Aric Cyr (3):
      drm/amd/display: 3.2.216
      drm/amd/display: Reorder dc_state fields to optimize clearing the struct
      drm/amd/display: 3.2.217

Arnd Bergmann (2):
      drm/amd/display: fix duplicate assignments
      drm/amd/pm: avoid large variable on kernel stack

Aurabindo Pillai (1):
      drm/amd/display: set ignore msa parameter only if freesync is enabled

Bhawanpreet Lakha (1):
      drm/amd/display: Fix dsc mismatch of acquire and validation of dsc engine

Candice Li (2):
      drm/amdgpu: Add df v4_3 headers
      drm/amdgpu: Add poison mode query for df v4_3

Charlene Liu (1):
      Revert "drm/amd/display: correct static_screen_event_mask"

Christian König (4):
      drm/amdgpu: use VRAM|GTT for a bunch of kernel allocations
      drm/amdgpu: rename vram_scratch into mem_scratch
      drm/amdgpu: cleanup visible vram size handling
      drm/amdgpu: allow zero as vram limit

Dillon Varone (3):
      drm/amd/display: Add debug bit to disable unbounded requesting
      drm/amd/display: Reduce expected sdp bandwidth for dcn321
      drm/amd/display: run subvp validation with supported vlevel

Dmytro Laktyushkin (1):
      drm/amd/display: fix dc_get_edp_link_panel_inst to only consider links with panels

Evan Quan (11):
      drm/amd/pm: drop unused SMU v13 API
      drm/amd/pm: fulfill swsmu peak profiling mode shader/memory clock settings
      drm/amd/pm: fulfill powerplay peak profiling mode shader/memory clock settings
      drm/amdgpu: expose peak profiling mode shader/memory clocks
      drm/amdgpu: expose the minimum shader/memory clock frequency
      drm/amdgpu: bump minor version number for DEV_INFO and SENSOR IOCTLs update
      drm/amd/pm: add support for WINDOW3D profile mode on SMU13.0.0
      drm/amd/pm: bump SMU13.0.0 driver_if header to version 0x34
      drm/amd/pm: correct the fan speed retrieving in PWM for some SMU13 asics
      drm/amd/pm: correct the reference clock for fan speed(rpm) calculation
      drm/amd/pm: add the missing mapping for PPT feature on SMU13.0.0 and 13.0.7

Fangzhi Zuo (1):
      drm/amd/display: Demote Error Level When ODM Transition Supported

Hawking Zhang (1):
      drm/amdgpu: allow query error counters for specific IP block

Ian Chen (1):
      drm/amd/display: Revert Reduce delay when sink device not able to ACK 00340h write

Ilya Bakoulin (1):
      drm/amd/display: Speed up DML fast_validate path

Jiapeng Chong (1):
      drm/amd/display: Remove the unused function dmub_outbox_irq_info_funcs

Leo (Hanghong) Ma (1):
      drm/amd/display: Revert Scaler HCBlank issue workaround

Leo Chen (1):
      drm/amd/display: Adding braces to prepare for future changes to behavior of if block

Likun Gao (1):
      drm/amdgpu: adjust the sequence to check soft reset

Michel Dänzer (1):
      Revert "drm/amd/display: Enable Freesync Video Mode by default"

Mukul Joshi (1):
      drm/amdkfd: Fix kernel warning during topology setup

Mustapha Ghaddar (1):
      drm/amd/display: Add DPIA NOTIFICATION logic

Nicholas Kazlauskas (1):
      drm/amd/display: Defer DIG FIFO disable after VID stream enable

Paulo Miguel Almeida (1):
      drm/radeon: Replace 1-element arrays with flexible-array members

Philip Yang (2):
      drm/amdkfd: Fix kfd_process_device_init_vm error handling
      drm/amdkfd: Fix double release compute pasid

Praful Swarnakar (1):
      drm/amd/display: Remove redundant logs from DSC code

Randy Dunlap (1):
      drm/amd/display: fix dc/core/dc.c kernel-doc

Roman Li (2):
      drm/amd/display: Fix potential null-deref in dm_resume
      drm/amd/display: Clear MST topology if it fails to resume

Saleemkhan Jamadar (1):
      drm/amdgpu: enable VCN DPG for GC IP v11.0.4

Samson Tam (2):
      drm/amd/display: Check for PSR in no memory request case
      drm/amd/display: Uninitialized variables causing 4k60 UCLK to stay at DPM1 and not DPM0

Srinivasan Shanmugam (1):
      drm/amd/display: fix some coding style issues

Stanley.Yang (2):
      drm/amdgpu: correct umc poison mode set value
      drm/amdgpu: remove enable ras cmd call trace

Sung Joon Kim (1):
      drm/display: Add missing Adaptive Sync DPCD definitions

Swapnil Patel (1):
      drm/amd/display: patch cases with unknown plane state to prevent warning

Tao Zhou (7):
      drm/amdgpu: add RAS poison consumption handler for AI SRIOV
      drm/amdgpu: add RAS poison consumption handler for NV SRIOV
      drm/amdgpu: add RAS poison consumption handler for SRIOV
      drm/amdgpu: add VCN poison consumption handler for SRIOV
      drm/amdgpu: skip RAS error injection in SRIOV
      drm/amdgpu: update VCN/JPEG RAS setting
      drm/amdgpu: define RAS query poison mode function

Tim Huang (1):
      drm/amdgpu: skip mes self test after s0i3 resume for MES IP v11.0

Wen Yang (1):
      drm/amd/display: fix array-bounds errors in dc_stream_remove_writeback()

Wenjing Liu (5):
      drm/amd/display: use encoder type independent hwss instead of accessing enc directly
      drm/amd/display: add support for three new square pattern variants from DP2.1 specs
      drm/amd/display: move dccg programming from link hwss hpo dp to hwss
      drm/amd/display: update pixel rate div in enable stream
      drm/amd/display: allow hpo and dio encoder switching during dp retrain test

hersen wu (2):
      drm/amd/display: save restore hdcp state when display is unplugged from mst hub
      drm/amd/display: phase3 mst hdcp for multiple displays

xurui (1):
      drm/amdgpu: Retry DDC probing on DVI on failure if we got an HPD interrupt

 drivers/gpu/drm/amd/amdgpu/Makefile                |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  39 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  77 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 187 +++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.h  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |  44 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/df_v4_3.c               |  61 ++++
 drivers/gpu/drm/amd/amdgpu/df_v4_3.h               |  31 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  33 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  39 ++-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  16 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  39 ++-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  11 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c          |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |   6 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |   1 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   6 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |   1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   8 -
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   1 +
 drivers/gpu/drm/amd/amdgpu/ta_secureDisplay_if.h   |  24 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |  24 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  11 -
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  24 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 364 ++++++++++++++-------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   7 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  | 161 ++++-----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |  26 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 110 ++-----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h |  14 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  26 ++
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 106 +++---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   9 -
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |   1 -
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 137 ++++----
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  54 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   9 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   4 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |  15 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   3 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  13 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |   1 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  86 +++++
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   3 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   3 +-
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.c   |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |  40 ---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |   4 -
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |  29 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h  |   5 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |   6 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |   4 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  39 ++-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |   2 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |   1 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  16 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   1 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  25 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  37 ++-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   6 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |   2 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |   1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |  18 +-
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |   1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   9 +
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |   5 -
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |  37 ---
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   3 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  83 +++++
 .../gpu/drm/amd/display/dmub/src/dmub_srv_stat.c   |  21 ++
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |   5 +-
 .../drm/amd/display/include/link_service_types.h   |   7 +-
 .../drm/amd/include/asic_reg/df/df_4_3_offset.h    |  30 ++
 .../drm/amd/include/asic_reg/df/df_4_3_sh_mask.h   | 157 +++++++++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   2 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  10 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |  16 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  76 ++++-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |  16 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  31 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |  22 ++
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |  20 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |   2 +
 .../gpu/drm/amd/pm/powerplay/smumgr/smu10_smumgr.c |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   8 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  45 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  23 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  39 ++-
 drivers/gpu/drm/radeon/atombios.h                  |  10 +-
 include/drm/display/drm_dp.h                       |   6 +
 include/uapi/drm/amdgpu_drm.h                      |   6 +
 143 files changed, 2079 insertions(+), 1035 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/df_v4_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/df_v4_3.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/df/df_4_3_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/df/df_4_3_sh_mask.h
