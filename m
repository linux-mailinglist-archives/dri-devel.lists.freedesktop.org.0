Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357B3A82CE2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 18:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB3510E15E;
	Wed,  9 Apr 2025 16:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jiSToVrI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C7410E05C;
 Wed,  9 Apr 2025 16:53:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrrZWF4dj+M+P46I53VHtMYcrjrv1Z0mOMedyVjNhwOe1RU8XLwf55KpzgCwZ0Su3iC0ZyPUNTMnLphWLcWu5XjVBWcwQLx8knbJsQ4Osh8NxXpyVX8VJtdo7zVRHHF+WgYOEM08TODaG8i5OTsYnIBWGFethGKp44z7LFKc3SOqtlk1sk9HouJ4bPfGkJYPYSEdMuk7MCmGsgKTxN8cpsQyUNcwHkTh7ZjBpVqmqE8MmPp66XELyq0Gf48VHpTNScUXX7CHuThFlGaRVIDRAB+shZaBcCCJ2ypAjnGfQp0M5UkBZqQb081bADwrXfHiGkp5aQJg/3R+Hl2eg2lnrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QF5iIy3qFjr2H3D+Ic1oEYBRJD6vhgciF7wjwR/uuK4=;
 b=ay/b8+a6RaWyBf8UKHP2mM9frvM/NCqvVRo707xXYxtlVnIUFah3au0inK2frPeg2a1hTKHzWD3ZzT5JOv7yTcDWuoeoMlr0A+ssPVNaC6IwAZaV975aCl/qZ0MgsHVj0mneY9DyUT7mba7+TpX0eDhSpYY4xcIeVNK9HyEG7T6WUB1fxNK9H60ddbdhMuSK3/Bf0iJb/hntV/IV2aYIW3h138u3EU68N2EW/XbhQnULfTQdUgcfj1nquHSafOsf2hJ3EzahjyjwG+Qb8tFQnrTNkV++cLKHkH5eJse2ZVrdJtBmtgpCYgqwHqPlSATApI5ERrby12/R+ivUPg1mgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QF5iIy3qFjr2H3D+Ic1oEYBRJD6vhgciF7wjwR/uuK4=;
 b=jiSToVrIISmRKDxZE1Kf7BZSPxD/WiPqZ5jLHd2yVlgSSon//p7SX5YoG9WshdLulimvW5LbiUvGqh17atdqDfL4oZXhQfDPprjhLFH7KMJJ8tIk+IxUSudernxRFHq9LgkL3MEhRXtgezGwjW6Ww7dvpgPmi/LZ+rAZHtuHF1g=
