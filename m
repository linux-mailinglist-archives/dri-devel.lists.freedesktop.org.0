Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E16F9880B3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9DC10EC89;
	Fri, 27 Sep 2024 08:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OHvuZm56";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCF910EC85;
 Fri, 27 Sep 2024 08:49:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s93YhI9IIzFtAM9l343HzdxZXbjQFvAew9+gNJQrh2YGSxFa7Y/FzKGujriHZ0pdQOEXITZE9cOz//PXpmbI34o9XR4p6tHYOm9D2jIL7hpmF2gEbJ2Xsgi6YpwcvnWqH3qOcNDcCgH+FvoW8BHQUjX2wP0eI2iK6V8BRWrtyKocxTkWwU3Voq9SHmQRzFS+w1e22qZBNriIgJYr85LrSc+EaErtyoNOpgS3/xJlbDUCtqcW5uSGKrKkMogZPtjl0JoYJhx8rEjaxLdlnVujwx944adjzI9yIPXEiBIw9doQFExw2HVrSnRiwstEgIQQLfs3LB0/RwFihzzgmYETyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3S4zsYoCD8TZh/MYx20NQt1gNoxKnrhby8jT4Rdz91s=;
 b=fCroL1mmFyzFxbQe9OLDPUS0q7MTSP1KPM0P7OwDUBr91vefnUkbjutWD/aii4z0GzmibO1jjD+t0IBkwUVSJzyGXeKw2RGUEGx+Oy2KFkno5V9+vHNCggSKpvqUIw9vliUzIClb9DJWKX169DIi58Bebx89w5k3RRwJuWO6FFuB810vQF3vUTAGMnIWiUk5n20y5j1npUz8OrGQbqjGK8F/BRJjo+NaGdbCke2MQMWz5qnRdYbe4wltrmvMA5Hbo6UAdizAoZFPcanTlb9j/tBZUAnzR8LBuEP22J1D4bmdoLytC+NUrdmCYT7fLuZFyArLlqirGNFr9+dvBdKfWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3S4zsYoCD8TZh/MYx20NQt1gNoxKnrhby8jT4Rdz91s=;
 b=OHvuZm56+6Xeo7k9pZG/k5uItv7W2ZAMPf1qNNYUxpdQSoU2UhPn1SJbZRzJfdksSorDiNlXsEI7Q88+INt8GPhWM/wqW+3LHtDnAXRB/WbW0TGPz5tsMsocrUhjN7Nvjl7c7lTdzDHgxiyGmrxpt4S52KAc1aIYhIZ/0HgaqQY=
Received: from BL1PR13CA0143.namprd13.prod.outlook.com (2603:10b6:208:2bb::28)
 by SJ2PR12MB8941.namprd12.prod.outlook.com (2603:10b6:a03:542::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Fri, 27 Sep
 2024 08:49:30 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::d2) by BL1PR13CA0143.outlook.office365.com
 (2603:10b6:208:2bb::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Fri, 27 Sep 2024 08:49:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 08:49:29 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 03:49:27 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v4 0/6] DRM_SET_CLIENT_NAME ioctl
