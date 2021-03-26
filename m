Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D45349D4A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 01:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092596EE74;
	Fri, 26 Mar 2021 00:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750053.outbound.protection.outlook.com [40.107.75.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D366EE72;
 Fri, 26 Mar 2021 00:08:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcB6sw4GUuxtVMzeiyw04b81Dp7F/F5rDNkmTwbAFRv4ZFcBfnHdMsOzeOCrLKBk71Y8AKW/yfz4qJwh/lr8mdbE1EZwDJhNW96GMpbo+MWHbnSKKrvpJTsEYYSfTZqyypCxaVrM5LdIQaDiRMrstQcoNmvadNglsRtWXI3VLMQoV1XzzILChLjVrqhdVwVp+47WLPLY3ZQsxBnex0/h515DLKRHPdRuMncPdi4WPU/wAwChCbB/n/X+nhysxyjYHaGtNev7g1XlTjpeOaGgtZJ+t+6c8RT6cZlbMa6UMzKKU7FHlEbtr8i468edJU+uJHjcH2W+wLQ4n6kvBQ1t6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXKqJK9aacc6+2xXUMvIJ8jO+c0nG1hpWVMc0qN+ZZI=;
 b=LMdKx8llc2L/RpzVNG86bL8pBlaRVb9KjZgNUH2TWYoJOE8hJ0KFhufwj9pSTsdqlpkFtcxlBazN5Bam5jw0LJ/Ejo2y0zix+NtdHiRiQ1ZVNzfQqOvtNisvPuFam5527NF4Da8ig0dMccZCruPhsbq9E/AVwuLGzDo/I36WuPPL//jpuLWGC9FA6qXpW7gQOzyADZMfJDPe9Aatj3B3RNDzoNlc5lLEZDZJYPuEk0JZZGXv9XHeLf7Ibs0bAZKeNUCSHOLt5UKbLBoz20ah/8E5z20GwwDjEKi3FZRIxGA/mV4lJ61A3NpPUxboMeNX1Uqvwi8rQyttYBNg2EF6Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXKqJK9aacc6+2xXUMvIJ8jO+c0nG1hpWVMc0qN+ZZI=;
 b=JzTLZkgWgc8sJ3i+WvCVsVgZOdbRRM9wVPnMsBua09HjDZbKzqlJY21odzsIFdA1liNUn0LK866bM79TlFcwTzSM3mkWlCiX/zI1II18mhBturnCtWXQr0vZD1plJ3qkrhPPJM6PiV3lH3qKZpDdZ31doLBj8QkkIQPi4NXpxkkw38oxQx/6n7MmM6mcbVKvqBANEXnj0D+F1NtURsZj0LNofN6UVO22nnJ2/8EUtVjN2pK0haYh4OioW+SqROR94wDwPp6SkTIXwqMjqmEalmjc7LwVV9msw70sxWQRDiUsQUOMLIQMPGcfZmmKLvgD+JLyuUUy2TA0JLedkXTidQ==
Received: from CO2PR05CA0097.namprd05.prod.outlook.com (2603:10b6:104:1::23)
 by BN8PR12MB3187.namprd12.prod.outlook.com (2603:10b6:408:69::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Fri, 26 Mar
 2021 00:08:31 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::ac) by CO2PR05CA0097.outlook.office365.com
 (2603:10b6:104:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.14 via Frontend
 Transport; Fri, 26 Mar 2021 00:08:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 26 Mar 2021 00:08:29 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Mar
 2021 00:08:29 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v7 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Date: Fri, 26 Mar 2021 11:08:00 +1100
Message-ID: <20210326000805.2518-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326000805.2518-1-apopple@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53b9076b-38b6-4239-52d5-08d8efeb4956
X-MS-TrafficTypeDiagnostic: BN8PR12MB3187:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3187395693C09872E3894E2ADF619@BN8PR12MB3187.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gdHEzyHSGJgAJDRHn4Z1QVSywTA0mbnQZUnyBNxpSAhsfbFtiactyEHjHrSC3CXFk5WwVQXh6l1BIYDA8BA/cDnm2BwpacTkt9sc0G/Z6gnk3L/F3jgAWYrYHbaQMqQUotnUuM13voRK8Ag0hTDnobuffLH8yftVRYLSy+ag49ke6MR+n/ehsqNqEvjViuFY5e2cDyje6hWbqcksSM5rbrmdyKYIVL8+tajxLxCaqz4QzXnjpmIol3Am04zMTqBR76q10V6qnGeJUEUiT5ARXqmc/0AFOJf+4zH+r5ml959yYxhFPICdYb+Tdv4LQXS2/ZtrVL1rejM9902VMdCcdK4QCTLH11hkSaoRIips+qjdxGO6bHrm9p7Pzvt7q1LFJ7kV7o5ffc9L8U9LfOcLy2snbA8kbz3SoWhSt31VOjPqCIS/yWR6FAzUXac01ojxligShtBd0PNo/TjXxyDmIcvbABRIB2/TTLjj8bhjNGNS4SQy7DIXVm4A3LDL3mnE7dJLO1Pcr3e0mshR2SocozyHC9S2C8vtVSyHYJUqYDCxG3EnrQyVtKM8KVjD9xrgTMDDyTDOGJlkwrBwuvpndoomx1iCa9C0V5Psd18oS1o6pcfE3BCL5vmrFdiDNCNHIQQNQCo/QefjafaIH4bfqGI9ykHRrvUoYvGOVKNhASI=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966006)(36840700001)(82740400003)(70586007)(7636003)(356005)(336012)(16526019)(36756003)(26005)(70206006)(316002)(54906003)(110136005)(36906005)(186003)(4326008)(83380400001)(82310400003)(5660300002)(36860700001)(8676002)(8936002)(7416002)(478600001)(2616005)(86362001)(2906002)(426003)(6666004)(47076005)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 00:08:29.8642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b9076b-38b6-4239-52d5-08d8efeb4956
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3187
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 jhubbard@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org, jgg@nvidia.com,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The behaviour of try_to_unmap_one() is difficult to follow because it
performs different operations based on a fairly large set of flags used
in different combinations.

TTU_MUNLOCK is one such flag. However it is exclusively used by
try_to_munlock() which specifies no other flags. Therefore rather than
overload try_to_unmap_one() with unrelated behaviour split this out into
it's own function and remove the flag.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>

---

v7:
* Added Christoph's Reviewed-by

v4:
* Removed redundant check for VM_LOCKED
---
 include/linux/rmap.h |  1 -
 mm/rmap.c            | 40 ++++++++++++++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index def5c62c93b3..e26ac2d71346 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -87,7 +87,6 @@ struct anon_vma_chain {
 
 enum ttu_flags {
 	TTU_MIGRATION		= 0x1,	/* migration mode */
-	TTU_MUNLOCK		= 0x2,	/* munlock mode */
 
 	TTU_SPLIT_HUGE_PMD	= 0x4,	/* split huge PMD if any */
 	TTU_IGNORE_MLOCK	= 0x8,	/* ignore mlock */
diff --git a/mm/rmap.c b/mm/rmap.c
index 977e70803ed8..d02bade5245b 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1405,10 +1405,6 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 
-	/* munlock has nothing to gain from examining un-locked vmas */
-	if ((flags & TTU_MUNLOCK) && !(vma->vm_flags & VM_LOCKED))
-		return true;
-
 	if (IS_ENABLED(CONFIG_MIGRATION) && (flags & TTU_MIGRATION) &&
 	    is_zone_device_page(page) && !is_device_private_page(page))
 		return true;
@@ -1469,8 +1465,6 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 				page_vma_mapped_walk_done(&pvmw);
 				break;
 			}
-			if (flags & TTU_MUNLOCK)
-				continue;
 		}
 
 		/* Unexpected PMD-mapped THP? */
@@ -1784,6 +1778,37 @@ bool try_to_unmap(struct page *page, enum ttu_flags flags)
 	return !page_mapcount(page) ? true : false;
 }
 
