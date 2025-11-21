Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF64C7864B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4295A10E80F;
	Fri, 21 Nov 2025 10:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="12XZKvgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011048.outbound.protection.outlook.com [52.101.62.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AA310E809;
 Fri, 21 Nov 2025 10:13:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STAMn6oVmpBZbBM6rrbjqcFeYtd2VXa7+9lGLWsgXA1Z9fXep02+Nv2ejqDNJTGjNsn8ZWKYanDXcmbO43K0dYNW8vksJPFKnLczvO4+5/yGESvqnpPcyBehtDoM4gTNZGM20PN3XnZnHPr9ZgLYpl+fYCPIXo8amer3aMAiaIilD//oezQ8SnAg7UO83IQTH4qIzZmJ6HUWqr9JTjYr1eGRBRnoBkA9vv55EXTDSnZ8ZvM2Zf9ApzvhxEDmRVPtHoB9OfSVVdGtFkTE4uW7Dte/gIJUhaJ8GZNjZDr4q+lct5mUiuRc0SDbKqlX6GfEYqoaFn377XGpB+ehYHmLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv0TaBPAysMDm2r3OVTrjyPAipCVEICIUKhPQjsifGo=;
 b=argcYPwrMbsKrI+om1Lch2rgqD8PqTWQQr+WMC1TRHihHv6ytR4k/STCCKRZdMkpR7yVmVfVTSb71xgUcu+YxntqoBx4NG/Wjj7w95gwtmmEporAjZED82AJQRy7NrqGpb5cvCLAAPaSXr+SVb01exR6yCTwpH+p6Futc6UafYvB+D88Q0T8yN78tYvjR8jF2SpTn2tUSFKScl5K4I6a0cxlcE0mnJx7dWB8Qwwf/EFdC+C4Y5PpitYiOYUAONCdRpw9KSuFTLVMtWKOwXcVdt4tqkPh3XLP+vyG8eHIHsf6kCpNZCLnukyLNqvwOnbFcioHTyj2WZA2zZIYbpPxww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv0TaBPAysMDm2r3OVTrjyPAipCVEICIUKhPQjsifGo=;
 b=12XZKvggHVKTPPXV9Jzze7+28ZsS9Ge6FKKIBgYTHTZ9UT+gprWaszZ8mYYp8apN6bdN8X79q9QnC85FGq/jqgEl2QFWOrEvvKawM/dFe1FNk2uRGIVAX3cEifEi8+ZmPo6R/Zv0x5fJaF0twj/8iBggvKfN4gAdqQbM2SfEJ9E=
Received: from CH2PR07CA0027.namprd07.prod.outlook.com (2603:10b6:610:20::40)
 by CYXPR12MB9278.namprd12.prod.outlook.com (2603:10b6:930:e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:13:43 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:20:cafe::1b) by CH2PR07CA0027.outlook.office365.com
 (2603:10b6:610:20::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 10:13:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:13:43 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:13:40 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: 
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Harry Wentland <harry.wentland@amd.com>, Huang Rui
 <ray.huang@amd.com>, Leo Li <sunpeng.li@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 00/28] drm/amdgpu: use all SDMA instances for TTM clears
 and moves
