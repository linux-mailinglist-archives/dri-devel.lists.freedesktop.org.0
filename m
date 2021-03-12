Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 119CC33879C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 09:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5366F4A3;
	Fri, 12 Mar 2021 08:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770048.outbound.protection.outlook.com [40.107.77.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986936F49C;
 Fri, 12 Mar 2021 08:39:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOip/FrPM1U4OEg16sLhlWvaI2B1gjBP262cxPh8xJLAGo7+cQbq4WSijhs4YIjF5lileM/KaZJm+H9nnWd1tVLCWnVOs4yRIT86+zeP+S8CgemiaJP1vIyEmQgDEF4SRwkVMxyIlWPB+u2iuaVRfWN7ZRHYkqzeZGguj7PpF8j2C2vYSBydkdmGBisrtYr4bjpdJ5FBBYpEhlTHdxPhlwI/nanzl5kHy5DpetFkK9Eqf4kGWrAKL1ltr11pIteU6vkOKxiGxURTrZIV9i5jZ7brPCk9Mx+F1htxqgrBPsY4zZ57CcR6wxFOMXiWvfYe98BhwnaxB737cstiEHj9hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma2SIhuD2Q07N2hePYNkgTrRVySBPkOjh8cT+Sy5R8A=;
 b=YeIYAa34bPcvfOfLVgbKHxiKr/J9Jj8QX4MVYeuSSzDpRY845mul444HsCL2d77ZzzstdeOTZ38EAN8vZkMc27c9nm/AfKGqGyjO1dOom4KZkQNls2HRms7XTKrA9ct+uPJLFgWqDAuHB6kFowJQqwVbngk7B37f/nIPNaCLZQ9+VEUUhiaBpeXW+5MzENPj5Lblpbr/WO2oK7uydhk3mCPMmKIEJ2ZOGOqTwtr/ANcoxm6iJgT6kt+Jz23j+xbG4xtv5XCMPVE+j0icE9JczYuyq2qC2hpqqIhhuTXn3Lm5C8HVux3OAaaUXN6mFUq5o2EaUu0JIvHhaims7mIXFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma2SIhuD2Q07N2hePYNkgTrRVySBPkOjh8cT+Sy5R8A=;
 b=og1dJgFjz84x7iMzvsnKpxygQaYYsLBa0n35RzxjbraxnyVfUEL1GN8lXIDdc3xqq+03MF1Ay3KxdqtsvIcWduXCBeWw4XOur4T/8Crm/1TNeEebKSgdxUrvVI1EH4ygpb5I2OYHVPjE4c/UotS6PLXqWYyb63l9uc9yHkyMmsk/vv5bIMdFk67lNWdPtxPYv2XHd5JBLpAVroljcoU+itNDiNZ7edxoxPw72rvwuriGPlEXjLSJNoOERS0oa0XpcOEKAA3PnBOfP6fEDj1/9dUc68IqUvn8V+9O8BCsuYWmc3ZFgVqxEB454Ekt+V4tKwPjy/ewVuSmjlAw9Oi7JA==
Received: from DM5PR06CA0089.namprd06.prod.outlook.com (2603:10b6:3:4::27) by
 CH2PR12MB3957.namprd12.prod.outlook.com (2603:10b6:610:2c::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Fri, 12 Mar 2021 08:39:25 +0000
Received: from DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:4:cafe::bb) by DM5PR06CA0089.outlook.office365.com
 (2603:10b6:3:4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 08:39:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT004.mail.protection.outlook.com (10.13.172.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 08:39:25 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Mar
 2021 08:39:24 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v6 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Date: Fri, 12 Mar 2021 19:38:46 +1100
Message-ID: <20210312083851.15981-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312083851.15981-1-apopple@nvidia.com>
References: <20210312083851.15981-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d1ffd88-81b4-41f1-67d7-08d8e53257ce
X-MS-TrafficTypeDiagnostic: CH2PR12MB3957:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3957606FDF0135EB31FC1637DF6F9@CH2PR12MB3957.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yjP7KLsmqntbmCaT2B9DzNxHoMVR8jGUnZp2BYu44nIrJGdxeYGBILS5IQESh7ulpDkW6PIMI6IkRaRjDa9FD1KUw7M0qomkns7JpgGYpt1szWlLzbg9LTBQoYuwpR6dLKujrPXSR2poLjpzxtjA5wLgYdrxook3IUzCz5WZm7D72y9obXU7WiRC/OrSjKppxpLptGoDe8VdUF0pfDsT75aRW0t2TI5FdKHVeOzxFMMxc1BgDP1zOj6Q1E3kZHKuYw2mdXtkJ+rhPSiLBNSSwirwX0ojUS9mb4BvYUOnT4fjiURyOdon5YLfuz7n/8ex72jSxpbj/pKZNkA2qlfy3NkE5mmaPHoQ3QAaWkEUy5EzsoTDvvzZOOlkmDfTEQmviTVGnMma8qjZGtUkpXnfw9+N/JTxf6Uq5LdB3OZSp2W3uoN1vtMMEc8JZhHURK03BNZleaR1F6kwJDPEVYbN5UR92YD58nayoCJiKCt5qCJHPzl2taCfv2tAdpmK/N8tqFAuSw58yJYPdQPykhg55es7ltoKI/JkI6zb1Lbnf1U8gE+zOowpQLnJlL7HztXJu2zolG3vTKTeTzsfWpy9ybTg4v24sqEkdQrdqv24Zd0qHYOj6aSNkipT3CvW2Bgw95L4D6A+djp5+Vu4qo9+PG8HCL22k57z/AEDUVq/kbNohjbpF1MHP8nvcOv3taX5
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966006)(36840700001)(8936002)(26005)(8676002)(16526019)(70206006)(36860700001)(186003)(110136005)(54906003)(2616005)(70586007)(82740400003)(107886003)(4326008)(336012)(7636003)(47076005)(356005)(34020700004)(36756003)(7416002)(316002)(36906005)(83380400001)(86362001)(478600001)(5660300002)(426003)(2906002)(6666004)(82310400003)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 08:39:25.5326 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1ffd88-81b4-41f1-67d7-08d8e53257ce
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3957
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
 hch@infradead.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org, jgg@nvidia.com
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

---

Christoph - I didn't add your Reviewed-by from v3 because removal of the
extra VM_LOCKED check in v4 changed things slightly. Let me know if
you're still ok for me to add it. Thanks.

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
