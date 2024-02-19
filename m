Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD7B85AE01
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 22:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AB610E166;
	Mon, 19 Feb 2024 21:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="opV7HV4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B67F10E157;
 Mon, 19 Feb 2024 21:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffojUBqDP5v+1VV908dafGeF13e+Ulk6UrRT83n857JuNTkmDVhcaR9qs7ZwgOF6W2mDFvrEmtHgeON4AkvPwH67Tl3b2MjMrG9D/0Lm0OsEaGd9R5EM0Y9L11daLXkd6cx2frPAbb8TvVAsZa0MVjMT+GccRSpXfk8eEIJhV5A+DSNhsDh20GAkGJan02Ps1sPcqpqignEVij3AedROuJnJqoQSffH8lrt0YmLO0dttDy/7byxmu5knwvOG7kEcLVOmpdlauVPSR1icMKtxP4xRTOHWJSZmFdJG4xSBpANw/xdfCZpui21/r9upiOLDkxSBSR6DtkvOox0WfT/q0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAn6QZCCjakM3O3okMDm8omoChcnL7IdWwsT7bkoWAM=;
 b=JkOmeteCSyVpqhpHRkEBQbVQY2/kBwlqTl1DTIfXaMkrbrIFgBUzdczy9Ve5xuTFFMnn8jEe03NT1kjkIIyL/DmMDiBQccnIaXA3MxtslN/dqzCzu1MxJMAUU1JT5JF4SA0a6fW2HLK4N51wuRJRACn1uVbuGiQwBR6o9t2HRjHAqgqBhVrgdMj4lgKirKxSPBhPOERDDDanBgIXhVIk47kfoYfBsD16gZId4Cy0ZY2NZerNtzn3hfWkV0XMbyNbe3zzSz9nZfhLAnMPk1yfYBfaoikAHCP7+EqMlqwXhJuD4+EGpkE1G8wkiQi8tbcG/G1AJzAJYxDBCVsKjWGzNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAn6QZCCjakM3O3okMDm8omoChcnL7IdWwsT7bkoWAM=;
 b=opV7HV4+ijA97zC4sSYCcMRet1PSEYL9Y1W/uODBsZrbocdLuIbtnmldBtvrQzUJlWEAKCbEd1AcFcGyzlnba4W3SZack4I+oCEdxBdS40XnG6vDHBZ1tyjicnbKFRxphCGE83S+ROEYyzSu9XV/HgzU8BEKL1oTS7vsBDngsH8=
