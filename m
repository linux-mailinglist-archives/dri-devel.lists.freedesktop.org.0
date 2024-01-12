Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E40182C51C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 18:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB03810EB46;
	Fri, 12 Jan 2024 17:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AC710E16E;
 Fri, 12 Jan 2024 17:57:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGy1YBVFzi4+J3yzobACTJs16IS/hCTdR0YkuUeQurcxBFZ+s9FzinBrplLhAfOyAP+bpIjlf/vxS+ZC/ycheQiKBBEWjN+Vfyd0T+IeWO6yupU6TbYeXJyobLNi+r3Nw/jC2OcMTVouPhFX/G5XhaBy+N7yNhyI0DGpJsH9WZBQV/8YZhXMJJrhT3Gzv4sdT7NBy/8BIlzWDCNThbpZInjhdVH9zAimpW65/go4iFpfJg1zn2wzyf+sQfn8v96FDiqtQFFpKjNAZyYLPoBHcN0/y7LHZcoJ3/jgF0ZqK8Ajj7RGJiJq/mF1QVPiqMUhz2MoOEWOlkjXiZrx8Zjl9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Bwx+GH/z0JcUlGfk397ZeayxocE174KqkdSkhpXHpM=;
 b=mvcNOmexVa0KyhE1GbNf9tXWcI77eGkB5ThsbHkerIIyfl0EOFWnjTdQ6ANycRxdcRlSeey3Lam5iZgdq2xR6BG0q6k3z9dB2RJ9dgsGtLN3Y7SlCV0xtm+dNdGxWE6mFXdxu5e8jMtExdAm1PolX6n5MOrkGD5RJncyvptwZzdl4Q9BhBSI95OkpX+m8aRt7ebg75cu1qpMWKzNvPXL2HJgYUqxvLiFzJ3DBGg7FKEiCNQKgnuj2puFd1hrTF75QzQ6BzQHG7ciKDyD0AHsRGX9TZEr3g5IVjtjnj+E+yyNHKL9RsPJMACIlTDk+BkFIr9xeFS6t7kX61+gOj6/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Bwx+GH/z0JcUlGfk397ZeayxocE174KqkdSkhpXHpM=;
 b=vzL/L4wGqf/S21v65+w+XbBBshrh0oubSUFR+hTHG2csDTSZ6ZnJ6ak0bSuj3NM93+y6Ee9q+BMgTi8MITlVoWay5QpE0eZzlB5Pf+S1lVyF7Kt4KI7GFDkZKOu1wrR9tEEKj60mnm8xitshSrdypAwswWXpiO1nlb3oaZ9TDss=
