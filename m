Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED642470E41
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 23:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8CA10E2A8;
	Fri, 10 Dec 2021 22:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5832C10E2A8;
 Fri, 10 Dec 2021 22:56:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNWJfp4VHMBPA8K8TyxHUlEkcN//oy/RDDQ2s0H7NXi/QYlOPIsTAjoetznX+SVeu5a1JkgLDD7tMZm4O6Q0NF5taV/n72kd4iv3+X9Ud+RhTYd5w1Jw5fdN1b/Xnx4KnHsxL9jzhZr25DBolZ78SwOsR44aEdYfkEuGfp3He3dJQu8/p5JX/ijEvkeI4WaHI5TA+qKdwO55RMLg/RzywQ9V7nyob+Op4k4w+ZSy0vs2xohYwmG/daN+HG51ZTp8G2vEaa+pZNZw61ICOEcw7gOkFr7HF7PlPJM6C28xaAWNxO72zjhMkq0ReNGyxM44eudCk97utThrUWVSPsAtlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycByBgNLd4Wd89F2GNCvOKj/tVb9AwvUHJe0Gss4e7w=;
 b=W7TLKLCED0xfam5/aQBGkaI94hn8FFk589HBTm36MWKGF/72SRDevw12a/xlTueIV/7ewBGVq/AY4dazym/uJ61ehb+y1T2u4ZCrVCEe6Hk9ff7ZwszPum7NuJ8HL/prtJ4/kSjoIM5ABQA4rds5284Mernhr6zbvgUCZHJr/fk7ZUdeYS/wIkp9txqvMDyji/kFIQMmfxPexar4O9XOPjKUj7T/7iV+y8rBA7dqbXqUbpw9jmDtlayibPynByOzoxV7WtQc5al1lE4Ap7AYeldD1yiVGdU460Rx/PSKr3yrf/33h1YyCa40G2KTBCl/Aw/zEsAhlnzLRRLCFK6ang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycByBgNLd4Wd89F2GNCvOKj/tVb9AwvUHJe0Gss4e7w=;
 b=Pw+zl6y32b/RYBzd+2JBg9V0GXB9otdJU7qjUB+2fZG5QfC5bwyH+bFVZU5wSPeH7sGbj+pqiSIdmxtL5PtSwcI3MVRddngj2Fbh5t+vGd8pB25dwyVnRKWgbampgmNhU5/pf0rcFlKB5zvyzspRroUmA1gOmL656YlrZxSNHpY=
