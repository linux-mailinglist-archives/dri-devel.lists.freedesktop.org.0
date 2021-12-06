Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2094E46A524
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 19:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C506E16D;
	Mon,  6 Dec 2021 18:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C563F6E8B9;
 Mon,  6 Dec 2021 18:53:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeCjs2smEgSLRw/mvj7BpknIW4R/ZgGxez7BFohvt1dtkCwnxCUUxdELQQQ11tMwlmAOdIkSfvKT1/yGLaeHmvY2qhPLoHc9ds8djb+ohQ7LapS3c2dc9cTmuVK3uo/tmjZt/wIC8j+HDZnsuAm9Pdqp2eUl3dPFbzaCWvYBk3xcE+YxvKac2yvZ7WotBqpBtoxhI1m3Wp1TxZ+xRATvZc5Z6F7WysvBGwKQ3rfYB8mvRxduKvFvU/E9lFguSL75pNA72/JBDziFhA703ayhcoRrpE4RLPXOQeDBnL+LkOfM4hMwnes+GTsDKBADCDUW38VKUp3h2Hk1nSX69y2BOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MYo3Q9I3X9LgnMu6lbdjJY7T+Y5axYCHrd0SUh8RY4=;
 b=V+WciMgqyXKTUyN23JPRib3MXdj9ulWXAIsdN3XdU4e/rybYuvtv8gfgCvJfZgxXJoGBClau1IFlLQMs0LsYliz2gOREE6oTmKhSsRk1NHjIx9OnfycN5EP09o9IIXmtgY62krg7rWkHgdHp29C4Fvypj12okmvqsNdEEs5wdeifTBdgTy5wuQ8N7NDYPnptlFEsWVkcQ+34b46kE1rNFj09RpulYFtNxkxmK29+d4xz+soBKrG+gmMVaerjK5N3ky7AXI97XO0/XrtpUFHagQwyVm0rcWqTUDXJr4AUnfnTRQ05ogn9SVDrD6kNss/HiMukR6YuTq7K9lywI2/JFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MYo3Q9I3X9LgnMu6lbdjJY7T+Y5axYCHrd0SUh8RY4=;
 b=5YvZrWLCtXBDsxZzLHRW0BhjZ2e2QNHcc/eb7sz9JM/R1BAcDiIAGmYjkcKOaGLAlJlHO9LRn0G2Rh3MQaG4fIR6v2htK3OtpeiXDcBL0fQXs8uyij5qMvC0kwxdjhy0FS38syaizsShNqqHlMpHuetLVm9PhyOwrKyrw7xBXAk=
Received: from DM5PR15CA0060.namprd15.prod.outlook.com (2603:10b6:3:ae::22) by
 MN2PR12MB3919.namprd12.prod.outlook.com (2603:10b6:208:16a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Mon, 6 Dec
 2021 18:53:01 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::2d) by DM5PR15CA0060.outlook.office365.com
 (2603:10b6:3:ae::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 18:53:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:53:01 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 6 Dec
 2021 12:53:00 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v2 00/11] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Date: Mon, 6 Dec 2021 12:52:40 -0600
Message-ID: <20211206185251.20646-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="yes"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0fb4f31-8256-4069-1ffd-08d9b8e9a0e9
X-MS-TrafficTypeDiagnostic: MN2PR12MB3919:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB391920C32E30028189DA8B12FD6D9@MN2PR12MB3919.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EFoau3zm7qI15KbgGKtje4VQ/Muw0sUxBkILmfjCOjvG8TRmYcvRni3KSnQ5HqX6OttQX8c239MeOBVrNndUuLCXBf2/QF1Q1C8Q2TavxcO/uuq0AkOJq6XUuQYRqI6gK6hBWgBy1VtZQyqPa4ffywB6LNZtobU2cdaaoMPbOOLPx+LkuxV+1OTGw+NzW74IkEtiFTXFMZQOwITRzDMdlmwPlodZwV7Z6TMVzWqRE8eevE0vgdA03Wb9VC2GBz7kqrtpWRb8BeESueOkvkOGYVIn66Y7clwtklBqunge1wTHhadl/01sP9ottHryrsmYCDVVgYvoWPtbOtarAuGeZpCfHElpsrMrWLJ5oqRSDgxGF9vggnyAwbaWjx5mc6WsMsquZtVzueUy9I1LqGpFNYNZICjT6AFxqD8wAXDWucLu17pksoaRdsW8AeWfsrp5dkqN6/bNbFiuaV6FAGijLuQdnIpY+VQNVrChc74QnPTIrnNsF9XWu7HJCAdXdRO0GYnvPoJeqhLUowGSCLpkB6E7Ts4zqQKscR/rUbyei/9rlNZSQezUKNFef/5B2lV3bDL2PPElHQ8f+Bdzqq6+YymgLzFBnWxWqHYpwZcy+XGiC6OVcbXVzNXWHl8has0BqPA29AKfP71OnlEJiElXmSJmcBtIochKBIRqgLArYlYj2Gsdfk2H9xi4uU1YMpxDJGpzF8IEVHcRkCpFtJgO/7RBB1uaBzXE1LxHSpAQnupFOr11u+w6veCdkoQKtxN4SnG0VCwGhd1D7rCdWVN8sGGz3XAtbEgTA1qcqHyMFh4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(1076003)(47076005)(4326008)(8936002)(86362001)(70206006)(40460700001)(186003)(82310400004)(2906002)(6666004)(356005)(316002)(54906003)(2616005)(7696005)(5660300002)(36860700001)(36756003)(336012)(426003)(81166007)(7416002)(16526019)(110136005)(8676002)(83380400001)(44832011)(508600001)(70586007)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:53:01.5378 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fb4f31-8256-4069-1ffd-08d9b8e9a0e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3919
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

Alex Sierra (11):
  mm: add zone device coherent type memory support
  mm: add device coherent vma selection for memory migration
  mm/gup: migrate PIN_LONGTERM dev coherent pages to system
  drm/amdkfd: add SPM support for SVM
  drm/amdkfd: coherent type as sys mem on migration to ram
  lib: test_hmm add ioctl to get zone device type
  lib: test_hmm add module param for zone device type
  lib: add support for device coherent type in test_hmm
  tools: update hmm-test to support device coherent type
  tools: update test_hmm script to support SP config
  tools: add hmm gup test for long term pinned device pages

 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  34 ++-
 include/linux/memremap.h                 |   8 +
 include/linux/migrate.h                  |   1 +
 include/linux/mm.h                       |  16 ++
 lib/test_hmm.c                           | 338 +++++++++++++++++------
 lib/test_hmm_uapi.h                      |  22 +-
 mm/gup.c                                 |  32 ++-
 mm/memcontrol.c                          |   6 +-
 mm/memory-failure.c                      |   8 +-
 mm/memremap.c                            |   5 +-
 mm/migrate.c                             |  30 +-
 tools/testing/selftests/vm/Makefile      |   2 +-
 tools/testing/selftests/vm/hmm-tests.c   | 203 ++++++++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  24 +-
 14 files changed, 585 insertions(+), 144 deletions(-)

-- 
2.32.0

