Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5864049D8E1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 04:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7625E10E763;
	Thu, 27 Jan 2022 03:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F105710E42C;
 Thu, 27 Jan 2022 03:10:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EazSu/kbhx2c+x0P29prix7boVv40QEEcsr1GIKo6YrSOCZ9zP+Y8LThIEbB1tnw3J876JuMoiWloBuCDSrSqVh/ylUOCCc2CUBJKVe6i+8gEAaptoKjLXxd16FE0/cgvf/MieVxkDKC8SvWSd3xxW/DEWvG4zCQQ2DR2s5izk/gUnmoFGfSBtZ8qFF9YAVB5PJO+9/YNWTiQLF3BOLA38LKM/y4QxQX0e95PGlKILo80CDVBN/3NT+QC1lq1Zec34v78aiMvUFsm5vbkiYypc0fuAqY4J7EkQrhHaLPJ76OFu7Mi8kWo5SNE4Mqyo8Kry2fRBa3DoNK/YVHo2calw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=echqpR4vSwoF6VTqdjBRSvMm9RVhcVS/z9aiXSLA7Eo=;
 b=SmoQUors0y69Juljkl20xDOxA0BE03DzuieaOY8A9UcSTZ+DWUfQmarTgqxGEXMW/bCv/f3ykfjiSfHIyG296Xs5eOzzbs3oVu3JLddfuM6jRqGdJsrwDn5wYFlouVSKuxLH6SVT4NGSxK5LpYRtYPxkEoLPYcK2XNDdFm1L7H7CDd5l3k0Jgoh6cEHeCXi9+vn1LhXxULM7fexsuRZ0jBzJH96IV3QWWarZNkGUvPb6d2rjD4A6KIV0iiLN7MtvV4PU1XT7x1vpJZw+w374q7p/4+ZolOksnqw1xw8kOsXzAoPu1yKZLhNQ6zmOKOQMCdgDb0y2Oih2RyVTI6KVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=echqpR4vSwoF6VTqdjBRSvMm9RVhcVS/z9aiXSLA7Eo=;
 b=eF0oT8aIvyNbEf8P9mRQUuVG/NoMM2Kb+TBieGYIJwU84RyJbFkwiFp8UCIoXcPGyQP2EA0r+NbrRMeNm+3HExK+cNKd2eHO17HbvFt0mOAbn8Xfd1YY1YjIYDSZEecbzgTJCWbuhib9N/1GUJ8QezkvS/Mk2j2s000emwCaOYQ=
Received: from CO2PR05CA0087.namprd05.prod.outlook.com (2603:10b6:104:1::13)
 by BN7PR12MB2770.namprd12.prod.outlook.com (2603:10b6:408:32::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Thu, 27 Jan
 2022 03:10:01 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::85) by CO2PR05CA0087.outlook.office365.com
 (2603:10b6:104:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 03:10:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 03:10:00 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 21:09:58 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v4 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Date: Wed, 26 Jan 2022 21:09:39 -0600
Message-ID: <20220127030949.19396-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec8902e5-b213-44ab-2380-08d9e1428167
X-MS-TrafficTypeDiagnostic: BN7PR12MB2770:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB277038D90D656EF0C05064D9FD219@BN7PR12MB2770.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+GdVnhbmrRllv9+d949E4IQN5p2Nj8GTzTCR1/QEBds+mXglwfQTwprvh/Y4rxloej/5vhRWtYLu8k29KPDg9/mv9XhIlzxOg6wglTLQ78aiCme4n7G0Y+cmwuG8UuueBWl7stgBaK54tK1FYLryy6HH6bFGSv48HWmfVB48758a6+uPfbqQQc42glUFrAZk7qGgZbOLTfeJZULg/PsfWbMkIlT4mgioEihmJGi0KUzfteuB6wha/He/OAHRZSTUSm6Qtn51FuYE+2uStyQKPquOPB9j0lUnLD0yu2RnpqDN6ZyQCM62BQKlNKp/K50yrT+Mh9RH5oqxtah2rb2BkkN9KHfXr3R6B/bTNWPDF0LnoHY9dW0kU0MlTioBDEj4gy2f4/DIrcwES3qQQIQQTvLLa8GjUgljAZ/vJM3Dwr8F42HR+kHNyROvKpvYbGCbkuY3UzIDM+HwVb73Cdezl9TbVjeu8DiN12iZV9qaiAZwFU3xZ4eCK/B1jncld20V/S4d7K7rXhJdnKr86+0FOmfSGx6FpeLZ/dPFPVhZCuDrORqvMMOJBDo4Azy/tr+VCSFYZQ4j7YpBZOcJZt3lc08MRJc4BA+dsr/1LC25ibb7M4FNsxMmgOvoBF4IJVj3CHZ86ynY8Wv4wGd/qIfZpuvCezalaiqRsl8kvx5jMsSLHKuMqDJjcx2CN32CrKdOx0GIg8cCk1ohl7dfPMSoChgJ8kNQYKQhDFqRCPms1KT8o625+cLc9ELR8G94GU4wjAJ1eRjmlRqT6i0QHSUCq7Jf4yVUcYd21UZIdPgz78=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700004)(356005)(83380400001)(6666004)(336012)(26005)(2616005)(47076005)(70586007)(40460700003)(8676002)(316002)(110136005)(44832011)(54906003)(508600001)(1076003)(36756003)(36860700001)(7416002)(4326008)(7696005)(2906002)(81166007)(70206006)(5660300002)(8936002)(186003)(16526019)(82310400004)(426003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 03:10:00.2872 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8902e5-b213-44ab-2380-08d9e1428167
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2770
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
 mm/migrate.c                             |  56 ++--
 mm/rmap.c                                |  20 +-
 tools/testing/selftests/vm/hmm-tests.c   | 123 ++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  24 +-
 14 files changed, 529 insertions(+), 166 deletions(-)

-- 
2.32.0

