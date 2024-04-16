Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5538A6C31
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75986112C90;
	Tue, 16 Apr 2024 13:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z8cVDeKH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B6F112C97;
 Tue, 16 Apr 2024 13:24:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyNcKWCCxegXc8lWEe+JY1UXHYYi/By+aEJnp8ESGTZzvre+2l9r3tJmQYn1E21vD8RsoqneDL/+PSn3ZlYF/3Q4/4qXKA86BomEA4LOGfB1i5SS0rCan9sFwkl6Z814/a5BpizO3I3KSyfKwY3MhzrK3SDJbi1fAmaWOa8qzzjxNbp99L1C7/a9nbJO8LifgK2aTrqjdRIWwgtmjxpMmJ7ydYD1JfXkKXJMbC5OxIw5E8CMhxiKjXAbUqiQNL6/cPFpCul8WSLnkfv8s4qmLzYqIK3f3GHqdCE4d1b0hZCkjgtV8vwoQwgsHzNYZ94v6gLQixxgxfUyRiQGUdcnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mk1f2ZTSLykVxRN0AGD/yTYSZbj2nlF0eyvDPFYBcj4=;
 b=nrSIgwj/BSGizSNEObA//36BLJvGAMZYYtt57Ka629EGy4/U2/jvgiq6ddfURHDSgK4R9qzN/v5uj31HzO045BxrgQs5kSzbA1aRXe7WzNeUUC/DVF/AeSI8fDd7pg3rLbJ2unFlNqAxsIcLs/jn6LeCdJBYsBtl7QWsYFQhJcjHXPhRRVuvJnrKXiA8iZAqQXzdyXPInyP7LIsp+Bm9nke1NYpJ6izwvA0spoC5b0vjTlo2V3zhnZ/LrYM3fsWeK8mHe/SsTKcmCBq8CUmJ+aKYypArNm2L7qZBPyQdr069VO0Xy/j6j6LX0GZUOO4nw6+H0Cm8nIx2hvDr5Ysgsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mk1f2ZTSLykVxRN0AGD/yTYSZbj2nlF0eyvDPFYBcj4=;
 b=Z8cVDeKHeOifTIRPbfrUPY041vhgzyrs5WCYV4FwCrWBqiDo90UB3JKzHbUK3aJgm8XNIsFxs1r0WP7lpkkNiBgWZ0xk9pMb4jMzlkVn3PztaW0Buz2VD/+5itPo2z2znra7N7tfaYQyYhhocKKU+IqqJpdo/bRiP456httlnQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB8499.namprd12.prod.outlook.com (2603:10b6:8:181::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 13:24:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 13:24:51 +0000
Message-ID: <c933025e-3006-4d5f-bb20-fbbeed0de457@amd.com>
Date: Tue, 16 Apr 2024 15:24:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] TTM shrinker helpers and xe buffer object shrinker
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
 <bb679fc6-7890-4b4a-a8cd-8ae7ce087a9f@amd.com>
 <d5ea84dccfc9f41ebe27600a5144778683cf944c.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d5ea84dccfc9f41ebe27600a5144778683cf944c.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 12661bfd-f688-4a75-6b70-08dc5e18985e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sd+srarviZc1hEHnACVPDUr/P2jEiLSB7XzPmv2cFfo8eON5kxKusL5PQwlzk1hDkLGRu8dMKT1ENTBNZ9WHJbbKOLzXDTUER6/Z8eMC3cXKLtmGRGIcrMSwlq5s6f3vMAH3FdjVcuW3oGTWpUB9lKdXQx5ZcxL4zU9uSchyaAuJzO4CXiy3F4GEUZxCDN57dFryLn/VDCqY3ZMAhzoSCd/0z/j01BdzTwP9NVc0TSn9wT+rThsDgsHEQ//62AHioVdeRuOxGF2852pnMIkV9Z5+DdCzOu5rkDGRfB32SZtXcUu+edGYVGnTsHuLrh60XDWFeCULKIOeDUAocdjynCiij5mo0FARv7SZqX8mQfFaK6NZOOxxRMHvjDCmEyLcXMPHUL/FfC5F75Ixkgym+xgfDqh3xNnWHnq3+XMJnOrmNhFrRAydaLYJZka+U6t4dxuB43cbyJU0vVXQIUF7N3rCtFY+KMVtAY7tDEK7+BJnhIuKFTtV0lWnikM+kn6k1xnWy3MRev8xOkMf+PRaeQcyCHmUGRWxuAGtuCLDv62AEiRi2oMPPigLfFArf1kEU5DrgF6SeMeT8M6s+MSNqq4B/8NUdYTiZdDxGTn0anKhxnK7ZE3y7l2DPLAEVtwc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU1wbDZhV3pISnZ0M1lrd2UvMjBzbVNjdi9ycU5NVDhTL2FNTksxejU0NWlY?=
 =?utf-8?B?Z2Vud3pRNG1jVndDblEzVVVubWN1WkdmQkVkRUtKWXRWR2dkK0JNMVJ4cThO?=
 =?utf-8?B?dkZvQjNDWlEyMzhORytGTlZmSUZORFZMZUtyK0RScU5wQm1nU0tOM0U5VVZP?=
 =?utf-8?B?VXVZYWp1SWVrRnJVVnlnNlBVYitTaW1Uald1RmNLYUViU09tYXB0c0FNYlQy?=
 =?utf-8?B?TjdCMHFUZlRXcXJxWURpRFlJN3JHd3hyYTNCNlF4VWVKL3NzU243Z2N0QlVI?=
 =?utf-8?B?QUlYenRUUDZ6ZGV6c0NLVHJNMzRNSXBQaGl5bmE5bkoyc2h1UER5STdkZ3Zi?=
 =?utf-8?B?dkFTK25sLzRaeHJQYkZWcWRJMnAzdE9UazQ5UlUra1kvVzBVZHA2Q2FBYWxP?=
 =?utf-8?B?TTZLaXJ6V25CWTdnTEtxVVVpeGEvdTQybWROQWVjbFV2SldvQTFQUnFrUlNU?=
 =?utf-8?B?MmptYU9QNDBtOThBZ3o0M0hKVnZTVFhpNTRucmZkZWxQd3hZanFzUE5udWd0?=
 =?utf-8?B?bXVHbUNqZ3lKcTZ2R2JBZXpFV3l3NmkrTTh4Sk5HbU9iRitVY0NsWGhMTTc4?=
 =?utf-8?B?ZlJrQlJFMkZPZEFyTjNNR0tzUTYzbmxRbUpsNzNuZThDMU5mR3FwcExoYS9K?=
 =?utf-8?B?RisxU3U0a05wRGp6MW8wT3lReEdNeGoyQXMrNE5OREZZNVYrRkxicFlhMHpY?=
 =?utf-8?B?akp4bE1ZaW5rRExZZDlkbFcvQWRtSG5JRmFzOS8zZlVJOTg5ZnFlVjk5WUZN?=
 =?utf-8?B?eUNwNU91UThvZnZmZlBNa3FxU2RrVG9oN3ZTYTJSdTgrcE8xNUR1UzBRK09Y?=
 =?utf-8?B?NkFEdHdKKzdUYVBmL2sxUUZjWDRhKzRjdEFSdUdRYXFMTkE3ZmNneXBTeVcx?=
 =?utf-8?B?ZjRrQjhlajN0eEZUaUE5YmQ5SHpWNi83TUh5b3ZXRm9rY0xNYlFEazZHeDh0?=
 =?utf-8?B?SFVGbElTRCtlSExtcVlXUzNpdkIwbFR2c0pBckdISzljbTdUWjg3RjlYVVp0?=
 =?utf-8?B?MVpDbzBWSCtwWDdnL2xPdThnOGt3Z1BSV1J1eG5WM2JkMnNqVTYreHhPeExq?=
 =?utf-8?B?dFZrU1JHMGVKaUpYMExibGVqMXExcUNWbTdmUTBLeWpzeDB3bEEzWWljbGpU?=
 =?utf-8?B?QXZNNUNXRGE5aHk3ZDdNcTZUUm0wQncvY1Rld01xaVBLbnlNbm95NFlaSlA1?=
 =?utf-8?B?ZUJadURpcG52ZDJWblliSVRiSU56aHllMnVpbENvK3RxNXR3Zkx0WDlaS3FE?=
 =?utf-8?B?VVBDMVh3UVJUYlpUcGdoTjVtVnpNM0NiUDMxUVRUMGx1Umh5aU5xS0xwNnpT?=
 =?utf-8?B?ditNVG1GajRvV0d2NWs2NUZmZFpGNWVvODEwVWs4czBuT25iY2tZZmc1R3hw?=
 =?utf-8?B?RWZ6ZUdCdi9wNDE5a0FOT3FWYlVLWmFQdHA3NTc5WHBkSjlPbFNiaTVDeDhx?=
 =?utf-8?B?elV1S1lIQS9nKzZoQ2xDdE0rVVhLU2h5VkpjbEh3aHJFeFU1TFlkNzBoa1g4?=
 =?utf-8?B?a1hXcXZGWFpDZEFsTWhjVG5sLzVZazkxMjFINy9tSkVnWS9EZy83S1plK1l2?=
 =?utf-8?B?QnlLdUxpcUJ6bk9LSlg0RlZOSnoxMVBGVWs1ejBLSDU4WVR6K1NtTjE4NW4y?=
 =?utf-8?B?SlAzNnFlM0EwY0hZKzZVZFJSZFZNWFJpcEIvdXdFckJHN2JsZlY3bkJTSStj?=
 =?utf-8?B?TEdvNGFUUFRveURWVFNKazNoSEZHaUl2b1VSVENabStvcURqZVFOZG04VEtX?=
 =?utf-8?B?VHp1NWZlTVdRSm84SzFRc25qR3RlOWN1MGtmQU8wZk56Yy9sSTFqZnJHSDQr?=
 =?utf-8?B?MVNCemN0RDFrL3g3Sjg5UllYQ2FXdmkybzE1c09HQjBzcUJWb1NWalkyM0JF?=
 =?utf-8?B?SXdJRTlJWU9qRXZwRTY0cWt2aldkVVNUZnlyTUFpOEVaWTVkVjQ0ZFVmVFJY?=
 =?utf-8?B?d253dTdmdGdjWU9Rc004b09aa1VkU1VoT1pPZzZTMlY1ekhWdHJyaFBLYlJS?=
 =?utf-8?B?eUdCL2p4cThBMGlYaERwYlBiaEtBSUJUakpMMEVKU1JzN2dnU0E5aTJFemU1?=
 =?utf-8?B?TC9xQjNKUFdiWVFwdnowWFM0WDJNSEdBT3c4RjhlR3pHSDhYWGUvWmRPUmxk?=
 =?utf-8?Q?liO4KMVSfs5f53mwiw1ahWIC0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12661bfd-f688-4a75-6b70-08dc5e18985e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 13:24:50.9536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvKYEnhmfAlOYUq/ZWjPR3S33iRLrTTxMRclQ+Kgz1mZd/f/3+IzmfjWQrngxv1K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8499
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

