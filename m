Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6280C66A653
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 23:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B850F10E215;
	Fri, 13 Jan 2023 22:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCED10E213;
 Fri, 13 Jan 2023 22:59:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABuiAmgXc9awsf6rzo2MiQGMeMJvxzYj3S64IFT45YJRTUSAZRmRbFR+me2SVmr7JJfrLoD8s/N7oPVeS0uuRNkokmqjpht1LMWHgHFTyTKnyma+DpikDavOAcQNu6c+LuMrgh7GoUtVDnwmfXl1HbhPQvwqbnuDxatFfkmTjE0YDHiNfheqBQLYwXmmHyx8OyJmg68BjQZ4xpvFFVL3V/bM0yS8zOrLcuiGM+rM5rmMWfHSL8UsYa+A048q0rDuOp2YYB+Q0jZo/RHLX9ANfciLTu9KtBv8WR3/Fc8sH6546xxpCCjxLLHhyXOQrIPjYQjD2Kj1JYVI0ij/XOwbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfhdrEgF+4ze1yGAlFshhuaF5Dx2aSzi+atlFA3uR90=;
 b=kYuuGXKkBFmIbsffQSI/pIEaqBBPz+xyxERmXRJF/gtR7gAMRdrHn9pudNdsseuIb6NW26F7/su9eLuTets54jYi8L2liQtSaqpMP9DqtC/yzm1XLQOmuKkVc5PT2kPiYRjMWQ6AhyZBHgreULcbylrw+NpeBzgpc+p+F97Mkk5fM1x/z0KQeUKlczdxiRGe5DgZ1YD+6VUMJwNTawIHmIBeoR1GQv4yXupI3p9f77GhBnrgSt4IVEqOSv7HnpKecf8L3Q7f16dXW7Zz0iV81l1CX7NqQXxFqJeD009k6HARaKqTEkJo8NVq8bauJH+EYy8shMCmPQLYYj7loonEiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfhdrEgF+4ze1yGAlFshhuaF5Dx2aSzi+atlFA3uR90=;
 b=No9/ezRkNbkCY6E9XOdeJFqDq1C+0BPS4tlSgWZMvMA9FOpzHF4FTRaCqkD/FoaL9B4x1mrNNuhumkHxdaHtRRT6BsLpVUItJ+JKH0Ch5JurwmTh5av5/uT/Bf7rePnPS8xsgX6TzSJcqveQNQMr2FzRgGt4e+K66kqFuEPcd7k=
