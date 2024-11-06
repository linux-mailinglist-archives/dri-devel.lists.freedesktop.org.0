Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262BB9BF360
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 17:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A7610E2EF;
	Wed,  6 Nov 2024 16:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NdB4qnuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D375210E2EF;
 Wed,  6 Nov 2024 16:39:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEe3ewAztUTeX7sSBoxsyiOBJ1txB7oezlhXiOgNadUvplAKp6v30jBMH7RSjOx97KH6LIVz0CdvK0DEygIZzTXnnoTL3+XeV+KpR6SgIf+nqZG98dXdwRN8RNtIvhhNSZ53iJUSS/An46RB6tR6MSO/HZy1qmI1XKe8DiisJ1dUi+mD12c9Y8dXrgWdSAEjzIHEKKmybo/Q1jMuiMpG4JtrEk36+XhKQm25OYRA+1H84kpHxo75qUZP3r909ClfiHIdG/pOeE4F7G17S3C/MwjJEiU08L8l9ilehpb0y+L/cOeJYxnBdJQzFDqiWgX/Szhd7Xj+3uVsLZMd7bVIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TmNllcDdA2UV9oFZauYBQs5eboAq52M/5i080r/n+w=;
 b=fOjZ/HNubPjryHqi/0HCBzqbnhVojlKg0pFAPbEVNV0sVqQ3egV3xLwAlEleUXhpqGTNdR+fTC/W30OnMuiLz9LkXVtOpbF1mi2HkiYTGvYgRGKGGrbflYjc6fq8dpPl16pYpR4Q9MzJfpFuY0X+TN3b5tVRRgXDp7I1EReQPj2IT0dYYvYLiucbErGviP8FPJ/Bq/N6bvXnw+E5zYzuwDad+6tOF7j/GbNti2ZpwYnTv3ROXjnT5F7Gcl8A9PczSS/kp9tB+soxYJ+FoZWaiHkQTCxhN3IBiaMaQAOHaWt8A3xamvUQb6NcvkURb7nylkcWsiVlwC3sOHhMMBAE4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TmNllcDdA2UV9oFZauYBQs5eboAq52M/5i080r/n+w=;
 b=NdB4qnuRzitb+8oT+5yHsN4L1R1Tvvt/Gso8jfcbfJp1iDz22fxY5ca9wgS7Fn1vkfI6CTMtq5GnuzlHFloICETE978zhYwOboxkKX6QVTZ/PE4S+ikcotVaDzXarot3IEuAlzoByLZENkBCFvCsWnqWyvXK8B5CJjdbR2BD++M=
