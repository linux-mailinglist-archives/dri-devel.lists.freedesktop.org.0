Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51775AFE4FB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 12:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0BF10E77A;
	Wed,  9 Jul 2025 10:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bm/3AjL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613A210E77A;
 Wed,  9 Jul 2025 10:05:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6eoyucfOdgDnPOG1lPmBxfur/grpwgKWn6yxFMvDiljAcQRABw0Lp0g1LzagH+wXD12/a5hlJ2w5clvgtCDoYroJjvEyMLyj94Ac6ny9YCaQYsaXd9H1149LTV7kyUgDpTXYGSQyYrunuT9OXQDGRpLTPVpq3YsQciPi2nIPCxLkuRnYGM/UjhhKqMwLGJg5wYyeyupf2W42UFntbNhoi++bgc/9zkekcn0oE77nKRGHz4pstYwiFxf7YZ9tjIDbEBsaqy49+j/kkQs8zxcvitbya7a//gdZpd96MRKcP0ijKFIYSvnkywVffc9ZbtjWuLVhVlj/8d/rVb902fhcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+Ii46D5z9lMOd0y2VlDdiYeeZr1BdwlBDjPRSbmCFw=;
 b=Fcd+nX/joDLWQmTLxFKY4xUHjFold2bPZptZbARjuVPyPnPTzqRnU5EH6IdpjKsw9oXR/6Swqp0oDkJr/78/H+DMzLhtt5VPYguQezboqYHlnM1sw6qfVxTO1p9fzSwQWro8g+KdLB3ctUk1BYb+JwHPp3Xy3TKC6K5UUe1soMqwtwFmsKF0G5tbMjE6zB9d4/v3nNM/rQMvIcOXMWJot5Db32Glw/q2ZJo3E/tfH7x7XinwHEWqaI4LWtYdh/8qkDWOlT0a14mgOU5FNx23Gnjc0l4ECsS6BYW+MBhetYkeo5lOjqNPsnjrvXjVkutxsWBv9IP/9NSR4Pdhud0Gfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+Ii46D5z9lMOd0y2VlDdiYeeZr1BdwlBDjPRSbmCFw=;
 b=bm/3AjL17m6FpvhYqvkC9o+EolJG6ntXkBR2BH6yyAuoqHVxHtCN+xU/p6sQ7ip15Gw1NSBikIyajXdYcmTk6YLMJ68ik8nD1UgBFBr37rhJd1J5PGXf6Me+wnxa3BuVTX6TmH584ZHRuSJ4d4eVroYWn5ecVmaw8COWe6SobFc=
