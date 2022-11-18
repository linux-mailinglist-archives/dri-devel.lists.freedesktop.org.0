Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8250E62FB28
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 18:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E84810E79E;
	Fri, 18 Nov 2022 17:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DDB10E79E;
 Fri, 18 Nov 2022 17:08:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jqfh+pgB5nGBX1f9CvAPCvffIRPGmgG5orDKEXjOFTREJigj3FdPWD1Uyk/olxSpdAS6dU1/QGNw5sPqb23GDiwL0AnnoRuf5kXZ1P0cINNFzgnRCM5yI3vssnD5jJNjuS6fFI2OHqqDLzXcY2Nv79hdtlgEfAFThIrnXvp3FL/jGm3abRMKhxEA7NbfjcYajsxC9qMKZQay2GRt1d/y65vy8ynTG7pEZxzuug9P7XgQ6OB0ftvy2yDgxfgteg2EPnUpavht/nOoE/zQCrcyRfzOQF7ewKJ84uT/ZW/n+++lwx+utYmnXOPSRcT62XCGGxOhlil3scMMqHVa5qveFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWesz72P1GGuhkeNmjySaK8QDkU5Y5L2zWLCZKJYIiI=;
 b=A+t7iJyGIe+rLk3ZRGIXa0jn5EI8QclwlJNhy7qpCu9o8/Tq2nm1uaA6IKxYdCbpkBjp1D1nz/k7fBYJSgirqz+CrGw+czR/aqS2cheAn+HG5qagYS5EUmnKHzwhEviJ40iDbaYDmNOl4yIvcLg5qqAlZ7JRAQgPFGvjf2KusGG4O6wAVuBV+lfx4G0ppdFy0b7RoCKiQ0q++8pC1HA/OaNCfIouwfv13hWa2xzqqjg0iwd6afafrjW9yIjGgZD3x9T/D5bNkqaAJxDDs5eZb9EJYxjR4v7Iq6VFcT8sT9O0qDJZd3L1lc/8C4KwPtGeoZJ/kkXE31RptBENT/CN9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWesz72P1GGuhkeNmjySaK8QDkU5Y5L2zWLCZKJYIiI=;
 b=wuIZYsdcz8qC4Q4nncacX8f7J1rLcdKKGEzK8xN7oQr1iH9yRQOzexVO5Naaqu2Fav75qkrvPGb74adcvdDgG5j3tLKcubKZG3ee62/JE6U60HLoucyZKOaQ1brFiMbt7ElM8lA0g30wGbCXjnc/ggdXSuwjl5mYwfAut4//Cts=
