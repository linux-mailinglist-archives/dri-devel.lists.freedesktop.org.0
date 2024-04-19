Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A808AB757
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 00:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F5910E1CB;
	Fri, 19 Apr 2024 22:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oaGXLbz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BDB10E1CB;
 Fri, 19 Apr 2024 22:43:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/D8TV5XP0Fz1b7Iu/mnTs44unChBYWISMAyTQ28P5IDMOjg2JBXsNvLJJMOWbxxaxDBLHkMWqNh0IOzx+KObzvJzOOM20dxtCv/RM3g3Cv79eQOgjoZvgrQe+xbF6qvfBIFWQulXsx/nvVOURLC1ryHj8FNBTEwaAY/ZE1MG6jloFLxMcIgTy1cOItNVg7K2euOYIaRPL+YddhAJObP2C2LAIp87qICcf8HKaJi+uNLxl6o/bbH5UaPCUBgtID7GDy2ZTj0rZ06z/Bz9FMy/BX0nb2Z6h2W6Y176qjxR+L8F+lNIbZeAA8y2oOryFm9DC3wkfyXO4pNlaFc8ufvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C02dnHSbVQ83CojmBzm6zM8qRMlWU5sbFI5wDh5gmkw=;
 b=MzPChdGCjm4KdLwEwApdAEGRDzCRGuZ1fDEgMh+3DTO01fMlWoEF13Gr9SRewVs9nf2p7xkDAtGmRoeptnb7sUnXeiQlLdk5JyTKzNk0tcfEbqIhr7ahtJZsQdSsjMnxTGlYUtBb9zWTLRf9HComCxIVCgaNEv40Mbl2X3sk3ObyHa0JI+ilLccCNgDHbIvpu+VNiO4kfpX2jebws5gjnpgyrpSyROiNpLzMgLeFCDp9701WVICSJ32mAfMAtn4yCGJgeoN3agd+s0vbNd8/3cFsSAwmtVE8CH/oQWIHL5GjHI62GWjOrzW8RCdUkrbZd6SpTIeClrIbLwrBg0gI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C02dnHSbVQ83CojmBzm6zM8qRMlWU5sbFI5wDh5gmkw=;
 b=oaGXLbz0i0oDvL/QSnIBtEFFumem8R6C/9DHV+4z+Rr9/F11t7Mqamd++vTlhYLOaNYs9MjJ9Gi1eu4tezmnXrOgiTu1hbvqwdBQk1cjXa60Nmz9a4P0a771GAUENiI7vSy6Sc3NRowKj/HAUb96Z2m4pOkG10MHb+KY34t1XZI=
