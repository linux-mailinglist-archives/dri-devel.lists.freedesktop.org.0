Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C6E4AB37E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 05:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E865110E501;
	Mon,  7 Feb 2022 04:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2042.outbound.protection.outlook.com [40.107.96.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8462810ECEE;
 Mon,  7 Feb 2022 04:27:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ip9FjhPsLXsClgXYq/+npo1fDVlt8g/VBGsawW13wBIkjCJ4U/TprNaMjX2PDisWvjqDdsytJfCv5MX+5XYXQ+qco1JawNJSL1zOfDO3Qlx2z6JjbIF9RqNjs1qcKO/dildSr+YIDDSPyqJQF4AOfl2m/HHYWgSSEkv/7hGAsA3UIiogA8eX/3pDIzdOw9rYgvIyi2ErpT5YPk+Rj3O0S6EA3UTaP9SoZMmGIyShP4FQTmLLF46N21w8hjNB9fyfbj+k9YxsfVZQ4ElCukWRPlZx8xZh7PwKElgCHlQ8xT8yY31/eRp/Tth2hKWIAtfx7LLdme2BV0DXlQsU3CYg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkCCpS26hw2Y862kKJ7D5CWLltn6i0oJOjrup6h+qYw=;
 b=jiJEisczFw/E5NahcRjKKNGBy5zoHoGrr9ibyjqojQh1XkZQKclYwbTspCejioyvVfAIfiDKKBKoR3EHRTz91323TeTquHfovFdInU7iS/UoEark48JVIkfTx4BpHpulBCR5dEUS27+gbST1pR/NJo+F/E6St+/s6GQEGPBRbQgsoLHKGPzFNpM7QbHXxh29Qb/MwXVS+KygFDCiwW9CnsoW6dqnl5HrLP1LatmbaMnFwSJcaRbabJZdEp7pemz0aqQ88ppt81752G0+vOB34dJ9yi/cPEGmYUSKU8NI3XQa5x1aVgs3rygwydR56OiCHjM0IcJvFb6bGrGYWddGAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkCCpS26hw2Y862kKJ7D5CWLltn6i0oJOjrup6h+qYw=;
 b=ZUq35hzOLA51MTSPYgYVVJF1Mh2hhHd11tUTe5SLJDoDG+Ir0pxvaLqAusCU5ZfHel0Im+nRkZ5FLq8mV10JYPJEbJ9r6TbkvJG7hNzqD2y56UddxmG90k9q8YZa6yV5Kw6GaSwsiiRbB7kFxqIdl8b9u4rLwFd7cCSSAYyYB3lxfhCnomR8M4TU9cYuQb5w9Th3pFI5PBZhWveBLRx0S1RWBG/naTYeADSf5qaK2R2qpl+s3MwKHCqG0W8YAUhTCpvxUPsDz0o1zzjT2+mNCkDHpkBQsVS7bxvOqZpUSubk1hNXs6pygNbkOUpULL4gns2BysfG4tIY2LZqnD+6KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BL0PR12MB4705.namprd12.prod.outlook.com (2603:10b6:208:88::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Mon, 7 Feb
 2022 04:27:17 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::1528:82a2:aa0:7aa6]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::1528:82a2:aa0:7aa6%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 04:27:17 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Subject: [PATCH v2 1/3] migrate.c: Remove vma check in migrate_vma_setup()
Date: Mon,  7 Feb 2022 15:26:46 +1100
Message-Id: <6831bf69f7c7699be83b31c9c56212b5fb07f873.1644207242.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
References: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::9) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56364539-0659-4834-2024-08d9e9f21f8c
X-MS-TrafficTypeDiagnostic: BL0PR12MB4705:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4705858281608B37F4FE1A92DF2C9@BL0PR12MB4705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PcwLGcEYFltu9vjb1KDAdusecsWLx9NiW6J+q+NsVAtH3cAgW+Ea6vHHxthAu3XlD5egTSpDzgUCUe/7lCQYqlTLocu/l+uYpluFy+Op28+XbDRJuymMy4SLv2BQxUZGMoKDNOF4mo1kNmH2nKKLJjWEakBwOwbLYndWQMdiq650oX3EdYw5DCrCZazm2wV4kbEGi0rm4TavZTuH5kfGeWEZkkArkDH8RKtLtOizoWJPgu2jxPCsGUSRdsxZ16UoqvMxCTTxAM0FVsghr5fRGXT/hqrWkDdjQLq2DSJLXeDiHRBi9vSwiuRQINmP8Xu/hks+DaeQbA1oe1jhOD0KIe14jwX+3o4ud9koqgQwFMAJuef8jlLcrhXjZ70opULcgZm2eFhJ1rYqhCGZq4oHXOgYkMA2QslmFd38O+YvmMEkQMMtm5uyMeMOGrnrTh3Yq3/7zClHhBKpz1ljGvoMWOxSJCXW+2+fjl7XhwF6+4ZtJWcd4rttR6DkjrHFBEW+rKUmMGFXHHYn8zAxdsnNcUNvBPBst/G2o46f7DVDTJ6om3VhaceBP7LrrrWWF3e8VhJlkc/d253pVldA4gnKMMR2weQdypvRKRks9L3nGhABkyj6IqDkT7DpWQUCQeoGghf3pp2crWoHLMGxVDJJsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(107886003)(6486002)(2906002)(508600001)(26005)(186003)(6666004)(6506007)(2616005)(6512007)(316002)(66946007)(8936002)(36756003)(83380400001)(7416002)(38100700002)(5660300002)(4326008)(66476007)(66556008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WBmy1DBefPgkW902O9LJg1JrrOxelPjRIpkuobgDkkMqhJq+bZTTQOPL1Agh?=
 =?us-ascii?Q?sJ5FxsWYVv4mqub/SMwFimDGp+V8lL7Dw8g4zfg+kI0m4iE2YAs/JDPR7w6b?=
 =?us-ascii?Q?xdnnJDWJ5/gfZOwFMfjB9M6T3cx3Y/LkaEy5riPHBA6dPU2IDBAbzwopN65k?=
 =?us-ascii?Q?v62eOURX8uaD44nrV4tc/u5RKclX5z2OmTpLI382vDk/WfXfIYjOzSREUEcG?=
 =?us-ascii?Q?uGt4+h2v5Kjut5f+XH5gK5ZmIsoLG2okl8zJkIXkHAR1lisV6RSLmm79H8gm?=
 =?us-ascii?Q?Tfu9J4kU1j7+uwUOfrGfSMdQ/2ktgHqCpXWk/QuX/DM6fUFgUIMHdvzDTN7M?=
 =?us-ascii?Q?7z7x/ihG7xRYu+y2BS/pHOCRORBKv9w9uskNiWJFOIOLHMWpfjC7y3AytY9d?=
 =?us-ascii?Q?IDcxqTcYSPAgob4eHAbPASTJ7IIBXkiAS/GEdxHXHCG9KxlXh9jf5sgBg7Pv?=
 =?us-ascii?Q?5HJsaDM787mi9x3sy04e6oYhOOcSSzEIETJ9hNEG80VAUFdG/cJOhQP26AWi?=
 =?us-ascii?Q?8W9WPmn8ZrtiopWm9zRT1Al6jInTifIyFn8pPP8ryOfk5RcSb0DsgdNVo3tQ?=
 =?us-ascii?Q?FH7W5qikqNHdx8bpYuEoQpNggYX/8DRgK+Oob75Clz3DKQuiUCETO3kf7/VS?=
 =?us-ascii?Q?BwqVP6bEuAPKbAcOVWuSEKOvG2HW7rblJOpatPMOT+2ZjzoWU7lpdnp/XirN?=
 =?us-ascii?Q?c7ClphYY/TUmd+ZzOea6agjneBcaea+ymlcf7p2MR331x8b50We9BDSCzPRk?=
 =?us-ascii?Q?l5qCyuZkCYAt2U656pc5BOKVPiVywQnP3+LkEXlWG9ZPg7G6+QTvaozv2BN0?=
 =?us-ascii?Q?6a8mQbI6NVJiitp0JFWHgAqBvs+vf1esuJu9CqB1CzJACfpUna4wiBRCak9A?=
 =?us-ascii?Q?mvChd3IMTKh+79rXJPY/YJam9Ag3Ch/IFTYATMjTruxfpUkTNPg/WOLrsR5V?=
 =?us-ascii?Q?O6IbbsWo24SqalajkSxjkWieB9WAg5JH4QrfphejNFN98XzCKVv9lIxhXnkc?=
 =?us-ascii?Q?OvOB2NAxL2Jr5HbzzFgGZ/xvFSS3cCMntrH0flNFSGQnsWqHFOL6c2LjVmte?=
 =?us-ascii?Q?8P2myIF5EExFJ7tjUHKZ8ldbub5EFVvW3dvLK/HMebvW71vOaeW/Gl6a9PrN?=
 =?us-ascii?Q?cb5HS0AYMjYwefiwiHCGIME8E93MLJ15srLIOBUE4XGWrw0jjh+g7xl5WRJM?=
 =?us-ascii?Q?F37XNnyH9dDcxlPyhnQ86C3zD1M7gnWsrBnFBMnCki0kPHt7L2sZkFbYFIFt?=
 =?us-ascii?Q?BNq8WmpZgdhB18y7hX3f8eqLyHErEhRa8vdPSYI8465MVaXfC7zKzzsPh7NJ?=
 =?us-ascii?Q?ZuWHc03uAhmVJKhvPwDVSMtdRGWZggsy/eIhW/Y5dZ6Q5r60886DcRjE8Zvv?=
 =?us-ascii?Q?UjbRlf8/t9z/tXdHCkadgpxtYqcBblfpOYZ6Syv0XIPMK3Qs7E/3bqi0sJJX?=
 =?us-ascii?Q?VuJyao0mbzjqHLd78WMSginxhzllpW8D9TWzfzCORjrY5lXphuD0g1IRE3HW?=
 =?us-ascii?Q?0jG+Djc+3IddLwYzNpS40ORWgprhcR9uZHGRFvoEfftuQGQV0Qv8ODsrsvxk?=
 =?us-ascii?Q?KWQNFutL1P8UswfB10cXsms9HqDuWs0BSsyYdkeEbtADOUZDrKc8zJJDYSfN?=
 =?us-ascii?Q?s9XYpPQ/hCGTW72mO/dVAWQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56364539-0659-4834-2024-08d9e9f21f8c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 04:27:17.1207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38sdliCVsPWpSQ4tbKIE8qDW7jmtX52dG4cr3cnWe1edizXE97SmpTURA5emzlxrpJFIo1NpAV19qlqH1zIn3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4705
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 jhubbard@nvidia.com, Felix.Kuehling@amd.com,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

migrate_vma_setup() checks that a valid vma is passed so that the page
tables can be walked to find the pfns associated with a given address
range. However in some cases the pfns are already known, such as when
migrating device coherent pages during pin_user_pages() meaning a valid
vma isn't required.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
---

Changes for v2:

 - Added Felix's Acked-by

 mm/migrate.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index a9aed12..0d6570d 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2602,24 +2602,24 @@ int migrate_vma_setup(struct migrate_vma *args)
 
 	args->start &= PAGE_MASK;
 	args->end &= PAGE_MASK;
-	if (!args->vma || is_vm_hugetlb_page(args->vma) ||
-	    (args->vma->vm_flags & VM_SPECIAL) || vma_is_dax(args->vma))
-		return -EINVAL;
-	if (nr_pages <= 0)
-		return -EINVAL;
-	if (args->start < args->vma->vm_start ||
-	    args->start >= args->vma->vm_end)
-		return -EINVAL;
-	if (args->end <= args->vma->vm_start || args->end > args->vma->vm_end)
-		return -EINVAL;
 	if (!args->src || !args->dst)
 		return -EINVAL;
-
-	memset(args->src, 0, sizeof(*args->src) * nr_pages);
-	args->cpages = 0;
-	args->npages = 0;
-
-	migrate_vma_collect(args);
+	if (args->vma) {
+		if (is_vm_hugetlb_page(args->vma) ||
+			(args->vma->vm_flags & VM_SPECIAL) || vma_is_dax(args->vma))
+			return -EINVAL;
+		if (args->start < args->vma->vm_start ||
+			args->start >= args->vma->vm_end)
+			return -EINVAL;
+		if (args->end <= args->vma->vm_start || args->end > args->vma->vm_end)
+			return -EINVAL;
+
+		memset(args->src, 0, sizeof(*args->src) * nr_pages);
+		args->cpages = 0;
+		args->npages = 0;
+
+		migrate_vma_collect(args);
+	}
 
 	if (args->cpages)
 		migrate_vma_unmap(args);
@@ -2804,7 +2804,7 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			continue;
 		}
 
-		if (!page) {
+		if (!page && migrate->vma) {
 			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
 				continue;
 			if (!notified) {
-- 
git-series 0.9.1
