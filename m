Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA1B4D506E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 18:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0308510E620;
	Thu, 10 Mar 2022 17:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D8910E6F4;
 Thu, 10 Mar 2022 17:26:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apiZ+4XrAgR3tae4N+PXK2OJFDhbCjUq+DHxAWR87ttgnq9xQgkaF47z8zb5dCSfM/JN6HS2yEjtEEWElx2JZeFgCuwIw6g3/mCAlyoFU07Jntxsz+ncI1YMIdZmvq/kr7gTjIiYTQXIFohkCf3eKBb7pPch1o+noE4f3S1S6kcERMZ4Si9GKqMWVEFSVypgdAq2c0fj4awaan5TVw09NDuAJhZ7zW4SLyaUqxW8G8khz3z+bk1jizbpLJwFmucVBzE2SmtelKduOhEOXXGMOJbppqGXAx2SgRQijHR4pNmcLWi3K9t1tWw+1UVop2Na1LtHZK9SDfQXaI2QUMkVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnWFLTo1EmDBEkgRQX+BhCHTg4ADh4HAgu1C/JL/8HM=;
 b=GPkoBmptL1yJRxkz8oVoKjktf3aYLfXQBdLZGB8Ay7+RBNNoJcsOZFT3MijC8fWuz9WqzwvYd52sWMcUDN9sLuYJQx6d3PfC0fCZH8PzYRFrmCvaXbaXcaxi6cMD9rNSJqzAlZYw80Qb6e24iIHeQlzGyrcyevEcxYDg5w4kLUms8HHYUjJhGf4NMf6v2OuJlnjLC2sjEeazASl510J8DOXStbCfJS4t5SiCnX+g6/ldHHLGDPkfE2Xi/gcolI6imjkCiQg0qwT4ybiwuCYB7021rRXShm5P4tVxNWaoFFGQ/5hzF3byZqS1sYtmTuorZPF6NgTUkW27q2PE6h6ybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnWFLTo1EmDBEkgRQX+BhCHTg4ADh4HAgu1C/JL/8HM=;
 b=0nBPy5oJimiB8SHrlfnjQDxEGWVieC5xDZYjR7o8dDnhDHRrJ8Zg2BrdfWhNLUFygzkYFZ4PKSBOgSYPBWU4psJ89LyOH/GQyxezHjpEFXUM7DjnwKa2dKTXiKkQ0Ajj61265MamON84OG1JlMWoJ2AHfq/TghxXA3OZiUQS0jg=
Received: from DM3PR11CA0020.namprd11.prod.outlook.com (2603:10b6:0:54::30) by
 MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 17:26:45 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:54:cafe::ce) by DM3PR11CA0020.outlook.office365.com
 (2603:10b6:0:54::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Thu, 10 Mar 2022 17:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Thu, 10 Mar 2022 17:26:44 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 10 Mar
 2022 11:26:43 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v1 0/3] split vm_normal_pages for LRU and non-LRU handling
Date: Thu, 10 Mar 2022 11:26:30 -0600
Message-ID: <20220310172633.9151-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f2c192a-dd52-4b53-2f6f-08da02bb264e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4470:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB447059BC66D0AD054F9A5441FD0B9@MN2PR12MB4470.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7MUn04bFNM3i9AG3+jW4a3U4DKxPkIJhgjzj4WVZddbPFXDHIqGTGxPO/zg/tMQP9sntTaH5B1mGZh/P9v4oyOxx1melFf3W+2rkle6f5vL1i8EMkvJCqr5mUTVBss6EA4FMt5mv3PeG1kWsQzxwC6qdAWKK5D3ZQmxj0ooc+yXnIvaqoy8Wax6CxGeHmQbQNXedoM4cWfCXmjo0BwQRmQvpfUVOwIjBNPFnA9RTleb20tR1R9qV88iCDesK1qlnVrXmRbm6bkOT+OgiW49YYiC5ji0/kd2AyCRtynMgy9pl0QgrNbid+YR6bgdsMut+Y6BArLYDahrZ60wEZtuU6APrcaS+4/NX8mQ4Mx8ULUQDQtjOGdzYwzLPB6u/zEDG71zkx7kY7QDcGhCl1sPZNVx3rVx6zA/X54Ce8JjktaMD1r6qZZnScrr7bt61NwVygVG0YRrqiLQNJhJPbxmSxcEStVDf6ILoeHlshEVgQ49pljPDLkr7h/6pObDmX95qTORi5phZt84RdJrh+iqKqjTM6e2rRFvcTKhXUbQgOgWnW0JshroiQMdi3vP+FQw29MKBao6i8UkV74ACsYL2ULOk29/HLFCbGBzWg1lI5HZeOXw76xie86z4XFr9iU9B9Dyb1NR6eWRjLiAPriO8XGP2BHCacZK3TPvRMWC2SIvzzbYgi7DglwzkzNzDpffvCD+nASdQVZDw0GAXEuVS2w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(40460700003)(36756003)(5660300002)(7696005)(83380400001)(316002)(86362001)(8936002)(4326008)(336012)(70206006)(426003)(8676002)(54906003)(47076005)(36860700001)(6916009)(70586007)(81166007)(356005)(1076003)(508600001)(16526019)(2906002)(44832011)(26005)(82310400004)(186003)(6666004)(2616005)(7416002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 17:26:44.9269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2c192a-dd52-4b53-2f6f-08da02bb264e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470
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

DEVICE_COHERENT pages introduce a subtle distinction in the way
"normal" pages can be used by various callers throughout the kernel.
They behave like normal pages for purposes of mapping in CPU page
tables, and for COW. But they do not support LRU lists, NUMA
migration or THP. Therefore we split vm_normal_page into two
functions vm_normal_any_page and vm_normal_lru_page. The latter will
only return pages that can be put on an LRU list and that support
NUMA migration, KSM and THP.

HMM tests were added to selftest to excercise these changes with
device coherent pages. New test called hmm_cow_in_device, will test
pages marked as COW, allocated in device zone. Also, more
configurations were added into hmm_gup_test to test basic get
user pages and get user pages fast paths in device zone pages.

Alex Sierra (3):
  mm: split vm_normal_pages for LRU and non-LRU handling
  tools: add more gup configs to hmm_gup selftests
  tools: add selftests to hmm for COW in device memory

 fs/proc/task_mmu.c                     |  12 +--
 include/linux/mm.h                     |  11 +-
 mm/gup.c                               |  10 +-
 mm/hmm.c                               |   2 +-
 mm/huge_memory.c                       |   2 +-
 mm/khugepaged.c                        |   8 +-
 mm/ksm.c                               |   4 +-
 mm/madvise.c                           |   4 +-
 mm/memcontrol.c                        |   2 +-
 mm/memory.c                            |  38 ++++---
 mm/mempolicy.c                         |   4 +-
 mm/migrate.c                           |   2 +-
 mm/migrate_device.c                    |   2 +-
 mm/mlock.c                             |   6 +-
 mm/mprotect.c                          |   2 +-
 tools/testing/selftests/vm/hmm-tests.c | 139 +++++++++++++++++++++----
 16 files changed, 185 insertions(+), 63 deletions(-)

-- 
2.32.0

