Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA34834F113
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 20:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCF06E94E;
	Tue, 30 Mar 2021 18:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7170A6E94E;
 Tue, 30 Mar 2021 18:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNo0Strg9fTbQd8Qy2+Hm8bG0EZFw2TwiNPTegUS+56QbQHp4MFJi0Gc/iOs5HKJxW/XY8p0ZSmy5hASt/DTKeB+7ijRhNANftcxEO3kYHZQYDXMH3yPQol0f/QVXh1YFjmP5LgzbWFG+UoYDIx/oKZEDflhFw7ROKqIdhStNqDFnr6Cq4psC4fFYzp2779B7wGrX+eJLsuqwV34W12RELgAC0HmFCfi+9ZUmuGbF57hzQk62yOpNRT9rqR4Z68y9ZsheWBNTnedyhjELZ7LoI1EiluOARhI1XSyUZCNnxnYoYBDrUKwSc+TlZgsOmXh+EKRVHHVFRvQPDUv9QcZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuCMyZBdqpWAU6luauy2Z+zV56bne3oILQlDe1P51Lk=;
 b=QzyFEW3ikycacjHQQKJ7v/0VIaWH4ing8ApuIMPeKFHwdYbGji8vVWeOu//ObcP0nCGxgr67XhzUwCiBVxJp1LARjdN3xNhoXhTc1LEcCrtJQ8aN2AqRHcjQ6d3dhFMRy0SNvSeElBe0i2s979szQYj4q2fsXK26nZoA3uCtUYnbtp9mCYWaGBhpXNhbZ6MYuj5l3fsUBnE/JDjg1bCyuBTdfIWBasfC2Eds2Iq66X78C3pQ+KiS6KOorYviFOh4QmfythboSbzDwwHoEzykRjgRfSd0UezB8MWiPK+pNt1ZbGHkjyrrfgNjkKLzTgNPKVSv8xng8hPQH7s9VTspZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuCMyZBdqpWAU6luauy2Z+zV56bne3oILQlDe1P51Lk=;
 b=q9KyWBXXoHjxbJdgfdGp2myJLij4S0IEZ111V9yaCVuH5tEr6f3Y31045DkoOHLgPJfbmvcyjUROk0HFtEg79d/jedlnNZJTQu9Qdr7vOF+tlfmPtf+/mwLutde58kRKm/eUVGgwAbZdB2N5QeYKDkdgO9S8zVc/esOqPlceAuPwOjVLIeYlj+AqdEf1lyOCGLQsV+aHD9maHjHq7QDPFalJX6pyAzWORYfeHhYyrKRiZowW6DzRt7Rz3S37CviwS2LOMU6Mp8a+Imwnjq5w5F+OykgrQi95XA5pkExgVusOpUQECrOet5mOwMiscGrqNNM8ry2tdt9iCUASokmE5A==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1146.namprd12.prod.outlook.com (2603:10b6:3:73::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 30 Mar
 2021 18:38:35 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 18:38:35 +0000
Date: Tue, 30 Mar 2021 15:38:33 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v7 1/8] mm: Remove special swap entry functions
Message-ID: <20210330183833.GY2356281@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <20210326000805.2518-2-apopple@nvidia.com>
Content-Disposition: inline
In-Reply-To: <20210326000805.2518-2-apopple@nvidia.com>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: MN2PR15CA0029.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::42) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 MN2PR15CA0029.namprd15.prod.outlook.com (2603:10b6:208:1b4::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Tue, 30 Mar 2021 18:38:34 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lRJG5-00603f-AZ; Tue, 30 Mar 2021 15:38:33 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32a4e87c-61b3-441e-aac1-08d8f3ab0667
X-MS-TrafficTypeDiagnostic: DM5PR12MB1146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB114698102F6C1613A421FFBEC27D9@DM5PR12MB1146.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8R1SOc6pTQIyXL3Kkdoo4oORpLhiqyEL3KCdVG0rPeyFlwUcm9I0CNL4fophcOce/x7sI3m5J9zmMiTpET/9qJSDkTGANlD9Z06vBr4e+19Elx8myI/ylq5PJCJqY9AGPMMnbvNfS0JpItESJyJskCXQnH1K+NdGnLLmQs772z3kLJJRYFZb/4gAf0UkVTMC5xHowjw0dfRbTmNuBr0MIt6xwiUt5M4j0dGhWiC0fMwVAoxVW5B6Znj1FTQjUdjCvtlZZdnVHSN1XF+zFDzgUEwYeKbt+k/RnYc6KAW0JkstqH1V/vd/oS2MekpvQC6USnd/cLUS3bUI3t4LnsAKqbMuw+N3VeY5Mpu56f6h+1jIvFovO/iHuxIkl8x9W4Db3z2uNhlUTrmZo2GGm1aCITXvW1+gvPi6YnxjigBk/JRPGH9Yy+wXjVPewrMW7IOlX2I8aaLqpbWm/xwafp7nWb1NAppVpQ6A5rFEjEU8cudYi83HI7p5qJuWQLBJax1BxkcK2BQ6GlK8CzX4F7Aw9r9LFDLA57PbXIji/UERggJLnuJm6Kzcemzo0Hl243tMW0M2qsutEiPHJTy139ggdXiyAMNqjVb0yh/bxjCBK0JCfD9w4iG4eZdVYfaVU5E7ALLDvDCIzUh5CNyNmmEXjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(6636002)(4326008)(8936002)(316002)(37006003)(426003)(38100700001)(26005)(7416002)(2616005)(2906002)(86362001)(33656002)(186003)(6862004)(8676002)(5660300002)(478600001)(9746002)(83380400001)(66476007)(1076003)(66946007)(66556008)(9786002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XNX6OCrXp6kRxpWvW5eh21NJaLfIv6bh/9tLftc22MGSE2lcAGbacYr+P5vX?=
 =?us-ascii?Q?Vz6qva8qewoWKI69P1sE8tvU+75rXr1MNrO63vEKhFVSp26Gkjz/DfggdwNh?=
 =?us-ascii?Q?B8djyQ0f6NREuMOoUDf7feLHTpzVCaL7+Pe5KIwqjuH4RplNovf7zRY4Oqjb?=
 =?us-ascii?Q?GZjbWhIQiyPqazExzHW7j1SyrwIiKaBCXAFM2V+8WnomB3E6E/fezyo7wrFo?=
 =?us-ascii?Q?yjdF7rpO4naO7/IMPppIu/Lr9gWWyzS7inAO/3Bu5BFq5rooxbrsUu/P86cx?=
 =?us-ascii?Q?QblmAIP2i1gyDK+UUNawLF+Yv/BeypczW1stJobEY+zSzreakBdWOwfwyHT0?=
 =?us-ascii?Q?AJRCo9WJUAhgU5vacLAi/b22ywuaGqP8TJZOox1KtM/xvS2OR2XnYD17lmij?=
 =?us-ascii?Q?8UMtzA7HMhF+8mWKXJjRWWiHHvKY/nYfPR0DYjpvsfP+UiUImiPSzemXXZdo?=
 =?us-ascii?Q?ILgjuT2+H4vrzEeKsyqi11p2HYtae4cKivmqfSSKVoVKJYT0Pw1ia5/H9429?=
 =?us-ascii?Q?pFb+5CqJlVFE6i7Exh9kZCzl4XZUDASCnnrtFiPZ5QebgdiN6ru/zBLke9X1?=
 =?us-ascii?Q?OYX406YRS6wgXo6gt/saSrOnBy34HKbmqPYY4FB3LzGj5PL2kclab26tEbQ1?=
 =?us-ascii?Q?Kicd7kjnYmVeCIUwhtvMihObfdaswboFWELbbwFjSNUgSxq5kZgiqh2n+kui?=
 =?us-ascii?Q?H8b2Ff5WA3/8CkMbdrLXEPNZtagHyWhihQWeun1px0htQxjUz1hh4EMHR1mu?=
 =?us-ascii?Q?Uj+nV9vhhVF4qt88+peAg2JprUHul3lYAWOSAX6yx0Io4dcLM+dWpXkz5Zo/?=
 =?us-ascii?Q?qYnRXL+OnU/lFhaqzYo/xjnISOFw6VVTb3esFCkTc9ef8njZzcfwc6bwiazX?=
 =?us-ascii?Q?tPFUGjnd0AZHz4gG5P3tpAcugbJXxRpxprqmSV3nrkuqEcJmp4ndzOfr4S+t?=
 =?us-ascii?Q?GXXSt6uw/CQ8b8Wm75X34cPto2lX1x4C5SbLwrY4jQDCxv9L2uNH+TLIGwgU?=
 =?us-ascii?Q?oGrYQg4DEXyalPlNqeVIO6ws4rL1wnZIxpxEko7ZLCb58nj9n2ceYEyEqjfE?=
 =?us-ascii?Q?M/wD/F3DZ5GYwwDtZvJy3J5hqbwak+nK9pWaobOeZ7d0qSRYt+kf4fR95aks?=
 =?us-ascii?Q?q1Yc+ssFw1TgF0AFn95yJNH/YsMOg01WpvVDSXNJdd8pPT0CfKlMBJ5OkXa3?=
 =?us-ascii?Q?BOzNgszQKb0IvWujSiDBV9AYigB2VDmQMtpfC+ZZhem/ZmppXz7OYZyp+vKm?=
 =?us-ascii?Q?ktKfdqGxdv57+mXbdHjpjU2JGAaf+T7Jj5RiRjkF+/lY120h94xEp0ig3CH9?=
 =?us-ascii?Q?FiyMKhX9bpHa5F5QHFnBtqwPFndp2ogYl9PCEd5NT7nDQg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a4e87c-61b3-441e-aac1-08d8f3ab0667
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 18:38:34.9916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYf6o5sVypw6ti1rPFoDYSXxQPWwJcSJ/1cyPfXTeLoE1tVPba5q0RQIPX+QRFkl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1146
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
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 11:07:58AM +1100, Alistair Popple wrote:
> Remove multiple similar inline functions for dealing with different
> types of special swap entries.
> 
> Both migration and device private swap entries use the swap offset to
> store a pfn. Instead of multiple inline functions to obtain a struct
> page for each swap entry type use a common function
> pfn_swap_entry_to_page(). Also open-code the various entry_to_pfn()
> functions as this results is shorter code that is easier to understand.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> ---
> 
> v7:
> * Reworded commit message to include pfn_swap_entry_to_page()
> * Added Christoph's Reviewed-by
> 
> v6:
> * Removed redundant compound_page() call from inside PageLocked()
> * Fixed a minor build issue for s390 reported by kernel test bot
> 
> v4:
> * Added pfn_swap_entry_to_page()
> * Reinstated check that migration entries point to locked pages
> * Removed #define swapcache_prepare which isn't needed for CONFIG_SWAP=0
>   builds
> ---
>  arch/s390/mm/pgtable.c  |  2 +-
>  fs/proc/task_mmu.c      | 23 +++++---------
>  include/linux/swap.h    |  4 +--
>  include/linux/swapops.h | 69 ++++++++++++++---------------------------
>  mm/hmm.c                |  5 ++-
>  mm/huge_memory.c        |  4 +--
>  mm/memcontrol.c         |  2 +-
>  mm/memory.c             | 10 +++---
>  mm/migrate.c            |  6 ++--
>  mm/page_vma_mapped.c    |  6 ++--
>  10 files changed, 50 insertions(+), 81 deletions(-)

Looks good

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> diff --git a/mm/hmm.c b/mm/hmm.c
> index 943cb2ba4442..3b2dda71d0ed 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -214,7 +214,7 @@ static inline bool hmm_is_device_private_entry(struct hmm_range *range,
>  		swp_entry_t entry)
>  {
>  	return is_device_private_entry(entry) &&
> -		device_private_entry_to_page(entry)->pgmap->owner ==
> +		pfn_swap_entry_to_page(entry)->pgmap->owner ==
>  		range->dev_private_owner;
>  }
>  
> @@ -257,8 +257,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>  			cpu_flags = HMM_PFN_VALID;
>  			if (is_write_device_private_entry(entry))
>  				cpu_flags |= HMM_PFN_WRITE;
> -			*hmm_pfn = device_private_entry_to_pfn(entry) |
> -					cpu_flags;
> +			*hmm_pfn = swp_offset(entry) | cpu_flags;

Though swp_offset() seems poor here

Something like this seems nicer, maybe as an additional patch in this
series?

diff --git a/mm/hmm.c b/mm/hmm.c
index 943cb2ba444232..c06cbc4e3981b7 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -210,14 +210,6 @@ int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		unsigned long end, unsigned long hmm_pfns[], pmd_t pmd);
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-static inline bool hmm_is_device_private_entry(struct hmm_range *range,
-		swp_entry_t entry)
-{
-	return is_device_private_entry(entry) &&
-		device_private_entry_to_page(entry)->pgmap->owner ==
-		range->dev_private_owner;
-}
-
 static inline unsigned long pte_to_hmm_pfn_flags(struct hmm_range *range,
 						 pte_t pte)
 {
@@ -226,6 +218,32 @@ static inline unsigned long pte_to_hmm_pfn_flags(struct hmm_range *range,
 	return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
 }
 
+static bool hmm_pte_handle_device_private(struct hmm_range *range, pte_t pte,
+					  unsigned long *hmm_pfn)
+{
+	swp_entry_t entry = pte_to_swp_entry(pte);
+	struct page *device_page;
+	unsigned long cpu_flags;
+
+	if (is_device_private_entry(entry))
+		return false;
+
+	/*
+	 * If the device private page matches the device the caller understands
+	 * then return the private pfn directly. The caller must know what to do
+	 * with it.
+	 */
+	device_page = pfn_swap_entry_to_page(entry);
+	if (device_page->pgmap->owner != range->dev_private_owner)
+		return false;
+
+	cpu_flags = HMM_PFN_VALID;
+	if (is_write_device_private_entry(entry))
+		cpu_flags |= HMM_PFN_WRITE;
+	*hmm_pfn = page_to_pfn(device_page) | cpu_flags;
+	return true;
+}
+
 static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			      unsigned long end, pmd_t *pmdp, pte_t *ptep,
 			      unsigned long *hmm_pfn)
@@ -247,20 +265,8 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	}
 
 	if (!pte_present(pte)) {
-		swp_entry_t entry = pte_to_swp_entry(pte);
-
-		/*
-		 * Never fault in device private pages, but just report
-		 * the PFN even if not present.
-		 */
-		if (hmm_is_device_private_entry(range, entry)) {
-			cpu_flags = HMM_PFN_VALID;
-			if (is_write_device_private_entry(entry))
-				cpu_flags |= HMM_PFN_WRITE;
-			*hmm_pfn = device_private_entry_to_pfn(entry) |
-					cpu_flags;
+		if (hmm_pte_handle_device_private(range, pte, hmm_pfn))
 			return 0;
-		}
 
 		required_fault =
 			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
