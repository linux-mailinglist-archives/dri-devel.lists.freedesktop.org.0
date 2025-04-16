Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369C8A90EA0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 00:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F9010E9D4;
	Wed, 16 Apr 2025 22:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E8L0sHCL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7B110E9D1;
 Wed, 16 Apr 2025 22:31:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CR6i4uWf0Nb09pltF/ObJkhW4gH+4e3Zd2gH0HC0phE45+N/1qQYw19UF6OUQozoOcRgLSfsKrz6YQYRoQOe96kFmDvB1Cw9bN6B7Nr3FRvS0aKhNpk5FhJWQGdToceQPnvJr69/2ekQaMASIssuKsxyWcKnAszaef+g+sf4d/v//EJDbybvM41i/OcbQwc5WOmM6gzxAygivNjjvJR0KWyXd79Nc7jB3ae7b4VZS4RYNPTVmA2W/S59BaAeDPEC5uKOt+lN9pCLPhmsGFI1oz5iuvSWMHTgA2Jz+/KdRVc4312yZkqPe/o3ImWsTbWO4Jar/yXK98EN6IuVfniL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5r+vJf5ETUAFnB/ypJFcQh1fyhF+L8WXKBDiXQhAuck=;
 b=Q9KGoHjgpw7B/FWa83mqIy/0Wxha0zz4tZfB5x0WVp26u6ozpq1DtWjWNyEMGcuI5Txx04luqVfEZ9keLsGkQKCbGSO9Ijt87xYmDO4B173z92ElmBDYzl//bgUI47QVrSlVZ8k213gf1002MhA9hh4QiVyVJ69GdFro86IDZnIschTWKRQbhrReDwopiRvJH8/gyoEXbcJ+DzB9ouYr6nGb7dOinB9myBk7B3x/N6BBb/8u+mE9GSEmE7ZuHuHrQxCHGqDOBrc7tJKYlK2/gME8boC582yGeh8rLtQHuep46zJaLMXYp3T2xEyKzi6KnSOLdu5OUFLbP59WsOVf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r+vJf5ETUAFnB/ypJFcQh1fyhF+L8WXKBDiXQhAuck=;
 b=E8L0sHCL3LVD3gl7H2gheh1E8librOW4ZnJ1g/e39PiUt38Hxd95rGt0m4fOuIit8DtiLBdGdn+JFoa+Ze+xTx4bD0Iml7Daregrl4ooqqdAkIm8w3zCyj/i2D+/62U56aInRzf0YHYxSFrolpkiq/fNcjeaJfAT+eZlqu3zE4c=
