Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5660A624F16
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 01:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F8B10E178;
	Fri, 11 Nov 2022 00:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDA010E178
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 00:52:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kfv+6WRJ136Jgwh7wGr3fY00t2LAmZfiWKKKFi1qGmY1i6snyCEAnv9aOCoYrL6slCUVPYCc2P7cpPrUIbpQAhWPt+EM+8CG9wrGgjnRr244QEOw8xJKS01U9RczYWeQbmm0KLyWOu5+gqrR+5B74xaTJTssXPZHqRNBOJZm9ZusabZDpu4uuO/06uPWoiJUPosVBTbkB8pD5Fe5vnGO4EkTfkEkzTI55M9yM8JilC5JyFvdkhhJq6ToVWgZlbiSG/KNj7u+zMQR6FlbiNpnXjxXS9f/bQdZsMlQBa9P9eQhJqRp31BxMOKpjkbKm9bktRxw15+tdh6GXYFAattmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/KiuXL6A/fzFfQUHzS6755NF96rkOu+4K+dhXcB0xc=;
 b=RCNrX6eenFqRUfFnPimlG1DpwQ9lnCzXFmhoq9qp3ki3HORp13FaT3DeYUkrnWjOWkARFbR/iZlEEJlTeEopZ4yo+mM9C7olKnZWcj6M7ucY60Wn/xwh/6Xo+GuU56Jcr8h2p8sNnesLUQ+lQigmpeXqIOKHaBaOiflTJzHVNvbDbirAZ6S4Ulv01HCDD3KC5cE5L/i3nHX5GWEE8w58tYn18bnOB5eQQLLcvV6+ZmaGfgkx9TfcgB7ZirMOLj8PKJLjLgHcj6vqZ46vupBpwyV3PcC0Etes7yiAjMzzvyqsTRZep8on9pvooN4Flc6O543uwD/orjn5nlUzT+Y68A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/KiuXL6A/fzFfQUHzS6755NF96rkOu+4K+dhXcB0xc=;
 b=qs0jsxQol/I+M6jO2Ajr7QHy1Nct5biQTgoGzGrEBVKwmyMZS2E947FThEdbEU/teW9l4jcrJiwzLrB3TYpPlNwOc7HedhUUqKR+ZzVTrH92gZTnVC28oBri9fdu7gwTDAI7n7+CYyLBBYVNK1wjDQeAkVh3syQNmeZ6If3c3HwkXTliDvbjtnmpYbX+EKcgkC5ts+SiYKfz1liS4veJ/xxjHwLz7x1b1xaZIfLKH2sZnA58Ptb33IPr4Kanm4ykJBG++7brSTgROLYB8LPxipK8zczNmpjj+g4bL6XJHOM5ku5+ujStdA2YHWP3JeD8yirypI7rGPD2lVv2YEVjDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CY8PR12MB7098.namprd12.prod.outlook.com (2603:10b6:930:62::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 00:52:09 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::a60d:334d:2531:d031]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::a60d:334d:2531:d031%7]) with mapi id 15.20.5813.012; Fri, 11 Nov 2022
 00:52:08 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] mm/migrate_device: Return number of migrating pages in
 args->cpages
