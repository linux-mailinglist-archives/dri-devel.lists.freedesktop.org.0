Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074A091C827
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 23:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8606010E0F4;
	Fri, 28 Jun 2024 21:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wcqz2owd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070E910E0BB;
 Fri, 28 Jun 2024 21:32:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTQpl4d7BR+eIVQ+DTre9EF/yFaD0XE5qVLLm3uX6vMLxDWtRk/vsMSEKKzOLVgaOPO/GUY14o+xYKontKcvlL3+1D5y8DiNZxIDKlb7+K7CqCCv8r9Lw0SWfDsW+Ys6JZL/hkgg1gsz7SOkDeHhA67bYs9xSTx0DILjP2eDsaH1+BRkhbPm9a3MYmHZK9RP2lHqYniYN64/YyJY95MYkUcHV+xZOdzwEGYSwvv+hB0nQnI1rWPOuN08wJEwXqlde0LykRUTvmr4h/ktQS0QbmYy44EKQJojxaXPxOJs5tiksNIeXRCu9gs3krmphc6TVSSXzg3/CxrYWXkQvwDaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UVZ3U0M3BQL+8XutU6DOlp88ODBEXGS+0ZkZHB1V/0=;
 b=XFw7a99kCxPPD9yueqRFt33+dozWKqSzGN+MzalBOLdCDP5e69bpXso9+DAHzgTBwJ3IvM4nWKWRjzbPV5EvFSWkRy/IOnNJc5zEUYLEeIfJcDMwLuvPO+DlnDeWUrU5c3iq9+7IxZ4Tro7FYHdQgiAb+ZXcN4rI1VDXlwV3mmSKbLFQ2EJl5++sFUQeqxuD32MRaHDD/pBDWDN9f/yNHtwoLhyKCNk0/P/zYX4wbLEHDcmotLfDrt6DHLjrmLsr/QiismMJLaLfoHa/VkrCNQyOSRZ/86hRn7WktqneGF+fUpc55TzJh1Gid1txI/2tT/gW7ebkK3bKmz48bRXKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UVZ3U0M3BQL+8XutU6DOlp88ODBEXGS+0ZkZHB1V/0=;
 b=wcqz2owdpalkJMQPt+qA6qyGeyJPvLjJr+6EzAqUMo6WYJD0R22YQDiBNnsyKFdmjxTD+JQFezzoTDU24QWpAE0wxoSQ6VejmatMhhQSwj/22YmEayZjc3OpqAKtyWqnAVfl2cgby7IiG0Fog47n6VCs3t5JtTzub/vFfGsG6fc=
