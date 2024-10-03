Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656D098EF88
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A477810E83F;
	Thu,  3 Oct 2024 12:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YBVnqzIb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D1B10E83A;
 Thu,  3 Oct 2024 12:45:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyZReOSM/zPz6OE5yuNDg48DqyzaTtGYskUhz6fZN+rrXwOw73onbXztPh7s2rSPPfhTMSkKScdjHBhq1ZGfFnVzwOW6HJo1/39DeuUMTi9IpbsQH3TZYrCkGhskX3izFTIktRABN2ZO6digcrMGRlTrKCmCMpAi7GLZjmTDYF8cuDvSuqaPJYKXQvy2LWtC48dUlF+/JFvE8Dv+zjwpcM5q1TMLKKoEDatiS2ShkW4QciOPe62Q3YLX7cYWoFbverUMZsv+8dzqJCvzlK1xTriaaIvMAJEkIJdkCA9QLFVFWeeDUcvUSh7LQB8/JRsqQe/xLscKMmu05y4+0hhTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DohunavMyjvyq5CCy7tDN/nPMwK1gHLLQzN1T6JhB80=;
 b=euu7eOYrLBgShZsM3p2mQhBXs0x373CbQ/n4O8pkta4Wr20uj32FfzhgS6BVFHi8ZqJW5GA/uqXSFRBx99JJIeX5/1wKe3So09GVbkbcrHmBHbI1Nw4upWaf3AAgjyxroXBYIAiymWO63BVjeKy4l2jG4u5S82s8ztTztrckNcdw7Yrt8z14vSN99sdj4no9aEj0/+h07Fc7p2unNRcO419Q1y6TB2BpZPPls1k9RCMjSWzGGq1jPiyug7Qmz0sYcCRqXph4WTsRb9Nkb84raHQ6n8D2IS7Y9cXEK1Euzsa6Q6+T2LCtE22UOMxkyegYs1Dy0hzjDtth1052jQb6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DohunavMyjvyq5CCy7tDN/nPMwK1gHLLQzN1T6JhB80=;
 b=YBVnqzIb0k8L+GUKcNO+Hp6BukJvzUGayEF1QVFN3OQzvOO4FoaubO85tQ7SYEiAIy/9dFWb8aBGnJNDSMhbMNIFR493xmFeE5NLj1QoBDblWFN52OVztY61r9nld2OPU7ym9p+bX1nKr3M0RSBogygdXM3Vuz23Ssadh8HbP6o=
Received: from SN4PR0501CA0025.namprd05.prod.outlook.com
 (2603:10b6:803:40::38) by BL3PR12MB6476.namprd12.prod.outlook.com
 (2603:10b6:208:3bc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 12:45:35 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:803:40:cafe::6c) by SN4PR0501CA0025.outlook.office365.com
 (2603:10b6:803:40::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.9 via Frontend
 Transport; Thu, 3 Oct 2024 12:45:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 12:45:34 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 07:45:30 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>, <jani.nikula@linux.intel.com>,
 <christian.koenig@amd.com>, <tursulin@igalia.com>, <simona.vetter@ffwll.ch>,
 <robdclark@gmail.com>, <alexander.deucher@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v5 0/6] DRM_SET_CLIENT_NAME ioctl
