Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4166332518
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 13:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75BB6E8E5;
	Tue,  9 Mar 2021 12:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480276E8E2;
 Tue,  9 Mar 2021 12:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htNGSRF89HBQDtrOxqSCpRxD1Ow7ZuBd9Q9GkGoo/0hJqpooN1kPdp6QHD7Rsy+Cbmb+J9HOROnJ4JclV5YeWKatW/PrhkD8q9cowV45Rq4n31BaSGaEYg0wvt/w0BQpGLl7uxCHnkqusTGxJeO+dI5R7UX8f6ighVaUD/DZSsUo2Y6xoUMZARwFPpgwBDJSA12wmdbimgypSsTLWDaz8SZxyLiL9KKgJ0v9tS0KkDaqS9vt7EboZ0WPEzAnPcQ2b2bu8l9LgPEl/5hibNxi6SQyVMZOGvuemvtIOvD08HoSpyAuWBI634JTdaFClDqYb0FhfR2c+jvvVqRQi7Tj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma2SIhuD2Q07N2hePYNkgTrRVySBPkOjh8cT+Sy5R8A=;
 b=bovilf9DKocMwOlFgigMA0KnydPCv5O4J088tw5cTflNvrGGGzHjjOyzkp68Jc2D4MpsccshRAspEEVqBw8ee7wwV/oTYJNRmHsDiFtRb7Blc32adeeMLR12+lX3CjhCQgHPsJ27kkuSZWAIMf+ZZvw2AJQn+da3mUqvHwHJgNOm8tbNUO/2leXSXQjC/O22Z4snf9U8nJ9RjWyVtxmD3fBdEcjzq+4Zx3LEqf0DJyesH/oPk22ANIVeLfteRZdzX+cbx0E53avQEEfDu6jeM7Cd2iXjj070hJTRI61vfbMzSROpOc6xwh48aaDtFl/5no9Cj9YC0VHzDZ15a0VLKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma2SIhuD2Q07N2hePYNkgTrRVySBPkOjh8cT+Sy5R8A=;
 b=BCyJeKbXHH/fR1eLKg7k5jEbuONpKGRI/4OtyiXiWD0IKULj6XHe13JJyjrun2A7aSy/waoiHqqvoSHYhV4U44MeGrYvCVMxyEpAGBEY1DaB/4h3kg6Lf9/u10RAu3adSuYjszZnLUgXMXeGWQ3JCsMly0AoK9oRPpGG5DQbK2EJNIkh8wT3bb6pinpwY1VZbZBDNA4wO7Q3p53ZDWqEWgnd+LUdPA9Hfbc/aoafQlxKVUW7N1cOivu0WiZZ8uXIZ2NG+StMSFv3voejbOjVsyVOGXk1rZaxMQW+XEVcf/dD/e9sa933DHEG0sPVENe9tuAO79gxSIcroeJDP9+2HA==
Received: from BN6PR16CA0038.namprd16.prod.outlook.com (2603:10b6:405:14::24)
 by BYAPR12MB3128.namprd12.prod.outlook.com (2603:10b6:a03:dd::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 12:15:30 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::cc) by BN6PR16CA0038.outlook.office365.com
 (2603:10b6:405:14::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 12:15:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 12:15:30 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Mar
 2021 12:15:28 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v5 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Date: Tue, 9 Mar 2021 23:15:00 +1100
Message-ID: <20210309121505.23608-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210309121505.23608-1-apopple@nvidia.com>
References: <20210309121505.23608-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45b6b8b4-50cb-478f-314d-08d8e2f50837
X-MS-TrafficTypeDiagnostic: BYAPR12MB3128:
X-Microsoft-Antispam-PRVS: <BYAPR12MB31287E0CE1DFC2EB9606C46ADF929@BYAPR12MB3128.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AhabOizTCvOVCEYpgulz3tUb37J9mO43ZCpFyoFgz+Y+Mb3OKuMVl7+Ii32/IlK+8R9POvFH07MfVwOMepPBAAqeGOaHb0gKy3NAZATIfWtosGOwUE8sargFUOwVeLujyWT1gyPNppfefDPtqtLGFeFfj/vR7QLcIKE7mNSJALTe7gRtv/+bFbcehoOTsotfHoI/YbeLsd19Nh0VIPVVut2xHyQHGkASMM65Jf3+bmlvblIhJNDPyD+WjSWPRfFFBIjaAFG6KOpQnJF0cUM/gA5pn0wLxhtnBPbEs4vB9ObXX8qTcxlBxw/B2pSEQchJQ7j7g4CqDN4vGnikNJSM3fimypLVMtajlF/YqNHfIJgAy7+MY0WIDT4zU4npbbJWDmrS5KTFTLwJq+hrlit0lQzCEor6KVGfOKEB2hp4gPieCRgcpy+KL3B+2OYXrATBGSFQLozt4pdxvzy0LFeK2ZMVmbUifer/Isg66eVPpLchUiNae78JrCKIu0gFGpkVQFjLUpBJ7baDM+B6k9OL6WeY2bIQXNoBm0fsqg3105SOYlELV21ccYGUtLviJEojw45PM/ycRZmWL9gh8kzo7fiHVojCE5hSfIvqG+RSgNvxcdRmfRlvtwBrK4rEueouUU2ANbzHPu9sfJXD+BaZc1MLRyAdoujm4nKqgWVny6D7JwY4W2DA2o8+klMPCt7q
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966006)(36840700001)(82740400003)(7636003)(54906003)(356005)(36756003)(110136005)(107886003)(8676002)(1076003)(4326008)(36906005)(70206006)(6666004)(316002)(86362001)(47076005)(36860700001)(2616005)(8936002)(478600001)(34020700004)(83380400001)(2906002)(426003)(186003)(16526019)(82310400003)(5660300002)(26005)(70586007)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 12:15:30.4035 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b6b8b4-50cb-478f-314d-08d8e2f50837
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3128
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org
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
