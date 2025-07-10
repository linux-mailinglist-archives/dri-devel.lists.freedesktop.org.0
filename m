Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255C5AFF9A9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 08:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8F910E871;
	Thu, 10 Jul 2025 06:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pSojoVll";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDCE10E0EB;
 Thu, 10 Jul 2025 06:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMRHDZZdQZLe0lNA5x/LhRvg/IW/DiYO/Uid0PGglJfu5nYiIE5a0CdWfZ3RkCLAKMcJxPTItCfmsvcFJPVmIT8qyhMR8vd3XaAOKyiT5q6sqTA0cOEeFjE0u6aCWayC/q+q3eMv/gBlKBjv1laeztZAIbJghBdaiT/M3hFILijWZKIOV2KvqGcA+ht2iNFDB3zNV5pCAsiWqIZYtEJJ5qw8i474zVuGCNczJmYLuSzuK4C9aYVnz2geGaU/60qCHsGai8cdu0HVHuSj6Oq2pE1BIXZeRfchx8j0DDYwiW9swjgTFG3QLtVyUuluEA3WXudqE3MxjIlz5Tk0EDrllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7hoXiNwMVSLoeSC6w8QymCYhzuCzXchAiP239CNuNI=;
 b=Dx1/rNC3Tbtp+1gWPxuAIVz1Hbgiq214Nq0H3PQr3XWfkP0iLO8MNirr9/U9O0m3zkaDeOJ9+fLnhz4HpQb+Cv80mPt3+8LsNywmHZFJRP1fWIlZ6FnHdW1qbXNwl3j5cxdyaAc2HadvM40JULWGcYQBoKgsM4YZbf9ajcKZVzNjb/2tD4hkzrhlA4/xvKlXIQA0OvRfpVZmttPGlJl1/z6HMWl1CmYVfB6dSmAjwv7aFH+jOprqf/UjjYQLN4ivtsMCnDZmSNhHC4186BlezZmDgiCyZNMf6HxdnZ2zw28fKz1Ab1KRdPLv3EJHw3DEmEW0+cqWqcoxmFKITYkK2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7hoXiNwMVSLoeSC6w8QymCYhzuCzXchAiP239CNuNI=;
 b=pSojoVll7R0m4aCEh4EGJ6XnFp5MCe7EImyst3qnuJV6GCDj6+LLUUbDvmW5PU4QisZx23s/4gqC89xglXSlhcd3GClmIyTkLOoOY6+DZB4B4vDTqP4Ip5vqNZvorkalD9ngGRszLURH+br4gXdZ4Q0HIGleyxLoyeIFIummCkE=
