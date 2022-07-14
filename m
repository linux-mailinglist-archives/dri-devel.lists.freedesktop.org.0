Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B268D5744F9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 08:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09334A1863;
	Thu, 14 Jul 2022 06:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5361FA1808;
 Thu, 14 Jul 2022 06:15:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=He4i0+XVfjdg+IZhhd3T99QkQDZrZ2KjQtW+ZcC71D/NMkNjkKj6tiuwl3FcxSi5xG2JtrUUo77KUKYiuwgEI31jRdaNab3uhM9JCg3lcgo+ICGoyZmB2BW+UecL2wp2bMsOLcV98BHx6USPHGQnyEOGPPWuNf6tWhP4dat6Qcl6Ibq8LGlPSochU/Mb42hNZ5zrxKMj4JTIWTKRH6CdhVJQlvnyO/7FV4mKcaarosyMBHjS6ZiAKwk2nu6gcyPxC8HrK+BxPgC5etoUIUCnJUcQZWTQv83dCXXvuebrRrVllDtuwo/j82xzfBvDTtBti1pLznEDCL2kwKcAWathuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpZsmHmSIyXJ3GTPngVEgGPZzrIO4hv+wlcjYrv81iw=;
 b=fr1dVQRR2sSx8Cg+qQ7mMZ1M843DoEKYQzlnoWPghF6UMPNLCsrbPMatowdgPVGSeraQmp5VVFLmNq0NWVjIeEjEmCNsYibpOXDpB7jG+iuJrudyxgSspAp/4XyW5it9ZwVmGlWB4Vo84m1oRtc6CpYWLy2yum+BT3fTHgAcNhKzFuLLMlbmZXmbHfDSzZx8Wt+04hFSBVZCqdWKvO/uGJzo4O6Z+pj7ggPEfRkbBzj0EiK0Et4+amLPo2cwfWHMdytZHjhzEaWbjk/Ju2WPWZXko6swKWu9WdDxHujI/e3PfxwsVEYd2wUr8EsDvpGpjVXDM0CvuHN2Xipz28kfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpZsmHmSIyXJ3GTPngVEgGPZzrIO4hv+wlcjYrv81iw=;
 b=XWNnjCdmW+CgcxlrA6SkBL1MwySqEFfC3p+qh4aU+e7zJymIZvbWMtgwqnyIyWOcHlTI3CZXQPtAJd4Q0lEyXgiM7LnL90FM6kmrL+iZz9bFqgossyMbqrQ2O+XciXXCTXlLM6m2AKP1tWo69WOCUkPAxnNEMoxnpeDrn8QInppMPcjSnvlRQXUHOUSWPQZga3FxiaR26Ff+6suAJZkGaaSI87TUAfAe2vBE7QnTWzypgQKcPBO39SjTCckyN3Q9EdMAdoIswqPD6rXjrHOoKQPm16XHtyf2rUuXG0blwpA9eQTHB5Jrgd+pSvO5y4g80JbBPCCZwxWlGQfChbWyeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BN6PR12MB1748.namprd12.prod.outlook.com (2603:10b6:404:105::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 06:15:48 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7%5]) with mapi id 15.20.5417.020; Thu, 14 Jul 2022
 06:15:48 +0000
References: <20220707190349.9778-1-alex.sierra@amd.com>
 <20220707190349.9778-8-alex.sierra@amd.com>
 <2c4dd559-4fa9-f874-934f-d6b674543d0f@redhat.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v8 07/15] mm/gup: migrate device coherent pages when
 pinning instead of failing
