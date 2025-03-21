Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2CFA6C4DB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 22:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3152B10E83E;
	Fri, 21 Mar 2025 21:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X/d+wq31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C5D10E83B;
 Fri, 21 Mar 2025 21:09:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWbNBj3TfOXWha9bjkFObwMtVUDJioEv/rmlIpCDxvXqs4g7YB0WahfNGb7xDvXAMjjKilnolbmIYiOGwjPwHOFA5mpoWhY2FyQMTBzXfA/SKt8vIvCzRK1RiOA7RtHdq+pf7eklZd5HLvsq+Px9GaHsmZI8Op1jfr/G+r/hz29C27bdpKjnPNP022lmJU8W99X1ShLE3zLmt0P60rkiqpGiWa0Pe7EtUsKuE+9gfPWWwN+BZEFACmKf6j+43yPuRPy1dB4IcDOKWeV0fQp6oA6nNm06wRYTkdPBt3fRcYEFZO6ZKcHFDsqSN93mkyTrw1CkoRqRt1YnarVb0U9yHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QQIh3zXCLTHlE6IJ8rB3AeEHv6yJwMY6ghjUDgjjD8=;
 b=byP/Nv0JL1Wx9Z8Xarhc2XaOYOQLpUl7ilpdfTFE591JUBd9AEVmxDjs/8a3Fx/2F7ZT39lvEhqmwjZ8CLEL2BG3KjGRbDxYoYsEjoch+jVRy3/Vrmh4NElpq1BDQQJIOT/SfSoVia+k6XHJ1AypMBbncVIcSY93yu0gHVjVjObe/Uk7ZMq3sDvKrJkPUKJ4KGeXtL/jySv2br3eAYOPqmhalaLgCWC/Gu/d5hGj/0BFcYybM1CPBDvjBSPx3akZUsQ4haX3UNsAM7YMc1lsAMjpWIWekjoxrBUXnPlannYACl9hfvxmESc+3s/2txIk1GhOI6KdoBHTOQECeJJw3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QQIh3zXCLTHlE6IJ8rB3AeEHv6yJwMY6ghjUDgjjD8=;
 b=X/d+wq31TF294ax1eWcGAlqjTdAZaUoZjZyQuDf5eiFoQlm+JmxVwfwvMY267ercMv0b6NszWMhTqtKyCg9iKq766vUU0ZV73HrTpvgf+0Wl4UQq8/rKRKZlxIeFwsnJd+bDGd+t0DGRpBQqBtZTIPYvPayB/O+5iBa4FYsRivE=
