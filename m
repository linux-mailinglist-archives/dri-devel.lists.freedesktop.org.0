Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84263AFE035
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 08:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED1A10E72A;
	Wed,  9 Jul 2025 06:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i/6JhMX+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B7B10E0CB;
 Wed,  9 Jul 2025 06:44:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7KzF3AIdoK8tUKtCNOI7+fiLRXc7VwFHCnuJCqjspkX4FrwW+yvDaG05ITn5gobVWi71QP7rOiM/POQ9buNGiKlRxgVKsJJQXI760NWHK2NksFoeZKfAlqGTXu5uWW5b3n9owKxVxvDMpyL6u26L7SFvVxxuC5sxH46A6aHwBforcv/JL8lwS49YV//6GClbDXBnIbbIzAF4KfYv15S3zJ0APw3AwoPoVfrss7+KrzkCbTR0PUsEElbGVmY528HSo47VpT0gkbP7WNYTcQXm9Xx198SMTCTl7RcrhL9E9a475jA7IfmXIUxHH1+AWfofY3X0IlTq6fncZFqMFBvxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njE8vYwmLH3CNoTfEI4Lp3NFk9KBVseNiZBs63m/8x8=;
 b=PgR4QKI32jn8Pt3/pT2Ebr+9av6mYxSq7ll8fq3fvnAIWiqNA4/JXx3iaAHrHC7AZEAE813ZhvFI1DpDMct2T27QbICrwoG1eQ6SdDQQmalskGsH+rjNMn3pu7E4FDqNEs00C4a5fQfC0uR3a0P9NeIO5AKiS3YHaJYz9qwnVF3Rv9z18zHwY0cJd3EQ2MJy3LLkZ8TIWsEasG8mqNTT8laSaLP94wlW9aDXgHnW3aQQF7FuxtvUYZfcvoM4NPSMohe3R0jUgqJqseUPrdZ3PXzyE+Ep814eYwdSU+Xj4u0zzZ13wVAVe4TlDPg1A8FivgCQUoBBNbgCJB8npMa55A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njE8vYwmLH3CNoTfEI4Lp3NFk9KBVseNiZBs63m/8x8=;
 b=i/6JhMX+NSiiYoOyWMbLrtJrZtANhfCB+oSASRaAShpEZZXeV5WM2E09RWhJrLNATAc0gPoMJvkmcA0lgQ+V70qxZe4Sxm3zP3EYSbswoYihxGsxbN7sM5K0YvaQNvXIOkxg56s7fm6a1LQ3O07lGX/ZkHXCJlvfy7Ze3H7Etbo=
