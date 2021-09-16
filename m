Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9007240DC5A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 16:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535626EDE2;
	Thu, 16 Sep 2021 14:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B9D6EDE2;
 Thu, 16 Sep 2021 14:06:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GixEw+XJ30DX2/LCioV2B1o3S8UwKwpuHI8JC7swbLLS+RPfq30AXD5ovggqjPkMRAasxZie9EFR0e48Gqxo3Zv6PN/J6eh6XEqJxPsuPanX21ZQG7tFiV4zVoQJo6rqrRATp9GLgf4Dfr40YEmp8xr6Szuaern/flg/XK447CnmbkVjWJropAPlgyBziJr4/9T25tZ9sdnbp2x8j+6gLnDV0U3gQmoJmfyBu2xGR3c9KPnn9DHSMDkChJGp3g2sLiC/7V76KXI9JyttqQsik7IGc/V790XBVTP2zO6ZBwOmBJH8dk0UHr74HaDXzExLq1ZP4E79hWnDpEX95j8BHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=vPWTSEU1hoGh5QZmyKc13MaOPHjC8zMbp9R4+sMpGA0=;
 b=R34S6dje7G1eJWyl97Gk1lBQ7xl/DaH5bIzX9aELnHtPvUmzEA4HDxcUsRT7ZQNkEII7PLl3sFPGuEe48BnCHez5HAxU2A7Muzuf9YO5kW30YaHWaoT9DDkED28NIqCgOWKl04CcGS13KOGtWx7iiXb9+0rgMxthobPMe9SZmN0IHzB89n4Jn44/ErOUdIoMTXjLOIIvJUQyVdH6Gx0kOjRFaLrOZkkMxaMHvFRyOQeDKaVwl6PaDOTe/ZgwYXYq0oxlht9ge8R2lLM32c5z3OsFTHvIDNL01BQ5WkIZKU42abZRC/sawITkkRIQHzshVz/pgtuKVrV4KFe57ECC8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPWTSEU1hoGh5QZmyKc13MaOPHjC8zMbp9R4+sMpGA0=;
 b=sWRudbhMc3f/1EfkOQ+TKw2ZKSjkzQRkUYKiaEeTHAgNK1I7nyBL6Z2cJn65x+e4yS2ZCxdvqywPOksHDB3ND2A/3R18/eX4pQHBwgv1kPafiwk6hFdxAOSevgVLSwfyGAymXoG+WPWMOOMf1ZUmZ3bOKPQW0Nc1rlWdq0A8Bxk=
