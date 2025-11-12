Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C73C50F5C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783CE10E6BC;
	Wed, 12 Nov 2025 07:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sVxBMO2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010024.outbound.protection.outlook.com
 [52.101.193.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A3D10E6BB;
 Wed, 12 Nov 2025 07:36:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xR0U5NayTWzUpfBzND4KTseEbcpt8O/tejgMpd1oIIYDxrzO/lrVoGcHQ9I8fbP1BGziXs+eoWA+rM2u4csfiiZ80jv8zE9Cdez80qmTc0MArrNDUQx5ZToH/Vq2FtrK5P1o3gTS1wdVRjNRf6fh1EpcFB1jpSWW/t53GisqTJIslydyBfJXVyP9apWtXRHsPt2WkBhWrvuUYVpMR6HEdfz05UdJenSjMw2qYNbq2g3j7B45UUNDS/aCAdUuYwIlApFC1dnuQVl67OghaKNxl0xhCGL13QMAwk/tlVVY1Jd7AP/P40TBjrHk7S0hLkIc7TOTWiGnTiOJObszkeoFLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gs0Pky3GDoOKhuYlvj2+bMquUrfqu40FMFQWLzO8gkM=;
 b=OM+Rxjix27i6N/4RV7ZDCfiHf7kPMU1gYJBGoa3YOSBfCwep6ytPgTyvl5BrbXkbMeIjUYigaFRIrLqnn45RFQRO8xcVy+B60b2fu8RBEli/TMx9ixhOzzfZ8XdBUgfWFb62OQ+GkfFZZlr5oyChtq1T7NCyoQs5dFUEL2VMinjNXAC2bLIHx0GDLRZZeSA51CF+U0BCZLGrFkN0/bksNv0IQwUa3PROS080gfQgMQkzyAol74v9uLdsJEh9bTeApHervmyC23X1ZuBPvANtSK3GreqyZu6yysSHYeDIgaSspJzmeM9BZcUtxwTUyiaHQb5hj3k4qvepEg9d3yKUig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gs0Pky3GDoOKhuYlvj2+bMquUrfqu40FMFQWLzO8gkM=;
 b=sVxBMO2IYwLcp5GRNoI0EbIhcxcPsxijVAwfMvU2HW8eBKELfJ9uPhRaCLRRQ5o9SPr09Ea0MLdkXMbKgAmOpwR7YYw+5L9SCzo7yevV5BBWX4s75XsnNEtZYC3p8c7FShOwCyyl6ktdTSoxZ/SNos736rLa3oQyd1tAd3GDh+I=
Received: from PH7P220CA0089.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::14)
 by BY5PR12MB4209.namprd12.prod.outlook.com (2603:10b6:a03:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 07:36:09 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::bc) by PH7P220CA0089.outlook.office365.com
 (2603:10b6:510:32c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 07:36:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 07:36:09 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 23:36:05 -0800
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuan@amd.com>,
 Honglei Huang <Honglei1.Huang@amd.com>
Subject: [RFC PATCH 0/5] drm/amdkfd: Add batch SVM range registration support
Date: Wed, 12 Nov 2025 15:35:49 +0800
Message-ID: <20251112073549.3717925-1-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|BY5PR12MB4209:EE_
X-MS-Office365-Filtering-Correlation-Id: e9277661-10ef-4702-bd76-08de21be25da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vVcZJaJYo00iAJqVxQxhPPGy0hMBNx8EUSapPIRovnGpXcY16txxjJZ9TuFW?=
 =?us-ascii?Q?W0ih7NYAc07B3lTQ6r18r5PFUyQmTkXMkVJJy2BvwMApNVJoSo5bBxEDnTGg?=
 =?us-ascii?Q?AlMA/1TRqDFGPFnJp635LtQX5i2q2roUPYPAwGGCeh6Yn/acwJPN/lcHA2pK?=
 =?us-ascii?Q?3/qrZg4QckE4SmrmmXgVbd5nNiy3TT8blROrZLamtjVoVkQU77qQY4jondPm?=
 =?us-ascii?Q?PZ0DiDTagUi/ergvb4Gq1eDuxSYs+xVG9G3feph5zABwFuHOUZCNx36E7Clg?=
 =?us-ascii?Q?QIeLgBaGp2bb1QEzRGgBZQY6t01di+jPk5M7UR4ALoRlvJs7mX4VhW/yCvWs?=
 =?us-ascii?Q?IWo6ELztDle3ruDk/i4XhEopFt+FvUCZHTWpeOy/PzgAR6O7gAwZdcgOo0On?=
 =?us-ascii?Q?6aNUefTc8cVt4NlbbukfdwloSm8t5MOmVNmIKZrjGoFngVlaP+xveALjtx5z?=
 =?us-ascii?Q?YOYIqJXY7kvXHCareDclXavsZL4IyivShU6FCDD9+jJOwatEumV1ixVkWXtH?=
 =?us-ascii?Q?PCQ6AQ9/xvD7Hw6T6phLbs5m+k+CUFZXd/rM2+0EsUoE7RQJv4keBy6u/fOf?=
 =?us-ascii?Q?XHRCGAqk5uymsdMgKDC1NiBfZCcWBIYr2++4dkXIkDCrhtS4AD8humyTITXQ?=
 =?us-ascii?Q?gXv9rvnHMjV+PdGArt9fm45a7TNckhT1cFHmkBEwrHBnrr4t1Z5IJ+U3qIgn?=
 =?us-ascii?Q?YXg84xYIE1bkqJdqyJLoGhQ8kBsm/cZ+hKOIVtpZyTz9dTwTocenLEfUEYCw?=
 =?us-ascii?Q?youDQu9qUxjK+9YdbgxK3pgy8UKrbPPzQixbrGT3iOP88u13yC5AVNQuT6PZ?=
 =?us-ascii?Q?g6HzzD8vB8obBC/OY4DHu9yHYZN0dzFINfpcQWHrCShI2frx97tdLcGl6n6z?=
 =?us-ascii?Q?C8V9pRd62Mqorq4AJ4IaGZSv3HfUriMwBmBmjCmxFOB23Q8ngidKEQv7rB0v?=
 =?us-ascii?Q?rDlz93TGJ+mDRoeLNF82OBI5KvtjSAh7jPy/AATpJ7tGmYYpsA79lUOO5XTD?=
 =?us-ascii?Q?M+RZFipsGqwOOic9YvMUmTLq+2KeGkr0OleQ8W1N0QNkGWPENrsO5P/OzUBv?=
 =?us-ascii?Q?jF0ZvDBaHVC4ZqsLzH5yJZjCpw4glT1ZywUOeTpvaA6vaqrodOQjNyGoTr1N?=
 =?us-ascii?Q?o3RkvFkgFtcei/qPgzCgoBH8HyckjCyEEVhw3P2xTk6vAdKzEtfaGSZyyrbF?=
 =?us-ascii?Q?yQuruuucbLoORvJPq99PArIK9n9O0r/Q1iGTJH2sJFSA5u/ILrYAb/ux/jUG?=
 =?us-ascii?Q?f6uE+hk13XMXhu+oIrar7q8oYB06SCE8ys6CUOABAG3PH5L9Ld0m0+kwOH2u?=
 =?us-ascii?Q?zOrpUYF0r7rwPTfkcnpziA5dgdvI/9DaE9CCz9KOXwIQAy6CZzJbDFuOGgeL?=
 =?us-ascii?Q?qHVsmjDLGKFans+kMLd+VDreNXBkSpCCXI7WauqlsZkwuqJUOFjH2s8/9TM7?=
 =?us-ascii?Q?2WcT9Ck3hXwCQq4+uqINEgawdEo5+YRrWeu9wQxXOZf/elgjD10T+is0B7ol?=
 =?us-ascii?Q?e5WLu3CvUHKL4UzEAHYqDooXLRgRS0Rc6Pv/WCQeWkZ/zmx8i789Sogy6jEU?=
 =?us-ascii?Q?11rj/39JHzadgpXVtPc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 07:36:09.4918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9277661-10ef-4702-bd76-08de21be25da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4209
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

From: Honglei Huang <Honglei1.Huang@amd.com>

Hi all,

This RFC patch series introduces a new mechanism for batch registration of
multiple non-contiguous SVM (Shared Virtual Memory) ranges in a single ioctl
call. The primary goal of this series is to start a discussion about the best
approach to handle scattered user memory allocations in GPU workloads.

Background and Motivation
==========================

Current applications using ROCm/HSA often need to register many scattered
memory buffers (e.g., multiple malloc() allocations) for GPU access. With the
existing AMDKFD_IOC_SVM ioctl, each range must be registered individually,
leading to:
- Blocking issue in some special use cases with many memory ranges
- High system call overhead when dealing with dozens or hundreds of ranges
- Inefficient resource management
- Complexity in userspace applications

Use Case Example
================

Consider a typical ML/HPC workload that allocates 100+ small buffers across
different parts of the address space. Currently, this requires 100+ separate
ioctl calls. The proposed batch interface reduces this to a single call.

Paravirtualized environments exacerbate this issue, as KVM's memory backing
is often non-contiguous at the host level. In virtualized environments, guest
physical memory appears contiguous to the VM but is actually scattered across
host memory pages. This fragmentation means that what appears as a single
large allocation in the guest may require multiple discrete SVM registrations
to properly handle the underlying host memory layout, further multiplying the
number of required ioctl calls.

Current Implementation - A Workaround Approach
===============================================

This patch series implements a WORKAROUND solution that pins user pages in
memory to enable batch registration. While functional, this approach has
several significant limitations:

**Major Concern: Memory Pinning**
- The implementation uses pin_user_pages_fast() to lock pages in RAM
- This defeats the purpose of SVM's on-demand paging mechanism
- Prevents memory oversubscription and dynamic migration
- May cause memory pressure on systems with limited RAM
- Goes against the fundamental design philosophy of HMM-based SVM

**Known Limitations:**
1. Increased memory footprint due to pinned pages
2. Potential for memory fragmentation
3. No support for transparent huge pages in pinned regions
4. Limited interaction with memory cgroups and resource controls
5. Complexity in handling VMA operations and lifecycle management
6. May interfere with NUMA optimization and page migration

Why Submit This RFC?
====================

Despite the limitations above, I am submitting this series to:

1. **Start the Discussion**: I want community feedback on whether batch
   registration is a useful feature worth pursuing.

2. **Explore Better Alternatives**: Is there a way to achieve batch
   registration without pinning? Could I extend HMM to better support
   this use case?

3. **Understand Trade-offs**: For some workloads, the performance benefit
   of batch registration might outweigh the drawbacks of pinning. I'd
   like to understand where the balance lies.

Questions for the Community
============================

1. Are there existing mechanisms in HMM or mm that could support batch
   operations without pinning?

2. Would a different approach (e.g., async registration, delayed validation)
   be more acceptable?

Alternative Approaches Considered
==================================

I've considered several alternatives:

A) **Pure HMM approach**: Register ranges without pinning, rely entirely on

