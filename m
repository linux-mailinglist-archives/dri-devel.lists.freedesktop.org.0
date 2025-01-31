Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64A1A2394D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 06:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01EF10EA16;
	Fri, 31 Jan 2025 05:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="i6C/rig5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFBA10EA15;
 Fri, 31 Jan 2025 05:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChS2d/BgdaHHvQrIwZdQgq/wFyHz0tXOg2ylSUwu+AA4rR343n+8ml0RXLIGFkRN9+VNZdSPhLfneDKOgSBrlPkT0kCHAoZLrFo6UZYKBe1zW98OmnxKu4wXPbQJb4TMsfKiqNJaf5UgkDp3vabJO+Gv1167K/zOzvtt6RJtYw6pa80TRjNwUAttB+zAn40mz2zZ7nOf9nkXi6pnJcZJXp/QdiVTopMhrTGmL0q3LuVIXiazn0R5+2Q/5d8hDW4fb/Kp/N5ejwod/s3QbsXr+m2f1gslb4j4xhRsL4saQgBlrk3tsKYQFyFhn7EmJj0Oa+AsY2AFeWXBNyfIj5eR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdgeU0kHp17DXmsq9leFn05rlcjye8Q0N2TBBs7JOtI=;
 b=KvbJ84zL3MwzWid617hmv/iC/JULRbCFhSsM0860tKJLqtNH/7duCtzXuqIAAXRSCcApqMvkgl1/S1uZZd2ris7azBvzwnDej5NpzKEscoTzA4rcRZ/SrfvhtSmYZH3pvswfoyj9vFazzrPARtXaiZHMtpABxwr0hZBIqeFTqFfAl0dHDH5ipUA1nsaMcXjRV2RmuLpDdFXtyGK1yE5Ve+jJWIBIYtavs3RepKujK/P+ktnyCOZfxYFtNHq5a915GtQrQd3jyyQ/JL8wkTq+tq6v3EawQE2ObCQHXX36wzK7JXxo/qjlu1DvxYqb8cSaFkWb1NNjgDPiXOP4p3rVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdgeU0kHp17DXmsq9leFn05rlcjye8Q0N2TBBs7JOtI=;
 b=i6C/rig5+CtoghsS0rzb/gKP4q61nuDQZWlJxibKFEX5sk3K6+pptF8T8jllgam8SQAGbbRR+6afSW/JFjjqh3JJ523OvrOBl9Krwi3xpOAL859RVHn5GUkbWTDLYUFfP524qFV7v8pMABsFxgkrKpswY/qwvQrlImMcotTvTBOydHHslqFqJIw6hokaFioflbe9+DpmyTPJ+S1Tu2ztznVIKCOIiHHqlYKkDhI/VZ6C24otWxqVaP8Cm58Vl8muoMo+0Rfm2X6FzXDg5jqXtray4HXMz+hqqddJlHs5sMOA0Fib+f+Uww90cKFf0xvz5tlBRT5KdncEIU5aUZxdzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SN7PR12MB7300.namprd12.prod.outlook.com (2603:10b6:806:298::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.21; Fri, 31 Jan 2025 05:24:48 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 05:24:46 +0000
Date: Fri, 31 Jan 2025 16:24:41 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v4 02/33] mm/migrate: Add migrate_device_pfns
Message-ID: <eqo5ydkg4qqu44225ejet334xeqisiwadwxuokejxdotmsjzp3@rl4jvpwpgivv>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129195212.745731-3-matthew.brost@intel.com>
X-ClientProxiedBy: SYBPR01CA0201.ausprd01.prod.outlook.com
 (2603:10c6:10:16::21) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SN7PR12MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: e51d715e-a473-4b95-a678-08dd41b79319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WKdzS9RcZS4Na4wnxK5wX2ynFkfRlhEdkREIDDf8HsPafA2VvG8cs9n2/G3E?=
 =?us-ascii?Q?sCyF1+5GeV1YBUH4uj3EEZoQ4Q6ZHZjj2Qs1o97Zq/pviI8RQTUXMNHxglvX?=
 =?us-ascii?Q?HhM/RKWZ5cxz7LOf3xqbjbQVIUwcaKRWHA9to75pY5wpG6J+2mURS2s6RUIk?=
 =?us-ascii?Q?Ya5KNi4DgzrktTznV6BH7qoMOzpOPrpAspfZKQJHHhIII2uIAYV8c1mhdOHc?=
 =?us-ascii?Q?Nw1PamREp4pcViRziCLDE4ZXRRP69wsa9dQiAjOf4AprJNsEDtjUzZnYY2rT?=
 =?us-ascii?Q?D8HWIz+FVTAiUwFht89ULdHBuyV2/HQdoNYQFyEIpd5CFjWW9X2+L3yewfbr?=
 =?us-ascii?Q?XGuagQjcIr7/JZEGM19H48Sb3hXDzR46KeIwiYPFptuvIcw+0n323aepIIyk?=
 =?us-ascii?Q?qfEewiOc4Azi4wArPzQalhTVEl+1BY61tsMLGF8Kd79dZ9uLI02NggvO+4ja?=
 =?us-ascii?Q?Tye+86gicMpUZG4y9MIlqfT8jZeEkqHyMJuFAVSdaUZjy//RESods7IYxDwB?=
 =?us-ascii?Q?t6MaarUANBcpiQViZ9+pk4OJLwdwpqoG/22dLh15WBqJyqw/kF3JPJ7lAw8s?=
 =?us-ascii?Q?qWBW9WLaEorkVKOmBp3ZQxrr5faSaRpw+a+9xVqxhEZercijBkNwEIfESamO?=
 =?us-ascii?Q?yJMP2RRNwQNZkZxBVvJCjTC7OLb6inDqm9xkCEjn1HndqUR71GIQYBmK9ZNq?=
 =?us-ascii?Q?rBzY27NMGS/CSEVrwx11ST4hUuBppP8FU9CJ4BbQMMRUHwZry6z8p5LQXAyv?=
 =?us-ascii?Q?EYVjvz7eU/wkvcPSmYIxDzJ6h5cg8EJd8TD/qsgXQCEY3HYPD7vcF4wUnstJ?=
 =?us-ascii?Q?b8ob+qTqAw61mthYTdQe9G9frwztmouGZ7b5POirzGySpGCNFqpYrr58RS9k?=
 =?us-ascii?Q?V9ijSYeEN8MWeyeEYVc1KZpESHNiy0hHg7zHMB1HZH5AmaKRc0IDdk1E5HeG?=
 =?us-ascii?Q?VmfTejLoGzGimndiyLCm6YY5G0rWpnj3arstInWFcnNCmLGDAOXe2nh68xnu?=
 =?us-ascii?Q?JMdCncNsuODDXq0XUSM8mRdz6TH2IR1ykDl+GGfL0mRwxFOTKkUGGNVluvVQ?=
 =?us-ascii?Q?62ANYFbvQQqBNXCehT82m+Y65EHmm5iqxlu2YnLjQSmeXLL6tncuoNY32qhF?=
 =?us-ascii?Q?WCghfkzOd6804rHvBIlq9A2ZqXZWLRiD5vzP0Tzin8MS4a3HYEbejvg3V8f1?=
 =?us-ascii?Q?Ek7gbURMRmTJiTN5vQ1r3GNcb/bfzs34ns1Aq9iSEuh4s8ajyU6LPUfsN+yV?=
 =?us-ascii?Q?GaH0nKwl201UdKHNzaYG1N4SWyZ9GX8FCTgh5vVB7qAo4YfJZwxR6WUWNPDi?=
 =?us-ascii?Q?i5Fj7pK/TxUt6c7u10vwcz8L1cCZeNInZpRQPOAq1KRGlXivAHj+bq1Hi8AT?=
 =?us-ascii?Q?EFQGr7ETCJePUff0ryJLqGjG+V3a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K9dO0pfsaZG3yFPru7RXaNluK9OneWAAbOd+oX5RUZLZ0eu/S4MldGMAm3Ys?=
 =?us-ascii?Q?Uywlg3532fstFhvvwsZ7bvM5ISPWjiAnfhOkkxfxavYS6nmDsq84OG8UK9yD?=
 =?us-ascii?Q?g0PLSqbBUR/Y7GqLIYd5TLfA5aDkvJv2XO02hB1mAzHLjI14Uehy1/2adfDU?=
 =?us-ascii?Q?EDrx0n4PnIGDMaTKlxOXT+KMnP/sXOWOlcMF/v85O1rxdaRoRc2Q819UhDQW?=
 =?us-ascii?Q?Lo1b3QBQzRpkFb1Wl02wvbBjXisIzNUjwzwlxjOtVyNJL64/MMy20yFpnnRT?=
 =?us-ascii?Q?3spFJLlgFc34NsPbUKOFco0UpUXJe96c4DJELmoYGFxniIWrizj9ek9vb1jX?=
 =?us-ascii?Q?LweM6eqaj2Q8EqpiMeP09B1xnxz3VoiGKzDtu5dwByslKLwUvgWBtUsWDDJX?=
 =?us-ascii?Q?LV9tcYfh//SdZC17iBa6eQXAwcKMRacARRhnd8Zck/LyaR22abq7NlfDX7sR?=
 =?us-ascii?Q?K3q9KP0rkdU0POoJYT8x++r0ndHYNnYeFrvk5x4JCoR6LBB+pvAzyf0Jrt/P?=
 =?us-ascii?Q?RMcaTINm2NOmGd2ip1VBaL2dc8HkQDWGqHNIMMjfqpzOzrSV6ILdUb8P+R0L?=
 =?us-ascii?Q?qjD0EOVfVijCrfdLkdWa1flLQhI8mtAUArZZYBq7F9d4sL/VIRfqwp5SQOij?=
 =?us-ascii?Q?+6JtEoC4MKYL2IEBWP1miORsX9iiRrtu6f217LUqnHalkR6G5nz3FH/75sF6?=
 =?us-ascii?Q?b19QpvDGaf5I0+GnZ8PrDHPQ/RRlx8tCYBGo8bbgGVakFpIkhJnTnSzJ4DLV?=
 =?us-ascii?Q?WZh6/NFjZGx/oQSWeaE/P6GrCUOU3EUYvqLTEfuCzTflX5qUYEbbU//byRDL?=
 =?us-ascii?Q?tyNosgl6pm4zdH4IYrCr2o7tgqGuiahYczkIyaKhlL3RvgVyOILpcxGn3aUC?=
 =?us-ascii?Q?YHvA5PRCAc1FnaP2DlFS7Ba6db1okk3XLuZdcseq7CuT3AwCwDLZTkYG0YYU?=
 =?us-ascii?Q?uhnxdbX7RMwFrub2y5Goix+Q6RiFdJanEADFbRj2Dj3Fn0YQgcyHdFReBV/F?=
 =?us-ascii?Q?1q6DewYjjr3l7JUl1sIDD6Vy/ZbsAGzWbNI3d+GGijD7jsssaRbJnzxa9JJf?=
 =?us-ascii?Q?5UZHoA1ONcgXEy/pZTlgAlAV7mDfTTpALluWdSPAJkBcy0xdzeLD5UQa7lGl?=
 =?us-ascii?Q?Oh5bpkvcp6L72USLLKHpWW2SsK5LaTiMTipGa7WWcflYfvtM6KqwQ3n2cBXL?=
 =?us-ascii?Q?gbnRjdY/zslV7K5B0wE256S0c39/Oi8F6hPXS2AP/UnbcJtKG9OnLQiBJhW7?=
 =?us-ascii?Q?a0W4r5GPeV4SC/4eBlnj3TdrX+YLVU3KUOrAQn5XWdXbEIvekLbwsQqbG5+F?=
 =?us-ascii?Q?XEzdlqe9CBtiRiJJTSn/dDz5KBjHtN5Vj4Bbk1wQUuDRJOWj8m+7JvTlI9yv?=
 =?us-ascii?Q?WGEisMpfK79FRHOUS5tZIYbI9dkBjE/VaSFlc+w6yLVElqwPpf2ScO7GqjZU?=
 =?us-ascii?Q?yxQWVOCq/XJjG79DXmytt76N/kJz1t3HGTOv3fRKF8Xgiv+p68Vq/EMgTASV?=
 =?us-ascii?Q?k7tp88erodIUPHUi60XztGtRpLbzBkn/bXtvtbWFZqW17nyyP8yJWr0eIDGV?=
 =?us-ascii?Q?y+TEMh/+w2hrVVQcxxNRmdR6HFE5zUBNmis8Bukw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51d715e-a473-4b95-a678-08dd41b79319
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 05:24:46.4136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWTO+C5xl4BuExZOxf36sVT21SJEu/AXStolCBmT1xlx612X+vmVNtvz/Yw7AIIN3zmw7O7Ck+bfSDKQGgQjxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7300
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

