Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C0961A2D1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 21:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7E610E834;
	Fri,  4 Nov 2022 20:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0789310E832;
 Fri,  4 Nov 2022 20:58:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BttXMoHSoswH967d/1S6sbJzTaKTWUueZnGpy1fNTELnr9mPXmSk1tcrhJNGTor8bZ7jCY8KewQate7NTPcG3cYEK4KV+kGxa8IAoND46wETtoBnddSJaT8HM9NLC4pVD1T/YgArRrs/HmN9ed1f5UGnIvAePoRKiyDbmSaUQaaVy0xojbAHBE3q3bd/PT7AJmx/o7Y24pwlmQY/+3sAi5DrzxownnsO/Lvt4qy3IbR4XrqBuNJZ3kBztMe7dqGFd9DdCKJlMhRs+RQSZmQaTSyML8/JaYvyFGhNzxwV5Vl57D1n8NUVGK13WL8W3n/Dc8NJSAkbZFg/CZtFLvtStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtZN0C7HCcb9Hp/prFuNICRFDHHxmnBtnG/o7eq+yIU=;
 b=FoWHBEtPxLEFU5jHH8nfyYGNFy+12sPYwy9asUDV0uWzxVzxpprIk1fv24IPhDLUaO+u1cIRYOc+dXye0rV/hX5qzOGV9NrdCiMn7Gp+GJHg2xwL8sk4+r7SitBqobnN1vO+yeglLdSC+jacVsez8tkjFH9Ifh4iJpGgj7hsGUJ7QVXQQLHuTIgtcxQEmpzrZZYQn6bptXuIm0qYdNIgA2spbuqdzZ724VQLsvvuQObzWiD2TDCkYGIV1Zhs08WcJUXR2YOSMqPjrceJPyC8Ydul+4MT4qGhD5kng/e4dPnr8GZbIVRbW/hzav3OxrwLW7KGk1lCMbMnwnfMx/q2aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtZN0C7HCcb9Hp/prFuNICRFDHHxmnBtnG/o7eq+yIU=;
 b=Zl1kXqhodKtIprSw2zCkmRAt3oRiTVul3qdWrOzCIHp+Yh3CTQFvySE+a2DFh88SN7TvuayRwfBAsusPAjghm3KRPhP7YT3A08+rIKsbr5NLKJ7htlGy+c48JCEvzvQJYF3lsYlnb1F3mWJy50mvxt3TIbJ2Szqp2uR5H0G9Qhs=