Received: from BL0PR0102CA0024.prod.exchangelabs.com (2603:10b6:207:18::37) by
 LV3PR12MB9257.namprd12.prod.outlook.com (2603:10b6:408:1b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 9 Jul
 2025 06:44:20 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:207:18:cafe::41) by BL0PR0102CA0024.outlook.office365.com
 (2603:10b6:207:18::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
 9 Jul 2025 06:44:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 9 Jul 2025 06:44:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 01:44:17 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Jul 2025 01:44:11 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <gregkh@linuxfoundation.org>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ray.huang@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <victor.zhao@amd.com>, 
 <haijun.chang@amd.com>, <Qing.Ma@amd.com>, <Owen.Zhang2@amd.com>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Samuel
 Zhang" <guoqing.zhang@amd.com>
Subject: [PATCH v4 0/5] reduce system memory requirement for hibernation
Date: Wed, 9 Jul 2025 14:43:59 +0800
Message-ID: <20250709064404.839975-1-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|LV3PR12MB9257:EE_
X-MS-Office365-Filtering-Correlation-Id: b93ba5b0-0a9d-43c3-3e65-08ddbeb40864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|1800799024|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHRFNlo4Y0lva3JGVzhhclFzVE1adWw0c0xUUytmVWUyZXN3WTRNNC9GcjZO?=
 =?utf-8?B?YkZMK0JxY2Q5YlZWQ0FsV1lGKzhqTUZRN3NzSzhOWFFPd21sUEJSSUFyTHVj?=
 =?utf-8?B?cmhlTkF3MVp1ajFrZXMyQjRmTGxPalJGMGJVejFhMGY1TlBUVTVXSmxCbkdV?=
 =?utf-8?B?M0k4QTR0VzBEdFo2MG5sT05XQjNuVnBvZzQ1bnplUW1yMmJzV01Ra1BFYVM3?=
 =?utf-8?B?VHhtWTJQSHRyUkFOYXY2Kzg5RlhxQTh4aW5zYnk5eDJaaVRsVmlPV09lRXBK?=
 =?utf-8?B?VEcyMXE0VGk5dFFMZFJFQkhkL3hUcWVpUFp1dGNOakFNQjZIaW9jamx4T3Mr?=
 =?utf-8?B?aDRUdkFSTFhlOEwyYmdxN2czdmlWcVdkUE9aR1VIK1BhOFVTOTQrTXk2WGhM?=
 =?utf-8?B?UWpYMmxpQzIyQ3lsL0tpQ1ZONDl6SWtwSFRiTnMwU3dJQVBEZXdXYVNwcWZz?=
 =?utf-8?B?R3RqOVRiRFQrRko0NDhwK3pkaHhGRmdrQVVxbk5Lcnk4dVc4ZXVkTVB1eDR3?=
 =?utf-8?B?M0hFcEsxYVRXcXp5REJLTGRzSm5iQ3pRTllLVmZFdUw0RnJhU0cvRmxxK1Bj?=
 =?utf-8?B?eDlnK1U0Vk11clhoYUJ0bk1oUUJNSW40V1J0MTVHWlJLb1VaZDhiNlI3Ykll?=
 =?utf-8?B?dHRqR2U0TmFYcVJXZmNPMHNWL056bUZJYXFsUFh4OWpZUnh1Y0tXNnV6MDdL?=
 =?utf-8?B?cGV0djFEL2dyR0xPWVFvOEg1Slh5ZUxJMTQ4SXJrZWl0SmJPOXR1M2lrcVli?=
 =?utf-8?B?VjFkVlA1WG1aSXN0LzZVTEQ1ZGRKcWx0b2dTWXNreUtEVDdJU05OWDMzSXQy?=
 =?utf-8?B?ekMyako2aG9HUGwwM0l6RFF5dDZndzJWRUdTME42cWtHZEtjc0plN0RGY045?=
 =?utf-8?B?ZmgwSnphSHFIbTR5VlR4SlR5b09keDV5cFhvTHBrYnFkemUrSjBMRkYzSTVO?=
 =?utf-8?B?anF4dEUrZjNHdFBmVzRVajZMd1pBRzA0aVlZYUxxei9KZ1ZKU0c4RjRMWlEz?=
 =?utf-8?B?eXdnemprL2U5bVVLSlJneWxkMlJCSnJTL0dtRE1BQjZlaWt0aGplTU9iTUVX?=
 =?utf-8?B?ZW5EdkU2ZXBjQnkvVjBuMGlVdFdwaFVhcy9pZE5PU2pYRmFvTmFQdm8xaEtD?=
 =?utf-8?B?Qnh5K1BJT042R3NwbnJtNFF4TlZlU3VVM3cxK2JKRkMrSEhtMjlEeEh6dnBJ?=
 =?utf-8?B?RDZ4eENKT1JRdzNWOThmSkFpZG9IUFZXQmtuVzVTdEUreHVKZkZxZC9wSExJ?=
 =?utf-8?B?d3l0RkNoZjgvbmZ1NDMzOWsrZUhJZ0FRNWxrNC9OdkJVVXNIb2RMcmM4WmF4?=
 =?utf-8?B?YUIwUGN6VjNqNGYxM0pZdHRwcGRlREQ3c1VJaW5neUZpWVljaTVqb1hpYnA2?=
 =?utf-8?B?RlJ2OS9xMzZleHVIbzBYNFdwWnZuSk52cncreEJldUxEZTZYS0VNQTAvTWM2?=
 =?utf-8?B?SEpoTmJxcWw0NHM4UTZOOFVXL21BM3NFeEVFVzI5VjJRWVFRSTFlRHladHRk?=
 =?utf-8?B?dzR0Q05RQ2dobjhLRGx0bWdNT1J0dHdsTk1RRmN5eXp5WkplcmNxdlpJMVND?=
 =?utf-8?B?enBpOW1Cc2xyTUtKSTJzbUdSLzZQOU12dHBicStMT3BSN1MxTnZwdGRIdC9O?=
 =?utf-8?B?cnl3MlBKRGVTY1JIMTlKcVhQaDJwZFJ3dWZVdDcvU0h0NXhBajZPK1o2dFJG?=
 =?utf-8?B?S1haK2hGS1UxVkFXYi80L0lBay95ellzRlhIK25wTjBLRnU2ak8rOXBOcjhW?=
 =?utf-8?B?WmpCVXo4cXJaNXZRekxERGpKYUh2NTNkTkROZ2svNEZMeVVGbytHU1N1WkI5?=
 =?utf-8?B?eHA3N0NMYyt1bEwxRG9jNldkRlRiS0hKR1M0cWpTODljTHZiczJMOUVMb1ov?=
 =?utf-8?B?L1Npc0hoRHg2T1kydEhzM1NrR0Y4TWhzWHRIVVIrWXpyMUZkOVJmTnZocElC?=
 =?utf-8?B?blNzRnlYUkswQlU4SzNQMWNXSmlmN3FuZnFYY2Y3MGZiUEp4aU8wSWdGNEIw?=
 =?utf-8?B?MVcySWJXU1RreURmWnNkZkZPLzNhSnZWbWM4bFNLQjloWnBGMitLK3YxLy81?=
 =?utf-8?B?NTNGL2IrV3BxbDRsMjhoMEtaQThKbEY5am1TZz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 06:44:20.0225 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b93ba5b0-0a9d-43c3-3e65-08ddbeb40864
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9257
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

Modern data center dGPUs are usually equipped with very large VRAM. On
server with such dGPUs(192GB VRAM * 8) and 2TB system memory, hibernate
will fail due to no enough free memory.

The root cause is that during hibernation all VRAM memory get evicted to
GTT or shmem. In both case, it is in system memory and kernel will try to 
copy the pages to hibernation image. In the worst case, this causes 2 
copies of VRAM memory in system memory, 2TB is not enough for the 
hibernation image. 192GB * 8 * 2 = 3TB > 2TB.

The fix includes following changes. With these changes, there's much less
pages needed to be copied to hibernate image and hibernation can succeed.
* patch 1 and 2: move GTT to shmem after evicting VRAM. so that the GTT 
  pages can be freed.
* patch 3: force write shmem pages to swap disk and free shmem pages.


After swapout GTT to shmem in hibernation prepare stage, the GPU will be
resumed again in thaw stage. The swapin and restore BOs of resume takes
lots of time (50 mintues observed for 8 dGPUs). And it's unnecessary since
writing hibernation image do not need GPU for hibernate successful case.
* patch 4 and 5: skip resume of device in thaw stage for successful
  hibernation case to reduce the hibernation time.


v2:
* split first patch to 2 patches, 1 for ttm, 1 for amdgpu
* refined the new ttm api
* add more comments for shrink_shmem_memory() and its callsite
* export variable pm_transition in kernel
* skip resume in thaw() for successful hibernation case
v3:
* refined ttm_device_prepare_hibernation() to accept device argument
* use guard(mutex) to replace mutex_lock and mutex_unlock
* move ttm_device_prepare_hibernation call to amdgpu_device_evict_resources()
* add pm_transition_event(), instead of exporting pm_transition variable
* refined amdgpu_pmops_thaw(), use switch-case for more clarity
v4:
* remove guard(mutex) and fix kdoc for ttm_device_prepare_hibernation
* refined kdoc for pm_transition_event() and PM_EVENT_ messages
* use dev_err in amdgpu_pmops_thaw()
* add Reviewed-by and Acked-by for patch 2 3 and 5


The merge options are either:
* the linux-pm changes go to linux-pm and an immutable branch for drm to 
merge
* everything goes through amd-staging-drm-next (and an amdgpu PR to drm 
later)
* everything goes through drm-misc-next

Mario Limonciello think everything through drm-misc-next makes most sense
if everyone is amenable.


Samuel Zhang (5):
1. drm/ttm: add new api ttm_device_prepare_hibernation()
2. drm/amdgpu: move GTT to shmem after eviction for hibernation
3. PM: hibernate: shrink shmem pages after dev_pm_ops.prepare()
4. PM: hibernate: add new api pm_transition_event()
5. drm/amdgpu: do not resume device in thaw for normal hibernation

 drivers/base/power/main.c                  |  5 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 15 +++-
 drivers/gpu/drm/ttm/ttm_device.c           | 23 ++++++
 include/drm/ttm/ttm_device.h               |  1 +
 include/linux/pm.h                         | 87 +++++++++++++---------
 kernel/power/hibernate.c                   | 26 +++++++
 7 files changed, 130 insertions(+), 37 deletions(-)

-- 
2.43.5

