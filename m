Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCA44A6089
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026A510E69D;
	Tue,  1 Feb 2022 15:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2088.outbound.protection.outlook.com [40.107.101.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6947010E65F;
 Tue,  1 Feb 2022 15:49:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/0Iej73ZYhEUk/oOODBaa2H+u35ziq+dYnT3ZQ18Z5BYutE3nSXQcLc+nmoeIogyC75MXwmWkB8dUUgMWWxSiUJUioVoMv5JLFCHudQZiNOLZgeSVs6ks4KDzLmSLaoBTtmYsfRATN6xjAQ6iuMk8xvJqKSRpTMA8NjOcaBg8PJH2rJQDeGvjhFic5nOh83ROFrhBFJzzWzU+5lL2M6N7myH/GtYMPTQ3diaXoHr8RP3Z0esSQUKEghwzwaZBHK6VX1CgIPMgS6bYdS+3BCMd3aLNl72jLFae7Ux6aiaKMnmjxhJIIIJ3eN+ZBry/+fpQal2Bh8bmgcmgKTm41DqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9vI0wD73ot6cWBvwHATd+akv5eYvpZMV0Irpy+xkoU=;
 b=WqNhteIvRTgvp2vNXfaHRsFZfj869oYLuP9lIxzeL09u6IHBvjf/vxxc+pcTyAuFL13ZCtMYuJ1eYuqtJhZaUELmnnvJDArTpWVE+BHZC/u2XS6LhJq3BEgMRrU8lHW+YURRjH2vccYigp1u+3biPnzbiKC35KrNPK6+vTnSk6eXEdW5wcQaN4HVffgMV2qBlbU3o8idJ1cU9ZQWz1+V4ZMcN5BoHYIRm8afozYGiXufT6xSMNOgUCZa/yXIr/PC/TDPIDvhCBDgoXucZHjgJDlz4DmeDAGRW6SaIe7ZqMr97w0gTwofDXzZwgSPwkC5lmvzR0FUxivwZDWn1fidWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9vI0wD73ot6cWBvwHATd+akv5eYvpZMV0Irpy+xkoU=;
 b=NdfvkL23+HAWgarr5qYEQT4IEGG0HvYVXklRmb+88lfLIg0sO9NioQlOhvwDQ3KdGRiiyNEd6trDBWFy+Ack+TVCag1ZUHzs56wo2tN7cSmfTZTt7FCvm9q0xJP09wObwSsJwlj0XTmtK3tk78Y6R6qLiObJtrqbavL5pE7snwg=
Received: from BN0PR04CA0051.namprd04.prod.outlook.com (2603:10b6:408:e8::26)
 by DM6PR12MB2636.namprd12.prod.outlook.com (2603:10b6:5:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Tue, 1 Feb
 2022 15:49:13 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::6f) by BN0PR04CA0051.outlook.office365.com
 (2603:10b6:408:e8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 1 Feb 2022 15:49:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 1 Feb 2022 15:49:12 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 09:49:11 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v6 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Date: Tue, 1 Feb 2022 09:48:51 -0600
Message-ID: <20220201154901.7921-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20acb24f-71a9-4b94-fb7b-08d9e59a64a4
X-MS-TrafficTypeDiagnostic: DM6PR12MB2636:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2636830A3AC929FC10860B83FD269@DM6PR12MB2636.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OOHaKDZ18fHMvbj47caBXM5BpPDVpFsm0pu2Yflg0s1vyMhdBaQYvufsXY6Ol4u+mvPpVqWSJ1hcydgjNNhOb4nkyM2JRYzaicQ9nuEHVSp6HTazuCudrop6g1sTScxwJetTOlm7+rRP3K+RsdBxJuAUGT1khKwMQL6/fJPwA6zqLuvdbj5RBmtVH/XmHKst0ddsBPXrCSo+wgf/pHlNg5uTW22kyp58NdkHo8ck/TDxfvR2KKZ2waLxSPpj31yYfe/DWS0/z9U7O7rGbORgoJ5LWzyk1fGKsG2foz04LONRA25eFCfD+jYhCxlVWdZmwZLkl5fSyoklZSoIUx9Xux1MvKtEfQGZCyVYge0TV70x8btyYkOFxp2SQX0UonGeEah/8pMv7Trptq86dn9VMjO4AIfMaMIDzCzts/1+e2tusxfMgLHddhn3b3igFqBJlWUZpq0PRM9wonPphPdpGkxw/Vzy2VVPpwi9O0V7ypzijq3NISYa2bMj40XLIsm4yfbPjQMkewwxxbgiV20lc+zS/vXAw6rjaYThj1SvKSiK4fmNGcu3j+4SdqAVfBQtwhqqvFOUaVjt7UnExiKFcUwWsIz5KKDyenYhKjiZhSSr1JtUskohKOdXTk8C1U1LT2kZDNmVotNOpT7yOXZSMUcodK6TCpctzmMfM7q2fPvC9STihEekvcT4wzix2+U4xB6HoQkcnCz3PlTho+KHsQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(186003)(16526019)(2616005)(36756003)(1076003)(82310400004)(26005)(426003)(316002)(47076005)(83380400001)(110136005)(54906003)(40460700003)(2906002)(8676002)(7416002)(44832011)(336012)(7696005)(356005)(6666004)(86362001)(5660300002)(8936002)(508600001)(4326008)(36860700001)(70206006)(70586007)(81166007)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 15:49:12.5112 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20acb24f-71a9-4b94-fb7b-08d9e59a64a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2636
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

This is hopefully the final version, with all patches Reviewed.
Andrew, if there are no further objections, please merge this version.

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

v2:
- test_hmm is now able to create private and coherent device mirror
instances in the same driver probe. This adds more usability to the hmm
test by not having to remove the kernel module for each device type
test (private/coherent type). This is done by passing the module
parameters spm_addr_dev0 & spm_addr_dev1. In this case, it will create
four instances of device_mirror. The first two correspond to private
device type, the last two to coherent type. Then, they can be easily
accessed from user space through /dev/hmm_mirror<num_device>. Usually
num_device 0 and 1 are for private, and 2 and 3 for coherent types.

- Coherent device type pages at gup are now migrated back to system
memory if they have been long term pinned (FOLL_LONGTERM). The reason
is these pages could eventually interfere with their own device memory
manager. A new hmm_gup_test has been added to the hmm-test to test this
functionality. It makes use of the gup_test module to long term pin
user pages that have been migrate to device memory first.

- Other patch corrections made by Felix, Alistair and Christoph.

v3:
- Based on last v2 feedback we got from Alistair, we've decided to
remove migration logic for FOLL_LONGTERM coherent device type pages at
gup for now. Ideally, this should be done through the kernel mm,
instead of calling the device driver to do it. Currently, there's no
support for migrating device pages based on pfn, mainly because
migrate_pages() relies on pages being LRU pages. Alistair mentioned, he
has started to work on adding this migrate device pages logic. For now,
we fail on get_user_pages call with FOLL_LONGTERM for DEVICE_COHERENT
pages.

- Also, hmm_gup_test has been removed from hmm-test. We plan to include
it again after this migration work is ready.

- Addressed Liam Howlett's feedback changes.

v4:
- Addressed Alistair Popple's last v3 feedback.

- Use the same system entry path for coherent device pages at
migrate_vma_insert_page.

- Add coherent device type support for try_to_migrate /
try_to_migrate_one.

- Include number of coherent device pages successfully migrated back to
system at test_hmm. Made the proper changes to hmm-test to read/check
this number.

v5:
- Rebase on 5.17-rc1.
- Addressed Alistair Popple's last v4 feedback.

v6:
- Corrections with zero pages, to make sure these are only migrated
only when MIGRATE_VMA_SELECT_SYSTEM is set.
- Set last reviewed patches.
- Rebased to the latest master branch from repo:
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

Alex Sierra (10):
  mm: add zone device coherent type memory support
  mm: add device coherent vma selection for memory migration
  mm/gup: fail get_user_pages for LONGTERM dev coherent type
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
 include/linux/mm.h                       |  16 +
 lib/test_hmm.c                           | 356 +++++++++++++++++------
 lib/test_hmm_uapi.h                      |  22 +-
 mm/gup.c                                 |   7 +
 mm/memcontrol.c                          |   6 +-
 mm/memory-failure.c                      |   8 +-
 mm/memremap.c                            |  14 +-
 mm/migrate.c                             |  57 ++--
 mm/rmap.c                                |   5 +-
 tools/testing/selftests/vm/hmm-tests.c   | 123 ++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  24 +-
 14 files changed, 519 insertions(+), 162 deletions(-)

-- 
2.32.0

