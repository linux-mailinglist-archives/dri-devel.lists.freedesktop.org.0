Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD53C815034
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 20:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0120610E0E6;
	Fri, 15 Dec 2023 19:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08E810E0E6;
 Fri, 15 Dec 2023 19:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hzj5rjICOm7pDW/IxA9y4KcMXGbzCgAXOPea8lcve7Boz0493aNIMGHIpGmlcID7vtT3xmziC01dz4vhusyaYEH258uC5WFAX2seR2AaCOJoXYlBuWft6mxqD/y+tF9wrKwqMLGxlBVi0ZJFE3nBMQD6Uvwbn4UJHGThInHgQsnUQeWzRIKEP4deIaNOI/7YcQ4FKnT6TSWr4JJ2c5GnATsSIM8aBXlbAhTHx+PwXxY/y2a/r21RqCCJJ3f4amDLEnRcAb2ApqSo0l9RqnYnXUN1sI/OcjhC6Z5Ldg+QMSF4vYxWedR/FpY/M424WZ3zpdZ/MZiQtvMfCgLAkv/OuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1u5WeAEbKfeElJSyU91BM76f4I1awNtjPR7teeqdhS8=;
 b=NphslxlZoazn/vOGUIaU7XFLyXKv8azwptUPgYbJPOPfm0SAoIL9Ig8vOMqYb1jtUdHwam9zo1oYI9RrEwzU/J859xEv7l40YC9a1rHLGltS4jGilE6JPkcgJnzrrsI3V9ZVE9Ssc92tU9g6v1SKSFsPzqHAuX3qCTDb3PDPA6CdjpoAMyTK/LQA91oS/gO/+tH+KX+ZawitoIOPGqmhSildAxXr3OfvtnJ+zsZrK8iE5atYUgxy/igiuBNWaiOgCSf2KzrPYqT9Asp6O0Asm3GrEBxLIY+II2LkYwE5dNcARl8IFoxi+FUzIv+Duaye36p/cMXUjkLgUSGeFhdGvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1u5WeAEbKfeElJSyU91BM76f4I1awNtjPR7teeqdhS8=;
 b=iQx2eIxQJTEMKHbhiRlyqVne/3839k+IcHRRyBKS/pXJ36KsBCPcEcsJ85lvMgaAvSveFf+qJZ40t3JRDlUGZm6rKg2HC8JaWC2OFtVNiVVR3A7CuxdceFdH1YYKXcnfllpLrpipX1kbHLzGbbEvydXGUj2kF4VLMSAk4J+psu4=