Received: from BLAPR03CA0137.namprd03.prod.outlook.com (2603:10b6:208:32e::22)
 by MW3PR12MB4585.namprd12.prod.outlook.com (2603:10b6:303:54::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Fri, 12 Jan
 2024 17:57:11 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::9f) by BLAPR03CA0137.outlook.office365.com
 (2603:10b6:208:32e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Fri, 12 Jan 2024 17:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 17:57:10 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 11:57:09 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.8
Date: Fri, 12 Jan 2024 12:56:56 -0500
Message-ID: <20240112175656.4799-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|MW3PR12MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: c883a52b-8856-4785-b78e-08dc1397e6a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V8akAhFpOryYIQdDTLCQgqKdpy8qPL8IOkrsofAMgjvSBSGF9f8PW+3/Cddd93JcVodDtjSG8qY4/A2rP335Vu+sFqUbGiVIbi05GQKZ9guo50/3t0pCpc1UEAhoWm8kYducf6I77onKeMmOuzDNmKRWYchCKUkBRtwIRWiUEhtlDpQzHzOdGM9DmjV9A1v3H6j6Ai5PVGdOqN4/iLkFNkRwUFG0TChJ9pm7cazyrlebDYg4UqZVgZ9TnXxchETFx4WMkIXvSszUuluPGymE8gZuTyjX1autYQfNLFATnntV2la+AsNed8ZGok4y5YX99m//MU2MVAPKoJmNG6is/qa4geSleagN1lQT2ZYJnQ2hHgGYPuhjLr2p+y5A+iCowgWarWxBIHWVyrL+vc9G8QZWla1MNf40Ehhm76vjQwsW3XublgHkMfORRb5CS4JkKfUeUp3li/zqeo3GDX53ejp56LC3X6t1zopGfVHlLmxZyX8YJSeiDxgLxCjfCToeJafDE8iw/9hMpePHb2itsBU5ljlJusRVe7PP2UPOoh89nolAcO2DxT51MiO68WygGkvEFtA4UTr0EdLYM1FRUM1azxfSHU2VIGIZj4FP5Zi/zx+Vk+oM6V6HBVnwNYlcc9GVIQcgsBbsI+AMnAPqJfqlAAiyDsU6KuVzKTKUIiljny73pDS+UUFClN0OzheZupaQkfQ88E5Hah939IRr5+mm0BnrFBegpp0kjD1/5yswWyypsr119uD7UWxG+wsSyVofOzMWHhFWQv9b4Bh4d+vWiwLwme2go0QL835GgzEKAPfZQL+GIKg6jS72MYfX1c4a6OoHWCZ7arDHozEOlQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230273577357003)(230173577357003)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(16526019)(2616005)(1076003)(478600001)(26005)(966005)(6666004)(7696005)(336012)(47076005)(83380400001)(70206006)(2906002)(70586007)(110136005)(8676002)(316002)(36860700001)(4326008)(8936002)(356005)(86362001)(82740400003)(81166007)(5660300002)(36756003)(41300700001)(426003)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 17:57:10.9646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c883a52b-8856-4785-b78e-08dc1397e6a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4585
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

Fixes for 6.8.

The following changes since commit e54478fbdad20f2c58d0a4f99d01299ed8e7fe9c:

  Merge tag 'amd-drm-next-6.8-2024-01-05' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-01-09 09:07:50 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.8-2024-01-12

for you to fetch changes up to 3b23fd46e2af68b47902caa3f88d60f73c5d85f7:

  drm/amd/pm: Fix smuv13.0.6 current clock reporting (2024-01-11 23:33:37 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.8-2024-01-12:

amdgpu:
- SubVP fixes
- VRR fixes
- USB4 fixes
- DCN 3.5 fixes
- GFX11 harvesting fix
- RAS fixes
- Misc small fixes
- KFD dma-buf import fixes
- Power reporting fixes
- ATHUB 3.3 fix
- SR-IOV fix
- Add missing fw release for fiji
- GFX 11.5 fix
- Debugging module parameter fix
- SMU 13.0.6 fixes

amdkfd:
- Fix lockdep warnings
- Fix sparse __rcu warnings
- Bump interface version so userspace knows that the kernel supports dma-bufs exported from KFD
  Most of the fixes for this went into 6.7, but the last fix is in this PR
- HMM fix
- SVM fix

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: fix avg vs input power reporting on smu7
      drm/amdgpu: fall back to INPUT power for AVG power via INFO IOCTL
      drm/amdgpu/pm: clarify debugfs pm output
      drm/amdgpu: drop exp hw support check for GC 9.4.3

Aric Cyr (1):
      drm/amd/display: 3.2.266

Candice Li (2):
      drm/amdgpu: Drop unnecessary sentences about CE and deferred error.
      drm/amdgpu: Support poison error injection via ras_ctrl debugfs

Charlene Liu (1):
      drm/amd/display: Update z8 latency

Dafna Hirschfeld (1):
      drm/amdkfd: fixes for HMM mem allocation

Daniel Miess (1):
      Revert "drm/amd/display: Fix conversions between bytes and KB"

Felix Kuehling (4):
      drm/amdkfd: Fix lock dependency warning
      drm/amdkfd: Fix sparse __rcu annotation warnings
      drm/amdgpu: Auto-validate DMABuf imports in compute VMs
      drm/amdkfd: Bump KFD ioctl version

George Shen (1):
      drm/amd/display: Disconnect phantom pipe OPP from OPTC being disabled

Hawking Zhang (1):
      drm/amdgpu: Packed socket_id to ras feature mask

Ivan Lipski (1):
      Revert "drm/amd/display: fix bandwidth validation failure on DCN 2.1"

James Zhu (1):
      drm/amdgpu: make a correction on comment

Le Ma (3):
      Revert "drm/amdgpu: add param to specify fw bo location for front-door loading"
      drm/amdgpu: add debug flag to place fw bo on vram for frontdoor loading
      drm/amdgpu: move debug options init prior to amdgpu device init

Lijo Lazar (2):
      drm/amd/pm: Add error log for smu v13.0.6 reset
      drm/amd/pm: Fix smuv13.0.6 current clock reporting

Likun Gao (1):
      drm/amdgpu: correct the cu count for gfx v11

Martin Leung (2):
      drm/amd/display: revert "for FPO & SubVP/DRR config program vmin/max"
      drm/amd/display: revert "Optimize VRR updates to only necessary ones"

Martin Tsai (1):
      drm/amd/display: To adjust dprefclk by down spread percentage

Meenakshikumar Somasundaram (1):
      drm/amd/display: Dpia hpd status not in sync after S4

Melissa Wen (1):
      drm/amd/display: cleanup inconsistent indenting in amdgpu_dm_color

Peichen Huang (1):
      drm/amd/display: Request usb4 bw for mst streams

Philip Yang (1):
      drm/amdkfd: Fix lock dependency warning with srcu

Srinivasan Shanmugam (6):
      drm/amd/powerplay: Fix kzalloc parameter 'ATOM_Tonga_PPM_Table' in 'get_platform_power_management_table()'
      drm/amdgpu: Fix with right return code '-EIO' in 'amdgpu_gmc_vram_checking()'
      drm/amdgpu: Fix unsigned comparison with less than zero in vpe_u1_8_from_fraction()
      drm/amdgpu: Release 'adev->pm.fw' before return in 'amdgpu_device_need_post()'
      drm/amd/display: Fix variable deferencing before NULL check in edp_setup_replay()
      drm/amdkfd: Fix 'node' NULL check in 'svm_range_get_range_boundaries()'

Victor Lu (1):
      drm/amdgpu: Do not program VM_L2_CNTL under SRIOV

Yifan Zhang (3):
      drm/amdgpu: update headers for nbio v7.11
      drm/amdgpu: update ATHUB_MISC_CNTL offset for athub v3.3
      drm/amdgpu: update regGL2C_CTRL4 value in golden setting

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         | 12 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 43 +++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 15 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            | 29 ++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            | 21 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  7 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 26 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 67 +++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             | 14 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            | 10 +--
 drivers/gpu/drm/amd/amdgpu/athub_v3_0.c            |  8 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  5 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           | 10 +--
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |  3 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  3 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  7 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 52 ++++++++--------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |  2 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c | 71 +++++++++++++++++++++-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h | 11 ++++
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 14 +++--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 14 -----
 drivers/gpu/drm/amd/display/dc/dc.h                |  3 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  2 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          | 12 ++--
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |  2 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |  9 ++-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  | 14 +++++
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 11 ++--
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  6 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    | 18 +++---
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  2 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    | 45 ++------------
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |  1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |  3 -
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    | 42 ++++++++++---
 .../gpu/drm/amd/display/dc/link/link_validation.c  | 60 ++++++++++++++----
 .../amd/display/dc/link/protocols/link_dp_dpia.c   | 36 ++++++-----
 .../display/dc/link/protocols/link_dp_dpia_bw.c    | 59 +++++++++++++-----
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |  9 +++
 .../dc/link/protocols/link_edp_panel_control.c     | 11 ++--
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c | 19 ++++--
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c | 12 ++--
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |  2 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |  3 +
 .../display/dc/resource/dcn321/dcn321_resource.c   |  2 +-
 drivers/gpu/drm/amd/display/include/audio_types.h  |  2 +-
 .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |  8 +--
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 28 ++++++---
 .../amd/pm/powerplay/hwmgr/process_pptables_v1_0.c |  2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    | 17 +++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 15 +++--
 include/uapi/linux/kfd_ioctl.h                     |  3 +-
 65 files changed, 634 insertions(+), 302 deletions(-)
