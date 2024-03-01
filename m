Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F6A86EAAB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 21:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0779410EB07;
	Fri,  1 Mar 2024 20:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sSdva14w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE4F10EA23;
 Fri,  1 Mar 2024 20:49:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iD8kvmAr7s+AvRZQBHnNUvJBHqddaftd3X9ambWzrq7g+nrvQQSusEOfkeGNXa713VC4peMzoRkcjW8BYRM2t48zZLf9A1OY0ElnPTicNvIMVXCJbFnqItu/AFwZYz4PFTAZY0Geh0WiIg/Cj6/3ns4gtEuf1vtbkf+5dNDfXOpIBqFr++f/fhwJNdBQ7UH37W8i6T2Je4dEAElRdZbmXtqxRg1GMjqeZ9WfLgqb1YuEpn1D5Zj6EMhAr2VWTIB4RckU7dOqwznSmH35jyiBvKfJYIYGrJKtLHrdYqZIFg1dk+eRfW+a64Yk9afHIxZe36yOx8msjspqLOdm10sEQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSVXXTV6zzfv6J6hK4sVxjkmWcGqsAHtSAxHPqzHKQw=;
 b=Ky4EtcYTxSURpJFqMiLz1RDNzkbTE9L+UjYfLxDbyJk4J0los+dWYu0fJ8K6wAR9Ufoix/McDd/DVanacF1vBD8JdY7M5CVCQV9MkPcR+2Warx6MPjgwFo8Mt8+Pgem1o7c1bF7LhQHB05rbe/IZ29kVf3LnyckO1uV3AmNhTMInUTaFCgPWl7SKGhlingXQoan07R6y9nLyAzMYLbeNf8KIqmmi/CaviHGQ5ZQioeAXrM8G9q6CMrtIb4v35dGKbYmNZoh59wWSBEgiQXZU8W9t3Ef0pv42hxEre3DUY4mvjs3Kq/VeRZDVk55W6xpW9pU5WjQTZngMALAt5jhtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSVXXTV6zzfv6J6hK4sVxjkmWcGqsAHtSAxHPqzHKQw=;
 b=sSdva14wPb5JeWJf6kCkdEqkg7hBhoWKvU6JY/ZLpkmlPnzKjJC5sWNjtSEl7oS4GcKxKZa1M9rQ+LgiF1mKs0FJPbKNwnSnFZ3ng2qROL578LXWycEXJ/xgr8oMMAidfm1+u0/v4emu+3tuCTzKhg17ftUFUxDuV9s0yENT4CY=
