Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 477184BBF0D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4731310E68A;
	Fri, 18 Feb 2022 18:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2050.outbound.protection.outlook.com [40.107.96.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C5710E496;
 Fri, 18 Feb 2022 18:09:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZSmIFHixJyP2Vk0pmL6OB3tkmB7By3kqnDlRVK+87uNR0J5qIQpgQ561MIhTGKBa1fRtq7I00N0Lr1Br/5CYGCQ1XYfpsxPq4SZvkA+sJAZ/vPMq3XmwANY+O2wr7wFL0BahnQH+rRmmKL8jerY6prypeI4f+5Tgdf+p714byTconKBJ3/GUFUZyWh4QrDV744W72SjIDuRsfbFTyL4Si+tp/YRLvRkxQ70y8g/EYSbs+A2zpV15gkMihESCXSsbd2bQ4r8H41NSjn/rfwp9B2gcWdEGeDH8YTfOsP+qAhi+8z+ZkYoPjb30ZqrixYejiRF9v+ubLhchU5dNQmodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3388wbSSSMktr9NvHXRIjYsA6goZ4VNSg2S/HVY8bI=;
 b=BaZM2SgiFOpulGb4xv3YD+UYe+D7XouIpMG3FEaykRQ4CU9nTsnAU/pxW+XSLBqDZ/TqcTLKGkZxIRCAF/wlRgAShDK8IWMGnwqXX39if7ZqFWb3knufHpi2CwzJuEOgIVo+3WbGuaLwT3kKf6JnZLdiwNW3a7mD4iH8m8qnsMDdbhCz0OrwDXUvsQCGompnm581O9lI2WWmJImEEftoMRusT3+GYMqSduTSHDQLzHtNHbBrewhUzmlR0aMV2eyq1w2SbBycQs5BMkErvxBTiTkt2yiCr6OP5LtF6/BNE+7hJ5BjyzxIepEZZtJGHRE5r/2MWGlt/dP45s7vUQGpcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3388wbSSSMktr9NvHXRIjYsA6goZ4VNSg2S/HVY8bI=;
 b=DGCkL/uG91PzygHvos6+vOplbV2eb1CHs/JUWBOnkQ5O72k6LByIg3RgPCvcU1RX5EqlKUnXUtjaiPbGqcPDFkyjnTquVFSZrrXrdq9iPyP0PV8XOn8w0DOiZIbkmp2HOlPz4cC38yCPsVd5h+JGyP7zFtyT/yGFTmHHNW47sTg=
Received: from DM5PR20CA0038.namprd20.prod.outlook.com (2603:10b6:3:13d::24)
 by BN7PR12MB2674.namprd12.prod.outlook.com (2603:10b6:408:29::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 18 Feb
 2022 18:09:34 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13d:cafe::d6) by DM5PR20CA0038.outlook.office365.com
 (2603:10b6:3:13d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.25 via Frontend
 Transport; Fri, 18 Feb 2022 18:09:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Fri, 18 Feb 2022 18:09:33 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Feb
 2022 12:09:32 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.18
Date: Fri, 18 Feb 2022 13:09:20 -0500
Message-ID: <20220218180920.5754-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1c884c0-bf66-4412-de23-08d9f309d139
X-MS-TrafficTypeDiagnostic: BN7PR12MB2674:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB2674A9073368BA427A0B57F0F7379@BN7PR12MB2674.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CKdZGnx57unovUsOzLowrFRWrh8dn8I6jB+pAL1D9kR8+7hADAXDSy+pypJcWe3RIlPprhY4wRhqh66p/HeSLvQrYitTDVuS6Ug1WeBRgeo2yhFUwtqu6s7LEkD8LzBmMCQrXZtJfb0myP+mRpx0MUkjczW9AFvnwR1LILDdWJQv6+wg/FKDBXKOP3ThMQWqp8VcZo3V7B1JxXgSlmOz9meRvFoOfcuV7sTxggs0OJbxMLctkkEfPnPhaDvAjf+/+dLUHEX2VtR0q/7dnW2gBJsPlDTPsGXojVMbA1TOnx0/Nl7bYt3pByv39wAokry9P2u9H8FNOo2/6RzULVTTV7CmjG5frgjyeaHDaKeMpgtLV7DZTPUB4nHOaDYZ8YtjhRUDNowmAuXSw7LFztSfpt20H8kis+tgvnU6bKs73M3LDXyIIZecmhb3u11pI2Qm4K8tgvqSus53e3zUCt/YmDHKp8X9cAxJhbO8P7kXOjMEfACNNUq1l1nJEkuwR1X/GAnMh3PlnxNGHhK4HtgXG2+oFaNaXGRka/gQnROG04tl+OCXhblRRMZBu9SH17pzRMogA2ijhEFJipO82APOi9ry5tCiigaDvLKqMQ+0V+AfMVZn7MZyIqocmVaXjvGt5Bbwi1zM8jc+KTXKgIIBDSztm4X1L8sXHM7xmQXckFN1+31KC7c/oZU3Y54XdFt9avGEcZdRstT2zwGOwhVoa1mpzQzXv0/BE803AGuO9q8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(26005)(36860700001)(4326008)(82310400004)(1076003)(186003)(30864003)(16526019)(47076005)(8676002)(70586007)(70206006)(508600001)(110136005)(40460700003)(86362001)(83380400001)(966005)(316002)(336012)(426003)(8936002)(7696005)(5660300002)(66574015)(2616005)(6666004)(2906002)(36756003)(356005)(81166007)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 18:09:33.9027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c884c0-bf66-4412-de23-08d9f309d139
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2674
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

More new stuff for 5.18.

The following changes since commit b9c7babe2c2e37a50aa42401b38d597ea78f506e:

  Backmerge tag 'v5.17-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into drm-next (2022-02-14 10:52:27 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.18-2022-02-18

for you to fetch changes up to b63c54d978236dd6014cf2ffba96d626e97c915c:

  drm/amdkfd: Use proper enum in pm_unmap_queues_v9() (2022-02-17 15:59:06 -0500)

----------------------------------------------------------------
amd-drm-next-5.18-2022-02-18:

amdgpu:
- kerneldoc fixes
- Expose IP discovery data via sysfs
- RAS rework
- SRIOV fixes
- Display FP fix
- RDNA2 SMU fixes
- Display DSC fixes
- Cyan Skillfish update
- GC 10.3.7 updates
- SDMA 5.2.7 updates
- DCN 3.1.6 updates
- Fix ASPM handling
- GC 10.3.6 updates

amdkfd:
- SPDX header cleanups
- SDMA queue handling fixes
- Misc fixes

radeon:
- iMac backlight fix

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu/sdma5.2: Adjust the name string for firmware
      drm/amdgpu: make cyan skillfish support code more consistent
      drm/amdgpu/smu11.5: restore cclks in vangogh_set_performance_level

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.104.0

Aric Cyr (1):
      drm/amd/display: 3.2.173

Bas Nieuwenhuizen (1):
      drm/amd/display: Protect update_bw_bounding_box FPU code.

Changcheng Deng (1):
      drm/amdkfd: Replace zero-length array with flexible-array member

Charlene Liu (1):
      drm/amd/display: make sure pipe power gating reach requested hw state

Eric Yang (1):
      drm/amd/display: enable z9 denial interface by default

Evan Quan (5):
      drm/amd/pm: correct the default DriverSmuConfig table settings
      drm/amd/pm: fulfill Navi1x implementations for DriverSmuConfig setting
      drm/amd/pm: fulfill Sienna_Cichlid implementations for DriverSmuConfig setting
      drm/amdgpu: disable MMHUB PG for Picasso
      drm/amd/pm: fix some OEM SKU specific stability issues

Felix Kuehling (1):
      drm/amdkfd: Replace zero-length array with flexible-array member

Guchun Chen (1):
      drm/amdgpu: no rlcg legacy read in SRIOV case

Hansen Dsouza (1):
      drm/amd/display: Add DCN316 resource and SMU clock manager

Hersen Wu (2):
      drm/amd/display: dsc mst re-compute pbn for changes on hub
      drm/amd/display: add dsc mst stream pbn log for debug

Jonathan Kim (2):
      drm/amdkfd: remove unneeded unmap single queue option
      drm/amdkfd: navi2x requires extended engines to map and unmap sdma queues

Leo Li (3):
      drm/amd/include: Add register headers for DCN 3.1.6
      drm/amd/include: Add MP 13.0.8 register headers
      drm/amd/display: Add DMUB support for DCN316

Luben Tuikov (4):
      drm/amdgpu: Show IP discovery in sysfs
      drm/amdgpu: Add "harvest" to IP discovery sysfs
      drm/amdgpu: Fix ARM compilation warning
      drm/amdgpu: Dynamically initialize IP instance attributes

Mario Limonciello (4):
      drm/amd: smu7: downgrade voltage error to info
      drm/amd: Check if ASPM is enabled from PCIe subsystem
      drm/amd: Refactor `amdgpu_aspm` to be evaluated per device
      drm/amd: Use amdgpu_device_should_use_aspm on navi umd pstate switching

Meenakshikumar Somasundaram (1):
      drm/amd/display: Fix for dmub outbox notification enable

Michel Dänzer (1):
      drm/amd/display: For vblank_disable_immediate, check PSR is really used

Nathan Chancellor (1):
      drm/amdkfd: Use proper enum in pm_unmap_queues_v9()

Nicholas Bishop (1):
      drm/radeon: Fix backlight control on iMac 12,1

Prike Liang (11):
      drm/amdgpu/discovery: add nbio sw func for 7.5.1 nbio
      drm/amdgpu/discovery: Add 13.0.9 SMUIO block
      drm/amdgpu/discovery: set sw common init for GC 10.3.7
      drm/amdgpu: set new revision id for 10.3.7 GC
      drm/amdgpu/gmc10: add support for GC 10.3.7
      drm/amdgpu/psp: Add support for MP0 13.0.8
      drm/amd/pm: Add support for MP1 13.0.8
      drm/amdgpu/sdma5.2: add support for SDMA 5.2.7
      drm/amdgpu/gfx10: Add GC 10.3.7 Support
      drm/amd/display: configure dc hw resource for DCN 3.1.6
      drm/amdgpu/discovery: Add sw DM function for 3.1.6 DCE

Rajneesh Bhardwaj (4):
      drm/amdgpu: Fix some kerneldoc warnings
      drm/amdkfd: update SPDX license header
      drm/amdkfd: Fix leftover errors and warnings
      drm/amdgpu: Fix a kerneldoc warning

Roman Li (2):
      drm/amd/display: Add affected crtcs to atomic state for dsc mst unplug
      drm/amd/display: Add dsc pre-validation in atomic check

Sathishkumar S (1):
      drm/amdgpu: update vcn/jpeg PG flags for VCN 3.1.1

Stanley.Yang (1):
      drm/amdgpu: print more error info

Sung Joon Kim (1):
      drm/amd/display: reset lane settings after each PHY repeater LT

Surbhi Kakarya (1):
      drm/amdgpu: Handle the GPU recovery failure in SRIOV environment.

Tao Zhou (1):
      drm/amdkfd: add return value check for queue eviction

Tom Rix (2):
      drm/amdgpu: check return status before using stable_pstate
      drm/amdgpu: fix amdgpu_ras_block_late_init error handler

Tom St Denis (1):
      drm/amd/amdgpu: Add APU flag to gca_config debugfs data (v3)

Victor Skvortsov (1):
      drm/amdgpu: Fix wait for RLCG command completion

Yifan Zhang (5):
      drm/amd/pm: correct the sequence of sending gpu reset msg
      drm/amdgpu: add nv common init for gc 10.3.6
      drm/amdgpu: add Clock and Power Gating support for gc 10.3.6
      drm/amdgpu: add support for gmc10 for gc 10.3.6
      drm/amdgpu: add gc 10.3.6 support

Yiqing Yao (1):
      drm/amd/pm: enable pm sysfs write for one VF mode

yipechai (18):
      drm/amdgpu: Optimize xxx_ras_late_init/xxx_ras_late_fini for each ras block
      drm/amdgpu: Optimize amdgpu_gfx_ras_late_init/amdgpu_gfx_ras_fini function code
      drm/amdgpu: Optimize amdgpu_hdp_ras_late_init/amdgpu_hdp_ras_fini function code
      drm/amdgpu: Optimize amdgpu_mca_ras_late_init/amdgpu_mca_ras_fini function code
      drm/amdgpu: Optimize amdgpu_mmhub_ras_late_init/amdgpu_mmhub_ras_fini function code
      drm/amdgpu: Optimize amdgpu_nbio_ras_late_init/amdgpu_nbio_ras_fini function code
      drm/amdgpu: Optimize amdgpu_sdma_ras_late_init/amdgpu_sdma_ras_fini function code
      drm/amdgpu: Optimize amdgpu_umc_ras_late_init/amdgpu_umc_ras_fini function code
      drm/amdgpu: Optimize amdgpu_xgmi_ras_late_init/amdgpu_xgmi_ras_fini function code
      drm/amdgpu: Optimize operating sysfs and interrupt function interface in amdgpu_ras.c
      drm/amdgpu: Merge amdgpu_ras_late_init/amdgpu_ras_late_fini to amdgpu_ras_block_late_init/amdgpu_ras_block_late_fini
      drm/amdgpu: Modify .ras_late_init function pointer parameter
      drm/amdgpu: Remove redundant calls of ras_late_init in hdp ras block
      drm/amdgpu: Remove redundant calls of ras_late_init in mmhub ras block
      drm/amdgpu: Remove redundant calls of ras_late_init in mca ras block
      drm/amdgpu: Optimize xxx_ras_late_init function of each ras block
      drm/amdgpu: define amdgpu_ras_late_init to call all ras blocks' .ras_late_init
      drm/amdgpu: Remove redundant .ras_late_init initialization in some ras blocks

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |      5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |      5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |     55 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    517 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |     46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |     45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |     40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |      6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |     44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |      3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c          |     40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |      1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |     44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    106 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |     30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |     50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |     48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |      6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |      2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |     46 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |      2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    138 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |     16 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |     15 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |     21 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |      8 +-
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.c              |     52 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |      1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |      7 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |     33 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |      7 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |     19 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |      3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |     19 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |      2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |     13 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |     72 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |      2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |     14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c           |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |      8 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |     23 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |     11 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_cik.c  |      3 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v10.c  |     12 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |      3 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_vi.c   |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.h            |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |      8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c             |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.h             |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.h      |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |      2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_module.c            |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |      4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |      4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |     11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |     52 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c |     29 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pasid.c             |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers.h       |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h    |      3 +-
 .../gpu/drm/amd/amdkfd/kfd_pm4_headers_aldebaran.h |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h   |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_vi.h    |      7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_opcodes.h       |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     30 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |      3 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |      9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |      3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |     63 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     12 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |      3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    264 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |      4 +
 drivers/gpu/drm/amd/display/dc/Makefile            |      1 +
 .../amd/display/dc/bios/command_table_helper2.c    |      1 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |     10 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |     16 +
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |      2 +
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    706 +
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.h |     49 +
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c |    328 +
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.h |    128 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |     73 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |     20 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |     15 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |     16 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |     16 +
 drivers/gpu/drm/amd/display/dc/dc.h                |      5 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |      1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c   |     25 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.h   |      4 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |      4 -
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |     23 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn316/Makefile     |     56 +
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |   2306 +
 .../drm/amd/display/dc/dcn316/dcn316_resource.h    |     42 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |      1 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |      1 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |      1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |      4 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |      2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn316.c |     62 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn316.h |     33 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |      4 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |      6 +-
 drivers/gpu/drm/amd/display/include/dal_types.h    |      1 +
 .../amd/include/asic_reg/dcn/dcn_3_1_6_offset.h    |  15682 ++
 .../amd/include/asic_reg/dcn/dcn_3_1_6_sh_mask.h   |  62717 ++++++++
 .../amd/include/asic_reg/dpcs/dpcs_4_2_3_offset.h  |  11969 ++
 .../amd/include/asic_reg/dpcs/dpcs_4_2_3_sh_mask.h | 136141 ++++++++++++++++++
 .../drm/amd/include/asic_reg/mp/mp_13_0_8_offset.h |    410 +
 .../amd/include/asic_reg/mp/mp_13_0_8_sh_mask.h    |    603 +
 .../amd/include/asic_reg/umc/umc_6_7_0_offset.h    |      6 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |      4 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |     14 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |      4 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |     19 +
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |     10 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |     50 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |     88 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |     20 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |      1 +
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |      9 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |      1 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |      2 +
 drivers/gpu/drm/radeon/atombios_encoders.c         |      3 +-
 include/uapi/drm/amdgpu_drm.h                      |      2 +
 include/uapi/linux/kfd_ioctl.h                     |      2 +-
 156 files changed, 233213 insertions(+), 783 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn316/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn316.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn316.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_6_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_6_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_3_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_3_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_8_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_8_sh_mask.h