Received: from CH0PR03CA0440.namprd03.prod.outlook.com (2603:10b6:610:10e::29)
 by IA0PR12MB8745.namprd12.prod.outlook.com (2603:10b6:208:48d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 16:52:53 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::f7) by CH0PR03CA0440.outlook.office365.com
 (2603:10b6:610:10e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.23 via Frontend Transport; Wed,
 9 Apr 2025 16:52:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 16:52:53 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 11:52:52 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.15
Date: Wed, 9 Apr 2025 12:52:37 -0400
Message-ID: <20250409165238.1180153-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|IA0PR12MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 25bad5f0-aa56-489e-0af0-08dd7786f858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWsvUHlvbllYRnllMlZkOE4vK3N6ZnYwanZWd1QrTWlWUTRzMGE4aldFYm9u?=
 =?utf-8?B?bWlBRE5MbWVUZTA3eFRHSXFqZE9EKys4L1FjSmdMREtTZU4yLzVUWlJhNWFy?=
 =?utf-8?B?OWN1S0haREdoWkJySTJBbDQvUkljMFR4N0l1Uk04WWtSeGpSdG11MHpnQ1hz?=
 =?utf-8?B?bEVXcjJ3czVwN0hENEMxYWFKcVRMZHk4ZlcwYVQrbkN0bHUzRUlYL2tzUWF3?=
 =?utf-8?B?YXJFVEJvSVIwaE1CRmkzSjZKdU9WT2NGMW4rOGNNaVFRUWFRMTEvcFZnbjY1?=
 =?utf-8?B?bFduQ3pDdmI1dG42WnRwdVZ4bVZZbU5lUnM2SWhCMjEyVGU3V1ZLenBuM2Fx?=
 =?utf-8?B?TmMvRDh1ZWtmRHBuT25CdVViaStKdDNaaTd4NUR3NU9mWk9hVkEzZlF4VVlk?=
 =?utf-8?B?UnJQSHhEUnVDaTZvMXlEcTZENFRzQmYwRDRDU3pwL2tKYzA2UjJaQlN0anBG?=
 =?utf-8?B?aEhWK1l1eUk2dUQwOTM1cUlUQkM4YUhLOWZVelVZZjk1NFMrQ2JqWVp5eXJy?=
 =?utf-8?B?UVA4NmYweGZsWkJncmFKaldLVGd6aE4zOUZUeXRic3RWMisvZkUxY2lOY0Fh?=
 =?utf-8?B?SmRkT2VvK3FpZk54aklUUlpVT3VsdVJSYWlCREIzdTVoUTlnR1MwTmhMRmVM?=
 =?utf-8?B?ekpLdUNhUFhpQ21JdSt5bkw2VkdnV0lBRmY5c0RiSlY1UUF3dWdXYWNnUSsz?=
 =?utf-8?B?cm9QL29xL2M3MDB1UXBESHVoTFBLamN0aFh3QWlkdjU3OG1Mb2NjQ0Y1dFZR?=
 =?utf-8?B?QzdSQlIxU1JxWTZIQ0R0QnR4eDlxa0Q5MDNJWjlIbE9CQjBXUEdTQkxFbjdJ?=
 =?utf-8?B?bVZnVkwyNFJQczI0QlR2VUg1eEFCYXd3emN0WjNCekIrVG03NXNvWUdBd0lE?=
 =?utf-8?B?WmJtakUwN09XdVpHMHlwM1BVaFZGYXl5OUxIb1NTZERBYjRxUUpWTmxBdms5?=
 =?utf-8?B?TlE3VUlLYSs1MGk1RUUya0YxVEdrcWEyNTNITU9oZFNlR2M2ak9XRjR0SU5y?=
 =?utf-8?B?a084SjVHVTBscVhSL3NxZDlDdkYzSm9tNmd0QmJkNC9kL1RNY1c3YVNpRlZC?=
 =?utf-8?B?dkd0eUV6NlhjanEwVU02bUs3Y1k0ckRYNUEwVWtOc2Jrd3RWcEpZK00ySEtB?=
 =?utf-8?B?K3ViUkZieGhnNVBIbXV3ZERVcGE1cHpwc0ZSNFJPY0Y1T0MrUFdkY1hUMHQx?=
 =?utf-8?B?R3RjNnJOb1dVa1k2YTdGdDdhcS96QTNGZUIrVnZqcHRCc3Y3bTIwcFhpbmln?=
 =?utf-8?B?cCtaQ2NMYVlkK3ZZQmhtOGlTT21nT2JoTFkzSGNnejRjcTBaVit4Z3pHY2Q1?=
 =?utf-8?B?ZGFoRDVEeFJ6RmJVbmlNeGxCdHBNaU44ZmlFanZ3Z0ZRUWQ5SFYwUWJDSklr?=
 =?utf-8?B?Z3h3OHJzckVXQkxRY0x2NU51aWxSS2pzd21haFQ0S2pKNTJyKy9HcGo5UXdO?=
 =?utf-8?B?Nm1CQ281ZklEVlJsUnpUWVYxTGhoOVdEYXpXbk9nWmR5N004Ky9paEdzcFRF?=
 =?utf-8?B?aU4vRk1vd05Ycjhlek5jV2VFV1B1dEFpTlhSaXhmRlk5UFV1dktabmJEbWdI?=
 =?utf-8?B?SUxaNDZxOHRjQlNPa0Q1NUV1aUVaNE5WVFp5dkJVUGVoakZzUUd6aTBkZFlV?=
 =?utf-8?B?bytZRUJ4S1BLZkhIYzA1MFgrdGNmMU8vS0JsendRcWpIMVV3WVp0RGJRcmx6?=
 =?utf-8?B?N1RBb2t5MWhQbDJRUTZIM0lVd0JkRHkzTjlCcm1ocFk3OFArVmIyTW5MbDRI?=
 =?utf-8?B?bkZKdDZWaSt2S2NGNm9Ba2dmME00R0RFbm5Dc0JjS21IZDhaR3Q2Q21YVSt1?=
 =?utf-8?B?VzRvTy9sRy9tUVhGa3NINWRTOGJlSkFiMDVlVkszQVJMRXo0MDZTdUx1Yk4z?=
 =?utf-8?B?dXpBSTBXd1dZZEZ1Wjk1SXFoZ1VHVDNqR1VpbUliLzArUUJCdnhLMkxQZWV1?=
 =?utf-8?Q?4gGbN9/XMvg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 16:52:53.1227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25bad5f0-aa56-489e-0af0-08dd7786f858
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8745
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

Fixes for 6.15.

The following changes since commit dce8bd9137b88735dd0efc4e2693213d98c15913:

  drm/amdgpu/gfx12: fix num_mec (2025-03-26 17:47:18 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.15-2025-04-09

for you to fetch changes up to 34779e14461cf715238dec5fd43a1e11977ec115:

  drm/amdgpu/mes12: optimize MES pipe FW version fetching (2025-04-09 10:53:11 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.15-2025-04-09:

amdgpu:
- MES FW version caching fixes
- Only use GTT as a fallback if we already have a backing store
- dma_buf fix
- IP discovery fix
- Replay and PSR with VRR fix
- DC FP fixes
- eDP fixes
- KIQ TLB invalidate fix
- Enable dmem groups support
- Allow pinning VRAM dma bufs if imports can do P2P
- Workload profile fixes
- Prevent possible division by 0 in fan handling

amdkfd:
- Queue reset fixes

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu/mes11: optimize MES pipe FW version fetching
      drm/amdgpu/pm: add workload profile pause helper
      drm/amdgpu/pm/swsmu: implement pause workload profile
      drm/amdgpu: cancel gfx idle work in device suspend for s0ix
      drm/amdgpu/mes12: optimize MES pipe FW version fetching

Christian König (2):
      drm/amdgpu: immediately use GTT for new allocations
      drm/amdgpu: allow pinning DMA-bufs into VRAM if all importers can do P2P

Denis Arefev (1):
      drm/amd/pm/smu11: Prevent division by zero

Emily Deng (1):
      drm/amdkfd: sriov doesn't support per queue reset

Flora Cui (1):
      drm/amdgpu/ip_discovery: add missing ip_discovery fw

Huacai Chen (3):
      drm/amd/display: Protect FPU in dml21_copy()
      drm/amd/display: Protect FPU in dml2_init()/dml21_init()
      drm/amd/display: Protect FPU in dml2_validate()/dml21_validate()

Jay Cornwall (1):
      drm/amdgpu: Increase KIQ invalidate_tlbs timeout

Jonathan Kim (1):
      drm/amdkfd: limit sdma queue reset caps flagging for gfx9

Kenneth Feng (1):
      drm/amd/display: pause the workload setting in dm

Maarten Lankhorst (1):
      drm/amdgpu: Add cgroups implementation

Mario Limonciello (2):
      drm/amd/display: Add HP Probook 445 and 465 to the quirk list for eDP on DP1
      drm/amd/display: Add HP Elitebook 645 to the quirk list for eDP on DP1

Matthew Auld (1):
      drm/amdgpu/dma_buf: fix page_link check

Tom Chung (1):
      drm/amd/display: Do not enable Replay and PSR while VRR is on in amdgpu_dm_commit_planes()

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  7 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        | 27 +++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            | 19 +++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  4 +++
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  4 +++
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             | 21 +++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  9 +++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 21 +++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 17 ++++++++--
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  | 17 ++++++++--
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |  9 ++++++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                | 19 ++++++++++++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |  2 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 36 +++++++++++++++++++++-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  2 +-
 20 files changed, 187 insertions(+), 36 deletions(-)