Received: from BN6PR16CA0048.namprd16.prod.outlook.com (2603:10b6:405:14::34)
 by DM5PR1201MB0059.namprd12.prod.outlook.com (2603:10b6:4:54::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Fri, 10 Dec
 2021 22:56:35 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::98) by BN6PR16CA0048.outlook.office365.com
 (2603:10b6:405:14::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Fri, 10 Dec 2021 22:56:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Fri, 10 Dec 2021 22:56:32 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 10 Dec
 2021 16:56:31 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-5.17
Date: Fri, 10 Dec 2021 17:56:18 -0500
Message-ID: <20211210225618.5947-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e21361c9-8f82-4145-f94f-08d9bc304fd8
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0059:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0059FBB8EA01635B8AA69D83F7719@DM5PR1201MB0059.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:33;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TCIa8l5RQmLsGrMF6KKl7cI6FWpsdovzq1ubGpObM1Lf00P3bGRFAMR8CBRMLTtJqz+4L9n1fVn2JSTL540jhrCrAxkqPUL97dGChW8wxDEGXuRqj204s/tWE3z4Q5AX6QkLxC503NlbDRU6G6zQ2PpxqUkXcoXJe9CjHUYglTyDN1ULo/TEStav4sOnTAmPeCrCjF3zR8n5Q3Xoy+49mL3x9p5GOzuHSceaEs/A/uop5VFN2rR8ZSdbsmiJ0JbsOslcKpzsb5AexIKhPfDoKuBrAy17/QGgRrRZWbVpDJ4RDIZJHCLe7FvVEUgFNnYpEtlC9Xete7qcd5MJc0uw29fqK/958PqJnxylwtArBJjjlrLGujd6YEP3kREU5vu6bzd9kIWSfNDpCqZEaP6S6JyFpXH9f68QpKNCR32ina7aRSW5Id1Pf8yhg/m1qjoSaMmZBjRHzebFd/CIz7Rdz0WDN5eLwoAWO+I9VZ1NU1tkDgfhWn6wWQz89c9nAAJRyMRPpurGu1YmSe3YYxmJyYtmF/eixgfF80GO1biXOf2CYEHyR9irmN3yYHrM9gIuNcYmw9kYifyfvyNT3YJ0IHUry2sRF4vQqobyNbOUxq/8mI+HA3yyEdNkUdaNNE6V3YZLdVoVdcIXYXFPCJTF/51rZvFkAr26Mph6cTvYGTNxPUMcOQmQ5uSDazLCCv4qgncmGDucILgjAh5gcBWtCRO7MaFCGASD4XryJZwEWl29vEKK/bK6vYbR11fnWPJSijQxc7+Lnjrl+00H2/H/21JrhXww9wvrXFOnHR/TW4A=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(6666004)(4326008)(110136005)(36860700001)(316002)(2906002)(81166007)(336012)(47076005)(86362001)(40460700001)(36756003)(82310400004)(356005)(8676002)(8936002)(83380400001)(186003)(5660300002)(16526019)(26005)(30864003)(966005)(426003)(508600001)(70586007)(2616005)(70206006)(1076003)(7696005)(4001150100001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 22:56:32.3766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e21361c9-8f82-4145-f94f-08d9bc304fd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0059
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

More stuff for 5.17.

The following changes since commit 70897848730470cc477d5d89e6222c0f6a9ac173:

  drm/amdgpu/display: Only set vblank_disable_immediate when PSR is not enabled (2021-12-01 16:00:58 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.17-2021-12-10

for you to fetch changes up to 3c021931023a30316db415044531b116b85e6ebd:

  drm/amdgpu: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi (2021-12-07 13:13:07 -0500)

----------------------------------------------------------------
amd-drm-next-5.17-2021-12-10:

amdgpu:
- warning fixes
- vkms fixes
- Misc code cleanups
- RAS fixes
- IH fixes
- DP to HDMI PCON support
- DSC MST fixes
- LTTPR fixes
- Misc display fixes

amdkfd:
- Misc code cleanups
- Double free fix
- More IP version enumeration changes and cleanups

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: handle SRIOV VCN revision parsing

Anthony Koo (2):
      drm/amd/display: [FW Promotion] Release 0.0.95
      drm/amd/display: [FW Promotion] Release 0.0.96

Aric Cyr (2):
      drm/amd/display: 3.2.164
      drm/amd/display: Reduce stack usage

Brandon Syu (1):
      drm/amd/display: Fix dual eDP abnormal display issue

Christophe JAILLET (2):
      drm/amdkfd: Use bitmap_zalloc() when applicable
      drm/amdkfd: Slighly optimize 'init_doorbell_bitmap()'

Claudio Suarez (3):
      drm/amdgpu: update drm_display_info correctly when the edid is read
      drm/amdgpu: use drm_edid_get_monitor_name() instead of duplicating the code
      drm/amdgpu: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi

Dale Zhao (1):
      drm/amd/display: add hdmi disable debug check

Darren Powell (2):
      amdgpu/pm: Create shared array of power profile name strings
      amdgpu/pm: Modify implmentations of get_power_profile_mode to use amdgpu_pp_profile_name

Evgenii Krasnikov (1):
      drm/amd/display: add function for eDP and backlight power on

Fangzhi Zuo (2):
      drm/amd/display: Add DP-HDMI FRL PCON SST Support in DM
      drm/amd/display: Add DP-HDMI FRL PCON Support in DC

Flora Cui (5):
      drm/amdgpu: cancel the correct hrtimer on exit
      drm/amdgpu: fix vkms crtc settings
      drm/amdgpu: check atomic flag to differeniate with legacy path
      drm/amdgpu: drop the critial WARN_ON in amdgpu_vkms
      drm/amdgpu: free vkms_output after use

George Shen (5):
      drm/amd/display: Add vendor specific LTTPR workarounds for DCN31
      drm/amd/display: Skip vendor specific LTTPR w/a outside link training
      drm/amd/display: Add 16ms AUX RD interval W/A for specific LTTPR
      drm/amd/display: Apply LTTPR workarounds to non-transparent mode
      drm/amd/display: Add W/A for PHY tests with certain LTTPR

Graham Sider (3):
      drm/amdkfd: replace asic_name with amdgpu_asic_name
      drm/amdkfd: add kfd_device_info_init function
      drm/amdkfd: remove hardcoded device_info structs

Guchun Chen (2):
      drm/amdgpu: declare static function to fix compiler warning
      drm/amdgpu: fix the missed handling for SDMA2 and SDMA3

Jane Jian (1):
      drm/amdgpu/sriov/vcn: add new vcn ip revision check case for SIENNA_CICHLID

Jarif Aftab (1):
      drm/amd/display: Added Check For dc->res_pool

Jiapeng Chong (1):
      drm/amd/display: Fix warning comparing pointer to 0

Jimmy Kizito (1):
      drm/amd/display: Add work around for tunneled MST.

Jude Shih (1):
      drm/amd/display: Move link_enc init logic to DC

Lijo Lazar (3):
      drm/amd/pm: Add warning for unexpected PG requests
      drm/amdgpu: Use MAX_HWIP instead of HW_ID_MAX
      drm/amdgpu: Don't halt RLC on GFX suspend

Lv Ruyi (1):
      drm/amd/display: fix application of sizeof to pointer

Meenakshikumar Somasundaram (2):
      drm/amd/display: Fix for otg synchronization logic
      drm/amd/display: Adding dpia debug bits for hpd delay

Michael Strauss (1):
      drm/amd/display: Add force detile buffer size debug flag

Mikita Lipski (2):
      drm/amd/display: PSR panel capability debugfs
      drm/amd/display: prevent reading unitialized links

Mustapha Ghaddar (1):
      drm/amd/display: Fix for the no Audio bug with Tiled Displays

Nicholas Kazlauskas (4):
      drm/amd/display: Allow DSC on supported MST branch devices
      drm/amd/display: Fix DPIA outbox timeout after S3/S4/reset
      drm/amd/display: Query DMCUB for dp alt status
      drm/amd/display: Fix out of bounds access on DNC31 stream encoder regs

Oliver Logush (1):
      drm/amd/display: Rename a struct field to describe a cea component better

Perry Yuan (1):
      drm/amd/display: add connector type check for CRC source set

Philip Yang (5):
      drm/amdgpu: handle IH ring1 overflow
      drm/amdkfd: set "r = 0" explicitly before goto
      drm/amdkfd: fix double free mem structure
      drm/amdkfd: process_info lock not needed for svm
      drm/amdkfd: err_pin_bo path leaks kfd_bo_list

Shen, George (1):
      drm/amd/display: Clear DPCD lane settings after repeater training

Stanley.Yang (4):
      drm/amdgpu: fix disable ras feature failed when unload drvier v2
      drm/amdgpu: skip query ecc info in gpu recovery
      drm/amdgpu: only skip get ecc info for aldebaran
      drm/amdgpu: skip umc ras error count harvest

Stylon Wang (1):
      drm/amd/display: Enable P010 for DCN3x ASICs

Vlad Zahorodnii (1):
      drm/amd/display: Use oriented source size when checking cursor scaling

Wayne Lin (1):
      drm/amd/display: Fix bug in debugfs crc_win_update entry

Wenjing Liu (1):
      drm/amd/display: add a debug option to force dp2 lt fallback method

Wyatt Wood (1):
      drm/amd/display: Prevent PSR disable/reenable in HPD IRQ

Yann Dirson (1):
      drm/amdgpu: update fw_load_type module parameter doc to match code

Zhou Qingyang (2):
      drm/amdgpu: Fix a NULL pointer dereference in amdgpu_connector_lcd_native_mode()
      drm/radeon/radeon_kms: Fix a NULL pointer dereference in radeon_driver_open_kms()

chen gong (1):
      drm/amdkfd: Correct the value of the no_atomic_fw_version variable

shaoyunl (1):
      drm/amdgpu: adjust the kfd reset sequence in reset sriov function

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |  55 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |  57 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h           |   5 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |   6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   7 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   1 -
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            | 744 +++++----------------
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |  18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c             |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  13 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  15 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  18 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  99 ++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |   8 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  49 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  50 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  20 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  47 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  31 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 408 ++++++++++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  78 ++-
 drivers/gpu/drm/amd/display/dc/dc.h                |  27 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  31 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   3 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   9 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   1 +
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |   5 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  16 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |   5 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   2 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   2 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   4 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   2 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   2 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   2 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |  97 +--
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  13 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   2 +-
 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c   |   4 +-
 .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   1 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |   2 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |  11 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  35 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   4 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  10 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   9 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  14 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  12 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  10 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  10 +-
 drivers/gpu/drm/radeon/radeon_kms.c                |  36 +-
 85 files changed, 1338 insertions(+), 1016 deletions(-)