Received: from PH8PR22CA0008.namprd22.prod.outlook.com (2603:10b6:510:2d1::20)
 by CH0PR12MB8507.namprd12.prod.outlook.com (2603:10b6:610:189::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 19:35:56 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::5f) by PH8PR22CA0008.outlook.office365.com
 (2603:10b6:510:2d1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31 via Frontend
 Transport; Fri, 15 Dec 2023 19:35:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Fri, 15 Dec 2023 19:35:55 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 15 Dec
 2023 13:35:36 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon, drm drm-next-6.8
Date: Fri, 15 Dec 2023 14:35:18 -0500
Message-ID: <20231215193519.5040-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|CH0PR12MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: b02a5eb2-9347-4ee8-2e5d-08dbfda50e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Z0DBYs76BgyhtwaN38AbgXH4eU/bFKKtQESpCrHe5QWIeG140V82/MdKl5KOhob8s6EahGMhdjJessT1IzdNWkROBi0DrDV7y2vWrJ+zNgR26nUqGpwJ0gtehE/DG3t3xYp68FLkmDkmQyP6avnjhFFCJxnIhUMr1Ey94fZTDlHzyVtsNxE4EKPvagOrHQB1fOcsgJRsN+HRpOyXCABVgSWacOCCgZJLPShgixTynqW0gderFCfPXtYDNoOdarUvluWYdDhRjHFNi0TZhteyZ7snJgpGLVKdzVPquhcaWT+VrrbQBhvEfC34vaM/TrQiBsb3dc6A8qDTzItobGy8gc80zejP2bkkY4XAOnNvx3duN1Y4FfW2SyuWSFEVrWyZx9dBUNxKwkC7XgVFdj1JZFHzxFrKxAq9w5K9t7NAPR2XypfKx1Nap2nvWwcDhlPZB474x/CdOJIS4lK8lTXav3JVXOemg0kWquQjSAi+PwyRuc/fP9wJL8tUtr5vb21SLPGiSjpyf7t/b08q1ZHn8Hs3NHAs+fmECB6ioD8rkxiC1i5ijG09c29aZpH5SOV3R+7H7EMs+um2poMSfQmmUvj5LSbHsQjSHSKtx8KCYh80CTih+ylFmq4nqvkbnuXgY4no3YtPw8SaBOoiQcAaOeiiS8V+gDCD8BlE3aLatVc0knZthW5wgYVyVFv2UzjWKRg40VmDStV7fljLouuZg1C4nEqzMeZlLcWwMlgWcjI0xhqKc7ZidKehaZax5ajxzDl1VPMDhhK/+T8ZymJA1Q06OTCjE3yTw8CJs2o8Z0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(16526019)(26005)(426003)(336012)(66574015)(7696005)(2616005)(1076003)(82740400003)(356005)(36756003)(86362001)(81166007)(47076005)(83380400001)(4326008)(5660300002)(36860700001)(6666004)(70586007)(316002)(70206006)(110136005)(8676002)(8936002)(2906002)(4001150100001)(30864003)(41300700001)(478600001)(966005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 19:35:55.8102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b02a5eb2-9347-4ee8-2e5d-08dbfda50e91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8507
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

More stuff for 6.8.  The big ones here are a merge of an immutable platform-x86
branch for the WBRF RF interference stuff and the AMD color API (currently
disabled behind an ifdef in the driver).  The platform-x86 changes are the
baseline dependency for the GPU and wifi changes.  The AMD color changes
have some dependencies on some minor changes in the drm core which are
included.

The following changes since commit a0a28956b46ec7f16ce5d762ac5a124bb532da0d:

  Merge tag 'amd-drm-next-6.8-2023-12-08' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-12-13 15:55:55 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.8-2023-12-15

for you to fetch changes up to 669080888691c312cc926322a7b24600121c90fb:

  drm/amd/display: Revert " drm/amd/display: Use channel_width = 2 for vram table 3.0" (2023-12-15 12:17:19 -0500)

----------------------------------------------------------------
amd-drm-next-6.8-2023-12-15:

amdgpu:
- Suspend fixes
- Misc code cleanups
- JPEG fix
- Add AMD specific color management (protected by AMD_PRIVATE_COLOR)
- UHBR13.5 cable fixes
- Misc display fixes
- Display WB fixes
- PSR fixes
- XGMI fix
- ACPI WBRF support for handling potential RF interference from GPU clocks
- Enable tunneling on high priority compute queues
- drm_edid.h include cleanup
- VPE DPM support
- SMU 13 fixes
- Fix possible double frees in error paths
- Misc fixes

amdkfd:
- Support import and export of dma-bufs using GEM handles
- MES shader debugger fixes
- SVM fixes

radeon:
- drm_edid.h include cleanup
- Misc code cleanups
- Fix possible memory leak in error path

drm:
- Increase max objects to accomodate new color props
- Make replace_property_blob_from_id a DRM helper
- Track color management changes per plane

platform-x86:
- Merge immutable branch from Hans for platform dependencies for WBRF to coordinate
  merge of WBRF feature across wifi, platform, and GPU

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu: fix buffer funcs setting order on suspend harder
      Merge tag 'platform-drivers-x86-amd-wbrf-v6.8-1' into amd-drm-next
      drm/amdgpu/sdma5.2: add begin/end_use ring callbacks
      drm/amdgpu/debugfs: fix error code when smc register accessors are NULL
      drm/amd/display: fix documentation for amdgpu_dm_verify_lut3d_size()

Allen (1):
      drm/amd/display: Disable OPTC pg to match DC Hubp/dpp pg

Alvin Lee (3):
      drm/amd/display: For prefetch mode > 0, extend prefetch if possible
      drm/amd/display: Force p-state disallow if leaving no plane config
      drm/amd/display: Revert " drm/amd/display: Use channel_width = 2 for vram table 3.0"

Aric Cyr (1):
      drm/amd/display: 3.2.264

Aurabindo Pillai (2):
      drm/amd/display: Use explicit size for types in DCCG's struct dp_dto_params
      drm/amd/display: trivial comment change

Charlene Liu (1):
      drm/amd/display: fix HW block PG sequence

Christian König (2):
      drm/amdgpu: fix tear down order in amdgpu_vm_pt_free
      drm/amdgpu: warn when there are still mappings when a BO is destroyed v2

Colin Ian King (1):
      drm/amd/display: Fix spelling mistake "SMC_MSG_AllowZstatesEntr" -> "SMC_MSG_AllowZstatesEntry"

Evan Quan (4):
      drm/amd/pm: update driver_if and ppsmc headers for coming wbrf feature
      drm/amd/pm: setup the framework to support Wifi RFI mitigation feature
      drm/amd/pm: add flood detection for wbrf events
      drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.7

Fangzhi Zuo (1):
      drm/amd/display: Populate dtbclk from bounding box

Felix Kuehling (2):
      drm/amdkfd: Export DMABufs from KFD using GEM handles
      drm/amdkfd: Import DMABufs for interop through DRM

Friedrich Vock (1):
      drm/amdgpu: Enable tunneling on high-priority compute queues

Harshit Mogalapalli (1):
      drm/amd/display: Fix memory leak in dm_set_writeback()

Hawking Zhang (1):
      drm/amdgpu: Switch to aca bank for xgmi pcs err cnt

James Zhu (2):
      drm/amdgpu: increase hmm range get pages timeout
      drm/amdgpu: make an improvement on amdgpu_hmm_range_get_pages

Jani Nikula (2):
      drm/radeon: include drm/drm_edid.h only where needed
      drm/amd: include drm/drm_edid.h only where needed

Jonathan Kim (2):
      drm/amdkfd: fix mes set shader debugger process management
      drm/amdkfd: only flush mes process context if mes support is there

Joshua Aberback (1):
      drm/amd/display: Remove minor revision 5 until proper parser is ready

Joshua Ashton (14):
      drm/amd/display: add plane degamma TF driver-specific property
      drm/amd/display: add plane HDR multiplier driver-specific property
      drm/amd/display: add plane blend LUT and TF driver-specific properties
      drm/amd/display: add CRTC gamma TF support
      drm/amd/display: set sdr_ref_white_level to 80 for out_transfer_func
      drm/amd/display: mark plane as needing reset if color props change
      drm/amd/display: add plane degamma TF and LUT support
      drm/amd/display: add dc_fixpt_from_s3132 helper
      drm/amd/display: add HDR multiplier support
      drm/amd/display: handle empty LUTs in __set_input_tf
      drm/amd/display: add plane blend LUT and TF support
      drm/amd/display: allow newer DC hardware to use degamma ROM for PQ/HLG
      drm/amd/display: copy 3D LUT settings from crtc state to stream_update
      drm/amd/display: Add 3x4 CTM support for plane CTM

Kenneth Feng (1):
      drm/amd/pm: add power save mode workload for smu 13.0.10

Li Ma (1):
      drm/amd/swsmu: remove duplicate definition of smu v14_0_0 driver if version

Lijo Lazar (1):
      drm/amdgpu: Use the right method to get IP version

Ma Jun (4):
      Documentation/driver-api: Add document about WBRF mechanism
      platform/x86/amd: Add support for AMD ACPI based Wifi band RFI mitigation feature
      drm/amd/pm: Remove redundant function members of pptable_funcs
      drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0

Mario Limonciello (2):
      drm/amd/display: Disable PSR-SU on Parade 0803 TCON again
      drm/amd: Fix a probing order problem on SDMA 2.4

Melissa Wen (19):
      drm/drm_mode_object: increase max objects to accommodate new color props
      drm/drm_property: make replace_property_blob_from_id a DRM helper
      drm/drm_plane: track color mgmt changes per plane
      drm/amd/display: add driver-specific property for plane degamma LUT
      drm/amd/display: explicitly define EOTF and inverse EOTF
      drm/amd/display: document AMDGPU pre-defined transfer functions
      drm/amd/display: add plane 3D LUT driver-specific properties
      drm/amd/display: add plane shaper LUT and TF driver-specific properties
      drm/amd/display: add CRTC gamma TF driver-specific property
      drm/amd/display: add comments to describe DM crtc color mgmt behavior
      drm/amd/display: encapsulate atomic regamma operation
      drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
      drm/amd/display: reject atomic commit if setting both plane and CRTC degamma
      drm/amd/display: add plane shaper LUT support
      drm/amd/display: add plane shaper TF support
      drm/amd/display: add plane 3D LUT support
      drm/amd/display: add plane CTM driver-specific property
      drm/amd/display: add plane CTM support
      drm/amd/display: fix documentation for dm_crtc_additional_color_mgmt()

Michael Strauss (1):
      drm/amd/display: Revert DP2 MST hub triple display fix

Muhammad Ahmed (1):
      drm/amd/display: remove HPO PG in driver side

Peyton Lee (2):
      drm/amd/pm: support return vpe clock table
      drm/amdgpu/vpe: enable vpe dpm

Philip Yang (1):
      drm/amdkfd: svm range always mapped flag not working on APU

Ran Shi (1):
      drm/amd/display: allow DP40 cables to do UHBR13.5

Saleemkhan Jamadar (1):
      drm/amdgpu/jpeg: configure doorbell for each playback

Samson Tam (1):
      drm/amd/display: do not send commands to DMUB if DMUB is inactive from S3

Sung Joon Kim (1):
      drm/amd/display: Exit from idle state before accessing HW data

Taimur Hassan (1):
      drm/amd/display: Revert "Fix conversions between bytes and KB"

Vignesh Chander (1):
      drm/amdgpu: xgmi_fill_topology_info

Wang, Beyond (1):
      drm/amdgpu: fix ftrace event amdgpu_bo_move always move on same heap

Woody Suwalski (1):
      drm/radeon: Prevent multiple debug error lines on suspend

Yang Li (1):
      drm/amd/pm: Remove unneeded semicolon

Zhipeng Lu (4):
      drm/amd/pm: fix a double-free in si_dpm_init
      drivers/amd/pm: fix a use-after-free in kv_parse_power_table
      gpu/drm/radeon: fix two memleaks in radeon_vm_init
      drm/amd/pm: fix a double-free in amdgpu_parse_extended_power_table

 Documentation/driver-api/index.rst                 |   1 +
 Documentation/driver-api/wbrf.rst                  |  78 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  93 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  31 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |  93 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            | 249 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.h            |  12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  58 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |   1 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |  15 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  28 +
 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c              |  15 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  19 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  18 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  46 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  | 108 +++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    | 818 +++++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  72 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 232 +++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |   1 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  10 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   2 +-
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |   8 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  14 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   2 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |   4 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_init.c  |   3 +-
 drivers/gpu/drm/amd/display/dc/dm_pp_smu.h         |   2 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   3 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |  33 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   1 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  14 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    |  16 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |   7 -
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  20 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 134 +++-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |   6 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   6 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   4 +-
 .../display/dc/link/protocols/link_dp_capability.c |  14 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   2 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |  21 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |  15 +
 drivers/gpu/drm/amd/display/include/fixed31_32.h   |  12 +
 .../drm/amd/display/modules/power/power_helpers.c  |   2 +
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |   3 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  10 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   1 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |   4 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |  52 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 208 ++++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  42 ++
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |   3 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h |   3 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h |   5 -
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h   |   5 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h   |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   2 -
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   2 -
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   2 -
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  89 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  47 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   6 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  15 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   6 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  20 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |   3 +
 drivers/gpu/drm/arm/malidp_crtc.c                  |   2 +-
 drivers/gpu/drm/drm_atomic.c                       |   1 +
 drivers/gpu/drm/drm_atomic_state_helper.c          |   1 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |  52 +-
 drivers/gpu/drm/drm_property.c                     |  59 ++
 drivers/gpu/drm/radeon/atombios_encoders.c         |   1 +
 drivers/gpu/drm/radeon/dce3_1_afmt.c               |   1 +
 drivers/gpu/drm/radeon/dce6_afmt.c                 |   1 +
 drivers/gpu/drm/radeon/evergreen.c                 |   1 +
 drivers/gpu/drm/radeon/evergreen_hdmi.c            |   1 +
 drivers/gpu/drm/radeon/radeon_atombios.c           |   1 +
 drivers/gpu/drm/radeon/radeon_audio.c              |   1 +
 drivers/gpu/drm/radeon/radeon_audio.h              |   4 +-
 drivers/gpu/drm/radeon/radeon_combios.c            |   1 +
 drivers/gpu/drm/radeon/radeon_encoders.c           |   1 +
 drivers/gpu/drm/radeon/radeon_mode.h               |   2 +-
 drivers/gpu/drm/radeon/radeon_ring.c               |   2 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |   8 +-
 drivers/platform/x86/amd/Kconfig                   |  14 +
 drivers/platform/x86/amd/Makefile                  |   1 +
 drivers/platform/x86/amd/wbrf.c                    | 317 ++++++++
 include/drm/drm_mode_object.h                      |   2 +-
 include/drm/drm_plane.h                            |   7 +
 include/drm/drm_property.h                         |   6 +
 include/linux/acpi_amd_wbrf.h                      |  91 +++
 include/uapi/drm/drm_mode.h                        |   8 +
 126 files changed, 3187 insertions(+), 436 deletions(-)
 create mode 100644 Documentation/driver-api/wbrf.rst
 create mode 100644 drivers/platform/x86/amd/wbrf.c
 create mode 100644 include/linux/acpi_amd_wbrf.h
