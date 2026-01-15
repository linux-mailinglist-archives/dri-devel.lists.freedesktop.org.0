Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577D1D288AF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 21:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A67E10E257;
	Thu, 15 Jan 2026 20:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aqSYeVaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013060.outbound.protection.outlook.com
 [40.93.201.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6B510E109;
 Thu, 15 Jan 2026 20:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPTLcasqQG0nAzMR4VsFJlZOTtRNhH/u4IwJZ8QSVaG0dYmMqQ279JF6lrjYdoP4ie9u0QDlwRf04Et9H020EXKrQ18BfqZl+wZkfXpCf8TQU1iojogI7MHOmGzgpLE3SoH6EWiPCQJ+6Z2huSyZ+IaN1r8MtiUr5zEKizd4aARTUZt1H38XiyQOxI+u2YDRh+rZcCAMSFibsyKKmH9K7vhuBNmLNpBJTV3hOuPWCMx+wWWJ/X8nRd23KdB0385nRbfosbALDj2Ql9dTKV7DCBbhSv67E9irQOWstkZCojAMCSS852LPSyGs8v/aVsRUfyyDfuVNDQvx3RjkxqGPrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLOzhs+o9Ynx2oWAAF4QZV5yokhmfToeltOFCCtSZhE=;
 b=Vt0QaTeO2XTEuKIqnHQJ0qBTklFKtXgNc+QUPEQP+VmjVksg8d5s3Wp/eQjYkI1S+liMc5SyouOIfHE0FZeHZlKygjUW7mSBr7HKFaqzofdhxCqk9qLA3O/kBFHUZVsUaOHMKtBQzosFj8RkwXSU17cfSuE+KvSs5o6cxjBsqAyPWmuyCaLfOJvILSU8mulFHqBnFnIjs/dJcxC8ySN9c6a8ksn7DhRgIc+OquA5Y9WwGjXU78R2vhltprYK0GujSmNg64Sl2vBcrwLbTF+xzO1w1hgDsfkjexhfI6dqFNFr0bBwiDir7PT0RLDn5Aj8uzuFWSpZ1wSRxVeN5f2ZFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLOzhs+o9Ynx2oWAAF4QZV5yokhmfToeltOFCCtSZhE=;
 b=aqSYeVaY5rXoWNUFCWAqZr4ZmAhUVjpp4WghMN5SePApR0wJjpENS1r15xG5/u7UjkDWmdQ7ccGcu608+invXx57UmvObifhggj/bAdMf4PQitxBcd40Ka3tGAPllm5LCsuZSTFLv2kcHFfulQNbt1bRKd51rOin0d0+aGrjpbk=
Received: from BYAPR08CA0049.namprd08.prod.outlook.com (2603:10b6:a03:117::26)
 by DS0PR12MB6463.namprd12.prod.outlook.com (2603:10b6:8:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 20:54:22 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:117:cafe::47) by BYAPR08CA0049.outlook.office365.com
 (2603:10b6:a03:117::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Thu,
 15 Jan 2026 20:54:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 20:54:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 15 Jan
 2026 14:54:17 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 15 Jan 2026 14:54:16 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.19
Date: Thu, 15 Jan 2026 15:54:05 -0500
Message-ID: <20260115205405.1890089-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|DS0PR12MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d09b23d-1058-487b-a28b-08de5478422a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+OM2dJE2ajIt5aFtnmEIS9Qb6tGt40Apnszj++judMdGW6baiOaNMxWbY6pc?=
 =?us-ascii?Q?7+9CDrjEJSnKTr2EgdXNZrFSiJIwpnOwOP2xWnbHftyEkGOqz/OiYggnPHWL?=
 =?us-ascii?Q?YQfPn690Mbhab45s5Dk3WA08O5mBCv8MdC4U5Q7EihTtzK2RLnFaNY3rSsg/?=
 =?us-ascii?Q?sGw5mieFaKXJDDDHwVnTpcPyamhpxUgDFmWdnkXTc82xHd7H8HXtD8GSWzwF?=
 =?us-ascii?Q?azpHNeCx4TzENxw1MWbyh9qb3kw0rDwuncjLeRLzRy/vdzMi1hffDRz5WSXL?=
 =?us-ascii?Q?9GCTEBbPWeZLqXWUtgtok+tJxoK+lFaoaVLF0yQ8RO31CFRf8grHa4CVvD1C?=
 =?us-ascii?Q?Le6aBRhKunS8blnRBLbTpuKHUuCMenSH/EEJoPhu4VoZn4Xdc9nnHH7WQrUh?=
 =?us-ascii?Q?IxcAfqDLFNltMb9mrSptebGexC1+WX4+k8fFZiXLZWWQutP/RehCcvvx030R?=
 =?us-ascii?Q?UO6A3jTZdtIfAOISupdUZ2gbN2GOHZm9a3vCnRxqF3PPUXxNPc4Lt2JKsItr?=
 =?us-ascii?Q?WwGGCx7rGCGfGOwLNwB/yVcFSKeDkK2Qy5eJflZPG0tbG4EeZHagrY8+oC0L?=
 =?us-ascii?Q?sEMIUyE+UoKe0C7n7NhEKKbiL9ZpiG2HtSnksWnt4KTqAc/mWG24kaWh0T0X?=
 =?us-ascii?Q?z7ig/dBV6TfGuxl7xSr+46jtNywMCV4sLr4ITpx1x/ySpFNilXmux0xGCgt3?=
 =?us-ascii?Q?YE4fkQ5IEZCb5SC72L9N2wCc4NGB6zvCxuVzrbx7pdd/DjcEFy/I7vAfSXCQ?=
 =?us-ascii?Q?81lBldq6k8IlL1TLYeVvoB8RoMuJx1dC+H8BQCLqyE28NHT93z1vLHPNDImp?=
 =?us-ascii?Q?ETPN+csKeDa+Z3EfQUx+QffPI2zHKDrex0MPWudvPqTW7xVuYmQdKBpka48K?=
 =?us-ascii?Q?F7mqJxOT94dNXkhQt8kLRKMhE0c6HJMsOcXh5oyoeo7bJXhdH4I17NjLcwuK?=
 =?us-ascii?Q?r0thC749FUWsNNFjAVN3YgMwZZ/V6MeuCHXwtE5FFm/VuzdZC93FrBjQ/G0k?=
 =?us-ascii?Q?t9M7LmKhxu5oVOSvtYauu8+8Uoq8CgtwGwn+0NCC2Jwvty2k+CDhYZF3hGkS?=
 =?us-ascii?Q?vVWIloDzFYwGhQrn4i1Z12kMzJgePM3V/nQcA+B05o4l4V7WX1KTX4crehFn?=
 =?us-ascii?Q?M8RMORM2pGFFg4JOvBJ01Bft+n7eUn+oPPYk9IKi5z436CygFjZR76y3Hu1q?=
 =?us-ascii?Q?QTUI+997kTmyj1188IydHCL61FvFH3A4o4SAIYhG1mSGtufRy7vGNHJ+nNF8?=
 =?us-ascii?Q?XirpipCVT494xHvHn3lzZk6PuoJfb4/ntTtuGmlTTY828aigN1/FHgAOs5ZG?=
 =?us-ascii?Q?O6deIZERM5oC7GwzNiDzKKQyipoUdTnpIlb4qrmLFVz4790nv+H4IoNZ1n61?=
 =?us-ascii?Q?9TJwCMXoSem/ZRfpeqbNZKddI3fvxW13YHKHXlj/SkcDGOdk5lsnHZvSERLN?=
 =?us-ascii?Q?l8oZf0/ZKGJMmNubWatnSNaJkCrd7+HEzg44z1mR/3LQzG2oUWzLOx9MH4f2?=
 =?us-ascii?Q?3W4NjK2lWK57s/UIX7f6Lu7m7McerssU5kjHcWB6eOG+d6tn802A21nM9IlM?=
 =?us-ascii?Q?judxNAArFM7hu9YFNi9WEOqBPqq2T/ItHIDD+WrlOOznfZ1qLrOboUZESchU?=
 =?us-ascii?Q?Mw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 20:54:21.4742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d09b23d-1058-487b-a28b-08de5478422a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6463
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

Hi Dave, Simona,

Fixes for 6.19.

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.19-2026-01-15

for you to fetch changes up to d04f73668bebbc5a44a2771ea92b6ec253148050:

  drm/amd/display: Add an hdmi_hpd_debounce_delay_ms module (2026-01-14 15:07:43 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.19-2026-01-15:

amdgpu:
- GC 9 PTE mtype fix
- Non-DC display kernel panic helper fix
- Merge fix
- GART vram access fix
- Userq fixes
- PSR debugging fix
- HDMI fixes
- Backlight fix
- SMU 14 fix
- TLB flush fixes

amdkfd:
- KFD node cleanup for eGPU disconnect
- Memory leak fix
- MES evict process fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: make sure userqs are enabled in userq IOCTLs

Haoxiang Li (1):
      drm/amdkfd: fix a memory leak in device_queue_manager_init()

Harish Kasiviswanathan (1):
      drm/amdkfd: No need to suspend whole MES to evict process

Ivan Lipski (1):
      drm/amd/display: Add an hdmi_hpd_debounce_delay_ms module

Lu Yao (1):
      drm/amdgpu: fix drm panic null pointer when driver not support atomic

Mario Limonciello (1):
      drm/amd/display: Bump the HDMI clock to 340MHz

Mario Limonciello (AMD) (2):
      drm/amd: Clean up kfd node on surprise disconnect
      drm/amd/display: Show link name in PSR status message

Peter Colberg (1):
      Revert duplicate "drm/amdgpu: disable peer-to-peer access for DCC-enabled GC12 VRAM surfaces"

Philip Yang (1):
      drm/amdgpu: Fix gfx9 update PTE mtype flag

Prike Liang (2):
      drm/amdgpu: validate the flush_gpu_tlb_pasid()
      Revert "drm/amdgpu: don't attach the tlb fence for SI"

Srinivasan Shanmugam (1):
      drm/amdgpu/userq: Fix fence reference leak on queue teardown v2

Vivek Das Mohapatra (1):
      drm/amd/display: Initialise backlight level values from hw

Xiaogang Chen (1):
      drm/amdgpu: Use correct address to setup gart page table for vram access

Yang Wang (1):
      drm/amd/pm: fix smu overdrive data type wrong issue on smu 14.0.2

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  8 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  7 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        | 12 --------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 11 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  4 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          | 16 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |  8 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  4 +--
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  8 ++---
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  | 31 ++++++++-----------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 36 +++++++++++++++++++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  5 ++-
 drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h     |  2 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |  4 ++-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  3 +-
 18 files changed, 116 insertions(+), 50 deletions(-)
