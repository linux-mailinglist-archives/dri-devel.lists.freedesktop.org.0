Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7845978161
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 15:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6AA10E269;
	Fri, 13 Sep 2024 13:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ehJSr1H9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DF010E268;
 Fri, 13 Sep 2024 13:42:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8nJkfi6BM+8hXB/E+B+WvdirOWX2XT58EUqV4a7y6EH/WiFeM478IZW3Rdw26EzNOhV22Rw+Og4bcH/QtrfQAytpMXJIru7GYLx1Lxf1zjckTJ20IpKzM/VCFb6ArZShSqwbXAMBAt9lfVTG+/e3xE+2O56KNqlZXDkCZvVoONts+aUDUGe0HrWh/9oNZW5NY9pITTwKet7CmMnIlFRiTZdpNllrs7R3/1YWTwGXW3H5ngG0fBfsZBQpAL+EdrYsTuPiWXs9zzj17F/3+/vbpxVtYRBRKIR95JBnRK8msLH2ArvOZFqA7OE7ahIUv+UJh+fB3JY8apR8Tlpa72S5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhcFNSadJr9lEKEAIhgaVIhbb7CunWEh975aC3o0To0=;
 b=Uv82AAPNySsOTKwOlG8lE8vzubFD13g1tZPAwO73jt+dvQ/cK0i5kB1hwi33AsbnWyBIIjJfVAktU3T09rCyGXg5DDhqs4ytCWOeN5sn4VPvL8xDTJX48ITseqoNjHp6FK3ZvZeMX1F/BB32BEewqn14ZxP/lqqsSnQgvJEp1JxXNuwgQsXotwESlMoZlyLGbM3TPqqhEtfu4ucjwpg7w5l8+F/YhKXlt2NZZ8nGrp7KV9LGcaKcFJ7SZNK2BstlkPzXxb8PxNJyXaqzIM5Oe5BevTyzA6ka793h1ssT5k323iNLq4PyKkP+PWdscuSvQs4C6Vbvt3QLG/OQooC5Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhcFNSadJr9lEKEAIhgaVIhbb7CunWEh975aC3o0To0=;
 b=ehJSr1H9ClWo9Q3nACB2SR7jvehYx5H+z1yPCEsGfFbuW4VV3CEbZkycq0nFcig5p74Iol43PZGK76TcvTMRVrmr4M/r+tJ1+qATvwOTEiHntcljNqFjrt9kxWAoZQwSIh0+mSW4KVcolybfh2Nc/8wUFn7/geSest/dbavJYPg=
