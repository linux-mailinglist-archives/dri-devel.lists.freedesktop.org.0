Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D3CF0B5A
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 08:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C5510E33A;
	Sun,  4 Jan 2026 07:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q2p7KnH2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010010.outbound.protection.outlook.com
 [52.101.193.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506C910E321;
 Sun,  4 Jan 2026 07:22:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNI1WynM5pbGX8sRDhSdoZZ5MI4yPHO8lcQH+RLRMl5ZgW0th2duHcXPBMP3iB8mKOluxKUQLidx8M+7nFjDLAs1RORveRKEXPuesOSEfi/6dnEuPywJ5h8L5Cv97dnr4RDOLC7CVJF/PPWnIWbjtpa2xT2b3vqsMxVh5ixsoLBk3YePGQsYzZUco2ZwYthhN6QMDM7afjmyQJ/POhM10xs6D9TyLRaWGuEli8JUUBmW2teHkr7cRPCuWmPRXuZn0O9i/fH02tb/brCMTmTpAzYYdMxdgOMfiDd7IyJy/v1AczO1NMJRNgbXMn5OD4AD1B8IZBwO+2J8QcvNpmYvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8M3QqARMEL1WjeYOmNLK2B8sXEdgGqFrC69ulfHJngE=;
 b=ClkVFpFuqBmmKNqLvwHM/Z8IiTkSdWPZgvbVfYfSoutHVvJa2d2Zt8nDSg0LII69kJPtCmw0+4Yus00cusBBX4D9uwDpYQ5KdVSBFiuR7gXGA2yLt62qd4M7IaYJTfMzuyG/u+Q1019W6vyNAkx7pMBtAYxwW3hcQa5a8NuoJq9VVg5Znc4NRtu63ZE9m3fAmDd2JMVxdjH/zyd/1siQufsUTCOcRsL47bbHuw7NMgpW4ccz2xfEpi5syO8QjuLLD3qVh3ljBCKidHqmHPH9vh3xYIY6LYQGqkXYGQrOFl95VVeZ8Gm6/gOKGG04e/ihfmDg2Xe14HRro+8raA/hwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8M3QqARMEL1WjeYOmNLK2B8sXEdgGqFrC69ulfHJngE=;
 b=Q2p7KnH2UbcdcgWTV50MNQusWOuxp2OmxCGnY6uLFRcqHSaVYL4w1RiXlRFMnhVNHgyGnPi3FeldLwLXJxtTADUhBp+lfuc05vJdAq0TeXyHIYJIvUnPT//rXMhK0dvZ6MnUCUyGuiKHAr3CsjI4bzyeESu00hHzUVf/85mFqK0=
Received: from MN0P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::35)
 by CH1PPFDA34A4201.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::625) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 07:22:12 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:208:52e:cafe::f1) by MN0P220CA0012.outlook.office365.com
 (2603:10b6:208:52e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sun, 4
 Jan 2026 07:22:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Sun, 4 Jan 2026 07:22:12 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 4 Jan
 2026 01:22:08 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v2 0/4] drm/amdkfd: Add batch userptr allocation support