Date: Thu, 14 Jul 2022 15:39:49 +1000
In-reply-to: <2c4dd559-4fa9-f874-934f-d6b674543d0f@redhat.com>
Message-ID: <87sfn4cj8u.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 965c4f3a-4c81-4dca-35f2-08da65604b5c
X-MS-TrafficTypeDiagnostic: BN6PR12MB1748:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7xNoJahfQbnHevD49GRCqXcee+6IsrJW7HT4d8GYDOD5tVnmQyfwxntuXaZ+EkRRkyCK7s8wsPLbi9iNiLVdgijPwx0jqO0G9k+VojZBubXMNVc9pGIClTL0aFXxDzO0rE/Lq+Ym71zMEtUjJqoU8+0r5Co6MwfgmL9+hThBqBu82XOJo9p3alhYMBbQpjbmk9G955P1EWwSE110xQAPblC0WEViH5x4PsfwROHqtWEaMcSeNP2QDfxYSjn7UtbRuhn+CG50EB84+7NOuROBd7ffljcEVO+MOvpbdzHfCxFOhEhaS+fLUStky6tr1gKvfMOO+bjv3FCZ0aSkCn7HrTbpZKm3q0xYaibQjQ6Dii0iCCugjr7x9pm+MsqkTCk9teDijr9D6CRKyzykxlJdw99EMbkFR51XcR88PSUGxq3gVXJAbv/0/niXpBhAbF+4nX2FCngJk47thWhKOVjf/LOB6xTHue+Zgf1n9tlcCUxxGR9sdYbaZSv7wcdJ9b7Vp1949+LaRn3bntdBxZc9x4e5sKNQ09PtdxawR0I3M/Hv2ItYvLAFr4WtoCAT3eKAVgXbHt9cgFhaaxYXp4Sncbx9twKFZrXBxdekhtQ/eOXb8oqod30zVuThJ6Fa77q0EzDzG21WdW+2dcdi2yPmy8lF3g6O9u0pezHuwnYzFDqnd40bjBW6eyZKICfPdY5QnlPXacwvd+ME1RvsJgDDNy8yiY5F2oednNL7p9dwsvfNg8JFx9JDYD+Wn40+590F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(38100700002)(83380400001)(2906002)(7416002)(30864003)(8936002)(5660300002)(316002)(86362001)(66946007)(8676002)(186003)(4326008)(66556008)(66476007)(41300700001)(6916009)(26005)(9686003)(6506007)(6486002)(6512007)(53546011)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w2+w5s18MIQdOV2Zp6sjsKxqN93Gz4i+Ztm5b4utZekEHDe46P4o3mCXEfXG?=
 =?us-ascii?Q?0H0fb5B295MixV6PDihWHpZIZO5b2DT1nm10kzoe/7cpH5bLgB8HHd22cC3p?=
 =?us-ascii?Q?+T5fqZGGnsKr3ekpth8OaQ/zWyoIi4Vp2FUDjg94c5bKdNajzrJ5eLybNIxh?=
 =?us-ascii?Q?Hvcht59gZZkPz1RTc95pKkC76EF3GIuv5NIxvOx2oENI7sqb/9X9RnI3RBoV?=
 =?us-ascii?Q?Ut8baWgElIclhz4X/hoiqcSfwdA0cCuDwE/NW4d8867a9TGyvgR1rTKZKDX6?=
 =?us-ascii?Q?OowQIDWpsDnkqJVWhBzc7dzllzxFz7c54xivqhUbHEhWFh4Gc6Mm2bVraxIx?=
 =?us-ascii?Q?I14ulvE+cxjZmcUwQ01sPhd+mh3xLWl6D12NdOeCtObZHLMtaK4H8hEZiIwV?=
 =?us-ascii?Q?r/GnGkDEZ0IZws1opH06gRbYCmeLJRTnu2wPiW01NO3YdgyDX/8LCoEu9hoS?=
 =?us-ascii?Q?n1hz+hl06dMimwy38kz/GUli92zY4DuZZ1Kf0zzZL+Mxg7QMHpfSOCe1pQ3j?=
 =?us-ascii?Q?hYv8fV+FmMjj4dgn3O0Jl98Sw+U9Ybr0D8F6T9r5OySmfFgvKnsCg+SFkarc?=
 =?us-ascii?Q?FROKmYcS8ild4b858SJ4BARK0jOV2CdBzGScHWUP2fBc77y57y0zvuJ4i8y8?=
 =?us-ascii?Q?GReyhn+DOeivCNmKzFIxS1WkHC5W/EziZMAQIKVmkswS52ZfxXwkUSaU8Hkc?=
 =?us-ascii?Q?ferbyL56e1RIqcn3zfdY1nzepOvEdc1zszTU6sQGNZvoyPukC9rmp/0cnPxu?=
 =?us-ascii?Q?9bcgDPnDM3t99PRdCmZWdz3oEHUHspy554LfKocLe8kBjLZw2uu9knK43Sy6?=
 =?us-ascii?Q?K58I10TEJdQxguwlT5nFoVOwwCK0GSTj/Gfin7l12O6N9FjkNSWDP1fEfNol?=
 =?us-ascii?Q?ge0rx7wJkFzA2OIy0hxCFrcxhxdCZQUjk/s0KwO0jyYcX/TO0t2q179iczKh?=
 =?us-ascii?Q?HZ6ZmuBujE/EdNEABUWBmvzHIBRv1VlGetqUBnh4sHPqOwK47hGcMcP5CI+M?=
 =?us-ascii?Q?000AW0U3X2/whoV8ChwTFIq41ROO1YZGXD+4ci8x+lBYdNhHEhDVQmZnRSKD?=
 =?us-ascii?Q?+QTacVapnOUdGiVECFh0P1jD9hS8zSRlSFk/vGlfaVKi0tXXuQo+AaghJRvS?=
 =?us-ascii?Q?aOGbVsJZDettdpJ9eGwJAafyuKtI/UTqrimQjsAQrextXXL5BpTM5QCQ0rCJ?=
 =?us-ascii?Q?ycEs1teXR9e3AWeV74WH2cd1+GAc/uDZsTHbMtv/5r2IEoqbCHrLEUHDiKAA?=
 =?us-ascii?Q?N5vrU+IUsMdemomCChthi/Rli6L/l4J5j5X5DQHoAjmXqbDEA0bvwVLkKPLQ?=
 =?us-ascii?Q?CQe0GqdvzMb7/nVb0LrbMCxF0EyYjtjrhZGQQuTGeyY7Hs8HS1J7b82ubQgl?=
 =?us-ascii?Q?hN7Z+T1q6fQNK1JrWYJrgPpK2baZbhS/2HetZjjKls5yCXGvP5PwHcYFqZku?=
 =?us-ascii?Q?OF8FDxNPWvTWarAWiJj7ikb6dSZAEwg3EAD0PuzXHYcwKqXgAw/d/38QeciK?=
 =?us-ascii?Q?GDZv69FU8fm0eym4L5m8zojfYbIq+5O4n4TlbjvgB7Rxc6TiK/xQ4Mz/bG8x?=
 =?us-ascii?Q?CrLrnuMDLwm5Kso2OOvr4OA04Ujv9ncvHGiEi6i6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965c4f3a-4c81-4dca-35f2-08da65604b5c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 06:15:48.5540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+n1LROQDT8gKp93T59JU1SdHMiWUm3nCvW7w/+EP4h6f1REp6JKk9N+8HYeJ8P4O0gf8CAwW/Mt3iFu066/8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1748
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