Received: from BN0PR04CA0160.namprd04.prod.outlook.com (2603:10b6:408:eb::15)
 by MN2PR12MB4064.namprd12.prod.outlook.com (2603:10b6:208:1d3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 20:58:41 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::1d) by BN0PR04CA0160.outlook.office365.com
 (2603:10b6:408:eb::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 20:58:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 20:58:41 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 4 Nov
 2022 15:58:40 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon, drm drm-next-6.2
Date: Fri, 4 Nov 2022 16:58:27 -0400
Message-ID: <20221104205827.6008-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT050:EE_|MN2PR12MB4064:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d9b4ac-f413-4214-8eca-08dabea75a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EJLG2bMvw9G0sSt8LYtWcl4dAbOOrE/o8GKcRvQaWfWGNw7rfhwPcE3bCclZHznPBp2O6ZBCrzS001eJZh4jqtQw0mEuJWZci3hZF22N83svAPpKn+XYSr57C0+Kqe7UterbVjqp4YfKzxDqd5P2KYg3rVdKhG/Su6oVDLYex6O+270lkN0hRx+lNC1r0NRcCGN/way0Vasm3bavOsmXCO3VwCx2U9BH9g28tdeWeayW54bPPMyAoz2FGalyZ2hw6D156CjZLBIUbLbXd+HT3GReZRSsnstHI2yaPxl+6aOR1xV6E5XVk/ZfSUWaxJfA1gfanUYVdGLUaVWuUPeMWjMXzGJnaHFBdNk2GKxDSjLM77Lm2JV3k8MU3TTQW9SScO5Tg8Tcl3GAXIHA2yVSl6lTzvbsB+d40L7DeCJYSP955IUztpi2VZzMrPojQgaejTQNkqnasuodE4AMjhcovTSy1/YFZ4L3bEi+2948xZnTzReT9LLse4fCnaS/wgrthozWU3e4RCZBuRjn79ircr4SWVESRbCnyzYDvALbGBvabH7n8kBFldJyyX9COr5Qn3yNrbmzT5tevkMjFCqflQ8fav3NaafN7fh+KcUpgprAXT+9W4S835hvmX3Q62faBEtjV/o0MWmJ+iIN/YfNEfivJ35bGMCoHTDXzF6XTzSGBgrEU0Hbge2DIaLSTG3FuzNx1muhD0BnhOKWoV0ugv8WVCry7QIxcjSL4VtWip/yr3K/WeR1bndhU4YuOr+G
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(2906002)(4001150100001)(40460700003)(8936002)(70206006)(7696005)(5660300002)(26005)(41300700001)(110136005)(316002)(8676002)(4326008)(36756003)(81166007)(86362001)(30864003)(83380400001)(82310400005)(478600001)(6666004)(336012)(66574015)(70586007)(2616005)(426003)(966005)(82740400003)(47076005)(40480700001)(356005)(36860700001)(16526019)(186003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 20:58:41.1691 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d9b4ac-f413-4214-8eca-08dabea75a6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
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

New stuff for 6.2.

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.2-2022-11-04

for you to fetch changes up to fcf00f8d29f2fc6bf00531a1447be28b99073cc3:

  drm/amdkfd: Remove skiping userptr buffer mapping when mmu notifier marks it as invalid (2022-11-04 16:05:54 -0400)

----------------------------------------------------------------
amd-drm-next-6.2-2022-11-04:

amdgpu:
- Add TMZ support for GC 11.0.1
- More IP version check conversions
- Mode2 reset fixes for sienna cichlid
- SMU 13.x fixes
- RAS enablement on MP 13.x
- Replace kmap with kmap_local_page()
- Misc Clang warning fixes
- SR-IOV fixes for GC 11.x
- PCI AER fix
- DCN 3.2.x commit sequence rework
- SDMA 4.x doorbell fix
- Expose additional new GC 11.x firmware versions
- Misc code cleanups
- S0i3 fixes
- More DC FPU cleanup
- Add more DC kerneldoc
- Misc spelling and grammer fixes
- DCN 3.1.x fixes
- Plane modifier fix
- MCA RAS enablement
- Secure display locking fix
- RAS TA rework
- RAS EEPROM fixes
- Fail suspend if eviction fails
- Drop AMD specific DSC workarounds in favor of drm EDID quirks
- SR-IOV suspend/resume fixes
- Enable DCN support for ARM
- Enable secure display on DCN 2.1

amdkfd:
- Cache size fixes for GC 10.3.x
- kfd_dev struct cleanup
- GC11.x CWSR trap handler fix
- Userptr fixes
- Warning fixes

radeon:
- Replace kmap with kmap_local_page()

UAPI:
- Expose additional new GC 11.x firmware versions via the existing INFO query

drm:
- Add some new EDID DSC quirks

----------------------------------------------------------------
Alan Liu (3):
      drm/amd/display: Implement secure display on DCN21
      drm/amd/display: Drop struct crc_region and reuse struct rect
      drm/amdgpu: Move the mutex_lock to protect the return status of securedisplay command buffer

Alex Deucher (6):
      drm/amdgpu: convert vega20_ih.c to IP version checks
      drm/amdgpu: convert amdgpu_amdkfd_gpuvm.c to IP version checks
      drm/amdgpu: fix sdma doorbell init ordering on APUs
      drm/amdgpu/gfx9: set gfx.funcs in early init
      drm/amdgpu/gfx10: set gfx.funcs in early init
      drm/amdgpu/gfx11: set gfx.funcs in early init

Alvin Lee (4):
      drm/amd/display: Don't return false if no stream
      drm/amd/display: Remove optimization for VRR updates
      drm/amd/display: Enable timing sync on DCN32
      drm/amd/display: Don't enable ODM + MPO

Anthony Koo (2):
      drm/amd/display: Document part of the DMUB cmd
      drm/amd/display: [FW Promotion] Release 0.0.141.0

Ao Zhong (3):
      drm/amd/display: move remaining FPU code to dml folder
      drm/amd/display: move remaining FPU code to dml folder
      drm/amd/display: add DCN support for ARM64

Aric Cyr (4):
      drm/amd/display: 3.2.208
      drm/amd/display: Fix SDR visual confirm
      drm/amd/display: 3.2.209
      drm/amd/display: 3.2.210

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Fix for BO move issue

Asher Song (1):
      drm/amdgpu: Revert "drm/amdgpu: getting fan speed pwm for vega10 properly"

Bhawanpreet Lakha (1):
      drm/amd/display: Fix HDCP 1.X 1A-04 failing

Candice Li (5):
      drm/amdgpu: Optimize RAS TA initialization and TA unload funcs
      drm/amdgpu: Optimize TA load/unload/invoke debugfs interfaces
      drm/amdgpu: Update ras eeprom support for smu v13_0_0 and v13_0_10
      drm/amdgpu: Add EEPROM I2C address support for ip discovery
      drm/amdgpu: Enable GFX RAS feature for gfx v11_0_3

Charlene Liu (2):
      drm/amd/display: Update DML formula
      drm/amd/display: Fix null pointer issues found in emulation

Chengming Gui (1):
      drm/amdgpu: fix pstate setting issue

Danijel Slivka (1):
      drm/amdgpu: set vm_update_mode=0 as default for Sienna Cichlid in SRIOV case

David Francis (1):
      drm/amd: Add IMU fw version to fw version queries

Deming Wang (1):
      drm/amdkfd: use vma_lookup() instead of find_vma()

Dillon Varone (4):
      drm/amd/display: Update latencies on DCN321
      drm/amd/display: Set memclk levels to be at least 1 for dcn32
      drm/amd/display: Reinit DPG when exiting dynamic ODM
      drm/amd/display: Check validation passed after applying pipe split changes

Dmytro Laktyushkin (1):
      drm/amd/display: correctly populate dcn315 clock table

Eric Bernstein (1):
      drm/amd/display: Include virtual signal to set k1 and k2 values

Evan Quan (3):
      drm/amd/pm: fulfill SMU13.0.0 cstate control interface
      drm/amd/pm: fulfill SMU13.0.7 cstate control interface
      drm/amd/pm: disable cstate feature for gpu reset scenario

Fabio M. De Francesco (2):
      drm/radeon: Replace kmap() with kmap_local_page()
      drm/amd/amdgpu: Replace kmap() with kmap_local_page()

Fangzhi Zuo (3):
      drm/amd/display: Add UHBR135 and UHBR20 into debugfs
      drm/amd/display: Ignore Cable ID Feature
      drm/amd/display: Filter Invalid 420 Modes for HDMI TMDS

Gavin Wan (1):
      drm/amdgpu: Disable GPU reset on SRIOV before remove pci.

George Shen (4):
      drm/amd/display: Fix DCN32 DSC delay calculation
      drm/amd/display: Use forced DSC bpp in DML
      drm/amd/display: Round up DST_after_scaler to nearest int
      drm/amd/display: Add DSC delay factor workaround

Graham Sider (4):
      drm/amdgpu: correct MES debugfs versions
      drm/amdgpu: remove deprecated MES version vars
      drm/amdgpu: disable GFXOFF during compute for GFX11
      drm/amdgpu: extend halt_if_hws_hang to MES

Guenter Roeck (1):
      drm/amd/display: Increase frame size limit for display_mode_vba_util_32.o

Haiyi Zhou (1):
      drm/amd/display: wait for vblank during pipe programming

Hamza Mahfooz (5):
      drm/amd/display: add an ASSERT() to irq service functions
      drm/edid: add a quirk for two LG monitors to get them to work on 10bpc
      drm/amd/display: use max_dsc_bpp in amdgpu_dm
      Revert "drm/amd/display: Limit max DSC target bpp for specific monitors"
      drm/amd/display: drop vblank_lock from struct amdgpu_display_manager

Hawking Zhang (4):
      drm/amdgpu: extend HWIP_MAX_INSTANCE to 28
      drm/amdgpu: update psp_fw_type enum in amdgpu_ucode header
      drm/amdgpu: move convert_error_address out of umc_ras
      drm/amdgpu: switch to select_se_sh wrapper for gfx v9_0

Ian Chen (1):
      drm/amd/display: Refactor eDP PSR codes

Iswara Nagulendran (1):
      drm/amd/display: Modify checks to enable TPS3 pattern when required

Jay Cornwall (1):
      drm/amdkfd: update GFX11 CWSR trap handler

Jesse Zhang (1):
      drm/amdkfd: correct the cache info for gfx1036

Jiapeng Chong (2):
      drm/amd/display: make wake_up_aux_channel static
      drm/amd/display: Modify mismatched function name

Jiri Slaby (SUSE) (1):
      drm/amd/display (gcc13): fix enum mismatch

Joaquín Ignacio Aramendía (1):
      drm/amd/display: Revert logic for plane modifiers

Jun Lei (1):
      drm/amd/display: Limit dcn32 to 1950Mhz display clock

Kenneth Feng (8):
      drm/amd/pm: temporarily disable thermal alert on smu_v13_0_10
      drm/amd/pm: remove the pptable id override on smu_v13_0_10
      drm/amd/amdgpu: enable gfx clock gating features on smu_v13_0_10
      drm/amd/pm: skip loading pptable from driver on secure board for smu_v13_0_10
      drm/amd/pm: enable thermal alert on smu_v13_0_10
      drm/amd/pm: update driver-if header for smu_v13_0_10
      drm/amd/pm: allow gfxoff on gc_11_0_3
      drm/amd/amdgpu: temporary workaround to skip ras error for gc_v11_0_3

Leo Chen (2):
      drm/amd/display: Update DSC capabilitie for DCN314
      drm/amd/display: Add a debug option HBR2CP2520 over TPS4

Lewis Huang (1):
      drm/amd/display: refine wake up aux in retrieve link caps

Lijo Lazar (1):
      drm/amdgpu: Remove ATC L2 access for MMHUB 2.1.x

Likun Gao (1):
      drm/amdgpu: skip mes self test for gc 11.0.3

Ma Hanghong (1):
      drm/amd/display: Wrong colorimetry workaround

Ma Jun (2):
      drm/amdkfd: Remove unused variable
      drm/amdkfd: Fix the warning of array-index-out-of-bounds

Mario Limonciello (1):
      drm/amd: Fail the suspend if resources can't be evicted

Martin Leung (1):
      drm/amd/display: Stop waiting for vblank during pipe programming

Max Tseng (1):
      drm/amd/display: cursor update command incomplete

Mukul Joshi (1):
      drm/amdkfd: Cleanup kfd_dev struct

Nathan Chancellor (3):
      drm/amdkfd: Fix type of reset_type parameter in hqd_destroy() callback
      drm/amdgpu: Fix type of second parameter in trans_msg() callback
      drm/amdgpu: Fix type of second parameter in odn_edit_dpm_table() callback

Nevenko Stupar (1):
      drm/amd/display: Investigate tool reported FCLK P-state deviations

Paulo Miguel Almeida (4):
      drm/amdkfd: remove unused kfd_pm4_headers_diq header file
      drm/amdkfd: remove unused struct cdit_header
      drm/radeon: Replace one-element array with flexible-array member
      drm/amdgpu: Replace one-element array with flexible-array member

Peng Ju Zhou (1):
      drm/amdgpu: Remove unnecessary register program in SRIOV

Prike Liang (3):
      drm/amdkfd: update gfx1037 Lx cache setting
      drm/amdkfd: introduce dummy cache info for property asic
      drm/amdgpu: disallow gfxoff until GC IP blocks complete s2idle resume

Rafael Mendonca (2):
      drm/amdgpu/powerplay/psm: Fix memory leak in power state init
      drm/amdkfd: Fix memory leak in kfd_mem_dmamap_userptr()

Rodrigo Siqueira (21):
      drm/amd/display: Check if link state is valid
      drm/amd/display: Rework context change check
      drm/amd/display: Enable new commit sequence only for DCN32x
      drm/amd/display: Copy DC context in the commit streams
      drm/amd/display: Include surface of unaffected streams
      drm/amd/display: Handle virtual hardware detect
      drm/amd/display: Add function for validate and update new stream
      drm/amd/display: Handle seamless boot stream
      drm/amd/display: Update OTG instance in the commit stream
      drm/amd/display: Avoid ABM when ODM combine is enabled for eDP
      drm/amd/display: Use update plane and stream routine for DCN32x
      drm/amd/display: Remove wrong pipe control lock
      drm/amd/display: Remove FPU guards from the DML folder
      drm/amd/display: Convert documentation to a kernel-doc
      drm/amd/display: Add events log to trace OPTC lock and unlock
      drm/amd/display: Expand kernel doc for DC
      drm/amd/display: Add DEC/CRB basic doc
      drm/amd/display: Add basic ODM description
      drm/amd/display: Add kernel doc to some of the dc fields
      drm/amd/display: Add kernel doc for commit sequence
      drm/amd/display: Rework comments on dc file

Taimur Hassan (1):
      drm/amd/display: Remove rate check from pixel rate divider update

Tao Zhou (4):
      drm/amdgpu: add RAS page retirement functions for MCA
      drm/amdgpu: use page retirement API in MCA notifier
      drm/amdgpu: add RAS poison handling for MCA
      drm/amdgpu: remove ras_error_status parameter for UMC poison handler

Tim Huang (2):
      drm/amd/pm: update SMU IP v13.0.4 driver interface version
      drm/amd/pm: add SMU IP v13.0.4 IF version define to V7

Victor Zhao (4):
      Revert "drm/amdgpu: add debugfs amdgpu_reset_level"
      Revert "drm/amdgpu: let mode2 reset fallback to default when failure"
      drm/amdgpu: Refactor mode2 reset logic for v11.0.7
      drm/amdgpu: fix for suspend/resume sequence under sriov

Wenjing Liu (3):
      drm/amd/display: refactor enable/disable audio stream hw sequence
      drm/amd/display: move stream encoder audio setup to link_hwss
      drm/amd/display: remove audio mute control in hpo dp

Xiaogang Chen (1):
      drm/amdkfd: Remove skiping userptr buffer mapping when mmu notifier marks it as invalid

Yang Li (1):
      drm/amdkfd: Fix NULL pointer dereference in svm_migrate_to_ram()

Yang Yingliang (1):
      drm/amdgpu/si_dma: remove unused variable in si_dma_stop()

YiPeng Chai (3):
      drm/amdgpu: Enable gmc soft reset on gmc_v11_0_3
      drm/amdgpu: Enable ras support for mp0 v13_0_0 and v13_0_10
      drm/amdgpu: Add sriov vf ras support in amdgpu_ras_asic_supported

Yifan Zha (4):
      drm/amdgpu: Program GC registers through RLCG interface in gfx_v11/gmc_v11
      drm/amdgpu: Skip access GRBM_CNTL under SRIOV on gfx_v11
      drm/amdgpu: Skip access SDMA0_F32_CNTL in sdma_v6_0_enable under SRIOV
      drm/amdgpu: Skip program gfxhub_v3_0_3 system aperture registers under SRIOV

Yifan Zhang (3):
      drm/amdgpu: add tmz support for GC 11.0.1
      drm/amdgpu: allow secure submission on gfx11 and sdma6
      drm/amdgpu: set fb_modifiers_not_supported in vkms

Yiqing Yao (3):
      drm/amdgpu: Adjust MES polling timeout for sriov
      drm/amdgpu: Clean up soc21 early init for SRIOV
      drm/amdgpu: Disable MCBP from soc21 for SRIOV

YuBiao Wang (2):
      drm/amdgpu: dequeue mes scheduler during fini
      drm/amdgpu: skip mes self test for gc 11.0.3 in recover

ZhenGuo Yin (1):
      drm/amd/pm: Init pm_attr_list when dpm is disabled

gehao (1):
      drm/amd/display: prevent memory leak

ruanjinjie (3):
      drm/amd/display: Make some symbols static
      drm/amd/display: make dcn32_mmhubbub_funcs static
      drm/amd/display: make dcn32_mpc_funcs static

wangjianli (2):
      amd/amdgpu: fix repeated words in comments
      drm/radeon: fix repeated words in comments

zhikzhai (1):
      drm/amd/display: skip commit minimal transition state

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  54 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  57 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         | 217 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.h         |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  56 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |  14 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |  87 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   1 +
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |   7 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  41 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  34 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |   3 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |   3 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  18 +-
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  62 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |  28 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |   1 -
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   1 -
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |   1 -
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   5 -
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |   2 -
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |  25 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  21 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  19 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |   7 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.h              |   4 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   6 +-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 764 +++++++++++----------
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |   6 +
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              | 476 ++++++-------
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |  36 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  16 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c             |  29 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h   | 291 --------
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          | 270 +++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |   6 +-
 drivers/gpu/drm/amd/display/Kconfig                |   3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  89 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   7 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  | 157 +++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |  12 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  57 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  35 -
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  11 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  50 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h    |  64 ++
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     |   6 +
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h        |   4 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |  71 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  11 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 486 ++++++++-----
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  13 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   6 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 162 ++---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 256 ++++++-
 drivers/gpu/drm/amd/display/dc/dc.h                |  92 +--
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       | 124 ++--
 drivers/gpu/drm/amd/display/dc/dc_link.h           |  22 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  23 +-
 drivers/gpu/drm/amd/display/dc/dc_trace.h          |   2 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   7 +
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |  14 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   6 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  72 +-
 .../gpu/drm/amd/display/dc/dce60/dce60_resource.c  |   3 +
 .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |   2 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |   5 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |  44 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |   4 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  48 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  16 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   9 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |  15 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |  14 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |  13 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c   |  13 -
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h   |   4 -
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |   9 -
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   6 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   6 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |   2 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   8 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   6 +
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |   6 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |   4 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   6 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |   2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   7 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |  22 +-
 drivers/gpu/drm/amd/display/dc/dml/dc_features.h   |   7 +
 .../gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c   |  36 +
 .../gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h   |   2 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   3 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |   2 -
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   3 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |   3 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  39 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |   3 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  10 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   7 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   3 +-
 .../display/dc/dml/dcn32/display_rq_dlg_calc_32.c  |   4 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |  15 +-
 .../drm/amd/display/dc/dml/display_mode_enums.h    |  25 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |   3 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |   2 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |   9 +
 drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h |  36 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |  61 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |  15 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h       |  16 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |   7 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |   6 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |   5 +
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |   5 +
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |  17 +-
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.c    |  52 ++
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.h    |   4 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dpia.c   |   3 +
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |  25 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  43 ++
 .../drm/amd/display/modules/inc/mod_info_packet.h  |   3 +-
 .../amd/display/modules/info_packet/info_packet.c  |   6 +-
 drivers/gpu/drm/amd/include/atombios.h             |   2 +-
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |   5 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   3 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   4 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   3 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c    |   2 +
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    |  25 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   4 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h | 111 ++-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_4.h |  17 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   8 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   9 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  13 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  11 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  12 +
 drivers/gpu/drm/drm_edid.c                         |  12 +
 drivers/gpu/drm/radeon/atombios.h                  |   2 +-
 drivers/gpu/drm/radeon/radeon_atombios.c           |   7 +-
 drivers/gpu/drm/radeon/radeon_device.c             |   2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |   4 +-
 include/drm/drm_connector.h                        |   6 +
 include/uapi/drm/amdgpu_drm.h                      |   2 +
 187 files changed, 3407 insertions(+), 2440 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h
