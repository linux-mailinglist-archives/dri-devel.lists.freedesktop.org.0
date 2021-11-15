Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC4451231
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D356E9CD;
	Mon, 15 Nov 2021 19:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2063.outbound.protection.outlook.com [40.107.95.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DD76E9CD;
 Mon, 15 Nov 2021 19:30:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5b+ov1kXe0u4s68rVk123dq9RXpkksIV2VY3ohzKf2ua8qf7f0b2DW8vpXqqhfrheR1+5AiDOWe00tVB5VWMLT48UxVzhEBVkebz2K/P0HTDxFvL4fwQ4+PeGC4BpXRCCqC5aBKkbgM2U+7DTm5IPd7yGE7S0hdcBfxCauYus13VBC8qjf9osWv7teLMdgPC3STZKrLmWXRq2ZtUZw2y19PRkkhOWWRuClb5XArnhYzGYND7XxEmWvUSvBi9BKHn1HNiH0V3Kh6x8cE/slISpwT46akEDLJeTvJshrORhuPkHXJjbsLyUs8bNpzsrQJ1L4woXuATknsFoKn8NASwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAbNt4xJJFwfAH985ezN+TQYdpqKMdpffqXzHRYyAOc=;
 b=aiwG2nxfxnllNhkeF1pHON/uvEieTEVVNZHFFIQMn9q4CVtOmssg12asxqOHL6cKVNG7kCJGs4rq7A7407oH1xBRvXIYS/KOo2V8Gy/B7tiDlfguqlGluhi13eq3BbwBxRlcv+y6CgykbqF+6c8PnJfdiySR4ktaPIw2FbN6WWBB2kD8oGcL+2+Qijx0kVIw2XI8q/hqz5IIpvekKx0YZKxrpUmrLcdHWBAmgdX5OBjaWWH3yeGjGAWAIH3Re7yEjpHKICD9oOQGkNoHtRv35N7vieyu+nchH6GRKjqYY02iLhYaMA1B9V6RxzD/PydFfyzwAMbV/FnT5Bj9WCUYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAbNt4xJJFwfAH985ezN+TQYdpqKMdpffqXzHRYyAOc=;
 b=PWXHnbpj1XcMwPHFn+ft0M2R7HD1aPuMHQAZavNlSPfoT7gDzmzH1mezpSmlpW6hoByxLhxKdqDofFDYXWlrhJxjfVIPOGz7S0ESS9gyd6BbjA77gU4wPJub0cfDmfclnYZvxhqVa29D+6Yi6wlKXAnzcYQK+Ujx2dQkXD7cw1w=
Received: from CO1PR15CA0061.namprd15.prod.outlook.com (2603:10b6:101:1f::29)
 by BYAPR12MB3141.namprd12.prod.outlook.com (2603:10b6:a03:da::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 19:30:45 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:1f:cafe::69) by CO1PR15CA0061.outlook.office365.com
 (2603:10b6:101:1f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Mon, 15 Nov 2021 19:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 19:30:44 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 13:30:36 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v1 0/9] Add MEMORY_DEVICE_COHERENT for coherent device memory
 mapping
Date: Mon, 15 Nov 2021 13:30:17 -0600
Message-ID: <20211115193026.27568-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f7155dd-5caf-43b2-8b0a-08d9a86e6b20
X-MS-TrafficTypeDiagnostic: BYAPR12MB3141:
X-Microsoft-Antispam-PRVS: <BYAPR12MB31413794248582B40CEABD16FD989@BYAPR12MB3141.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9YpqkidzCsag3zHzz+gcDqm7AhGMohQr/T8B6PYXyryP1WFEoFn9SzE0mTFrqXohtO2vzcgBX9GCHImyQCCaDo132cFQKKp/+4m1weLcQ1Z8+9rJnWRPqmKBsWcmQMSxHZTKEKLQynkI60kEvIQTSoIu+AP9a0eZmLnZ0lKaIm8dDv3tBBJMtjRHTSNeiPB0RG08FccpYFjwyVC1OKLaZ3uDZwHFA2ye8hxLRo+Ie2MLsis4msJ3mqc8ivdzr7TgIZRdblJHoZJn8/RrfMmqhZOOOLR9o7eVR/Clk0AYRX9Y0c2TghE/I9XjRE2RagABN+o7sH031VFJts341OcPnFzykOpu7BqyNvfifHAhXBwRgVW+GyzBYBaOH0EviqbsccKno+OMPUVFA6e7qJH3CZ4m5HCRMk9NTlzmEndgc/TZqEfo+dP51Piqb6mnEe8tSo14EAaDAfNUbnaYAWDbjqYc1qedShUtcQzVvBmjz5Algv5FffdaPykiX1Z4vHhWY1zAwp7e61I89cCQUGJpf8Q04tsbGNFBQEwx5l8vfXopcZ4IeHhm40v57GAT9nA5npeFChOtPb1Z3OweMIZ1qzsXcjm/2LsHphSibzCXDCo6uFDJEk3JEbxA/VDYoYdBhon2XmYTVW8mjwk6PEcx2JQuNRbvP6+U78KjHGs4aik/MV2NIsQ3RxAfFTPtRRfHrvYBOX2rI+tOSfcKRiZ2A44FqRJgY0Cwgsd2zCOO23g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(336012)(8936002)(2906002)(26005)(47076005)(508600001)(82310400003)(8676002)(86362001)(186003)(44832011)(4326008)(16526019)(7416002)(2616005)(426003)(6666004)(316002)(356005)(81166007)(110136005)(54906003)(36860700001)(5660300002)(36756003)(70206006)(70586007)(83380400001)(1076003)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 19:30:44.5210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7155dd-5caf-43b2-8b0a-08d9a86e6b20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3141
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series introduces MEMORY_DEVICE_COHERENT, a type of memory
owned by a device that can be mapped into CPU page tables like
MEMORY_DEVICE_GENERIC and can also be migrated like
MEMORY_DEVICE_PRIVATE.
Christoph, the suggestion to incorporate Ralph Campbell’s refcount
cleanup patch into our hardware page migration patchset originally came
from you, but it proved impractical to do things in that order because
the refcount cleanup introduced a bug with wide ranging structural
implications. Instead, we amended Ralph’s patch so that it could be
applied after merging the migration work. As we saw from the recent
discussion, merging the refcount work is going to take some time and
cooperation between multiple development groups, while the migration
work is ready now and is needed now. So we propose to merge this
patchset first and continue to work with Ralph and others to merge the
refcount cleanup separately, when it is ready.
This patch series is mostly self-contained except for a few places where
it needs to update other subsystems to handle the new memory type.
System stability and performance are not affected according to our
ongoing testing, including xfstests.
How it works: The system BIOS advertises the GPU device memory
(aka VRAM) as SPM (special purpose memory) in the UEFI system address
map.
The amdgpu driver registers the memory with devmap as
MEMORY_DEVICE_COHERENT using devm_memremap_pages. The initial user for
this hardware page migration capability is the Frontier supercomputer
project. This functionality is not AMD-specific. We expect other GPU
vendors to find this functionality useful, and possibly other hardware
types in the future.
Our test nodes in the lab are similar to the Frontier configuration,
with .5 TB of system memory plus 256 GB of device memory split across
4 GPUs, all in a single coherent address space. Page migration is
expected to improve application efficiency significantly. We will
report empirical results as they become available.
We extended hmm_test to cover migration of MEMORY_DEVICE_COHERENT. This
patch set builds on HMM and our SVM memory manager already merged in
5.15.

Alex Sierra (9):
  mm: add zone device coherent type memory support
  mm: add device coherent vma selection for memory migration
  drm/amdkfd: add SPM support for SVM
  drm/amdkfd: coherent type as sys mem on migration to ram
  lib: test_hmm add ioctl to get zone device type
  lib: test_hmm add module param for zone device type
  lib: add support for device coherent type in test_hmm
  tools: update hmm-test to support device coherent type
  tools: update test_hmm script to support SP config

 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  34 ++-
 include/linux/memremap.h                 |   8 +
 include/linux/migrate.h                  |   1 +
 include/linux/mm.h                       |   9 +
 lib/test_hmm.c                           | 270 +++++++++++++++++------
 lib/test_hmm_uapi.h                      |  21 +-
 mm/memcontrol.c                          |   6 +-
 mm/memory-failure.c                      |   6 +-
 mm/memremap.c                            |   5 +-
 mm/migrate.c                             |  30 ++-
 tools/testing/selftests/vm/hmm-tests.c   | 156 +++++++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  20 +-
 12 files changed, 446 insertions(+), 120 deletions(-)

-- 
2.32.0