David Hildenbrand <david@redhat.com> writes:

> On 07.07.22 21:03, Alex Sierra wrote:
>> From: Alistair Popple <apopple@nvidia.com>
>>
>> Currently any attempts to pin a device coherent page will fail. This is
>> because device coherent pages need to be managed by a device driver, and
>> pinning them would prevent a driver from migrating them off the device.
>>
>> However this is no reason to fail pinning of these pages. These are
>> coherent and accessible from the CPU so can be migrated just like
>> pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
>> them first try migrating them out of ZONE_DEVICE.
>>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> [hch: rebased to the split device memory checks,
>>       moved migrate_device_page to migrate_device.c]
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  mm/gup.c            | 47 +++++++++++++++++++++++++++++++++++-----
>>  mm/internal.h       |  1 +
>>  mm/migrate_device.c | 53 +++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 96 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index b65fe8bf5af4..9b6b9923d22d 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -1891,9 +1891,43 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>>  			continue;
>>  		prev_folio = folio;
>>
>> -		if (folio_is_longterm_pinnable(folio))
>> +		/*
>> +		 * Device private pages will get faulted in during gup so it
>> +		 * shouldn't be possible to see one here.
>> +		 */
>> +		if (WARN_ON_ONCE(folio_is_device_private(folio))) {
>> +			ret = -EFAULT;
>> +			goto unpin_pages;
>> +		}
>
> I'd just drop that. Device private pages are never part of a present PTE. So if we
> could actually get a grab of one via GUP we would be in bigger trouble ...
> already before this patch.

