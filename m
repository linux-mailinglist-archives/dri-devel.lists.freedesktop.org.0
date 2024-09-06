Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969E996FD11
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 23:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64A410E1C4;
	Fri,  6 Sep 2024 21:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DRKJcbBp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6721510E1B0;
 Fri,  6 Sep 2024 21:10:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbuuIrj/OuUA11mZNLV9LXZ13K+OganV3PnoX/MqIhMJ1BFh29x4jn8dz5BHQGYNBIfpG0ZT9lb3Gf+cZaBV8xOhFcxdrmfOMEjwkKXEH9rKu+Fu9eMsBBTdyeL7OWYDJQu0SGm5Sj3DSaPlNpLWzyi4lTEMysYEGOZdv1PRC1OE7nI/YicnzXGJUKUgXnjBtTk3c/3BKyPitkNg0kElBwEWZ5R1Kp5kNUMG3GQEhljPrtDIGBP88mr3467k4xCYoVJTOUeHM1UD+sXf9Lib0V9yj1DlllG3GZ6Mf+pt9SHOFAq82GlYqq6S92tJcIJlts+SFa6vySCSbkGKTdp4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pd0ZQnhnuGJ6/JgIGiPrwpR93D+Eb4V6liXMD1MfeNI=;
 b=lhvCO4Hwrd8w5n6vK/xF7luaiXkLtkWF+mkz5BwizSGntI70PxRCsepFEd1kuwymS4BGg1UQdk2QI2z2dGJ7mXATjmM2NGjr9s730cAl56B/zKe7IUtR4H3RY3hRX0XkksQwVL66ZYDeSlLF6ZuR/iFZ/Btw61g6HF9Jc4spiVkIhkTquK6nU4EFOz7QBYvVqXgb7k0RNNT1dC6ZjYof0U58sp6t2RLKf+as8qXtJkapFr6w/bQ68BF4Pv6jWS0bs3XqT6s431Yo0CKHSduXfn6jj29q8w+ndunr9wVMZEvKHv82nQ8omlh+VSpicIVpeZRkCX6ix4TmzOFds9Clhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pd0ZQnhnuGJ6/JgIGiPrwpR93D+Eb4V6liXMD1MfeNI=;
 b=DRKJcbBp+QGsKCoskXUWSjduTWN1mcCSZoh+rJFCTUzRHtevNJ4OW3I5gXZLZHyvHt5JVNHYGX/Qqj6dAcOh9R/CLVx1eYutMtqlOEB9dWcJn/qXN3gpJ01HgOEDBI2TUvLZRohvNv7JSpTLW65zf0xuUiJv8MwSy3Y4ioIWz9Y=