Am 16.04.24 um 15:08 schrieb Thomas Hellström:
> Hi, Christian,
>
> On Tue, 2024-04-16 at 13:55 +0200, Christian König wrote:
>> While patches 1-4 look good from a high level I still think it needs
>> some prerequisite and re-ordering.
>>
>> First of all make all the cleanups separate patches. In other words
>> that
>> ttm_resource_manager_next() takes only the cursor as argument, adding
>> ttm_resource_cursor_fini()/ttm_resource_cursor_fini_locked() as one
>> patch and then ttm_lru_bulk_move_init()/ttm_lru_bulk_move_fini() as
>> second.
> Yes, I can take a look at that. I think the shortening of the argument
> list of ttm_resource_manager_next() makes sense as a separate cleanup.
>
> The other two are needed because of the changes introduced in the
> respective patches. I could of course add stubs of these functions
> before the patch that currently introduce them if needed, but don't
> really see the point. What do you think.

Na, stubs doesn't make sense.

I was under the expression that you would have something to do for them 
even without the LRU patch. If that's not the case then just skip that.

>
>> With that done I think we should first switch over TTM and all
>> drivers
>> using it to drm_exec as part of it's context object.
> So are you ok with adding an optional drm_exec pointer in the
> ttm_operation_ctx for this? (That was my plan moving forward).

