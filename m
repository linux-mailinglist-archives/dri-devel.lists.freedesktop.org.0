Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BF8BCA2FD
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 18:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CA610EAB8;
	Thu,  9 Oct 2025 16:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xT5j5KuY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011048.outbound.protection.outlook.com [52.101.62.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0298410EABA;
 Thu,  9 Oct 2025 16:29:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEodHyqag/aOqjrqJx61CI3Tn0Y0bBel23maIU6EP+cY2ukIDJMlkXdVQFyLAjWp4wiQMuyo467qcGBtGdZSRcj6o3EPwSV78nE/0ZmqhUdEE3UB2jCwLxGeaRXdBb47oCSumRlOMXFwk3tlI7eo6I2jxSXoBTkj5XB+cqPz5scKfvbaEy5TXlMSDdLqehE56jhBpuhObI7K+SLI2cepEAGt3LIFweLNSvBppCIXj+CCF2BLLjlYqoU6VQWT8UmtW/rgwcvg9EwQx/O3Qak3H1wSzq37KiQn9xLw8dGU6VhCkouK9hTCNcRCWXv+1GYRm6vCPKZOTjarasSMklSxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/KA/VhvaZWrg+2lNPSmM/fMaVEAzzlBxejF5gv+t9E=;
 b=vVq1LDzYx8PhocXLzUa25liDBeinqOKKCwSvb9Id3hWe39HfohDLmi9pYZvEr33+v/nm6xO+JFre/9ql1VxXSI454Fl0JAcPZYIEK7N2aWBA3v+/+T4fhbvqIKUi4X4DL0z0fsLZEUODpfOlEgAQ+7D+JBa2wlK85F2vrtB2xyas2XTdldthSaL6TcdcFExwHHn4odORIh22WU+skwuc05EKl8noAae6mMh7EhoBBvTw/rMqXOqTv6I4Szkx04Y4h2AjPObU8Upvfov3//LeeimTBS/sqsY22vgfVDRVsHB5kfn7m2lqA9YeggOF3a59p3Zt6Dmk1zhidvRzdrqTiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/KA/VhvaZWrg+2lNPSmM/fMaVEAzzlBxejF5gv+t9E=;
 b=xT5j5KuYFjjo8gAuTUPT1OYsa4lyl3TytqJ4PPipHLTsIZaJq4nfaeKWrXDMAO9RcRMNeqO4BLCa8swy2U0/tv/LiGss5yhsz5WP/xEgaWr+XDPoBaDUI3iiJsV8K18y3MA2wtQq9c89gahc1rVIbXgmoFltaX9aObxQQvhlo8A=
Received: from BN8PR04CA0062.namprd04.prod.outlook.com (2603:10b6:408:d4::36)
 by MN0PR12MB5761.namprd12.prod.outlook.com (2603:10b6:208:374::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 16:29:31 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:d4:cafe::d0) by BN8PR04CA0062.outlook.office365.com
 (2603:10b6:408:d4::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 16:29:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.3 via Frontend Transport; Thu, 9 Oct 2025 16:29:31 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Oct
 2025 09:29:28 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.18
Date: Thu, 9 Oct 2025 12:29:14 -0400
Message-ID: <20251009162915.981503-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|MN0PR12MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 7082b303-92b6-4be8-cb9c-08de0751065a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEhtc2ZEcmpNdGpIaExNVXVTclp4SUVoRndYdHNJZkVpVTZJMWw2WFlBM2FM?=
 =?utf-8?B?aFV1T0d6NytqR2Nram5sZE1BZnAxUnlVOXpYbkRiVDBRNjFEM3VyTlUyZXJM?=
 =?utf-8?B?VDJRa3V6alphdmRpV21Nc2VqdlJrQW90cTMrNExqdHF5WkNtYlpZbHk2b0hC?=
 =?utf-8?B?UUcwQ2l2UjFVUG9sV0ZMK1NSeld5RW9QM2hxVjYyNFZwQWZNS0k0TGN0UFBu?=
 =?utf-8?B?MmxyK3RNZ3J4ZUhkZ1BTeFdwUXdMQ2xoT0RPU1l5RlVFSTRUandTc2NZaits?=
 =?utf-8?B?K0J6YkY5OTVaVTdERms1Tjdabjk4VlJKV1BRRStVQ0JMaDc5cVl2OVl5OGpO?=
 =?utf-8?B?N1V4L2ROaW1KTGVYTCtTNFVyRFdWcS8rQStDRkoxRFcySlNGenF4YS8zQVpU?=
 =?utf-8?B?ZHJtUTYwMmYyeSttK1QwZUtIS0xsU1FRQThjZThsQzVGdTJxQm93RU81NmEw?=
 =?utf-8?B?YUlMZ2RscWN1R1N4VHZIUWdXQ05WN2FHbXdCL1JBVStJQ3ZadWdpa1pHYlNF?=
 =?utf-8?B?cHBweGZVMTMwaEMyQVhqR3hQQVl6SHdVNnFQZzFDZHFVek9QeFNiZTkrZC9l?=
 =?utf-8?B?eDMveHFtTE9SUTQ3TWhDQ2tEZmNKanBpQWxJZUlBTzQxbTZiWk5JTnZmOWo4?=
 =?utf-8?B?aDJEMTlhbXdST2I1bnRUMURjMkk0WTFJekkxcHZOY2h2U2g5S1VzeE8xNFZN?=
 =?utf-8?B?Vm9VRDBYY0h6WW1mMEpKazk1SHJXTlhvUXA3aHFqeUZEeFdqbUc5cmJjdk12?=
 =?utf-8?B?UHhUU0RMWGcwQ3R6T0JncTNPcEhwYXJXSGhncStETFgzTU9qMm9EaXVJSEN0?=
 =?utf-8?B?WTUwV2wrNDQ5WU5ST0FZODNBWWE5Tm1HQis1TDUxNE8vN256QzJlYzhXN0Fm?=
 =?utf-8?B?c01XSUtSdTZDRFQ0SHU2a3BYOHJyUXg0V29ab3kzS1JNcjFTWmNOd2JpVFdw?=
 =?utf-8?B?blk2NktWSXBZSG1wNG5kZkRiTzVRWGhtSWVnVUxCRG9kdjE5cmZRZnI4SkEw?=
 =?utf-8?B?NGJGelhrNHZrZFI5M0tsbkdtTE5RazlzT1MxblJqdVdreHJmcHNxVlJ3eWpm?=
 =?utf-8?B?Zm1KcmtVRFRFeU52V3BDV0tBRFlwVkxPNG9IUmdxaVB6TlMyM2RUQnh2Z1Jz?=
 =?utf-8?B?L1ZqcmdtdDlQRkx1SUZEeHIvdFN6c0pVQTNoM0hHMHlzTVg2UFFCeWppb2ZR?=
 =?utf-8?B?SHZEeWo4NUxVZlFsSWJneG0weE5LcXJaUkJLN0d3NDUzMDhoeWFsbXRtcGhJ?=
 =?utf-8?B?RWtIaU05VEJEVzVwalh6YjlCeWZuemVjZjFIVlpZMGVoZFlBdjFGT3RPQXd5?=
 =?utf-8?B?NTI3eU5uUEZqUk5GZzE5WnVVM3ZCUEJCakpUTk00YlhKcHM3Tzl4RGZ0NFl1?=
 =?utf-8?B?RzMzRGE1ZTR3bDFQNFozQ2VWODlld0xBOUZoazU4OVdvb2hvMkJMZ0hKRHVn?=
 =?utf-8?B?WXdMQ3A1RENUSlAwRFdkTmZ1SzZiYVFST3pUazV0TjR2dVQ0eDYrbnFpQUpl?=
 =?utf-8?B?S080MzAzdU1iVmhuR2FKZStyY3N5WUFPKzJtRmVQVjdnSWhNMm1ZRy90cVNT?=
 =?utf-8?B?RExzVEh4Nm50aEZQZDI1MjZ0OWpMVzM4UUpiS3kwSnVxUmgweUgrTldzV01m?=
 =?utf-8?B?aG93eGljQ1NQTzVsc0FsQUNWdmhPWTFZbFdBZUZxRjd1amlMMFRMVFZRV3BW?=
 =?utf-8?B?QVJEenR5bTc4d0FlbFJ3U0g5TkJ0ZXoyNFF0Q1hTVG9iZmVqN1JIaFdTNzYx?=
 =?utf-8?B?V0p1R21sUktrczM5UzlINVdGRzNhNWFRMThCMER3ZFJRT1Q3WnBlNlVpNEov?=
 =?utf-8?B?eXVVKzNhZmkwL05MV09jem1MeUFQVzFaeml2Z0RWMGJCMnh4cHRZaUpLVjk4?=
 =?utf-8?B?NmhneDB3dmxlemRzWWtSNmhqZGR0OXBPcjRFRmJocXU3WnhHV1dUZkQ2UUkx?=
 =?utf-8?B?VHZ5eDErODJITkVaNUx3RHp1cHppWlFwQjlEblhGY0ZkaVNpQ05NS1hZS0U2?=
 =?utf-8?Q?7N0/fOp7ssN3eYKKmDEqlIMdsHGbQc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 16:29:31.3124 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7082b303-92b6-4be8-cb9c-08de0751065a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761
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

Fixes for 6.18.

The following changes since commit b2ec5ca9d5c2c019e2316f7ba447596d1dcd8fde:

  Merge tag 'amd-drm-next-6.18-2025-09-26' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-09-30 09:26:31 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.18-2025-10-09

for you to fetch changes up to d07e142641417e67f3bfc9d8ba3da8a69c39cfcd:

  drm/amd/display: Incorrect Mirror Cositing (2025-10-07 14:09:20 -0400)

----------------------------------------------------------------
amd-drm-next-6.18-2025-10-09:

amdgpu:
- DC DCE6 fixes
- GPU reset fixes
- Secure diplay messaging cleanup
- MES fix
- GPUVM locking fixes
- PMFW messaging cleanup
- PCI US/DS switch handling fix
- VCN queue reset fix
- DC FPU handling fix
- DCN 3.5 fix
- DC mirroring fix

amdkfd:
- Fix kfd process ref leak
- mmap write lock handling fix
- Fix comments in IOCTL

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: Add additional DCE6 SCL registers

Ard Biesheuvel (1):
      drm/amd/display: Fix unsafe uses of kernel mode FPU

Christian König (1):
      drm/amdgpu: partially revert "revert to old status lock handling v3"

Fangzhi Zuo (1):
      drm/amd/display: Enable Dynamic DTBCLK Switch

Felix Kuehling (1):
      drm/amdkfd: Fix two comments in kfd_ioctl.h

Heng Zhou (1):
      drm/amdgpu: Fix for GPU reset being blocked by KIQ I/O.

Jesse Agate (1):
      drm/amd/display: Incorrect Mirror Cositing

Jesse.Zhang (3):
      drm/amdgpu: Merge amdgpu_vm_set_pasid into amdgpu_vm_init
      drm/amdgpu: Fix general protection fault in amdgpu_vm_bo_reset_state_machine
      drm/amd/pm: Disable VCN queue reset on SMU v13.0.6 due to regression

Lijo Lazar (3):
      drm/amd/pm: Avoid interface mismatch messaging
      drm/amdgpu: Check swus/ds for switch state save
      drm/amdgpu: Report individual reset error

Mario Limonciello (1):
      drm/amd: Check whether secure display TA loaded successfully

Philip Yang (2):
      drm/amdkfd: Fix kfd process ref leaking when userptr unmapping
      drm/amdkfd: Fix mmap write lock not release

Shaoyun Liu (1):
      drm/amd/amdgpu: Fix the mes version that support inv_tlbs

Timur Kristóf (4):
      drm/amd/display: Add missing DCE6 SCL_HORZ_FILTER_INIT* SRIs
      drm/amd/display: Properly clear SCL_*_FILTER_CONTROL on DCE6
      drm/amd/display: Properly disable scaling on DCE6
      drm/amd/display: Disable scaling on DCE6 for now

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  48 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 211 +++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |   4 +
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   4 +
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.c |  21 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.h |   4 +
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |   4 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   6 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |   4 +-
 .../amd/display/dc/resource/dce60/dce60_resource.c |   4 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |  16 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |  17 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |  16 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c       |  10 +-
 .../gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h   |   7 +
 .../drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h |   2 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   3 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   2 +
 include/uapi/linux/kfd_ioctl.h                     |   4 +-
 28 files changed, 276 insertions(+), 174 deletions(-)