Fair.

>> +
>> +		/*
>> +		 * Device coherent pages are managed by a driver and should not
>> +		 * be pinned indefinitely as it prevents the driver moving the
>> +		 * page. So when trying to pin with FOLL_LONGTERM instead try
>> +		 * to migrate the page out of device memory.
>> +		 */
>> +		if (folio_is_device_coherent(folio)) {
>> +			WARN_ON_ONCE(PageCompound(&folio->page));
>
> Maybe that belongs into migrate_device_page()?

Ok (noting Matthew's comment there as well).

>> +
>> +			/*
>> +			 * Migration will fail if the page is pinned, so convert
>
> [...]
>
>>  /*
>>   * mm/gup.c
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index cf9668376c5a..5decd26dd551 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -794,3 +794,56 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
>>  	}
>>  }
>>  EXPORT_SYMBOL(migrate_vma_finalize);
>> +
>> +/*
>> + * Migrate a device coherent page back to normal memory.  The caller should have
>> + * a reference on page which will be copied to the new page if migration is
>> + * successful or dropped on failure.
>> + */
>> +struct page *migrate_device_page(struct page *page, unsigned int gup_flags)
>
> Function name should most probably indicate that we're dealing with coherent pages here?

Ok.

>> +{
>> +	unsigned long src_pfn, dst_pfn = 0;
>> +	struct migrate_vma args;
>> +	struct page *dpage;
>> +
>> +	lock_page(page);
>> +	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
>> +	args.src = &src_pfn;
>> +	args.dst = &dst_pfn;
>> +	args.cpages = 1;
>> +	args.npages = 1;
>> +	args.vma = NULL;
>> +	migrate_vma_setup(&args);
>> +	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
>> +		return NULL;
>
> Wow, these refcount and page locking/unlocking rules with this migrate_* api are
> confusing now. And the usage here of sometimes returning and sometimes falling
> trough don't make it particularly easier to understand here.
>
> I'm not 100% happy about reusing migrate_vma_setup() usage if there *is no VMA*.
> That's just absolutely confusing, because usually migrate_vma_setup() itself
> would do the collection step and ref+lock pages. :/
>
> In general, I can see why/how we're reusing the migrate_vma_* API here, but there
> is absolutely no VMA ... not sure what to improve besides providing a second API
> that does a simple single-page migration. But that can be changed later ...

Yeah, as noted in your other response I think it should be ok to just
call migrate_vma_unmap() directly from migrate_device_page() so I assume
that would adequately deal with this.

>> +
>> +	dpage = alloc_pages(GFP_USER | __GFP_NOWARN, 0);
>> +
>
> alloc_page()
>
>> +	/*
>> +	 * get/pin the new page now so we don't have to retry gup after
>> +	 * migrating. We already have a reference so this should never fail.
>> +	 */
>> +	if (dpage && WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
>> +		__free_pages(dpage, 0);
>
> __free_page()
>
>> +		dpage = NULL;
>> +	}
>
> Hm, this means that we are not pinning via the PTE at hand, but via something
> we expect migration to put into the PTE. I'm not really happy about this.
>
> Ideally, we'd make the pinning decision only on the actual GUP path, not in here.
> Just like in the migrate_pages() case, where we end up dropping all refs/pins
> and looking up again via GUP from the PTE.
>
> For example, I wonder if something nasty could happen if the PTE got mapped
> R/O in the meantime and you're pinning R/W here ...
>
> TBH, all this special casing on gup_flags here is nasty. Please, let's just do
> it like migrate_pages() and do another GUP walk. Absolutely no need to optimize.

The only reason to pass gup_flags is to check FOLL_PIN vs. FOLL_GET so
that we can do the right reference on the destination page. I did the
optimisation because we already have the destination page with a
reference and GUP/PUP does not make any guarantees about the current PTE
state anyway.

However I noticed there might be a race here - during migration we
replace present PTEs with migration entries. On fork these get copied
via copy_nonpresent_pte() and made read-only. However we don't check if
the page a migration entry points to is pinned or not. For an ordinary
PTE copy_present_pte() would copy the page for a COW mapping, but this
won't happen if the page happens to be undergoing migration (even though
the migration will ultimately fail due to the pin).

Anyway I don't think this patch currently makes that any worse, but if
we fix the above it will because there is a brief period during which
the page we're pinning won't look like a pinned page.

So I will go with the suggestion to do another GUP walk.

> [...]
>
>
>
> I'd go with something like the following on top (which does not touch on the
> general semantic issue with migrate_vma_* ). Note that I most probably messed
> up some refcount/lock handling and that it's broken.
> Just to give you an idea what I think could be cleaner.

Thanks! At a glance it looks roughly right but I will check and respin
it to incorporate the comments.

> diff --git a/mm/gup.c b/mm/gup.c
> index 9b6b9923d22d..17041b3e605e 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1881,7 +1881,7 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  	unsigned long isolation_error_count = 0, i;
>  	struct folio *prev_folio = NULL;
>  	LIST_HEAD(movable_page_list);
> -	bool drain_allow = true;
> +	bool drain_allow = true, any_device_coherent = false;
>  	int ret = 0;
>
>  	for (i = 0; i < nr_pages; i++) {
> @@ -1891,15 +1891,6 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  			continue;
>  		prev_folio = folio;
>
> -		/*
> -		 * Device private pages will get faulted in during gup so it
> -		 * shouldn't be possible to see one here.
> -		 */
> -		if (WARN_ON_ONCE(folio_is_device_private(folio))) {
> -			ret = -EFAULT;
> -			goto unpin_pages;
> -		}
> -
>  		/*
>  		 * Device coherent pages are managed by a driver and should not
>  		 * be pinned indefinitely as it prevents the driver moving the
> @@ -1907,7 +1898,12 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  		 * to migrate the page out of device memory.
>  		 */
>  		if (folio_is_device_coherent(folio)) {
> -			WARN_ON_ONCE(PageCompound(&folio->page));
> +			/*
> +			 * We always want a new GUP lookup with device coherent
> +			 * pages.
> +			 */
> +			any_device_coherent = true;
> +			pages[i] = 0;
>
>  			/*
>  			 * Migration will fail if the page is pinned, so convert
> @@ -1918,11 +1914,12 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  				unpin_user_page(&folio->page);
>  			}
>
> -			pages[i] = migrate_device_page(&folio->page, gup_flags);
> -			if (!pages[i]) {
> -				ret = -EBUSY;
> +			ret = migrate_device_coherent_page(&folio->page);
> +			if (ret)
>  				goto unpin_pages;
> -			}
> +			/* The reference to our folio is stale now. */
> +			prev_folio = NULL;
> +			folio = NULL;
>  			continue;
>  		}
>
> @@ -1953,7 +1950,8 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  				    folio_nr_pages(folio));
>  	}
>
> -	if (!list_empty(&movable_page_list) || isolation_error_count)
> +	if (!list_empty(&movable_page_list) || isolation_error_count ||
> +	    any_device_coherent)
>  		goto unpin_pages;
>
>  	/*
> @@ -1963,14 +1961,19 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  	return nr_pages;
>
>  unpin_pages:
> -	for (i = 0; i < nr_pages; i++) {
> -		if (!pages[i])
> -			continue;
> +	/* We have to be careful if we stumbled over device coherent pages. */
> +	if (unlikely(any_device_coherent || !(gup_flags & FOLL_PIN))) {
> +		for (i = 0; i < nr_pages; i++) {
> +			if (!pages[i])
> +				continue;
>
> -		if (gup_flags & FOLL_PIN)
> -			unpin_user_page(pages[i]);
> -		else
> -			put_page(pages[i]);
> +			if (gup_flags & FOLL_PIN)
> +				unpin_user_page(pages[i]);
> +			else
> +				put_page(pages[i]);
> +		}
> +	} else {
> +		unpin_user_pages(pages, nr_pages);
>  	}
>
>  	if (!list_empty(&movable_page_list)) {
> diff --git a/mm/internal.h b/mm/internal.h
> index eeab4ee7a4a3..899dab512c5a 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -853,7 +853,7 @@ int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
>  		      unsigned long addr, int page_nid, int *flags);
>
>  void free_zone_device_page(struct page *page);
> -struct page *migrate_device_page(struct page *page, unsigned int gup_flags);
> +int migrate_device_coherent_page(struct page *page);
>
>  /*
>   * mm/gup.c
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 5decd26dd551..dfb78ea3d326 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -797,53 +797,40 @@ EXPORT_SYMBOL(migrate_vma_finalize);
>
>  /*
>   * Migrate a device coherent page back to normal memory.  The caller should have
> - * a reference on page which will be copied to the new page if migration is
> - * successful or dropped on failure.
> + * a reference on page, which will be dropped on return.
>   */
> -struct page *migrate_device_page(struct page *page, unsigned int gup_flags)
> +int migrate_device_coherent_page(struct page *page)
>  {
>  	unsigned long src_pfn, dst_pfn = 0;
> -	struct migrate_vma args;
> +	struct migrate_vma args = {
> +		.src = &src_pfn,
> +		.dst = &dst_pfn,
> +		.cpages = 1,
> +		.npages = 1,
> +		.vma = NULL,
> +	};
>  	struct page *dpage;
>
> +	VM_WARN_ON_ONCE(PageCompound(page));
> +
>  	lock_page(page);
>  	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
> -	args.src = &src_pfn;
> -	args.dst = &dst_pfn;
> -	args.cpages = 1;
> -	args.npages = 1;
> -	args.vma = NULL;
> -	migrate_vma_setup(&args);
> -	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
> -		return NULL;
> -
> -	dpage = alloc_pages(GFP_USER | __GFP_NOWARN, 0);
> -
> -	/*
> -	 * get/pin the new page now so we don't have to retry gup after
> -	 * migrating. We already have a reference so this should never fail.
> -	 */
> -	if (dpage && WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
> -		__free_pages(dpage, 0);
> -		dpage = NULL;
> -	}
>
> -	if (dpage) {
> -		lock_page(dpage);
> -		dst_pfn = migrate_pfn(page_to_pfn(dpage));
> +	migrate_vma_setup(&args);
> +	if (src_pfn & MIGRATE_PFN_MIGRATE) {
> +		dpage = alloc_page(GFP_USER | __GFP_NOWARN);
> +		if (dpage) {
> +			dst_pfn = migrate_pfn(page_to_pfn(dpage));
> +			lock_page(dpage);
> +		}
>  	}
>
>  	migrate_vma_pages(&args);
>  	if (src_pfn & MIGRATE_PFN_MIGRATE)
>  		copy_highpage(dpage, page);
>  	migrate_vma_finalize(&args);
> -	if (dpage && !(src_pfn & MIGRATE_PFN_MIGRATE)) {
> -		if (gup_flags & FOLL_PIN)
> -			unpin_user_page(dpage);
> -		else
> -			put_page(dpage);
> -		dpage = NULL;
> -	}
>
> -	return dpage;
> +	if (src_pfn & MIGRATE_PFN_MIGRATE)
> +		return 0;
> +	return -EBUSY;
>  }
> --
> 2.35.3
