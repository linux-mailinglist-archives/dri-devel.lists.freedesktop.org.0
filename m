Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00A5C50EF9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ECD10E19D;
	Wed, 12 Nov 2025 07:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NHJ7UbgA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013020.outbound.protection.outlook.com
 [40.107.201.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FE210E19D;
 Wed, 12 Nov 2025 07:29:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EK9y9wmCPbPrEKb5R7VsmJ54sjZ0P/3wR1okXjtTO0xCM9UQN5VoM3AxOqq+rrfLYWYjTDmpSfxUVECiSbOFmrZ90ojbVqRODJkRlHTkqXzQLaxgqun7Osfp4tN8fNttU8UanmUTAWo2D7z5cYL49U088ei0HO09YbvV2jp5XyncUfWUtPSPBShK90Yyr5nINpaGlcg0x1zr9zi6A1/d/IUh0iYEFt8dZPZwH/kXZXWV4pxVmQb99Y4AjpMT1UrbaQkwLh18ynBesESq437IAoLi81trUx17OUmmSeizaCkToQ+0X1zNybGpRliVheThqyVP48ZEzJXsEdkVw7oEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJzT98OqCfOqfQ4+mBGYHaHE39IzIeWz1t9gHEcfyfo=;
 b=U3V3ANnR5rlc2WZSBBeJ4rbwx71qkpFm3C5HB9KSw9+KolIuiZKwf3/pJ8eQUIgD6qereBAueORsUJ4nV8SohF3/RTmgiijmkLcsx2kBRb3JmADe2mPeqoWtwol3FtQaMysJOAYaDANZn7aJE5AJG2Cp3yNjyQ/jDGEq07S2guo66ELVaRWCSZkzyXtAVdxwUiuWetwJcaCSbsXLhCm+dInFg06PHtIhQNTdrbh0H1fV4V4nyXNp1pkpgAKJLJN3NnbXn01z2+m67IiCDXo18xcytv4ftdw8I/fxGojnfifKSJH5tgSTI6AGN/cTCm6fZLH5FRhAYSOa82lHD/nN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJzT98OqCfOqfQ4+mBGYHaHE39IzIeWz1t9gHEcfyfo=;
 b=NHJ7UbgAyncPHjZ2TOzFCwRsyol3IWSBvhp1CwH7pSk7a5im/rdm6izX9sunpkvgRvg6BSXIWIwOJHAZ7qCPAeKkV8uu2ZMfQSYEqYvo9xjiaDQIIdRJQIZMr8On0PtmJUQitKQgCyvqDZhhL+wRCOsQuIMJhwhRSD3+y/nUQp4=
Received: from MW4P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::20)
 by SA3PR12MB7808.namprd12.prod.outlook.com (2603:10b6:806:31b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 07:29:45 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:303:80:cafe::58) by MW4P223CA0015.outlook.office365.com
 (2603:10b6:303:80::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 07:29:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 07:29:45 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 23:29:40 -0800
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuang@amd.com>
Subject: [RFC PATCH 0/5] drm/amdkfd: Add batch SVM range registration support
Date: Wed, 12 Nov 2025 15:29:05 +0800
Message-ID: <20251112072910.3716944-1-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|SA3PR12MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a79b523-ef66-432b-19ba-08de21bd40d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tVoLD5UVlBV+XUttBtYUWBeW0cYMwjeIJcm163jaA9kSbQg2ej5BAh7ym9wc?=
 =?us-ascii?Q?PserIJZSsC+YT+mILqqjP1y1dqDv/bALZZkokfQSJFxkAy3Ut2dobWrXzNR+?=
 =?us-ascii?Q?VIxkAp+hcXbor0xXNwU2KqOSXKsRKXtCEPhC/zEhHvsmMuyuldc78dDN8Cg4?=
 =?us-ascii?Q?uq6gjaLsN21F7Um3diIpS5J1YIHJjF9Lqdh9z1tcfGgq+gXr/uP+nfwY+sbU?=
 =?us-ascii?Q?OfzwENOhvozt3LHOoZE/jpOARjI50VFqQ5RsIf7hDBYDYlkrduCL1vjwCZrE?=
 =?us-ascii?Q?XtHvVnOn4TBE7tP3lXJUIasU9v6pogLwQ8oTw7RYVHJNS2A2hpn5B+TBhtXW?=
 =?us-ascii?Q?YoRV3bd4vRTVMNrCSmqNLSbv3HMUqYJ0MdrukLXAuNpgQPdMdrH8EfYjjiMF?=
 =?us-ascii?Q?jicmf7Ie6G6UbCdrvKJuidjUxy0X71zYIAwXWh0A1DX9geSIjkahKU6iMytY?=
 =?us-ascii?Q?5eoCTN06r0i2pkV/sWnvAbRuVF3glMuWjcTiNFUQczTYcuZ6c3JJyZJXjzF1?=
 =?us-ascii?Q?IPwvjQlLYuGXyZAITNMsJWkgfrlcsaJEGi8/HnAs2Sas+vuLI/4Nmg4KD23p?=
 =?us-ascii?Q?VqBX++qdrttahAgjSQBSUTi+L+4YanNWSmMsWiGsnea0I+ggCWg2pjIpg00i?=
 =?us-ascii?Q?BYn++Sr3zyuXeo4RUQVh+wZjRAN32W/vp6vf+q0ev5qfPhMg1nDO83w+Jqs9?=
 =?us-ascii?Q?N7QfO67H89q5i2ZY5SjYqJNX7vr62L4VK4bfj+QKs8cwVUmlKFG1rGYRz7ap?=
 =?us-ascii?Q?8T2uft0HsbY4eQf6v+C8PBUl6to3KwQ0XSqIbrPnrTdQ7jv18P7oyLKv8h79?=
 =?us-ascii?Q?wjl6ZvW7rUqCei8DQPpd+AxSWyycEazra/6OfBHgiozhAdnAJtH6e0hjJZc1?=
 =?us-ascii?Q?iSBo/MOoqPFrgxZ12mVAYFfwNBEp9mOOGUuw2GueaPePTnb+WHcwSN8N7AGt?=
 =?us-ascii?Q?dcYAojxvUrruP8oOZQGbrk8n3KwsN+uqfDLZFeyM0+Y1TLxQRqgtyEKRLAsV?=
 =?us-ascii?Q?b3PUlgpaX725yWzagUPRP8ykcL+hNUPTuKT3Byt/7SYeCDeWK983IB1MQW/H?=
 =?us-ascii?Q?Zk7UEYrr114aDBydd49JJCGtXN6j93oSIVOTOMWshkvT8NHoB1QjexsyqEg+?=
 =?us-ascii?Q?NOvA8/2AzM9Tt3z55KHLTgrzzyMjNVbf8HkfledUON/4fAlhLSw0wKAkWbpm?=
 =?us-ascii?Q?x7u5NXBpTD84pLJLNIgWcIsZ4t+K3Q2pwa1miAFJvsrsFAWzvrlNfMHCcmrb?=
 =?us-ascii?Q?8fKe2lUviJzZ2+/Q4yKAtw43lo1/1uAP6v1SlZ4V3tPwMP20E1H9DvkBvj5e?=
 =?us-ascii?Q?orZ9GnhNOaxwxdtbtAOyQVFYUK7A+JCIghAQ/JTrIPvmgcelK4HbvKhTulO2?=
 =?us-ascii?Q?ekkJwbLkHrhpQHxrbHpPSdAYve8krUl7/qIFiVQqXKI7rbvveauLIlDa+3vH?=
 =?us-ascii?Q?V0SZjPOTlkt39iUapRPzi0RYYH5UUc5ZiwHYcb2B1vKr8klI9YWv9sjGy3Un?=
 =?us-ascii?Q?suDVU377gtQ65YQA4ha569UU0rrQSUrHOgKFLQZIv4fTKga/wvY/k/3Ef+DB?=
 =?us-ascii?Q?U7YQ6ao4Rz9e3GA0sHA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 07:29:45.1906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a79b523-ef66-432b-19ba-08de21bd40d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7808
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

---

Honglei Huang (5):
  drm/amdkfd: Add KFD_IOCTL_SVM_ATTR_MAPPED attribute
  drm/amdkfd: Add SVM ranges data structures
  drm/amdkfd: Add AMDKFD_IOC_SVM_RANGES ioctl command
  drm/amdkfd: Add support for pinned user pages in SVM ranges
  drm/amdkfd: Wire up SVM ranges ioctl handler

 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  67 +++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 232 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   3 +
 include/uapi/linux/kfd_ioctl.h           |  52 +++++++-
 4 files changed, 348 insertions(+), 6 deletions(-)
