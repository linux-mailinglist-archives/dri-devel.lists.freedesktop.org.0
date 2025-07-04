Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1D6AF8FA7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 12:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC1D10E9DD;
	Fri,  4 Jul 2025 10:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="axdZwFF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2077.outbound.protection.outlook.com [40.107.95.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6730110E9D0;
 Fri,  4 Jul 2025 10:14:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POFHL5QTcAbqQym7Gj/hekT7+Y8wH+Vw46LRUUtRl3UkmUD7jFEW3RW+1ebaoRyvdn653P/HIGHHZ4Fbwm5XFFeWlzyILoLdpkmHO+sIBOAxnxPKgA+6TI+vuCl74lzgERlWJTsCJJWgSJJ0qIIFLROUe49IgMerSMEvaYQn4v1F7MPQPvs6JzjLfbTeclVLI1FjHifZI6Y560KC98zG+HCzGBRGqstYv2A9Yni1zLujKv/a+aLo2vbJzsmGB8KfszCARb3fXyAgO3GKIqWAenzrIZAWd/JlxGldtWq4w81BG7fBTuBxoRr0N86ZKsMeCTPYf/H0z/d/MzO7lqxazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1pTyXJW6BDzoDr/o13Tw8RjJQBkB0IbpDGg5eipI6Y=;
 b=MRqPe9Q5g4cYPUumO2nN4t0iw3/x99xn2jeW7kxcYOJKCvqn8yl37694teMltPsgUIku3zp5TuoDOJp7aw+k1AfOeSPuraLyJXY/6Lsqi5dwsBi69dvKwC/8k4SSEmt5b9FQIwnnGSGtheNfquMSrI0ntXaOLgivBohkUinS+evi3B/VI3LxLUtNV/XLcRA3arqsahbRdRAuQmIbcioU7Zi8nxW5Zm1PYpdDw0CJRtPTUaa6Gij/wvKt9gbMH/9yT8beuJv/8VkepQInDCnls19RD2C8bRrdp/AyUkd6Vxrx6b6eNnPDZPBOmO/aIVgi62AgklXqEuL8Cp/2RcbpFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1pTyXJW6BDzoDr/o13Tw8RjJQBkB0IbpDGg5eipI6Y=;
 b=axdZwFF3y9cj2pFEXKym3T69xfIrEDxFy6Jt1aGlPM/zWYk0JHs4wZBj6U+iwSY2QPZlWv1/Xb+w0CyPBwWZqSAooS7MaXnHDfGKKcTcXZDRl1SJ8rJnU1p+CjzLZkD9+djOs+PVBSfUb0EO/TO53rAkx7LYZUY5s/HvSjZcUq4=