Received: from BLAPR03CA0065.namprd03.prod.outlook.com (2603:10b6:208:329::10)
 by DM6PR12MB4140.namprd12.prod.outlook.com (2603:10b6:5:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.21; Fri, 13 Sep
 2024 13:41:59 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:329:cafe::52) by BLAPR03CA0065.outlook.office365.com
 (2603:10b6:208:329::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.27 via Frontend
 Transport; Fri, 13 Sep 2024 13:41:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7982.0 via Frontend Transport; Fri, 13 Sep 2024 13:41:58 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 08:41:57 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, drm amd-drm-next-6.12
Date: Fri, 13 Sep 2024 09:41:38 -0400
Message-ID: <20240913134139.2861073-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|DM6PR12MB4140:EE_
X-MS-Office365-Filtering-Correlation-Id: 3646d711-4660-4756-c972-08dcd3f9d6bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0x0cllsSEhDcm0wdWJYVHdFTTFQT09MeTVnWlhkODV6SnlKWE95WHl1emJR?=
 =?utf-8?B?SlFOeUZhWTNOZjFQbnhCb0J5SFNtN2RSdkZ6UDJVeGlRNlhrajRIeTRBOXRX?=
 =?utf-8?B?SStNUG5UU0NPdStDZVJqTmN3Y3BXU0tGNEZLdWcxbm9Cb2Q4T3ZMODdURVVM?=
 =?utf-8?B?VDMxV1grUUFTZExLYXAvMmhMZFc2WXNRUFdUaWRCSjk3cWhIWEFSRENNa0Iv?=
 =?utf-8?B?bmpJTlAvYU9lRk12QXN6TVJPaWh4OVVqZ3NzMVo5TVZjRFpEMUVuZ3pHcVEy?=
 =?utf-8?B?Q3hhbG5GcUszeCsxTjBlNlJCR0JnRFlyTkcwb25hL2ZOZXFpSXNXbCs1T3dU?=
 =?utf-8?B?S0RKYWZhclJxcEVKRVNOZ3dOdDhUYlNya0dVcEFxM2JMQTJmeXNGV2NPRXd3?=
 =?utf-8?B?WUExWDVGUXFjWWJXNE9HL2pvS1grSE1mcER3Z3FhN0ZuNS9LNUgwY0wvbU5Y?=
 =?utf-8?B?Wlpzakx5dURYRzBZdFBoUVJkbUNMQ2JTM05HQktpakVpSkk1cnRwRjJUUlYy?=
 =?utf-8?B?WWMyUXVTTW1Ja1pUOE1uZ09qM2tadmJwcUhOTzdlVmNpbkowOWVHa2tjRmV2?=
 =?utf-8?B?MTFnMi9yc0NDN3lrazZhdldQOXpYdSthaitRVnJmNXVpbnRUcDQxNDhYODRo?=
 =?utf-8?B?MC9uVTVtbHVtRDFLRnFRVE1PNWIxQXY5ZVlLa2Z0dUNNQTdRbGlwOHVjTUda?=
 =?utf-8?B?alptZUkwN2tSYU9sVVpodDlIQ0xqQnVWWUxrbWNPM3UxczloQVlkVG9nOFpO?=
 =?utf-8?B?eURLUk96V2JyUXJqQ1pmV3dLblNFUnNPS0dNR2ZPeklUOTJCcHJYbjNvSUtQ?=
 =?utf-8?B?dS9PcTBWaDBneGttL1RleTZjdHRiUVdXWHM4bGtzNVZLZGp3OVkxVzBlcTly?=
 =?utf-8?B?ZmFJZnNjUmQwSXJLOXdUYmMyaXhJdW9vY1UzSW0zWXVFRnhFc1poUVZwcHNu?=
 =?utf-8?B?a1RZaWJqTlVUVTViNDhXRlJyWngwajBDZGZMOXQ2NzBKZi90ZWJ6b09LdEll?=
 =?utf-8?B?SWw4bnhKaUxIRkFiRTdQeVpjSm9Zb0NwMm9hTk5tMS9lRDZOanV5TFRUVTlF?=
 =?utf-8?B?S3pRR3RCZEJVbDJWK3F4QkJNRk9YaGROWHdXbU5tWDU3WGsrZmdibWJvdzdT?=
 =?utf-8?B?T01tK3lGY0pFcFBLck8yQ3A4Y1I3Uk1GOC9kMFcvVXFGYXpoRUtNcjY3SUMz?=
 =?utf-8?B?ZjhjSTY0ejJZTkYxSzFQMzJhbGFBYWMweDFsT0ZkZW9UNk1iTXcxaHdHOUVJ?=
 =?utf-8?B?eFZXUWVMS2NWWkhBRVY0TnpiY3Z4RXBoOUZKZVVONlN6WFZ0YUpzdXBKY3FO?=
 =?utf-8?B?MXF4bWhtN1ZkUkJ4OEI0alB0V2lMRGx2ZmJyeUt1Y0pFOXM2WUJhOGVrRkZI?=
 =?utf-8?B?MEhpdElvMWxLYnJ3M3pZdW5yam92ZmFyTndGOUJuMHQvSkxvbWZNNDU0THNP?=
 =?utf-8?B?ZzEzeXRvd3JMS09DSVBaRHhqYk1FQzVHMURuRzI5d2NVc25POTI2QjBqTFRu?=
 =?utf-8?B?MmVIODEwZlBjTy9GYkRwY3p5UEZyU28xYmxaOG5DMThyeTYza0xxVUdTbFl3?=
 =?utf-8?B?cThCYXdwcTFvYVJ4VlBFcWhZY05wdC9yNEEya1ZzNitjbFZjUDJyMTFpSURp?=
 =?utf-8?B?MTNHREJqMEJkcVE1QTdnbkM3eDdWRFRxbFVlVk1aNXJJdEtkcmMzTVZuYjQ2?=
 =?utf-8?B?UVFJdVVuOWtHY09FTlV2ZFM0Sk81MzNpY24ycmdma1EzWU9CczZmR1lJQ1Nm?=
 =?utf-8?B?TnZPbkwvd1pDRjNPNmdyZ1VMdFNhaFJ2OS8zbE9pVnl5OEwxU1JtRDdmYi9r?=
 =?utf-8?B?MjZrSnJSNkVPMXdGcHpOQ2Jid1d1QnkzaTZ0R2poYmFJdlpiNko1cWZSL1VR?=
 =?utf-8?Q?HdSYE3hOVy/iq?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 13:41:58.2222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3646d711-4660-4756-c972-08dcd3f9d6bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4140
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

A few fixes for 6.12 and the drm dma-buf race fixes from Al Viro.

The following changes since commit 7a199557643e993d4e7357860624b8aa5d8f4340:

  Revert "drm/amdgpu: align pp_power_profile_mode with kernel docs" (2024-09-05 14:27:41 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.12-2024-09-13

for you to fetch changes up to 0c8c5bdd7eaf291b6f727e98506fb68acee3a4cc:

  drm/amd/display: Add all planes on CRTC to state for overlay cursor (2024-09-11 10:34:05 -0400)

----------------------------------------------------------------
amd-drm-next-6.12-2024-09-13:

amdgpu:
- GPUVM sync fixes
- kdoc fixes
- Misc spelling mistakes
- Add some raven GFXOFF quirks
- Use clamp helper
- DC fixes
- JPEG fixes
- Process isolation fix
- Queue reset fix
- W=1 cleanup
- SMU14 fixes
- JPEG fixes

amdkfd:
- Fetch cacheline info from IP discovery
- Queue reset fix
- RAS fix
- Document SVM events
- CRIU fixes
- Race fix in dma-buf handling

drm:
- dma-buf fd race fixes

----------------------------------------------------------------
Al Viro (4):
      drm: new helper: drm_gem_prime_handle_to_dmabuf()
      drm/amdgpu: fix a race in kfd_mem_export_dmabuf()
      drm/amdkfd: CRIU fixes
      drm/amdgpu: get rid of bogus includes of fdtable.h

Alex Deucher (1):
      drm/amdgpu/atomfirmware: Silence UBSAN warning

Christian König (2):
      drm/amdgpu: re-work VM syncing
      drm/amdgpu: revert "use CPU for page table update if SDMA is unavailable"

Colin Ian King (1):
      drm/amd/display: Fix spelling mistake "recompte" -> "recompute"

Dan Carpenter (1):
      drm/amdgpu/mes11: Indent an if statment

David (Ming Qiang) Wu (2):
      drm/amd/amdgpu: apply command submission parser for JPEG v2+
      drm/amd/amdgpu: apply command submission parser for JPEG v1

David Belanger (1):
      drm/amdkfd: Add cache line size info

Hawking Zhang (1):
      drm/amdkfd: Select reset method for poison handling

Jani Nikula (1):
      drm/amdgpu: drop redundant W=1 warnings from Makefile

Jesse Zhang (2):
      drm/amdgpu: fix queue reset issue by mmio
      drm/amdkfd: Fix resource leak in criu restore queue

Jonathan Kim (1):
      drm/amdkfd: fix missed queue reset on queue destroy

Kenneth Feng (2):
      drm/amd/pm: update the features set on smu v14.0.2/3
      drm/amd/pm: fix the pp_dpm_pcie issue on smu v14.0.2/3

Lang Yu (1):
      drm/amdgpu: fix invalid fence handling in amdgpu_vm_tlb_flush

Leo Li (2):
      drm/amd/display: Do not reset planes based on crtc zpos_changed
      drm/amd/display: Add all planes on CRTC to state for overlay cursor

Li Zetao (2):
      drm/amd: use clamp() in amdgpu_pll_get_fb_ref_div()
      drm/amdgpu: use clamp() in amdgpu_vm_adjust_size()

Lijo Lazar (1):
      drm/amdgpu: Normalize reg offsets on JPEG v4.0.3

Nicholas Susanto (1):
      drm/amd/display: Refactor dccg35_get_other_enabled_symclk_fe

Peng Liu (2):
      drm/amdgpu: add raven1 gfxoff quirk
      drm/amdgpu: enable gfxoff quirk on HP 705G4

Philip Yang (1):
      drm/amdkfd: Document and define SVM events message macro

Qili Lu (1):
      drm/amd/display: fix dccg root clock optimization related hang

Ramesh Errabolu (1):
      drm/amdgpu: Surface svm_default_granularity, a RW module parameter

Srinivasan Shanmugam (5):
      drm/amd/display: Add missing kdoc entry for 'bs_coeffs_updated' in dpp401_dscl_program_isharp
      drm/amdgpu/: Add missing kdoc entry in amdgpu_vm_handle_fault function
      drm/amdgpu: Replace 'amdgpu_job_submit_direct' with 'drm_sched_entity' in cleaner shader
      drm/amd/display: Add kdoc entry for 'program_isharp_1dlut' in 'dpp401_dscl_program_isharp'
      drm/amdgpu: Fix kdoc entry in 'amdgpu_vm_cpu_prepare'

Tobias Jakobi (2):
      drm/amd/display: Avoid race between dcn10_set_drr() and dc_state_destruct()
      drm/amd/display: Avoid race between dcn35_set_drr() and dc_state_destruct()

 drivers/gpu/drm/amd/amdgpu/Makefile                |  18 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  12 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  17 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  35 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c          |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  99 +++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |  11 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |  10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |  16 +---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   4 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |  76 +++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.h             |  11 +++
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |  63 ++++++++++++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.h             |   6 ++
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.h             |   1 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  93 ++++---------------
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |   7 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  64 +++++++++----
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   8 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |  40 +++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   6 ++
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |  45 +++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  22 +++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  13 ++-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   2 +-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |  79 +++++++---------
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.h |   1 +
 .../amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c    |   2 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  20 +++--
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  24 +++--
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   1 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |  11 ++-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  12 +++
 drivers/gpu/drm/drm_prime.c                        |  84 ++++++++++-------
 include/drm/drm_prime.h                            |   3 +
 include/uapi/linux/kfd_ioctl.h                     | 100 ++++++++++++++++++---
 50 files changed, 678 insertions(+), 366 deletions(-)
