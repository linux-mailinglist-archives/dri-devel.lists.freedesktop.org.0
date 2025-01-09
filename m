Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B2A07DE4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 17:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DDA10E472;
	Thu,  9 Jan 2025 16:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CqjXPpi6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099F210E472;
 Thu,  9 Jan 2025 16:43:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pyrw3vbEGWr7IPfirjdH69c1nzqD34UVmEE/IpYCr1yRn9noulHrI8jJAmQjw4pG/0l4O1qxIC+W87m4G/sMOEoaf/VYzay4F5cxX8FKUlA1LTsyRPqTVQHc4hP0YjI3vTFsf016XdmHG8Ds5Jod4lsyJxGXb3ErylSOugZn9nhT4DaDN8ezr56VuQCbw7wNtjyoxsJVkxu1KQYRghPwF66++N+ZbXCHR1LdwDjo1afev2nyH4ug28BeRzun+5JK8obc5tQcAPeZz+aBjMwOx97jOLRgkfhRmtEORYwWqAM7o5m1KkhhOv1HLZNmNRLSFOpL50XPAkjHjCyKf+1wwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnTEPGIT4Go/eD6SwmtfiDIHQO9NWku/2kaa5Cw7Z0s=;
 b=RHjAJes/XV+F4UCNOnEZTjbmCseMEFI6tS3Y7Lc9zKm0jBbRrO+oQlBEFFn38OSOTdNOyHu2iye9URfllPWyrfOAb4QbFBWXyt/URziypnDL26Or8wqanrGnEXiI2W4lrGummpQSnNm09x21a/aS7kI7wIouINq8ig29SuN+rmoaW6yMhn2Wqlmg0qSaWhJ6cTtlkbvXwhalDRuGOo8e9nzU7il6R6NUIjMTjbYy3phmO6Rd4brWT4e2EWijXhN9GSaXAqtPC5uvI/9jN+gaZ+hjINC/N7nRrw9xG7/n2gvKkXygFM8jN10cB2E6nVl5kNAUHNj6PF30qDkBzVhm0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnTEPGIT4Go/eD6SwmtfiDIHQO9NWku/2kaa5Cw7Z0s=;
 b=CqjXPpi69NdSQ2ohQQnxwIPbUL7lLZMGIkDuJbRQBeZ/zaR85dfC1Wa4VnDIwPVvTuaer7o8q4nUJDLoSd2/ViOjGU2AVgUdujkgMbY8gg37LujX29Ls5N88C+GmCPyoL+E6cpSyeoYNXXjm8nAECTru4od6N5B6UCCBqN+m2ns=