+static bool try_to_munlock_one(struct page *page, struct vm_area_struct *vma,
+		     unsigned long address, void *arg)
+{
+	struct page_vma_mapped_walk pvmw = {
+		.page = page,
+		.vma = vma,
+		.address = address,
+	};
+
+	/* munlock has nothing to gain from examining un-locked vmas */
+	if (!(vma->vm_flags & VM_LOCKED))
+		return true;
+
+	while (page_vma_mapped_walk(&pvmw)) {
+		/* PTE-mapped THP are never mlocked */
+		if (!PageTransCompound(page)) {
+			/*
+			 * Holding pte lock, we do *not* need
+			 * mmap_lock here
+			 */
+			mlock_vma_page(page);
+		}
+		page_vma_mapped_walk_done(&pvmw);
+
+		/* found a mlocked page, no point continuing munlock check */
+		return false;
+	}
+
+	return true;
+}
+
 /**
  * try_to_munlock - try to munlock a page
  * @page: the page to be munlocked
@@ -1796,8 +1821,7 @@ bool try_to_unmap(struct page *page, enum ttu_flags flags)
 void try_to_munlock(struct page *page)
 {
 	struct rmap_walk_control rwc = {
-		.rmap_one = try_to_unmap_one,
-		.arg = (void *)TTU_MUNLOCK,
+		.rmap_one = try_to_munlock_one,
 		.done = page_not_mapped,
 		.anon_lock = page_lock_anon_vma_read,
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
