Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOi1NZWJhWkWDQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A765FA9EB
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E087210E365;
	Fri,  6 Feb 2026 06:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ghknD/qG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375F810E365;
 Fri,  6 Feb 2026 06:26:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVVoQO2KB/NS1TIM/k3leMwk9fVBL1kuP4xXk/8mn6pVDVZls+uvjJPHkiN51mQTAyEcsQ1ZKOPBmmqXNi1ssDzdcec7etj1Q16nsLtgVipKNZ6Fht9IN8AY0L7bF7gp7JjctUE2nQxzYqvh9abo2mmzflDtjCaMI41ClGtRkkNam9/owrDdlNaW9+5XWl48Y+pSaskvwgxATB47HvUTfUBQBKxyA1wSkWR1cgjOWWfPgpBR4QQR0MFIAR8rhHpQgPt2b0UQcQsZJkWpoOA+Z0HJgzZAWgB7NlARJK9QJajkjygeiRaZabPnMaoAtcftomFWcWYCb+/GJTipTpTI8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C46sjLncXjXV2jBMVTHWgsbDg+XtoYV1Y+crPTkvLzI=;
 b=KTAM4/s5kcJgbYf53I13Gx9lVe/bytWx/s+hy6dI3Tx01Frg8lCTdopo337h5x+/7CrI/b1Ap/z63dlr6V6wwwkYRFhV/6pW2jfEtm5FWiNz/zmM3UZVVFGweWNka7mWCsqEh2PdGitVVTmcYVKu49C9MVdbYZQ4cxapjPs8+d3AW7YHbdFHd4aLg4+S+i+F5/mJRIKG3DKIx4CjaYLa6fBLOugeAEz4Nf93MVKWoPh9+p7+YkWxF7eGENJ5KflidknXH68PdPRPVYkoclgqnFg6fOidYGRS076RIL4YJwEL17JlmvYAAH2qJFCPe+YU6KwvuBdZShRVR0aftdVzTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C46sjLncXjXV2jBMVTHWgsbDg+XtoYV1Y+crPTkvLzI=;
 b=ghknD/qGiDA5TtYXe6Bnmuw0qKrCWmWmWXWGr18Jy5whbApihq9VjXfMYWEpLd2tJgpwA/lAZ5BjG+hlVDWFzQZE5QnreL6fxYMmLjz58wOOvbebcMbGI0c68HFNoRjwAdIQvNYgZD3aFju5f+5opoFOzuejSAu5rCAxI2nVEY4=
Received: from MN0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:208:52f::15)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 06:26:20 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::bd) by MN0PR03CA0008.outlook.office365.com
 (2603:10b6:208:52f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 06:26:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 06:26:19 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 00:26:16 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v3 0/8] drm/amdkfd: Add batch userptr allocation support
