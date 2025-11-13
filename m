Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5027DC58925
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE1B10E86E;
	Thu, 13 Nov 2025 16:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zWj1sQM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011042.outbound.protection.outlook.com [52.101.62.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2456110E864;
 Thu, 13 Nov 2025 16:07:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyd9KVpqu8QT9CBYIG/jECIv7WJLsrdZPQ9FKdEV/o8y9tM1Cn72WYD8gMKh+n26rbhEl4X6Cx7OBLUU2bW2WssfVYg1QHJeLdlHmVA019FJFVEyH+5dNYZad/AJAKXuibIchstxfTJfl15u+YqBIR7pU9EbDNwktshD0Lf8uBAP/fN7xSrf0bl6j9QvOzM3Ej01lUQbDwxIfcNaH4DA+NiNqRjMaTv+99gYRuLpGu/CWZjqxWSq53qu4rntKbKx5fOnPI6uTKkX5tuUnt0YdubhxuaE3Id3G42oSv4EceDgLEhDXhsIvZsgw87yBwYeJdKKiKe6QbX5KSMgMErvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5T6C+2maAlhls6pQTQ+2SN2EX1bfix86R8KOznZlkHg=;
 b=VyIcHlF6ISnjEsd06fhxPMMoflqxTOZ0tZxTk4wZ2qmU5hRRCw+zdQod1UVxTEwAV8K4Xt205hXIZsGrUs4G6wGDro1B7OemFiLtgyXZ5ROmQzaVtgNPKCBAhbmO9DXLwxYfaeMKPQ9gZf8juM+fl2dFZBhC6yE6JIzXcOlQF6qNhvxX0adyqRlsbxr1c9fWA18onj2P970wDWB8x6aAIj0uuSV/No0mRe8dNWfqgNsBQzHwlpAL6pIaTbVPDcqp3WaBGJK4l23kl90WRrxdkcDqxCK2XbYc7FiZt7VsgcfXHZWIMxEUkOEOr7L6d/D9A4/FVVYY33A0vCQW1BftNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5T6C+2maAlhls6pQTQ+2SN2EX1bfix86R8KOznZlkHg=;
 b=zWj1sQM89KFYBYhP1C+2epVEv4LUOdVwx9k6h9oUdxXl0enxnmfIlONEjlbtuEVeLeEFnUUKXqnKp3vckESRgi51FchbzwXUNtdY6zvCYMGjwViAFWT/nl6L/8OVQIVY8OT7Cyzo6zxnQP3bitTldI5KNICxBHqInsjOa6Vue2U=
Received: from CH0P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::22)
 by LV8PR12MB9134.namprd12.prod.outlook.com (2603:10b6:408:180::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:07:01 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::7f) by CH0P220CA0026.outlook.office365.com
 (2603:10b6:610:ef::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 16:07:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:07:00 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:06:56 -0800
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
Subject: [PATCH v2 00/20] drm/amdgpu: use all SDMA instances for TTM clears
 and moves
Date: Thu, 13 Nov 2025 17:05:41 +0100
Message-ID: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|LV8PR12MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: c543ec43-7803-41dd-5bd2-08de22ceadf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWU0SytQeDRsWUdMSGttbFBKWEpxUHR3eDhuYnZRWE4zZEU3WnZiUEtla05F?=
 =?utf-8?B?cnpCMjRMSzljWEJObzdocHNsKzRZMDJiYWxYYW5rNzZWMFhlVmdaLzhoWE9y?=
 =?utf-8?B?ZnB2LzN0dTJVS3FUcThNRncra0VQQjRwVnB1VWZTMS9OWk50MUU0N1h1Wm9r?=
 =?utf-8?B?KytTZ3JaNlo3NDFtSzRQcmVrWFNVNHlwOFN2ZzFhM0JRVlMybGlRMi85YTVU?=
 =?utf-8?B?VGpvbmVQKzF2STB1Wk1NMzdsL050SzVoaDBwVXpLTUdSMng4ZFlsOURWVmVu?=
 =?utf-8?B?cDFkNVFPMjl2Nis3by9mcEt3UzNRVlV6Tk5KL2N2RzgzQnQxVlUwVXljd3F5?=
 =?utf-8?B?NkViRlAwVDIvOXlKNFQ5REVTQytLVndVSzZmdXpnQUhTRWhkT3UvMVA1YmRy?=
 =?utf-8?B?QkhUN21ndUVveTVieitvK3gvN0FpQXZwS3ZCY0M5R2l5Tzk3ekJRdFZZeWxJ?=
 =?utf-8?B?SW1HRWwzQjZ2UXJSWkEzS3F3MjNKSzdsL1NCVE1sOWhZNDI2a2dxZEdjdUIy?=
 =?utf-8?B?RWJpVTZaRCtGdVJ1U0ZmSmVYTEZ0c0Z5NHVVZjdpODMwa1YrdGd4TFBzODFF?=
 =?utf-8?B?YVVOdDVJcG1EN2Z4TnJMa1B1aUxnaXBvQ1VuRjZyUEF2RXY5YncwZGQ0WUJU?=
 =?utf-8?B?eHhraFllbEdxMWJQdzhjWFUxQ01ZN2liZXl6SmlNSkJTNkdSeXh4ODl4ZDVH?=
 =?utf-8?B?VDlyY0p3VTBwT1d6eW13YmhLZitNdmtoM1dHeFUyYTErLzFvVEJCNXpEZFRu?=
 =?utf-8?B?Ni81NXJQc0FqWlRwMVcvOCtBeDZRUG96KzBQWElFUjk4OW9KblZzUE95SUJJ?=
 =?utf-8?B?dm1SczdoVmFJU1FRSUpaUXMvd0t4YmdkaWdTWXJYQlFLd081eE5LSXY1SG82?=
 =?utf-8?B?aUJ4Ym1EZW9hYjAyY2FzMS9EcGwxLzg3N2haYkRESW1ublVPQmEzb21lVnVr?=
 =?utf-8?B?NmlKSXpPRkVjb3VwQ0xzM0FGVzFmTy9CWmRBQlRRNTd6WHNNckFRYk1KZDFR?=
 =?utf-8?B?ZzluOXllM2tmL010cVA3NUpRK1hNWmVDR0hjQm9yZW5nT29sa3ZRVTBVYzhv?=
 =?utf-8?B?OEVEV0pUellianZ0TUZ6aEhuTEZnZ2xwNUJmTk9rMHp3eWhmWFIyeWJUczVh?=
 =?utf-8?B?MTIwMDY3cno2d3hpYURtQ0o1bmlSSE1kbkRaZWJyV1ZsQ1o5Zy9UbXZyTnMv?=
 =?utf-8?B?YVZ5dmtaTUcrRjIvcFZLZ3VlckZQc0VUa3AyaDJVdnNCWVJZZ1ZiblFtY1Ux?=
 =?utf-8?B?bmpSbGQvSUp2a2htNGcveWh1dW5LdEswT3ZTNzhSYnhnVmFFVHk4d3BwNW9H?=
 =?utf-8?B?c1J3ZzJhWGd0d1o5NVk1UWNwbXVobmVvMTZoY3UxcmZ6QkdaMERJSlRJanhm?=
 =?utf-8?B?TWd0d0xrUFFacU1ndFpGOTlCVU1abXVMNWpSNTZndlBWTGlRWC9mNzZTOGZj?=
 =?utf-8?B?OW0rZWs3UjV4RlhtdGdqbU9SWVJjYTVndExkbThiZVp6aFh1Z0U3ek01S01H?=
 =?utf-8?B?aVdXSUNaQzdSWjBDaUk2TUNhSFY4OHVXcitrN0lmVE9uVS9XRHVrQU9XT21L?=
 =?utf-8?B?ZzByVXp0TVlnMzltVzJqaG00bUoxMlk4Qjk1ejZDZ0VrSXF4UkNwbVJjejNC?=
 =?utf-8?B?T0pXWkxTenovN01Mc3pKZkd1SWh0QVBYTWY3dElxS0dBN3ZzalBBQXk5Wlhx?=
 =?utf-8?B?SGRObVdCaWVlOVhQTEZFc2JpOVR0UUM1aEFuVy9kVklNWHluc2wyaHl4MkJS?=
 =?utf-8?B?RjFFZVBZY0VlZjZmbzFJdm1XTzJFd0VPTDhNOVZDY0hJMXIvRXh2TGVjUWI2?=
 =?utf-8?B?Q2gvOUtGalFMZmViR3J0VkdYVit3SWc0RGJuS01MV0gzSjdreWx2UHVkOUtN?=
 =?utf-8?B?QkE2UHYva1lUN3REK1NiaUJlZWlrdDI4YjY4TDdxVzhBS2ZLVFVkM2E0TmlP?=
 =?utf-8?B?UHdBNXJka0pqd0NqcCtZL0RzKzFoSDk5Q1hCdTg5OURDZWJIeWdYODMvNHFQ?=
 =?utf-8?B?cEh0NEZRU29RNndURW82TFp1S1QyNnZnR0NOSHNvL0VDMFdKTUI4UEFvNlQ2?=
 =?utf-8?Q?fNtxpJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:07:00.9733 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c543ec43-7803-41dd-5bd2-08de22ceadf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9134
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


v2:
  - addressed comments from Christian
  - dropped "drm/amdgpu: prepare amdgpu_fill_buffer to use N entities" and
    "drm/amdgpu: use multiple entities in amdgpu_fill_buffer"
  - added "drm/admgpu: handle resv dependencies in amdgpu_ttm_map_buffer",
    "drm/amdgpu: round robin through clear_entities in amdgpu_fill_buffer"
  - reworked how sdma rings/scheds are passed to amdgpu_ttm
v1: https://lists.freedesktop.org/archives/dri-devel/2025-November/534517.html

Pierre-Eric Pelloux-Prayer (20):
  drm/amdgpu: give each kernel job a unique id
  drm/ttm: rework pipelined eviction fence handling
  drm/amdgpu: remove direct_submit arg from amdgpu_copy_buffer
  drm/amdgpu: introduce amdgpu_ttm_buffer_entity
  drm/amdgpu: pass the entity to use to ttm functions
  drm/amdgpu: statically assign gart windows to ttm entities
  drm/amdgpu: allocate multiple clear entities
  drm/amdgpu: allocate multiple move entities
  drm/amdgpu: pass optional dependency to amdgpu_fill_buffer
  drm/admgpu: handle resv dependencies in amdgpu_ttm_map_buffer
  drm/amdgpu: round robin through clear_entities in amdgpu_fill_buffer
  drm/amdgpu: use TTM_NUM_MOVE_FENCES when reserving fences
  drm/amdgpu: use multiple entities in amdgpu_move_blit
  drm/amdgpu: introduce amdgpu_sdma_set_vm_pte_scheds
  drm/amdgpu: pass all the sdma scheds to amdgpu_mman
  drm/amdgpu: give ttm entities access to all the sdma scheds
  drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
  drm/amdgpu: rename amdgpu_fill_buffer as amdgpu_ttm_clear_buffer
  drm/amdgpu: use larger gart window when possible
  drm/amdgpu: double AMDGPU_GTT_MAX_TRANSFER_SIZE

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 435 +++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  12 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  12 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  12 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |  12 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  19 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  19 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  18 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  18 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  12 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |  12 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c           |  12 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c         |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  32 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |   3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |   6 +-
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  11 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |   5 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  47 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  38 +-
 drivers/gpu/drm/ttm/ttm_resource.c            |  31 +-
 include/drm/ttm/ttm_resource.h                |  29 +-
 45 files changed, 588 insertions(+), 436 deletions(-)

-- 
2.43.0