Received: from BL1PR13CA0247.namprd13.prod.outlook.com (2603:10b6:208:2ba::12)
 by MW3PR12MB4492.namprd12.prod.outlook.com (2603:10b6:303:57::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 21:31:56 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::65) by BL1PR13CA0247.outlook.office365.com
 (2603:10b6:208:2ba::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.20 via Frontend
 Transport; Fri, 28 Jun 2024 21:31:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 28 Jun 2024 21:31:56 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Jun
 2024 16:31:50 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.11
Date: Fri, 28 Jun 2024 17:31:35 -0400
Message-ID: <20240628213135.427214-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|MW3PR12MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d64cc3c-5e78-4cea-0046-08dc97b9bc84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cTR1sc0gcy+zdN+2I+b5aVIhZjyoIc1JZTL+6+Tb140EIvE41rZGDjmGO1rN?=
 =?us-ascii?Q?+8YHhTEav21IkFTFCbNVQeUSiFHVyWVZq2bR+PFjhWdRRzAK6YfamnCO6HKK?=
 =?us-ascii?Q?lI5x8WUkexcKhr6/Bd4837O5vxqEuhfqdiFfqKCngpaA/U0Qcg/QnqiknKE4?=
 =?us-ascii?Q?Ow/xtIY9iEg6/fcQmLuCO4fYjR2jnGQ7GXZ14cvawFFjaMCU6kz4XlsIcwvi?=
 =?us-ascii?Q?YtRR822Cy9D3iKN51IaXB2JL9BDhFe65D2Fh06K1/FjFoNQp9Y2Hgr+PcIt7?=
 =?us-ascii?Q?BZVk6wOQzQ9sebb7t8jhTb2sV+vZeEKNuw3rf2fQXJtCe6s/Ozc+f866mTCa?=
 =?us-ascii?Q?/KgEetZu75KW5/ijZPZnj3oDEpUiZr2Vc638J/I585skzUDrfX9BOJ2D2ooM?=
 =?us-ascii?Q?O4+yKbeSYnvyFWDvjWJ+52ENI/9ImuWtWsNc/9/b7TIpbmvc11XbqPGiPJDy?=
 =?us-ascii?Q?6SsuQPaQrPfOW6SkMf2JRORFuO/yMX6zHVa949+4cxGW7hc2F0Xjtbpzao/r?=
 =?us-ascii?Q?ItMzvRPH0wH70Vxes1tioYGfKeCa4ZKhgK6dE/OPinPvkbD+5yJ6elQcZsvk?=
 =?us-ascii?Q?bhE7GGo+GcZOUq13kSo2m0tK9xm7gkx4bv51VZCfzH1K9ysCBm+gmz9bIiuE?=
 =?us-ascii?Q?V2xfGn7T83rX9f6CeVzxXfz9KQwbsz/e/Qdf625xAa5jOzl5Eh3yNTfFDBJd?=
 =?us-ascii?Q?RwMZcqgzl4H9YmMPvY+3odcxdOwGqUWu/2bF6RRBYRAB9r/6VKQVrwKfc5r3?=
 =?us-ascii?Q?hP83L33TiNqpRHlhXPQZTVP5EUia/3ySb9U1rl7rK2Y2pOVOSdGyDkgUYKu0?=
 =?us-ascii?Q?ZuVeJdZjiBLvrWtiN0s37LdZhMI7zgxAF5kuKDNxwIF2SRHEfrjkF+jGggwO?=
 =?us-ascii?Q?cfBA2eO4ppDSF+Y7/RsPORQi4saSSbU2NCsNstUO/YwgNgF0MVOEfBSD4RAS?=
 =?us-ascii?Q?tolxk5dGegdpA+L59eVAgBzxZ+uQSJeoXhCKV2VCGEbMdRi2SneFAdCmrL2X?=
 =?us-ascii?Q?pc0rbFjv6J4ezlBWJgmdBnOG4bCdFUmLHZ9nlowS/LReO56YLWkTTtqYuYS4?=
 =?us-ascii?Q?8ICioqq3pPsJLybIlPf00yfrdzLPCpyfxHs3+pAzFkJut38TGagxTBo6xDw9?=
 =?us-ascii?Q?Yn3zY8YZBkiHKCEzCiYnzvyDqZKHMTsWNsuwWWJooeHNniprfLee0syF4W40?=
 =?us-ascii?Q?D0aEAduEW0OhVhZS9Cx44tP0tkSw4fsa2k6ZpvCJ0C3ginXYRnd+1+75gZB7?=
 =?us-ascii?Q?w4PZhXjiS0SbM2Oia7VdxR2n/786lqL30zE4rs7sUpuU31tl0XrP1AsdJ4SA?=
 =?us-ascii?Q?Kb+bZKdFDhVLODtNT6x7EEmc+NPTRWmzTLPECGcWJZcUqRwzsTwCMcTFPKkp?=
 =?us-ascii?Q?6bCpdDNQAbbmOaQYt02pwitHWAAM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 21:31:56.4779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d64cc3c-5e78-4cea-0046-08dc97b9bc84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4492
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

More stuff for 6.11.

The following changes since commit a78313bb206e0c456a989f380c4cbd8af8af7c76:

  Merge tag 'drm-intel-gt-next-2024-06-12' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2024-06-27 17:21:44 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.11-2024-06-28

for you to fetch changes up to 15eb8573ad72a97b8f70e3c88b9bef6ddc861f77:

  drm/amd: Don't initialize ISP hardware without FW (2024-06-27 17:34:40 -0400)

----------------------------------------------------------------
amd-drm-next-6.11-2024-06-28:

amdgpu:
- JPEG 5.x fixes
- More FW loading cleanups
- Misc code cleanups
- GC 12.x fixes
- ASPM fix
- DCN 4.0.1 updates
- SR-IOV fixes
- HDCP fix
- USB4 fixes
- Silence UBSAN warnings
- MES submission fixes
- Update documentation for new products
- DCC updates
- Initial ISP 4.x plumbing
- RAS fixes
- Misc small fixes

amdkfd:
- Fix missing unlock in error path for adding queues

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu/atomfirmware: fix parsing of vram_info
      drm/amd/display: Fix Makefile copyright notices
      drm/amdgpu: fix Kconfig for ISP v2

Alex Hung (12):
      drm/amd/display: Remove redundant checks for pipe_ctx->stream
      drm/amd/display: Run DC_LOG_DC after checking link->link_enc
      drm/amd/display: Fix uninitialized variables in dcn401
      drm/amd/display: Remove useless function call
      drm/amd/display: Check and log for function error codes
      drm/amd/display: Check and log for function error codes
      drm/amd/display: Check HDCP returned status
      drm/amd/display: Add null checks before accessing struct elements
      drm/amd/display: Ensure curve to hw translation succeed
      drm/amd/display: Validate function returns
      drm/amd/display: Remove always true condition
      drm/amd/display: Remove duplicate null check

Alvin Lee (2):
      drm/amd/display: Program CURSOR_DST_X_OFFSET in viewport space
      drm/amd/display: Wait for double buffer update on ODM changes

Aric Cyr (1):
      drm/amd/display: 3.2.290

Aurabindo Pillai (5):
      drm/amd/display: Use sw cursor for DCN401 with rotation
      drm/amd: Add reg definitions for DCN401 DCC
      drm/amd/display: Enable DCC on DCN401
      drm/amd: Add some missing register definitions
      drm/amd/display: Fix null pointer deref in dcn20_resource.c

Bob Zhou (1):
      drm/amdgpu: add missing error handling in function amdgpu_gmc_flush_gpu_tlb_pasid

Dan Carpenter (2):
      drm/amd/display: Clean up indenting in dm_dp_mst_is_port_support_mode()
      drm/amdgpu/kfd: Add unlock() on error path to add_queue_mes()

Daniel Sa (1):
      drm/amd/display: Fix reduced resolution and refresh rate

Danijel Slivka (1):
      drm/amdgpu: clear RB_OVERFLOW bit when enabling interrupts

Dillon Varone (1):
      drm/amd/display: Make DML2.1 P-State method force per stream

Duncan Ma (1):
      drm/amd/display: Reset DSC memory status

Frank Min (3):
      drm/amdgpu: update MTYPE mapping for gfx12
      drm/amdgpu: access ltr through pci cfg space
      drm/amdgpu: tolerate allocating GTT bo with dcc flag

George Shen (1):
      drm/amd/display: Call dpmm when checking mode support

Hawking Zhang (2):
      drm/amdgpu: Fix register access violation
      drm/amdgpu: Fix smatch static checker warning

Ivan Lipski (2):
      drm/amd/display: Remove redundant var from display_rq_dig_calc in dml
      drm/amd/display: Remove unnecessary variable

Jane Jian (1):
      drm/amdgpu: normalize registers as local xcc to read/write in gfx_v9_4_3

Jiapeng Chong (4):
      drm/amd/display: Remove redundant code and semicolons
      drm/amd/display: Use ARRAY_SIZE for array length
      drm/amd/display: Remove unused function reverse_planes_order
      drm/amd/display: use swap() in is_config_schedulable()

Joan Lee (1):
      drm/amd/display: Add Replay general cmd

Julia Zhang (1):
      drm/amdgpu: avoid using null object of framebuffer

Kenneth Feng (2):
      Revert "drm/amd/pm: workaround to pass jpeg unit test"
      Revert "drm/amd/amdgpu: add module parameter for jpeg"

Leo (Hanghong) Ma (1):
      drm/amd/display: Always enable HPO for DCN4 dGPU

Lijo Lazar (2):
      drm/amdgpu: Fix pci state save during mode-1 reset
      drm/amdgpu: Don't show false warning for reg list

Ma Ke (1):
      drm/amd/display: Add null check before access structs

Mario Limonciello (3):
      Documentation/amdgpu: Add Ryzen AI 300 series processors
      Documentation/amdgpu: Add Ryzen 9000 series processors
      drm/amd: Don't initialize ISP hardware without FW

Michael Strauss (1):
      drm/amd/display: Send DP_TOTAL_LTTPR_CNT during detection if LTTPR is present

Nevenko Stupar (3):
      drm/amd/display: Fix cursor issues with ODMs and HW rotations
      drm/amd/display: Fix cursor size issues
      drm/amd/display: Fix cursor issues with ODMs and magnification

Nicholas Susanto (1):
      drm/amd/display: Temporarily disable HPO PG on DCN35

Pierre-Eric Pelloux-Prayer (1):
      amdgpu: don't dereference a NULL resource in sysfs code

Pratap Nirujogi (8):
      drm/amd/amdgpu: Add ISP support to amdgpu_discovery
      drm/amd/amdgpu: Add ISP driver support
      drm/amd/amdgpu: Enable ISP in amdgpu_discovery
      drm/amd/amdgpu: Map ISP interrupts as generic IRQs
      drm/amd/amdgpu: Add ISP4.1.0 and ISP4.1.1 modules
      drm/amd/amdgpu: Disable MMHUB prefetch for ISP v4.1.1
      drm/amd/amdgpu: Fix 'snprintf' output truncation warning
      drm/amd/amdgpu: Enable MMHUB prefetch for ISP v4.1.0 and 4.1.1

Relja Vojvodic (2):
      drm/amd/display: Refactor dccg401_get_other_enable_symclk_fe
      drm/amd/display: Fix 1DLUT setting for NL SDR blending

Roman Li (1):
      drm/amd/display: Use periodic detection for ipx/headless

Ryan Seto (2):
      drm/amd/display: Add HW cursor visual confirm
      drm/amd/display: Adjust reg field for DSC wait for disconnect

Sonny Jiang (2):
      drm/amdgpu/jpeg5: reprogram doorbell setting after power up for each playback
      drm/amdgpu/jpeg5: Add support for DPG mode

Sung-huai Wang (1):
      drm/amd/display: Add workaround to restrict max frac urgent for DPM0

TungYu Lu (1):
      drm/amd/display: resync OTG after DIO FIFO resync

Vignesh Chander (2):
      drm/amdgpu: Use dev_ prints for virtualization as it supports multi adapter
      drm/amdgpu: process RAS fatal error MB notification

Wenjing Liu (1):
      drm/amd/display: Remove a redundant check in authenticated_dp

Yang Wang (3):
      drm/amdgpu: refine gfx11 firmware loading
      drm/amdgpu: refine gfx12 firmware loading
      drm/amdgpu: refine isp firmware loading

YiPeng Chai (4):
      drm/amdgpu: add variable to record the deferred error number read by driver
      drm/amdgpu: refine poison creation interrupt handler
      drm/amdgpu: refine poison consumption interrupt handler
      drm/amdgpu: add gpu reset check and exception handling

 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |   2 +
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |  11 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  33 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   5 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            | 210 ++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h            |  60 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |  31 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  63 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  28 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 197 +++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |  18 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  34 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  22 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  33 +++
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   8 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   4 -
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |  28 +++
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |   6 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c            | 137 ++++++++++
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.h            |  39 +++
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            | 137 ++++++++++
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.h            |  39 +++
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           | 165 ++++++++++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.h           |   6 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  27 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |   4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  31 ++-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |   5 +-
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c           |  14 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |   5 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |   1 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   4 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  48 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   3 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  48 +++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   5 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   4 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |   3 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |   2 -
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  10 +-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  10 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  12 +
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  11 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  29 +++
 drivers/gpu/drm/amd/display/dc/dc.h                |   9 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   7 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   1 +
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |  57 ++---
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  18 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |   8 +-
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |  11 +-
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |  10 +-
 drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |  11 +-
 drivers/gpu/drm/amd/display/dc/dcn401/Makefile     |   5 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   2 +-
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |  14 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |  14 +-
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |  14 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |  14 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |  14 +-
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |  14 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |   2 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |   4 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   4 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_shared.c |  46 ++--
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  11 +-
 .../display/dc/dml2/dml21/src/dml2_top/dml_top.c   |  17 ++
 .../dml21/src/inc/dml2_internal_shared_types.h     |   1 +
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |   2 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |  29 ++-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   6 +-
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |  50 ----
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c   |  24 +-
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h   |  13 +-
 .../gpu/drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c   |  58 ++++-
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |   2 +-
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h |   3 +-
 .../drm/amd/display/dc/hubbub/dcn20/dcn20_hubbub.c |   3 +-
 .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.c |   3 +
 .../drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c |   3 +
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   | 280 +++++++++++++++++++++
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.h   |   5 +
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h |  14 ++
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |  71 +++---
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |  14 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  17 --
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  34 ++-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   5 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  11 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  | 169 +++++--------
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |   2 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   9 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |   1 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |   1 +
 .../amd/display/dc/link/accessories/link_dp_cts.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   6 +-
 .../display/dc/link/protocols/link_dp_capability.c |  31 ++-
 .../display/dc/link/protocols/link_dp_training.c   |   3 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |   3 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |  13 +
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h |   2 +
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |   1 +
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.h   |   1 +
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   9 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   5 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   9 +
 .../display/dc/resource/dcn401/dcn401_resource.h   |   2 +
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |   5 +
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |  24 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    |  12 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |   3 -
 drivers/gpu/drm/amd/include/amd_shared.h           |   2 +
 .../amd/include/asic_reg/dcn/dcn_4_1_0_offset.h    |  18 ++
 .../amd/include/asic_reg/dcn/dcn_4_1_0_sh_mask.h   | 110 ++++++++
 .../drm/amd/include/ivsrcid/isp/irqsrcs_isp_4_1.h  |  62 +++++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   3 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  30 +--
 138 files changed, 2467 insertions(+), 749 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.h
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/isp/irqsrcs_isp_4_1.h
