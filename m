Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE460ABA4D3
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 22:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3730110EB8B;
	Fri, 16 May 2025 20:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rr4k6OdT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DD110EB8B;
 Fri, 16 May 2025 20:46:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUiR4NCMZXnA1WOfYiiixC3HrUlX+iz4MfL4feGSvdYY0fvUnhMd3MeLo0Sswi0A3Kw2JN6O/R0QjRTltAa9QFjBMHhZDWrc03d9XooKPNpuIkV9+ca7CbNyYQ234gUOVOiQFvTzRYu4CUURtCVe8TNvNORgpHbUCIaNFst52FECP0fRL672WYulUgPS9a9Zu771JUCJLYrz+9c6bnTJHpCwWt/l3s9dVG9DZKePkc6AytYk0XOByawFfpug5NbEli31CNAIT8voFsCSUPoVFo0ojN1RWxTiJYqv7YVQ1ISiHGlXGEOy/Yh2wI+UBvGOclPCH4BkGWbNvtM//NkEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JB2gfQ1wwBxE3/a+5aF9dY4zM3J63bD04WLCLbeeqOY=;
 b=E4BYq0x+95R/AVdLaAwJYlMu7cIiHPeK861tUUcbFcyHh4zOGlPjgzso2MleSC80K7X9sSIPEEmMv6t+Rfpu9gdiY4hoyyhWgWE3nKHnb3sZcZ+iyBP/L6wN1PJQhXEWa/M9LUEOCqfJMtiW4jqvHD/AlX8oUwFVaUhwOADS8kyCkxDj4jwY/wwZcW12IOT6lq2C/gg3Q3w3W3yEn5u9Sxn7pNQlf095D+eVgBVkjWLMWVqsDsJDzzQ9X/J+fbPBPB+QKuHTMn6D0n2+rum3sYiSziFJErMYO6cIMJ9dqFeeY+xjarL+Gm0Kz+am+rQFKkxSkE1uHAAn34aUYnHwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JB2gfQ1wwBxE3/a+5aF9dY4zM3J63bD04WLCLbeeqOY=;
 b=rr4k6OdTxKis1EVfzGoRX3zWAYACpgWyOIuzv9m5vcoNkX7oTRLo1vSw6z8NK72kVkNBbXyne0e1pjy7fx2Dn4ByIjdVKXeZ1VGITYmWV2jxPfAW58rTQy3LXVSuAxZ44nZd9lL1vE10Nn8qXwb2ykWbeKib2uZoaIuNHWh3A3Y=
