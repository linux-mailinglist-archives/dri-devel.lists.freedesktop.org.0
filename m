Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DD8A5E427
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 20:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87FA10E191;
	Wed, 12 Mar 2025 19:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kVxdRXRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060.outbound.protection.outlook.com [40.107.100.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5303310E15D;
 Wed, 12 Mar 2025 19:09:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBf/9A7MnkobPl/HCRMnmDbYhl26PTkQfPRUV3snZELp1gdAPRm3GjGIYw9fTmHmRoUD2j9TXCHRwEargVTpHGz9G7/w9ehddMVxy9XsG70oKJOHy7KijT+5R5kwJmzJL0KZIo411bMdB2Q3PEB0BmL4huWnbeb+UqYA8YdPmd8UiAvti1EtgYaWcPuBtzKaxr+jpwUsVgj6c/tayhDxv2YiAd+zTg9aHpHra3G0nbZG8S6lcn7+VlnTGuUyFbZuk49s5ITUy5B3wweD/3TykQPJz/xhTsk5+Qu3JHFJjkxKNpQbTzuebdKpNZlQzyirsUlldjUoasbZOq+yZDzC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kx8bBBgyvalqVrzeg/e6lkIgj+wdHNPagDaBxHJmpfc=;
 b=CiRZ7wFP7rFtnfF9qN5EqLKGC3nzVXyLZhjRs7EtGeQhEJkwZ1f2cOxpZMyOaAt3KTSLPKAZUyzjK+xKGrc6keTphWIEUGpK+JtF3+uFZHuYlXxLHWHlz59++nci/I3hgJu5ZGhbMalP6GM5pnQXoqA+u4eSbGsAoOaS5Y3ml7r2UcPI6cJtFOYGOI9F8NLEKn1H4CKOP3e7V0i9SeX2T3o07qdfpe9mxc/n0Ys+/xjZEcbUmFISzsoD3BmdgzlfhDu6/qnY+f2WqOSBwbGLkxacWzjQUQuQY1hqe3esbTogV5NWezEk4dgBjb1sOOdL0t7cbi18O5Ni//InRsq29g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kx8bBBgyvalqVrzeg/e6lkIgj+wdHNPagDaBxHJmpfc=;
 b=kVxdRXRkJRw8osBSKpOyQ3NG/RirIUI9RLBFm6a2NLwE6JVZ/g20nMLl4H/FYEtBa+aE9w6AL5DlM2SIzxEF7i9T9mw2lWbR9yEi6LyWmyPUZtZh28fS4Z7RP/2e7IWzd7ZDByJogp8DpFbHFSxpbH8ggX+VMOqHV7+HnJuuZvU=
Received: from SA0PR11CA0095.namprd11.prod.outlook.com (2603:10b6:806:d1::10)
 by BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 19:09:46 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:d1:cafe::e7) by SA0PR11CA0095.outlook.office365.com
 (2603:10b6:806:d1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Wed,
 12 Mar 2025 19:09:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 19:09:45 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 14:09:44 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.14
Date: Wed, 12 Mar 2025 15:09:31 -0400
Message-ID: <20250312190931.216506-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|BY5PR12MB4212:EE_
X-MS-Office365-Filtering-Correlation-Id: 00bc937d-8fa5-465b-88ee-08dd619973ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cURublhJWGJCYU8wYXpEM2dIazltamVMTi9Sd1hzaDQrSjhkTjZsS2lwNEdz?=
 =?utf-8?B?WXV4QlNDVmFyZWNTRHI4b3dKZ1QraW83VVZQeVNEUkNzY0hCZTh4TklhR2xG?=
 =?utf-8?B?Z21pNXBnT2lJcmlXTG1RTFpWVG1lbVBTKzlLTHZ4V2NwT0phc3FMK3MxUVda?=
 =?utf-8?B?ekFsSmhpRGIvYXhMVExnckFNTlhWellxZGZTdU0zZkhicWZIRk4rL2hKZjZq?=
 =?utf-8?B?eVhuQmVCcG9VN2pqSmxsaVVrY1FVb050U2F6NTdBcEFNdFk2NlUvaUlqYVo5?=
 =?utf-8?B?R3g5U3dOVDM2YUFuKzFCem1PdG9oQSt1bDBKcW5PUUxub2NPbTNqNU55Z0Er?=
 =?utf-8?B?MnpaTFhUYmt1NlVuLy92TUlBOHh6d3hlY1ludzU4MDFEUms3YzBhSW5DcWVH?=
 =?utf-8?B?dng3Zlh0d25TMzNERW1kQWxzaE5tVW84dVlLMTc0TlkrUEE2Qjl4UGNRR1Yz?=
 =?utf-8?B?Mm9iakFSZU1iaFVHQ1RhbXVoMERtWVg1cHNJd0U5L2Jja05uWW9rbEpTRVZM?=
 =?utf-8?B?QVBJaStRbWM1b3VFSlFXR01UdWNYRDlXK2hTdHRTTS9GaHd4bVMyYVF5Zm5w?=
 =?utf-8?B?OVphYlFwYlFBbUkyQUNKbC9aempLNi93c013Zm43ZkFjbE00THVhK3JqOHhI?=
 =?utf-8?B?dU1nMkVpcGxDRXlSMDczbjdVYzVFR21XNTIwOVFBcXFMWXVDd2R2TXdVNktj?=
 =?utf-8?B?TUtYdHo3Q0hpL29EMzd6NDhnVFFDV3hpc0Nnb2RVY1k0ZEYrU0VkNmdBYm9o?=
 =?utf-8?B?SWF0V3JvRGNVdnZHWTA4NTAxSUQwdEQ1N1YweEVSQjc0bXpzaFNFeS9XQ2s3?=
 =?utf-8?B?bEI5OWYzT0lGSlM1cFZKaXFuVXJET1NueE5MMmdzWmoxNktLZnV2NXY2L1Yy?=
 =?utf-8?B?dE14Q1MzYTd1V2ZOZDRsbjVCb1lxdHhoNllxV2ltOUliQWhRZFF1M2hGWi9v?=
 =?utf-8?B?cFNBSWgrd1ViYWZPUDVOS0c1UmJMdlVIRGZpcDlYZ1BHalpVYWM2QzA2TW5R?=
 =?utf-8?B?NlFYbHVHdElLM2pNelFaektNei9FV0IzZEJFay91WnBBVzBUN1ZrNk5JRjl1?=
 =?utf-8?B?WEhBT2YvNTR4cGNxRHJmMU9vRDJlK250SnBldno1UjR0bHdKTC9neldhdzdG?=
 =?utf-8?B?eGgyUDV6WlZvOHpmSTdJRHNiRlJabk0zMEtHVi9CbDhGM3JkTDRiR3pRMDMx?=
 =?utf-8?B?WmhBeDZuajVIeUlpa04wOU0zc2FXMlQ1MFljcm1WWG5NVlovMjlpOU4xSlhS?=
 =?utf-8?B?a2VRdERobXc4R1JCZTZzVkJVeHNQZWlLNTNlVU1KUjBmMEowTEI5SjZLVlds?=
 =?utf-8?B?QnEyZ3lWMnZlRGZMT0F5QlcyZmNlSnJSOTdZMzBreEdKN08rbDVyUHcyQ2Fz?=
 =?utf-8?B?d05wMTJsRzEzaUhkWGFWVTBBMzhzY3Q5N094VW1OenBvZU5SZTRpY0h5bFNh?=
 =?utf-8?B?M01McFJOUmJ4NE5KRXdlTmNvSVorZGNJQUIxWmkyc0lhZGlkRFJoSHFGa0ZS?=
 =?utf-8?B?VHhzUWRVWUZtclhTOXYzTkVJZ2Q1cmlpZjVKWUh1cy8xYzY1UlhDL2VvbUtC?=
 =?utf-8?B?WEZLbXdJcUs0ZUlsNmJXaXdNSVBzMGN6Y3N5eEtWSVFUTGFnRFppQ0ZkejNy?=
 =?utf-8?B?NFE2V3RscS9jeWNwbFpkUVJtY3M2V0Fmb0RndmJ1N1BONWcxQlFaTHNSbjd2?=
 =?utf-8?B?TjlEUXppQnZoT2k1UW95YVNRUThJM2UxZ2ViR2U4UHdidkhmWTI3MTN3aFF2?=
 =?utf-8?B?UG9wT1pmcVJia1prZXdGdEtmS1ZHeitrcFk4dkJMZ2R5WXlHd0ozeVVEL0xQ?=
 =?utf-8?B?bVoxTUlqVDFNeFVjdm9GbGx6d0JxK21CNFBSS0dKSTNkSmVLRjVGRXM4amxL?=
 =?utf-8?B?YVdRRkZST1JYZUo0bjZzVlNaRHBYWmJrMDVma1VpNEJxamlGQ1FBeEJJNS83?=
 =?utf-8?Q?LLjgFkoQbgU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 19:09:45.8625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bc937d-8fa5-465b-88ee-08dd619973ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4212
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

Fixes for 6.14.

The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.14-2025-03-12

for you to fetch changes up to 6cc30748e17ea2a64051ceaf83a8372484e597f1:

  drm/amdgpu: NULL-check BO's backing store when determining GFX12 PTE flags (2025-03-12 14:59:21 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.14-2025-03-12:

amdgpu:
- GC 12.x DCC fix
- DC DCE 6.x fix
- Hibernation fix
- HPD fix
- Backlight fixes
- Color depth fix
- UAF fix in hdcp_work
- VCE 2.x fix
- GC 12.x PTE fix

amdkfd:
- Queue eviction fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/vce2: fix ip block reference

Alex Hung (1):
      drm/amd/display: Assign normalized_pix_clk when color depth = 14

Aliaksei Urbanski (1):
      drm/amd/display: fix missing .is_two_pixels_per_container

David Rosca (1):
      drm/amdgpu/display: Allow DCC for video formats on GFX12

Leo Li (1):
      drm/amd/display: Disable unneeded hpd interrupts during dm_init

Mario Limonciello (4):
      drm/amd: Keep display off while going into S4
      drm/amd/display: fix default brightness
      drm/amd/display: Restore correct backlight brightness after a GPU reset
      drm/amd/display: Fix slab-use-after-free on hdcp_work

Natalie Vock (1):
      drm/amdgpu: NULL-check BO's backing store when determining GFX12 PTE flags

Yifan Zha (1):
      drm/amd/amdkfd: Evict all queues even HWS remove queue failed

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 11 +++-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |  5 +-
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |  2 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  8 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 17 +++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 64 +++++++++++++++-------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  7 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  7 ++-
 .../amd/display/dc/dce60/dce60_timing_generator.c  |  1 +
 10 files changed, 91 insertions(+), 32 deletions(-)
