Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12884A5EE3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1CC10E67F;
	Tue,  1 Feb 2022 15:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2052.outbound.protection.outlook.com [40.107.96.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F76C10E604;
 Tue,  1 Feb 2022 15:03:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVrjKebizsEmvAoj4+YnJCs4/4xkASaghv/cIcJwiYsQQ3cmRYlKtZZ/Zu9S/lKPfyl3GP6xNivyHOWWMW4ZoDNzkciPim6sGeMuHYz+xpYHJXPgyvFVpqiUwohfHq+5svolChMin+Wa0Ede7tkR6TpTKqvVTwaKIdxvjn4UQbc8d4qovVIh+d/TA3GgX0ZQXeCgsoHoMtusBEM779FlRljKS0kGtxXLzEmgRfkNs8Vy1Ztb1YZyataeBQPANZbjpiUHf8ORo+Ho6jrTCdqqAPaHm8mhLl/rfx2wJ7CtEt/zA0l3+Jyu5r5NuUpcpRM+nyO6/2NoFCYd6lwNIaPSNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM+lgti/p0qMlwCpEwjB6EqHZT7FilI4fJggvRMaZmA=;
 b=LSIIFnlxGiwQYRKfztynI6gtVyiAys4AFi1rlS6XuNQ6K5POU1iTTGedW0yRBsXGaYvLHymcA7wlIeigSqId+vyw5fJ6wb+JfBKYtE1w9WfOnWjf8HkXGGRStDGKi2VKIyL+rlNFAil4HHEvXXJe9sUJndPowgn3WYqUUk+3E+oHdKScQTf2WJ61xu2YTtTrV/NA8XPoTbeLaJ3q/FNkkHQY6BP5YqdNPz6HStM5kVV+XqDk/RY4Pca6xA6VeBbJ14Wi/6qHhZj5tv2NZD9hsuIVg7UGx1ET22LvQ35FAP6birmEsrnUhc7n91N4e1pof3jgLd6s7TJoJpq04eo2HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PM+lgti/p0qMlwCpEwjB6EqHZT7FilI4fJggvRMaZmA=;
 b=KlPDWynYINZdEKvuqlBMYXymRaQyMbAMdzVtcykaft1vjxfMB3K+oZ12hCKSLe/PzexJ4k7x4f0Q3LfMKFXWOkSCIQRgZoj7O/BZZtdiF1athorDAsBJLkjJYlN9VRnE2Vq4Ee5i3rePYek9duQsv79Rwmy4nLlnKhY0rkQIt04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB5134.namprd12.prod.outlook.com (2603:10b6:5:391::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 15:03:04 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 15:03:04 +0000
Message-ID: <49253aca-5c0b-84d4-4b2a-13426b1064ec@amd.com>
Date: Tue, 1 Feb 2022 10:03:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] mm/gup.c: Migrate device coherent pages when pinning
 instead of failing
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
References: <cover.516a938ce97eb805791da6e2df508eb0dce413b8.1643698773.git-series.apopple@nvidia.com>
 <d4d399492b2ba09f4c551fa2261fbd22172886d8.1643698773.git-series.apopple@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <d4d399492b2ba09f4c551fa2261fbd22172886d8.1643698773.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::17) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23284b9f-7bda-4a83-16b7-08d9e593f236