Received: from SJ0PR05CA0149.namprd05.prod.outlook.com (2603:10b6:a03:33d::34)
 by MW5PR12MB5681.namprd12.prod.outlook.com (2603:10b6:303:19e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 1 Mar
 2024 20:49:18 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::f7) by SJ0PR05CA0149.outlook.office365.com
 (2603:10b6:a03:33d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.27 via Frontend
 Transport; Fri, 1 Mar 2024 20:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 1 Mar 2024 20:49:18 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 1 Mar
 2024 14:49:16 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.9
Date: Fri, 1 Mar 2024 15:48:56 -0500
Message-ID: <20240301204857.13960-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|MW5PR12MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: a88ad216-58b1-4aa3-7029-08dc3a311068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3g9HzlHydvoz54HqO9FaTgz7eBD7DGduneJvpOaexM4MCeLO95WegCUI99Ygrw499MP5fb1EiN2cKYLaHq/3rmcA948yq2DzbBzgAasJmdgoBt+iW7gs61wkDx9hVWVJMlaNDJYKR1peuxbbWU1zM/2/kRXCxBxKM4XVt8dORG7CjUDibP3NRk7seA9vCcQhMRA1mUXvITR6eQfKZMld059EIPiOcC1DO9L4yd4csdYZlAMfNPwUos425dG8jOw+8qpk50IdSNOYxGoufNrZdvd5n4gvzwCL33/tKZL93pLscT6tn6MINoKGTQA+aq0nDx/OSzV3av5nb8SUbcLJJUkZ50+w942kj/sgdhYWuoFHovthBbJi2j8RqZhB8e/5Jsbyl4hvHOcQ5wizdLRy9TpPTI0QGb0AvPhWkr/0LK+G1NuwoSMaKikZnNLzM110E3UpeNeSfvIuQguVYup0Y3IR34wx75yNF9n3EFByWRtkQ+ejdtIuIBOsa3Unkqui5FN88j8B40TzNmwuh4fiyM9EW8Om4A+Qwj0vZkBxFodRLsNRk/h4ckU4+Yc8imJEZ5po8mZ0Lsye+qn7OPImf8ApoQLlcCMUx1RklCl++zQPbGcc+1x3LYwkqcrXEemhGBgh0Pcu21d+/6foQgjd0AJr+TQt4mNLnJWqE9CrbDsWEJOhIsznTnNo6tEdhSsk9zqA01AkLtxGbPjqmp5p9A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 20:49:18.0668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a88ad216-58b1-4aa3-7029-08dc3a311068
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5681
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

A few more updates for 6.9.

The following changes since commit 31e0a586f3385134bcad00d8194eb0728cb1a17d:

  drm/amdgpu: add MMHUB 3.3.1 support (2024-02-19 14:50:46 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.9-2024-03-01

for you to fetch changes up to b07395d5d5e74e3a7e2e436fc0eced2b0f332074:

  drm/amdgpu: remove misleading amdgpu_pmops_runtime_idle() comment (2024-02-29 20:35:39 -0500)

----------------------------------------------------------------
amd-drm-next-6.9-2024-03-01:

amdgpu:
- GC 11.5.1 updates
- Misc display cleanups
- NBIO 7.9 updates
- Backlight fixes
- DMUB fixes
- MPO fixes
- atomfirmware table updates
- SR-IOV fixes
- VCN 4.x updates
- use RMW accessors for pci config registers
- PSR fixes
- Suspend/resume fixes
- RAS fixes
- ABM fixes
- Misc code cleanups
- SI DPM fix
- Revert freesync video

amdkfd:
- Misc cleanups
- Error handling fixes

radeon:
- use RMW accessors for pci config registers

----------------------------------------------------------------
Alex Deucher (3):
      Revert "drm/amd/pm: resolve reboot exception for si oland"
      Revert "drm/amd: Remove freesync video mode amdgpu parameter"
      Reapply "Revert drm/amd/display: Enable Freesync Video Mode by default"

Alvin Lee (2):
      drm/amd/display: Generalize new minimal transition path
      drm/amd/display: Remove pixle rate limit for subvp

Aric Cyr (2):
      drm/amd/display: Fix nanosec stat overflow
      drm/amd/display: 3.2.273

Armin Wolf (1):
      drm/amd/display: Fix memory leak in dm_sw_fini()

Asad Kamal (5):
      Revert "drm/amdgpu: Add pci usage to nbio v7.9"
      Revert "drm/amdgpu: Add pcie usage callback to nbio"
      drm/amdgpu: Remove pcie bw sys entry
      drm/amd/pm: Skip reporting pcie width/speed on vfs
      drm/amd/pm: Fix esm reg mask use to get pcie speed

Aurabindo Pillai (1):
      drm/amd: Update atomfirmware.h for DCN401

Bjorn Helgaas (1):
      drm/amdgpu: remove misleading amdgpu_pmops_runtime_idle() comment

Eric Huang (1):
      amd/amdkfd: remove unused parameter

Ethan Bitnun (1):
      drm/amd/display: Only log during optimize_bandwidth call

George Shen (1):
      drm/amd/display: Check DP Alt mode DPCS state via DMUB

Hawking Zhang (1):
      drm/amdgpu: Do not toggle bif ras irq from guest

Ilpo Järvinen (2):
      drm/radeon: Use RMW accessors for changing LNKCTL2
      drm/amdgpu: Use RMW accessors for changing LNKCTL2

Jonathan Kim (1):
      drm/amdkfd: fix process reference drop on debug ioctl

Kunwu Chan (3):
      drm/amdgpu: Simplify the allocation of fence slab caches
      drm/amdgpu: Simplify the allocation of mux_chunk slab caches
      drm/amdgpu: Simplify the allocation of sync slab caches

Lenko Donchev (1):
      drm/amd/display: Use kcalloc() instead of kzalloc()

Lewis Huang (1):
      drm/amd/display: Only allow dig mapping to pwrseq in new asic

Li Ma (1):
      drm/amd/swsmu: modify the gfx activity scaling

Lijo Lazar (4):
      drm/amdgpu: Add fatal error detected flag
      drm/amdkfd: Skip packet submission on fatal error
      drm/amdkfd: Add partition id field to location_id
      drm/amd/pm: Increase SMUv13.0.6 mode-2 reset time

Ma Jun (3):
      drm/amdgpu: Drop redundant parameter in amdgpu_gfx_kiq_init_ring
      drm/amdgpu: Fix the runtime resume failure issue
      drm/amdgpu/pm: Fix the power1_min_cap value

Mario Limonciello (1):
      drm/amd: Drop abm_level property

Melissa Wen (2):
      drm/amd/display: fix null-pointer dereference on edid reading
      drm/amd/display: check dc_link before dereferencing

Nicholas Kazlauskas (1):
      drm/amd/display: Fix S4 hang polling on HW power up done for VBIOS DMCUB

Prike Liang (1):
      drm/amdgpu: Enable gpu reset for S3 abort cases on Raven series

Rodrigo Siqueira (5):
      drm/amd/display: Initialize variable with default value
      drm/amd/display: Remove unused file
      drm/amd/display: Add SMU timeout check and retry
      drm/amd/display: Remove redundant FPU guard
      drm/amd/display: Drop unnecessary header

Saleemkhan Jamadar (1):
      drm/amdgpu/jpeg: add support for jpeg multi instance

Srinivasan Shanmugam (5):
      drm/amd/display: Fix potential null pointer dereference in dc_dmub_srv
      drm/amdgpu/display: Address kdoc for 'is_psr_su' in 'fill_dc_dirty_rects'
      drm/amd/display: Prevent potential buffer overflow in map_hw_resources
      drm/amdgpu: Fix missing break in ATOM_ARG_IMM Case of atom_get_src_int()
      drm/amd/amdgpu: Fix potential ioremap() memory leaks in amdgpu_device_init()

Stanley.Yang (1):
      drm/amdgpu: Fix ineffective ras_mask settings

Swapnil Patel (1):
      drm/amd/display: fix input states translation error for dcn35 & dcn351

Tao Zhou (1):
      drm/amdgpu: add deferred error check for UMC v12 address query

Tim Huang (2):
      drm/amdgpu: enable CGPG for GFX ip v11.5.1
      drm/amdgpu: reserve more memory for MES runtime DRAM

Veerabadhran Gopalakrishnan (3):
      drm/amdgpu/vcn: Enable VCN 4.0.6 Support
      drm/amdgpu/soc21: Added Video Capabilities for VCN 406
      drm/amdgpu/soc21: Enabling PG and CG flags for VCN 4.0.6

Victor Lu (4):
      drm/amdgpu: Improve error checking in amdgpu_virt_rlcg_reg_rw (v2)
      drm/amdgpu: Do not program IH_CHICKEN in vega20_ih.c under SRIOV
      drm/amdgpu: Use correct SRIOV macro for gmc_v9_0_vm_fault_interrupt_state
      drm/amdgpu: Do not program SQ_TIMEOUT_CONFIG in SRIOV

Wayne Lin (1):
      drm/amd/display: adjust few initialization order in dm

Wenjing Liu (1):
      drm/amd/display: reenable windowed mpo odm support on dcn32 and dcn321

Yang Wang (1):
      drm/amdgpu: enable pp_od_clk_voltage for gfx 9.4.3 SRIOV

Yifan Zhang (14):
      drm/amdgpu: add GFXHUB 11.5.1 support
      drm/amdgpu: add tmz support for GC IP v11.5.1
      drm/amdgpu: enable gmc11 discovery support for GC 11.5.1
      drm/amdgpu: add initial GC 11.5.1 soc21 support
      drm/amdgpu: enable soc21 discovery support for GC 11.5.1
      drm/amdgpu: add GC 11.5.1 to GC 11.5.0 family
      drm/amdgpu: add firmware for GC 11.5.1
      drm/amdgpu: add imu firmware support for GC 11.5.1
      drm/amdgpu: add mes firmware support for GC 11.5.1
      drm/amdgpu: initialize gfx11.5.1
      drm/amdkfd: add KFD support for GC 11.5.1
      drm/amdgpu: add GC 11.5.1 discovery support
      drm/amdgpu: enable MES discovery for GC 11.5.1
      drm/amdgpu: add vcn 4.0.6 discovery support

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   8 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  30 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |   8 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  33 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/atom.c                  |   2 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |  41 ++---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  17 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   8 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           | 177 ++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  15 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  63 --------
 drivers/gpu/drm/amd/amdgpu/si.c                    |  41 ++---
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  49 +++---
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  35 ++++
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |  38 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   7 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.h      |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |  10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   5 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  87 +++++-----
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c  |   2 -
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   2 -
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |   2 +-
 .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c |   2 -
 .../amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_clk.c |  79 ---------
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |  11 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c |   6 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 146 +++++++----------
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   7 +-
 .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.c    |   1 +
 .../drm/amd/display/dc/dcn301/dcn301_panel_cntl.c  |   1 +
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |  18 ++-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |  85 +++++++---
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.h  |   5 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   1 -
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   9 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   5 +
 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c     |   2 -
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |  31 ++--
 drivers/gpu/drm/amd/display/dc/inc/hw/panel_cntl.h |   2 +-
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |   2 -
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |   2 -
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |  26 +--
 .../drm/amd/display/dc/link/protocols/link_dpcd.c  |   2 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   2 -
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   1 +
 .../display/dc/resource/dcn321/dcn321_resource.c   |   2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   8 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   9 +-
 .../gpu/drm/amd/display/modules/inc/mod_stats.h    |   4 +-
 .../amd/include/asic_reg/nbio/nbio_7_9_0_sh_mask.h |   8 -
 drivers/gpu/drm/amd/include/atomfirmware.h         |  32 ++++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  35 +++-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  29 ++++
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  13 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   9 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   9 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  14 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   9 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  26 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   9 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   2 -
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |   5 +-
 drivers/gpu/drm/radeon/cik.c                       |  40 ++---
 drivers/gpu/drm/radeon/si.c                        |  40 ++---
 98 files changed, 853 insertions(+), 712 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_clk.c
