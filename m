Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7801DA541C4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C46110E8E0;
	Thu,  6 Mar 2025 04:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IjayQsof";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD7E10E8D9;
 Thu,  6 Mar 2025 04:43:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9v9xXv9FMgfzJyp1HOBc2IUh1VpExzhBC71My7n+rsvliA3CWRwGUlMMkUiHV0ohQs5gh6d62Hb+Rdit+X/JIXR/RXA9HB7zV+t62JbZ/5NPR0rJZXloprIoA+NPyhgdEKGrVVD149ZMP/gHX82ap7BnrhTDDzC40GdoEueedSdYWoMFZAeDFsZY3K6QEm906FAZs0O7BzU++/DJPGSLjVQNQ2DD68Z3Q6o2LTqWBOxgLKtdbjT+GkNaChQu29j3F+96mDIcxiBsbPE0qNI6UndAjlEWV8tF6F5SuGKp4JWHuYwRtAJBApWT75g0Jjpk8WiASsDmYkLi0cqiG9zjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r83BGccQ3T5HvdU2HP8phbbJ2DBl3Y42ADRff8m64ss=;
 b=iMYs4VRHnpWRlS3js0B2/2NzcfY60Wjxie/HelrG/Ho/BUqb3gCrInPkSx2kLcaCnGim7bYcmMM4wxOhywyZs1gdVaeOh4C5mfRnJWGZ7yogq7N1Q0BTmNvmt+VqWoe+ws1IKjiimuwdvqlv2ZJqLPoU2hksEC9eDBZEmNEoK2ErRsqbGVBATtoYdwtFB5Vs/Fhno8dR3vSlSKDAKRyV/Rlu7Cz0xsPCrHW3bOnanhg488KFgm1xZ++P5dJtqxOBdBN1wovnUsnCQspg6NP4nUm3FeY2A8XxW/YPHuXtG5OGL8sAxQKPUffHaxyr3cKcGkp2SXBxVr0R1QXEvUfOQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r83BGccQ3T5HvdU2HP8phbbJ2DBl3Y42ADRff8m64ss=;
 b=IjayQsofRcyApBAQ1ObrtJ2ZZzKql9OQnQqAxRo2RGFM+Tsxb9q1G8YWYYzyo2lepr4HulmWnetduRAUmv/6YiVapgqZJMkQSfKOREHlxkU28kjOTUBQp4kuyBxDxLSBKRY3dptvw0Fol9vSzXEnu7CgnQaAKTa9qZIDU2B36AcYdIJcAunjdVJONlJyVLzpAEwM4eIP3nYJKeQZMb1eC+VMItn8mnjcqZ8Qy4QpzoIDgJz4ZVOzl/7nlexoH8Fomavt4xuxXNXfnK926HI21I8mfkoqbwsMs/wfXXoFfiGqT/pI/+8tL+aXNhHgQ+fMhprUZnC3N+DVfLZHDFQSBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by DS0PR12MB7534.namprd12.prod.outlook.com (2603:10b6:8:139::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Thu, 6 Mar
 2025 04:43:50 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 04:43:50 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 05/11] mm/memory/fault: Add support for zone device THP fault
 handling