B) **Userspace batching library**: Hide multiple ioctls behind a library.

Patch Series Overview
=====================

Patch 1: Add KFD_IOCTL_SVM_ATTR_MAPPED attribute type
Patch 2: Define data structures for batch SVM range registration
Patch 3: Add new AMDKFD_IOC_SVM_RANGES ioctl command
Patch 4: Implement page pinning mechanism for scattered ranges
Patch 5: Wire up the ioctl handler and attribute processing

Testing
=======

The series has been tested with:
- Multiple scattered malloc() allocations (2-2000+ ranges)
- Various allocation sizes (4KB to 1G+)
- GPU compute workloads using the registered ranges
- Memory pressure scenarios
- OpecnCL CTS in KVM guest environment
- HIP catch tests in KVM guest environment
- Some AI applications like Stable Diffusion, ComfyUI, 3B LLM models based
  on HuggingFace transformers

I understand this approach is not ideal and are committed to working on a
better solution based on community feedback. This RFC is the starting point
for that discussion.

Thank you for your time and consideration.

Best regards,
Honglei Huang

Honglei Huang (5):
  drm/amdkfd: Add KFD_IOCTL_SVM_ATTR_MAPPED attribute
  drm/amdkfd: Add SVM ranges data structures
  drm/amdkfd: Add AMDKFD_IOC_SVM_RANGES ioctl command
  drm/amdkfd: Add support for pinned user pages in SVM ranges
  drm/amdkfd: Wire up SVM ranges ioctl handler

 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  67 +++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 232 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   3 +
 include/uapi/linux/kfd_ioctl.h           |  52 ++++-
 4 files changed, 345 insertions(+), 9 deletions(-)

-- 
2.34.1

