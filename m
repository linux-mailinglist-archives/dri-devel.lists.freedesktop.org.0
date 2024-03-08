Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563FE876953
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 18:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24102113929;
	Fri,  8 Mar 2024 17:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gC6ekQii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A361113925;
 Fri,  8 Mar 2024 17:08:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6knGWm+Eho00ti6ZzVa61azg/q9AWJBDa5q9Q9BlNrqQhEyQsBau5poH4dkMrKhHRrkTZY0lbwaHOemr2jrAxBYhgpAF8TVgB+pR5jQ5RQQ5qfFNzf8vfcr0PyESQbpwa1n5LDnj4AwJaDTDOEt43mn9TTyeI2TV1TXv5Fpdk9425vhXJhzIM6CkIBbr13SkdGXdKr+BKkhAjAKkxob6wqg5cL2UwDaP/GLUi0/0rzDRGGtC9mFCvB9NJ5jEijeXYHZ7Qt2bT1XtfUat6qhejNHHjYTWNlO8VX4lmPhFrtRhFSCd/NBn9tYRsqoqUvtO9J6eWzyYoINM2CrtaCSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Blu1Pn7o4yp6U9e2kYo/UqPYEV+UxnoW4TzoZhXNIM=;
 b=FTkBzuOmG2HcCP8y5F+4Ia6pgHgAm5PtRpBkkLE1E4c2Tp5W1ilODBOr7P/xbns4JPx+mC04mthfvuERLKi246YKS8Gw42ecpedsrvEJNu4OEBBxXaoiHdCWh4oyc37L3DqwpPNZWXdpyC23g3jLCAvo6QA0PR/AzOG7O7sxExA0wcPbpLbB8JuJKG49fGt0aMKH6ngQQctfNS13L9CzwqXbafJQl+8oOD+pAZxuymhhgt4mLLtK8gzDNuP9MoYT7Ur6ZmQRf3KvoCMPDQoR5WNh/brqjj0YY0ZnaW14LfT9617uaj0dzUXdVAkgNZtQdeJcoh+i+fKWIehCvKz4zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Blu1Pn7o4yp6U9e2kYo/UqPYEV+UxnoW4TzoZhXNIM=;
 b=gC6ekQiiJVQ9VvY9pHsGGXQxNHVE4UpqtL/qoSdPTqCdXCSuaUFF3wsLC4sl/Qkwzp+08f+bhaSeHdNTta1TRqBkKxUFlYtjPmJE9TTVlraA/vs6TXUQH061JD7/RLeNRrpKmrD8MyeqYJLlwKh0PQ+zbeL1mEZ+p1mhEL2Ueq4=
Received: from BN9PR03CA0338.namprd03.prod.outlook.com (2603:10b6:408:f6::13)
 by DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 17:07:57 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:f6:cafe::d4) by BN9PR03CA0338.outlook.office365.com
 (2603:10b6:408:f6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.28 via Frontend
 Transport; Fri, 8 Mar 2024 17:07:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 17:07:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 8 Mar
 2024 11:07:56 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.9
Date: Fri, 8 Mar 2024 12:07:40 -0500
Message-ID: <20240308170741.3691166-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|DS0PR12MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d5096d-d0eb-4e9d-c31d-08dc3f924d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tb+tMIx1cg6/NhjdWB+X7dabV6Pwo78vR4yqjUcO236ECHEfYZNZqjnzAKjEgK9hhwwJ/PBaRHgtlevncuLEYwO2Zq9mbYb0ZTPyAa3aPMahfRAWGnePIvSE0UvK5zAnVgBye2iQ0HzSieZ3V7yQ3+D79QiZ6Jl/y4qApMVpVP8L3cRSv8maM4lrgPbYtsrfEZddn7s29DK3qHM3ejOqjbHXRrk1cNDGODTkTT1IUmakGL7Rnrvq8XzQcCSJ1trGOrBnMr/0rSJv/WwGILt2sp7ywKxQnzaVQq1StS652dCSWmhU4aNRtk9GD2H0ac586rHuVZqBndP8dfYKOS3TYVXiUwBYHm/V1yPT7uzTLe7xkbG2LPpBl9csRLmi5HxmumcD1876/mgwti19DOiiMr1Cp81cLpOEVXmbRPvpveOhrUZDZm6IACpFuRvaV27yGpZcPEYamOiAz/d2F1M0eRia7NVFgjyYMcw8kSGLZL5vwGQudpQw3yZ3zx8eyqmM9rUvRXIL4UPMMbLssdpPJ1XJElubQQ9i3O4olcRQ7HM99hbY7KbH88ReVIPB2zwIgJNuTEm9WfO/WSTVIjg3zv7+/LXaUhRwFJZcOBDsfCFEm5U9v+GxcZojYbuh0cWHARkMbLBYv0q8FojhlmFXCDOyIq7G+vfZOmj801LYiQO1x9q2nhuApZCVuxgyFCWJ2/+EyHFdgseO95rgMLlYMw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400014)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 17:07:57.3033 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d5096d-d0eb-4e9d-c31d-08dc3f924d3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8317
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

A bit late for new features for 6.9, but the new stuff here is support for
new IPs that shouldn't affect any existing chips, the rest is bug fixes.