Received: from BYAPR05CA0085.namprd05.prod.outlook.com (2603:10b6:a03:e0::26)
 by SA3PR12MB8763.namprd12.prod.outlook.com (2603:10b6:806:312::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 10:14:11 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:e0:cafe::a4) by BYAPR05CA0085.outlook.office365.com
 (2603:10b6:a03:e0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.14 via Frontend Transport; Fri,
 4 Jul 2025 10:14:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 10:14:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:14:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:14:04 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 4 Jul 2025 05:13:59 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <gregkh@linuxfoundation.org>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ray.huang@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <victor.zhao@amd.com>, 
 <haijun.chang@amd.com>, <Qing.Ma@amd.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Samuel Zhang <guoqing.zhang@amd.com>
Subject: [PATCH v2 0/5] reduce system memory requirement for hibernation
Date: Fri, 4 Jul 2025 18:12:28 +0800
Message-ID: <20250704101233.347506-1-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|SA3PR12MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca03fe0-c266-4455-f646-08ddbae38510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gtu9nSAW5o9k0rgtfbFIYCyqTw3y2SCr0LviOm9895dhqVpkaTTuhErNSaKx?=
 =?us-ascii?Q?KRfKgRWKtdQmAs4twrYvHRzJZol6huCoMNGJ6QPy3sa9q3OabJZKqGyKdf+h?=
 =?us-ascii?Q?UCn0UvH9jBepoh7t347Uc2+3bc7cusf1+DS6Kuvsa/LU6cezUrPaSyZTBHNa?=
 =?us-ascii?Q?68ay3KECTiyv7X8QbEWdxHawhmxeRr+kk9WpiNdY9VwDW68KpgB+++QRV09E?=
 =?us-ascii?Q?t9OLwYp7ZO9qRxx6FZhXNqiR6Ynnhe+m3ztLv1v6LiAOgv4mbygzFwsYB4vN?=
 =?us-ascii?Q?51f2je4M5CiTrOdwyloY6gg+aqF+4g2SZ5EmoJXkJHNOWzlGYkUSwbqE8uqT?=
 =?us-ascii?Q?LViQkj8NsUzaRokfJSvpZXMulyxdWXwzdZ+Yhtx00snByjYfLDIT1o4ByZXX?=
 =?us-ascii?Q?CGsNl8/MNjOoaPdSo2Sv7zktCG+gnJ58fK2EDKH30fEJw+ZrItBUpQr5Fh3i?=
 =?us-ascii?Q?WkAHZ0i95aZhdeId/r6kNNiZJMrww1s0eoA8/Zf9eFZE1G9IARc7h4cQMsIk?=
 =?us-ascii?Q?KBfpuJ9PNEjEfZAPddeFK8VsYe4L4Hq9ZewpUbqK5IteAXPAX85kZI0/Wue3?=
 =?us-ascii?Q?0z2VtxB3L+ja1xxylAmm/uIIaWZWeSilFo3v2JoMHKDn7c0GWtB9D7ecIqLV?=
 =?us-ascii?Q?FvS3inV2nFkLOM26yXuRRyX0iVH75ooYkzRYYWIscKJ/epAW5GNgMsdgJyLn?=
 =?us-ascii?Q?PKJZR6VXyyEBg5rek1Fk4eu/XpVVAo6a273jQqz7A4MrWQX/0w64a23PpaO1?=
 =?us-ascii?Q?S/FyYQAQ6GbbpdT+3n7PaoFr/Xs2xwo7yCjVXApqPt2klkG0O83C8gaNA5BU?=
 =?us-ascii?Q?ar1UBc48Rw9naHWqI8nNKnMW3cL8BNz+YquPHf6/AroQHSTZyZD6y+BzdFLQ?=
 =?us-ascii?Q?24Ch1BvRuTevlOgVSdyThGrG+EBWgz3OMFkAbg3XW9IkRqtPw9reoP1GiY79?=
 =?us-ascii?Q?2M6KqfCKsPsHNQkvXkkcYmWyKQNhFs6aXNb19z8M1Q1muAF0oCDmDIF+xIz0?=
 =?us-ascii?Q?WA8W0PU7/Xx1RALahw0/ezg+z9+avxJioOElFl58mrhaNvdE4tqzZQNjYTAT?=
 =?us-ascii?Q?ztrlrSvarEnBUtx7g/kUFAvv5Zwv23EnelWLhO/CS0IM0cYhdCGdjLvUOE/W?=
 =?us-ascii?Q?B5hNNPgQAZl+ss+ntmHoIX0IA6NSBEo40Kz/F1TrlXiPxNg1LFdGaGeycNyA?=
 =?us-ascii?Q?8bS2fFFwERIamnisuPYUOyhE2pq3lM6znV/WwGmw9prYBU/shqX+9qoW4JDR?=
 =?us-ascii?Q?rRpuZq5xhj7C2SYMX38L/RrMvxXGn11V5wK7a9y209YeCDqB6yrdArQOZ+my?=
 =?us-ascii?Q?dwOSzsLzjzWwT5VttB/yvs1gdaJHDzCsev2HSIApKRjz7pmV+LOci/k0pFOz?=
 =?us-ascii?Q?LNOvs/p5T3ccG8DufMr/XxOGBA0b+3NggpZy9QPYO0SzLQlesUE95QPspt4F?=
 =?us-ascii?Q?MwXlJ14zARGFK7dssz2EsASQ5vDnZyLOq2JUx5JIeEgUcJggUV6wFkRTuHIq?=
 =?us-ascii?Q?uEdVWG1ij3y1qgreidjXQajwDQTXrP00068ZSp4kjUfhJXNpajZcqZqaog?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:14:10.7967 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca03fe0-c266-4455-f646-08ddbae38510
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8763
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

Samuel Zhang (5):
1. drm/ttm: add ttm_device_prepare_hibernation() api
2. drm/amdgpu: move GTT to shmem after eviction for hibernation
3. PM: hibernate: shrink shmem pages after dev_pm_ops.prepare()
4. PM: hibernate: export variable pm_transition
5. drm/amdgpu: do not resume device in thaw for normal hibernation

 drivers/base/power/main.c                    |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      | 10 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      | 13 ++++++++-
 drivers/gpu/drm/amd/dkms/config/config.h     |  3 ++
 drivers/gpu/drm/amd/dkms/m4/pm_transition.m4 | 15 ++++++++++
 drivers/gpu/drm/ttm/ttm_device.c             | 29 ++++++++++++++++++++
 include/drm/ttm/ttm_device.h                 |  1 +
 include/linux/pm.h                           |  2 ++
 kernel/power/hibernate.c                     | 26 ++++++++++++++++++
 9 files changed, 100 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/dkms/m4/pm_transition.m4

-- 
2.43.5