Received: from DM6PR06CA0091.namprd06.prod.outlook.com (2603:10b6:5:336::24)
 by DS0PR12MB6584.namprd12.prod.outlook.com (2603:10b6:8:d0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.36; Fri, 21 Mar 2025 21:09:23 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::3d) by DM6PR06CA0091.outlook.office365.com
 (2603:10b6:5:336::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Fri,
 21 Mar 2025 21:09:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 21 Mar 2025 21:09:22 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 16:09:21 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.15
Date: Fri, 21 Mar 2025 17:09:07 -0400
Message-ID: <20250321210909.2809595-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|DS0PR12MB6584:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d480556-b283-42ae-19f1-08dd68bca776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVdBQk54WkcrOElRNGRPVElUOUJqT0plczd6STBUVDN2d1RoaU9jbXpXUnB2?=
 =?utf-8?B?RzZQS3d0Z3hvZ21Kc3lscUpxSnlXaXc0dmJ1Skl6TFlBZ0ZnK1RzZWlXcEcy?=
 =?utf-8?B?UmFmVHdTWE1iSzZHa2dzRGZSbkUwdkRpdGR1WXQxQk5XSitqdzNEOGFLbEJi?=
 =?utf-8?B?OTc1a1A5UDVCZGMra3A1dlFjSGwwcU4rUW91Q1RHTzM0VGUwL3NacTZhRjFs?=
 =?utf-8?B?VEtubTB4YnczWVBHSW1rZWNkc0hHNTVNSUdkdWZTUUJCVHpla3JoYmV3WERo?=
 =?utf-8?B?elBadGlqWno2MVZxVGZrYjNVQS91RWNLY3VpeEQ4blpqQTdEVmlOckJFN1lF?=
 =?utf-8?B?b0NUb1RncFhaSzdOcFF5R3lWaVkxNmdrc3d3ZXJXdlR0RHhvQjJNYi9QMkpx?=
 =?utf-8?B?bzlsb1REcUdqdk9nZWVWZHM4VmxQQUVCbkxmNlZLMjZiN0lwTm91WkNITWRF?=
 =?utf-8?B?OGJQNDZ3dGJSTE03VzlRN2Iwa1llY3JmNzZBVldWUHBZZmY3VXUwb1lVbVBZ?=
 =?utf-8?B?WG9GeEJSQ3hzQkhpejFOVys3b2ppTXg0UkpoU3lJZDZhekVoTkRoQ1ArUFhS?=
 =?utf-8?B?dkp6MWRjMlpCS1Y3MFJpbExJQlVvK2FNeWRxbXRTNnFQQi9yU1QvdWlUR0Jh?=
 =?utf-8?B?WHQ5UzJaMEYzNFM1M3ZEZUREenRPZXdhaGhSenIrK3Ywd2o2bldJK2p1OHdm?=
 =?utf-8?B?RFIyZXpESGhBb2pUWkx2UFpQOExwTGhZOWJJaXRyelVvbzZwVzB5Z3AzYk5m?=
 =?utf-8?B?cGoxVHR5MHJHOUdQWGxERjJZV3pJTENXV25oUUNlMkY2T2E2cjIraUllazI4?=
 =?utf-8?B?Q3F0WjBSa3E4ZmRoNUZoVlBCRXg2NXh3ckp4a0g5dE5PREZSNitvQmo4K3N4?=
 =?utf-8?B?eSt5cjlYcmNVZDdlV3huT3p6RlhlNVZZNkFyVGdvL3Eybkp3OGtzckZDSG05?=
 =?utf-8?B?alBQei9FNlZWR3J6Q25yN3V4WTVPT0dBb002bXdKUHNUdjZXNDBoQ1pMTnZ1?=
 =?utf-8?B?TDVqV2Uwek0vc1lBejRrazFWQUlpcmZZTkgyL25PSWdvdVFieEcrb0NwNDFl?=
 =?utf-8?B?QnpMNWJTTkQrMC9vTjcyMko0dWFKUURKam9SOUV0aVNDUFYvWXYvdUhKU3c1?=
 =?utf-8?B?bDZWWWh0RkZzdkpGVXgrNkx2WDA0UUV4QkdCbm53SDBvZTVvdlhDT3k2M283?=
 =?utf-8?B?QVRHem00WDVnTUZLSUc5WHl6VDFFV0xoMmc3U2Z6N1doUm5tckhLUXcyV2xy?=
 =?utf-8?B?UkVybVpTSDJnL2NBdWlyendaa09ONE9PWm1ucWtjSFFrZUs0cEJWK1VOZVA3?=
 =?utf-8?B?OU5GR0hjR3N4Q2txa2JsS1lOdkNhL3lFWUc5KzZUenA1SkVtSTFYZFJ1c0pM?=
 =?utf-8?B?STdpUDBYQWh4QjlKQU9DdEx4Y2VwTm04cFREVDl5VjFaWTZ4bTBkSFZWZ0Q5?=
 =?utf-8?B?Y0FTdWJnNDBRcDlnOHppR21TYlVreVFmdDJ5VythdlVvUXMxQTJBRG41bGhY?=
 =?utf-8?B?NnBtdnZCLy9DNG0rWmJHMG5ITmxRNjhjZExJZm42MUIvdlRnR0pGTUJ6b0or?=
 =?utf-8?B?WnRvYmxSYVZwNGtqay96a09WUnB0WW9OckFyRkErMkN5bVVwY2RQb1ZtTzJl?=
 =?utf-8?B?R2JnMS9WSE1MSXVvdERtclA5YS83ditDVVF1Sis5T1h3ZUJnUGJJMFNTTUxJ?=
 =?utf-8?B?MVZTbWh4bkF0SUtmanhJTWZSOVFtYlowK0V4MkM1QVNmbmhXNWg0bU9ON0lR?=
 =?utf-8?B?NzhZakJhcDFaTk90S1JLdm5QdEdNVjNRRUJnR1M3RzJyNkhTdkovcnh5eDdy?=
 =?utf-8?B?KzY4ZTRIT2JVUndJeERxcnlTeTZqRFpzYUpMRzJJQVJic2FlcUJiUkxTQlZI?=
 =?utf-8?B?eGdLRFg1V29La0k5b0l2RlYrQlkvN3hFM05Rak9NYnl0NUNmWVhRbzRiUHVK?=
 =?utf-8?Q?VqCtrCpC9to=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 21:09:22.8216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d480556-b283-42ae-19f1-08dd68bca776
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6584
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

Fixes for 6.15.

The following changes since commit eb6cdfb807d038d9b9986b5c87188f28a4071eae:

  drm/amdgpu: Restore uncached behaviour on GFX12 (2025-03-13 23:18:02 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.15-2025-03-21

for you to fetch changes up to 7547510d4a915f4f6d9b1262182d8db6763508f4:

  drm/amd/pm: Update feature list for smu_v13_0_6 (2025-03-21 12:16:36 -0400)

----------------------------------------------------------------
amd-drm-next-6.15-2025-03-21:

amdgpu:
- Refine nomodeset handling
- RAS fixes
- DCN 3.x fixes
- DMUB fixes
- eDP fixes
- SMU 14.0.2 fixes
- SMU 13.0.6 fixes
- SMU 13.0.12 fixes
- SDMA engine reset fixes
- Enforce Isolation fixes
- Runtime workload profile ref count fixes
- Documentation fixes
- SR-IOV fixes
- MES fixes
- GC 11.5 cleaner shader support
- SDMA VM invalidation fixes
- IP discovery improvements for GC based chips

amdkfd:
- Dequeue wait count fixes
- Precise memops fixes

radeon:
- Code cleanup

----------------------------------------------------------------
Ahmad Rehman (2):
      drm/amdgpu: Add support to load PSP TA v13.0.12 for SRIOV
      drm/amdgpu/sdam: Skip SDMA queue reset for SRIOV

Alex Deucher (14):
      drm/amdgpu: drop drm_firmware_drivers_only()
      drm/amdgpu: adjust drm_firmware_drivers_only() handling
      drm/amdgpu: don't free conflicting apertures for non-display devices
      drm/amdgpu/gfx: fix ref counting for ring based profile handling
      drm/amdgpu/vcn: fix ref counting for ring based profile handling
      drm/amdgpu/gfx: adjust workload profile handling
      drm/amdgpu/vcn: adjust workload profile handling
      drm/amdgpu/sdma: fix engine reset handling
      drm/amdgpu/sdma: guilty tracking is per instance
      drm/amdgpu/mes: optimize compute loop handling
      drm/amdgpu/mes: drop MES 10.x leftovers
      drm/amdgpu/mes: enable compute pipes across all MEC
      drm/amdgpu/mes: clean up SDMA HQD loop
      drm/amdgpu/discovery: optionally use fw based ip discovery

Alex Hung (1):
      drm/amd/display: Check pipe->stream before passing it to a function

Asad Kamal (3):
      drm/amd/pm: Remove unnecessay UQ10 to UINT conversion
      drm/amd/pm: Remove unnecessay UQ10 to UINT conversion
      drm/amd/pm: Update feature list for smu_v13_0_6

Candice Li (2):
      drm/amdgpu: Add EEPROM I2C address support for smu v13_0_12
      drm/amdgpu: Add active_umc_mask to ras init_flags

Charlene Liu (2):
      drm/amd/display: Update static soc table
      drm/amd/display: Use DPM table clk setting for dml2 soc dscclk

Christian König (9):
      drm/amdgpu: grab an additional reference on the gang fence v2
      drm/amdgpu: use GFP_NOWAIT for memory allocations
      drm/amdgpu: overwrite signaled fence in amdgpu_sync
      drm/amdgpu: rework how isolation is enforced v2
      drm/amdgpu: rework how the cleaner shader is emitted v3
      drm/amdgpu: stop reserving VMIDs to enforce isolation
      drm/amdgpu: add isolation trace point
      drm/amdgpu: add cleaner shader trace point
      drm/amdgpu: remove invalid usage of sched.ready

Cruise Hung (1):
      drm/amd/display: Change notification of link BW allocation

Dillon Varone (1):
      drm/amd/display: Revert "Support for reg inbox0 for host->DMUB CMDs"

Dominik Kaszewski (1):
      drm/amdgpu: Add debug masks for HDCP LC FW testing

Ellen Pan (1):
      drm/amdgpu: Enable amdgpu_ras_resume for gfx 9.5.0

FengWei (1):
      drm/radeon/uvd: Replace nested max() with single max3()

Flora Cui (3):
      drm/amdgpu: release xcp_mgr on exit
      drm/amdgpu/discovery: check ip_discovery fw file available
      drm/amdgpu/discovery: use specific ip_discovery.bin for legacy asics

Harish Kasiviswanathan (1):
      drm/amdkfd: Fix bug in config_dequeue_wait_counts

Jesse.zhang@amd.com (4):
      drm/amdgpu: Fix SDMA engine reset logic
      drm/amd/amdgpu: Increase max rings to enable SDMA page ring
      drm/amdgpu: Optimize VM invalidation engine allocation and synchronize GPU TLB flush
      drm/amdgpu/sdma_v4_4_2: update VM flush implementation for SDMA

Jing Zhou (1):
      drm/amd/display: Guard against setting dispclk low for dcn31x

Jonathan Kim (1):
      drm/amdkfd: set precise mem ops caps to disabled for gfx 11 and 12

Kenneth Feng (2):
      drm/amd/amdgpu: shorten the gfx idle worker timeout
      drm/amd/amdgpu: Revert "drm/amd/amdgpu: shorten the gfx idle worker timeout"

Lijo Lazar (3):
      drm/amdgpu: Use wafl version for xgmi
      drm/amd/pm: Add debug bit for smu pool allocation
      Documentation/amdgpu: Add debug_mask documentation

Lo-an Chen (1):
      drm/amd/display: Fix incorrect fw_state address in dmub_srv

Mario Limonciello (1):
      drm/amd/display: Use HW lock mgr for PSR1 when only one eDP

Ryan Seto (1):
      drm/amd/display: Prevent VStartup Overflow

Srinivasan Shanmugam (2):
      drm/amdgpu/gfx11: Add Cleaner Shader Support for GFX11.5 GPUs
      drm/amdgpu: Add parameter documentation for amdgpu_sync_fence

Taimur Hassan (1):
      drm/amd/display: 3.2.325

Tao Zhou (1):
      drm/amdgpu: format old RAS eeprom data into V3 version

Tomasz Pakuła (1):
      drm/amdgpu/pm: Handle SCLK offset correctly in overdrive for smu 14.0.2

Victor Skvortsov (1):
      drm/amdgpu: Skip pcie_replay_count sysfs creation for VF

Xiang Liu (2):
      drm/amdgpu: Fix computation for remain size of CPER ring
      drm/amdgpu: Decode deferred error type in gfx aca bank parser

Yilin Chen (1):
      drm/amd/display: Fix message for support_edp0_on_dp1

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 157 ++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 110 ++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  38 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  20 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |  65 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |  52 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |  44 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |  32 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  30 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  28 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  14 +
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  11 -
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           | 119 ++++++--
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  28 +-
 drivers/gpu/drm/amd/amdgpu/vega10_sdma_pkt_open.h  |  70 +++++
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |  18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |  34 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   4 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |  20 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |  13 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  15 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |   9 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  18 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       | 185 ++++++-------
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   1 -
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |   3 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |  11 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  19 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   2 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   2 +
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   4 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  17 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   1 -
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |   1 -
 .../display/dc/link/protocols/link_dp_dpia_bw.c    | 193 +++----------
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |  18 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        | 132 +++------
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c | 121 +++------
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h |   4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    | 299 +++++++--------------
 drivers/gpu/drm/amd/include/amd_shared.h           |  12 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   5 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  10 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  59 ++--
 drivers/gpu/drm/radeon/radeon_uvd.c                |   2 +-
 73 files changed, 1248 insertions(+), 1052 deletions(-)