Received: from SA0PR13CA0013.namprd13.prod.outlook.com (2603:10b6:806:130::18)
 by DM4PR12MB7670.namprd12.prod.outlook.com (2603:10b6:8:105::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Wed, 9 Jul
 2025 10:05:31 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::c2) by SA0PR13CA0013.outlook.office365.com
 (2603:10b6:806:130::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.5 via Frontend Transport; Wed, 9
 Jul 2025 10:05:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 10:05:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 05:05:29 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Jul 2025 05:05:24 -0500
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
Subject: [PATCH v5 0/5] reduce system memory requirement for hibernation
Date: Wed, 9 Jul 2025 18:05:07 +0800
Message-ID: <20250709100512.3762063-1-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|DM4PR12MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: ac1fa3b8-2227-4aa1-fc25-08ddbed02314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SitHb2hUdmV1SVBVemM4RVJqTFd0dy9HNnJkbDhkRWY5d284Nnl3aXo5c3lY?=
 =?utf-8?B?UElQZzVsbWI1ZElucXFoZlA4YWJlZkZYM2k2WjJhNlZJL2FTb1BueTd4WGVE?=
 =?utf-8?B?bHpEMEtHNkUrVENndkt5MDgzZnlYdjluYWhJVDNaWnhNN3RXdmdGNWU2UTFv?=
 =?utf-8?B?cEdmU3FMTHNkY05FaDZUNDhjd2pQUEVsV1A4c2NPWG1ESXhjSy90dU1JZHNB?=
 =?utf-8?B?clVsVHNTbm4zWUl0c3FuNDl1UWxrVCtKS2h2OWRiZ1YyRjlFNlc4bkZHNFBS?=
 =?utf-8?B?R2k3YXM4ZmhaQzlFM1ZrNVl3RUp5WjBvWUt1QjlVUEhyRWE4aVJIeUJOZ1dY?=
 =?utf-8?B?SGFHT0IvY1llSHUvcm81cTZCS2NqS3RHYnVLRDBUR2NtakRsR3I2WUhZQzRz?=
 =?utf-8?B?RXpPanFnZ3Y0bkhDSEJZVDVPbEh6NG9NQ0U3VFc0SEVseEc2NTg3cGZvTEpi?=
 =?utf-8?B?NktWWURNSWF5YnNHeXFhMUdQc2dSd1JQTEl3MkNlVGZsb3pRM1I1MHNSZlpN?=
 =?utf-8?B?c29rZWdTa0lmV1dxWFRrM2xQT0hFNE50ZnI1bXdKK1FDYXFZOS8weGd6TTcv?=
 =?utf-8?B?aVhRRWNLZ3B6OEp5VU5DUFQ1Z1I3MXBuSDZkRTFVZG84K0xJQmkvSFpkZ0w5?=
 =?utf-8?B?dDNiN3JvVll4YmhMbmFaVUljYjdyWVhIOHRKZ3FPUlZrNlZRN2tNTkVmekFK?=
 =?utf-8?B?dGNsKzBHQXZEcysvdzdzaC9OdHBoK2IzSmdwZVF6Y01WRm9GaXorRlpoQzhq?=
 =?utf-8?B?aEdtbWwya2hWS1ZQWkJlQmI1dlNSYzJDL3lIMXJsZ3JvM2p2VEtaNDE0YkUv?=
 =?utf-8?B?d1o0ZFFMUXdEY2Zoa0lEeloxcm5OSHRQanRGdVB3Z0RqWGIxWUU0UFpxcHly?=
 =?utf-8?B?NzZSeGJMb3JwTGw0dHVLUDMwZC8yVU5pYW96diswNGhpbFVkSnl6eWFnRzFX?=
 =?utf-8?B?YWpoLzhBUVNrb1o3eS9tWmJLRXBXVVZxUjdJVkxEZ2ErWnNEMmhNaTh5eUZ5?=
 =?utf-8?B?SEJjdEhEK2JFNjVIWml6N0xuWmdQM250Zm9LQzdvNDBMK0lGMzI0TkRWeXN2?=
 =?utf-8?B?enZLakM0SVgyNHVRRUptWE1Vd3FuTEYxbFR6RVF6SElHeVBQNi9vcjVrajU1?=
 =?utf-8?B?MkxkbWc5Mkt3N2JLanpHbmx5eUE0VTFJT3JpTEhBVjF3eEVtT01CVnZUNjZl?=
 =?utf-8?B?Y01jT2FyNGw3SlNzYmdMUlprR294RlgvZlVGRG9Fd0FzeDVZUkJRZE5RNGVT?=
 =?utf-8?B?dGxKdTIvcGpDeTkxRzY1eSt1ajExSG9LbTJCdDgxVHNHVnFJY2ZHQ2huNVFi?=
 =?utf-8?B?SXh5d0RZbHl5V2Y1SnZNUTJocndNU0g1dWd6Z3QrbDg1NWpPd2VhbHFBYTRB?=
 =?utf-8?B?dFRMeEQySHgwcytLcTFNWktmMzdvMUwyQ3N3bHhuK2JweW1VcTF1eHJWRFdi?=
 =?utf-8?B?T25MWGRVc2o0R3JJK2svdDZBd3RQU1dGT3kxbU9sL284Z2QwWGoyTnBUcFBF?=
 =?utf-8?B?c0FPSURWcHFnT05Yc0JwZkwxNXplSXkrd3pqRkxHSUgzZ1R6M3o1Z2lQQkhz?=
 =?utf-8?B?a21ROE5wTmtQMURrTEhKU3ZwdFFHaG93UklyWGtWd3ExbHVUaCtvL3VTUUg5?=
 =?utf-8?B?Wm9iaFFJU2pQdThMZU16ZkY0QjNSTVRMRFNTZHdUVDBPcW1XN2VhWC9NRk9B?=
 =?utf-8?B?NXRCa0ZCTHJrTzB5QnBTbXViV1lZVXY0TWNrV1hmMkpvaExJeUxBNS9MeE44?=
 =?utf-8?B?aWJnOGtyL09aSFJRdEhWd2FpQ2JxSHVFNzhzbUJjeGF2OXVkdTVTS3B6UUhF?=
 =?utf-8?B?cWdPRnVycjJtZG5LQkhGTUZ3VzJPbEVuUVZOK2lvb0YvTjNiZGg0NDZpT0JS?=
 =?utf-8?B?bTJEdWFVTlZsUE9BTlpMZXUrWDNVT3M2c0c5UlRrWU9ybm5aNjkvdjlsYmxw?=
 =?utf-8?B?NksveHdPQTNjbXhQeWlRQWJZcU1MR3ZIWUlOOHhoQ1dKUjAveEViRzlwaXp1?=
 =?utf-8?B?NXIzejcza2ZJRFhUa1FYK2kvYSt4QjNmWjljeTd3WVJaQm80S09yNVVIVmE1?=
 =?utf-8?B?NldxWHp5S2FuazlLdSt6Tk9LVlJmd1AySE80dz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 10:05:30.6873 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1fa3b8-2227-4aa1-fc25-08ddbed02314
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7670
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
v5:
* add Reviewed-by for patch 1
* use pm_hibernate_is_recovering() to replace pm_transition_event()
* check in_suspend in amdgpu_pmops_prepare() and amdgpu_pmops_poweroff()


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
4. PM: hibernate: add new api pm_hibernate_is_recovering()
5. drm/amdgpu: do not resume device in thaw for normal hibernation

 drivers/base/power/main.c                  | 14 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  7 ++++++
 drivers/gpu/drm/ttm/ttm_device.c           | 23 +++++++++++++++++++
 include/drm/ttm/ttm_device.h               |  1 +
 include/linux/pm.h                         |  2 ++
 kernel/power/hibernate.c                   | 26 ++++++++++++++++++++++
 7 files changed, 82 insertions(+), 1 deletion(-)

-- 
2.43.5

