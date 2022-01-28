Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EFE4A017A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 21:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9122E10E18D;
	Fri, 28 Jan 2022 20:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D1A10E166;
 Fri, 28 Jan 2022 20:08:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBbIu1axi3dqGAkxUzE5IZtE6z3zBKJvku2yFk2gjuDD7eZHmR494FWP4r2mklWVgIEAvSeZ0yoZM+W9QFe1j+lI0qsGeKI3Ce2BDh+rz8dD93ovmVwB6L/MZRqlDw0fAoqi06rFsC3+Y0rPQtPvEvgSdFrjZv2BeNCDfNvyQYNMKnrUeyiiDPvEwnAFXGPHVR95tGQgW4q7SczwVqhSVoc5g5WYCmV9xcjOqS9pjIPpoNo26frqCXGj50S0esAr1Q7SEGx9LF5ooc6y34LaPZ2p+QsKsHDMTYFfxIkNp2fo0EyevcGFdjkZMhw2ZfxNs+Rdph8O6UqXGY1yO3e3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRkbjGv/hJkmKw0RHzcKl0piYQtGn53r2WDSrGJzVH0=;
 b=JHUWkiepT1/Nof8Ppxss2vLYFVHQ0unRGGwwyG/Q8/JqSOzZ0k/7hJKSRrCqVTYQwBeDtrcVsFK18oCxyU8GHjqjE/dP28fXrDYByaXaqkABBc+ZoPZkvuhHOhEc0KoqQNNhY5RBGb/oWDMZAlvoMNbYctukJ/MHg3Ch27bpRHoOdFX81B7P2tRB4HUxPMHpxG/pSySermhDEm2RKO19sauOl58pYVub0C64DoZ97GVq7DM3yX7ksToN4mMn2HkgGblU/+P3UzM1QvfxJAJjm31RLfSH+DxSudgexjJXPAngEt2zCeK+91PD/brUgbZ2OV5V+DXyOx2kBGULx3PF4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRkbjGv/hJkmKw0RHzcKl0piYQtGn53r2WDSrGJzVH0=;
 b=Yq7a40e9ZXLeS9D7gbdSn48qHxZbZ7xe3PhkqNVkO2tUtZRxnd7A1Ub2GHHcBrnih2zI2mbPeGQY87vHdP0KoGLWbxxloWnCz6HIzADjMyrKwoSi83yf+yRc+cYw89L4f6Xug7r2Qbkyqdm10XB+ArBVkfn6vTgNabXmo2xr6No=
Received: from MWHPR19CA0049.namprd19.prod.outlook.com (2603:10b6:300:94::11)
 by MN2PR12MB3806.namprd12.prod.outlook.com (2603:10b6:208:169::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 20:08:52 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:94:cafe::13) by MWHPR19CA0049.outlook.office365.com
 (2603:10b6:300:94::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Fri, 28 Jan 2022 20:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 20:08:50 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 28 Jan
 2022 14:08:49 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v5 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Date: Fri, 28 Jan 2022 14:08:15 -0600
Message-ID: <20220128200825.8623-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eacefe74-2bd3-49ee-818d-08d9e29a0089
X-MS-TrafficTypeDiagnostic: MN2PR12MB3806:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3806AAEC2B71BAF43A41A34BFD229@MN2PR12MB3806.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M6WFivNghbmkmUi2SFsA2I0T7/LJr2356PLZKwR9hsALlFpk41Gz0+TMkL4Qb6YRPsfy5KHtaHVpW/vK5zAkShmFEahZMd6lqfuo3inClk8GkF/zuCh+nJfTMI5yETtXnnkOnBNCyzQu7LS9GeYRp/ddbNafs+cI+joJK+AExlDKOD2AY8+wc+Qg1yBGT7U45AN/S6zMyy0sXkcP8C/C9EF9kMXZbHi0WLOiGTMu3d+FPVH9aHXoneT4GGQMNIVnfUKunQXwKRfYhfO+EZN+HxbjsbzvVn7WZjD49Rdi3KBI/WNwKF2flgrUsTnLjjGWrcsNI/U2a9kRXzDlh1FjNFBC/TTlmL/7dn8Aq8OiC9B2q9+wTMMPMryos2myD/NrwZmuZwAhdoWvDiI1ETfAU/TnlwQBBj6eDArz9SDfqqxR90doVrW3u0BggZNXmesuA1j/7wmpX0KLPY5TYJoToTGp0Aru2dPyq9+Ne8xXbGOXZgUEyZ2S/721or7N4rMuKGMizGhu8N3I0iyyeBUa+USMFBQvD7u6O+BBuOJjYH62DOYfG7xL15KZvbcPtU8ddU7ny4IbIn8Fdzd+OuK02m1HhSKiVU56PLUxUN9IjrQ/TbO4uD1YOpQpkh0ROo7w9LNwqS+R5xAM0QCkspVN3C9xVjZz8Wg83XQc7GZkPRy7JozeeIxPhqisF5t7aV8fTDkmGHSXxpYgvbZjqfTeOw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(1076003)(26005)(16526019)(186003)(316002)(2906002)(36756003)(8936002)(336012)(426003)(7416002)(8676002)(81166007)(356005)(70586007)(70206006)(44832011)(5660300002)(110136005)(4326008)(2616005)(508600001)(54906003)(40460700003)(6666004)(7696005)(36860700001)(47076005)(82310400004)(86362001)(83380400001)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:08:50.9613 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eacefe74-2bd3-49ee-818d-08d9e29a0089
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3806
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

v5:
- Rebase on 5.17-rc1.
- Addressed Alistair Popple's last v4 feedback.

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
 mm/migrate.c                             |  55 ++--
 mm/rmap.c                                |   5 +-
 tools/testing/selftests/vm/hmm-tests.c   | 123 ++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  24 +-
 14 files changed, 519 insertions(+), 160 deletions(-)

-- 
2.32.0

