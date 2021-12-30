Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C357F481CC8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 15:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0874810E58B;
	Thu, 30 Dec 2021 14:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2047.outbound.protection.outlook.com [40.107.102.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFDE10E58B;
 Thu, 30 Dec 2021 14:10:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaVgMT+Q7jBgWMIiVSc6Pr+Z6rNO9eLxb/oahrkdRovgbQpGJ2h0ylpfvITT4LiwPe2IqRLD+FrdgmHxmwJ74iBqgyn6qvWzAtaxvb+8CCaV51lL3oEGZz1d94iCSPRuZ9ziuyvutdGcSPO4k5MkuZTxyk0eG78A1JWrPlZix4a9Edkih4pzHinGTtn/oXk9i9EEb42AHG5e4CgDdr0dIfuuGiEbQnujlQ7QrxXhwn4s0eyEbL3SmVWAWj4/oZtzcYFXs/yksiHkzA25in3Agd1o8N/1bV5e8Ks4mX09IuQahj9IB8Tzpd4CAzeeHmq0cttD7m+r28geep2Ez8Rsqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRIrCAyuiMFGTQfxSRAsH2sPMATcwvO2JFbmhMx5lBo=;
 b=FKIrh/ZeKLMemLfkKJr61IKXPgUyNBV9TOEsTLk/CWo+LaXoTFK6wnPGdbc/2Ebwd57g+ofKCc3HPE1Sty14KeIxsVI+VvUuodBKZepdoSw73TAX28OG/F6Vh+jrPTPWzmqudvdLJgP6MN/DJZ8HuiJgUQzDmYyFY7FwEjakttwP4BOhMNiEvqYQcGmU/ygE+kS5lAkPD6o/F/8gaxiKx+ymN8+b86oOvUpafSjgjYrJooOXhRaxeTao0Y+tOMPRQRJTRT76tgsIdEBl9etYjbUBANOTmA4VVd2SR5dY+77vpbvs5HBG0u6YapimT8J21nhm/b3PMTsQoTxqOrOGIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRIrCAyuiMFGTQfxSRAsH2sPMATcwvO2JFbmhMx5lBo=;
 b=KLYskRGRPanwJTdqwNAsKwGaboUwWwhG5hwE6bWyqC9sswgSavaCnttWMGJLdW1Dpli4flkt3XMUg4+v5Ys4JGMIWiEoI8ZpBsTa51dSGZCIDDUSowyXyldB/17YoGXlvm03D5ApNt5foFMN0nZDyRHW185IhDX9v0MyRRGgBIc=
Received: from BN9PR03CA0951.namprd03.prod.outlook.com (2603:10b6:408:108::26)
 by CH2PR12MB3894.namprd12.prod.outlook.com (2603:10b6:610:2b::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 30 Dec
 2021 14:10:47 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::8a) by BN9PR03CA0951.outlook.office365.com
 (2603:10b6:408:108::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.13 via Frontend
 Transport; Thu, 30 Dec 2021 14:10:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4844.14 via Frontend Transport; Thu, 30 Dec 2021 14:10:47 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 30 Dec
 2021 08:10:46 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-5.17
Date: Thu, 30 Dec 2021 09:10:32 -0500
Message-ID: <20211230141032.613596-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d0cc5dd-3ccf-4797-1cd8-08d9cb9e2d8a
X-MS-TrafficTypeDiagnostic: CH2PR12MB3894:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB389425D73AED677BB57D0246F7459@CH2PR12MB3894.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tRGznBspwH3jYWTp8H2irm2rkDFljixnJrK20f1hPL9hny69KvNHBM3OpZuLxHGhlNQ6sAp2Kb5lcJf+S5FBqWW3IZQ+jav4fLQG9m07bncvQZ0odQuA9TZz8MrJLK4I9Kcj9Ax1hncn+pxupOsdofOGR+UbFI1n35Pv3zXLzOkyV/NVnLueo6xH7mGbwLMEKRiJCVCbGSikeqztQGR1rZOHYJ3/sK2dZ3SinUQ+dnInmGeoUFu0wJjr+QkIY8mnT/iTta4VDqAVKvcapUDi6P4Yr/jWjts3f1ztb+6dNyjfzgH4BzQ9O2g3+HDOmi84FPfxGcvk5RjgFfJ3/yp35cPYLBMLVBJO8OBYsVxMWZAah3nxJb92Bx9cOgz2hwNqwHjIofSHkZdSuTvkbMiURbXTB/g/nDUAc4ACHr+FEU5C3PIQ5a+jM9pooHpacrASf9sKkIrh1vZ4mhFw+UDEPPo6VAeaNKFbCH3yPZBZBETNsjtDxDu1d0IH36IJj3KZ9nlGQIj2itqtya3BNfX9i7/bJHrfqioZmTDuQEGU4G025B9uzDML9waLGu4USpxQQEoudIM+6MuybqY1JPdkqZN78E/Nw4WN6uTjQCVKKqDyJ5rp0hze9GGoSiEZzqeXD4nrXo18OH4fhBEi+PKELTLdPRb61/kRg/B2QQ19q2gfWXH+GYGo9rWl3J5B3q4916fMwb9WodxJhC0RrGGFqp9XM389ngg4rMiJqM1+wHE6Mw1y/NYVPrkk09PU0crrowXJZ6nbjp3/nNcfGTF4VdkRFGCMmdnrDMNENju2uCs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(110136005)(2906002)(356005)(82310400004)(1076003)(36756003)(81166007)(8676002)(40460700001)(36860700001)(7696005)(4001150100001)(83380400001)(316002)(86362001)(47076005)(8936002)(4326008)(66574015)(26005)(70586007)(70206006)(186003)(5660300002)(16526019)(336012)(2616005)(508600001)(966005)(6666004)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 14:10:47.8464 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0cc5dd-3ccf-4797-1cd8-08d9cb9e2d8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3894
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

Fixes for 5.17.  Now with more S-o-b.

The following changes since commit a342655865b2f14d1fbf346356d3b3360e63e872:

  drm/radeon: Fix syntax errors in comments (2021-12-14 16:11:02 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.17-2021-12-30

for you to fetch changes up to 0637d41786a3a9551f33ad8e15bdb40416362028:

  drm/amdgpu: no DC support for headless chips (2021-12-30 08:54:45 -0500)

----------------------------------------------------------------
amd-drm-next-5.17-2021-12-30:

amdgpu:
- Suspend/resume fixes
- Fence fix
- Misc code cleanups
- IP discovery fixes
- SRIOV fixes
- RAS fixes
- GMC 8 VRAM detection fix
- FRU fixes for Aldebaran
- Display fixes

amdkfd:
- SVM fixes
- IP discovery fixes

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu: clean up some leftovers from bring up
      drm/amdgpu: add support for IP discovery gc_info table v2
      drm/amdgpu: fix runpm documentation
      drm/amdgpu: always reset the asic in suspend (v2)
      drm/amdgpu: no DC support for headless chips

Alvin Lee (1):
      drm/amd/display: Fix check for null function ptr

Angus Wang (1):
      drm/amd/display: Changed pipe split policy to allow for multi-display pipe split

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.98

Aric Cyr (1):
      drm/amd/display: 3.2.167

Bokun Zhang (1):
      drm/amdgpu: Filter security violation registers

Changcheng Deng (1):
      drm/amdkfd: use max() and min() to make code cleaner

Charlene Liu (1):
      drm/amd/display: fix B0 TMDS deepcolor no dislay issue

Evan Quan (1):
      drm/amdgpu: put SMU into proper state on runpm suspending for BOCO capable platform

George Shen (2):
      drm/amd/display: Limit max link cap with LTTPR caps
      drm/amd/display: Remove CR AUX RD Interval limit for LTTPR

Guchun Chen (2):
      drm/amdkfd: correct sdma queue number in kfd device init (v3)
      drm/amdgpu: drop redundant semicolon

Huang Rui (1):
      drm/amdgpu: introduce new amdgpu_fence object to indicate the job embedded fence

Jiapeng Chong (1):
      drm/amd/display: Fix warning comparing pointer to 0

José Expósito (1):
      drm/amd/display: fix dereference before NULL check

Kent Russell (4):
      drm/amdgpu: Increase potential product_name to 64 characters
      drm/amdgpu: Enable unique_id for Aldebaran
      drm/amdgpu: Only overwrite serial if field is empty
      drm/amdgpu: Access the FRU on Aldebaran

Lai, Derek (1):
      drm/amd/display: Added power down for DCN10

Leslie Shi (1):
      drm/amdgpu: Call amdgpu_device_unmap_mmio() if device is unplugged to prevent crash in GPU initialization failure

Lijo Lazar (1):
      drm/amd/pm: Fix xgmi link control on aldebaran

Marina Nikolic (1):
      amdgpu/pm: Make sysfs pm attributes as read-only for VFs

Mario Limonciello (2):
      drivers/amd/pm: smu13: use local variable adev
      drm/amd/pm: restore SMU version print statement for dGPUs

Martin Leung (1):
      drm/amd/display: Undo ODM combine

Nicholas Kazlauskas (4):
      drm/amd/display: Fix USB4 null pointer dereference in update_psp_stream_config
      drm/amd/display: Block z-states when stutter period exceeds criteria
      drm/amd/display: Send s0i2_rdy in stream_count == 0 optimization
      drm/amd/display: Set optimize_pwr_state for DCN31

Philip Yang (1):
      drm/amdkfd: fix svm_bo release invalid wait context warning

Prike Liang (1):
      drm/amd/pm: skip setting gfx cgpg in the s0ix suspend-resume

Rajneesh Bhardwaj (1):
      drm/amdgpu: Don't inherit GEM object VMAs in child process

Shen, George (1):
      drm/amd/display: Refactor vendor specific link training sequence

Surbhi Kakarya (1):
      drm/amdgpu: Check the memory can be accesssed by ttm_device_clear_dma_mappings.

Tao Zhou (5):
      drm/amdgpu: add gpu reset control for umc page retirement
      drm/amdkfd: add reset parameter for unmap queues
      drm/amdkfd: add reset queue function for RAS poison (v2)
      drm/amdkfd: reset queue which consumes RAS poison (v2)
      drm/amdgpu: save error count in RAS poison handler

Victor Skvortsov (6):
      drm/amdgpu: Separate vf2pf work item init from virt data exchange
      drm/amdgpu: Add *_SOC15_IP_NO_KIQ() macro definitions
      drm/amdgpu: Modify indirect register access for gmc_v9_0 sriov
      drm/amdgpu: Modify indirect register access for amdkfd_gfx_v9 sriov
      drm/amdgpu: get xgmi info before ip_init
      drm/amdgpu: Modify indirect register access for gfx9 sriov

Wenjing Liu (5):
      drm/amd/display: define link res and make it accessible to all link interfaces
      drm/amd/display: populate link res in both detection and validation
      drm/amd/display: access hpo dp link encoder only through link resource
      drm/amd/display: support dynamic HPO DP link encoder allocation
      drm/amd/display: get and restore link res map

Wesley Chalmers (1):
      drm/amd/display: Add reg defs for DCN303

Yizhuo Zhai (1):
      drm/amd/display: Fix the uninitialized variable in enable_stream_features()

Zongmin Zhou (1):
      drm/amdgpu: fixup bad vram size on gmc v8

chen gong (1):
      drm/amdgpu: When the VCN(1.0) block is suspended, powergating is explicitly enabled

sashank saye (1):
      drm/amdgpu: Send Message to SMU on aldebaran passthrough for sbr handling

yipechai (1):
      drm/amdgpu: Remove the redundant code of psp bootloader functions

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |  27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  78 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          | 126 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            | 167 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 117 +++--
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   6 -
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |  13 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  63 ++-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |  78 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  83 ++--
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |   5 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   7 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  80 +++-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  28 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |   5 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |  44 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  35 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   3 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |   2 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  18 -
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |   2 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 241 +++++++---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 501 ++++++++++++++++++---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |  48 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |  63 +--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 199 +++++---
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |  15 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  14 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |   1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   5 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c   |   3 +-
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |   2 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |  13 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   2 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   2 +-
 .../gpu/drm/amd/display/dc/dcn303/dcn303_dccg.h    |  20 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   2 +-
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.c   |   6 +-
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.h   |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  27 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |  31 ++
 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/core_status.h   |   2 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |  17 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |  15 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h  |   5 +-
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |   3 +-
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |  10 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   6 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   4 +-
 .../amd/include/asic_reg/nbio/nbio_7_2_0_offset.h  |   2 -
 .../amd/include/asic_reg/nbio/nbio_7_2_0_sh_mask.h |  12 -
 drivers/gpu/drm/amd/include/discovery.h            |  49 ++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   9 +-
 drivers/gpu/drm/amd/pm/inc/aldebaran_ppsmc.h       |   4 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |   6 +-
 drivers/gpu/drm/amd/pm/inc/smu_types.h             |   3 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  13 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  15 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  15 +-
 83 files changed, 1814 insertions(+), 747 deletions(-)
