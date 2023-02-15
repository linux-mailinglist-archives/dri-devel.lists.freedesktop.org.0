Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F79F698355
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 19:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671DE10EB71;
	Wed, 15 Feb 2023 18:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F66410EB28;
 Wed, 15 Feb 2023 18:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLsv6000QyHS0q8cR2m5oZYZKkmuj6TRAb1uPZkZxsST/OUvvsjBu1Ne5TnnjtxOkVNU1lWfawlvAa5rMeL93ZMk44Ub/jgFLsYbFhPmYZCQIJAzKFm18g+xviXkXQOObmkgrrkNChYbIZQW0FWqt3Dyytp9/ZQi3EYIH+os6BD1cXoOPRPCjw6OiNVgC5XRJ6LSdgqkIIgMnYh/xESg/74lpCr36QK4383300wvXcgbGiyX7+U4oyRf+B07Z9jTm66ByOK8V+TWzF8j85S4rEdja4WLY8DSMtb3w/4BlqjyoCVJ64iQ8x9VDxbwiHf6RPuWJw7oPZzTx+SMVIasAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTum6BR+tMOxrqN6ruAvZDQmM/YxuV+/0dPzt5DR/14=;
 b=cC2DnVZJtnnzZtA4hxYTKH/T52hy9amI2th3qm9tuidgTk9jDtP+oUfxjgVvVsq7UpsG+RviF0xsVzP3jSPOPs0go0NPGnwWC08zy7bysUNNC3HpF6o1YsRo5yy2dQ2vHxQMq0p7/fsgdgur2uT+E67lutzr6NfXEcGLi40alVXhP79vxWMIL0gkFdMd0Ocw4C8K3DbOhsjz1A1dsgl5v2ebLpss6XzRnHOPTzvZ+St6r/d4BRgyLTGVgeaw6gaUnLstfGvL4prZmKLyJmdSg/QMVBHhi8cmemedwC/uEA3U0vvhYhgPufCRN9GawLW2ZmcNtszRUeGQSHYNq/fFSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTum6BR+tMOxrqN6ruAvZDQmM/YxuV+/0dPzt5DR/14=;
 b=4eYrR1qWbn6kDyL8qYhpfkYF+e051wRsQgla+2q/XlK2K6CwKciD0Sivu7i0QlXzcZN6TfQ3xTJNDKsyEC4KSBR3QoxrrgEgJ6XGPtbAazzW3IfHkszvYel+35YWC0LaeVaNgO4TTzEoxbDNnjUsIinZHcYOCuJl3SX7sB+RmMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6258.namprd12.prod.outlook.com (2603:10b6:208:3e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 18:32:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 18:32:28 +0000
Message-ID: <893503c1-7328-2ad9-d4ef-871c995be61a@amd.com>
Date: Wed, 15 Feb 2023 19:32:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 04/16] drm/ttm, drm/vmwgfx: Update the TTM swapout
 interface
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
 <20230215161405.187368-5-thomas.hellstrom@linux.intel.com>
 <cd40bc2a-641b-4faf-d153-9f4ab922e5f8@amd.com>
 <41da479cf98041ce5affb90ac5305628169f3e02.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <41da479cf98041ce5affb90ac5305628169f3e02.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 0187665f-cc7c-43ee-f7e9-08db0f82fd84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sN7Ehm18dG4wT4T0542x+994bUJ9X6owdkpoqNWU8DZ7XfmiieiZTjklk7lwVfmytDWP88sKCn+clevah0baogIZittYSojbIeArQ4bWddfrhtD7XkUP3YRXknL4ZdQQ33p7sgnEsUcl2coqfDeADU8dRAZHQOGutLBmgEgzr7mhGij1j6NuX96QB7kCHQgFBm4pNZg4tCRxeNzGjUx08FA75jO/wzE/7XThOPeXoOkB80Q12yBMbIFia7F1KwyrBUKMNErP3oT7wa/jioUDfpe8m8locokLfoPgkGoONcwc1EeKHJOisMwHXArBTarI11aC0omJhQTrhXPhOux3vhSHOc+AC6U446QijrwIwSOi6eTAvk1znJZ+lZzx7E3SE0Bim3RAI3ABOcFqdO2aFMZBVEY0zFAXhdBQtLKgpP4sTdkAGrr9oMzIwTX2sJP+eQUy87k4/dWwRFk+nMQcF9PWvSgkHSa3p1EbyjFmRFnv4m451plzCCtxe0WYlbBUCT4havSusFTL2Nt7yGvhqCnLPm7QT87/YxhnFfqoHtSOmzZXNpgwKdHlWZf4orOGJrLlsVuIdT6aHmJShqkiiMHOsvi7E8Uj5OIorwy/zVhyg3e0Od907MUMCq+H5/0QsTmKQWgm1gjNEK6RsHZdr1PxyaSKrZNGV0gYy5gtUSg3rWtnALR9EX9iMYs9PLlPB1RG6+hQhM9edK6iFw1cCbp20XgA4vKVXEWqLMfF8x8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199018)(31686004)(5660300002)(83380400001)(66574015)(186003)(31696002)(2906002)(36756003)(7416002)(15650500001)(30864003)(6506007)(6512007)(86362001)(478600001)(6666004)(6486002)(2616005)(41300700001)(54906003)(316002)(66556008)(66476007)(8936002)(4326008)(38100700002)(8676002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHlLaStHYmRrTWVmMUVLU0sxRVBVTVhBOWQveG5RTnU0bzcxbldvcWoyTlFD?=
 =?utf-8?B?YTNrSGFQR0svdGlMN05pMUZWM3RJWFVrajFXMldubnNrUTE0MTdSK0RsTDhv?=
 =?utf-8?B?ZG1QYnR3RllmTWZZN0U4YkRUY2dVd2puNkh0dDUrOHBTVFNaZllxLzk3Qklq?=
 =?utf-8?B?REFkNDVlTWJsY3Z2U3A1RlN6eFpuZEVYemZ5ckpZVkdXZU5IMVF0cFI1bS9Z?=
 =?utf-8?B?MmlYRy9oalo0N1RtenBsZkRTOE15cis2djhaQjV3emJhcUFweFUxZUNTcC9C?=
 =?utf-8?B?ODJQOEJ6T2djZlU3U0pjYWRmR2wzQmZ5K0d4L01WSjZDaHo0Z2FheEZVUUVI?=
 =?utf-8?B?Rm54K0V1Ykxmdm92dVlPRThPQ3dzMkh4RW9rQksrakZvdHYxZ3lzaHBHSTBL?=
 =?utf-8?B?QTNSelIxUVd5VGlta1FNakx5dnRYK3lhR2pSQzhTYkJnUkM4bVF1NU9XSkNl?=
 =?utf-8?B?RElYeXZQMWZBWGc2ZlY0SndmSFNUZitSTFpiSFFLMkVON0p6Y0JZZFVYLzd3?=
 =?utf-8?B?RXV5T2ZKRjVQT3VhSTM5WVdLZVFoUE5Gdis3emVsdDh5QjdreXh5bndnTTBi?=
 =?utf-8?B?a1pqWTRvamw4dVVNdFRwT0MzVDZZN1YzbzNQUlVGclZqT1dsSGQzM0J0dkRq?=
 =?utf-8?B?T0twM2s0WFlWSmUrVU5BVzlHdzhIbkNhNFQrdVl0ZFp3SnZ1SkVCRWpXYm9Z?=
 =?utf-8?B?alQwMjZQeGJuMFp6eVhWcVJObXNocEtHT3drY3l4cUFSK2Rrdm1CSzRsajU4?=
 =?utf-8?B?dmdOenlxVUdNcDlhOWtSV0dEajBoWFRmQml6Z1hZUmJJclI2clBIVFBYdmRF?=
 =?utf-8?B?eG9CSzdCYkF6dW05TzY0NExzTTlMZy9wQXlwTmZlMkhqMkRvSjQ3Q0FjSWZh?=
 =?utf-8?B?UjRwOVFINXArRXpOeklEeHNRRU1FTGU1TlM2bE5LeDhiYzl2c2xEK25DR0pa?=
 =?utf-8?B?N2FOVFJzZHk1Qi9PVThjQWdKeXZ6bmRvQ0piS2dxaGtGeWszZVdVZEpLUXkv?=
 =?utf-8?B?cFpmVWI0c2xDcUc2RGFaam9tRE9NRzR5aDBkN2lILzMwVGlLMmw4eVpBcGlG?=
 =?utf-8?B?SkZHUjVhNFNNS2dXd3pGK3hpaVEzYVp6OC9weGU3eXgzdExoRVBKdGpCaW5Q?=
 =?utf-8?B?Q2hRM3QvbkJGOTlKYXZvd29pQnZxSllYV2ZGZ0lPS0dLaHNvQTBJaTlxK2JR?=
 =?utf-8?B?Vk5ZNFR1UHBtTEdlVTFOamMyNXc1cjZNdlpLNDRXMGI3dFpocnlzdnJic3dR?=
 =?utf-8?B?VjJiZUJlWmk2ZkhwU1ZIZ21LeW1manBtZFZ5V0wrWWhxdFU5cUdnN2JEanJa?=
 =?utf-8?B?UmNEZ0k2SU9yS2xtc3VyNnUvaDlnR3FhVHBZN0hhYUMwUTQ0a1puVnlmUXU1?=
 =?utf-8?B?SkNkWUNQMWprSmJ4Zlc0bEtYSmkyYTdQd1RaTWw3RjdnMit1L0pFOVM0R295?=
 =?utf-8?B?MDliZDZ2QmN4OENBMjRVK2VpYmRqL3dPNGhOTm93QWp6dld3aHN6cGk0R1ov?=
 =?utf-8?B?bHV3V2ZZalYvWDNhVU9RRFRyeWhnNU11VlZSNDZ4Z1dMY2hiSnJIMFdjSTR3?=
 =?utf-8?B?NEltU2lXZ0pkcVlpcVlnejM5LytWTVBOdm9mTVF1bUNFRkhBYUt2QlJZam9h?=
 =?utf-8?B?ZlZ1QXJpTHJFd1Yxc0FGSFJZcXRFNkNVTG8wUjVNTWhxL1FjSkY2bFVpVjVI?=
 =?utf-8?B?MUtSWFZUSXF1QWt2eFRQbE83MmpjMW80VmxzUnRVZGpFRkN0eC9EbWdITFlH?=
 =?utf-8?B?Z2IycTBvdkRZaWlBRTV5NmdKRmM4Um5Oek9qMDgyazR2Tm5jK3Q1cXUyaG1Q?=
 =?utf-8?B?WCtiVi93aGVRb1l6V0EzSlZTeHpJZS9FMXVhZnA0V3ltZnhTbytMNXFqZ1ZW?=
 =?utf-8?B?SlY3cklyaDNqWExMK0poU05zUW5ycGU5WmVpZWdlVkFHZTh4cW9XYk0rUDNO?=
 =?utf-8?B?N3hwMG1PV0hpVUFQMXh4aTBQRU45U3F6OWVXbjNudW1JUWg2TThaQnRxcFF4?=
 =?utf-8?B?RUJTZUN5ZnFWVGpkV2lrRkxBR3FZL0RFR1pVeTdVUkZVOUdKL0JMWWF0V2pV?=
 =?utf-8?B?dGlKRVI0bmJ4aFlOR2ZKcVp6cjk2Nll2VmZDd0JIcm5uTTRXUE5PYiszVlQ0?=
 =?utf-8?B?M3pBenJzbE43OURFZjNFRnQxQkkwOGNBeTcvcThRMVp6dzhZRzVmOEVhaGRR?=
 =?utf-8?Q?Ed6xetZy6lPEqQeNF73aJ3+/IWP5tHIANUXshjqdTTPx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0187665f-cc7c-43ee-f7e9-08db0f82fd84
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 18:32:27.9853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5TfWAXt/pH9IR3QIi5UPs+trdFhaxfF4IHgGOUusr8LU1Q95WLpLQ8NtizYcGaX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6258
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>,
 NeilBrown <neilb@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, linux-graphics-maintainer@vmware.com,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.02.23 um 19:19 schrieb Thomas Hellström:
> On Wed, 2023-02-15 at 18:39 +0100, Christian König wrote:
>> Am 15.02.23 um 17:13 schrieb Thomas Hellström:
>>> Update the TTM swapout interfaces for better compatibility with a
>>> shrinker.
>>> - Replace number-of-pages int return with a long to better match
>>> the
>>>     kernel's shrinker interface.
>>> - The gfp_flags parameter to ttm_xx_swapout() currently only takes
>>> the
>>>     GFP_KERNEL value and shouldn't really be needed since the
>>> shrinker we
>>>     hook up in upcoming patches sets a allocation context to match
>>> reclaim.
>>> - Introduce a shrink reason enumeration and a driver callback to
>>> shrink
>>>     buffer objects.
>> Is that really necessary? This is mid-layering once more.
>>
>> If drivers want to implement driver specific shrinking they should
>> register their own shrinker callback.
> Yes, a choice needs to be made here. If TTM registers the shrinker, the
> driver needs to be called at least to unbind and to remove dma-
> mappings.
>
> If the driver registers the shrinker it can still (I think) use the
> pool helpers, but needs TTM for LRU traversal and accounting.
>
> I can have a look at the latter if yout think that will be a better
> solution.

Yeah, that's what I had in mind as well. Something like the drivers 
registers the shrinker and TTM provides the function to give a candidate 
for eviction.

Christian.

>
> /Thomas
>
>
>> Christian.
>>
>>
>>>     The TTM_SHRINK_WATERMARK reason is going to still be handled
>>> using the
>>>     existing shmem copy, and will be used by pool types that don't
>>> lend
>>>     themselves well to shinking (dma_alloc pool) and when drivers
>>> explicitly
>>>     requests swapout.
>>>     The TTM_SHRINK_SWAP and TTM_SHRINK_PURGE reasons originate from
>>> a
>>>     shrinker and is to be handled by a new driver callback,
>>> bo_shrink().
>>>     Helpers for the new driver callback are provided in upcoming
>>> patches.
>>>
>>> Cc: linux-graphics-maintainer@vmware.com
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_bo.c        | 38 ++++++++++++++++----
>>>    drivers/gpu/drm/ttm/ttm_device.c    | 55 +++++++++++++++++++++---
>>> -----
>>>    drivers/gpu/drm/ttm/ttm_tt.c        | 23 ++++++------
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |  3 +-
>>>    include/drm/ttm/ttm_bo.h            |  4 +--
>>>    include/drm/ttm/ttm_device.h        | 36 +++++++++++++++++--
>>>    include/drm/ttm/ttm_tt.h            | 17 +++++++--
>>>    7 files changed, 136 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index 882c2fa346f3..e5c0970564c0 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -1114,13 +1114,29 @@ int ttm_bo_wait_ctx(struct
>>> ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
>>>    }
>>>    EXPORT_SYMBOL(ttm_bo_wait_ctx);
>>>    
>>> -int ttm_bo_swapout(struct ttm_buffer_object *bo, struct
>>> ttm_operation_ctx *ctx,
>>> -                  gfp_t gfp_flags)
>>> +/**
>>> + * ttm_bo_swapout() - Swap out or purge a buffer object
>>> + * @bo: The buffer object.
>>> + * @ctx: The ttm operation context.
>>> + * @reason: The swapout reason.
>>> + *
>>> + * Try to swap out or purge the contents of a system memory backed
>>> buffer
>>> + * object. The function needs to be called with the device's LRU
>>> lock held.
>>> + *
>>> + * Return: -EBUSY if the bo lock could not be grabbed or the
>>> object was
>>> + * otherwise busy. Otherwise the number of pages swapped out or
>>> negative
>>> + * error code on error. Iff the function didn't return -EBUSY, the
>>> + * LRU lock was dropped, and LRU traversal needs to restart.
>>> + */
>>> +long ttm_bo_swapout(struct ttm_buffer_object *bo, struct
>>> ttm_operation_ctx *ctx,
>>> +                   enum ttm_shrink_reason reason)
>>>    {
>>>          struct ttm_place place;
>>>          bool locked;
>>>          long ret;
>>>    
>>> +       lockdep_assert_held(&bo->bdev->lru_lock);
>>> +
>>>          /*
>>>           * While the bo may already reside in SYSTEM placement, set
>>>           * SYSTEM as new placement to cover also the move further
>>> below.
>>> @@ -1142,8 +1158,12 @@ int ttm_bo_swapout(struct ttm_buffer_object
>>> *bo, struct ttm_operation_ctx *ctx,
>>>          }
>>>    
>>>          if (bo->deleted) {
>>> +               long num_pages = bo->ttm->num_pages;
>>> +
>>>                  ret = ttm_bo_cleanup_refs(bo, false, false,
>>> locked);
>>>                  ttm_bo_put(bo);
>>> +               if (!ret)
>>> +                       return num_pages;
>>>                  return ret == -EBUSY ? -ENOSPC : ret;
>>>          }
>>>    
>>> @@ -1184,13 +1204,17 @@ int ttm_bo_swapout(struct ttm_buffer_object
>>> *bo, struct ttm_operation_ctx *ctx,
>>>           * Swap out. Buffer will be swapped in again as soon as
>>>           * anyone tries to access a ttm page.
>>>           */
>>> -       if (bo->bdev->funcs->swap_notify)
>>> -               bo->bdev->funcs->swap_notify(bo);
>>> +       if (bo->bdev->funcs->bo_shrink && reason !=
>>> TTM_SHRINK_WATERMARK) {
>>> +               ret = bo->bdev->funcs->bo_shrink(bo, ctx);
>>> +       } else {
>>> +               if (bo->bdev->funcs->swap_notify)
>>> +                       bo->bdev->funcs->swap_notify(bo);
>>> +               ret = ttm_tt_swapout(bo->bdev, bo->ttm);
>>> +               if (!ret)
>>> +                       ret = bo->ttm->num_pages;
>>> +       }
>>>    
>>> -       if (ttm_tt_is_populated(bo->ttm))
>>> -               ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
>>>    out:
>>> -
>>>          /*
>>>           * Unreserve without putting on LRU to avoid swapping out
>>> an
>>>           * already swapped buffer.
>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>> index ae2f19dc9f81..7eadea07027f 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>> @@ -116,19 +116,28 @@ static int ttm_global_init(void)
>>>          return ret;
>>>    }
>>>    
>>> -/*
>>> - * A buffer object shrink method that tries to swap out the first
>>> - * buffer object on the global::swap_lru list.
>>> +/**
>>> + * ttm_global_swapout() - Select and swap out a system-memory-
>>> backed bo.
>>> + * @ctx: The operation context.
>>> + * @reason: The reason for swapout.
>>> + *
>>> + * Select, based on round-robin a TTM device and traverse the LRUs
>>> of
>>> + * that specific device until a suitable bo backed by system
>>> memory is found
>>> + * and swapped-out or purged.
>>> + *
>>> + * Return: Positive value or zero indicating the size in pages of
>>> the
>>> + * bo swapped out. Negative error code on error.
>>>     */
>>> -int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t
>>> gfp_flags)
>>> +long ttm_global_swapout(struct ttm_operation_ctx *ctx,
>>> +                       enum ttm_shrink_reason reason)
>>>    {
>>>          struct ttm_global *glob = &ttm_glob;
>>>          struct ttm_device *bdev;
>>> -       int ret = 0;
>>> +       long ret = 0;
>>>    
>>>          mutex_lock(&ttm_global_mutex);
>>>          list_for_each_entry(bdev, &glob->device_list, device_list)
>>> {
>>> -               ret = ttm_device_swapout(bdev, ctx, gfp_flags);
>>> +               ret = ttm_device_swapout(bdev, ctx, reason);
>>>                  if (ret > 0) {
>>>                          list_move_tail(&bdev->device_list, &glob-
>>>> device_list);
>>>                          break;
>>> @@ -139,14 +148,29 @@ int ttm_global_swapout(struct
>>> ttm_operation_ctx *ctx, gfp_t gfp_flags)
>>>    }
>>>    EXPORT_SYMBOL(ttm_global_swapout);
>>>    
>>> -int ttm_device_swapout(struct ttm_device *bdev, struct
>>> ttm_operation_ctx *ctx,
>>> -                      gfp_t gfp_flags)
>>> +/**
>>> + * ttm_device_swapout() - Select and swap out a system-memory-
>>> backed bo.
>>> + * @bdev: The device whos bos are considered for swapout.
>>> + * @ctx: The operation context.
>>> + * @reason: The reason for swapout.
>>> + *
>>> + * Traverse the LRUs of a specific device until a suitable bo
>>> backed by
>>> + * system memory is found and swapped-out or purged.
>>> + *
>>> + * Return: Positive value or zero indicating the size in pages of
>>> the
>>> + * bo swapped out. Negative error code on error.
>>> + */
>>> +long ttm_device_swapout(struct ttm_device *bdev, struct
>>> ttm_operation_ctx *ctx,
>>> +                       enum ttm_shrink_reason reason)
>>>    {
>>>          struct ttm_resource_cursor cursor;
>>>          struct ttm_resource_manager *man;
>>>          struct ttm_resource *res;
>>>          unsigned i;
>>> -       int ret;
>>> +       long ret;
>>> +
>>> +       if (reason != TTM_SHRINK_WATERMARK && !bdev->funcs-
>>>> bo_shrink)
>>> +               return 0;
>>>    
>>>          spin_lock(&bdev->lru_lock);
>>>          for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>>> @@ -156,16 +180,19 @@ int ttm_device_swapout(struct ttm_device
>>> *bdev, struct ttm_operation_ctx *ctx,
>>>    
>>>                  ttm_resource_manager_for_each_res(man, &cursor,
>>> res) {
>>>                          struct ttm_buffer_object *bo = res->bo;
>>> -                       uint32_t num_pages;
>>> +                       struct ttm_tt *tt;
>>>    
>>>                          if (!bo || bo->resource != res)
>>>                                  continue;
>>>    
>>> -                       num_pages = PFN_UP(bo->base.size);
>>> -                       ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>>> +                       tt = bo->ttm;
>>> +                       if (!tt || (reason == TTM_SHRINK_PURGE &&
>>> +                                   !ttm_tt_purgeable(tt)))
>>> +                               continue;
>>> +                       ret = ttm_bo_swapout(bo, ctx, reason);
>>>                          /* ttm_bo_swapout has dropped the lru_lock
>>> */
>>> -                       if (!ret)
>>> -                               return num_pages;
>>> +                       if (ret >= 0)
>>> +                               return ret;
>>>                          if (ret != -EBUSY)
>>>                                  return ret;
>>>                  }
>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>> index ab725d9d14a6..a68c14de0161 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>> @@ -239,22 +239,21 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>>>    
>>>    /**
>>>     * ttm_tt_swapout - swap out tt object
>>> - *
>>>     * @bdev: TTM device structure.
>>>     * @ttm: The struct ttm_tt.
>>> - * @gfp_flags: Flags to use for memory allocation.
>>>     *
>>> - * Swapout a TT object to a shmem_file, return number of pages
>>> swapped out or
>>> - * negative error code.
>>> + * Swapout a TT object to a shmem_file.
>>> + *
>>> + * Return: number of pages swapped out or negative error code on
>>> error.
>>>     */
>>> -int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>>> -                  gfp_t gfp_flags)
>>> +int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm)
>>>    {
>>>          loff_t size = (loff_t)ttm->num_pages << PAGE_SHIFT;
>>>          struct address_space *swap_space;
>>>          struct file *swap_storage;
>>>          struct page *from_page;
>>>          struct page *to_page;
>>> +       gfp_t gfp_flags;
>>>          int i, ret;
>>>    
>>>          swap_storage = shmem_file_setup("ttm swap", size, 0);
>>> @@ -264,7 +263,7 @@ int ttm_tt_swapout(struct ttm_device *bdev,
>>> struct ttm_tt *ttm,
>>>          }
>>>    
>>>          swap_space = swap_storage->f_mapping;
>>> -       gfp_flags &= mapping_gfp_mask(swap_space);
>>> +       gfp_flags = GFP_KERNEL & mapping_gfp_mask(swap_space);
>>>    
>>>          for (i = 0; i < ttm->num_pages; ++i) {
>>>                  from_page = ttm->pages[i];
>>> @@ -315,12 +314,14 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>          while (atomic_long_read(&ttm_pages_allocated) >
>>> ttm_pages_limit ||
>>>                 atomic_long_read(&ttm_dma32_pages_allocated) >
>>>                 ttm_dma32_pages_limit) {
>>> +               long r = ttm_global_swapout(ctx,
>>> TTM_SHRINK_WATERMARK);
>>>    
>>> -               ret = ttm_global_swapout(ctx, GFP_KERNEL);
>>> -               if (ret == 0)
>>> +               if (!r)
>>>                          break;
>>> -               if (ret < 0)
>>> +               if (r < 0) {
>>> +                       ret = r;
>>>                          goto error;
>>> +               }
>>>          }
>>>    
>>>          if (bdev->funcs->ttm_tt_populate)
>>> @@ -379,7 +380,7 @@ static int ttm_tt_debugfs_shrink_show(struct
>>> seq_file *m, void *data)
>>>    {
>>>          struct ttm_operation_ctx ctx = { false, false };
>>>    
>>> -       seq_printf(m, "%d\n", ttm_global_swapout(&ctx,
>>> GFP_KERNEL));
>>> +       seq_printf(m, "%ld\n", ttm_global_swapout(&ctx,
>>> TTM_SHRINK_SWAP));
>>>          return 0;
>>>    }
>>>    DEFINE_SHOW_ATTRIBUTE(ttm_tt_debugfs_shrink);
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
>>> index 2588615a2a38..292c5199d2cc 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
>>> @@ -1514,7 +1514,8 @@ static int vmw_pm_freeze(struct device *kdev)
>>>          vmw_execbuf_release_pinned_bo(dev_priv);
>>>          vmw_resource_evict_all(dev_priv);
>>>          vmw_release_device_early(dev_priv);
>>> -       while (ttm_device_swapout(&dev_priv->bdev, &ctx,
>>> GFP_KERNEL) > 0);
>>> +       while (ttm_device_swapout(&dev_priv->bdev, &ctx,
>>> TTM_SHRINK_WATERMARK) > 0)
>>> +               ;
>>>          vmw_fifo_resource_dec(dev_priv);
>>>          if (atomic_read(&dev_priv->num_fifo_resources) != 0) {
>>>                  DRM_ERROR("Can't hibernate while 3D resources are
>>> active.\n");
>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>> index 8b113c384236..6b45e0b639e0 100644
>>> --- a/include/drm/ttm/ttm_bo.h
>>> +++ b/include/drm/ttm/ttm_bo.h
>>> @@ -375,8 +375,8 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj
>>> *map);
>>>    int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map
>>> *map);
>>>    void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map
>>> *map);
>>>    int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct
>>> ttm_buffer_object *bo);
>>> -int ttm_bo_swapout(struct ttm_buffer_object *bo, struct
>>> ttm_operation_ctx *ctx,
>>> -                  gfp_t gfp_flags);
>>> +long ttm_bo_swapout(struct ttm_buffer_object *bo, struct
>>> ttm_operation_ctx *ctx,
>>> +                   enum ttm_shrink_reason reason);
>>>    void ttm_bo_pin(struct ttm_buffer_object *bo);
>>>    void ttm_bo_unpin(struct ttm_buffer_object *bo);
>>>    int ttm_mem_evict_first(struct ttm_device *bdev,
>>> diff --git a/include/drm/ttm/ttm_device.h
>>> b/include/drm/ttm/ttm_device.h
>>> index 4f3e81eac6f3..6bd2abf712ab 100644
>>> --- a/include/drm/ttm/ttm_device.h
>>> +++ b/include/drm/ttm/ttm_device.h
>>> @@ -35,6 +35,21 @@ struct ttm_placement;
>>>    struct ttm_buffer_object;
>>>    struct ttm_operation_ctx;
>>>    
>>> +/**
>>> + * enum ttm_shrink_reason - Reason for shrinking system memory
>>> + * @TTM_SHRINK_WATERMARK - A watermark limit was reached. Not from
>>> reclaim.
>>> + * @TTM_SHRINK_PURGE - A request for shrinking only purged
>>> objects.
>>> + * @TTM_SHRINK_SWAP - A request for shrinking any object.
>>> + *
>>> + * This enum is intended for the buffer object- and shrink method
>>> selection
>>> + * algorithms. It's not intended to leak to or be used by TTM
>>> drivers.
>>> + */
>>> +enum ttm_shrink_reason {
>>> +       TTM_SHRINK_WATERMARK,
>>> +       TTM_SHRINK_PURGE,
>>> +       TTM_SHRINK_SWAP,
>>> +};
>>> +
>>>    /**
>>>     * struct ttm_global - Buffer object driver global data.
>>>     */
>>> @@ -207,6 +222,19 @@ struct ttm_device_funcs {
>>>           * adding fences that may force a delayed delete
>>>           */
>>>          void (*release_notify)(struct ttm_buffer_object *bo);
>>> +
>>> +       /**
>>> +        * Shrink the bo's system pages, Either by swapping or by
>>> purging.
>>> +        * @bo: Bo the system pages of which are to be shrunken.
>>> +        * @ctx: Operation ctx. In particular the driver callback
>>> should
>>> +        *       adhere to the no_wait_gpu and interruptible
>>> fields.
>>> +        *
>>> +        * This is also notifying the driver that the bo is about
>>> to be
>>> +        * shrunken and the driver should take care to unbind any
>>> GPU bindings
>>> +        * and to note that the content is purged if @bo->ttm is
>>> purgeable.
>>> +        */
>>> +       long (*bo_shrink)(struct ttm_buffer_object *bo,
>>> +                         struct ttm_operation_ctx *ctx);
>>>    };
>>>    
>>>    /**
>>> @@ -268,9 +296,11 @@ struct ttm_device {
>>>          struct workqueue_struct *wq;
>>>    };
>>>    
>>> -int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t
>>> gfp_flags);
>>> -int ttm_device_swapout(struct ttm_device *bdev, struct
>>> ttm_operation_ctx *ctx,
>>> -                      gfp_t gfp_flags);
>>> +long ttm_global_swapout(struct ttm_operation_ctx *ctx,
>>> +                       enum ttm_shrink_reason reason);
>>> +
>>> +long ttm_device_swapout(struct ttm_device *bdev, struct
>>> ttm_operation_ctx *ctx,
>>> +                       enum ttm_shrink_reason reason);
>>>    
>>>    static inline struct ttm_resource_manager *
>>>    ttm_manager_type(struct ttm_device *bdev, int mem_type)
>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>> index cc54be1912e1..627168eba8f6 100644
>>> --- a/include/drm/ttm/ttm_tt.h
>>> +++ b/include/drm/ttm/ttm_tt.h
>>> @@ -87,6 +87,7 @@ struct ttm_tt {
>>>    #define TTM_TT_FLAG_ZERO_ALLOC                BIT(1)
>>>    #define TTM_TT_FLAG_EXTERNAL          BIT(2)
>>>    #define TTM_TT_FLAG_EXTERNAL_MAPPABLE BIT(3)
>>> +#define TTM_TT_FLAG_DONTNEED           BIT(4)
>>>    
>>>    #define TTM_TT_FLAG_PRIV_POPULATED    BIT(31)
>>>          uint32_t page_flags;
>>> @@ -180,8 +181,8 @@ void ttm_tt_destroy(struct ttm_device *bdev,
>>> struct ttm_tt *ttm);
>>>     * Swap in a previously swap out ttm_tt.
>>>     */
>>>    int ttm_tt_swapin(struct ttm_tt *ttm);
>>> -int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>>> -                  gfp_t gfp_flags);
>>> +
>>> +int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm);
>>>    
>>>    /**
>>>     * ttm_tt_populate - allocate pages for a ttm
>>> @@ -223,6 +224,18 @@ void ttm_tt_mgr_init(unsigned long num_pages,
>>> unsigned long num_dma32_pages);
>>>    struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct
>>> ttm_kmap_iter_tt *iter_tt,
>>>                                              struct ttm_tt *tt);
>>>    
>>> +/**
>>> + * ttm_tt_purgeable() - Whether a struct ttm_tt's contents is
>>> purgeable
>>> + * @tt: The struct ttm_tt to consider.
>>> + *
>>> + * Return: Whether the contents is purgeable in the sence that the
>>> owner
>>> + * doesn't mind losing it as long as it gets notified.
>>> + */
>>> +static inline bool ttm_tt_purgeable(struct ttm_tt *tt)
>>> +{
>>> +       return tt->page_flags & TTM_TT_FLAG_DONTNEED;
>>> +}
>>> +
>>>    #if IS_ENABLED(CONFIG_AGP)
>>>    #include <linux/agp_backend.h>
>>>    