The following changes since commit b07395d5d5e74e3a7e2e436fc0eced2b0f332074:

  drm/amdgpu: remove misleading amdgpu_pmops_runtime_idle() comment (2024-02-29 20:35:39 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.9-2024-03-08-1

for you to fetch changes up to 5eabf0cd2673556f657a98f69f3b8248bbb1d131:

  drm/amd/display: Removed redundant @ symbol to fix kernel-doc warnings in -next repo (2024-03-07 15:33:39 -0500)

----------------------------------------------------------------
amd-drm-next-6.9-2024-03-08-1:

amdgpu:
- DCN 3.5.1 support
- Fixes for IOMMUv2 removal
- UAF fix
- Misc small fixes and cleanups
- SR-IOV fixes
- MCBP cleanup
- devcoredump update
- NBIF 6.3.1 support
- VPE 6.1.1 support

amdkfd:
- Misc fixes and cleanups
- GFX10.1 trap fixes

----------------------------------------------------------------
Alex Deucher (2):
      drm/amd/display: handle range offsets in VRR ranges
      drm/amdgpu: add VPE 6.1.1 discovery support

Christian König (2):
      drm/amdgpu: cleanup conditional execution
      drm/amdgpu: workaround to avoid SET_Q_MODE packets v2

Hamza Mahfooz (6):
      drm/amd/display: add DCN351 version identifiers
      drm/amd: add register headers for DCN351
      drm/amd/display: add DMUB source files and changes for DCN351
      drm/amd/display: add DCN351 IRQ changes
      drm/amd/display: add DC changes for DCN351
      drm/amd/display: add amdgpu_dm support for DCN351

Hawking Zhang (3):
      drm/amdgpu: Add nbif v6_3_1 ip headers (v5)
      drm/amdgpu: Add pcie v6_1_0 ip headers (v5)
      drm/amdgpu: Add nbif v6_3_1 ip block support

Jesse Zhang (2):
      Revert "drm/amdgpu: remove vm sanity check from amdgpu_vm_make_compute" for Raven
      drm/amdgpu: remove unused code

Lang Yu (5):
      drm/amdgpu/vpe: add multi instance VPE support
      drm/amdgpu/vpe: add PRED_EXE and COLLAB_SYNC OPCODE
      drm/amdgpu/vpe: add collaborate mode support for VPE
      drm/amdgpu/vpe: don't emit cond exec command under collaborate mode
      drm/amdgpu/vpe: add VPE 6.1.1 support

Laurent Morichetti (2):
      drm/amdkfd: Increase the size of the memory reserved for the TBA
      drm/amdkfd: Use SQC when TCP would fail in gfx10.1 context save

Likun Gao (1):
      drm/amdgpu/discovery: add nbif v6_3_1 ip block

Ma Jun (2):
      drm/amdgpu/pm: Fix the error of pwm1_enable setting
      drm/amdgpu: Use rpm_mode flag instead of checking it again for rpm

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: disable ring_muxer if mcbp is off

R SUNDAR (1):
      drm/amd/display: Removed redundant @ symbol to fix kernel-doc warnings in -next repo

Ricardo B. Marliere (1):
      drm/amdkfd: make kfd_class constant

Shashank Sharma (1):
      drm/amdgpu: change vm->task_info handling

Sunil Khatri (1):
      drm/amdgpu: add ring timeout information in devcoredump

Tim Huang (1):
      drm/amd/pm: wait for completion of the EnableGfxImu message

Yang Wang (1):
      drm/amd/pm: disable pp_dpm_dcefclk node for gfx 11.0.3 sriov

Yifan Zhang (2):
      drm/amdgpu: add dcn3.5.1 support
      drm/amdgpu: add smu 14.0.1 support

lima1002 (1):
      drm/amdgpu/soc21: add mode2 asic reset for SMU IP v14.0.1

 drivers/gpu/drm/amd/amdgpu/Makefile                |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   190 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |   110 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |    77 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.h            |     5 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    28 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   113 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    28 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    49 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    24 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    23 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |    20 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    23 +-
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c           |   495 +
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h           |    33 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    23 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |    22 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    29 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    29 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    29 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |     1 +
 drivers/gpu/drm/amd/amdgpu/vpe_6_1_fw_if.h         |     3 +-
 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c              |   281 +-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |   543 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |   156 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    21 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    23 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |    20 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    28 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |     1 +
 .../amd/display/dc/bios/command_table_helper2.c    |     1 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |     6 +
 .../display/dc/dcn35/dcn35_dio_stream_encoder.h    |     1 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     3 +
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |   574 +
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.h |    19 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     1 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     1 +
 drivers/gpu/drm/amd/display/dc/hwss/Makefile       |     8 +
 .../drm/amd/display/dc/hwss/dcn351/CMakeLists.txt  |     4 -
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |     7 +-
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |    11 +-
 .../amd/display/dc/irq/dcn351/irq_service_dcn351.c |   409 +
 .../amd/display/dc/irq/dcn351/irq_service_dcn351.h |    12 +
 drivers/gpu/drm/amd/display/dc/resource/Makefile   |     8 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |  2156 +
 .../display/dc/resource/dcn351/dcn351_resource.h   |    23 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     1 +
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |     1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn351.c |    34 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn351.h |    13 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |     4 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     2 +
 .../amd/include/asic_reg/dcn/dcn_3_5_1_offset.h    | 15259 ++++++
 .../amd/include/asic_reg/dcn/dcn_3_5_1_sh_mask.h   | 53464 +++++++++++++++++++
 .../amd/include/asic_reg/nbif/nbif_6_3_1_offset.h  | 11287 ++++
 .../amd/include/asic_reg/nbif/nbif_6_3_1_sh_mask.h | 32806 ++++++++++++
 .../amd/include/asic_reg/pcie/pcie_6_1_0_offset.h  |   630 +
 .../amd/include/asic_reg/pcie/pcie_6_1_0_sh_mask.h |  4250 ++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    59 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |     2 +
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |    16 +-
 74 files changed, 122906 insertions(+), 791 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn351/CMakeLists.txt
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn351.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn351.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_5_1_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_5_1_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/nbif/nbif_6_3_1_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/nbif/nbif_6_3_1_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/pcie/pcie_6_1_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/pcie/pcie_6_1_0_sh_mask.h