Date: Fri, 27 Sep 2024 10:48:36 +0200
Message-ID: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|SJ2PR12MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: 646cf9d9-ee65-40ab-0e64-08dcded14ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejlOZ3dMSmNDdkloN1Z6dmc4UE5RU1VaNWpmVTQ0aU12cHU1S2pZOWhWM1ov?=
 =?utf-8?B?V1RMbkI1cFdIaUhXYWdBaDFiZk52S1dqbDN0TFJPeitnUm1GVUo1S25mak1T?=
 =?utf-8?B?YWdEMEFCZVRQTlNLeWordmZScE04YnQyaE9lM0tHdFNmVVN3MUlybXRFbG13?=
 =?utf-8?B?QVZIb0dYc3ZyY0YvaTkyM0hlbGVaZlhLcTdCZ0d6MGltdlpNWEFjaFRWUzNx?=
 =?utf-8?B?Tkp6cWkyeGovczF6NG8rUHVGVlF6YThVUzhlKzZ1anF6VGxZa3lFUDlpQWM1?=
 =?utf-8?B?M0NYcXNKLzJFeDR0c1p6dWRIMUpNUlBZd0l4V0VjU1NISU9oQVNNZW9tVlM4?=
 =?utf-8?B?WGwzWGZDMXYxYmtJVG5OV3NDNjVEb3M1OGlad3R3OFpXM3d3VGl2QUtSU3BK?=
 =?utf-8?B?MFg0azk4c3ZxN2VQVXY3MTBBMEtiTWdmTDFLQytZSU1qVE53OWw0NEdVU3lL?=
 =?utf-8?B?VVVPcHlST1oxK3M4Zms2SWFKK0lPaW1LdDRlbW1uN3dRRVNSektpenhqRkgr?=
 =?utf-8?B?MXY0ZTFDWDQ3OHdIeTdrZkkwbFZCN0FEMmNlUkdmcWZWaXhjM09BRFdXcmtT?=
 =?utf-8?B?ZC9pdHlTOVEwTXI0dUFnQ3djVVlDU0V4MUo4aElsaElRLzFXUXgxVzl5NVVx?=
 =?utf-8?B?bGxRQXlodVRZWVNVVFFqVDVVVFRRNW41Q2xFdER1c2loZmR6TVNPb3ZwZWg3?=
 =?utf-8?B?MFIzR1BIK3lpUFd1QVJjSHk0Z21WOXhXWFBTdCtITzVuVlAzMllzWWY4Njcx?=
 =?utf-8?B?RFF1bGVFUXk0OWphVkxFY00yRlN3cUprS0t4cmM0ZEJjMGloWGlMZUV0S2pw?=
 =?utf-8?B?ejRERmsrblVJb0lFQ3BvNkNzL2tRUEZxZ09DRStzT1ppaCtucWFBaStWL1U4?=
 =?utf-8?B?cG5NWHlXa0FqYW1UQ0M4YklpM21hZm5KZ0NrUkNTSHBnK1FBUW1kTUhSbUgy?=
 =?utf-8?B?RVZnYkRRSlUxZFFaYXJKamxnV1U2SEVoRnQ5M3Aydy9NeityU2U0bndkZjQ3?=
 =?utf-8?B?YkJEWUdkMnJsTkZBNVZXWWhrNDNBcktFbVlxZnYyanFkZGg4a0RUZVk3RUcv?=
 =?utf-8?B?QTczTWJCNWZQdnpyQXAvTXBjdmJ4RVhWSlpCN2tyMkRUKzZIcC9WTTNZNUJs?=
 =?utf-8?B?OXlYK0tGWEM3UjJQMEswVWVRVFNmSnN2UVVncTgxRjc0ejMwQmp0cSttMFh3?=
 =?utf-8?B?MWtIdGNWTzg1RmxGemcrd0lZeGc4Yk1EV3pyOENtNmxSVklKQXJnNEM3cDBv?=
 =?utf-8?B?S3Nkc2xmUzBvY2lOazlISVA5S1cvOE85V24yNVJRSHdkbytJY3F2MUcyU25R?=
 =?utf-8?B?enhBcTlpaWgvOHdxVmhxbkNXYjB0Mlp6UHZqK01qVHh2dzhwN3k1VXRSM21k?=
 =?utf-8?B?NjIyc1c4eU9KVlFQT2x6a0thendvaDZ6bVpGcVIvTnlVT2EwMkpWUEZUZ2pI?=
 =?utf-8?B?d25ZZmhWYnVzUy96U0swTkVZT1Vmdjc3aVJmdjNDOVY4WXNPcjVtakdHMm5K?=
 =?utf-8?B?aXlpUkRLZmVYRmxKNTZRalFodDlpYXowOEFKV2taUHVVSFNKdWxPNC9iUTNR?=
 =?utf-8?B?RU0wZTZqRnlyR3h0aGlkZ3E0b2Y4ME5sZk42SUVhdWkyU1BvemNodkhJOFlr?=
 =?utf-8?B?WUh1OFRlOUJXUkNMd2F3NElqQzFMVlFrWG9SRmk2K3ZGOXFyVHd5QW1ydzlo?=
 =?utf-8?B?bmRzOVk5eStHSlh0N0ZHczNTdkoya005Z1pBTFF3UUJzYkh0MlFVTFJBZVJN?=
 =?utf-8?B?bWEyNGwvdytyT2YrS2lnWnBhQnBTMVFuaGNSQkxQdW1VVTJrMVdmSFhJU21X?=
 =?utf-8?B?UXloQk9zeVlrRUVIeGpjSU9zbnh0Uys0UEd0czJ0b1VCTGQwaE4xYnU1MEJh?=
 =?utf-8?Q?idZY8R4h3WD1J?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 08:49:29.8269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 646cf9d9-ee65-40ab-0e64-08dcded14ce0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8941
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

v4 changelog:
* DRM_SET_NAME -> DRM_SET_CLIENT_NAME (Dmitry)
* reject names that would mess up with formatting (Sima),
  and use a stricter filter (isgraph allowed extended ASCII
  which weren't looking great)
* documentation edits, minor fixups (Dmitry, Trvtko)
* clarified commit message of commit 3/6 (Trvtko)
* reworked amdgpu_vm_set_task_info a bit in 4/6 (Trvtko)

v3: https://lists.freedesktop.org/archives/dri-devel/2024-September/470488.html

Pierre-Eric Pelloux-Prayer (6):
  drm: add DRM_SET_CLIENT_NAME ioctl
  drm: use drm_file client_name in fdinfo
  drm/amdgpu: delay the use of amdgpu_vm_set_task_info
  drm/amdgpu: alloc and init vm::task_info from first submit
  drm/amdgpu: make process_name a flexible array
  drm/amdgpu: use drm_file::name in task_info::process_desc

 Documentation/gpu/drm-usage-stats.rst         |  5 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 62 +++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 +
 drivers/gpu/drm/drm_debugfs.c                 | 14 +++--
 drivers/gpu/drm/drm_file.c                    | 10 +++
 drivers/gpu/drm/drm_ioctl.c                   | 55 ++++++++++++++++
 include/drm/drm_file.h                        |  9 +++
 include/uapi/drm/drm.h                        | 17 +++++
 23 files changed, 171 insertions(+), 42 deletions(-)

-- 
2.40.1