Date: Fri, 21 Nov 2025 11:12:10 +0100
Message-ID: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|CYXPR12MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: d0fc0e40-c46a-41cd-4035-08de28e6a6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3A4S1FKandBY0gxYlFLWDVpTWtmQ2NIZkJFOW4zS0NWbkNvTVQrV0ZNU0Ex?=
 =?utf-8?B?dnNGZzFUQjZFWTVQc3lQb1pnbHlGaHVaY3J0Y2ZFMVp1UWp0cFRoYXNZcVhV?=
 =?utf-8?B?bk9aR1VDUWdWZG1GR2tmU2kxQ2FKRXhScE1tdS9SakNZQTY2M2NrN1NVTEVn?=
 =?utf-8?B?ekVpN2prdXBidE9KbGRqVVFETjVFcjJHT2tFc2tVRElVSWcwbnl6QVVzR1BU?=
 =?utf-8?B?QWUySERiNWF3WksxQjhoVi92T3F5R2xZY0lJL2djbHIwMWsvL0FoTEZ0eFM1?=
 =?utf-8?B?cXJiYUtNMElEemJDM1RtdjlRMXk5ZVZ1SzhnelZaOXNKdGpzRDhycTVBRDA3?=
 =?utf-8?B?RUpEVEdwWXdiMW5JaExnUVZWODlOaE5Hbll5L1RjMXRubGF5TzFOOEZKc25n?=
 =?utf-8?B?R0VETVp1UnFNeXN2TlhMR0tac3YxdjlMcmZDUDlrY3RtbFVIeTBuaE4zMTY2?=
 =?utf-8?B?Mm1RTlgwN1c2Q1g2SmhOYWJ6ckp3V3Y3eWtzT1lWUzZiMys0YkQzWmpZOVNx?=
 =?utf-8?B?d1kyRFhOb1lpU2lkOUUzSjk0cTlkUGJ0LzY3aXpud1BsOWUva3IyVGF5eDNC?=
 =?utf-8?B?Z1Z4eGRIaUhaWlIwajZiUVlMWGxwNk1LMXdNbUFTZU5wL29jYWtWdjdLMGhP?=
 =?utf-8?B?N1BrS0VBRyszMXlWWFBNalVCZExMb2Z1S3NNRnlNOUhvc25mV0lWVE9tSWNG?=
 =?utf-8?B?ZzJFRE1DdGI3UTNESGdQOVhHRmsrZFlvbVhwTmZPQ2xiRGJKUTZLVENQTlBn?=
 =?utf-8?B?WHJvL1A2RkR0cmhqYnZUTDNmdEU0clprK2YrY2ZGL0loK2ZsRGNtazB4SzF1?=
 =?utf-8?B?OU1rUGRBVW1sRjVFTG40VDdyRGV0Wk9KT0dDL014WC9EcTEwOUhwRjZNS0do?=
 =?utf-8?B?YlZxamJlc09mVE5LSFNIcXE1MG1BK1VTcndrTVhxeVhmVFArVTNERFdNUk5V?=
 =?utf-8?B?K0ZNY3hROTFVMy9WUHFZNW5FejQ3ZldhUi8zdWpuZXdaajJjR1FTek1telN0?=
 =?utf-8?B?ZHdzd2xaczVMUzcwODdMUjBlcW1CQTc3TDVOc3VXa0tkRTM2eWNiaW5PMFVn?=
 =?utf-8?B?ZHNQWWNISkw3WHg5SklBVVM3aGU3Nnl4L2pzL0hlSWkyVmRPTmZsZDlQLys2?=
 =?utf-8?B?MjFEUm5rNDFEMDZzRXhzRVlsdmJxRXBRZUg2V0xNcU1iQi9HdzdLelhRZWtj?=
 =?utf-8?B?SnFhc2k0YlM0UHFKVlNtWXcwNU55R21OQm5RRC9VK3VmclJzbUJhd09DbXJW?=
 =?utf-8?B?QTZzNVcya2FMeXlnQmkrVGpJd1dsaW9sWitCd1JFTjZDZS9hWDVwTVZKOGpm?=
 =?utf-8?B?eXkzUEdCRzFDUDRnNFZNZ3AyWEh3cXdzTFRYWVcwTERkNTFId3NZY1FGSlRa?=
 =?utf-8?B?b2crUXNDZjJhbkRtZ0p6Nnd6QWNoSlVxSk1hTC93by9STUxDOWJyTkdIdFJO?=
 =?utf-8?B?b2dsUER1UHhPdEVyOFh3MVFYREhCa3BleUdjTVN0TTVPcUFpbjE2TjdFcWR4?=
 =?utf-8?B?bE5KSUc5cXVhamJvZGV4c2dlN2ZITG1aTE5XUW1wc2VCTTRncjd5Y2d6M2w4?=
 =?utf-8?B?d29MdTZwV3BheWZmMk1OS1ZzcjliMG9xSmVZemtwOXdwZ3dmeXVGWEFQbG5Q?=
 =?utf-8?B?YVhKSGRaQmd6TUF2SXpIY1RFU1VCZXNPQW93REQ3aisvNW5ueWZaeFNVNWs2?=
 =?utf-8?B?Yi9aajM1UERpb1JjL1ovQjBibjNRNHp3ZGtuY3Y4UXp6SkQzQUhZanZGbldm?=
 =?utf-8?B?NTR1eG0rWXIrc2h1c0ViVlFtUS9YcGdaMTgzcEE4b3JjS1V2RHRiVnhhTzhW?=
 =?utf-8?B?WkkvSlBLaDZEUE5zVWRpM3JEbGl3YzJGOGd6ci9rYTZzb2tlUDRYM0R5Znpi?=
 =?utf-8?B?SXpqQ1l4THR1bFpVYU1xaWdEWnpVbExWVExvZEtwQU5SclBOQVhGY3crU2N4?=
 =?utf-8?B?NXZhZEpOTnVQaW5PdDhMeGZ0S2JHbCtMN2NjWG8zcUpLMEVlV3hDSEE2RUZN?=
 =?utf-8?B?dFlSQ2V5c0JpUFhPUVVSaU9PSGUweEE0LzBQRU85eE1DVE5HNUVodEJKR0ZJ?=
 =?utf-8?Q?kchgAl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:13:43.7144 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fc0e40-c46a-41cd-4035-08de28e6a6b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9278
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

