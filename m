Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A82AFC492
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8862410E5B2;
	Tue,  8 Jul 2025 07:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ogo79nKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1846F10E5B1;
 Tue,  8 Jul 2025 07:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ykgNNKZC/U3NoMvZ6CXndxLAVXz9H+5uJcNQGrBY0o7JBtdyJ2bly6bHEcFKPfetf+xoT5xAY8tDQn16dw+eNFdDsMrAOYBlBvPs5b0GBvBTpnjuQkpveyuqEHPuLIvOIYhisY7JosKPLeN5tQOnKbg9GYghLkEGRhU7ICgqzMlp5I3NlkrFIm+E6BQSrljPMEKCjDbzJba59+ldbtN2iQMFibTKX7ZvW79w3MjxhXUTM/GALWMWF2AUkbbIsPdRWwsk4+xWpVTwaf0qHaxRCncqYBSHP7Ck/InurhteENnapz2pZE7fZXVVEsyV+5D5vHEVFmYXjzVyiX6286VR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kk+d4hzbuJe50USVOvuui9ITaszWmMDnIMDzEfYFToo=;
 b=iS8dUwwGyM/BRyoRkooKgg99x5C8Nr3xq1aiaH4iiE0wD3RFNcVWvqN0yuUCg5S3+0aP7UHsHQs91wUlalxSPTYu2JE9C5EX2I+InqA+cmTXHiX14FPH4LcQmo9x53xAceD+dQov+NuowWwlEPijYhnjLHqNTuOMzxy+s9KSH4Gcb5S6In56wc3+vYYGPzAodJfsTGOFbhY4aa4ZTBMWWSLrCGk3rSAMzy75eRanwkT/5b7bqaE+/h15tTN/OYz+ppPs8kANCO8VUY8YusNBoLAo43veFvRB7PHNmwxxv5jF54kPrYypgaoU8Tt/dRNvC9v9TdfyF+moyDdtbpizvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kk+d4hzbuJe50USVOvuui9ITaszWmMDnIMDzEfYFToo=;
 b=ogo79nKS+FWk8QSezFDnW/2qXIXBUyrLlNSOXSANvDGbbP5d7Dy7KQhsqGi6gPYzqoiiq3ebORUz2/U4NtHriYTu+5mxjFWuveLo65GGGlLwYsuryFae5MXU3lOsi7DmKS7nb2SClnMJSqDnu+HVT5eiQd+pef0jFS7kPuHs91o=
