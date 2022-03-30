Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D624ECEB5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 23:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA2610EB17;
	Wed, 30 Mar 2022 21:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5730910EB01;
 Wed, 30 Mar 2022 21:26:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3Ss7SnLKXXdFRHGYouGgj1I7oB53sQPHG5uVgd6TwiuLlkb8HeEMil9qOHgTeL4W+gi1kgG3ThuCuhLud8dvM3MlTW/pJKTVTmPevESR6frX6qkqymBftJnXOr4uNrlTH/HEk636cEANRmK1Pf7KSClW/+SrLcPBnVk8iBqCRFYQdGnMYifJ7JUyFBmOpjcqPXyzmJiafMjHXPQV0oAlfMPQo7TFRiyQPuZ0UFwQ6uVbaOahWlKOiJ2ptisF1RhqQQUoqc/ufI0fdBVD0aqlgayg/cdTiQm81mr0uJ5IymvaULmIB3HpHUXW3rwYq+ZuzNZqOEycjYdKQg6PcuVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hbxc1WcxoxUj6X4zaVsm++woYkXZNQH/rVHpIIJqNIY=;
 b=oaC1nPzcg59ATJKcVn4rJ8jmrlFXXMPCnyZxVdDmh6vGYm765C2mv0fUsDmfPuOCDbVYGXd5on2Ion5K/S+oXH3EjP5LlGU96x0yQhKe+9J/5nT5mODk65Nncq1/FTNuvPUhDRrWtnQt2KhOYG5h4e6ayiB89VDS6wsAJ+a2yJk7Ums0kb5PGKjIaSNQ2K+HTf0yuZPJFDgEuUNpBxdirlyldpXRK7ou6K/J5qJCtrNco8PPyw6jpOb+vRum26v9cUyM/D1lSTRuZEz/xhKGoxqJvfifbU8CV3kcg48n4q8m7RMTCFhirCMn/G2FK/DiNGx71d4YJneXh3MBCrdLzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hbxc1WcxoxUj6X4zaVsm++woYkXZNQH/rVHpIIJqNIY=;
 b=F0hyZMHLxR4esuQpcNf8iKnEUI+5xf0wbBiH2JmoLlHCVe5kyI37YsvRH4sinzwG1nAaWtpjEluV2nissWBzYuPJMlTNMfbslAeb1aLpDH4rLObj58iyuY2uZdaKrZs5lVeSKa/MAnNGLdy9F/7h54PzPGip1PZP61twSMzINUI=
Received: from MW4PR03CA0184.namprd03.prod.outlook.com (2603:10b6:303:b8::9)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 21:25:56 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::a6) by MW4PR03CA0184.outlook.office365.com
 (2603:10b6:303:b8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 21:25:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Wed, 30 Mar 2022 21:25:55 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 30 Mar
 2022 16:25:53 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v2 0/3] split vm_normal_pages for LRU and non-LRU handling