On Wed, Jan 29, 2025 at 11:51:41AM -0800, Matthew Brost wrote:
> Add migrate_device_pfns which prepares an array of pre-populated device
> pages for migration. This is needed for eviction of known set of
> non-contiguous devices pages to cpu pages which is a common case for SVM
> in DRM drivers using TTM.
> 
> v2:
>  - s/migrate_device_vma_range/migrate_device_prepopulated_range
>  - Drop extra mmu invalidation (Vetter)
> v3:
>  - s/migrate_device_prepopulated_range/migrate_device_pfns (Alistar)
>  - Use helper to lock device pages (Alistar)
>  - Update commit message with why this is required (Alistar)

Thanks! Looks good to me now so:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/linux/migrate.h |  1 +
>  mm/migrate_device.c     | 52 +++++++++++++++++++++++++++++------------
>  2 files changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 002e49b2ebd9..6254746648cc 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -229,6 +229,7 @@ void migrate_vma_pages(struct migrate_vma *migrate);
>  void migrate_vma_finalize(struct migrate_vma *migrate);
>  int migrate_device_range(unsigned long *src_pfns, unsigned long start,
>  			unsigned long npages);
> +int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages);
>  void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
>  			unsigned long npages);
>  void migrate_device_finalize(unsigned long *src_pfns,
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 9cf26592ac93..19960743f927 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -876,6 +876,22 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
>  }
>  EXPORT_SYMBOL(migrate_vma_finalize);
>  
> +static unsigned long migrate_device_pfn_lock(unsigned long pfn)
> +{
> +	struct folio *folio;
> +
> +	folio = folio_get_nontail_page(pfn_to_page(pfn));
> +	if (!folio)
> +		return 0;
> +
> +	if (!folio_trylock(folio)) {
> +		folio_put(folio);
> +		return 0;
> +	}
> +
> +	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> +}
> +
>  /**
>   * migrate_device_range() - migrate device private pfns to normal memory.
>   * @src_pfns: array large enough to hold migrating source device private pfns.
> @@ -900,29 +916,35 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
>  {
>  	unsigned long i, pfn;
>  
> -	for (pfn = start, i = 0; i < npages; pfn++, i++) {
> -		struct folio *folio;
> +	for (pfn = start, i = 0; i < npages; pfn++, i++)
> +		src_pfns[i] = migrate_device_pfn_lock(pfn);
>  
> -		folio = folio_get_nontail_page(pfn_to_page(pfn));
> -		if (!folio) {
> -			src_pfns[i] = 0;
> -			continue;
> -		}
> +	migrate_device_unmap(src_pfns, npages, NULL);
>  
> -		if (!folio_trylock(folio)) {
> -			src_pfns[i] = 0;
> -			folio_put(folio);
> -			continue;
> -		}
> +	return 0;
> +}
> +EXPORT_SYMBOL(migrate_device_range);
>  
> -		src_pfns[i] = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> -	}
> +/**
> + * migrate_device_pfns() - migrate device private pfns to normal memory.
> + * @src_pfns: pre-popluated array of source device private pfns to migrate.
> + * @npages: number of pages to migrate.
> + *
> + * Similar to migrate_device_range() but supports non-contiguous pre-popluated
> + * array of device pages to migrate.
> + */
> +int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; i++)
> +		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
>  
>  	migrate_device_unmap(src_pfns, npages, NULL);
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(migrate_device_range);
> +EXPORT_SYMBOL(migrate_device_pfns);
>  
>  /*
>   * Migrate a device coherent folio back to normal memory. The caller should have
> -- 
> 2.34.1
> 