Received: from MW4PR04CA0150.namprd04.prod.outlook.com (2603:10b6:303:84::35)
 by MN2PR12MB4373.namprd12.prod.outlook.com (2603:10b6:208:261::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 07:51:24 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:303:84:cafe::e3) by MW4PR04CA0150.outlook.office365.com
 (2603:10b6:303:84::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 07:51:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Tue, 8 Jul 2025 07:51:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 02:51:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 02:51:22 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 02:51:17 -0500
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
Subject: [PATCH v3 0/5] reduce system memory requirement for hibernation
Date: Tue, 8 Jul 2025 15:42:43 +0800
Message-ID: <20250708074248.1674924-1-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|MN2PR12MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: ed8cbadb-082e-4c28-b66b-08ddbdf43c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x8X+flMea9yf6B7QMFHYsCTL6/pQDdJJFZgJWSJ7oVZ31YNjIUhjMwETk7Ep?=
 =?us-ascii?Q?IYg2mapepu+oXSjqpQRKdPQVhPh2n9IKtb8af3G4BTzKlEGkYFuBMR213GLL?=
 =?us-ascii?Q?y0qepjckwToItw9NuZLCoHzjjOgQ6levO3thu7WG3JgNLefA0Bj+5EZXdz7v?=
 =?us-ascii?Q?J2s/nr4yx4uUlQEGHHSaHBo5ZKVArcSOxQCHXU6VDiDqOxs5uSiVyTM64vSX?=
 =?us-ascii?Q?Fdog7HHZQItrkdB7lwQRxwmUfUOH0DXgpxz1CJabmtDkuYETlLWSPmldzqUV?=
 =?us-ascii?Q?AdHyJ7I/qFgKG2LXDuxxLlLT1q0fKUZUyHx9my8HUrhlEDoJp7NCZEG0JrWG?=
 =?us-ascii?Q?w8tMaVhzT+lzhb/ECsKiHj9wj7871ObfIHr7s42zpy3wFwSwSe5J6keVDHKE?=
 =?us-ascii?Q?cEQY2ILxyBMZEnnwyL+mQMT96YoVpek/0wSOCp5XSV29uYDqLjhQJZmi30MX?=
 =?us-ascii?Q?cisLOyLdKXYYkSYhGzhy/Hy91xwWxCL14ZJx5U6kr+CmH/p8ghME1nDDKaVq?=
 =?us-ascii?Q?H7+Ml0QE5UBjf9Ob3D69BJsv4FDdCJQJKNzFYM02mJAsUxYRlX3ttkXMVfz0?=
 =?us-ascii?Q?JNfFix6tN2kvnGlwrXf9h1bYeGQPpv82LlAS740UBKbVOUI5h2glEl9oGO0l?=
 =?us-ascii?Q?kKnRc1mqinzIag0YJ+D89JQbXGPBOVVFtAx0Y2KMOX5g9/NShQMFHSGHYh2Z?=
 =?us-ascii?Q?Ajn7vnU142UOCKkga0u6LKh5RF7/wGNJ/R3ml72Lx6ACmf1sTO3IJLCe8F9H?=
 =?us-ascii?Q?7rJpqa9cfjfUMfV3m8HGEf110xzKDhrnINliOwYpqCUAXWCP8vVm7g9qCOUQ?=
 =?us-ascii?Q?Ay28SyG/k/5tn9PbMpLPRtjrOZa1+ZLS9dNwNsAnbzPUnmPXz/gwV+Ib7/XD?=
 =?us-ascii?Q?YNM+ifeQpFm0jJIfQG+rM7+WC1iU/xc7KIkWPFty3+KMtSbNPSWQctl6VuIq?=
 =?us-ascii?Q?xlLqHJP4MYSmFE478UqgFbOG/RO7elZlDuWgxh73hzwggYUembI12bpWZKya?=
 =?us-ascii?Q?T6dc+7Rf7eUFAjxuptDAD4RU4FWkGLI3C4lVeWRRK3TbK7BkYhikuydJH6gf?=
 =?us-ascii?Q?TuBRX7HCAnGL2Ra9LLNzZXy6Fb1F8IPEp8B5wDpFh/ZwX5xpTqMpdWIFk6Cn?=
 =?us-ascii?Q?FPETQ0/xq7eutRvnNSZpPP9mViShAUI1goTLOEcgLTc7Xtg0YQBe6p+s32/5?=
 =?us-ascii?Q?bObh1Dxb72yKQVqmljKXPTspqmDE9hmovymztDUj1hBCcoJe0mZ0LYDDBdDc?=
 =?us-ascii?Q?YMwhJSE5QaAEKas+STRTCthfu5oKkWB1B1i/vW8eTc95LwQru9kQfL+MT0Di?=
 =?us-ascii?Q?EJHn9JTTLY075YLGeGirUZHHoo8EsZy/bv+jWSQtxH3vlfx13BuZbtGcnSsC?=
 =?us-ascii?Q?LFJdVCRL8gcbO9BmSscvcmIKLvDpn3DFlfFRdhu5Naa0TfptGl/EVM3ToVYF?=
 =?us-ascii?Q?cxAHnqV71SgSocnfTIwuYHbGmV5E+sdbBV+lByLgfAcm58Q51aePlpbhRCow?=
 =?us-ascii?Q?odiaq62FU14NLrQih5xUPh7jpxsl8glsaTqJPCQC/YsaqwzlJcjtDc2obw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:51:23.3123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8cbadb-082e-4c28-b66b-08ddbdf43c19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4373
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

Samuel Zhang (5):
1. drm/ttm: add ttm_device_prepare_hibernation() api
2. drm/amdgpu: move GTT to shmem after eviction for hibernation
3. PM: hibernate: shrink shmem pages after dev_pm_ops.prepare()
4. PM: hibernate: add new api pm_transition_event()
5. drm/amdgpu: do not resume device in thaw for normal hibernation

 drivers/base/power/main.c                  |  5 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 15 ++++++++++++-
 drivers/gpu/drm/ttm/ttm_device.c           | 23 +++++++++++++++++++
 include/drm/ttm/ttm_device.h               |  1 +
 include/linux/pm.h                         | 16 +++++++++++++
 kernel/power/hibernate.c                   | 26 ++++++++++++++++++++++
 7 files changed, 94 insertions(+), 2 deletions(-)

-- 
2.43.5