Received: from BN9PR03CA0658.namprd03.prod.outlook.com (2603:10b6:408:13b::33)
 by DM6PR12MB4107.namprd12.prod.outlook.com (2603:10b6:5:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 22:31:53 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:13b:cafe::87) by BN9PR03CA0658.outlook.office365.com
 (2603:10b6:408:13b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Wed,
 16 Apr 2025 22:31:53 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 22:31:52 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 17:31:51 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.15
Date: Wed, 16 Apr 2025 18:31:36 -0400
Message-ID: <20250416223137.1146653-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|DM6PR12MB4107:EE_
X-MS-Office365-Filtering-Correlation-Id: c6df491c-c60a-4a4f-6365-08dd7d367c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2ZRTGFNaWYwUTFvSFYvVzZoQWY1SGV4N2w4UjUxQ091a29TWUYwSHk0VlRO?=
 =?utf-8?B?TFVocjd0VlF0bnh6cTc2Um9jMFdEaFp6MkM0QnIvTExCc3d3WndOdUpja3lM?=
 =?utf-8?B?L2krdzEyaCtneEJwOXZnbzF5MGpyUkZscUtLazZqVzAvS1ZCQmM2bDMyQmxK?=
 =?utf-8?B?NllVL2ZFc2orNkZNREFOUEZCL2h1Z3pWMGsxNjZBSWlOT1BUcnd1WkVrRzFw?=
 =?utf-8?B?K3prYVpBZm5FenNsby9CQkV0dm9sOC9Qcm80OG1YRzVRU0pyaHhjbkRzdWFP?=
 =?utf-8?B?dWk3cXdrY0pKdlU1Y3RQZmV3Sk1zNTdZYldMWExHamYxVzljekttVkZUZ3Az?=
 =?utf-8?B?MEs3Vzh1YmpEWkplMG5rMDhrbFBoeThnVzZ2Y2pDLytqMUpYYS91MzZFd0JH?=
 =?utf-8?B?UnpJd2ZtNWRqVmxwRlVGMHNhSHhiTFVyOEhubVlHWFUvNVh5MkdTV1J3TXVF?=
 =?utf-8?B?UnBtU0xnZWNTOHduMU1CWGV1c0tVMWxxNURnZUd6M2JaVlVCdCtuOXhWS3Mv?=
 =?utf-8?B?dllFZU55dDJyVnRvYnVaN1dUZnFZNjVoa25BMmtSQVI5dHBUTHZCYUc3ZXI1?=
 =?utf-8?B?RGlLNFg2dGZsNHJXT2pzbjdRSjBsMlM3RmE3UzQ4NkpPSmdlWHVBdjQ3TTFN?=
 =?utf-8?B?T1pwUXNOZUJUNWo1NTMyZXl5QzVPZlQxY2RLMFE4ZGFSUjd5dXhaVXVqcWV4?=
 =?utf-8?B?M0xoeTNZQmZLVHd2cUFWOFZGMkhvK2haSEFGdUlsREo3WkxTdm1VaDJ2SWRB?=
 =?utf-8?B?N0s1d1I2NTBURlcxSktlbkZ4YVlGVkcxQldLOUZidzQzS0JlNFNOVjE5ZCts?=
 =?utf-8?B?N21tOHZBcmtIWFBlTVI2czNzNTJrV2llWmJiKy91RzRWdnJkL0o1cjAwVWxm?=
 =?utf-8?B?aFRBTlVqSHFZaVhXSW9jNkhmTXp4WGxXN3EzQStVOGxsU0xNNk1ucHRQZHRq?=
 =?utf-8?B?RzJ5WDd3Rzc0dExpaWZqcFRhZG9xSUMyellQSTdEajBOblJ6N3VLV2hiUnFK?=
 =?utf-8?B?MDFwTHNmb3dDOGRtU3MyblZ2UUNWaGx4clBpdmZoblVGaGFab2dPSFpGSGo2?=
 =?utf-8?B?OHQvYXQ2eEgyZkQxU0VLTGdYb1dpViticDRsNEEwYnBGeHJlWUhmdUpLenBX?=
 =?utf-8?B?a2MvdXVKblZaUlIyRXU2ZHliemdZdjFsaERlMXh1YzluQi9NUFBXMEpjTHUv?=
 =?utf-8?B?dU40THpyV2VMMUhha1dCZDI1TUxFQlJkZlRzSlk2MlNCeWxLWTZTT3U4anJJ?=
 =?utf-8?B?YWVnVGVNbkthN0djbTgrNEcvQXRZZVE5aEJUR0xIWFJNQWJIWmYrUzVBYS9V?=
 =?utf-8?B?UFFHeWpIckRsQUxNQWZKNzRYdkZyWTdrLzVRQWNjNis0STNpcEF4OUlDc3FP?=
 =?utf-8?B?cDRJZTJPYzRVNHBBK2l0TWVSdzFSL2lYU0VrU29pTkFqblp1Z3dMcFBBdVNy?=
 =?utf-8?B?SkZ1MjNOdVZwV1pFQUZla2s3UTFJaENPS1FKdmR5Mm9GcXJHMEZDTU1JU0hP?=
 =?utf-8?B?WjlEMGhpNWRBY1l1Nkw5OEJaa3hRUzR2b25yajlnQ056S3pWZFJVSnQwL1V0?=
 =?utf-8?B?OVIvK2szQnhlcHRHUkcwZm9qaDJDdGlYTG9LVmpnRkwxWkRGSU92UGhPaElj?=
 =?utf-8?B?Vk5uK1o1RzhoRXFSTk01N0NyQnZXZ0tIVWNnUzZRYTlsZXpxR3loTjJtaXl3?=
 =?utf-8?B?SHFtT2FHMWpINGZWTndYY291aEtLdmFmUFlhYnRaM0Y2S1BLbkYvdEZIWnZp?=
 =?utf-8?B?cXNsVEcrR21VMEdWYlRtZytMZG13RlkvdzJ1UUFkSmhUNXpkOWlscmlMczdw?=
 =?utf-8?B?NzUrSVU1SkkzTzYzWDFFeWdVc3BGeEs1RmpRTDVjYzVCOEl3SGxtUENVMk1Q?=
 =?utf-8?B?S29CZmhFRjdZdUcwRjFyN2Joc2YwYjVNSExNQ283UE1nOGVNVzJncE16dEkr?=
 =?utf-8?B?VlRIeHUyZTZFdWN4aTBpV3ZpRElZejRvTllFY3NVTkJadG9tNjVoMkFlVlVr?=
 =?utf-8?B?aGlLVE54T0pRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 22:31:52.0255 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6df491c-c60a-4a4f-6365-08dd7d367c20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4107
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

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.15-2025-04-16

for you to fetch changes up to c235a7132258ac30bd43d228222986022d21f5de:

  drm/amdgpu: Use the right function for hdp flush (2025-04-16 15:57:46 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.15-2025-04-16:

amdgpu:
- Cleaner shader sysfs fix
- Suspend fix
- Fix doorbell free ordering
- Video caps fix
- DML2 memory allocation optimization
- HDP fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amd/display/dml2: use vzalloc rather than kzalloc

Christian König (1):
      drm/amdgpu: use a dummy owner for sysfs triggered cleaner shaders v4

David Rosca (1):
      drm/amdgpu: Add back JPEG to video caps for carrizo and newer

Lijo Lazar (1):
      drm/amdgpu: Use the right function for hdp flush

Mario Limonciello (1):
      drm/amd: Forbid suspending into non-default suspend states

ZhenGuo Yin (1):
      drm/amdgpu: fix warning of drm_mm_clean

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c                |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c                   | 14 +++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c                   | 14 +++++++++++---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c                    |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c                    | 12 ++++++------
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c                    |  6 +++---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c                    |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c                    |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c                    |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c                     |  2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c                    |  2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c                    |  2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c                    |  2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                           |  7 +++++++
 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c | 11 ++++++-----
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c        |  6 ++++--
 17 files changed, 66 insertions(+), 35 deletions(-)