Received: from SJ0PR13CA0109.namprd13.prod.outlook.com (2603:10b6:a03:2c5::24)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 16:42:58 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::c1) by SJ0PR13CA0109.outlook.office365.com
 (2603:10b6:a03:2c5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.6 via Frontend Transport; Thu, 9
 Jan 2025 16:42:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 16:42:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 10:42:56 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.13
Date: Thu, 9 Jan 2025 11:42:36 -0500
Message-ID: <20250109164236.477295-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 16cbb3c9-ff25-4b88-8623-08dd30ccac78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3AyTVRQbmhHNlplY0U3M3dqdDIrZDB4RVpPMDZlZ2VMY25zMmRQSlh4L2lD?=
 =?utf-8?B?MXIwemt6cHorVkF4MGY3MnhmM2ZSVUtyQy9yVjl5Zm5TUklrRi9XM0JZREJH?=
 =?utf-8?B?ZCtMQ2hvUzM4WWJrMmVsSk1KeU04MWpSamZMUDJGblRxUHRzTUZtdEpqL2E4?=
 =?utf-8?B?WDFQdWNmSEhGeXNEQTg3VkRHMitCdG9WbVJiblV5UnBSZUIrN2VtN1d3d1oy?=
 =?utf-8?B?ZXZkL2dyQ01SQk1WTjcrOFp5UUlJbi8rekJHTU4zN2xkT096U2d1WitPMnYz?=
 =?utf-8?B?SzBTQkN5MUo0cnBjMk5QWExKeFIxeklJQURuYThFL010YXNSVG1uWGFmOXlW?=
 =?utf-8?B?eDY3S3JGU2U2UElPdEFoQ0grK0Y3a3JTMno0RlNPL24rTEM1L1R6S2JQR0RT?=
 =?utf-8?B?SSt4VlAxc0R0R2lLRjBOUzU0cHdnSy9qL25OSUpoZEZNTHA1cTRXd2RLZU85?=
 =?utf-8?B?NGNuOFNsalVraDV6Y0tYQzBaQytnaGhtOWVaMngzWFE0TXB5RnBtY25sSlRL?=
 =?utf-8?B?MXhOYnRvL1hCRWpZSXlLRXFpZXkvRWlzMnNCejlJMWczdnRwdkRwK1hreVQ2?=
 =?utf-8?B?RmN5RGV5dEQ1UlNpVFMxMWNWQk91TmxLZ2NiRGhXQklBYzVzdFdlNEFHQi9W?=
 =?utf-8?B?NlJycmZnaE9Da1FjU24zMGtjaDZTcVI1M2hRaFRWcnd1VXd2S2xIaWRyemRq?=
 =?utf-8?B?MWVwSWJ0OURrM01yUkpMcmNFYW9MTGs4RUQ0bENlRWJCZG5uSVBRcmNZSUNF?=
 =?utf-8?B?anJVamVnejhsYzdGSlZOYldrU2ZIRWFrUnMzOUdiN21LZS9waVY3cUsyYVBi?=
 =?utf-8?B?YnYxMGtBRWwzTVk0RXF1aHJiLzk0QkhXZmx4WUhBTy9vOTdZbkpJSjVRMFNU?=
 =?utf-8?B?NGhLV2tpNWZlNHZINHkzTnVnTGRtU1hWbTZLMHRWQkZmZFd5bC9BMTFXKzE4?=
 =?utf-8?B?MVpLNkdFc2M3VjB0SFRSdnNhblAvU0YwVjNGeStDY2xHNUJONmsxbDFZTFBX?=
 =?utf-8?B?dlFKWi9YcVFhdlkxd2hndmVad1VCYXd1a2xlRjVqNmlFdDBTUHFzemlpcDZN?=
 =?utf-8?B?dFpOdENEWVcrMVJubTNXeHVQK3ZyZUU1WU5SbVMxR1QvMjEwdktzaERuS1NU?=
 =?utf-8?B?VElaTHhEVWNDenUvd2xJQ01xNUFRNVBmbEluVjVIdmFIR3Z5UDZaaFFvL3V3?=
 =?utf-8?B?OCtEcE9RdmRiZFBQQ3QyT3NWR1BQd3Z5T25HRzVUeHRJUm9vT1crcEVKV3g0?=
 =?utf-8?B?ZnA3YW9hQkU3a2x4VDVweXMzS0twUUFCOEVpU1RRVldJV0tUOHpmTGtEMXhL?=
 =?utf-8?B?b2hmamx6eTFpaU8waFpBZ1RLN2lOMzkrY3JISU9tYnlyMVJEK3dsaGVsbmVD?=
 =?utf-8?B?dXhCRXI3VjhnaWJ1dkZnM0MvMDIzQUNnRDZKYW41QU02UThIVy8xa05sMjRi?=
 =?utf-8?B?VldmZDhqRG0zc3MvNmtWbmYveHFKNlFteEdNOGVpZ2cwL2pPU05WUk92UjA2?=
 =?utf-8?B?T2ZDTTg0UVZWV05nRlZ2TDkwNFptTkg5NlYwV25nOHZkYUV5cUI3ZTAxUHFq?=
 =?utf-8?B?Y212eHpLUm5QWG5ub255WXYrSDRtSFEzSklQWlMvT2VkOHJ2S2h3Z2pQRHFS?=
 =?utf-8?B?NkdzS3J1YWxCNllDUWZPZVNKMkRQWTRTSzUwelg3U3o0dGlxMmdOaWY4UDFy?=
 =?utf-8?B?QlhlVnNadEY4ZTg0V1pzejQyRHkzK1JESHFvd1hsV05DRXlXa3pFTnh1dElS?=
 =?utf-8?B?OVJXcnZZTTFPS0NLQ3Y1Rlh5eForSHE5TUhJRGZsbEtOS216TGtNa2ZCWVVW?=
 =?utf-8?B?MU9UMUpsSEFBR1NmbkJ1ZXdsVzlIeFRIeWxwdzlTa2FIa2NxaFVHN0dMa2Zk?=
 =?utf-8?B?ZkVFWHVrQWJ6VnhXOUlqeS93TXV3YklqTURrM3RDWXVmYXVNSVdXbkdwM0t6?=
 =?utf-8?Q?hcQ837acCtg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 16:42:57.9957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cbb3c9-ff25-4b88-8623-08dd30ccac78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8913
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

Fixes for 6.13.

The following changes since commit 273b3eb600713a5e71c64b8b403b355dc580f167:

  Merge tag 'drm-xe-fixes-2025-01-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes (2025-01-03 10:57:31 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.13-2025-01-09

for you to fetch changes up to 75c8b703e5bded1e33b08fb09b829e7c2c1ed50a:

  drm/amdgpu: Add a lock when accessing the buddy trim function (2025-01-06 15:20:13 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.13-2025-01-09:

amdgpu:
- Display interrupt fixes
- Fix display max surface mismatches
- Fix divide error in DM plane scale calcs
- Display divide by 0 checks in dml helpers
- SMU 13 AD/DC interrrupt handling fix
- Fix locking around buddy trim handling

amdkfd:
- Fix page fault with shader debugger enabled
- Fix eviction fence wq handling

----------------------------------------------------------------
Alex Hung (1):
      drm/amd/display: Remove unnecessary amdgpu_irq_get/put

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Add a lock when accessing the buddy trim function

Jesse.zhang@amd.com (1):
      drm/amdkfd: fixed page fault when enable MES shader debugger

Kun Liu (1):
      drm/amd/pm:  fix BUG: scheduling while atomic

Melissa Wen (3):
      drm/amd/display: fix page fault due to max surface definition mismatch
      drm/amd/display: increase MAX_SURFACES to the value supported by hw
      drm/amd/display: fix divide error in DM plane scale calcs

Roman Li (1):
      drm/amd/display: Add check for granularity in dml ceil/floor helpers

Zhu Lingshan (1):
      drm/amdkfd: wq_release signals dma_fence only when available

 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             | 17 +++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 35 ++--------------------
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |  8 ++---
 drivers/gpu/drm/amd/display/dc/dc.h                |  4 +--
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  1 -
 .../gpu/drm/amd/display/dc/dml/dml_inline_defs.h   |  8 +++++
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  2 ++
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     | 12 ++++----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  1 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  1 +
 15 files changed, 49 insertions(+), 51 deletions(-)