Yeah, perfectly valid. My thinking was just to do that first.

>
> However, when that has been added, I think it makes sense to leave to
> the driver author to port their validation loops and bo allocation over
> to using drm_exec. While we made sure the drm_exec object was indeed
> passed to the validation helper in the drm_gpuvm code, I'm not sure
> everybody actually includes their validation and bo allocation (for
> example page-table-bos) in their drm_exec while_not_all_locked() loop,
> and I think it's reasonable to require the "port the driver over" to be
> an optional but strongly recommended driver effort. If the driver sets
> ctx->drm_exec to NULL, it will fallback to current behaviour.

For the intermediate case I think it makes sense to have this optional, 
but in the long run we should make it mandatory.

>
>> Then I would switch over to using LRU hitches for both swapping and
>> eviction.
>>
>> And when that's finally done we can take a look into the partial
>> shmem
>> swapping :)
>>
>> And Felix is really (and mean *really*) looking forward to the
>> partial
>> shmem swapping as well.
> While the LRU walker helper introduced in patch 8 has drm_exec support,
> shrinkers don't require it, since they are always trylocking. (However
> being able to "evict" system to swap directly in the validation stage
> using drm_exec locking is probably something we should support).
>
> That's why I opted for implementing shrinking before exhaustive
> eviction. But if you insist we can do it the other way around. Most of
> what's needed is already in the patches.