Date: Sun, 4 Jan 2026 15:21:18 +0800
Message-ID: <20260104072122.3045656-1-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|CH1PPFDA34A4201:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b42585-6303-4ad7-91fb-08de4b61faa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hQtd5nMp7v7bzVnid4ZS11fPNpH2iydBQ1wQ2POfMzhJ5fZxOcsO0SvzYZ+J?=
 =?us-ascii?Q?jov7sEUozqfHva0vLSbjUHF7MWDplkHQp00g6wdaLZU2G9fRAmSEVnPPmAgs?=
 =?us-ascii?Q?8t0LMmc/sH0lDkls50Vd8MuITi5sXz/X4h8BWUrQ4Krtwo/wYZWPoZCtxIxd?=
 =?us-ascii?Q?nMZJq+AJvw0+U+WtRvPQgJvwLOx8b9xpBJfxgpW/Pv81Wt2W21K3KegxByH4?=
 =?us-ascii?Q?tbm8I+eCbvvGfMSJFn0xhuM+w1MQyi80rjBKsdKzo/RU6DJ7/DinRj3kRd8Q?=
 =?us-ascii?Q?T6InR+dwpWKW5nFyg0tdLGNiKM4N8VKq72i2cX9K/Y3teW3OlqTGWXW5jq3k?=
 =?us-ascii?Q?id/YqEjiTQgpYo0Kn7ilHZUpyFw4aby0guuwKxXiJZGW8RxMhhBQLxdu5IRh?=
 =?us-ascii?Q?POVA58NJsTgs3TZcHz8qkQOzHSvuFdSb6Ko2ZLLFmfNcT0AYtURnAe2rK9bB?=
 =?us-ascii?Q?Q+B5WXc11UEM2lGinFwx6iJA+p+cVchaqAesFc3Jmq+sb3clQrb4ZMVvIrKr?=
 =?us-ascii?Q?7YnavpJaZGEdSKgtOQ2h+iHCHMsIoyNPd5RYGY5ZdbQXyt9t8obnfttfGDQ/?=
 =?us-ascii?Q?rFxRF9yYur8V3vp0HP2zAR8E2BxzSH8mzWnOQNaZ5g6ft7lHgGObQ4wHkrU8?=
 =?us-ascii?Q?ldmOvaYJfQcPcK3k6OX2MCBazystQ1Q26zVPyFp3CucjKVeYhFvcL7Q0/6XS?=
 =?us-ascii?Q?WuaeR4P9CJjCqvDiLlMk59+rhkoiq3HHuiFCpo2mGaS+YSSLGYgTypNz7rV8?=
 =?us-ascii?Q?QjZl2YniVmHMFBZmIiKj5p7S29X4kykxZ1/E3b6g8vntWwuPwJqAOVipahTA?=
 =?us-ascii?Q?AG4fCDCezLSUP8Qfvc2qY8uGPM1O3W9MdICq3vP5WEdLwV1u4uUCYM9DhZei?=
 =?us-ascii?Q?QdWr/AEDjI7dBa7ucd94JeoajhOB2BQOARwcSkpiQ/VuFWIY+4QxtbRL15XP?=
 =?us-ascii?Q?sAz5nwIz8MTdaTj43XPRDupugQG1KmBxf+xKjk/4HDsIelKo0aayzLwqywpT?=
 =?us-ascii?Q?2/Uu8SkzkcPy/p/otooSX5ZmF1H1lcrjIXtBmxXGXwkVrjME5HQn5kEYRuSw?=
 =?us-ascii?Q?WW7CR3xJv0R/K335KUevYcEnOZ9qWC+6JfoppTBqjwtLSfFlsD2mJVrGSBX7?=
 =?us-ascii?Q?x7e1J7UW+3BdKSfMHGdMpUdFHGfuZAN9GxukxwnFwOmehqqD9gcIuCh5fgH5?=
 =?us-ascii?Q?eJCp1EVyoJjEp/3TH//mx6eaQ21TRm23HtF+RwbjdBg0ihj9b46ZVK+5YirG?=
 =?us-ascii?Q?GzEkML45iORIWcSZzYyJdpK25/cj06kpBIzA+JP3Js2fDiLUdviH6X5I1tgN?=
 =?us-ascii?Q?Y0gi/p8LgF3YiLFijWOVEJjLoWKBWbHvBo1ovbT4S1h5INast2BNi1LUOIPP?=
 =?us-ascii?Q?sEYwYovYn8gLDARQBVv7YlA2AhZo543naKoD1Z+laaGbnCjw7zkJ3yzBV02I?=
 =?us-ascii?Q?3rYPALzuXnX2Rh/jmmrIg0C2VISM3A0WFjAMlT0/3Ym6x2blvv9EOLCqxLNA?=
 =?us-ascii?Q?+prMa3QNCa4KHtvcOUPY0PE9mhXW/j02Pba4SWHqOOPBcvHfgR2KIlW/aNCq?=
 =?us-ascii?Q?GpTRLfm5Pj2CvdIKgDe7RBS41fgDmsTec16jD0xx?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 07:22:12.2020 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b42585-6303-4ad7-91fb-08de4b61faa8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDA34A4201
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

From: Honglei Huang <honghuan@amd.com>

Hi all,

This is v2 of the patch series to support allocating multiple non-contiguous
CPU virtual address ranges that map to a single contiguous GPU virtual address.

**Key improvements over v1:**
- NO memory pinning: uses HMM for page tracking, pages can be swapped/migrated
- NO impact on SVM subsystem: avoids complexity during KFD/KGD unification
- Better approach: userptr's VA remapping design is ideal for scattered VA registration

Based on community feedback, v2 takes a completely different implementation
approach by leveraging the existing userptr infrastructure rather than
introducing new SVM-based mechanisms that required memory pinning.

Changes from v1
===============