Date: Fri, 6 Feb 2026 14:25:49 +0800
Message-ID: <20260206062557.3718801-1-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 50306c3c-3e97-41ac-7937-08de6548a435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4a/xuwNdTMjLvptWl1b2+beXR1fA8SWg3sZmQF++NVEcQzIKQNow9jlHrY9Z?=
 =?us-ascii?Q?XIhWohX4C3+Gxnng7Q+fC250voCmzEBu4Pb52vo8E477U4qRYICxsTIjGoG8?=
 =?us-ascii?Q?DAM7IJ1onZuvh0YBFSgbOP6w3qOessYusuG+zKrORqNYy1ISnUyMcW4luun+?=
 =?us-ascii?Q?nNOX9k8ZS/iKTWTd4F+/zXS1VaB6EpZ6rhCBBlFMgs8oCrlG/cq5CSFewWnY?=
 =?us-ascii?Q?0KznTWEJcUenjMNGgS5uRmvuBC9bGS575im4DXqHVX6DUci15j0BkPHQW0gi?=
 =?us-ascii?Q?zRDSVVIc6epJalHpWZO2Xe+6TLX9C/vPJh2J+AuPrcSxTDigE06c39j1ZtAB?=
 =?us-ascii?Q?TVwQ/Q9pOTWNEZWt7fchPSC0fAEPk7GotCFd5nB5myAJS79PUf0EbVNkxihs?=
 =?us-ascii?Q?A9UGaQPwwzh6J92hvYxeMVRavb+np+QqhuosrBi3QeQ6S09SWkbqRXacgDFE?=
 =?us-ascii?Q?R4PADLY8xCjXzXGA5EWoSn1iAUN8u1aaK2tv3l4XlKDZ9j8blZeQlC+bwheZ?=
 =?us-ascii?Q?E2THqmu7C6UOOXWyl+t6zykbgW+37xfgte97V9arFpblMdkV5cFb+NI0e7Vu?=
 =?us-ascii?Q?2OwL73cWsqKGySQnRZLlAaeUvS0Z1+Kj4r6+M2A+roOaJYXPQb/9LxgSHRoS?=
 =?us-ascii?Q?uxIBLqcegYdcfxOgaJhw5ssCoTw2hzpmgSTiT/93bffyk5DVlBycFdUaWSwh?=
 =?us-ascii?Q?haUio1ZEJJamDAx2D0e6GnWIDdjs7HGtMrGLUd45H+aDVvEXAHSpIO4YuQjA?=
 =?us-ascii?Q?CSBAIxslpohUny1wwbWwgVs17+/JA92BltLM2e4//U+u83NcY428qupXxIGC?=
 =?us-ascii?Q?f0E1nT8DjP4TFTOjZJuk/nYJI7RDSZuJ5ThR6324UnF4rkhrZO0FdkfuU1ho?=
 =?us-ascii?Q?DiGf5zJ3Pqxd1yZsIQpQhJkBZG1qceN8xipMvlpM2rYVgwWjAtUxXol3Hycq?=
 =?us-ascii?Q?4S3Z2pD9xt+yafbSnskT4vb3seXNhsMjvoH71yFS5diiIlSEVdufoR7wOV61?=
 =?us-ascii?Q?pHpSOGBfrwle2BTGICGipfKxdtRZfv1bwPqgrdmL7S9IWCThdKwTHUdir3Fo?=
 =?us-ascii?Q?7P4tnfbw+Nvdf012rq5IbtfP1tJtSyH5SA9lkJZk6OgDHtZyLEQEEIJLq3xw?=
 =?us-ascii?Q?HgtP/iJtQDGRIQOLz1cPV4hIEp4g5Co77VZZAWiY2c/Ye/RDc+ulIygGXmBB?=
 =?us-ascii?Q?v3k0zDaPf7dYBTvfk3sAbRBwL2S8v97qpqYag8qLJzt8D3M7rzSsmn+a2sRy?=
 =?us-ascii?Q?LazUoOzC29zPhVJ4tObvgLAwWaJYuwCvC/+6KvMrOGQ8DjbCLiv+K1E/bnSN?=
 =?us-ascii?Q?kiH1mdAE5qG84Tx93G4hgciOndMAnGgSm4PbpUiwBjXf2M0W8I3zbwA89tP/?=
 =?us-ascii?Q?XSOhqvE1350685WFsMz9qiAsTfDRfl5dxmPM5sy9+Dr6lRyPyNQNKUg123eo?=
 =?us-ascii?Q?p7vEC8G6oNsYAISDy0inJD+Zr+6aC3jG+UhwyiSU2oTVO/Pff4d1YX48Qd/I?=
 =?us-ascii?Q?c+6WrQrva5tiiOJ5/KCbkpQiPaGe1OkF5NVSEbEUP9dpH/RxsqteBYUOwHRb?=
 =?us-ascii?Q?ro3RxGBkQWvakLo2tLFYr5xwGlT4eba0iMNiZEJH6e+sgq66lUO1idA0citS?=
 =?us-ascii?Q?ULoZJdr4crrT2/FM+Y0ATv4szeGP9Rg923ekMne3C+dF9XYmnVuN3jBgk1kA?=
 =?us-ascii?Q?CvQSHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ig4fPhB//BK1C7PQMjMdKtPQJcylQAcI0iax5KTejuIIx78n4FgUH+UxvUPW+wpHnnGEFUQSpEKDUzc8p5DbW+87KrvgotepBhgsD+XhAxEUZQjYbSXK5Qrm785mZo10YYQHvPbdpf1DRRzHdx6fMK04w3tVgaNIu31KXXRfOgMDRObSlk/MMjSyQTH/Ca1mGU7LHria1Nlm+lzaojoF7L6t4b8WCrhhtOTx0qP6/cLh7ZmQGtsr1lmIrp2KpByB5bvg0wsbL2t5epLIKDZAuZ9sXVYDrbSjuNgWEZZVlEJsRmYZwUk1DoxbCU+SXOHhLXiOu0iozb6eFWYfr/h3suNR1yVA3afZQ/5PhwosUIjbthPYWQY1yu8N0Y9G2BiMdfqFG/wSQCtpD+/1GsNHushyNIkSgJq2IM98Gw7jTzdIcJAktILDP4vBFsg46Gjc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 06:26:19.9778 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50306c3c-3e97-41ac-7937-08de6548a435
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[honglei1.huang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3A765FA9EB
X-Rspamd-Action: no action

From: Honglei Huang <honghuan@amd.com>

Hi all,

This is v3 of the patch series to support allocating multiple non-contiguous
CPU virtual address ranges that map to a single contiguous GPU virtual address.

v3:
1. No new ioctl: Reuses existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU
   - Adds only one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
   - When flag is set, mmap_offset field points to range array
   - Minimal API surface change

2. Improved MMU notifier handling:
   - Single mmu_interval_notifier covering the VA span [va_min, va_max]
   - Interval tree for efficient lookup of affected ranges during invalidation
   - Avoids per-range notifier overhead mentioned in v2 review

3. Better code organization: Split into 8 focused patches for easier review

v2:
   - Each CPU VA range gets its own mmu_interval_notifier for invalidation
   - All ranges validated together and mapped to contiguous GPU VA
   - Single kgd_mem object with array of user_range_info structures
   - Unified eviction/restore path for all ranges in a batch

Current Implementation Approach
===============================

This series implements a practical solution within existing kernel constraints:

1. Single MMU notifier for VA span: Register one notifier covering the
   entire range from lowest to highest address in the batch

2. Interval tree filtering: Use interval tree to efficiently identify
   which specific ranges are affected during invalidation callbacks,
   avoiding unnecessary processing for unrelated address changes

3. Unified eviction/restore: All ranges in a batch share eviction and
   restore paths, maintaining consistency with existing userptr handling

Patch Series Overview
=====================

Patch 1/8: Add userptr batch allocation UAPI structures
    - KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH flag
    - kfd_ioctl_userptr_range and kfd_ioctl_userptr_ranges_data structures

Patch 2/8: Add user_range_info infrastructure to kgd_mem
    - user_range_info structure for per-range tracking
    - Fields for batch allocation in kgd_mem

Patch 3/8: Implement interval tree for userptr ranges
    - Interval tree for efficient range lookup during invalidation
    - mark_invalid_ranges() function

Patch 4/8: Add batch MMU notifier support
    - Single notifier for entire VA span
    - Invalidation callback using interval tree filtering

Patch 5/8: Implement batch userptr page management
    - get_user_pages_batch() and set_user_pages_batch()
    - Per-range page array management

Patch 6/8: Add batch allocation function and export API
    - init_user_pages_batch() main initialization
    - amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch() entry point

Patch 7/8: Unify userptr cleanup and update paths
    - Shared eviction/restore handling for batch allocations
    - Integration with existing userptr validation flows

Patch 8/8: Wire up batch allocation in ioctl handler
    - Input validation and range array parsing
    - Integration with existing alloc_memory_of_gpu path

Testing
=======

- Multiple scattered malloc() allocations (2-4000+ ranges)
- Various allocation sizes (4KB to 1G+ per range)
- Memory pressure scenarios and eviction/restore cycles
- OpenCL CTS and HIP catch tests in KVM guest environment
- AI workloads: Stable Diffusion, ComfyUI in virtualized environments
- Small LLM inference (3B-7B models)
- Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
- Performance improvement: 2x-2.4x faster than userspace approach

Thank you for your review and feedback.

Best regards,
Honglei Huang

Honglei Huang (8):
  drm/amdkfd: Add userptr batch allocation UAPI structures
  drm/amdkfd: Add user_range_info infrastructure to kgd_mem
  drm/amdkfd: Implement interval tree for userptr ranges
  drm/amdkfd: Add batch MMU notifier support
  drm/amdkfd: Implement batch userptr page management
  drm/amdkfd: Add batch allocation function and export API
  drm/amdkfd: Unify userptr cleanup and update paths
  drm/amdkfd: Wire up batch allocation in ioctl handler

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  23 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 539 +++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 128 ++++-
 include/uapi/linux/kfd_ioctl.h                |  31 +-
 4 files changed, 697 insertions(+), 24 deletions(-)

-- 
2.34.1