Received: from DS7PR06CA0033.namprd06.prod.outlook.com (2603:10b6:8:54::15) by
 SN7PR12MB6982.namprd12.prod.outlook.com (2603:10b6:806:262::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Fri, 13 Jan 2023 22:59:48 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::4a) by DS7PR06CA0033.outlook.office365.com
 (2603:10b6:8:54::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 22:59:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 22:59:48 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 16:59:28 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.3
Date: Fri, 13 Jan 2023 17:59:11 -0500
Message-ID: <20230113225911.7776-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT011:EE_|SN7PR12MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: b356802f-90c9-4ce2-5ead-08daf5b9df01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nngRpNWOGiOyVg17C3IGiWs+BaRn2H0q9zNDyVwqDpE5OrpeHabJASeHn5HbmjSLXgw8torYz1n/NGeWOC57hW8uwon7IhoRN5fO42bEtkswb4J3RFqpfGUKRfGMWCiRIz0fTVzwsUVBJvMO3i4rkddAXABHfWmhCFkmxOK2BzkcTz9s3Fy3YzGDP7WE3L1H9WKHoCTg5WiuuVhYeqyBB4qSoAm6s9sYD8qkNuHsF+dMpP0SuMhGjueHCzTSSL9u9GCkS0AcBpacpMLdq+3F94/FNWW0fvYCM7aJm+/5wOJ0lS8xGm7zEUch846lsm+HNXOhVRS4PsfDZJR1pYWOu6V6k8VmvAlgEi8Gh5q+PCXtHRRRbVfS0VZRQqfphP/sC5pYyReIBFoqQ5u5beZKPHN4t31hLVCj+v6xIHQs7tEPkyi/bA9cAeZjx5gAiYWKhYA2zgx1L0Lx5H/hwwVIFNdgEbAbnh9+UyrzmU67nR/YXZ/Bj2ojRbDyFI6agGJ3NcQKmMlT5StSrMLhWRCHqVCd0z/bMwSfhxBoj0cc9/qE1CFtmT8Ljy/uI7h2ITFaFzTGcboqK73VVRoZxLH2cGhgwe+9ZtZPBfY8Ado1BoQma7YwQuEdvCnI7ZolCYJWTSSJLgmI2e5vQ7FsdYNcf7ftwJVt8wWlNv5W/xQVEutLU0NPq8JnSOLnyZnd3g1R
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(2906002)(7696005)(26005)(6666004)(966005)(186003)(16526019)(478600001)(1076003)(336012)(8676002)(70586007)(4326008)(316002)(40460700003)(426003)(47076005)(70206006)(41300700001)(82740400003)(5660300002)(40480700001)(110136005)(2616005)(83380400001)(8936002)(36756003)(36860700001)(82310400005)(86362001)(81166007)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 22:59:48.4729 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b356802f-90c9-4ce2-5ead-08daf5b9df01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6982
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

More new stuff for 6.3.

The following changes since commit f6e856e72ce51df1e0fe67aecb5f256fbd4190a6:

  drm/amdgpu: update ta_secureDisplay_if.h to v27.00.00.08 (2023-01-05 11:43:46 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.3-2023-01-13

for you to fetch changes up to 0c2dece8fb541ab07b68c3312a1065fa9c927a81:

  drm/amdkfd: Page aligned memory reserve size (2023-01-11 16:41:03 -0500)

----------------------------------------------------------------
amd-drm-next-6.3-2023-01-13:

amdgpu:
- Fix possible segfault in failure case
- Rework FW requests to happen in early_init for all IPs so
  that we don't lose the sbios console if FW is missing
- PSR fixes
- Misc cleanups
- Unload fix
- SMU13 fixes

amdkfd:
- Fix for cleared VRAM BOs
- Fix cleanup if GPUVM creation fails
- Memory accounting fix
- Use resource_size rather than open codeing it
- GC11 mGPU fix

radeon:
- Fix memory leak on shutdown

----------------------------------------------------------------
Deepak R Varma (2):
      drm/amdkfd: Use resource_size() helper function
      drm/amd/display: No need for Null pointer check before kfree

Eric Huang (2):
      drm/amdkfd: Add sync after creating vram bo
      drm/amdkfd: Fix NULL pointer error for GC 11.0.1 on mGPU

Guchun Chen (1):
      drm/amd/pm/smu13: BACO is supported when it's in BACO state

Hamza Mahfooz (1):
      drm/amd/display: fix PSR-SU/DSC interoperability support

Liwei Song (1):
      drm/radeon: free iio for atombios when driver shutdown

Luben Tuikov (1):
      drm/amdgpu: Fix potential NULL dereference

Mario Limonciello (45):
      drm/amd: Delay removal of the firmware framebuffer
      drm/amd: Add a legacy mapping to "amdgpu_ucode_ip_version_decode"
      drm/amd: Convert SMUv11 microcode to use `amdgpu_ucode_ip_version_decode`
      drm/amd: Convert SMUv13 microcode to use `amdgpu_ucode_ip_version_decode`
      drm/amd: Add a new helper for loading/validating microcode
      drm/amd: Use `amdgpu_ucode_request` helper for SDMA
      drm/amd: Convert SDMA to use `amdgpu_ucode_ip_version_decode`
      drm/amd: Make SDMA firmware load failures less noisy.
      drm/amd: Use `amdgpu_ucode_*` helpers for VCN
      drm/amd: Load VCN microcode during early_init
      drm/amd: Load MES microcode during early_init
      drm/amd: Use `amdgpu_ucode_*` helpers for MES
      drm/amd: Remove superfluous assignment for `adev->mes.adev`
      drm/amd: Use `amdgpu_ucode_*` helpers for GFX9
      drm/amd: Load GFX9 microcode during early_init
      drm/amd: Use `amdgpu_ucode_*` helpers for GFX10
      drm/amd: Load GFX10 microcode during early_init
      drm/amd: Use `amdgpu_ucode_*` helpers for GFX11
      drm/amd: Load GFX11 microcode during early_init
      drm/amd: Parse both v1 and v2 TA microcode headers using same function
      drm/amd: Avoid BUG() for case of SRIOV missing IP version
      drm/amd: Load PSP microcode during early_init
      drm/amd: Use `amdgpu_ucode_*` helpers for PSP
      drm/amd/display: Load DMUB microcode during early_init
      drm/amd: Use `amdgpu_ucode_release` helper for DMUB
      drm/amd: Use `amdgpu_ucode_*` helpers for SMU
      drm/amd: Load SMU microcode during early_init
      drm/amd: Optimize SRIOV switch/case for PSP microcode load
      drm/amd: Use `amdgpu_ucode_*` helpers for GFX6
      drm/amd: Use `amdgpu_ucode_*` helpers for GFX7
      drm/amd: Use `amdgpu_ucode_*` helpers for GFX8
      drm/amd: Use `amdgpu_ucode_*` helpers for GMC6
      drm/amd: Use `amdgpu_ucode_*` helpers for GMC7
      drm/amd: Use `amdgpu_ucode_*` helpers for GMC8
      drm/amd: Use `amdgpu_ucode_*` helpers for SDMA2.4
      drm/amd: Use `amdgpu_ucode_*` helpers for SDMA3.0
      drm/amd: Use `amdgpu_ucode_*` helpers for SDMA on CIK
      drm/amd: Use `amdgpu_ucode_*` helpers for UVD
      drm/amd: Use `amdgpu_ucode_*` helpers for VCE
      drm/amd: Use `amdgpu_ucode_*` helpers for CGS
      drm/amd: Use `amdgpu_ucode_*` helpers for GPU info bin
      drm/amd: Use `amdgpu_ucode_*` helpers for DMCU
      drm/amd: Use `amdgpu_ucode_release` helper for powerplay
      drm/amd: Use `amdgpu_ucode_release` helper for si
      drm/amd: make amdgpu_ucode_validate static

Philip Yang (2):
      drm/amdkfd: Cleanup vm process info if init vm failed
      drm/amdkfd: Page aligned memory reserve size

Yang Li (2):
      drm/amd/display: Remove unneeded semicolon
      drm/amdgpu: clean up some inconsistent indentings

Yi Yang (1):
      drm/amd/display: Remove redundant assignment to variable dc

YiPeng Chai (1):
      drm/amdgpu: Fixed bug on error when unloading amdgpu

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  32 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  59 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 299 ++++++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |  27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          | 259 +++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  65 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |  16 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 155 +++--------
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             | 124 +++------
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |  30 +--
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |  68 ++---
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  94 +++----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 140 +++-------
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |  14 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |  13 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |  13 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             | 108 ++------
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  99 ++-----
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |  80 +-----
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             | 131 +--------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |  78 +-----
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  27 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c           |  14 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |  16 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |  18 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |  18 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  47 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  30 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  55 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  25 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   9 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   9 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 116 ++++----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   3 +
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   3 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   2 +-
 .../drm/amd/display/modules/power/power_helpers.c  |  31 +++
 .../drm/amd/display/modules/power/power_helpers.h  |   3 +
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  11 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  12 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  51 +---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  32 +--
 drivers/gpu/drm/radeon/radeon_device.c             |   1 +
 67 files changed, 997 insertions(+), 1591 deletions(-)