v1 attempted to solve this problem through the SVM subsystem by:
- Adding a new AMDKFD_IOC_SVM_RANGES ioctl for batch SVM range registration
- Introducing KFD_IOCTL_SVM_ATTR_MAPPED attribute for special VMA handling
- Using pin_user_pages_fast() to pin scattered memory ranges
- Registering multiple SVM ranges with pinned pages

This approach had significant drawbacks:
1. Memory pinning defeated the purpose of HMM-based SVM's on-demand paging
2. Added complexity to the SVM subsystem
3. Prevented memory oversubscription and dynamic migration
4. Could cause memory pressure due to locked pages
5. Interfered with NUMA optimization and page migration

v2 Implementation Approach
==========================

1. **No memory pinning required**
   - Uses HMM (Heterogeneous Memory Management) for page tracking
   - Pages are NOT pinned, can be swapped/migrated when not in use
   - Supports dynamic page eviction and on-demand restore like standard userptr

2. **Zero impact on KFD SVM subsystem**
   - Extends ALLOC_MEMORY_OF_GPU path, not SVM
   - New ioctl: AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH
   - Zero changes to SVM code, limited scope of changes

3. **Perfect fit for non-contiguous VA registration**
   - Userptr design naturally supports GPU VA != CPU VA mapping
   - Multiple non-contiguous CPU VA ranges -> single contiguous GPU VA
   - Unlike KFD SVM which maintains VA identity, userptr allows remapping,
     This VA remapping capability makes userptr ideal for scattered allocations

**Implementation Details:**
   - Each CPU VA range gets its own mmu_interval_notifier for invalidation
   - All ranges validated together and mapped to contiguous GPU VA
   - Single kgd_mem object with array of user_range_info structures
   - Unified eviction/restore path for all ranges in a batch

Patch Series Overview
=====================

Patch 1/4: Add AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH ioctl and data structures
    - New ioctl command and kfd_ioctl_userptr_range structure
    - UAPI for userspace to request batch userptr allocation

Patch 2/4: Extend kgd_mem for batch userptr support
    - Add user_range_info and associated fields to kgd_mem
    - Data structures for tracking multiple ranges per allocation

Patch 3/4: Implement batch userptr allocation and management
    - Core functions: init_user_pages_batch(), get_user_pages_batch()
    - Per-range eviction/restore handlers with unified management
    - Integration with existing userptr eviction/validation flows

Patch 4/4: Wire up batch userptr ioctl handler
    - Ioctl handler with input validation
    - SVM conflict checking for GPU VA and CPU VA ranges
    - Integration with kfd_process and process_device infrastructure

Performance Comparison
======================

Before implementing this patch, we attempted a userspace solution that makes
multiple calls to the existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl to
register non-contiguous VA ranges individually. This approach resulted in
severe performance degradation:

**Userspace Multiple ioctl Approach:**
- Benchmark score: ~80,000 (down from 200,000 on bare metal)
- Performance loss: 60% degradation

**This Kernel Batch ioctl Approach:**
- Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
- Performance improvement: 2x-2.4x faster than userspace approach
- Achieves near-native performance in virtualized environments

The batch registration in kernel avoids the repeated syscall overhead and
enables efficient unified management of scattered VA ranges, recovering most
of the performance lost to virtualization.

Testing Results
===============

The series has been tested with:
- Multiple scattered malloc() allocations (2-4000+ ranges)
- Various allocation sizes (4KB to 1G+ per range)
- GPU compute workloads using the batch-allocated ranges
- Memory pressure scenarios and eviction/restore cycles
- OpenCL CTS in KVM guest environment
- HIP catch tests in KVM guest environment
- AI workloads: Stable Diffusion, ComfyUI in virtualized environments
- Small LLM inference (3B-7B models) using HuggingFace transformers

Corresponding userspace patche
================================
Userspace ROCm changes for new ioctl:
- libhsakmt: https://github.com/ROCm/rocm-systems/commit/ac21716e5d6f68ec524e50eeef10d1d6ad7eae86

Thank you for your review and waiting for the feedback.

Best regards,
Honglei Huang

Honglei Huang (4):
  drm/amdkfd: Add batch userptr allocation UAPI
  drm/amdkfd: Extend kgd_mem for batch userptr support
  drm/amdkfd: Implement batch userptr allocation and management
  drm/amdkfd: Wire up batch userptr ioctl handler

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  21 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 543 +++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 159 +++++
 include/uapi/linux/kfd_ioctl.h                |  37 +-
 4 files changed, 740 insertions(+), 20 deletions(-)

-- 
2.34.1