Received: from SA1P222CA0146.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::28)
 by SJ2PR12MB8061.namprd12.prod.outlook.com (2603:10b6:a03:4cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Fri, 19 Apr
 2024 22:43:49 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:3c2:cafe::b3) by SA1P222CA0146.outlook.office365.com
 (2603:10b6:806:3c2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.31 via Frontend
 Transport; Fri, 19 Apr 2024 22:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 22:43:49 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 19 Apr
 2024 17:43:48 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.10
Date: Fri, 19 Apr 2024 18:43:32 -0400
Message-ID: <20240419224332.2938259-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SJ2PR12MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c43a0d-b833-48ea-810c-08dc60c22e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Ud2E1F92MR6ohj4/u2nyh+1pdlmif4DQesGxYk9ACmtkRDIkLOF6bMwMoxlFblI57fQfL1x4AWm6wRXRs7GR4wRNK+K7iirOXcIZYIGq61JNqmsvXBAAk3MPd+wJ2T9Z8cKqNM7Pe3w0/D6B1TvTozajjioY42S6zTIGAroVEFEOUc2vF2sjyqaDIFddIS4Wq1BuOTfrUqqAh5BIP6Kep3ijWCfS5QfQhCRI9ryI/23ToNHd/x5BHVsK7FkFgZ9aL8nh/S45jdGkd+CDLVivbJxOiTcEtUpZV5g3xMNOun6p1CtHd/VYVqeQ0p9a7TFPTEaw0m0KrugV6Z6TkPctqF4zFQ3rgvMvFx7bhLvTDbv9IHj9p//n4cU4RRGv7ma+9Sv+nV1rpgKaqAcMuBW6XtFsjmfvAuqeQVvcEfKsOMSpy4Mo8+OcJBp/2/eiKbCMturKV03i3baKa2OZ1jpmz3YEqrmV4HaiTxsXXGk+fazYa0OV/p6ZVU1oRL9CaMEv60U79mzY28wFzlO+MMbtW7SIbDC1xb4tQsNX/FWhKJ2pmHNJMTFOzwVO4EYVIEjISbEuION5FyFwaZhBuWRk2ZgYbl6Vy/DO8iXFld8wrIcsgpZejJkSW5wM8YTN4auONJtTgv9rcJNXc7fqNyl1K+Zb2pjKBU6xXATTpfxsgJ86xRz8LX83o5MySaCbUVS7IvHriySyU/4IKmweqY65Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 22:43:49.0915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c43a0d-b833-48ea-810c-08dc60c22e01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8061
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Sima,

More new stuff for 6.10.

The following changes since commit ab956ed95b8bc4a65c913d7057075866d5fc3724:

  drm/amd/display: Add a function for checking tmds mode (2024-04-12 00:36:47 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.10-2024-04-19

for you to fetch changes up to 81bf14519a8ca17af4f057a125d87fabbae90af3:

  drm/amdkfd: make sure VM is ready for updating operations (2024-04-18 23:54:49 -0400)

----------------------------------------------------------------
amd-drm-next-6.10-2024-04-19:

amdgpu:
- DC resource allocation logic updates
- DC IPS fixes
- DC YUV fixes
- DMCUB fixes
- DML2 fixes
- Devcoredump updates
- USB-C DSC fix
- Misc display code cleanups
- PSR fixes
- MES timeout fix
- RAS updates
- UAF fix in VA IOCTL
- Fix visible VRAM handling during faults
- Fix IP discovery handling during PCI rescans
- Misc code cleanups
- PSP 14 updates
- More runtime PM code rework
- SMU 14.0.2 support
- GPUVM page fault redirection to secondary IH rings for IH 6.x
- Suspend/resume fixes
- SR-IOV fixes

amdkfd:
- Fix eviction fence handling
- Fix leak in GPU memory allocation failure case
- DMABuf import handling fix

radeon:
- Silence UBSAN warnings related to flexible arrays

----------------------------------------------------------------
Ahmad Rehman (1):
      drm/amdgpu: Skip the coredump collection on reset during driver reload

Alex Deucher (4):
      drm/amdgpu/gfx11: properly handle regGRBM_GFX_CNTL in soft reset
      Revert "drm/amd/display: fix USB-C flag update after enc10 feature init"
      drm/radeon: make -fstrict-flex-arrays=3 happy
      drm/radeon: silence UBSAN warning (v3)

Anthony Koo (1):
      drm/amd/display: Expand dmub_cmd operations

Aric Cyr (1):
      drm/amd/display: 3.2.281

Chaitanya Dhere (1):
      drm/amd/display: Fix incorrect pointer assignment

Charlene Liu (1):
      drm/amd/display: limit the code change to ips enabled asic

Christian König (1):
      drm/amdgpu: fix visible VRAM handling during faults

Eric Bernstein (1):
      drm/amd/display: Update FMT settings for 4:2:0

Ethan Bitnun (1):
      drm/amd/display: Improve the log precision

Felix Kuehling (1):
      drm/amdkfd: Fix eviction fence handling

Hawking Zhang (3):
      drm/amdgpu: Load ipkeymgr drv for psp v14
      drm/amdgpu: rename DBG_DRV to HAD_DRV for psp v14
      drm/amdgpu: Use driver mode reset for data poison

Jonathan Kim (1):
      drm/amdgpu: increase mes submission timeout

Joshua Ashton (1):
      drm/amd/display: Set color_mgmt_changed to true on unsuspend

Kenneth Feng (4):
      drm/amd/swsmu: add smu14 ip support
      drm/amd/swsmu: add smu14 driver if file
      drm/amd/swsmu: add smu v14_0_2 ppsmc file
      drm/amd/swsmu: support smu block discovery for smu v14

Lang Yu (1):
      drm/amdkfd: make sure VM is ready for updating operations

Lijo Lazar (1):
      drm/amdgpu: Change AID detection logic

Likun Gao (3):
      drm/amd/swsmu: add pptable header for smu v14_0_2
      drm/amd/swsmu: add smu v14_0_2 support
      drm/amd/swsmu: support SMU_14_0_2 ppt_funcs

Ma Jun (2):
      drm/amdgpu: Fix discovery initialization failure during pci rescan
      drm/amdgpu: refactoring the runtime pm mode detection code

Mikita Lipski (1):
      drm/amd/display: Fix PSR command version passed

Mukul Joshi (1):
      drm/amdgpu: Fix leak when GPU memory allocation fails

Nicholas Kazlauskas (1):
      drm/amd/display: Pass sequential ONO bit to DMCUB boot options

Rodrigo Siqueira (12):
      drm/amd/display: Use dce_version instead of chip_id
      drm/amd/display: Adjust headers
      drm/amd/display: Group scl_data together in resource_build_scaling_params
      drm/amd/display: Replace int with unsigned int
      drm/amd/display: Update some comments to improve the code readability
      drm/amd/display: Remove unnecessary code
      drm/amd/display: Rework dcn10_stream_encoder header
      drm/amd/display: Move REG sequence from program ogam to idle before connect
      drm/amd/display: Update DCN201 link encoder registers
      drm/amd/display: Add missing callback for init_watermarks in DCN 301
      drm/amd/display: Add missing replay field
      Revert "drm/amd/display: Enable cur_rom_en even if cursor degamma is not enabled"

Samson Tam (1):
      drm/amd/display: add support for chroma offset

Sung Joon Kim (3):
      drm/amd/display: Modify resource allocation logic
      drm/amd/display: Enable Z10 flag for IPS FSM
      drm/amd/display: Rework power sequence and resource allocation logic

Sunil Khatri (6):
      drm/amdgpu: add missing vbios version from devcoredump
      drm:amdgpu: enable IH RB ring1 for IH v6.0
      drm:amdgpu: enable IH ring1 for IH v6.1
      drm/amdgpu: add IH_RING1_CFG headers for IH v6.0
      drm/amdgpu: enable redirection of irq's for IH V6.0
      drm/amdgpu: enable redirection of irq's for IH V6.1

Thorsten Blum (1):
      drm/amdgpu: Add missing space to DRM_WARN() message

Yang Wang (1):
      drm/amdgpu: add new aca smu callback func parse_error_code()

Zhigang Luo (1):
      drm/amdgpu: remove virt_init_data_exchange from poison consumption handler

xinhui pan (1):
      drm/amdgpu: validate the parameters of bo mapping operations more clearly

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   84 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |   22 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   15 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   61 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   72 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |    6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   15 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |   26 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |   26 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |    2 -
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |    8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    9 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   10 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    2 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    3 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    8 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    5 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   10 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   16 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |    7 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    2 +
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |    6 -
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |    6 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c   |    9 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.h   |    2 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |   10 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h  |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |   10 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hubp.c    |    5 +
 .../amd/display/dc/dcn201/dcn201_link_encoder.h    |   14 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dccg.h  |   18 -
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |    1 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c   |    2 -
 .../gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.c  |    1 +
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |    8 +-
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.c  |    4 +-
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |    4 +-
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |    8 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |    4 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |    6 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |    5 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   53 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |    1 +
 .../amd/include/asic_reg/oss/osssys_6_0_0_offset.h |    4 +
 .../include/asic_reg/oss/osssys_6_0_0_sh_mask.h    |   10 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    5 +
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0.h   | 1836 ++++++++++++++++++++
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_2_ppsmc.h   |  140 ++
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |    5 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v14_0_2_pptable.h |  164 ++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   13 +
 drivers/gpu/drm/amd/pm/swsmu/smu14/Makefile        |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  117 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 1796 +++++++++++++++++++
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.h   |   28 +
 drivers/gpu/drm/radeon/pptable.h                   |   10 +-
 drivers/gpu/drm/radeon/radeon_atombios.c           |    8 +-
 75 files changed, 4589 insertions(+), 344 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_2_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0_2_pptable.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.h