Received: from DS7PR03CA0091.namprd03.prod.outlook.com (2603:10b6:5:3b7::6) by
 BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Mon, 19 Feb
 2024 21:48:29 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::3c) by DS7PR03CA0091.outlook.office365.com
 (2603:10b6:5:3b7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39 via Frontend
 Transport; Mon, 19 Feb 2024 21:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 19 Feb 2024 21:48:28 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 19 Feb
 2024 15:48:27 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.9
Date: Mon, 19 Feb 2024 16:48:10 -0500
Message-ID: <20240219214810.4911-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|BY5PR12MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cefd43c-11d5-4e85-a276-08dc3194823f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CeyVfqselsRrqZvLxWEzzahtz3tzZPTXpRWrrOIul4rHrUPXV+FhY4Eh7f1tb0YH0Iax502KuPOdg97/bJUcSZfNN9Cz2+kfElUC9/lG3FCwDIEA4aIvL5HNsNKwW+skO1MG+bvR9FrOziT/Bak0aysr5q4VGMo0893qHgwMuEVqCrShC0TgSobQ8pVsK3c4NgwhjsPQt7XyZs4r+NaU8KgV/bai5pPxSWVckKLEcon/o9dTT46o8VjweRKhkAyOSfP66rTHp9/UbodDx0AkWiHKA+BPGtBicwS840GEDGfHHGXS4VHzUYuAlQ5QtSxjHAJPa7Y/UBzTqDyUVysOl+88/hkJ1e3+JSMTpOtrXIz8l5N/70TYFkXgaGN0X9VInhRPwl2s/VnKZTcVImBTT0MlYpB0DABzEA+a67kzWcHmMBZT+i8bzrvXU6XZd0m9S7Z2lSEDBpI+P3nI53k75CjttD8QlN02JCyT9GlIUZEdYbJU6vGPVytUFKwVaqqtoo2FiRUhWzDjiXM2tQgFnbaLG8pnYojkTcs/ENRKxCgSJKXFrGGQloc3n9FhswNXJvWS+IFWKi/ZXGSBOIpmbeT/8qlyfcz9Egcyi4BisgSmApuK1//ZT01rUnsyCCBF
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(46966006)(40470700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 21:48:28.9115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cefd43c-11d5-4e85-a276-08dc3194823f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035
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

More new stuff for 6.9.

The following changes since commit d5597444032b2f5c8624918fb5b29be5bba78a3c:

  drm/amdgpu: Fix HDP flush for VFs on nbio v7.9 (2024-02-07 12:26:24 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.9-2024-02-19

for you to fetch changes up to 31e0a586f3385134bcad00d8194eb0728cb1a17d:

  drm/amdgpu: add MMHUB 3.3.1 support (2024-02-19 14:50:46 -0500)

----------------------------------------------------------------
amd-drm-next-6.9-2024-02-19:

amdgpu:
- ATHUB 4.1 support
- EEPROM support updates
- RAS updates
- LSDMA 7.0 support
- JPEG DPG support
- IH 7.0 support
- HDP 7.0 support
- VCN 5.0 support
- Misc display fixes
- Retimer fixes
- DCN 3.5 fixes
- VCN 4.x fixes
- PSR fixes
- PSP 14.0 support
- VA_RESERVED cleanup
- SMU 13.0.6 updates
- NBIO 7.11 updates
- SDMA 6.1 updates
- MMHUB 3.3 updates
- Suspend/resume fixes
- DMUB updates

amdkfd:
- Trap handler enhancements
- Fix cache size reporting
- Relocate the trap handler

radeon:
- fix typo in print statement

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/psp: update define to better align with its meaning

Aric Cyr (1):
      drm/amd/display: 3.2.272

Charlene Liu (2):
      drm/amd/display: enable fgcg by default
      drm/amd/display: allow psr-su/replay for z8

Dan Carpenter (1):
      drm/amd/display: Fix && vs || typos

Felix Kuehling (2):
      drm/amdgpu: Reduce VA_RESERVED_BOTTOM to 64KB
      drm/amdkfd: Relocate TBA/TMA to opposite side of VM hole

Gabe Teeger (1):
      Revert "drm/amd/display: Send DTBCLK disable message on first commit"

George Shen (1):
      Revert "drm/amd/display: Add left edge pixel for YCbCr422/420 + ODM pipe split"

Hamza Mahfooz (2):
      drm/amdgpu: make damage clips support configurable
      drm/amdgpu: respect the abmlevel module parameter value if it is set

Hawking Zhang (8):
      drm/amdgpu: Add athub v4_1_0 ip headers (v5)
      drm/amdgpu: Add athub v4_1_0 ip block support
      drm/amdgpu: Add lsdma v7_0_0 ip headers (v3)
      drm/amdgpu: Add osssys v7_0_0 ip headers (v4)
      drm/amdgpu: Add hdp v7_0_0 ip headers (v3)
      drm/amdgpu: Add vcn v5_0_0 ip headers (v5)
      drm/amdgpu: Add mp v14_0_2 ip headers (v5)
      drm/amdgpu: Add psp v14_0 ip block support

Jonathan Kim (1):
      drm/amdkfd: fill in data for control stack header for gfx10

Kent Russell (1):
      drm/amdkfd: Fix L2 cache size reporting in GFX9.4.3

Laurent Morichetti (1):
      drm/amdkfd: pass debug exceptions to second-level trap handler

Lijo Lazar (1):
      drm/amd/pm: Allow setting max UCLK on SMU v13.0.6

Likun Gao (16):
      drm/amd/swsmu: add judgement for vcn jpeg dpm set
      drm/amdgpu: skip ucode bo reserve for RLC AUTOLOAD
      drm/amdgpu: support rlc auotload type set
      drm/amdgpu: Add lsdma v7_0 ip block support
      drm/amdgpu/discovery: Add lsdma v7_0 ip block
      drm/amdgpu: Add ih v7_0 ip block support
      drm/amdgpu/discovery: Add ih v7_0 ip block
      drm/amdgpu: Add hdp v7_0 ip block support
      drm/amdgpu/discovery: Add hdp v7_0 ip block
      drm/amdgpu: use spirom update wait_for helper for psp v14
      drm/amdgpu: support psp ip block for psp v14
      drm/amdgpu/psp: set autoload support by default
      drm/amdgpu/psp: handle TMR type via flag
      drm/amdgpu/psp: set boot_time_tmr flag
      drm/amdgpu: add psp_timeout to limit PSP related operation
      drm/amdgpu: support psp ip block discovery for psp v14

Mario Limonciello (3):
      drm/amd: Stop evicting resources on APUs in suspend
      Revert "drm/amd: flush any delayed gfxoff on suspend entry"
      drm/amd: Change `jpeg_v4_0_5_start_dpg_mode()` to void

Martin Tsai (1):
      drm/amd/display: should support dmub hw lock on Replay

Michael Strauss (1):
      drm/amd/display: Update FIXED_VS Retimer HWSS Test Pattern Sequences

Nicholas Kazlauskas (2):
      drm/amd/display: Add shared firmware state for DMUB IPS handshake
      drm/amd/display: Increase ips2_eval delay for DCN35

Nikita Zhandarovich (2):
      drm/radeon/ni: Fix wrong firmware size logging in ni_init_microcode()
      drm/amd/display: fix NULL checks for adev->dm.dc in amdgpu_dm_fini()

Rajneesh Bhardwaj (2):
      drm/amdkfd: update SIMD distribution algo for GFXIP 9.4.2 onwards
      drm/amdgpu: Fix implicit assumtion in gfx11 debug flags

Rodrigo Siqueira (1):
      drm/amd/display: Remove break after return

Roman Li (1):
      drm/amd/display: Fix array-index-out-of-bounds in dcn35_clkmgr

Saleemkhan Jamadar (2):
      drm/amdgpu: add ucode id for jpeg DPG support
      drm/amdgpu/jpeg: add support for jpeg DPG mode

Sohaib Nadeem (2):
      Revert "drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz"
      drm/amd/display: fixed integer types and null check locations

Sonny Jiang (7):
      drm/amdgpu: add VCN_5_0_0 firmware support
      drm/amdgpu: add VCN_5_0_0 IP block support
      amdgpu/drm: Add vcn_v5_0_0_ip_block support
      drm/amdgpu: Add JPEG5 support
      drm/amdgpu/jpeg5: add power gating support
      drm/amdgpu/jpeg5: Enable doorbell
      drm/amdgpu: Add jpeg_v5_0_0 ip block support

Srinivasan Shanmugam (7):
      drm/amd/display: Initialize 'wait_time_microsec' variable in link_dp_training_dpia.c
      drm/amd/display: Fix possible use of uninitialized 'max_chunks_fbc_mode' in 'calculate_bandwidth()'
      drm/amd/display: Fix possible buffer overflow in 'find_dcfclk_for_voltage()'
      drm/amd/display: Fix possible NULL dereference on device remove/driver unload
      drm/amdgpu/display: Initialize gamma correction mode variable in dcn30_get_gamcor_current()
      drm/amdgpu: Fix missing parameter descriptions in ih_v7_0.c
      drm/amd/display: Add 'replay' NULL check in 'edp_set_replay_allow_active()'

Thong (1):
      drm/amdgpu/soc21: update VCN 4 max HEVC encoding resolution

Tom Chung (1):
      drm/amd/display: Preserve original aspect ratio in create stream

Wenjing Liu (1):
      drm/amd/display: treat plane clip size change as MED update type

Yang Wang (2):
      drm/amdgpu: implement smu send rma reason for smu v13.0.6
      drm/amdgpu: send smu rma reason event in ras eeprom driver

Yifan Zhang (8):
      drm/amdgpu/nbio: Add NBIO 7.11.1 Support
      drm/amdgpu: add nbio 7.11.1 discovery support
      drm/amdgpu: add smuio 14.0.1 support
      drm/amdgpu: add PSP 14.0.1 support
      drm/amdgpu: add psp 14.0.1 discovery support
      drm/amdgpu: add sdma 6.1.1 firmware
      drm/amdgpu: add SDMA 6.1.1 discovery support
      drm/amdgpu: add MMHUB 3.3.1 support

Zhikai Zhai (1):
      drm/amd/display: Add align done check

 drivers/gpu/drm/amd/amdgpu/Makefile                |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   15 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   27 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |   46 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |   36 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   67 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c          |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   42 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   15 +-
 drivers/gpu/drm/amd/amdgpu/athub_v4_1_0.c          |  122 +
 drivers/gpu/drm/amd/amdgpu/athub_v4_1_0.h          |   30 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |  142 +
 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.h              |   31 +
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |  767 ++
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.h               |   28 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   16 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |   15 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |  310 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |  570 ++
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.h           |   29 +
 drivers/gpu/drm/amd/amdgpu/lsdma_v7_0.c            |  121 +
 drivers/gpu/drm/amd/amdgpu/lsdma_v7_0.h            |   31 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |    9 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |  672 ++
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.h             |   32 +
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            | 1339 ++++
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.h            |   37 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |    2 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |   17 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |   29 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |   25 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    9 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    1 +
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   10 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   48 +-
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   16 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    1 -
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |    2 +
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   16 +-
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |   12 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   11 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   37 -
 drivers/gpu/drm/amd/display/dc/dc.h                |   15 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   83 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |    4 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |    5 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |    8 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |    9 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |    4 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    2 -
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |    4 -
 .../amd/display/dc/link/accessories/link_dp_cts.c  |   27 +-
 .../link/hwss/link_hwss_dio_fixed_vs_pe_retimer.c  |   16 +-
 .../hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c    |   51 +-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |    2 +-
 .../amd/display/dc/link/protocols/link_dp_phy.c    |    6 +-
 .../display/dc/link/protocols/link_dp_training.c   |    5 +-
 .../dc/link/protocols/link_dp_training_dpia.c      |    2 +-
 .../dc/link/protocols/link_edp_panel_control.c     |    3 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |    5 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    6 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  115 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |    3 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |    3 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.c  |    3 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.h  |    3 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    3 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |    3 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |    3 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h  |    3 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   12 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.h  |    8 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   13 +-
 .../drm/amd/display/include/link_service_types.h   |    9 +
 drivers/gpu/drm/amd/include/amd_shared.h           |    1 +
 .../include/asic_reg/athub/athub_4_1_0_offset.h    |  287 +
 .../include/asic_reg/athub/athub_4_1_0_sh_mask.h   | 1348 ++++
 .../amd/include/asic_reg/hdp/hdp_7_0_0_offset.h    |  219 +
 .../amd/include/asic_reg/hdp/hdp_7_0_0_sh_mask.h   |  735 ++
 .../include/asic_reg/lsdma/lsdma_7_0_0_offset.h    |  388 +
 .../include/asic_reg/lsdma/lsdma_7_0_0_sh_mask.h   | 1411 ++++
 .../drm/amd/include/asic_reg/mp/mp_14_0_2_offset.h |  468 ++
 .../amd/include/asic_reg/mp/mp_14_0_2_sh_mask.h    |  692 ++
 .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |    2 +
 .../amd/include/asic_reg/oss/osssys_7_0_0_offset.h |  279 +
 .../include/asic_reg/oss/osssys_7_0_0_sh_mask.h    | 1029 +++
 .../amd/include/asic_reg/vcn/vcn_5_0_0_offset.h    | 1672 +++++
 .../amd/include/asic_reg/vcn/vcn_5_0_0_sh_mask.h   | 7627 ++++++++++++++++++++
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   15 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    1 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   40 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    6 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    3 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  142 +-
 drivers/gpu/drm/radeon/ni.c                        |    2 +-
 117 files changed, 21302 insertions(+), 413 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/athub_v4_1_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/athub_v4_1_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/ih_v7_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/lsdma_v7_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/lsdma_v7_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v14_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/athub/athub_4_1_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/athub/athub_4_1_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_7_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_7_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/lsdma/lsdma_7_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/lsdma/lsdma_7_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_14_0_2_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_14_0_2_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_7_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_7_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_5_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_5_0_0_sh_mask.h