Date: Thu, 3 Oct 2024 14:43:08 +0200
Message-ID: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 60be9bec-ab15-46ac-cfd3-08dce3a9464f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VS8rOTUwQk1ISzVRbU1Bc0hTZFF0SXFGZWhmVkNPaTA0QStDWGdJQmNObk1w?=
 =?utf-8?B?N0krRUNqZnhUTE1ET0ZqT2F4SGVGWlB1eTFGT0d5U0IyOElHeE9TcDJPSmNv?=
 =?utf-8?B?Q3ZsTEpCcHY4VnUvS05Db29oNmVmNVNOVzYrMXV0VlN3U09EOWV4c25WNEZx?=
 =?utf-8?B?UStYSjdqakxrMm9vS2xXTTltRHVkY0tza1ZVSlhVVzBjU080ekdxZUcxRUU4?=
 =?utf-8?B?dDJoa1ZpNEVYaCtPZUJ3VG51MFdHY2ZDRkhkK0tjUStWdUJkZWRRV2VodDlZ?=
 =?utf-8?B?M1dTc09CTWt6SG9GMDNzaFF0NEZrMjdZVU9aWEowS3dqczBpcFArMWplNjlp?=
 =?utf-8?B?ZlRqT0YzNm8yVzluWExRZjM0SXI4dmFTcGdqb3VTZjIvSVhnUzlGL3RMeGF5?=
 =?utf-8?B?V2VFUmczNk5zQkh5WkVRT1JHdm9sOU05bDJLdGpjYlBFejRpOFdkRmRqaXdq?=
 =?utf-8?B?SWxhcXVSUWhrQzNCSmVIeFR2cFVoWEc5Q096Y3E4TU9qYUNyU05Oc25UWmkr?=
 =?utf-8?B?cWhXT3UvMHUzVlB3OEhVeHZRY0I1UVM5aTZ1S1FEdTRreEY1c1BKaFA2WkxE?=
 =?utf-8?B?elAwWVlLT2NFdFViWmhHS1dMeVg4ZWtUb3VJS085TkVaSnZHdW1hczZqZnR1?=
 =?utf-8?B?L05LR2x1WnJBVzdjK2RWdXJGc1BuRXpXWmtpcDk1MUJJeW1LMXpJbGFKZGtx?=
 =?utf-8?B?QVNCeUJYMnAxdEpEVG1ZcUNxS0ZGL244MWtUTk9RUXFOMWttTStWVDc0bkYv?=
 =?utf-8?B?dk5Jc3dFTy9iZ3E5LzArbUZmRWhlOU94VjhsZ0xPdGJWOXF1NHh5UnlOdmZM?=
 =?utf-8?B?dDB6Mm1UUHExUzdRK3FlekN6ZzhZYzM1b1ZsNW9uRkZyYVFxYk85YktET1Qz?=
 =?utf-8?B?eDYvdWRNSE1yWSttc1N6MjJEU3llVm5MRkIxYlhJN3RGYUFTbDJVWnFEL0JW?=
 =?utf-8?B?cUw5dStxU1ZyTUxDYkhibnFoMjFwNHBHRHErRU9iUXVON25mTjAxWk1SdHl1?=
 =?utf-8?B?STBCSWJFTEtNakJvNmhRN050VTkvdk51THdDMEk3bW1UVzE1cXIxbXBXZ3dT?=
 =?utf-8?B?UEFpSVArM3NyWUJFaFBEanlmSzZhRERkaVl1WFR4cjdDOVBMYkVxM2RhanJE?=
 =?utf-8?B?Q2QyQTNiQ3huNVNjMDlxeTc2aWdrR2dBSEZ0WWVIeC9pL05ucFcwUnZEbUU0?=
 =?utf-8?B?K050bXFyZGJFWUpOYjgvV2FneFRrYkxxcFZGalNaQ29GQTFOeE5zUmxrVlFV?=
 =?utf-8?B?RXF3Q0RlRGcwNlhhVTZnTjRkb2pJYkx3OW9RcVRLRnorc2FqNWtzT2ljUlBM?=
 =?utf-8?B?YnZZbDVxM0RCSGU5ZkxQNEtZK1lpSDBOZG0wQVhIK0ttZWE2N01CZDVvNlNC?=
 =?utf-8?B?NjNkN0wvc1ZpakdNZCt5ZmJHeUd1aUZhSVlHMkdaZlhDTDNURkZobTgreEdk?=
 =?utf-8?B?d3F5ejNTZmkvSjhZeWdLK1B0Vk1jUDN2QzhoeDhFU0VNR3liZEZUbkxpb0Z5?=
 =?utf-8?B?MUtuSHh4QUVORW4xVFB0dklNSVdXMDNaaDVxemx6clFwYzI0a3ZvcmtZaTZo?=
 =?utf-8?B?VVdGWk1pckttZE9YVUxpUG1ubUdYSU44cWg2Uyt0U3dhODVWKy9nUWtYVndV?=
 =?utf-8?B?MWt4Tk12VHZtRjY2d2tqUnprMmNvM2VnTlVycmx1NDN0MzQzR3k4LzlBK1pj?=
 =?utf-8?B?eXJWY2h4MFhmN3poWDREZVhUWDA2VStoRWFnbk93TEVHUUtxUnFrc3FheVpJ?=
 =?utf-8?Q?28frYIconVrGnKKjPT+Y40YTmrsT6x9xh1puDJk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 12:45:34.7287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60be9bec-ab15-46ac-cfd3-08dce3a9464f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476
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

v5 of this series which is adding a new ioctl to let userspace associate
a free-form name to a drm_file.

Having this name is useful when debugging or tracking resource usage; in
particular when using virtio native-context driver, where a single process
(say QEMU), uses 1 drm_file per-guest application.
With this change, fdinfo and other tools can map each drm_file activity to
the guest application.

virglrenderer MR using this new ioctl to associate the context "debug_name"
to the fd: 
https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1428

Changes since v4:
* patches 1, 4 and 6 were slightly reworked based on Tvrtko' suggestions.

v4: https://lists.freedesktop.org/archives/dri-devel/2024-September/471695.html


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
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 67 +++++++++++++------
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
 drivers/gpu/drm/drm_debugfs.c                 | 14 ++--
 drivers/gpu/drm/drm_file.c                    | 10 +++
 drivers/gpu/drm/drm_ioctl.c                   | 51 ++++++++++++++
 include/drm/drm_file.h                        |  9 +++
 include/uapi/drm/drm.h                        | 17 +++++
 23 files changed, 172 insertions(+), 42 deletions(-)

-- 
2.40.1