Received: from MW4PR04CA0198.namprd04.prod.outlook.com (2603:10b6:303:86::23)
 by CY1PR12MB9628.namprd12.prod.outlook.com (2603:10b6:930:105::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 20:46:26 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::bf) by MW4PR04CA0198.outlook.office365.com
 (2603:10b6:303:86::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Fri,
 16 May 2025 20:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 20:46:26 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 15:46:24 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.16
Date: Fri, 16 May 2025 16:46:09 -0400
Message-ID: <20250516204609.2437472-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|CY1PR12MB9628:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb90748-7174-47d7-aa52-08dd94baba07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3OYhBvGDJSUdizJQvv0RWUF5d7h3DskyI03ecCm8qPdCNMK0LVas8rVtc2F6?=
 =?us-ascii?Q?tw4MulSOkLTSun/ixn5NjRHpApdWGoBb87NzNwoharBPgbvkxCj7johOj7LI?=
 =?us-ascii?Q?x2gcFMcqLudrY/NHxWorWdNWCrIdSi1XMm2FbXKudq9iReq9qRDZ49HqlA9q?=
 =?us-ascii?Q?aJCVm7Tidjrl/QIf4LiLrU/fqe+mg+EzUQYpc+eHkykaWUdN/MvGz93f9Abp?=
 =?us-ascii?Q?ccsHUyXl+u1tkY0kpVOLTz+V82MFKtdpK1b+x5zWKTj6aHnIPgqlHlRlBJ25?=
 =?us-ascii?Q?H+DGvgMpLtvQ8yJip5at3LCIvXfoSHGaCzhMy+iYGpky8kzCyAvB+CzJbAqz?=
 =?us-ascii?Q?HDglZPhUd0yqv0gTRcvrWXCogu5lG7lFw9mhhhxpbVPKzjzvb53qIST9+k0G?=
 =?us-ascii?Q?ZYDxFd6s9vEUIuT4nY8aIavurEWRahMo/bOhal4J9HomFs9zb0b742Qt7tXE?=
 =?us-ascii?Q?WAVfhvV60/AGMYqtr/fonIHeGd4EdS2FNaDbSV3iThwIFbf02xos1T+dMyZF?=
 =?us-ascii?Q?Sl4B5a6eVk9cDS5eF5BuOmUTsVeFzvt7P4AiAHsrJ7Oy1ujh5glwjtGZzKwP?=
 =?us-ascii?Q?dVyQyh1RFUji/A6yJ3UvlB915hRwrWFyB9n7Tm+DajHQJNmv9Pf4yhhZKqXx?=
 =?us-ascii?Q?1fbFZPghhr3ufrPSmdF2ekdCmjmU2ssuMSIxQbZQkgFiDbjY/jxGxHrW3kJp?=
 =?us-ascii?Q?o6ncwR9Oi8S1rHNzRtkqFz3sjjdUSqQeNJq7Q7sJa0PnXHX8kghNZ3UGUxrG?=
 =?us-ascii?Q?GIXR7Gm1WsByfEWcM3FM//T+Ej4kPrj0T/osHc0u7D3FrHGgQSdPpg0D5LcB?=
 =?us-ascii?Q?gsf75GeE7NaplKXVRCGtZ8xvlFN+FVxWs0JgGzq3ONYdcnC0q9jdpeWO3qlD?=
 =?us-ascii?Q?BQFq+Ri3ubMi1lzOinWO+ufArKv+auZ4PnKkzd04WeiMmuAih+h4HeDpPYBG?=
 =?us-ascii?Q?LBNEEHsTJnufffBv6KmUWUcfRRjxKnYsiMZCa81skp8RuuQnVxJhLj8a4d9L?=
 =?us-ascii?Q?huqpXf8Ead+KfvkXeFiFTTkID2zhPvqy/nY9njq0lrQLxr/D3vMV6aSbVaKs?=
 =?us-ascii?Q?V4/TWohNBLrxBtbU36y3DRYTdN5+PyPSGSVsSOWLgBXGoXN2yWE+fY8TPmgE?=
 =?us-ascii?Q?1OK0k9+0sY7mqEgt4Ibv4vY9TYY2dLOoGNO2vqA/Ds/M1ECFDvR+VJQ7kxFm?=
 =?us-ascii?Q?bI/uyedZxIOFXJYV/DgbPOBj8nnk+7A1PbU9sXLOz4+lowhe1ojDfkM8cIPt?=
 =?us-ascii?Q?w350aGa+jsUcZ7zCDDkUOozN9NR7pPKK9RUE5zv1ZHmXC6aucaUB8jpz4fQ/?=
 =?us-ascii?Q?bQWXoGeVVCiQ/PM3h+mkmMvgKUDbkrc4TaVUUlyOYhHrqw2kaM2rTRFjRoNy?=
 =?us-ascii?Q?GvN1ka0OvZz3+a6i46SPaQLSZWTNeZsrqLVdV3jM88YxTtBnD4I78lHg0gRl?=
 =?us-ascii?Q?Dm6t1pr7gYFU6GCA25byhjRnCiTurb+m?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 20:46:26.0929 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb90748-7174-47d7-aa52-08dd94baba07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9628
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

Last few updates for 6.16.

The following changes since commit 1faeeb315fdbd005bbc1bc74214e39087971dda9:

  Merge tag 'amd-drm-next-6.16-2025-05-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-05-12 07:14:34 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.16-2025-05-16

for you to fetch changes up to 2f0268ca1cac4561b4710882c2d27afa32e42cb3:

  drm/amdgpu/jpeg: sriov support for jpeg_v5_0_1 (2025-05-16 13:39:14 -0400)

----------------------------------------------------------------
amdgpu:
- Misc code cleanups
- UserQ fixes
- MALL reporting fix
- DP AUX fixes
- DCN 3.5 fixes
- DP MST fixes
- DC DMI quirks cleanup
- RAS fixes
- SR-IOV updates
- GC 9.5 updates
- Misc display fixes
- VCN 4.0.5 powergating race fix
- SMU 13.x updates
- Paritioning fixes
- VCN 5.0.1 SR-IOV updates
- JPEG 5.0.1 SR-IOV updates

amdkfd:
- Fix spurious warning in interrupt code
- XNACK fixes

radeon:
- CIK doorbell cleanup

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdkfd: drop warning in event_interrupt_isr_v1*()

Amber Lin (1):
      drm/amdkfd: Support chain runlists of XNACK+/XNACK-

Arunpravin Paneer Selvam (3):
      drm/amdgpu/userq: Fix lock contention in userq fence
      drm/amdgpu: Fix userq ttm_bo_pin and ttm_bo_unpin lockdep warnings
      drm/amdgpu/userq: Fix DEBUG_LOCKS_WARN_ON(lock->magic != lock)

Arvind Yadav (3):
      drm/amdgpu: Fix NULL dereference in amdgpu_userq_restore_worker
      drm/amdgpu: Fix amdgpu_userq_wait_ioctl() warn missing error code 'r'
      drm/amdgpu: fix use-after-unlock in eviction fence destroy

Asad Kamal (1):
      drm/amdgpu: Add pldm version reporting

Aurabindo Pillai (2):
      drm/amd/display: use drm_dbg_driver() in amdgpu_dm.c
      drm/amd/display: check stream id dml21 wrapper to get plane_id

Bagas Sanjaya (1):
      Documentation/gpu: Disambiguate SPI term

Ce Sun (2):
      drm/amdgpu: Fix the kernel panic caused by RAS records exceed threshold
      drm/amdgpu: Modify the count method of defer error

Chiawen Huang (1):
      drm/amd/display: Skip backend validation for virtual monitors

Cruise Hung (1):
      drm/amd/display: Support external tunneling feature

David (Ming Qiang) Wu (1):
      drm/amdgpu: read back register after written for VCN v4.0.5

Dillon Varone (3):
      drm/amd/display: Backup and restore plane configuration only on update
      drm/amd/display: Fix race in dmub_srv_wait_for_pending
      drm/amd/display: Modify DCN401 DMUB reset & halt sequence

Dr. David Alan Gilbert (4):
      drm/amd/pm/smu13: Remove unused smu_v13_0_init_display_count
      drm/amd/pm: Remove unused smu_mode2_reset_is_support
      drm/amd/pm: Remove remainder of mode2_reset_is_support
      drm/radeon/cik: Clean up doorbells

Gabe Teeger (1):
      Revert: "drm/amd/display: Enable urgent latency adjustment on DCN35"

George Shen (1):
      drm/amd/display: fix link_set_dpms_off multi-display MST corner case

Jesse.Zhang (3):
      drm/amdgpu: Fix user queue deadlock by reordering mutex locking
      drm/amdgpu: Add GFX 9.5.0 support for per-queue/pipe reset
      drm/amdgpu: Fix circular locking in userq creation

John Olender (1):
      drm/amd/display: Defer BW-optimization-blocked DRR adjustments

Karthi Kandasamy (1):
      drm/amd/display: Move mcache allocation programming from DML to resource

Lijo Lazar (4):
      drm/amdgpu: Log RAS errors during load
      drm/amd/pm: Move SMUv13.0.12 function declarations
      drm/amdgpu: Use compatible NPS mode info
      drm/amdgpu: Allow NPS2-CPX combination for VFs

Mario Limonciello (1):
      drm/amd/display: Restructure DMI quirks

Melissa Wen (2):
      drm/amd/display: Fix null check of pipe_ctx->plane_state for update_dchubp_dpp
      Revert "drm/amd/display: Hardware cursor changes color when switched to software cursor"

Michael Strauss (1):
      drm/amd/display: Add early 8b/10b channel equalization test pattern sequence

Nevenko Stupar (1):
      drm/amd/display: Fix the typo in dcn401 Hubp block

Ovidiu Bunea (1):
      drm/amd/display: Add GPINT retries to ips_query_residency_info

Philip Yang (1):
      drm/amdgpu: csa unmap use uninterruptible lock

Prike Liang (1):
      drm/amdgpu: fix userq resource double freed

Samson Tam (2):
      drm/amd/display: disable EASF narrow filter sharpening
      drm/amd/display: add support for 2nd sharpening range

Sebastian Aguilera Novoa (1):
      drm/amd/display/dc/irq: Remove duplications of hpd_ack function from IRQ

Shiwu Zhang (1):
      drm/amdgpu: add debugfs for spirom IFWI dump

Sung Lee (1):
      drm/amd/display: Program triplebuffer on all pipes

Taimur Hassan (4):
      drm/amd/display: [FW Promotion] Release 0.1.10.0
      drm/amd/display: Promote DC to 3.2.333
      drm/amd/display: [FW Promotion] Release 0.1.11.0
      drm/amd/display: Promote DAL to 3.2.334

Tao Zhou (7):
      drm/amd: add definition for new memory type
      drm/amdgpu: adjust high bits for RAS retired page
      drm/amdgpu: add get_retire_flip_bits for UMC
      drm/amdgpu: implement get_retire_flip_bits for UMC v12
      drm/amdgu: get RAS retire flip bits for new type of HBM
      drm/amdgpu: set flip bits for RAS bad pages
      drm/amdgpu: set vram type for GC 9.5.0

Tim Huang (1):
      drm/amdgpu: fix incorrect MALL size for GFX1151

Tomasz Siemek (1):
      drm/amd/display: Extend dc_plane_get_status with flags

Wayne Lin (3):
      drm/amd/display: Correct the reply value when AUX write incomplete
      drm/amd/display: Return the exact value for debugging
      drm/amd/display: Avoid flooding unnecessary info messages

Yihan Zhu (1):
      drm/amd/display: init local variable to fix format errors

fanhuang (4):
      drm/amdgpu: add vcn v5_0_0 ip headers
      drm/amdgpu/mmsch: Add MMSCH v5_0 support for sriov
      drm/amdgpu/vcn: sriov support for vcn_v5_0_1
      drm/amdgpu/jpeg: sriov support for jpeg_v5_0_1

ganglxie (1):
      Refine RAS bad page records counting and parsing in eeprom V3

 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 104 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  29 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  71 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |  17 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  35 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         | 105 ++++----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  41 +++-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  12 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           | 142 ++++++++++-
 drivers/gpu/drm/amd/amdgpu/mmsch_v5_0.h            | 144 +++++++++++
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  44 +++-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             | 136 +++++++----
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |   3 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   8 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            | 265 +++++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |  56 ++++-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h    |   3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 194 ++-------------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   9 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  16 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c   | 178 ++++++++++++++
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  53 +++--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  13 +
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |  22 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  19 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  21 ++
 drivers/gpu/drm/amd/display/dc/dc_plane.h          |  13 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   4 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |  20 +-
 .../dc/dml2/dml21/dml21_translation_helper.h       |   2 +
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |  40 ++++
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.h  |  64 +++++
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   2 +
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |   5 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |   2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  24 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   5 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   3 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   8 +
 .../amd/display/dc/irq/dce120/irq_service_dce120.c |  29 +--
 .../amd/display/dc/irq/dce60/irq_service_dce60.c   |  31 +--
 .../amd/display/dc/irq/dce80/irq_service_dce80.c   |  31 +--
 .../amd/display/dc/irq/dcn10/irq_service_dcn10.c   |  29 +--
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |  29 +--
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |  29 +--
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |  29 +--
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.c   |  30 +--
 .../amd/display/dc/irq/dcn302/irq_service_dcn302.c |  19 +-
 .../amd/display/dc/irq/dcn303/irq_service_dcn303.c |  19 +-
 .../amd/display/dc/irq/dcn31/irq_service_dcn31.c   |  29 +--
 .../amd/display/dc/irq/dcn314/irq_service_dcn314.c |  29 +--
 .../amd/display/dc/irq/dcn315/irq_service_dcn315.c |  29 +--
 .../amd/display/dc/irq/dcn32/irq_service_dcn32.c   |  29 +--
 .../amd/display/dc/irq/dcn35/irq_service_dcn35.c   |  29 +--
 .../amd/display/dc/irq/dcn351/irq_service_dcn351.c |  29 +--
 .../amd/display/dc/irq/dcn36/irq_service_dcn36.c   |  29 +--
 .../amd/display/dc/irq/dcn401/irq_service_dcn401.c |  29 +--
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |  64 +++++
 drivers/gpu/drm/amd/display/dc/irq/irq_service.h   |   8 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |  21 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  19 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   1 +
 .../display/dc/link/protocols/link_dp_capability.c |  16 +-
 .../display/dc/link/protocols/link_dp_capability.h |   3 +
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |  54 ++++-
 .../amd/display/dc/link/protocols/link_dp_dpia.h   |   6 +
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |  70 ++----
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |   4 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |   4 +-
 .../display/dc/link/protocols/link_dp_training.c   |   1 -
 .../dc/link/protocols/link_dp_training_8b_10b.c    |  52 +++-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c       |   4 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl_types.h |   4 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |  14 ++
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  84 ++++++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |  16 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |  58 ++---
 .../drm/amd/display/include/link_service_types.h   |   2 +
 .../amd/include/asic_reg/vcn/vcn_5_0_0_offset.h    |  16 ++
 .../amd/include/asic_reg/vcn/vcn_5_0_0_sh_mask.h   |  23 ++
 drivers/gpu/drm/amd/include/atomfirmware.h         |   1 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  13 -
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   6 -
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  11 -
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   6 -
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   6 -
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  12 -
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   6 -
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |   8 +
 drivers/gpu/drm/radeon/cik.c                       |  42 +++-
 include/uapi/drm/amdgpu_drm.h                      |   1 +
 114 files changed, 2043 insertions(+), 1128 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmsch_v5_0.h
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c