Received: from DM5PR07CA0093.namprd07.prod.outlook.com (2603:10b6:4:ae::22) by
 BL1PR12MB5780.namprd12.prod.outlook.com (2603:10b6:208:393::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 17:08:27 +0000
Received: from DM6NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::14) by DM5PR07CA0093.outlook.office365.com
 (2603:10b6:4:ae::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 17:08:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT107.mail.protection.outlook.com (10.13.172.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 17:08:26 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 11:08:25 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.2
Date: Fri, 18 Nov 2022 12:08:07 -0500
Message-ID: <20221118170807.6505-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT107:EE_|BL1PR12MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: c75a9518-0918-42e5-aff5-08dac9878224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5UbzLyPyNHmbloaTs0V+dPC3Z6zqcFOFxd7hUJ6FvsoWfJbUbMm8WKDQeu2J7vBhZOP/kv8IZdZrICk7lMH1o9KbvX8R7PthVqHZFsWNDbsg/xMcGYC4kOT4tjcdlZad3Ez/1D/DzLFZO0h+9lpfz0zQPGE5Q/EHnhFZG3xM0bOqpSEYDg9mRi8t/lU5+4K1isQqFWOi0xGl7e0lQ31ag8jlfEiOIUd0SNVIyWrEdj/JB7q7NJQBrNGYeEW9gzLRZgBzPsGcB0WPQkMGvWjJHF1rskVbG0LdjxU1o/HZs/acvpHvbaed5mFPj7xObc2KMNyViYcNcFV5pIU2s1KeybyNn1+jLZJ5VziXa9wg7Wj90L2zu5H7ZyB9SE+mmJkL7B8Nz00FQRHGB3kzb1zkT/V9Hut6YnGR7YeQoMfjGGsRkiza4kB0AfkCWkXzDg8uM6ZeJnBwXNAcJY3Ko5RENmnwkyc69ji9f4B8n+OgSoB2pZM0593XTKvTA0RRV4x5wEi4CDkVKVHh0rZeukAx2vlLwYLJ8aSuafKvblGTvEQNdX9A5Wepwb2o1CqWd0cgyuVP2gNKQR+QXWRZdd2QMMOi93h3acgQtn5w+SJZCe25xYnmdjljRcyiMD21yMfDshBQle92BJy2xXCTPok2I94D/bFrcPoxwMhl7nSLNEdLRr0k4EprnhuaHq8J1EJg
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(110136005)(7696005)(6666004)(26005)(316002)(478600001)(70586007)(8676002)(4326008)(41300700001)(2616005)(70206006)(186003)(16526019)(47076005)(30864003)(8936002)(336012)(426003)(2906002)(4001150100001)(66574015)(5660300002)(1076003)(83380400001)(36860700001)(86362001)(36756003)(40480700001)(82310400005)(966005)(40460700003)(82740400003)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 17:08:26.6931 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c75a9518-0918-42e5-aff5-08dac9878224
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5780
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

More new stuff for 6.2.  This includes last week's PR, plus the fix
for ARM32, plus a few new things.

The following changes since commit a143bc517bf31c4575191efbaac216a11ec016e0:

  Merge branch '00.06-gr-ampere' of https://gitlab.freedesktop.org/skeggsb/nouveau into drm-next (2022-11-09 11:18:56 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.2-2022-11-18

for you to fetch changes up to aec3bb3a01de09058fbebed4821ed7d07e1ed994:

  drm/amdgpu: make psp_ring_init common (2022-11-17 18:09:16 -0500)

----------------------------------------------------------------
amd-drm-next-6.2-2022-11-18:

amdgpu:
- SR-IOV fixes
- Clean up DC checks
- DCN 3.2.x fixes
- DCN 3.1.x fixes
- Don't enable degamma on asics which don't support it
- IP discovery fixes
- BACO fixes
- Fix vbios allocation handling when vkms is enabled
- Drop buggy tdr advanced mode GPU reset handling
- Fix the build when DCN is not set in kconfig
- MST DSC fixes
- Userptr fixes
- FRU and RAS EEPROM fixes
- VCN 4.x RAS support
- Aldrebaran CU occupancy reporting fix
- PSP ring cleanup

amdkfd:
- Memory limit fix
- Enable cooperative launch on gfx 10.3

amd-drm-next-6.2-2022-11-11:

amdgpu:
- SMU 13.x updates
- GPUVM TLB race fix
- DCN 3.1.4 updates
- DCN 3.2.x updates
- PSR fixes
- Kerneldoc fix
- Vega10 fan fix
- GPUVM locking fixes in error pathes
- BACO fix for Beige Goby
- EEPROM I2C address cleanup
- GFXOFF fix
- Fix DC memory leak in error pathes
- Flexible array updates
- Mtype fix for GPUVM PTEs
- Move Kconfig into amdgpu directory
- SR-IOV updates
- Fix possible memory leak in CS IOCTL error path

amdkfd:
- Fix possible memory overrun
- CRIU fixes

radeon:
- ACPI ref count fix
- HDA audio notifier support
- Move Kconfig into radeon directory

UAPI:
- Add new GEM_CREATE flags to help to transition more KFD functionality to the DRM UAPI.
  These are used internally in the driver to align location based memory coherency
  requirements from memory allocated in the KFD with how we manage GPUVM PTEs.  They
  are currently blocked in the GEM_CREATE IOCTL as we don't have a user right now.
  They are just used internally in the kernel driver for now for existing KFD memory
  allocations. So a change to the UAPI header, but no functional change in the UAPI.

----------------------------------------------------------------
Alex Deucher (8):
      drm/amdgpu: use proper DC check in amdgpu_display_supported_domains()
      drm/amdgpu: rework SR-IOV virtual display handling
      drm/amdgpu: move non-DC vblank handling out of irq code
      drm/amdgpu: clarify DC checks
      drm/amdgpu: there is no vbios fb on devices with no display hw (v2)
      drm/amd/display: fix the build when DRM_AMD_DC_DCN is not set
      drm/amdgpu/psp12: move ih_reroute into ring_create
      drm/amdgpu: make psp_ring_init common

Alvin Lee (7):
      drm/amd/display: Wait for VBLANK during pipe programming
      drm/amd/display: Use min transition for SubVP into MPO
      drm/amd/display: Disable phantom OTG after enable for plane disable
      drm/amd/display: Add margin for max vblank time for SubVP + DRR
      drm/amd/display: Use min transition for all SubVP plane add/remove
      drm/amd/display: Don't check output BPP for phantom
      drm/amd/display: Fix Subvp phantom pipe transition

Andrew Davis (1):
      drm: Move radeon and amdgpu Kconfig options into their directories

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.143.0

Aric Cyr (2):
      drm/amd/display: 3.2.211
      drm/amd/display: 3.2.212

Asher Song (1):
      Revert "drm/amdgpu: Revert "drm/amdgpu: getting fan speed pwm for vega10 properly""

Aurabindo Pillai (3):
      drm/amd/display: Zeromem mypipe heap struct before using it
      drm/amd/display: fix array index out of bound error in bios parser
      drm/amd/display: rework macros for DWB register access

Candice Li (1):
      drm/amdgpu: Add psp_13_0_10_ta firmware to modinfo

Chaitanya Dhere (1):
      drm/amd/display: Fix FCLK deviation and tool compile issues

Charlene Liu (1):
      drm/amd/display: fix dcn3.1x mode validation on high bandwidth config

Christian König (8):
      drm/amdgpu: workaround for TLB seq race
      drm/amdgpu: revert "implement tdr advanced mode"
      drm/amdgpu: stop resubmitting jobs for GPU reset v2
      drm/amdgpu: stop resubmittting jobs in amdgpu_pci_resume
      drm/amdgpu: always register an MMU notifier for userptr
      drm/amdgpu: fix userptr HMM range handling v2
      drm/amdgpu: rename the files for HMM handling
      drm/amdgpu: cleanup amdgpu_hmm_range_get_pages

Dan Carpenter (1):
      amdgpu/pm: prevent array underflow in vega20_odn_edit_dpm_table()

David Galiffi (1):
      drm/amd/display: Update SubVP Visual Confirm

Dillon Varone (7):
      drm/amd/display: Enforce minimum prefetch time for low memclk on DCN32
      drm/amd/display: Program pipes for ODM when removing planes
      drm/amd/display: Check context constructed for pipe split flags is still valid
      drm/amd/display: Align phantom pipe dst/src scaling with main for subvp
      drm/amd/display: Fix prefetch calculations for dcn32
      drm/amd/display: use uclk pstate latency for fw assisted mclk validation dcn32
      drm/amd/display: Set max for prefetch lines on dcn32

Dmytro Laktyushkin (2):
      drm/amd/display: use low clocks for no plane configs
      drm/amd/display: fix unbounded requesting for high pixel rate modes on dcn315

Dong Chenchen (1):
      drm/amdgpu: Fix memory leak in amdgpu_cs_pass1

Eric Huang (1):
      drm/amdkfd: Fix a memory limit issue

Evan Quan (3):
      drm/amd/pm: enable runpm support over BACO for SMU13.0.0
      drm/amd/pm: enable runpm support over BACO for SMU13.0.7
      drm/amd/pm: fix SMU13 runpm hang due to unintentional workaround

Felix Kuehling (3):
      drm/amdkfd: Fix error handling in kfd_criu_restore_events
      drm/amdkfd: Fix error handling in criu_checkpoint
      drm/amdgpu: Set MTYPE in PTE based on BO flags

Gavin Wan (1):
      drm/amdgpu: Ignore stop rlc on SRIOV environment.

George Shen (4):
      drm/amd/display: Populate DP2.0 output type for DML pipe
      drm/amd/display: Support parsing VRAM info v3.0 from VBIOS
      drm/amd/display: Workaround to increase phantom pipe vactive in pipesplit
      drm/amd/display: Fix calculation for cursor CAB allocation

Guchun Chen (2):
      drm/amdgpu: disable BACO on special BEIGE_GOBY card
      drm/amdgpu: disable BACO support on more cards

Hamza Mahfooz (1):
      drm/amd/display: only fill dirty rectangles when PSR is enabled

Hanjun Guo (1):
      drm/radeon: Add the missed acpi_put_table() to fix memory leak

Harsh Jain (1):
      drm/amdgpu: complete gfxoff allow signal during suspend without delay

Ilya Bakoulin (1):
      drm/amd/display: Adjust DP 8b10b LT exit behavior

Jonathan Kim (1):
      drm/amdkfd: enable cooperative launch for gfx10.3

Jun Lei (1):
      drm/amd/display: enable dchub request limit for DCN 3.2.x

Kenneth Feng (2):
      drm/amd/pm: enable mode1 reset on smu_v13_0_10
      drm/amd/pm: skip disabling all smu features on smu_v13_0_10 in suspend

Leo Ma (1):
      drm/amd/display: Adding HDMI SCDC DEVICE_ID define

Liu Jian (1):
      drm/amd/display: delete the duplicate .set_odm_bypass initialization in dcn314_tg_funcs

Liu Xi (1):
      drm/amd/display: clean up some irq service code for dcn201

LongJun Tang (1):
      drm/amd/display: Have risk for memory exhaustion

Luben Tuikov (6):
      drm/amdgpu: Remove redundant I2C EEPROM address
      drm/amdgpu: Decouple RAS EEPROM addresses from chips
      drm/amdgpu: Allow non-standard EEPROM I2C address
      drm/amdgpu: Bug-fix: Reading I2C FRU data on newer ASICs
      drm/amdgpu: Interpret IPMI data for product information (v2)
      drm/amdgpu: Add support for RAS table at 0x40000

Lyude Paul (4):
      drm/amdgpu/mst: Stop ignoring error codes and deadlocking
      drm/display/dp_mst: Fix drm_dp_mst_add_affected_dsc_crtcs() return code
      drm/amdgpu/dm/mst: Use the correct topology mgr pointer in amdgpu_dm_connector
      drm/amdgpu/dm/dp_mst: Don't grab mst_mgr->lock when computing DSC state

Ma Jun (2):
      drm/amdkfd: Fix the memory overrun
      drm/amdkfd: Make kfd_fill_cache_non_crat_info() as static

Martin Leung (1):
      drm/amd/display: revert Disable DRR actions during state commit

Max Tseng (1):
      drm/amd/display: Cursor update refactor: PSR-SU support condition

Melissa Wen (1):
      drm/amd/display: don't enable DRM CRTC degamma property for DCE

Michael Strauss (1):
      drm/amd/display: Only update link settings after successful MST link train

Mike Hsieh (1):
      drm/amd/display: Set correct EOTF and Gamut flag in VRR info

Mustapha Ghaddar (1):
      drm/amd/display: Fix fallback issues for DP LL 1.4a tests

Nawwar Ali (1):
      drm/amd/display: Update 709 gamma to 2.222 as stated in the standerd

Nicholas Kazlauskas (3):
      drm/amd/display: Update SR watermarks for DCN314
      drm/amd/display: Allow tuning DCN314 bounding box
      drm/amd/display: Fix reg timeout in enc314_enable_fifo

Paulo Miguel Almeida (3):
      drm/amdgpu: Replace 1-element array with flexible-array member
      drm/amdgpu: Replace one-element array with flex-array member
      drm/amdgpu: Replace one-elements array with flex-array members

Perry Yuan (3):
      drm/amdgpu: add Vangogh APU flag to IP discovery path
      drm/amd/display: change GPU match with IP version for Vangogh
      drm/amdgpu: remove the DID of Vangogh from pciidlist

Philip Yang (2):
      drm/amdgpu: Unlock bo_list_mutex after error handling
      drm/amdgpu: Drop eviction lock when allocating PT BO

Rajneesh Bhardwaj (1):
      drm/amdgpu: Fix the kerneldoc description

Ramesh Errabolu (1):
      drm/amdgpu: Enable Aldebaran devices to report CU Occupancy

Randy Dunlap (1):
      drm/amd/display: fix kernel-doc issues in dc.h

Rodrigo Siqueira (1):
      drm/amd/display: Add HUBP surface flip interrupt handler

Roman Li (2):
      drm/amd/display: Fix optc2_configure warning on dcn314
      drm/amd/display: Align dcn314_smu logging with other DCNs

Ryan Lin (1):
      drm/amd/display: Waiting for 1 frame to fix the flash issue on PSR1

Steve Su (1):
      drm/amd/display: Fix gpio port mapping issue

Stylon Wang (2):
      drm/amd/display: Fix access timeout to DPIA AUX at boot time
      drm/amd/display: Fix invalid DPIA AUX reply causing system hang

Takashi Iwai (1):
      drm/radeon: Add HD-audio component notifier support (v6)

Tao Zhou (9):
      drm/amdgpu: remove the check of init status in psp_ras_initialize
      drm/amdgpu: enable RAS for VCN/JPEG v4.0
      drm/amdgpu: define common vcn_set_ras_funcs
      drm/amdgpu: define common jpeg_set_ras_funcs
      drm/amdgpu: add RAS query support for VCN 4.0
      drm/amdgpu: add RAS error query for JPEG 4.0
      drm/amdgpu: add irq source id definition for VCN/JPEG 4.0
      drm/amdgpu: add VCN 4.0 RAS poison consumption handling
      drm/amdgpu: add JPEG 4.0 RAS poison consumption handling

Tim Huang (1):
      drm/amd/pm: update SMU IP v13.0.4 msg interface header

Tong Liu01 (1):
      drm/amdgpu: add vram reservation based on vram_usagebyfirmware_v2_2

Ville Syrjälä (1):
      drm/amdgpu: Use drm_mode_init() for on-stack modes

Wenjing Liu (1):
      drm/amd/display: Consider dp cable id only when data is non zero

Wesley Chalmers (1):
      drm/amd/display: Disable DRR actions during state commit

YiPeng Chai (3):
      drm/amdgpu: Add umc channel index mapping table for umc_v8_10
      drm/amdgpu: Fixed the problem that ras error can't be queried after gpu recovery is completed
      drm/amdgpu: Enable mode-1 reset for RAS recovery in fatal error mode

Yifan Zha (1):
      drm/amdgpu: Remove programming GCMC_VM_FB_LOCATION* on gfxhub_v3_0_3 in VF

Yifan Zhang (1):
      drm/amdgpu: force read discovery file if set discovery=2

YuBiao Wang (1):
      drm/amdgpu: Stop clearing kiq position during unload

Zhongwei Zhang (1):
      drm/amd/display: fix dpms_off issue when disabling bios mode

 drivers/gpu/drm/Kconfig                            |  56 ----
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |  29 ++
 drivers/gpu/drm/amd/amdgpu/Makefile                |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  82 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   | 104 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 203 +++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  39 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     | 215 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   2 +-
 .../drm/amd/amdgpu/{amdgpu_mn.c => amdgpu_hmm.c}   |  51 ++-
 .../drm/amd/amdgpu/{amdgpu_mn.h => amdgpu_hmm.h}   |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |  58 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |  17 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  48 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            | 113 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  17 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  26 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |  41 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |  13 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |  13 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |  14 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |  14 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  16 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |  12 -
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   7 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  12 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  79 ++++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |  13 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |  81 +++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.h             |   7 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |  27 --
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |  27 --
 drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.c           |  27 --
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |  31 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  28 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c           |  27 --
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |  27 --
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   1 +
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |  10 +
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.h             |   4 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  13 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  70 ++++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.h              |   6 +
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  34 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   1 -
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  65 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   6 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  10 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   8 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 254 +++++++-------
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |  12 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |  50 +--
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  46 ++-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   4 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |  32 +-
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |  11 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 157 ++++++---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   4 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  71 +++-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |  15 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  17 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  60 +++-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   5 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |   4 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.h   | 363 ++++++++++-----------
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  50 +--
 .../gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.h  |   7 -
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  11 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.h  |   6 -
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   2 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h   |  15 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.h  |   7 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   6 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   6 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   5 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  39 ++-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |  24 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |   3 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   3 +
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |  13 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |   8 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |  18 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |   8 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  44 ++-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |   2 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |   1 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |   8 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |  13 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |   3 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   8 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   5 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   2 +
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |  23 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |   5 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |  54 ++-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |  16 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |   2 -
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  66 +++-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   9 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.h |   5 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |  13 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   3 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |   2 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |   1 +
 .../amd/display/dc/gpio/dcn32/hw_factory_dcn32.c   |  14 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_ddc.c       |   9 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   1 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |   1 +
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |  17 +-
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.h |   2 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   9 +-
 .../drm/amd/display/modules/color/color_gamma.c    |   2 +-
 .../drm/amd/display/modules/freesync/freesync.c    |   8 +-
 drivers/gpu/drm/amd/include/atombios.h             |  30 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |  63 +++-
 .../drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_4_0.h  |   3 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   2 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    |  25 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  26 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  12 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_4_ppsmc.h   |  15 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  11 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   9 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  83 ++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  30 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  18 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   3 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   2 +-
 drivers/gpu/drm/radeon/Kconfig                     |  30 ++
 drivers/gpu/drm/radeon/radeon.h                    |   8 +
 drivers/gpu/drm/radeon/radeon_audio.c              | 117 +++++++
 drivers/gpu/drm/radeon/radeon_bios.c               |  18 +-
 drivers/gpu/drm/radeon/radeon_device.c             |   4 +
 drivers/gpu/drm/scheduler/sched_main.c             |  58 +---
 include/drm/gpu_scheduler.h                        |   3 -
 include/uapi/drm/amdgpu_drm.h                      |  14 +
 176 files changed, 2684 insertions(+), 1645 deletions(-)
 rename drivers/gpu/drm/amd/amdgpu/{amdgpu_mn.c => amdgpu_hmm.c} (82%)
 rename drivers/gpu/drm/amd/amdgpu/{amdgpu_mn.h => amdgpu_hmm.h} (78%)