Date: Wed, 30 Mar 2022 16:25:34 -0500
Message-ID: <20220330212537.12186-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6529de8b-c1d6-422a-7e1b-08da1293e012
X-MS-TrafficTypeDiagnostic: LV2PR12MB5943:EE_
X-Microsoft-Antispam-PRVS: <LV2PR12MB594345D410A4A81C5F14E4C5FD1F9@LV2PR12MB5943.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DOE62Vm4twDzY3GHNjK9w0mOfwMXKI8uE8EsMB1pm9oy+lotFkXnTG1YxRDI4XuWbx1uDr2bILhrwwlEbvjjW6vZqYm0jeCvyNqP5W61uaA/cSOktv3biAz8HZjryekVg5TS3L6cF4WXjAcj8jXosnC6cawfCL08dDeLezfFcr3CzBp+UevWvaf/ThKPePRBR6KCVKOWJVkqH0edpk8NPTdzmIL8OCUquIu56tygdtNmaCKEOXRIAGjjoiXHfrtmJhGiSC97W3FrQi38BbUs5Tx3TN1ZdnXPH/OHB6Pux40CJ+ylf3D7qKsCh7wrow+r8F2jQUN4CAoJH6UGpP0Optkw4j4JP8Ct9bkP/dmOpg9fBvkJ8zNMGVyagYaSBFmFf6anF1EXfyZoERbZdQkeLkUBY/i2gowiht/3uA6TmN2GQTZX8UpL5AShlxBEOUaILhOTF+Wm5pg/VoZgyFwU9As6DXKPZExvJ3/OSOehzT3L5eUxSQyannjY8f+4eitJOgPeJoqRdJ6yImVRaVRPDvIMgE+KFuI9g+01q1xrFbZtJNlEDRE+RK8WbXs+U2hcaPuzGcP+CdUlBtxcsfYyMSR6bukln7Zcd2SnSZWQnL866i0+r+9AIbmPbxHYBedxwkJglbZahIn9j7XsmFInv1sMrCkqFujtwqKkifocx5NGYB0pwNj4qdTtLWpmFl7wYQQ6KOAwV0WmUS0papAXoQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(186003)(336012)(426003)(81166007)(508600001)(26005)(44832011)(2616005)(1076003)(16526019)(8936002)(7416002)(47076005)(356005)(40460700003)(2906002)(4326008)(5660300002)(316002)(54906003)(36756003)(86362001)(70586007)(7696005)(36860700001)(8676002)(6916009)(70206006)(6666004)(83380400001)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 21:25:55.3272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6529de8b-c1d6-422a-7e1b-08da1293e012
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With DEVICE_COHERENT, we'll soon have vm_normal_pages() return
device-managed anonymous pages that are not LRU pages. Although they
behave like normal pages for purposes of mapping in CPU page, and for
COW. They do not support LRU lists, NUMA migration or THP. The
difference between new vm_normal_lru_pages vs vm_normal_pages() is,
the former makes sure to return pages that are LRU handled only.

We also introduced a FOLL_LRU flag that adds the same behaviour to
follow_page and related APIs, to allow callers to specify that they
expect to put pages on an LRU list.

HMM tests were added to selftest to excercise these changes with
device coherent pages. New test called hmm_cow_in_device, will test
pages marked as COW, allocated in device zone. Also, more
configurations were added into hmm_gup_test to test basic get
user pages and get user pages fast paths in device zone pages.

v2:
- Changed the general description for this cover letter.
- Changed commit message for patch 1/3.
- Keep vm_normal_pages and add vm_normal_lru_pages, instead of rename
both.
- Add proper kernel-doc format to new function and minimize code
churn.

TODO: vm_normal_pages with pte_devmap entries still return NULL,
instead of return the actual device page. The reason is
page->_mapcount is never incremented for device pages that are mmap
through DAX mechanism using pmem driver mounted into ext4 filesystem.
When these pages are unmap, zap_pte_range is called and
vm_normal_page return a valid page with page_mapcount() = 0, before
page_remove_rmap is called. 

Alex Sierra (3):
  mm: add vm_normal_lru_pages for LRU handled pages only
  tools: add more gup configs to hmm_gup selftests
  tools: add selftests to hmm for COW in device memory

 fs/proc/task_mmu.c                     |   2 +-
 include/linux/mm.h                     |   9 +-
 mm/gup.c                               |   8 +-
 mm/huge_memory.c                       |   2 +-
 mm/khugepaged.c                        |   8 +-
 mm/ksm.c                               |   4 +-
 mm/madvise.c                           |   4 +-
 mm/memory.c                            |  40 ++++++-
 mm/mempolicy.c                         |   4 +-
 mm/migrate.c                           |   2 +-
 mm/mlock.c                             |   6 +-
 mm/mprotect.c                          |   2 +-
 tools/testing/selftests/vm/hmm-tests.c | 139 +++++++++++++++++++++----
 13 files changed, 187 insertions(+), 43 deletions(-)

-- 
2.32.0

