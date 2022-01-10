Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D528D48A2EA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 23:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9E910E397;
	Mon, 10 Jan 2022 22:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BBB10E1FE;
 Mon, 10 Jan 2022 22:32:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DW4PPAdP6TGm7e3U6VRygLBFkEPYsPpyzvLH7vQyUqSRI16wkZMZXRkGX+W5wWxiGZKxKStt6yZ8HU0y94EPQ+rTSc402zgQAv+x/yAFypuNeCtaeUdwcLrdtQbbjXBgNQTYCSknaMPLtPZnJHaPpknipTfcsc7F+CrB1lCixWLNeavNLDDOKaLfLlJogxQfYSrgCpB593tdl2/HBxbC4vOECSs3sj/OIgDdArB6EcTBmJYliYww3LV5xu3AqfeTW7xH1dFdzjgYXhudbc0aDilJeuN1iWPUX0J+v2Zr/aGt/GzhGlc14wHXfivV6VuOPbNK9syNp2h9VwzzG2zOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xR82BW4h6NFpqaoY0q6TPilayF+99w063kfeUZFnY3s=;
 b=GdmEPwMGwk5P+/n+N4xj1g7D1icrUBjnjnz33AyoWU7pgTlp6k7xP4bIa5wfeUVd1hK+l2N5JPIK3IDSuMiih1G8w7Sgi9/DgrwHryqFSfrsS3z4fjBx8V3QSK4OxnYKLSCbeD40/2CcLgFr11TLMioLTRu8ZVW5KrO1bzXDkeBNxUZfhutMZtiPky6zyss9n7vTepcMeMG7iTAMnQai3oSZ0WBd+JrEV8SbXUj8Ajuh5SbFEU6GKpApYuEZT2UE775i6VCKjytiBHvA5J6wZV1UPJJbZdeUEoo0nNnQTETrYqjGUPqvUMWGlbk41n5PXE8fMJ9adrFgLimw+tBe+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xR82BW4h6NFpqaoY0q6TPilayF+99w063kfeUZFnY3s=;
 b=IBChe8+g4a/xj3HTqAULlZpJE6As4ubSOsXUKozuaZeHAH/ho5s8gwiILViOqQAQsnA2NNE9dh3tDsLIovnOnZRB3/jVjOJ1sklnosyJTZXo53aT/Oboxcotyei3cQAZE9M1q5Kpgp6meP4SPfK5sIXrhuceFQe38mMWV+65pZo=
Received: from BN0PR04CA0128.namprd04.prod.outlook.com (2603:10b6:408:ed::13)
 by BN6PR1201MB0081.namprd12.prod.outlook.com (2603:10b6:405:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 22:32:13 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::a8) by BN0PR04CA0128.outlook.office365.com
 (2603:10b6:408:ed::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Mon, 10 Jan 2022 22:32:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Mon, 10 Jan 2022 22:32:12 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 16:32:10 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v3 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Date: Mon, 10 Jan 2022 16:31:51 -0600
Message-ID: <20220110223201.31024-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3ef1d66-ad2f-444c-c2e1-08d9d4890c35
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0081:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB00814A5943DD01D6AAFEDF1FFD509@BN6PR1201MB0081.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CkmHSLvWvNsde18u0QJEJAOCfhYmTi574o6+bIpN0yToODXDAQevlUZk1BIUZAOv/M0dtOSvGf9tj/YFptxaaAj7bV8wnBRNtcMcYpCgmeR74QDqfsXcMC8vDUE1si/YgT/Uo3GcERTZALMNelEnpitjccS5KYKDC+/7xkD8UiXUTwS1pacw3eYLoI1LK4FlJzYaSrf5OcspphJQgNYxHFdn4PnS8V3J0ruvvJuYqt3a/MU3KNWuAny9U+0ZrNQkyFFZpwZS8Cxa5xND8LH4V1sGVKzDY1tLS2aLvYS4mXNbDEh04jiA3RiOVJiQOF0aE/q5LUcvxU0sgmSGO1LkTpENNn5/5sYTKmLQ2EX31rxnd6eul28ea1BZeFTqoOCJM/eUkqtyi+w25HQJBNyjJnym0N61j8nh5CGUmXT1wOghG5y1E6WkuSVU1ubqF+siiREEf54qOn4ZC0she6PJXlmJAzCdcjoOCXjdYMJyuobaHvldp5yY+Ohvi9pn9gje4jUsqwrhPcMPMsXJFj+KgsEIM6Cnl4RSqtDWpreUx9rQtxOF9cRchRt3s9y26hX7zvlUvX4MFwZ3sPFlA7ZaW8xtZroIEJvlNyZxyOrbtFBJElzrdt08uj7qLOe4ZY+wGNmWdQlZe0D4judq6GMPoQruQrOnq/bw6rRms9R+mtHDGkTZ8ZJHdik6tAGZwVL3DUeeaVthtX+RRnbZGvj2ToE4Cs7tdAwvz4mgnmeMn9Fyo39WTylc1c49D/AImCDeoDUstRGoaKG2SaQhyrUNrEuPMaZktlYLcS7z+WFKhQM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(6666004)(83380400001)(16526019)(336012)(70206006)(4326008)(44832011)(2616005)(70586007)(186003)(36756003)(1076003)(356005)(81166007)(426003)(508600001)(86362001)(8676002)(7696005)(316002)(7416002)(8936002)(54906003)(2906002)(5660300002)(40460700001)(82310400004)(36860700001)(47076005)(110136005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:32:12.9625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ef1d66-ad2f-444c-c2e1-08d9d4890c35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0081
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
 include/linux/mm.h                       |  16 ++
 lib/test_hmm.c                           | 333 +++++++++++++++++------
 lib/test_hmm_uapi.h                      |  22 +-
 mm/gup.c                                 |   7 +
 mm/memcontrol.c                          |   6 +-
 mm/memory-failure.c                      |   8 +-
 mm/memremap.c                            |   5 +-
 mm/migrate.c                             |  30 +-
 tools/testing/selftests/vm/hmm-tests.c   | 122 +++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  24 +-
 13 files changed, 475 insertions(+), 141 deletions(-)

-- 
2.32.0