Date: Thu,  6 Mar 2025 15:42:33 +1100
Message-ID: <20250306044239.3874247-6-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306044239.3874247-1-balbirs@nvidia.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|DS0PR12MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: a4549798-3d90-4651-a655-08dd5c697d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S3BI7T+LhfE63h2snhKOREZIHhldMBWT+G+fkjG6LErXeCpomJmB1Nx9vDoo?=
 =?us-ascii?Q?6ulIRjo9k8bGIP+RQk/X42pyFCIlODXfiC85m43RUbEQb3KNUlBsnjF9VUCp?=
 =?us-ascii?Q?Vukvuayl/+OkMzkuxTCjGhP8+RHBEz86AhdqCBlVB3p25PGGp+ILEmX9do2X?=
 =?us-ascii?Q?G0cp4StL18B6SMaYYidoEVnqeGAWibs9aCRb932RNP77sUes0xaUQ+dvUZBz?=
 =?us-ascii?Q?/tdTBQEtZMhet7bJT4F/jMnA42advXLxCvf41D7ze26IYPl555rgGIxQt3t3?=
 =?us-ascii?Q?A8PoxQerbI2MX7JUDT3UH/LohwwacOQoB9hn3zClw5thex8QRXbmd53nq+e7?=
 =?us-ascii?Q?1XeiwEFUVGIza4MtkVp3EHv0A+z/XVJWfeV6zAnIzN0SGqkQ542DwNX/aWyR?=
 =?us-ascii?Q?9CegJrFYHE/egk94TklyXmlmdvzJ93pODmaYCtp//BEB4ojvQEf6ZWX/SnWR?=
 =?us-ascii?Q?3uuOAzUHnMruuNvbwJjcwRiz9MpeGbq5AKYGulNPRPWHXB1CATNxVP2BVHpH?=
 =?us-ascii?Q?vz+c8qh/Pdk5ejUaVEQAGPZbdjeCiUZi1r9NSu58aCtBxDJgZfHZfrxxRPLm?=
 =?us-ascii?Q?1qd7RuoRHyrk6f4UcKjO9L5AndVjZWKZO0Xhw2TxHHNICfbMdngLXRWYrNDE?=
 =?us-ascii?Q?hk5nIFVafZZOtKvkAlhoxN+P24mZspE7Er3FpVbwSVBj9ZfW+WJfCHtbWICi?=
 =?us-ascii?Q?xXLOCKWrM4kc+wy9cKofz5F/HXmG+ZOlSn7FFUOdwN48G2ZjnCzZmiNWNB9m?=
 =?us-ascii?Q?+arjyxHdtFpb6tyblUKgBGhrUKCXpRxRycJljyfr3uF7XfTzPkmwATnnplea?=
 =?us-ascii?Q?iPIdgnbht4lrj62kL+wMyRwCrH78MFF7FPxhngLEV+P6Y0ZB8uWVYFZjYgsC?=
 =?us-ascii?Q?tBzXUShcDI1xftr6fNIXFRHFmXUBBkeJ4UJCZLc0P/8bUXVeaRQSXgCa5OtG?=
 =?us-ascii?Q?SiZk5+P7jnOunc+j6GYiM515KQCu1gja3QaoaXlT0XCsyBda/yQawTOx/+s/?=
 =?us-ascii?Q?ZN5SB0amAes0pCRZw8hXy5kWSs/BT2xOD8s88fcnfzakljdcbNn2U3IF17Be?=
 =?us-ascii?Q?99DPGFhFGvUR/F00+fLpgy3/jdv6BumAgxvr3e/4krLmLHruG9mmXu2r96X/?=
 =?us-ascii?Q?hvgH3nXVu+dAyrA36Z75b6KFdpy2Q6wpydTtVGdSkkLE2LFuAqdCb8ceNkLB?=
 =?us-ascii?Q?GdmRnn1nmnG8yqp3Ofwk3Aj5lAmR0NDD9hPiYfvtfwDBFwWMeHYz06UNL7Xm?=
 =?us-ascii?Q?g0KPQH9kShzry1Gb4znWKPX+H5V3r9PxdtZp3ci6buUiazn9vpBUA0vy54ea?=
 =?us-ascii?Q?GAqKAoE3If02KrkL52Lxq2lilMFy2wM2SRKaS7NzRlIHtow8k1VP7g4VtgvJ?=
 =?us-ascii?Q?jQdxOjr3K5xyWYIad2YtxN6GJFpK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nbfIbJjpTzxjcxNvXlG/yxnZa7bTTepjwysH7PRBns1d47Dlebx4rZ/NbFXF?=
 =?us-ascii?Q?lttzpNIrfMt+osx5AUEd3uz+jhGWAscnWtzJ5J7wvR3YY42nX5KE3I3ft0lJ?=
 =?us-ascii?Q?IdVxWB2IsogXoFb1OmMUfBtC7WnW3r9sKtpD3x26VOFgXVRQNGyvsN6AKD3c?=
 =?us-ascii?Q?MRSALCxR6P3EgsUvulmbnIw8PXAhNj5frI5UB14H+GHTPnxMb8uVyYHaSEKm?=
 =?us-ascii?Q?Z8CfNAd2mE3EFLVs59HuQT9nKpAcQ6FkFaA4+guJKAHrXSHgta5pUC3cNwtq?=
 =?us-ascii?Q?1AGLzE5VO2NmKpT1zbi7/XgzveBIgnj+vBeCflAj06pyi6umMdof0QSPKrmT?=
 =?us-ascii?Q?Cfg3SqC/ed2sA3L7TCuApoOIdnOwazt/1CrkuW/HCcwuP+1BUZbkcfNKZIsC?=
 =?us-ascii?Q?du21h0A4hJ9ef3sfTWawhAMyjN4jFe5NMHQPss1KOeEsxaxYq90pI++KvWF7?=
 =?us-ascii?Q?Hw4rCbiMP6Sd4aqIlbLQQ2lqh0u9rhCY5fw47PRVJV8eZLWzDiKNjeqF37Ic?=
 =?us-ascii?Q?vr/Ka/8IqDJQdGdOOW/UJ/tLBISeYIch2gVmQmR3RSDxGkOeq3evgRHmg0Sj?=
 =?us-ascii?Q?gvTnAPfT/R4pWltS/uqkpGZH4mtUXbeZp2DpdtogB8tct2GGUB6s0Z6tTzZK?=
 =?us-ascii?Q?hSDnQVqzsJv3Ps/GIQdQ3G6OpbHFMl83fmzZkleciT71aUoOPLgCgylonX6E?=
 =?us-ascii?Q?RBNv0eAMpvzN1nrHmHF/TVy0V0tyCwjrytqu0Tr8UCkx0HkqwdkfmllF5pif?=
 =?us-ascii?Q?E6N3ujofhI169EiaQs6TfdCyFqMPiOi3AvFT/Iar50Va6cu70fIrJjwHItu4?=
 =?us-ascii?Q?EszDJWzl1HdFOWOQEqs/wxuMhm4KVCBqITGogdfh3x8FM6jw1D8ESFi4re3P?=
 =?us-ascii?Q?jPPwWerM9PX29sEAXSmtLOI2ETzXDH0ngUa49u5yDPrpAg+Yf2Tk4Rpo3Lpw?=
 =?us-ascii?Q?0lRoVB3YqU+Mjjn6chay2Pt8O/yHpLFN6sOLwSRg1OL1h5cMi9gVt8Shm3Sc?=
 =?us-ascii?Q?i39VwbKB/dikrmS9fsvDNpRXACDloCrcylYcz0MZzZ0y76YwBJSohPaE9rEt?=
 =?us-ascii?Q?E+DCB/rtb1vpk21NZvdbBFRg1Dgx5kcVYN2fT4wUWDPUUKrGUtzokk4rUfd3?=
 =?us-ascii?Q?h4Ho0BRGRiz+TTdmRvYd/qDu3mzkf0IeDHOqYUvCwJlh9NdqjBAJuIAE8KIi?=
 =?us-ascii?Q?sYf0FUOOuwS2BqTME3qZaLp8T2FBk4ZPwPXx/5+WJyoj/i7MQCYR6Zej3f+V?=
 =?us-ascii?Q?E9qj7jASaRfJW+/9A/LUmyywAu7JhExzqiqNO1GTx1YSZ26k9zbBCMdOyI5c?=
 =?us-ascii?Q?rxyrMqboZlhWUkoVmXRhJLn7rJC5GH68CkYT3HdD1GRHxovpesueffRztJdK?=
 =?us-ascii?Q?ekwO4+/pGKb5bf72JcmUCgdNrnk+y/otPcOvWG/DIMKGA6tC3KoJMD0SsJBa?=
 =?us-ascii?Q?/Lo9RpkWnsBMUaJjmjyLDVsvy71ofT+r5v/m7agKHFxj0B7/dnI/qrFUnhnW?=
 =?us-ascii?Q?DEo+g7b9nQNUGTmZyF5xK9ugQ0aA+Sf7sZWNiEBdoRnR8u5wNmKOfwHOReqH?=
 =?us-ascii?Q?8x0O2tOr5yW2uVOnP3mzDzyiyFjoIBrw+48df2Iz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4549798-3d90-4651-a655-08dd5c697d94
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 04:43:50.7071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X94RF78/N4jm1vGr6AFg8veX3pmjAwOo/GcpthyhFpRzmRWMVC2gB1gQkZbYLVIYqgRBKqh76PbsLhacn0yUqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7534
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the CPU touches a zone device THP entry, the data needs to
be migrated back to the CPU, call migrate_to_ram() on these pages
via do_huge_pmd_device_private() fault handling helper.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/huge_mm.h |  7 +++++++
 mm/huge_memory.c        | 35 +++++++++++++++++++++++++++++++++++
 mm/memory.c             |  6 ++++--
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index e893d546a49f..ad0c0ccfcbc2 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -479,6 +479,8 @@ struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
 
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
 
+vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf);
+
 extern struct folio *huge_zero_folio;
 extern unsigned long huge_zero_pfn;
 
@@ -634,6 +636,11 @@ static inline vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 	return 0;
 }
 
+static inline vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
+{
+	return 0;
+}
+
 static inline bool is_huge_zero_folio(const struct folio *folio)
 {
 	return false;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d8e018d1bdbd..995ac8be5709 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1375,6 +1375,41 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 	return __do_huge_pmd_anonymous_page(vmf);
 }
 
+vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
+	vm_fault_t ret;
+	spinlock_t *ptl;
+	swp_entry_t swp_entry;
+	struct page *page;
+
+	if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
+		return VM_FAULT_FALLBACK;
+
+	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
+		vma_end_read(vma);
+		return VM_FAULT_RETRY;
+	}
+
+	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
+	if (unlikely(!pmd_same(*vmf->pmd, vmf->orig_pmd))) {
+		spin_unlock(ptl);
+		return 0;
+	}
+
+	swp_entry = pmd_to_swp_entry(vmf->orig_pmd);
+	page = pfn_swap_entry_to_page(swp_entry);
+	vmf->page = page;
+	vmf->pte = NULL;
+	get_page(page);
+	spin_unlock(ptl);
+	ret = page_pgmap(page)->ops->migrate_to_ram(vmf);
+	put_page(page);
+
+	return ret;
+}
+
 static int insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pmd_t *pmd, pfn_t pfn, pgprot_t prot, bool write,
 		pgtable_t pgtable)
diff --git a/mm/memory.c b/mm/memory.c
index a838c8c44bfd..deaa67b88708 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6149,8 +6149,10 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 		vmf.orig_pmd = pmdp_get_lockless(vmf.pmd);
 
 		if (unlikely(is_swap_pmd(vmf.orig_pmd))) {
-			VM_BUG_ON(thp_migration_supported() &&
-					  !is_pmd_migration_entry(vmf.orig_pmd));
+			if (is_device_private_entry(
+					pmd_to_swp_entry(vmf.orig_pmd)))
+				return do_huge_pmd_device_private(&vmf);
+
 			if (is_pmd_migration_entry(vmf.orig_pmd))
 				pmd_migration_entry_wait(mm, vmf.pmd);
 			return 0;
-- 
2.48.1