Received: from DM3PR11CA0002.namprd11.prod.outlook.com (2603:10b6:0:54::12) by
 DM6PR12MB4987.namprd12.prod.outlook.com (2603:10b6:5:163::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Thu, 16 Sep 2021 14:06:24 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:54:cafe::2f) by DM3PR11CA0002.outlook.office365.com
 (2603:10b6:0:54::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 14:06:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 14:06:24 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 16 Sep
 2021 09:06:22 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-fixes-5.15
Date: Thu, 16 Sep 2021 10:06:11 -0400
Message-ID: <20210916140611.59816-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8c6cd99-d0fc-4fac-378e-08d9791b2b10
X-MS-TrafficTypeDiagnostic: DM6PR12MB4987:
X-Microsoft-Antispam-PRVS: <DM6PR12MB49878C57EAE885348600B6CAF7DC9@DM6PR12MB4987.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:163;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0e9Z1a8ih22BLJm0iL1pVJujpW6mW2zhvXMP7zi1a3xxflx62+1+UsQozGdQG352wG9e+pv7nwI0ZFdo8ChVaMGCWfvkLpfRpNwX97+PPdqwlVkIKuNACIvPjWZ727edm1yh4V4v+rnawdW7B/ZX6g3LQWJEMQ21Wgg+c0Oi2jyV6PhZyvryxkoBFbWBQMlP7irwJytJsebzqC9yC4J/jcg9t4ohUqa85EWMhSQXEfMQEnVfX16N+GXf6ZI/U7yvv/GASuR4kRUveKayyJcmIZQTr26t34Ek9ymEwG43o0vSoBKP29SWS3jGTvJ2xUQQFO0wfVqN90NT76zciXGFiZj1DsN+wo5jgUvMLS6H5IE1eiFjkHvKMHOVQND0dM+h9fyEbDXHdWqUW+55e6oSnZfVUnHAuc5zOqJrZpfo+QAZhMUnNq340zWkKU6RY/N7lgVqXhnaWj5ZFN+EjxHjgvl5zO48v0wnDmqKiHsl6qpk+JuGJNZv7I35Z3qaiyki3Z2gnCWfzF3IYhxy88gjNIeXhlwFbJfYNZx7kraZwE5TuU8IV3qNMx+Bpxw3wmgPGZctO19IaDsSAZgEQDsjbxy2cvTUYGD1Mk1og3M6JTUFAUdNrNHyiCOd12z1PbxsiVTKNTXoxiSVJkD9vuOunt1e2nVAhr5Khu8TGHRZT4IL1AxT3ZLNqZCaoCEx+AytRb7Q702AzHAGCbMGB4iXlzMBbgSeq2oENexclkPPks8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(36840700001)(46966006)(336012)(1076003)(426003)(82740400003)(47076005)(2616005)(70206006)(70586007)(86362001)(66574015)(82310400003)(36756003)(36860700001)(7696005)(8936002)(8676002)(356005)(4326008)(2906002)(81166007)(966005)(5660300002)(26005)(110136005)(186003)(16526019)(316002)(6666004)(83380400001)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 14:06:24.2407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c6cd99-d0fc-4fac-378e-08d9791b2b10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4987
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

Hi Dave, Daniel,

Fixes for 5.15.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.15-2021-09-16

for you to fetch changes up to 92554cbe0a36494f6dd760bc25ce5e5cdc60fc47:

  drm/amdgpu/display: add a proper license to dc_link_dp.c (2021-09-16 09:56:24 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.15-2021-09-16:

amdgpu:
- UBSAN fix
- Powerplay table update fix
- Fix use after free in BO moves
- Debugfs init fixes
- vblank workqueue fixes for headless devices
- FPU fixes
- sysfs_emit fixes
- SMU updates for cyan skillfish
- Backlight fixes when DMCU is not initialized
- DP MST fixes
- HDCP compliance fix
- Link training fix
- Runtime pm fix
- Panel orientation fixes
- Display GPUVM fix for yellow carp
- Add missing license

amdkfd:
- Drop PCI atomics requirement if proper firmware is available
- Suspend/resume fixes for IOMMUv2 cases

radeon:
- AGP fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/display: add a proper license to dc_link_dp.c

Anson Jacob (1):
      drm/amd/display: dc_assert_fp_enabled assert only if FPU is not enabled

Christian König (1):
      drm/amdgpu: fix use after free during BO move

Ernst Sjöstrand (1):
      drm/amd/amdgpu: Increase HWIP_MAX_INSTANCE to 10

Evan Quan (1):
      drm/amd/pm: fix runpm hang when amdgpu loaded prior to sound driver

Felix Kuehling (1):
      drm/amdkfd: make needs_pcie_atomics FW-version dependent

Harry Wentland (1):
      drm/amd/display: Get backlight from PWM if DMCU is not initialized

Hersen Wu (1):
      drm/amd/display: dsc mst 2 4K displays go dark with 2 lane HBR3

James Zhu (3):
      drm/amdkfd: separate kfd_iommu_resume from kfd_resume
      drm/amdgpu: add amdgpu_amdkfd_resume_iommu
      drm/amdgpu: move iommu_resume before ip init/resume

Kenneth Feng (1):
      drm/amd/pm: fix the issue of uploading powerplay table

Lang Yu (5):
      drm/amdgpu: fix sysfs_emit/sysfs_emit_at warnings(v2)
      drm/amdgpu: update SMU PPSMC for cyan skilfish
      drm/amdgpu: update SMU driver interface for cyan skilfish(v3)
      drm/amdgpu: add some pptable funcs for cyan skilfish(v3)
      drm/amdgpu: add manual sclk/vddc setting support for cyan skilfish(v3)

Meenakshikumar Somasundaram (1):
      drm/amd/display: Link training retry fix for abort case

Michel Dänzer (1):
      drm/amdgpu: Drop inline from amdgpu_ras_eeprom_max_record_count

Nicholas Kazlauskas (2):
      drm/amd/display: Add NULL checks for vblank workqueue
      drm/amd/display: Fix white screen page fault for gpuvm

Nirmoy Das (2):
      drm/amdgpu: use IS_ERR for debugfs APIs
      drm/radeon: pass drm dev radeon_agp_head_init directly

Paul Menzel (1):
      drm/amdgpu: Demote TMZ unsupported log message from warning to info

Qingqing Zhuo (1):
      drm/amd/display: Fix unstable HPCP compliance on Chrome Barcelo

Simon Ser (2):
      amd/display: downgrade validation failure log level
      amd/display: enable panel orientation quirks

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  56 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 109 ++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  18 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |  11 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  16 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  34 +-
 .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.c    |  10 -
 .../amd/pm/inc/smu11_driver_if_cyan_skillfish.h    |  86 ++--
 drivers/gpu/drm/amd/pm/inc/smu_types.h             |   5 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_8_ppsmc.h       |   9 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   8 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    | 481 +++++++++++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  28 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  16 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   2 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  12 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  21 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  15 +
 drivers/gpu/drm/radeon/radeon_kms.c                |   2 +-
 34 files changed, 858 insertions(+), 169 deletions(-)