I don't care about the order in which things are implemented, but I 
think we should have at least some eviction prototype as well for testing.

Eviction is just the much easier to exercise use case.

Regards,
Christian.

>
> /Thomas
>
>
>> Regards,
>> Christian.
>>
>> Am 16.04.24 um 12:07 schrieb Thomas Hellström:
>>> This series implements TTM shrinker / eviction helpers and an xe bo
>>> shrinker. It builds on two previous series, *and obsoletes these*.
>>> First
>>>
>>> https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg484425.html
>>>
>>> for patch 1-4, which IMO still could be reviewed and pushed as a
>>> separate series.
>>>
>>> Second the previous TTM shrinker series
>>>
>>> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/
>>>
>>> Where the comment about layering
>>> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
>>>
>>> now addressed, and this version also implements shmem objects for
>>> backup
>>> rather than direct swap-cache insertions, which was used in the
>>> previuos
>>> series. It turns out that with per-page backup / shrinking, shmem
>>> objects
>>> appears to work just as well as direct swap-cache insertions with
>>> the
>>> added benefit that was introduced in the previous TTM shrinker
>>> series to
>>> avoid running out of swap entries isn't really needed.
>>>
>>> In any case, patch 1-4 are better described in their separate
>>> series.
>>> (RFC is removed for those).
>>>
>>> Patch 5 could in theory be skipped but introduces a possibility to
>>> easily
>>> add or test multiple backup backends, like the direct swap-cache
>>> insertion or even files into fast dedicated nvme storage for for
>>> example.
>>>
>>> Patch 6 introduces helpers in the ttm_pool code for page-by-page
>>> shrinking
>>> and recovery. It avoids having to temporarily allocate a huge
>>> amount of
>>> memory to be able to shrink a buffer object. It also introduces the
>>> possibility to immediately write-back pages if needed, since that
>>> tends
>>> to be a bit delayed when left to kswapd.
>>>
>>> Patch 7 Adds a simple error injection to the above code to help
>>> increase
>>> test coverage.
>>>
>>> Patch 8 introduces a LRU walk helper for eviction and shrinking.
>>> It's
>>> currently xe-only but not xe-specific and can easily be moved to
>>> TTM when
>>> used by more than one driver or when eviction is implemented using
>>> it.
>>>
>>> Patch 9 introduces a helper callback for shrinking (Also ready to
>>> be
>>> moved to TTM) and an xe-specific shrinker implementation. It also
>>> adds a kunit test to test the shrinker functionality by trying to
>>> allocate twice the available amount of RAM as buffer objects. If
>>> there
>>> is no swap-space available, the buffer objects are marked
>>> purgeable.
>>>
>>> v2:
>>> - Squash obsolete revision history in the patch commit messages.
>>> - Fix a couple of review comments by Christian
>>> - Don't store the mem_type in the TTM managers but in the
>>>     resource cursor.
>>> - Rename introduced TTM *back_up* function names to *backup*
>>> - Add ttm pool recovery fault injection.
>>> - Shrinker xe kunit test
>>> - Various bugfixes
>>>
>>> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: <dri-devel@lists.freedesktop.org>
>>>
>>> Thomas Hellström (8):
>>>     drm/ttm: Allow TTM LRU list nodes of different types
>>>     drm/ttm: Use LRU hitches
>>>     drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk
>>> sublist
>>>       moves
>>>     drm/ttm: Allow continued swapout after -ENOSPC falure
>>>     drm/ttm: Add a virtual base class for graphics memory backup
>>>     drm/ttm/pool: Provide a helper to shrink pages.
>>>     drm/xe, drm/ttm: Provide a generic LRU walker helper
>>>     drm/xe: Add a shrinker for xe bos
>>>
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |   4 +
>>>    drivers/gpu/drm/ttm/Makefile           |   2 +-
>>>    drivers/gpu/drm/ttm/ttm_backup_shmem.c | 137 +++++++++
>>>    drivers/gpu/drm/ttm/ttm_bo.c           |   1 +
>>>    drivers/gpu/drm/ttm/ttm_device.c       |  33 ++-
>>>    drivers/gpu/drm/ttm/ttm_pool.c         | 391
>>> ++++++++++++++++++++++++-
>>>    drivers/gpu/drm/ttm/ttm_resource.c     | 231 ++++++++++++---
>>>    drivers/gpu/drm/ttm/ttm_tt.c           |  34 +++
>>>    drivers/gpu/drm/xe/Makefile            |   2 +
>>>    drivers/gpu/drm/xe/xe_bo.c             | 123 ++++++--
>>>    drivers/gpu/drm/xe/xe_bo.h             |   3 +
>>>    drivers/gpu/drm/xe/xe_device.c         |   8 +
>>>    drivers/gpu/drm/xe/xe_device_types.h   |   2 +
>>>    drivers/gpu/drm/xe/xe_shrinker.c       | 237 +++++++++++++++
>>>    drivers/gpu/drm/xe/xe_shrinker.h       |  18 ++
>>>    drivers/gpu/drm/xe/xe_ttm_helpers.c    | 224 ++++++++++++++
>>>    drivers/gpu/drm/xe/xe_ttm_helpers.h    |  63 ++++
>>>    drivers/gpu/drm/xe/xe_vm.c             |   4 +
>>>    include/drm/ttm/ttm_backup.h           | 136 +++++++++
>>>    include/drm/ttm/ttm_device.h           |   2 +
>>>    include/drm/ttm/ttm_pool.h             |   4 +
>>>    include/drm/ttm/ttm_resource.h         |  96 +++++-
>>>    include/drm/ttm/ttm_tt.h               |  19 ++
>>>    23 files changed, 1683 insertions(+), 91 deletions(-)
>>>    create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
>>>    create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
>>>    create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
>>>    create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.c
>>>    create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.h
>>>    create mode 100644 include/drm/ttm/ttm_backup.h
>>>

