Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2AAA228CF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 07:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391C010E8ED;
	Thu, 30 Jan 2025 06:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HXzrDWjE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B8910E8ED;
 Thu, 30 Jan 2025 06:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfCPZddNez4Cu8ZfrKV8fhy1Yj5V7NY4R54TGcJ72uOtczL/Y4v2IjY2hIt7/52w2SbGrb/DDwdbgXmttbAIXnUr0eVUL9y4934fDg302DjPE9dLMtp5lDde3Ts7X9w69s+hdDg6sD2VR0A2p1TkER+X8GW6q5dSmTnH/hOopVm5wn3JrZRoAroVe0SWjloCXYpPjctb1e2gsCig2/e6o9LaxcmfliG1IZ17LX+0nR5isDlcx4CCeOesCihkjTxTRENVbjrOjbA9wxDrZDnQarTbEQyagPCbOqQfC6RQo4XcR2Q1n4lWwdkpRVZeT4C2FDgY+O9yLB4TDGfBGkxaLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVkXc55kyyzdFuzdqnJYRdEZ6As1MD6JH8vbZZgmQ0A=;
 b=YYm33cZ08KM6zqFj9azO+HSzPBNL1S3MnGN8pI2H6pEEQkYy1/blXNlcH/YZoLXZrcqmOxPrsR9ZIu9T+LQ36g9resmvP1JrJ9AKeX1rhRN2Dg7iR+5maxqGTjKuttB3sn3xPnO/MRvzjsrJUo1nY2dZi9OiWblk9VWQPASfToOwX9XbbbrIRPgJO3ntUaYUC6oPa+W7CJp2ZY+1Jj/Rl11LSmcfpQZIVjdR9XXVZ1k62Dza7jZlZlAYvnW9VJbccXvNj6oANU9KCj/+LKpO+HJvxAC4ZVxwdnNLbRSfSmc1XV/cATdifoSG8xL39sSg2KUFYtUiVY9rja6rUe9YTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVkXc55kyyzdFuzdqnJYRdEZ6As1MD6JH8vbZZgmQ0A=;
 b=HXzrDWjEtMPoJK221T+B9khzb6gwPzK0SjlbnD3WCAT57YpEQ6d0ueWA/ciFYoEQD1B/3oqs2ZoJuT33uJJMVTJHpuoj1fH8qYsCY7usAq/op69VE55oCGhNug1MQlmoN0cOMB424W5sx7zOCZG1koQgpBv9gbefX17JaGTFffpcKVtuiC1DelD7VdM4pzFpyMC8oSN5VFki2F4T4YvtAipABviulZmx+lEzo3eziCP6IfjyVc26ippJa4Tqy8f3T+myPg1rqkzqmKsRvkmvdMO4V+lrb+tZW8pTTtqrb2jFYkq0bvIl6jhffsWorB4AvWKlyiS0UcGmtZGEfP4lnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB8151.namprd12.prod.outlook.com (2603:10b6:510:299::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Thu, 30 Jan
 2025 06:11:54 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 06:11:53 +0000
Date: Thu, 30 Jan 2025 17:11:49 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive()
 using folio_walk instead of rmap walk
Message-ID: <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-5-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-5-david@redhat.com>
X-ClientProxiedBy: SYYP282CA0010.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:b4::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: f8027d37-4d56-45d0-b6ae-08dd40f4fe12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cJlRHFwhAkZ03U7Sm62azcx9L7jT2xvH8BII7JNs7RmmFPl5YekLRIgDCNfb?=
 =?us-ascii?Q?9aGgo4lx/G3ux7xJiodpD4/EmPqn/SUSmTzuArQ1Z0aVX6g6llYlmH6A8VCe?=
 =?us-ascii?Q?yfxp3h0oHBbm2kQws9o0kfor1LHbxoWEsN+d94r/beJak3w00DLTQRa7oyv9?=
 =?us-ascii?Q?PEGqeyeaaRUH36c3g0Zh/c4DrAbkPUaKheJSG3G3C3hhuSo1e4Kob95nGShy?=
 =?us-ascii?Q?IZrDZvBlWlV9NYtpo1y6W9XNv0Z23mqcfZICl43ZUNNCxslJfAbAKRNmVTj+?=
 =?us-ascii?Q?NAhXYrgS5FaZufCS2IoLC1A3uaE9oDAg2A1PkIjA2nZO6f3Am0akMvlE4ToY?=
 =?us-ascii?Q?dJMZmDXAr1/zhkkg0tK9ujd3zh9jO0jyQ2Wjs1JH4uAcEqw4F72EAlNwWF9t?=
 =?us-ascii?Q?kKnXbDpqgp5bIvElvSgPfBA6b5VJ7NQtHziy2c86P0CGQs0RxTf76ROwCmHT?=
 =?us-ascii?Q?lQ/tZdceBbGL5uLhQsXo5hQlg/9m77YTzu55A1IV71+YbVmJFngxrv4fnyd8?=
 =?us-ascii?Q?fLHn4kMpYKRelqpE4p7sgIaF623g9tzb6dcuHcvrelxF9Up6TmJOOguEczxt?=
 =?us-ascii?Q?0mowrEnRoDQndV2P65rwmuZqT/KKbrHqCYEeUNLx78LbrR+GfDN2cOJJSuJ+?=
 =?us-ascii?Q?EDcQJ6g0GUZ4SaO2uUZs2fC30259rY2J2GgZwYIoRxbKUaSgR6lX3GndBrt7?=
 =?us-ascii?Q?dKWh8/N67/DfcDSYy+fp0LYdtw0YZzspNkiZ73WexmOe8hZCT6QM7Wk8BrwV?=
 =?us-ascii?Q?zX+XwD1D8d+BQV58TKbNcj/X1tbuvm2mNpjnKpkUPdhHhahNlFqMWOMJwaFH?=
 =?us-ascii?Q?B1tGDshocwWKg0oiw6hUoLpBG7+nkgfh56DJmRoguOvFdBM1P+NmLa+7XDDl?=
 =?us-ascii?Q?eMwibmOtTS/8hFZ9fIxYZ18UtOx8HK2pVem8gyHYUr7NFk70scTPoj8PNgS3?=
 =?us-ascii?Q?rxqc9zBpsLH0cZCiLi7PD04aIGxrDxTyOKqjauUin7E0dFz8MYzwZwqpGwsn?=
 =?us-ascii?Q?7mNS4oFkoppfwQgoddQNEmRLNyq/rClb22j6BOT3GrYnc9WC35PkKcmBQlrA?=
 =?us-ascii?Q?EJ+vpO6Vxu8K8MiKQl62Dcc3pW07lfDPNHhhUlm7O4PMS9PFXRSvGnBT3yMq?=
 =?us-ascii?Q?0YIADu/csBb0eBEQ/m3XxKOdlrQL3n8yFryrzVPcwzlERHK0eAmySgi+CZR6?=
 =?us-ascii?Q?bnYz85bjmr7xAu5mBbfhZBCbYqJ8bwRAGqn5343vvSnsu8UpQAJRJJjvR0ia?=
 =?us-ascii?Q?fGHPAIqWNi3YmCWl2Pxua6yLdjmyISACQ4eykwNPb87M5k29cORl0Wc58q5n?=
 =?us-ascii?Q?RwSH1nS2Pw37D2ast/KRmQFuKOJDCmOOFN+lXYPA81jEDKXunWtezOcWfqVA?=
 =?us-ascii?Q?8nCgMzgFfOHj1u6QjL8TIZ1BYqUP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NQ2DPP2YhKkDIThGceRul72P9fQdS0YTdy3SlSNoNWF0UUJEBLVyjmThDnDK?=
 =?us-ascii?Q?PaxF9Qqxa0K54NrsI4gzoo1GDXw59+OMPpvppiQ2cxGFv0vfzZXq/cdzOmrC?=
 =?us-ascii?Q?dE32FNluH4je90tOVMZ11WCQUQItSaVIWA2hBjFv71Fs2IPPrv/9j0s47Khf?=
 =?us-ascii?Q?mw8CjK+SmXc2lhCkuznp0jd0L2E/YfnvDZKQqSwKlEwm2GdHAeEUxhRLKCIB?=
 =?us-ascii?Q?Y5vJJi0OUKrUmoe7M5j6v79d8zPgXnZMw8WEIbiE1xJOt/5AGZMet2Ya0XPB?=
 =?us-ascii?Q?pBDr0qyDy9dSqzSRAkE6mTBOX93dHJNim7KaneX/5Za7EYDDD5M3OWxPvK1+?=
 =?us-ascii?Q?HDG7McSeZWjcMh3fxv6uqVNjx72cZK7CaAzxRJhTSQqoDpz3IQSOR2ZZB0po?=
 =?us-ascii?Q?2hKtyLlc3pRPe3JZiSxBKU8SP8PQCdFKpFalIwPO8E+KAPWvalquonxv65pL?=
 =?us-ascii?Q?xMjn2ufMcCdOmfsICMgbCxBlIalzeeGuU7yZ0SkcJjYvnaqBHHJzE9mMU8Y5?=
 =?us-ascii?Q?t0WMmxbiuWBJHsOjTm6b8+qdmDQhbDnn4oa0NaMAmj/V+i9goT36xw1mvPli?=
 =?us-ascii?Q?6m3BmZb7nphmcZCW7oWWeuP4+JpRVGW7NqJ953AKDk2RMHI9QR5StrZ8H9ex?=
 =?us-ascii?Q?3bYTNi2jKUzauzYqa0WU9C6yEeo3xpN4x2etOoCsK32rf4WvIEG6u6D2CzAk?=
 =?us-ascii?Q?tcw9iymHw+hvtvoOUD9IKK0xHWVCIFFV/uJePXt8e44xP6UB+fvceQh+bMp2?=
 =?us-ascii?Q?bEUI+xXkjOj7pISRPUKnNArRWkrjR41NdzHLo9wnHh8Us0uWeSuwDFdMyr8B?=
 =?us-ascii?Q?SnIEX1gzR7A0wlX+7VKp2qzSvpBUAI9BLJO1fSuRhuoNy4tzOoZ70G4tGGU0?=
 =?us-ascii?Q?8ZWJFa2KyOvQy75yVSfW/J0bGQ9a/EpvlvUhbZpd9C6W1jH2CkbAYXRNCJNp?=
 =?us-ascii?Q?Fji7kcRiL4IiwrijJAOL8+TZkbnZfBwmpsthkRJQXFWOrc8A3I4ATLYBYXOH?=
 =?us-ascii?Q?nORFuc1RHHaLqZNHWfsV39y/dzm/abfvss7z2p/HDAwiHspO4ZdhSFUJTZgx?=
 =?us-ascii?Q?A4+ned0O6a3glJL1If52bqyTQKiLlDmVEyduTL6DQd5SXtYk/h7Jfdaqh9oV?=
 =?us-ascii?Q?LZB5e+WyH4So+T2VQMXwYyg17v4/2t0OVsC/ywINUQqHxRRkxPgKn+V5MhY7?=
 =?us-ascii?Q?FDLZ6DNWRtUMfief0Htgn+7+asR76fCyx5+OC67ahcX1QVzlYqkusEWZpNYj?=
 =?us-ascii?Q?0piwCGmlHMsnEr63AkAVv0q3TejnvvAAJotHwkcoGxZJKIEUJ8MTXMlYKWNo?=
 =?us-ascii?Q?oxcG8xnprYazpoEK4lH0tKiLdEf5w6mducSMdPniTcggqqQcazyjRYkawFv1?=
 =?us-ascii?Q?zKkd40f3A0J09+GgZVP59d16ec9YCVBO5ixUxulK+YDUnHuwC9l8XIWI3Y9a?=
 =?us-ascii?Q?yR/zRamrArJBfU8jd93qmDp6JAvcwk3CsEnKrYzUoYGpFjWl4ameHKydsABR?=
 =?us-ascii?Q?MXMKDm+8g+PDwJ6diqyeVwmjc39IwSIHw3Qo/pGHN2bSBahvZJ8f0NdJ+ppd?=
 =?us-ascii?Q?zXClOjbq1O9VLAhWDQxgMtypWRJlygXrPBAcxAg+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8027d37-4d56-45d0-b6ae-08dd40f4fe12
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 06:11:53.8127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: doLbSHC6dSByMWijwHcSHWDWbgWmvhDm767BqG9CRgY/vLSjHBWZRq6ySHCQQAEcmkdK2mcR41kKjWHMc+cPjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8151
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

On Wed, Jan 29, 2025 at 12:54:02PM +0100, David Hildenbrand wrote:
> We require a writable PTE and only support anonymous folio: we can only
> have exactly one PTE pointing at that page, which we can just lookup
> using a folio walk, avoiding the rmap walk and the anon VMA lock.
> 
> So let's stop doing an rmap walk and perform a folio walk instead, so we
> can easily just modify a single PTE and avoid relying on rmap/mapcounts.
> 
> We now effectively work on a single PTE instead of multiple PTEs of
> a large folio, allowing for conversion of individual PTEs from
> non-exclusive to device-exclusive -- note that the other way always
> worked on single PTEs.
> 
> We can drop the MMU_NOTIFY_EXCLUSIVE MMU notifier call and document why
> that is not required: GUP will already take care of the
> MMU_NOTIFY_EXCLUSIVE call if required (there is already a device-exclusive
> entry) when not finding a present PTE and having to trigger a fault and
> ending up in remove_device_exclusive_entry().

I will have to look at this a bit more closely tomorrow but this doesn't seem
right to me. We may be transitioning from a present PTE (ie. a writable
anonymous mapping) to a non-present PTE (ie. a device-exclusive entry) and
therefore any secondary processors (eg. other GPUs, iommus, etc.) will need to
update their copies of the PTE. So I think the notifier call is needed.

> Note that the PTE is
> always writable, and we can always create a writable-device-exclusive
> entry.
> 
> With this change, device-exclusive is fully compatible with THPs /
> large folios. We still require PMD-sized THPs to get PTE-mapped, and
> supporting PMD-mapped THP (without the PTE-remapping) is a different
> endeavour that might not be worth it at this point.
> 
> This gets rid of the "folio_mapcount()" usage and let's us fix ordinary
> rmap walks (migration/swapout) next. Spell out that messing with the
> mapcount is wrong and must be fixed.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/rmap.c | 188 ++++++++++++++++--------------------------------------
>  1 file changed, 55 insertions(+), 133 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 676df4fba5b0..49ffac6d27f8 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2375,131 +2375,6 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
>  }
>  
>  #ifdef CONFIG_DEVICE_PRIVATE
> -struct make_exclusive_args {
> -	struct mm_struct *mm;
> -	unsigned long address;
> -	void *owner;
> -	bool valid;
> -};
> -
> -static bool page_make_device_exclusive_one(struct folio *folio,
> -		struct vm_area_struct *vma, unsigned long address, void *priv)
> -{
> -	struct mm_struct *mm = vma->vm_mm;
> -	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
> -	struct make_exclusive_args *args = priv;
> -	pte_t pteval;
> -	struct page *subpage;
> -	bool ret = true;
> -	struct mmu_notifier_range range;
> -	swp_entry_t entry;
> -	pte_t swp_pte;
> -	pte_t ptent;
> -
> -	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0,
> -				      vma->vm_mm, address, min(vma->vm_end,
> -				      address + folio_size(folio)),
> -				      args->owner);
> -	mmu_notifier_invalidate_range_start(&range);
> -
> -	while (page_vma_mapped_walk(&pvmw)) {
> -		/* Unexpected PMD-mapped THP? */
> -		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
> -
> -		ptent = ptep_get(pvmw.pte);
> -		if (!pte_present(ptent)) {
> -			ret = false;
> -			page_vma_mapped_walk_done(&pvmw);
> -			break;
> -		}
> -
> -		subpage = folio_page(folio,
> -				pte_pfn(ptent) - folio_pfn(folio));
> -		address = pvmw.address;
> -
> -		/* Nuke the page table entry. */
> -		flush_cache_page(vma, address, pte_pfn(ptent));
> -		pteval = ptep_clear_flush(vma, address, pvmw.pte);
> -
> -		/* Set the dirty flag on the folio now the pte is gone. */
> -		if (pte_dirty(pteval))
> -			folio_mark_dirty(folio);
> -
> -		/*
> -		 * Check that our target page is still mapped at the expected
> -		 * address.
> -		 */
> -		if (args->mm == mm && args->address == address &&
> -		    pte_write(pteval))
> -			args->valid = true;
> -
> -		/*
> -		 * Store the pfn of the page in a special migration
> -		 * pte. do_swap_page() will wait until the migration
> -		 * pte is removed and then restart fault handling.
> -		 */
> -		if (pte_write(pteval))
> -			entry = make_writable_device_exclusive_entry(
> -							page_to_pfn(subpage));
> -		else
> -			entry = make_readable_device_exclusive_entry(
> -							page_to_pfn(subpage));
> -		swp_pte = swp_entry_to_pte(entry);
> -		if (pte_soft_dirty(pteval))
> -			swp_pte = pte_swp_mksoft_dirty(swp_pte);
> -		if (pte_uffd_wp(pteval))
> -			swp_pte = pte_swp_mkuffd_wp(swp_pte);
> -
> -		set_pte_at(mm, address, pvmw.pte, swp_pte);
> -
> -		/*
> -		 * There is a reference on the page for the swap entry which has
> -		 * been removed, so shouldn't take another.
> -		 */
> -		folio_remove_rmap_pte(folio, subpage, vma);
> -	}
> -
> -	mmu_notifier_invalidate_range_end(&range);
> -
> -	return ret;
> -}
> -
> -/**
> - * folio_make_device_exclusive - Mark the folio exclusively owned by a device.
> - * @folio: The folio to replace page table entries for.
> - * @mm: The mm_struct where the folio is expected to be mapped.
> - * @address: Address where the folio is expected to be mapped.
> - * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier callbacks
> - *
> - * Tries to remove all the page table entries which are mapping this
> - * folio and replace them with special device exclusive swap entries to
> - * grant a device exclusive access to the folio.
> - *
> - * Context: Caller must hold the folio lock.
> - * Return: false if the page is still mapped, or if it could not be unmapped
> - * from the expected address. Otherwise returns true (success).
> - */
> -static bool folio_make_device_exclusive(struct folio *folio,
> -		struct mm_struct *mm, unsigned long address, void *owner)
> -{
> -	struct make_exclusive_args args = {
> -		.mm = mm,
> -		.address = address,
> -		.owner = owner,
> -		.valid = false,
> -	};
> -	struct rmap_walk_control rwc = {
> -		.rmap_one = page_make_device_exclusive_one,
> -		.done = folio_not_mapped,
> -		.anon_lock = folio_lock_anon_vma_read,
> -		.arg = &args,
> -	};
> -
> -	rmap_walk(folio, &rwc);
> -
> -	return args.valid && !folio_mapcount(folio);
> -}
> -
>  /**
>   * make_device_exclusive() - Mark an address for exclusive use by a device
>   * @mm: mm_struct of associated target process
> @@ -2530,9 +2405,12 @@ static bool folio_make_device_exclusive(struct folio *folio,
>  struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>  		void *owner, struct folio **foliop)
>  {
> -	struct folio *folio;
> +	struct folio *folio, *fw_folio;
> +	struct vm_area_struct *vma;
> +	struct folio_walk fw;
>  	struct page *page;
> -	long npages;
> +	swp_entry_t entry;
> +	pte_t swp_pte;
>  
>  	mmap_assert_locked(mm);
>  
> @@ -2540,12 +2418,16 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>  	 * Fault in the page writable and try to lock it; note that if the
>  	 * address would already be marked for exclusive use by the device,
>  	 * the GUP call would undo that first by triggering a fault.
> +	 *
> +	 * If any other device would already map this page exclusively, the
> +	 * fault will trigger a conversion to an ordinary
> +	 * (non-device-exclusive) PTE and issue a MMU_NOTIFY_EXCLUSIVE.
>  	 */
> -	npages = get_user_pages_remote(mm, addr, 1,
> -				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
> -				       &page, NULL);
> -	if (npages != 1)
> -		return ERR_PTR(npages);
> +	page = get_user_page_vma_remote(mm, addr,
> +					FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
> +					&vma);
> +	if (IS_ERR(page))
> +		return page;
>  	folio = page_folio(page);
>  
>  	if (!folio_test_anon(folio) || folio_test_hugetlb(folio)) {
> @@ -2558,11 +2440,51 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>  		return ERR_PTR(-EBUSY);
>  	}
>  
> -	if (!folio_make_device_exclusive(folio, mm, addr, owner)) {
> +	/*
> +	 * Let's do a second walk and make sure we still find the same page
> +	 * mapped writable. If we don't find what we expect, we will trigger
> +	 * GUP again to fix it up. Note that a page of an anonymous folio can
> +	 * only be mapped writable using exactly one page table mapping
> +	 * ("exclusive"), so there cannot be other mappings.
> +	 */
> +	fw_folio = folio_walk_start(&fw, vma, addr, 0);
> +	if (fw_folio != folio || fw.page != page ||
> +	    fw.level != FW_LEVEL_PTE || !pte_write(fw.pte)) {
> +		if (fw_folio)
> +			folio_walk_end(&fw, vma);
>  		folio_unlock(folio);
>  		folio_put(folio);
>  		return ERR_PTR(-EBUSY);
>  	}
> +
> +	/* Nuke the page table entry so we get the uptodate dirty bit. */
> +	flush_cache_page(vma, addr, page_to_pfn(page));
> +	fw.pte = ptep_clear_flush(vma, addr, fw.ptep);
> +
> +	/* Set the dirty flag on the folio now the pte is gone. */
> +	if (pte_dirty(fw.pte))
> +		folio_mark_dirty(folio);
> +
> +	/*
> +	 * Store the pfn of the page in a special device-exclusive non-swap pte.
> +	 * do_swap_page() will trigger the conversion back while holding the
> +	 * folio lock.
> +	 */
> +	entry = make_writable_device_exclusive_entry(page_to_pfn(page));
> +	swp_pte = swp_entry_to_pte(entry);
> +	if (pte_soft_dirty(fw.pte))
> +		swp_pte = pte_swp_mksoft_dirty(swp_pte);
> +	/* The pte is writable, uffd-wp does not apply. */
> +	set_pte_at(mm, addr, fw.ptep, swp_pte);
> +
> +	/*
> +	 * TODO: The device-exclusive non-swap PTE holds a folio reference but
> +	 * does not count as a mapping (mapcount), which is wrong and must be
> +	 * fixed, otherwise RMAP walks don't behave as expected.
> +	 */
> +	folio_remove_rmap_pte(folio, page, vma);
> +
> +	folio_walk_end(&fw, vma);
>  	*foliop = folio;
>  	return page;
>  }
> -- 
> 2.48.1
> 