Received: from SA0PR11CA0030.namprd11.prod.outlook.com (2603:10b6:806:d3::35)
 by PH0PR12MB7885.namprd12.prod.outlook.com (2603:10b6:510:28f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 21:10:25 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::9d) by SA0PR11CA0030.outlook.office365.com
 (2603:10b6:806:d3::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14 via Frontend
 Transport; Fri, 6 Sep 2024 21:10:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 21:10:24 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 16:10:23 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.12
Date: Fri, 6 Sep 2024 17:10:08 -0400
Message-ID: <20240906211008.3072097-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|PH0PR12MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: e86b91e9-4624-4998-2633-08dcceb85373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pdYAc/Hl0CMLpq57/OFyqFKkxOAX4arJD2TTb3fFdYvb1nFTnDFkDEqQpyJp?=
 =?us-ascii?Q?R1CyIyAZsWqjU/h3eIFINYYjS5oDynk75Phl2yyPqNfYXwdgEamgsaGP9foM?=
 =?us-ascii?Q?R/pkPspDEoSBS3Zwy5bPGB6QXUXkRTF7LzAkDiEmpGo695+V0UFYeVM7hKZe?=
 =?us-ascii?Q?P1jGdOU7SpKml5Vj7Lzx307JeQmXd6UHQEjLjvkTqzoAdaDpoi9uuIhz6A1n?=
 =?us-ascii?Q?5KVVPmPT3N8sKfMxD572E5a9KnrO1QpUm5VbxG2GP7wbnCEXqlTT3mQ04T8p?=
 =?us-ascii?Q?LWiwYC3AiSlhvZglhzmDBhMLhVhxcgP1/rdiunYfBpgRtb8cTy4yPrhvkWaW?=
 =?us-ascii?Q?H5NVDWA7NMgMO6xuBYR37hOVLRNRqMuRaasN+6f4M6nXq5UJ+shXaTTlpTfy?=
 =?us-ascii?Q?be8BKVVYRQIwbZB0Ts+qpY/ySvMnD9XMIRmDq6Mw0EIbcyCYedF40TZijC6V?=
 =?us-ascii?Q?bFyPadvjJthg4muFzYLLgLSbaIfhVtdhFCV0QPX1EdQeI+RJ6/p/6bxYzwDM?=
 =?us-ascii?Q?WFgVVqb/NtzKGZUFwbfdoGr39sVVdh1KKSeSLw+O6DPPtWrXOYiQ6AxYZGZ7?=
 =?us-ascii?Q?cm7Sy2Pf2Aqpe3jpaX8pJMecu1XF5eHu2kqG98X6rAQeAp73F1+4BIH619ol?=
 =?us-ascii?Q?jvZh9l4VJO6D+bF7sNsTn8PfFC+R0S7WnByn3swVWdTQ9nbi8IroojQ2ksZ+?=
 =?us-ascii?Q?56FdPjjXXIZuFmIVcaf1lyFtAS9+YRzL/AkE4Hl+9/wlODf6rQsPY5KHfIVG?=
 =?us-ascii?Q?KxLnYvkEijpRhhDki7iIJkoEALc4gmjsovJ/SiliXRu94y4vJN+lyCa89Ini?=
 =?us-ascii?Q?3DDIN+qG5u+RzdWnFjih/DNN0Q4IYogj60u+JmNNUtKBKmoC+oji1eg95XSQ?=
 =?us-ascii?Q?Ed4cxABmGwmaiUvCSdy3Tn+9PumbtbwZX6ypp0WXj5GUO4+xS1s0ickvlAtI?=
 =?us-ascii?Q?AhmWkcEt6FUVNd/ZGXOV5fpyKWYXAdPu23QhEBZy1GHbHNTmIUBz8cfeIrY8?=
 =?us-ascii?Q?/ozgBoNnh7DXl3n+ShuUT2TUDouI41LmJG8lwp3m+62KVc6/G7DxrctvRitA?=
 =?us-ascii?Q?taWE8vP2eW2YGuePt/LFEEHCbsQnKro5ntznilB34qaEbrlEURH288HO8AEn?=
 =?us-ascii?Q?lfH7rPsWWb66W+Odyst1buI0ehqpQPuFEJmHBum8w1hYrFz2h1vcASIv99SN?=
 =?us-ascii?Q?ars6mhxFE0djKwzqe7yWl2czT57BW6GZXGgPNPtTAlt5V59pMDb6OVy2j9Lx?=
 =?us-ascii?Q?xz42CKI6TuzbiMklFd2zrE6tLubBNhja3zTa7MRrzDiv71WvuG1XZCo4DQRo?=
 =?us-ascii?Q?C1sF2ADNTB2C/9+29yr9llVtpXvMCXj1iMWR7KrV92lc2TOe7qvW/nSDMUaW?=
 =?us-ascii?Q?HTCFxogxphTxPSc/M1W0CTLni/wx1TnBvQzgL26XWHH7m+ZG9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 21:10:24.8189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e86b91e9-4624-4998-2633-08dcceb85373
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7885
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

Updates for 6.12.

The following changes since commit e55ef65510a401862b902dc979441ea10ae25c61:

  Merge tag 'amd-drm-next-6.12-2024-08-26' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-08-27 14:33:12 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.12-2024-09-06

for you to fetch changes up to 7a199557643e993d4e7357860624b8aa5d8f4340:

  Revert "drm/amdgpu: align pp_power_profile_mode with kernel docs" (2024-09-05 14:27:41 -0400)

----------------------------------------------------------------
amd-drm-next-6.12-2024-09-06:

amdgpu:
- IPS updates
- Post divider fix
- DML2 updates
- Misc static checker fixes
- DCN 3.5 fixes
- Replay fixes
- DMCUB updates
- SWSMU fixes
- DP MST fixes
- Add debug flag for per queue resets
- devcoredump updates
- SR-IOV fixes
- MES fixes
- Always allocate cleared VRAM for GEM
- Pipe reset for GC 9.4.3
- ODM policy fixes
- Per queue reset support for GC 10
- Per queue reset support for GC 11
- Per queue reset support for GC 12
- Display flickering fixes
- MPO fixes
- Display sharpening updates

amdkfd:
- SVM fix for IH for APUs

----------------------------------------------------------------
Ahmed, Muhammad (1):
      drm/amd/display: guard write a 0 post_divider value to HW

Alex Deucher (25):
      drm/amdgpu: align pp_power_profile_mode with kernel docs
      drm/amdgpu/swsmu: fix ordering for setting workload_mask
      drm/amdgpu/smu13.0.7: print index for profiles
      drm/amdgpu/swsmu: always force a state reprogram on init
      drm/amdgpu: add experimental resets debug flag
      drm/amdgpu/gfx9: put queue resets behind a debug option
      drm/amdgpu/gfx11: return early in preempt_ib()
      drm/amdgpu/gfx12: return early in preempt_ib()
      drm/amdgpu: always allocate cleared VRAM for GEM allocations
      drm/amdgpu/gfx11: add ring reset callbacks
      drm/amdgpu/gfx11: rename gfx_v11_0_gfx_init_queue()
      drm/amdgpu/gfx10: add ring reset callbacks
      drm/amdgpu/gfx10: rework reset sequence
      drm/amdgpu/gfx12: add ring reset callbacks
      drm/amdgpu/gfx12: fallback to driver reset compute queue directly
      drm/amdgpu/gfx10: per queue reset only on bare metal
      drm/amdgpu/gfx11: per queue reset only on bare metal
      drm/amdgpu/gfx12: per queue reset only on bare metal
      drm/amdgpu/gfx10: use proper rlc safe mode helpers
      drm/amdgpu/gfx11: use proper rlc safe mode helpers
      drm/amdgpu/gfx12: use proper rlc safe mode helpers
      drm/amdgpu/gfx12: use rlc safe mode for soft recovery
      drm/amdgpu/gfx11: use rlc safe mode for soft recovery
      drm/amdgpu/gfx10: use rlc safe mode for soft recovery
      Revert "drm/amdgpu: align pp_power_profile_mode with kernel docs"

Alvin Lee (2):
      drm/amd/display: Don't skip clock updates in overclocking
      drm/amd/display: Wait for all pending cleared before full update

Aric Cyr (2):
      drm/amd/display: 3.2.298
      drm/amd/display: 3.2.299

Aurabindo Pillai (1):
      drm/amd/display: do not set traslate_by_source for DCN401 cursor

ChunTao Tso (1):
      drm/amd/display: Retry Replay residency

Daniel Sa (2):
      drm/amd/display: Resolve Coverity Issues
      drm/amd/display: only trigger BIOS related assert for older ASICs

Dennis Chan (1):
      drm/amd/display: Add Replay Low Refresh Rate parameters in dc type.

Dillon Varone (3):
      drm/amd/display: Fix MS/MP mismatches in dml21 for dcn401
      Revert "drm/amd/display: Wait for all pending cleared before full update"
      drm/amd/display: Block timing sync for different signals in PMO

Fangzhi Zuo (3):
      drm/amd/display: Fix Synaptics Cascaded Panamera DSC Determination
      drm/amd/display: Add DSC Debug Log
      drm/amdgpu/display: Fix a mistake in revert commit

Gabe Teeger (1):
      drm/amd/display: fix graphics hang in multi-display mst case

Hansen Dsouza (1):
      drm/amd/display: Fix flickering caused by dccg

Jack Xiao (1):
      drm/amdgpu/mes: add mes mapping legacy queue switch

Jiadong Zhu (6):
      drm/amdgpu/gfx11: wait for reset done before remap
      drm/amdgpu/gfx10: remap queue after reset successfully
      drm/amdgpu/gfx10: wait for reset done before remap
      drm/amdgpu/mes: modify mes api for mmio queue reset
      drm/amdgpu/mes: implement amdgpu_mes_reset_hw_queue_mmio
      drm/amdgpu/mes11: implement mmio queue reset for gfx11

Leo Li (3):
      drm/amd: Introduce additional IPS debug flags
      drm/amd/display: Determine IPS mode by ASIC and PMFW versions
      drm/amd/display: Lock DC and exit IPS when changing backlight

Meenakshikumar Somasundaram (1):
      drm/amd/display: Add dpia debug option to control power management

Nicholas Kazlauskas (2):
      drm/amd/display: Allocate DCN35 clock table transfer buffers in GART
      drm/amd/display: Notify DMCUB of D0/D3 state

Nicholas Susanto (1):
      drm/amd/display: Fix DCN35 set min dispclk logic

Prike Liang (2):
      drm/amdgpu/gfx9.4.3: Implement compute pipe reset
      drm/amdgpu/gfx11: fallback to driver reset compute queue directly (v2)

Relja Vojvodic (1):
      drm/amd/display: Add sharpness control interface

Samson Tam (5):
      drm/amd/display: add back quality EASF and ISHARP and dc dependency changes
      drm/amd/display: add improvements for text display and HDR DWM and MPO
      drm/amd/display: add sharpness support for windowed YUV420 video
      drm/amd/display: re-enable Dynamic ODM policy
      drm/amd/display: disable sharpness if HDR Multiplier is too large

Sunil Khatri (1):
      drm/amdgpu: Move the dumping log out of for loop

Trigger Huang (2):
      drm/amdgpu: skip printing vram_lost if needed
      drm/amdgpu: Do core dump immediately when job tmo

Victor Zhao (1):
      drm/amd/amdgpu: move drain_workqueue before shutdown is set

Yifan Zhang (1):
      drm/amdkfd: Don't drain ih1 for APU

Zaeem Mohamed (2):
      drm/amdgpu/display: SPDX copyright for spl_os_types.h
      drm/amdgpu/display: remove unnecessary TODO spl_os_types.h

 Documentation/gpu/amdgpu/driver-core.rst           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h   |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   67 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   15 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  166 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  116 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  106 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    4 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  133 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  129 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |    9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   13 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   54 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   18 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  135 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    5 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |    2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   12 +-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |    3 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   12 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    2 -
 drivers/gpu/drm/amd/display/dc/dc.h                |    8 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   30 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   24 +-
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |  102 +-
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.h  |    1 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    3 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   19 +
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.h |   11 +
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |   92 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |   18 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |    8 +
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |    1 -
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   68 +-
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |    5 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c     |    3 +-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |    6 +-
 .../dml21/src/dml2_top/dml2_top_optimization.c     |    1 -
 .../drm/amd/display/dc/dml2/dml2_internal_types.h  |    2 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   67 +-
 .../amd/display/dc/dml2/dml2_translation_helper.h  |    2 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |   12 +-
 .../amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c    |  588 ++++---
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   45 -
 .../display/dc/resource/dcn401/dcn401_resource.c   |    7 +
 drivers/gpu/drm/amd/display/dc/spl/Makefile        |    2 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        | 1363 ++++++++++------
 .../gpu/drm/amd/display/dc/spl/dc_spl_filters.c    |   15 +
 .../gpu/drm/amd/display/dc/spl/dc_spl_filters.h    |   15 +
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.c |  351 +++-
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.h |   35 +-
 .../amd/display/dc/spl/dc_spl_scl_easf_filters.c   | 1726 ++++++++++++++++++++
 .../amd/display/dc/spl/dc_spl_scl_easf_filters.h   |   38 +
 .../drm/amd/display/dc/spl/dc_spl_scl_filters.c    |   91 +-
 .../drm/amd/display/dc/spl/dc_spl_scl_filters.h    |   55 +-
 .../amd/display/dc/spl/dc_spl_scl_filters_old.c    |   25 -
 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h  |   72 +-
 .../gpu/drm/amd/display/dc/spl/spl_custom_float.c  |  151 ++
 .../gpu/drm/amd/display/dc/spl/spl_custom_float.h  |   29 +
 drivers/gpu/drm/amd/display/dc/spl/spl_debug.h     |   25 +
 .../gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c    |  497 ++++++
 .../gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h    |  525 ++++++
 drivers/gpu/drm/amd/display/dc/spl/spl_os_types.h  |   30 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   40 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   75 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   17 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    4 +-
 75 files changed, 6024 insertions(+), 1359 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_filters.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters_old.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_custom_float.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_custom_float.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h