Date: Fri, 11 Nov 2022 11:51:35 +1100
Message-Id: <20221111005135.1344004-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYCP282CA0010.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:80::22) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|CY8PR12MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a63cc9b-e73a-475d-d66a-08dac37ef5ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fpCNuNqGlgp7EMk1nqSQphWr8uVpCa40fB/80J5Kc88c0rUqFSglNDSc/BwFNEyCRqhYwPRlJCjjC+LsikJkec4h/0OGqMF2VLetFKmqgbL85rEsvYj6v0wm7wba3X8uniZVIG+iC1gd92ZgmbyHjioP3gneiHwSTMU6YhVaV/UvxNIukIIuNpJqQ8uZboL3lzHl5YSPoHYNbokcRA3rNAafC1/UzERSnNd06mOdseyBUmtWJo9Trxwd3Bmwcf+iDQ3uLGl2U82Cg+kvGJXr0hwW/DNjeDtkkkwVMEwuPHXb9x5ONkuVlIFxVX+vjsG33dOyr6NROB2Rs3gWnxbZKmuVr+ykxzpzeZeUDuCp3t1xfus3RUwuEaXQPj58Qom3GJOKcyWAGsDcLAR19yJVXmj2zLhFwVk1zhphSR30rJRiptAUPYsq0mR/TFcDvd92qf4O+jQVQ0KgNJgmO2L4FrV02s8sd3HEj+TuuVXw+o569+5KLg4Na6FyDVFXNprh31BTNryn9KPTb3gA0v1WdFx2vH1Q8QrfCSPw4zt2rvy2VIYdPO/oSIXeh02CZM3n0wP/BtyaBX24KpRTUJtxBIRUcVUHsX3eNQsU4pIgpL/Ehjn0jKM+Dr8fhsJyTY5wboeN1qqKfOAEH4RIdv5xPGFat+CdPxqCBsSO0UXkGZGIcrqgpQMsNwOQ+/2HCPXax/qPwp3fuQaG5/68/QP7XA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199015)(478600001)(83380400001)(38100700002)(6666004)(6486002)(2616005)(54906003)(316002)(6916009)(66476007)(6506007)(36756003)(8936002)(4326008)(8676002)(66556008)(6512007)(26005)(66946007)(186003)(41300700001)(1076003)(2906002)(86362001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hdPuJRQGSTTn+8JbVV6edG1lWj5PGLVYn2PQ9TFG3Q5iQlmQJTh9vv6tthKz?=
 =?us-ascii?Q?N2CbMC9NNuXIz9FLMZD2qyv7L14NgOVf/mB6247/h3JcumCZrmuEed5QQnZ4?=
 =?us-ascii?Q?WQb8gElm7npyUSuiZL5TVqcQDSdhT4VjJH/cXzLgf6pzjkZOSo3ZtQrwjURb?=
 =?us-ascii?Q?BYKvnJsAFp5+ubORz7SS3iPXnNkZJAkPbfRB2W4o0HmGLjy5hcBT7uWqVE3z?=
 =?us-ascii?Q?x7uMhdu7FgaRNzo9ht7zt2n2Ieq4Pr5PribLKpNQCZ/gr63zy2Y4l+bxcCrh?=
 =?us-ascii?Q?xYsfIaK0q3VrkV+k8/LbNriF728l6ExauC2hb/oCh1U3jp2t587gDvF2spfT?=
 =?us-ascii?Q?TggSc1ZyvSBMnXmW5qwuAXTlb2ZjxwDCNHZnI5fblQh+BdFHaKHJgnXji2AG?=
 =?us-ascii?Q?x6Fh//BHx4sJBOcJphuAENcPrTHSi+meiGvY57Izi1E9kYKEUa05Zj9wSrHZ?=
 =?us-ascii?Q?LX2EKlE90vGhLx/J7pShsHo+I4qt7ca5qqSS1kbuBxCT9/ara+CL5VdExWZO?=
 =?us-ascii?Q?Hy6wDHr+q1E8cj5QHJxpFNz7lT8RCXR4iJDQVAhV0vbgXOnOGJL0/SRStY1f?=
 =?us-ascii?Q?xzqurrQ/QQ1Lwhv6bYxPPc9lfAAr585Bu4SmoQ0cSGx1fRs2BoBWRKkvleMX?=
 =?us-ascii?Q?pYoD+KhiozhdDW3mrVp1TPW5Z2eY0HlXRbmfJ3dNmHW8aMJZe6XaBDI88WNG?=
 =?us-ascii?Q?MuLoSj+rHSQn67dRoHPHAK17h5tHEK0Ea4j+cDbxdHwj35CJfpD/GzqdzR+U?=
 =?us-ascii?Q?FbrIhB1pY6U+Fda6lsy+924js7HeVvdbmdbsyhjIfEWTF9p2mQx9E+TXPgH8?=
 =?us-ascii?Q?R2vPpOU3SgWSlADC8G8aGbB7Vr0Aw8wYZqDg9P7ibE8EjTPID9i2NGm2vRTX?=
 =?us-ascii?Q?i0fjty4/M2QPftTTyvyiu4WsPt1P/UWtYkQYqWNARspl+GUSB3WAqhFtmrHx?=
 =?us-ascii?Q?yIE8UStX0mCfTgnXxRBj8s2IhxxbvxX2TzKJY4KcVBY6cO39mSOC6NMTy9ms?=
 =?us-ascii?Q?w/IeVNQwL/98NLhCb/NPBc0MlXqZ8mt8fYACX03pi00VfJnHskLyYrliuFMa?=
 =?us-ascii?Q?e2tkRaCvOuMJCgWPuJN/0bGCc9iUIMiNuA0SAguocvfQxoKUK8LCjR8D1IKk?=
 =?us-ascii?Q?ObJ2ANw+Brbf4mCMugarybfLFEcHHmGM1kkF4+k0UIwQeHxx/Mb+Y7uC8bug?=
 =?us-ascii?Q?xxuwH4HJ3dxgo5Ofhw8dpWi1qGxcVLHgeB3RXX1FeJ6MbK8i8Baz42R9cTqI?=
 =?us-ascii?Q?lWbRwDu+WYk6zdF2APAF10koap2PB3SXLgIz2dHufulradO4afHNCtq8KH/B?=
 =?us-ascii?Q?aBWoEmTsmXuy4RwNIdnL75RifLUDQqouHjUFzqTKMHHLVrXTJeTQmRVaUY2Y?=
 =?us-ascii?Q?0+coxxr0uO2ur9u016ZpVla3q3LPEP+yRiUSDXD70vNxd3G6NKwEiB0Z7RMx?=
 =?us-ascii?Q?6+iyQBaFAMSeqUvnuHEWH6zg2eFQGzVekvNIA7E8ghEHB8dJgYTgFL3+PRgN?=
 =?us-ascii?Q?k/GDqudaQc83rhYUhogHfvQ7f5imBd7j23UdzAT+gUXVA0be5ozq/R7XVJm5?=
 =?us-ascii?Q?EBTzLdpm4jtQC7Gm5Td8drKBb2MPkc1cKmzRfRO2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a63cc9b-e73a-475d-d66a-08dac37ef5ff
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 00:52:08.8232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWinksxLK2SGSkPDRTxWPheYeMMpWNVuRlX0hQVUjiGEdnw1YG8qgp7rU8V1Gph6wdnJEvVyjRH7P6SiCrAfqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7098
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
Cc: Alex Sierra <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

migrate_vma->cpages originally contained a count of the number of
pages migrating including non-present pages which can be poluated
directly on the target.

Commit 241f68859656 ("mm/migrate_device.c: refactor migrate_vma and
migrate_deivce_coherent_page()") inadvertantly changed this to contain
just the number of pages that were unmapped. Usage of
migrate_vma->cpages isn't documented, but most drivers use it to see
if all the requested addresses can be migrated so restore the original
behaviour.

Fixes: 241f68859656 ("mm/migrate_device.c: refactor migrate_vma and migrate_deivce_coherent_page()")
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reported-by: Ralph Campbell <rcampbell@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Alex Sierra <alex.sierra@amd.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---

Hi Andrew, hoping you can merge this small fix which Ralph reported to
me for v6.1-rcX.

---
 mm/migrate_device.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 6fa682eef7a0..721b2365dbca 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -357,7 +357,8 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
 }
 
 /*
- * Unmaps pages for migration. Returns number of unmapped pages.
+ * Unmaps pages for migration. Returns number of source pfns marked as
+ * migrating.
  */
 static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 					  unsigned long npages,
@@ -373,8 +374,11 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct folio *folio;
 
-		if (!page)
+		if (!page) {
+			if (src_pfns[i] & MIGRATE_PFN_MIGRATE)
+				unmapped++;
 			continue;
+		}
 
 		/* ZONE_DEVICE pages are not on LRU */
 		if (!is_zone_device_page(page)) {
-- 
2.35.1