X-MS-TrafficTypeDiagnostic: DM4PR12MB5134:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5134630C65F78417658CBDD592269@DM4PR12MB5134.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dvkc4y57aw1URFwFBsWKNTSH3SuzIjW+Guc4i2HrlYyppoj1k1n5vsyYG3nyp2m5VFNoFp52QA001yiSlD9tDTzrA8BWapxTv5yeGbzDC1/jybU0ZXHs6xYAYiDvr9bAoUjxgXWcLYrF5mM7Op8WBIXKXF98oBFEWNtvySuRNpBByRBRwmokooRUen79ujc/rvFUy88ZQD0WR9iprv0WwVDhiSkr57RAVpaEzLrLaNXEweTZvD6rNGVksMvfEBNoRzgp8cc4Lkp6yIMNKpqYfrOS0X41HfdYevyHTIjdWT1GHJgRGLKh8gCnZtAJH2N+y7TAd/7NvKsodKNCtvhPdERU4mvCUJFwulEQLDyyFe7nS7nibRMVyORYcfl7011/vZ1xB06YkXqNrxaTcF8/DRYDHcrmjlIPF2cDPs/FsIG8epntRkRd/Byv2si+QDT6GJYsLO5VFO8V8I/ndqaOY5UJfZ3de/d1kTnZsfrYSYwrHQ2XiSIkU4dSjVZv2sYsm363sjxXimABYYhXuHGiet+eBCQSJlYLN+4X2zXxKvcSz6ov5sncqqZosXo7Ky/7Aj6PnYnpZmM0hLXanEGNeWgNGemrMKyincS6tHZRb30ui33bVmilEImxkg2WeM70mQZLqvZZZRoSsLtqDUM0Axsh4nhdYTZm0+80Z+Sg7H3CYzOdABf5OPZVMmf6HpU7PWE7Rfs83dvLFiM6SaDm8EjILz1pryOS1KU7TeAftRc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66556008)(2906002)(66946007)(8936002)(8676002)(4326008)(31686004)(36756003)(7416002)(2616005)(38100700002)(508600001)(26005)(31696002)(186003)(5660300002)(6486002)(316002)(83380400001)(44832011)(86362001)(6506007)(6512007)(6666004)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWFyYmk0dDkxVUhNbEw0aERFQXVqdWZLZGtEQTNJbEFYNjYyK2JXZnVGS0dK?=
 =?utf-8?B?QkxQVVovNXdWS2dsWkRya3dKdjczQTFKbGpGcTIxSU9kT3NLUFZWajk5MmVq?=
 =?utf-8?B?S1M0THBwSUNna3dxUzJ5L1Z6L2F1STVEMWJ5NnNaeDNIQjNvSUgzWmxEdGhF?=
 =?utf-8?B?aHk2WW5ibVBkMi8wVlhsZm12aEZFSnc1cVloOEFDc01KdnZBSXRsbk13Z1Rj?=
 =?utf-8?B?eEZ3Y3Y4aVVaaEhhYzMvQ28rbVNaNFRXZ05mTzJ2ZEFvenZXTnM5Sndacllq?=
 =?utf-8?B?aFpRQURqSlZIVStsbVhiWU52Yi9DSzdZKzRPYzI1ZHltczAvNGtFb2VGc1dl?=
 =?utf-8?B?aGFRS0dMZDhGVElZamJOTi9xdjhlamQ3TzJSK0lKMXBsTm5UeDlGelB5Z0Fr?=
 =?utf-8?B?ZzlTVzRsblVmMlorRDIyUzZCWjVMeVY3K2ZubjVVNkRtYzk1S0dRZ01pS2M2?=
 =?utf-8?B?NGdTUVlNMXd4bFJsUHJ5VGRRajRlcHRqWEFWTVNqRU1UTHlIb3ZxbCtjM0hZ?=
 =?utf-8?B?VkxSS01jRWZxWmpSOVlQVUZ3Y2VmNHF4Vy8xazRoblZDVzM2cmM2cWVDbXFq?=
 =?utf-8?B?QmZrM05CR09aWWZtTTJZeUhyOWF1bFpyRWYrQXBWMkk5WDQ0dlRERzVNK21U?=
 =?utf-8?B?TEZqZlpxNjZrN01HcEU3bzFxcWg1dGk4c3I3bzE0WXpPWXEvQndJbHBIR2tQ?=
 =?utf-8?B?ZmZzMEdneEs5T2I5TVYzV0RxVmRLRGpyVjBNdldrcG15WWtFNkVnRjVFTW9a?=
 =?utf-8?B?YXUxSmNFSmFnNUdGU29IZUhYVUZPWXBtMDFXY2lYK3JTWlZMQzRsREZ2M1Y4?=
 =?utf-8?B?bFdaMm82NGd3QUFVQ2hVeXIvYVUvWDQ5bTJqbHNCTlVGdUtGSi9seUcxRWlY?=
 =?utf-8?B?SkJsUEk5YXlzSHpIdGV3VkRYbkNRWmFuZjR4dXVFNlBRM2RPcXZaZlNqTGcr?=
 =?utf-8?B?QXhjd0JXT05RN1U1dDFML0FLa09PNmVKUzk5RE5ObFlVQ1JKam5pVEpHZzdm?=
 =?utf-8?B?T1o0ZWdZcTZiWFJmSUJiSURIN3h3RWdIaHFWR2F2YVF5eWUxTVUrdlRGd3hO?=
 =?utf-8?B?RmtrWWJrZnJnUmV5YmVmR09tQlpKSG1rbmF0Uk9OTGdLWlNzdkd1c2RiYVhi?=
 =?utf-8?B?aG9kOGowdGUrTmtFR1hta2QybThoZ2xQRWxWeVBGMmVuNDBibVBOaTlwdHFz?=
 =?utf-8?B?VGJ3aE5vMW1iV0lRR3RZR2JNWWdpUDNTd2ZMUFdDVFRSVWlvUkhCaWk2VXBm?=
 =?utf-8?B?S0FvMTVpWW00WnAwK0JOaUw1c1FQdFZ6VHhCOEpsWmEvRmlBbEtqOVh4L3oy?=
 =?utf-8?B?NXZUekNQYVZWV2d6Y1BLcFJGaDJrVzg1RDFJck5Bd0gwNnZpU0FnTWM3aXZB?=
 =?utf-8?B?eUw4cG1HYTdMNm1UMnlpQ3NWczVFMkxEbUViQnhXbmIvUjlmVkY1d211am1s?=
 =?utf-8?B?YWxFeUh5bEM0YzZEL1ZOVmZxdFJveHduWExJR2dPUDFVcUFGMjFNcHZ0QmYw?=
 =?utf-8?B?WFNZQ3pyS1RSNkN5VkFaKzhNclg3MkdNWDZLSzE5SG5SYlR5SHRRTXRhajhX?=
 =?utf-8?B?TTRKWkdPUU1KWXJsOU52Y2U3WkIxTmdhVXFaWTZIUTBqeWxpOVRncFF0Yi9F?=
 =?utf-8?B?dkw0RVdueENmaVJXcGIrNlhBbmRuVGFvV25KWWJ0RmtLVGRvTVBkNU1QZ2JX?=
 =?utf-8?B?OW5LSjl0NG5ockhyMy9uRThqZmROS0xhODhjd1dSRjVCUlBDMlRXR0dWNjZr?=
 =?utf-8?B?NFFPcDhKZ1lIKzYxSmNta3VTRGd5UXk0WlY0cEc5aUllY3VtMWtXNmdwTURj?=
 =?utf-8?B?RFI1TUdJSzQxenRNaFlKS3d2NUE3cXdjQWwwRHNrZnJqRzl5WVJhdUdhdzg4?=
 =?utf-8?B?TXVMRVM1aW9LU3YzOFJ1RmszZG43bmt4RmdnTmhoQVNVRU5oYlBMdERpNkUx?=
 =?utf-8?B?QldZWWIweDdjZk9CNlhsa2xSWExqWHpDWHFDUDhpUFdaN1lPQ291SDN4MlRq?=
 =?utf-8?B?YWF0aDJicFpVQnVodjVDNFhHT2VBU2haQmg1WTNiU29sblNSM2RNQkI4RGtk?=
 =?utf-8?B?TXBBM2J4SXRjK3VHRmE4QU5QM0QrUDY4Y2tuSHFwNkZabit6VVE3WG5CSEpU?=
 =?utf-8?B?WElvbGRZajFkMTFUQ1hkdloyOWRVTEtETGY5MEFlNmdYeU1tR0ZTbWNrYUww?=
 =?utf-8?Q?/WufXSkKiHJdGeuPAijhoMc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23284b9f-7bda-4a83-16b7-08d9e593f236
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 15:03:03.8719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/Udy+zhN0m1xhsUHR1KoqE0a6s7I0EBR7NAlc64Oz+QVwD/3QYoxNktJmJqz2RNuaBTthuNCYqykNMoOe2ZpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5134
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
 jhubbard@nvidia.com, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-02-01 um 02:05 schrieb Alistair Popple:
> Currently any attempts to pin a device coherent page will fail. This is
> because device coherent pages need to be managed by a device driver, and
> pinning them would prevent a driver from migrating them off the device.
>
> However this is no reason to fail pinning of these pages. These are
> coherent and accessible from the CPU so can be migrated just like
> pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
> them first try migrating them out of ZONE_DEVICE.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Thank you for working on this. I have two questions inline.

Other than that, patches 1 and 2 are

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   mm/gup.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 95 insertions(+), 10 deletions(-)
>
> diff --git a/mm/gup.c b/mm/gup.c
> index f596b93..2cbef54 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1834,6 +1834,60 @@ struct page *get_dump_page(unsigned long addr)
>   
>   #ifdef CONFIG_MIGRATION
>   /*
> + * Migrates a device coherent page back to normal memory. Caller should have a
> + * reference on page which will be copied to the new page if migration is
> + * successful or dropped on failure.
> + */
> +static struct page *migrate_device_page(struct page *page,
> +					unsigned int gup_flags)
> +{
> +	struct page *dpage;
> +	struct migrate_vma args;
> +	unsigned long src_pfn, dst_pfn = 0;
> +
> +	lock_page(page);
> +	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
> +	args.src = &src_pfn;
> +	args.dst = &dst_pfn;
> +	args.cpages = 1;
> +	args.npages = 1;
> +	args.vma = NULL;
> +	migrate_vma_setup(&args);
> +	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
> +		return NULL;
> +
> +	dpage = alloc_pages(GFP_USER | __GFP_NOWARN, 0);

Don't you need to check dpage for NULL before the try_grab_page call below?


> +
> +	/*
> +	 * get/pin the new page now so we don't have to retry gup after
> +	 * migrating. We already have a reference so this should never fail.
> +	 */
> +	if (WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
> +		__free_pages(dpage, 0);
> +		dpage = NULL;
> +	}
> +
> +	if (dpage) {
> +		lock_page(dpage);
> +		dst_pfn = migrate_pfn(page_to_pfn(dpage));
> +	}
> +
> +	migrate_vma_pages(&args);
> +	if (src_pfn & MIGRATE_PFN_MIGRATE)
> +		copy_highpage(dpage, page);

Can't dpage can be NULL here as well?

Regards,
   Felix


> +	migrate_vma_finalize(&args);
> +	if (dpage && !(src_pfn & MIGRATE_PFN_MIGRATE)) {
> +		if (gup_flags & FOLL_PIN)
> +			unpin_user_page(dpage);
> +		else
> +			put_page(dpage);
> +		dpage = NULL;
> +	}
> +
> +	return dpage;
> +}
> +
> +/*
>    * Check whether all pages are pinnable, if so return number of pages.  If some
>    * pages are not pinnable, migrate them, and unpin all pages. Return zero if
>    * pages were migrated, or if some pages were not successfully isolated.
> @@ -1861,15 +1915,40 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>   			continue;
>   		prev_head = head;
>   		/*
> -		 * If we get a movable page, since we are going to be pinning
> -		 * these entries, try to move them out if possible.
> +		 * Device coherent pages are managed by a driver and should not
> +		 * be pinned indefinitely as it prevents the driver moving the
> +		 * page. So when trying to pin with FOLL_LONGTERM instead try
> +		 * migrating page out of device memory.
>   		 */
>   		if (is_dev_private_or_coherent_page(head)) {
> +			/*
> +			 * device private pages will get faulted in during gup
> +			 * so it shouldn't be possible to see one here.
> +			 */
>   			WARN_ON_ONCE(is_device_private_page(head));
> -			ret = -EFAULT;
> -			goto unpin_pages;
> +			WARN_ON_ONCE(PageCompound(head));
> +
> +			/*
> +			 * migration will fail if the page is pinned, so convert
> +			 * the pin on the source page to a normal reference.
> +			 */
> +			if (gup_flags & FOLL_PIN) {
> +				get_page(head);
> +				unpin_user_page(head);
> +			}
> +
> +			pages[i] = migrate_device_page(head, gup_flags);
> +			if (!pages[i]) {
> +				ret = -EBUSY;
> +				break;
> +			}
> +			continue;
>   		}
>   
> +		/*
> +		 * If we get a movable page, since we are going to be pinning
> +		 * these entries, try to move them out if possible.
> +		 */
>   		if (!is_pinnable_page(head)) {
>   			if (PageHuge(head)) {
>   				if (!isolate_huge_page(head, &movable_page_list))
> @@ -1897,16 +1976,22 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>   	 * If list is empty, and no isolation errors, means that all pages are
>   	 * in the correct zone.
>   	 */
> -	if (list_empty(&movable_page_list) && !isolation_error_count)
> +	if (!ret && list_empty(&movable_page_list) && !isolation_error_count)
>   		return nr_pages;
>   
> -unpin_pages:
> -	if (gup_flags & FOLL_PIN) {
> -		unpin_user_pages(pages, nr_pages);
> -	} else {
> -		for (i = 0; i < nr_pages; i++)
> +	for (i = 0; i < nr_pages; i++)
> +		if (!pages[i])
> +			continue;
> +		else if (gup_flags & FOLL_PIN)
> +			unpin_user_page(pages[i]);
> +		else
>   			put_page(pages[i]);
> +
> +	if (ret && !list_empty(&movable_page_list)) {
> +		putback_movable_pages(&movable_page_list);
> +		return ret;
>   	}
> +
>   	if (!list_empty(&movable_page_list)) {
>   		ret = migrate_pages(&movable_page_list, alloc_migration_target,
>   				    NULL, (unsigned long)&mtc, MIGRATE_SYNC,