The drm/ttm patch modifies TTM to support multiple contexts for the pipelined moves.

Then amdgpu/ttm is updated to express dependencies between jobs explicitely,
instead of relying on the ordering of execution guaranteed by the use of a single
instance.
With all of this in place, we can use multiple entities, with each having access
to the available SDMA instances.

This rework also gives the opportunity to merge the clear functions into a single
one and to optimize a bit GART usage.

(The first patch of the series has already been merged through drm-misc but I'm
including it here to reduce conflicts)

For v3 I've kept the series as a whole but I've reorganized the patches so that
everything up to the drm/ttm change can be merged through amd-staging-drm-next
once reviewed.

v3:
 - shuffled the patches: everything up to the drm/ttm patch has no dependency
   on the ttm change and be merged independently
 - split "drm/amdgpu: pass the entity to use to ttm functions" in 2 commits
 - moved AMDGPU_GTT_NUM_TRANSFER_WINDOWS removal to its own commit
 - added a ttm job submission helper
 - addressed comments from Christian and Felix
v2:
  - addressed comments from Christian
  - dropped "drm/amdgpu: prepare amdgpu_fill_buffer to use N entities" and
    "drm/amdgpu: use multiple entities in amdgpu_fill_buffer"
  - added "drm/admgpu: handle resv dependencies in amdgpu_ttm_map_buffer",
    "drm/amdgpu: round robin through clear_entities in amdgpu_fill_buffer"
  - reworked how sdma rings/scheds are passed to amdgpu_ttm
v1: https://lists.freedesktop.org/archives/dri-devel/2025-November/534517.html

Pierre-Eric Pelloux-Prayer (28):
  drm/amdgpu: give each kernel job a unique id
  drm/amdgpu: use ttm_resource_manager_cleanup
  drm/amdgpu: remove direct_submit arg from amdgpu_copy_buffer
  drm/amdgpu: remove the ring param from ttm functions
  drm/amdgpu: introduce amdgpu_ttm_buffer_entity
  drm/amdgpu: add amdgpu_ttm_job_submit helper
  drm/amdgpu: fix error handling in amdgpu_copy_buffer
  drm/amdgpu: pass the entity to use to amdgpu_ttm_map_buffer
  drm/amdgpu: pass the entity to use to ttm public functions
  drm/amdgpu: add amdgpu_device argument to ttm functions that need it
  drm/amdgpu: statically assign gart windows to ttm entities
  drm/amdgpu: remove AMDGPU_GTT_NUM_TRANSFER_WINDOWS
  drm/amdgpu: add missing lock when using ttm entities
  drm/amdgpu: check entity lock is held in amdgpu_ttm_job_submit
  drm/amdgpu: double AMDGPU_GTT_MAX_TRANSFER_SIZE
  drm/amdgpu: use larger gart window when possible
  drm/amdgpu: introduce amdgpu_sdma_set_vm_pte_scheds
  drm/amdgpu: move sched status check inside
    amdgpu_ttm_set_buffer_funcs_status
  drm/ttm: rework pipelined eviction fence handling
  drm/amdgpu: allocate multiple clear entities
  drm/amdgpu: allocate multiple move entities
  drm/amdgpu: round robin through clear_entities in amdgpu_fill_buffer
  drm/amdgpu: use TTM_NUM_MOVE_FENCES when reserving fences
  drm/amdgpu: use multiple entities in amdgpu_move_blit
  drm/amdgpu: pass all the sdma scheds to amdgpu_mman
  drm/amdgpu: give ttm entities access to all the sdma scheds
  drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
  drm/amdgpu: rename amdgpu_fill_buffer as amdgpu_ttm_clear_buffer

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 493 +++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  58 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h       |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  12 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  34 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  34 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |  34 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  41 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  41 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  37 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  37 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  32 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |  32 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c           |  34 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c         |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  33 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |   3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |   6 +-
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  11 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |   5 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  47 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  38 +-
 drivers/gpu/drm/ttm/ttm_resource.c            |  31 +-
 include/drm/ttm/ttm_resource.h                |  29 +-
 47 files changed, 706 insertions(+), 615 deletions(-)

-- 
2.43.0