Received: from SJ0PR03CA0345.namprd03.prod.outlook.com (2603:10b6:a03:39c::20)
 by DS7PR12MB8250.namprd12.prod.outlook.com (2603:10b6:8:db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 10 Jul
 2025 06:23:28 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::22) by SJ0PR03CA0345.outlook.office365.com
 (2603:10b6:a03:39c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 06:23:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 06:23:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 01:23:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 01:23:27 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Jul 2025 01:23:21 -0500
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
Subject: [PATCH v6 0/5] reduce system memory requirement for hibernation
Date: Thu, 10 Jul 2025 14:23:08 +0800
Message-ID: <20250710062313.3226149-1-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|DS7PR12MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 4091ed9a-947c-4ecc-2d62-08ddbf7a48aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWM2bWRZbVhVcHcxc1FFc3AxRlZCSlNyMi9rc01tVkpLelZnMXdaZUVRRzUx?=
 =?utf-8?B?YjQ2NlZnZWJzdDFDVG5QeU43b0RBajU3YXF0RFVpUkVhNnJJR2p0L0ZTNGQw?=
 =?utf-8?B?YnVMRUhqbFZyMGwyUzhSaXE1b29xNTY2bnlzZXpER1lHUXVCVW5aNVZvZVIw?=
 =?utf-8?B?ZXBSMitDOFhGVXNuL0dSTHpZSDJXV1RHRnZXazV6ZTR0ekhzRXpSa1Q4RXVJ?=
 =?utf-8?B?cG1OMXNkTUFkOEdaY1VrTzNwL293VlEyc2tqU0dXbWVnVFFrTkt4UU0wM3lK?=
 =?utf-8?B?U1VPNHZzQTI2U0FoQXpsSmIyMm9WWENLRkFhZURwcml1VnJNeVFCN1IrbUlP?=
 =?utf-8?B?ai9HYW5UNHVlZnJyU005by8wb1hRN0xzYW9vMHZaNnEwM3FIRlhUUzJBenJN?=
 =?utf-8?B?U1Z0YjZtQ1NsbURuOWRHakw3L2pWaWFoZSt0VlJkSThQZml3R1JHaDJSUGFI?=
 =?utf-8?B?cFA0WkVWc3lXVDlKZkRscDFjaFNZU05XZkRlb3FFdksyQnhsTWFlSElqYnhQ?=
 =?utf-8?B?K3h6TjlUU1lqY2xtUVIyMDNTVGZmd1JOcTZyaXBVRWZnd29sRFNRQkJiSXZM?=
 =?utf-8?B?cTM3UWo4L0M4UVFLWUtDbExwcGlxRXZFZTZYNERFZWlUK3RWeGw1cExQU3BY?=
 =?utf-8?B?WDFiSmp0b3VOandndTRyWWI2NElWNlZDNEIrN3locjV2YXQzSENKR3JoZ2xO?=
 =?utf-8?B?bzNKK0hCbjRlbnVUZU9GUXBOSzBRTExjRHZBZWRFWEx3c3ZjamppQ2pEUnZa?=
 =?utf-8?B?Zm15cDBHdytVcTZJeVIydnMxOXA5Q2tEREVNZVdnNEtSTlR0QkRLb2grRjd0?=
 =?utf-8?B?RXVlTE1mRWFKY3l3VzBaNnd3VlV5empIakVhcldINDZ2YVhXM3MybFFSUlBN?=
 =?utf-8?B?cDQxSUxWL3BQYVdESTNNQWp5YktzZlN4aUVtRDRoMnpzSy9WamFJZ3ovV2U5?=
 =?utf-8?B?QXhKYlY4MTdpQTJMa1FJaW5jaUI4Y21qL2hMZHYxWjAyM3YxSjlWWW1ZbGpR?=
 =?utf-8?B?b09UZzI3ckVtS2RnSnlNVkl2T0kydFp2bVJ5VTQ1ODVxaE5XUkxhRjRmY21m?=
 =?utf-8?B?TWRicUU1aXI3SlU3MGZnRDc1RmpQSVlKY3hFa3F0U1RCTWNEMmJ4UDlWMXc1?=
 =?utf-8?B?cTVYclRvNUhPbVV2L3dRbXJVREozYVRZS0tRV2pQbUdyRXdRbkM3MU54NmNz?=
 =?utf-8?B?dTgxSlFDTFBhUFcwM1ZHZ1dRSy94TWpUZkFJVnN3WEk2eWhkR0laZjkzeWxK?=
 =?utf-8?B?RDdacGFQMmxmdVMvY3Bpdjl0Ni9kQ0QwVlV1Nk9ZUFB0eFRYU1dhTk5RZlls?=
 =?utf-8?B?eXN4WWhNWjNLYmpxVFkySS9sSjEzYUNLOC91R1hsSk9lQWpTQ1I0RmxIcHdh?=
 =?utf-8?B?WSsrd0FrcGI3QWRYRjFsTmJabXRKbStlUUVZQ3o2dXhTZ2FIaytZVFhIL3Qr?=
 =?utf-8?B?SlBkeS9IbHJVZ2R4d3dDQUIyUjdHZndrajhRK0FtL2xGNEpFTXFCLzMwTW1X?=
 =?utf-8?B?QzJIVHR6ZDFENHBsenBSdTVFbFN5MnoxSGxnbkttWEtRM3RRVTU1L2R1cmtD?=
 =?utf-8?B?Z25uZ1V0YTdqQ1o1ZnBDUU5FNWRHR01UYkRLSlNrcDhDdFcya1lST1hGN1kx?=
 =?utf-8?B?aEdHek51MHZDRTloTWFXdkF0dVJxZVdFZnBDMGx5d2pMM3pSWkJMSGx6K29O?=
 =?utf-8?B?TVlZMHRTQ3FVbmJscTByODk1NEhGQ1dZcit6UDQ5NWRPNmJleXBWNnMzVk95?=
 =?utf-8?B?emdYZUNRYW5WN1ZuWG1iT21HbitMZmNoQzBmMStJOXR0RXc0NzNORGxHcVpL?=
 =?utf-8?B?QjBvdDc4clk1NUFzNmdZY2l2NWxsU09aWDFHS3NqbmRBUnYvNG9GZHhseWI4?=
 =?utf-8?B?S05EUzg0WWllRkI2WGZzN3RsSGNYVFJUS09FZCtSTm8xUU5sWkN6YWJiUFl4?=
 =?utf-8?B?WmYyT3MwZWNpVklKS2hHNW9EMGsvYmYxd0twLzN1cUlvWWExL0FQOHN1U0RD?=
 =?utf-8?B?RDlaQ1ZFUFhrQW5LK2txc3R6UTFJcHhmQVRESDgwY1EyaDErYm0vOGZDZUpH?=
 =?utf-8?B?a2FPa1F5L3BDKzhjRXljNW1uUGhtbmNTTjNPQT09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 06:23:28.1675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4091ed9a-947c-4ecc-2d62-08ddbf7a48aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8250
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
v6:
* move pm_hibernate_is_recovering() from pm.h to suspend.h
* rebase to next-20250709 tag of linux-next
* add Tested-by for patch 5


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
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 17 ++++++++++++++
 drivers/gpu/drm/ttm/ttm_device.c           | 23 +++++++++++++++++++
 include/drm/ttm/ttm_device.h               |  1 +
 include/linux/suspend.h                    |  2 ++
 kernel/power/hibernate.c                   | 26 ++++++++++++++++++++++
 7 files changed, 92 insertions(+), 1 deletion(-)

-- 
2.43.5