Received: from SJ0PR13CA0138.namprd13.prod.outlook.com (2603:10b6:a03:2c6::23)
 by SN7PR12MB7810.namprd12.prod.outlook.com (2603:10b6:806:34c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 16:39:21 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::36) by SJ0PR13CA0138.outlook.office365.com
 (2603:10b6:a03:2c6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.17 via Frontend
 Transport; Wed, 6 Nov 2024 16:39:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 16:39:21 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 10:39:18 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.13
Date: Wed, 6 Nov 2024 11:39:03 -0500
Message-ID: <20241106163904.189108-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|SN7PR12MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: 02bf7629-2f09-463e-cf85-08dcfe8190d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0dteUlZWlNYUzYyT1ZKTEFwYTZlMGlocTRoejVNVTVCRnYxb2FMMHhzMXNF?=
 =?utf-8?B?OTExbk02WlgxcWJmMVA5Z0cwbVZLM2lCdmRRN290SWJYWnhJeExhdzkxeCs0?=
 =?utf-8?B?NmpoY3FCa01sL1VNcWltNHhkU1VlZXVNUjlDbVBHTEl4eklyaWJXOEt3Rzla?=
 =?utf-8?B?WjJ6RlBMK0dMWFB2K0FNUTNJUEZjSm1rWUhjM2tYM2NuUmxUQ2ovMXRkRkE1?=
 =?utf-8?B?cGlFWHNDVHJQbzlUWGFNQ0ltZE5GQzBFZFJkdVpZZmlkMGg1UnI3SGNtdzRt?=
 =?utf-8?B?N3JrS0gwdUdHVUhEb0JPT08zSVZhVWZCQjRYMjI3SVdhbUNZVThvOXc3dnFz?=
 =?utf-8?B?Ty82bmN4RXBoZzBaay9jR1oxRDdZdUxRL3ZobVBWV0ZYNEhvQ1pKVHZZYlZq?=
 =?utf-8?B?VC9FTG56KzVJWWRFTy9UOXpMM25qdGtvL3VwMlZuUUxyR0F2d0tMUFBLYWJy?=
 =?utf-8?B?YUVESkhNNGtxQS9nb05LNjB2V1ZCNlp6eldjdXZyS1hmb2Y1SitVS1d4LzZa?=
 =?utf-8?B?Z2ltYllTSVY2dDZVbEJMRmpHRmhqZUd3WW1QU1NsRGwzNFVhdmVVeTY1QTJX?=
 =?utf-8?B?RUQzTitNRUFjRUtRcWNuYkQwQ3RCVURNZjNRcWJMOWh3U0pLU3ZJUXBIRENR?=
 =?utf-8?B?b3l5djRxRVY1Y2VROWhTd3M1MjUwbDZDMmp3SThHN0JnS3MzeFFMbFR4NFV5?=
 =?utf-8?B?OFh0NG1PZmVIWG5TZUFWZTdmZ0tBalpVcU85cm9mY01CWTF2NUNMcUpNN0hR?=
 =?utf-8?B?V095QW54QitaMmZpT1Y1RjlGbTRsWnZzWURKQlZ5QUZFN29ydFBKQ01VOW9F?=
 =?utf-8?B?U2VWNldVb3JUb0wrNzQvaTcvTU43eEp5bjJhOEVqa2hpemNzZnhSWmtyUmJ0?=
 =?utf-8?B?SGN1ejBGYWxkYlV2Z0lQbnREaE9tK1hFSGdseUVUb2JqZHVHcFhCVCtEMEZr?=
 =?utf-8?B?N1ZlalRSY0RwU2lwRWh1Y0pZWVIzTHZPVUlXR3FCbWxrR1Ryd1F5WEFnZVd5?=
 =?utf-8?B?TmpSYUI0d1ZpVlMyTTdDdU1DaFRkZHpXWWpldWNBSlVhSzJ4S1BqQ1IwWGdm?=
 =?utf-8?B?eS9Oc20rc1V4aHY5d1k1b3Jna01DaEgva0kvblN6a2hHVG0ySGQxRU1EYTFR?=
 =?utf-8?B?T2dyVWhFSU04a2cvNkU1TzlUQm4xRm5IQWp3WHR1UmhtN3dqcDNJTHRLZGRo?=
 =?utf-8?B?YkdGU05Ja0NZeGc3eld2RnRTQ3JaR0hOTC8xczFvRm4rR1k2RkVwM1pCRDRy?=
 =?utf-8?B?Rm5DNWx2akZZdTNidGNiKzRmY1U0cU55OHlrVkJtZklFb3pmZm1BWE1VMTk0?=
 =?utf-8?B?YWxob3ZSck5oNW5KZ0F5ZnRiQysrS1NLeGl1NnJNcFR3ZFUyMlNGaGNKZ0th?=
 =?utf-8?B?aTdjWlNVRE1xT1BwQktBUW11OUVwNjd1c1dwVTdVSW43ek5zZW13Y3hvRUh2?=
 =?utf-8?B?YlBLbkJ4ZWJDTFZLVzRoRGNtY1pSNGZDdm9yZ2FHMWRTVGhSQ0RkalJEYjJU?=
 =?utf-8?B?WlRIUHI3M21JRkovdGZqUkQydDhYMEtRczArSnY1b21UMzgyS2xhOVp3WTZk?=
 =?utf-8?B?cU1PYWhEM2Z6S05BWmVZZW5hajNmRkxMN0xkM1BUMmU1WG1YUlpGMTE0SEtp?=
 =?utf-8?B?eUhLNDFBc3Fxby8rU3p5cHBrYTN4WXFpcUF5SlFZL0w2dWJNb0xaZHdKd1lk?=
 =?utf-8?B?VEhmdmhEbXdGaWRmS0FIQlllVStFL0tRSHdqQzZDZFJpMmtHRkpFUHVXeWRM?=
 =?utf-8?B?cFpLMFBGTjdjNFM0ZmdtS0czSDVGOGdhUksvUCtiMkRBSFBrYlI5emJ2dGNT?=
 =?utf-8?Q?H2ePkrn0ZuV4nzG/BFgJFy2mL6oNN3GNJ/4A4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 16:39:21.1954 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bf7629-2f09-463e-cf85-08dcfe8190d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7810
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

Last few updates for 6.13.

The following changes since commit dac64cb3e029e9ae9ca251798bcb9cdb118d68d5:

  drm/amdgpu: Fix amdgpu_ip_block_hw_fini() (2024-10-24 18:07:10 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.13-2024-11-06

for you to fetch changes up to f5d873f5825b40d886d03bd2aede91d4cf002434:

  drm/amdgpu: add missing size check in amdgpu_debugfs_gprwave_read() (2024-11-05 10:35:59 -0500)

----------------------------------------------------------------
amd-drm-next-6.13-2024-11-06:

amdgpu:
- Misc cleanups
- OLED fixes
- DCN 4.x fixes
- DCN 3.5 fixes
- 8K fixes
- IPS fixes
- DSC fixes
- S3 fix
- KASAN fix
- SMU13 fixes
- fdinfo fixes
- USB-C fixes
- ACPI fix
- Fix dummy page overlapping mappings
- Fix workload profile handling
- Add user control for zero RPM on SMU13
- Cleaner shader updates
- Stop syncing PRT map operations
- Debugfs permissions fixes
- Debugfs bounds check fix
- RAS cleanups
- Enforce isolation updates

amdkfd:
- Add topology cap flag for per queue reset
- Add an interface to query whether KFD queues are present
- Use dynamic allocation for get_cu_occupancy

----------------------------------------------------------------
Alex Deucher (8):
      drm/amdgpu/smu13: fix profile reporting
      drm/amdkfd: add an interface to query whether is KFD is active
      drm/amdgpu: fix fairness in enforce isolation handling
      drm/amdgpu: add ring reset messages
      drm/amdgpu/mes: fetch fw version from firmware header
      drm/amdgpu: Adjust debugfs register access permissions
      drm/amdgpu: Adjust debugfs eviction and IB access permissions
      drm/amdgpu: add missing size check in amdgpu_debugfs_gprwave_read()

Alex Hung (2):
      drm/amd/display: Remove useless assignments and variables
      drm/amd/display: Simplify dcn35_is_ips_supported()

Antonio Quartulli (1):
      drm/amdgpu: prevent NULL pointer dereference if ATIF is not supported

Aric Cyr (2):
      drm/amd/display: 3.2.307
      drm/amd/display: 3.2.308

Aurabindo Pillai (3):
      drm/amd/display: Fix idle optimizations entry log
      drm/amd/display: parse umc_info or vram_info based on ASIC
      drm/amd/display: Add a missing DCN401 reg definition

Ausef Yousof (3):
      Revert "drm/amd/display: Block UHBR Based On USB-C PD Cable ID"
      drm/amd/display: Remove hw w/a toggle if on DP2/HPO
      drm/amd/display: Remove otg w/a toggling on HPO interfaces

Austin Zheng (1):
      drm/amd/display: Do Not Fallback To SW Cursor If HW Cursor Required

Boyuan Zhang (1):
      drm/amd/pm: add inst to dpm_set_vcn_enable

Candice Li (1):
      drm/amdgpu: Add nps_mode in RAS init_flag

Charlene Liu (1):
      drm/amd/display: avoid divided by zero

Christian König (2):
      drm/amdgpu: drop volatile from ring buffer
      drm/amdgpu: stop syncing PRT map operations

Dillon Varone (1):
      drm/amd/display: Add P-State Stall Timeout Recovery Support for dcn401

Dominik Kaszewski (1):
      drm/amd/display: fix rxstatus_msg_sz type narrowing

Dr. David Alan Gilbert (3):
      drm/amd/display: Remove unused regamma functions
      drm/amd/display: Remove unused cm3_helper_translate_curve_to_degamma_hw_format
      drm/amd/display: Remove last parts of timing_trace

Fangzhi Zuo (2):
      drm/amd/display: Reduce HPD Detection Interval for IPS
      drm/amd/display: Prune Invalid Modes For HDMI Output

Hansen Dsouza (1):
      drm/amd/display: Add a boot option to reduce phy ssc for HBR3

Ilya Bakoulin (1):
      drm/amd/display: Minimize wait for pending updates

Jesse Zhang (2):
      drm/amdgpu: add amdgpu_gfx_sched_mask and amdgpu_compute_sched_mask debugfs
      drm/amdgpu: add amdgpu_sdma_sched_mask debugfs

Jonathan Kim (1):
      drm/amdkfd: flag per-queue reset support for gfx9

Joshua Aberback (1):
      drm/amd/display: Change MPC Tree visual confirm colours

Kaitlyn Tse (1):
      drm/amd/display: Implement new backlight_level_params structure

Kenneth Feng (2):
      drm/amd/pm: always pick the pptable from IFWI
      drm/amd/pm: correct the workload setting

Le Ma (1):
      drm/amdgpu: add generic func to check if ta fw is applicable

Leo Ma (1):
      drm/amd/display: Fix underflow when playing 8K video in full screen mode

Li Huafei (1):
      drm/amdgpu: Fix the memory allocation issue in amdgpu_discovery_get_nps_info()

Lijo Lazar (4):
      drm/amdgpu: Group gfx sysfs functions
      drm/amdgpu: Skip IP coredump for RAS errors
      drm/amdgpu: Add compatible NPS mode info
      drm/amdgpu: Fix DPX valid mode check on GC 9.4.3

Lohita Mudimela (1):
      drm/amd/display: Refactoring if and endif statements to enable DC_LOGGER

Nicholas Kazlauskas (1):
      drm/amd/display: Remove inaccessible registers from DMU diagnostics

Ovidiu Bunea (3):
      drm/amd/display: Optimize power up sequence for specific OLED
      Revert "drm/amd/display: update DML2 policy EnhancedPrefetchScheduleAccelerationFinal DCN35"
      drm/amd/display: Do not read DSC state if not in use

Prike Liang (4):
      drm/amdgpu: correct the S3 abort check condition
      drm/amdgpu: clean up the suspend_complete
      drm/amdgpu: Fix dummy_read_page overlapping mappings
      drm/amdgpu: set the right AMDGPU sg segment limitation

R Sundar (1):
      drm/amdgpu: use string choice helpers

Samson Tam (4):
      drm/amd/display: fix handling of max_downscale_src_width fail check in SPL
      drm/amd/display: store sharpness 1dlut table in dscl_prog_data
      drm/amd/display: fix asserts in SPL during bootup
      drm/amd/display: SPL cleanup

Srinivasan Shanmugam (2):
      drm/amdkfd: Use dynamic allocation for CU occupancy array in 'kfd_get_cu_occupancy()'
      drm/amdgpu/gfx11: Add cleaner shader for GFX11.0.3

Taimur Hassan (2):
      drm/amd/display: [FW Promotion] Release 0.0.240.0
      drm/amd/display: [FW Promotion] Release 0.0.241.0

Tom Chung (1):
      drm/amd/display: Fix brightness level not retained over reboot

Tvrtko Ursulin (3):
      drm/amd/pm: Vangogh: Fix kernel memory out of bounds write
      drm/amdgpu: Stop reporting special chip memory pools as CPU memory in fdinfo
      drm/amdgpu: Expose special on chip memory pools in fdinfo

Victor Zhao (1):
      drm/amdgpu: skip amdgpu_device_cache_pci_state under sriov

Wayne Lin (1):
      drm/amd/display: Don't write DP_MSTM_CTRL after LT

Wolfgang Müller (2):
      drm/amd/pm: add zero RPM OD setting support for SMU13
      drm/amd/pm: add zero RPM stop temperature OD setting support for SMU13

Yang Wang (1):
      drm/amdgpu: optimize ACA log print

Yunxiang Li (2):
      drm/amdgpu: make drm-memory-* report resident memory
      drm/amdgpu: stop tracking visible memory stats

jeffbai@aosc.io (1):
      drm/amdgpu: fix comment about amdgpu.abmlevel defaults

 Documentation/gpu/amdgpu/thermal.rst               |  12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            | 234 +++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |  11 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  37 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |  70 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  13 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  21 +-
 .../drm/amd/amdgpu/gfx_v11_0_3_cleaner_shader.asm  | 118 ++++++++
 .../gpu/drm/amd/amdgpu/gfx_v11_0_cleaner_shader.h  |  56 ++++
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   5 -
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  28 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   5 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |   9 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  25 ++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  57 ++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  10 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   4 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   5 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |   6 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  25 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  13 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |  82 +++---
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   4 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  10 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   8 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   1 -
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |  14 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  28 ++
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |   2 -
 .../drm/amd/display/dc/dce110/dce110_mem_input_v.c |   2 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c | 151 ----------
 .../display/dc/dio/dcn10/dcn10_stream_encoder.c    |   2 -
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.c      |   2 -
 .../dc/dml2/dml21/dml21_translation_helper.c       |   2 +-
 .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |   1 +
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   3 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c  |   1 +
 .../amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c    |   3 +-
 .../drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h |   4 -
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h |   9 +-
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |  12 +
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.h   |   8 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   9 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |  16 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.h    |   2 +
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |  49 ++++
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.h    |   3 +-
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |   2 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |   2 +-
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |   2 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  16 +-
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |   2 +-
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |   2 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   5 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   5 -
 drivers/gpu/drm/amd/display/dc/inc/core_status.h   |   2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   3 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  15 +-
 .../display/dc/link/protocols/link_dp_capability.c |  25 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  17 +-
 .../dc/link/protocols/link_edp_panel_control.h     |   3 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |   2 -
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   1 -
 .../display/dc/resource/dcn201/dcn201_resource.c   |   1 -
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |   1 -
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |   1 -
 .../display/dc/resource/dcn301/dcn301_resource.c   |   1 -
 .../display/dc/resource/dcn302/dcn302_resource.c   |   1 -
 .../display/dc/resource/dcn303/dcn303_resource.c   |   1 -
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   1 -
 .../display/dc/resource/dcn314/dcn314_resource.c   |   1 -
 .../display/dc/resource/dcn315/dcn315_resource.c   |   1 -
 .../display/dc/resource/dcn316/dcn316_resource.c   |   1 -
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   1 -
 .../display/dc/resource/dcn321/dcn321_resource.c   |   1 -
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   1 -
 .../display/dc/resource/dcn351/dcn351_resource.c   |   1 -
 .../display/dc/resource/dcn401/dcn401_resource.c   |   1 -
 .../display/dc/resource/dcn401/dcn401_resource.h   |   4 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        | 102 ++++---
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.h |   1 -
 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h  |   7 +-
 .../gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c    |  34 +--
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  63 ++++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   6 +-
 .../gpu/drm/amd/display/include/logger_interface.h |   4 -
 .../drm/amd/display/modules/color/color_gamma.c    | 307 ---------------------
 .../drm/amd/display/modules/color/color_gamma.h    |  11 -
 .../drm/amd/display/modules/freesync/freesync.c    |   3 +
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |  31 +--
 .../amd/include/asic_reg/dcn/dcn_4_1_0_sh_mask.h   |   2 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   4 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 127 +++++++++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   4 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  55 +++-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   2 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   9 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   9 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   9 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  12 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   3 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 124 ++++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |   4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 113 +++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   3 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  74 +----
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   8 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   2 +
 include/uapi/linux/kfd_sysfs.h                     |   3 +-
 149 files changed, 1683 insertions(+), 1020 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3_cleaner_shader.asm
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_cleaner_shader.h
