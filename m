Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B3E4E650C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 15:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E045C10E8B5;
	Thu, 24 Mar 2022 14:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2072.outbound.protection.outlook.com [40.107.100.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A7B10E8B5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 14:25:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kr+ESF0qaW6A1wuRjDpT43HZM3Nq5b4fiXJRvGJUCCsLmOMW0ZLyGa13tWXndS66c5yXuY3V55xN60CBlJGb3/PC/v69Ka607dbV1lBozWLr4QvKxC+O+tIetQsbxHsyo6kOSsTa2FpQrj38nXo5YS5jqkjdn8yCadOMgVin8KQpenO+UOJgV4HJgrxB0NkDoFUYxaTLGlz9NyBSe2VgOfj82yWECieFCx+kF2P+PmqSQEqf7tHMeOt60Nf2jyN9ecTCnMXv5sGDYGdDafRcxNg1JRSncFLwwuyIavrrDGSt18PX1DHNVjmYb6o3zehk+/IiPzBYBT6kfV8Dk4Sh5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEwgnLy2kIf5lKBN88enMXBtlXgHfyQn0NxFWva4qtI=;
 b=IDuMr6VjUvkmdjk6T3nKjkRizXyiRLcpsuu3g3Uf6sa3qBaO1YrPOkpzDU88gIhvFsfEzJJaFxj6UhMAvKN01l3M3l0ZpSBs7oNz7ZRdSDJVan46ag5yf63I+DYOlVXYqKkcPY+OptcWa1mXYUNE+IRrKYeAPKgm1UT5mifmLxzLLfYZSSlsQFkmcuBzl50QwXbXEk8QyvnFkbfzbd06hJP7Kc+eJ85ad0pJc59bPUbv66yuP+vPPAaMW39X6b0MnweFQlWrdFwLY9c1Vds9cvWggSBr+jt+vVNmtKJk+FjBbuRE7UiykXHqbGr5jw7QHibH/Yj84vRYOeUFcoWYNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEwgnLy2kIf5lKBN88enMXBtlXgHfyQn0NxFWva4qtI=;
 b=uK1JK06DiqzMeYvgAkO71gRDRsqMzicQWHs0OKvBY4mJjHTT8MP2NnL+bibPyEyc6Xdx7WzY1wkubynIn4pHstFNV/Oz59XaeruGnHYtK9H2oXfm/sVqzCmTLZYkFeVNtPoiIPTl02tjgBW8qtdTG+oBFc113D0J8oeh3SF0V5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1458.namprd12.prod.outlook.com (2603:10b6:405:d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Thu, 24 Mar
 2022 14:25:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.017; Thu, 24 Mar 2022
 14:25:15 +0000
Message-ID: <8b211aca-87ea-faee-c1c8-ab832929fdcf@amd.com>
Date: Thu, 24 Mar 2022 15:25:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] drm/ttm: move the LRU into resource handling v4
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220321132601.2161-1-christian.koenig@amd.com>
 <Yjr31qQyWxaEbkmZ@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Yjr31qQyWxaEbkmZ@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0091.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::32) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 211ce601-6b86-485b-a3d0-08da0da21d0a
X-MS-TrafficTypeDiagnostic: BN6PR12MB1458:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1458C7F6D22A5EF86159275B83199@BN6PR12MB1458.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tb+ZZxrrGA4QC9TnqpJDsSro6SsOjnEAawmKepYQDyzlSsUtnCOjVuU7rj0BaP7qxvmCEUh6Zm/Cxwet6QS5b1m+GSkKgdB0nUc5smtTO7ebMUqKL1RqkNiDHM8yPutb3X5DS2EmZ6GPGz5jCZRstEU1vo3ic9Z1SkrAGZgjKu2rmxtqz2smm8iBVWOgn7ASqri8wNu24hwtUIf7ufw31m90kBuum/MdagiNwCaZkhw+USHUhcqHCQswQglyMSvteUvuX6ChkfzunjnpKtvuAE0NE8XgW40STag2ecEBMBM/M+aSC1ID6wLxu8gLwkHTbS89/gI+SbZJSKLFOOoAeG2h4CqNUxz4mC3rG6HRSMFaXjKsNfrtHITWA+VMI0Sc34TDkaOGVPA7Mea3ryO889PtGoge9HOcvppasrj7WRRN0Po5Y74JdfV2wa6mphAt45MV4vEhDgGkCN1Rwn3+6PhHTL1glSGT1aSfefIvh1MvIC3vKy6W+HIZ4WRhPBxvEKMxZtb/l+WReuKE/Q8fo+emeieXnCYGGDPle+KSq4DiK6l8hHHa32YLV4LJvpZfhmTqTMxYVr3XN3QEbzl23jmgIg1Ms7v64nZ7Hp11YJZxebpxyLwENA5hvCeLuERSLMnwhGuCnhjtqALSQAEqvx+7ydsDdVAY2kQH66bmQJYwu+Fa7T1ImNgRcfAlrXqPHL/j8WbQ6rHSwfLJJLHyGdQGtVtAd/9Wk1b2z7iOoZG4xprnl1OG7DNb8rMry/wrM0B3nOTp3MJIZfGFurBEc87MTdse6lD792EpwK+Se1OFQEg3qb9EYUroj5dGgvq5E17FIGVS6qA989YmCnpHUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(66476007)(8676002)(66946007)(26005)(4326008)(66556008)(8936002)(6512007)(45080400002)(316002)(110136005)(508600001)(31696002)(86362001)(966005)(6666004)(2616005)(38100700002)(83380400001)(2906002)(6506007)(31686004)(36756003)(66574015)(5660300002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmNXck5scVVFdzE0V1Z6OThuanA3TmpWVGJEL1VyckZidGZraWZtZVJnbHIr?=
 =?utf-8?B?QnVJemdCb2hpV2tuYnBuYVprVlpkVWJJL1d3bUt5MU44YVFuSXZhdmY1dklk?=
 =?utf-8?B?NVJMdzJ4L0RTeE5hejhKQ2EyZm90M09QOXVIU2xlTXo4NUpBZFl6Z2YyR01T?=
 =?utf-8?B?RWVTSllMS085UGdJYm9pYmdWQWMxZG0wTjNnaFE4bURSM0NMSGxIWlBHUm81?=
 =?utf-8?B?MkJpL2ZTQWhpWituV3gwcXJ2VC9qY3lhS2ttMVU0ZHJwSlF0VFhRK011UEgx?=
 =?utf-8?B?NjV5bkFydVF6SzRqREtUWVNydXJGdTVRYUJMclFXMjZTSVY0VTZROWd5aTJI?=
 =?utf-8?B?YUVHa2wveVRzcEZEN2pmb01md2lTNnVCeTNraHZrSWIzWWlGTDVoaWJmMFJF?=
 =?utf-8?B?a2t5ZFlJWXh0RGd5ZHNIY3RSLzRFb2ZydXBzS2tOMHQ1OVYvQXBPdFhDaXBK?=
 =?utf-8?B?aFljaTF4aGNUQk5RYWNuOTlHUTFGTmlNVVRsc1ZOQlZBRUxDVG5HaHd4aE1H?=
 =?utf-8?B?aXNJRXVaOU83QVF0NHZoaUdKL2RMa3pTMXh5dnJFK2tsKzlPTk5BeFI5cHhS?=
 =?utf-8?B?dVh2RVJRUHRaWm9CL3ZTelFCMlIrdEg3Y0xTUDM1QzdLeGhxQ2w2WW5lTVhF?=
 =?utf-8?B?SmY5aDBJTVhHQjV6b2JCaExqMEMxVnptU3U3Vnp3Mjd4R0FqSTVpMjMrYmE1?=
 =?utf-8?B?VDJ1THFvYkxML2dZaDFPc3VZVzM3eGQ2d1FwUHhZZTJDQ1VqR0UzTTVYV0hS?=
 =?utf-8?B?dmpUcTBTbzRibWFwZkN4azFkOWl4S3pCd3dJY0VycmlGNm9RNzREemdCd3Yx?=
 =?utf-8?B?TlBDVFpLWVREaGVNaHZQenc5YytacEVyRkZXc3QvUmREb3lhQURERmFGempI?=
 =?utf-8?B?M0JERk5TUjl2UEdNTHgyRk1Ja2MwR3VYZ0hId25kbHV0UjZsZU05MjFyVWFZ?=
 =?utf-8?B?MEt4cFFoQmF4alYwWDZuQ1EvaWtNdlNWU2k3Q2oxcit3aElYeS9DNklxVWFa?=
 =?utf-8?B?VHZnUjdISGZPRHFtRkdzSFRLODMyWE13cmlkdjI2VVJpQjhzT3ZKNmpvekRv?=
 =?utf-8?B?ekdBR0p4elZpZDN6UlRCUTJaS3RHcXRrLzFQdjByQ2ltMFZGeFVQL1hZOXVV?=
 =?utf-8?B?QjYzVTdhT0U4ZjduMWtiUjZXMExIbEtLUXdaYVo2SlRHMTNUTHIvRnNQbFhk?=
 =?utf-8?B?Q0VhbEsxbVZCbjBZcEtNWEF6RkMrOHpyWGFwUXI3TUZEK0RjUE9xdkg0R1FX?=
 =?utf-8?B?WHRxeDdVL3d0ZEVaR2pvR0plbTFFSFlOY2ZZZVhHVXpNVTh4d0FkOFJXRUZY?=
 =?utf-8?B?cVF4V3VMNUJSZHpJUE16NnFYL1IzcU1GM2ZUdnMyN283S0RyOGpZL3pBa3FN?=
 =?utf-8?B?SDlkUTJaS1NkeG5NQjNIbnNlMTYyZzNEMU91VGQ0YTl1ZnRHUkxjRWV3MGti?=
 =?utf-8?B?akNEZGhOZ3JEbzZzK0dsRVVDTVJTSlNRUXV5OHAwQ1k4a1NYODRjYVNTMGJu?=
 =?utf-8?B?czZiaGhpU2N6ZUtVMWM2Y3p6SXlML1pTUWo4OXNER1BnUll3ZU1ZVUFHYW4y?=
 =?utf-8?B?MmJTMWJOMXUxY3hENXdLQ2luU3Fvb05xMTg5eEtJRzBZMkM0cTI1Z2VJSFN3?=
 =?utf-8?B?Zm5ZUHRPNFNVMnJOV1VPUE85VVZtNFVzdHBUUmlPMWJZTlNaL2k1KzkvdGhX?=
 =?utf-8?B?dGdGV3VVUHpYTCt2WnNHSW9IWHpOWjRWdzlnYW5Ua09makdEMkdpOWdEcHNl?=
 =?utf-8?B?c3p4S256ZEFNc1ZaOXlRUEZITUV1bUphekRRcnNHZnRlNVZnNFhiUllkWE9V?=
 =?utf-8?B?VExRMFIxZzVsbzlmWFJxNEVrUUZ1dXdpM3ZJMnlLL1J2SmtOM1gzU0lFWU1E?=
 =?utf-8?B?Q1Z1NzFqV3J4UVQwNjJuL3lhTWw1Z3pEMldsOGNjckQ5Qk9rdnhSZjVDMDNl?=
 =?utf-8?B?Z2tIalFMRnZOZTJ0R1FVMVMzSGlGYVNDeXFJbzFRS1ZKaHNTVzMwNElERXFX?=
 =?utf-8?B?VmYvNitTWWN0K0dEWlR0b3hVdEIrZWV2UGhCOXVIejBRbnZWMU9iUXRtcWtw?=
 =?utf-8?B?VGxtWklhd1N3Y3dpWEx1RGgvamJFK2dsQXFiUTB1NnN5aVhMWWpmdFQybEhl?=
 =?utf-8?B?UVhINGxSRHdidUYxMXpGRWVlYkROK2p1VFdlTHN5T2ZVU01kL2RzekMwSERr?=
 =?utf-8?B?YTdqU0RGTHQ3cGdCVE56Tnp0RllUUVlMTGJyYUtNbWV1a0wrSVNsVmN0VVU1?=
 =?utf-8?B?SmJ0b1JJUlowQ2lSMWEwSjBFVzJxN3BNb21WM0JZSlAwejU3bDVVaVVzN1M0?=
 =?utf-8?B?K3dRZWM3WmFDUEQ0ZWxuNG56YXRSRHAzOGxmZDBIVzRUV3ZnczdIdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211ce601-6b86-485b-a3d0-08da0da21d0a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 14:25:15.1633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPK0cnL/w2g6Q3RH0G5PBNs73159f4sJVWXDv2sFPBoAZfBcs6V85D+cT3sJliXt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1458
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
Cc: felix.kuehling@amd.com, matthew.william.auld@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.03.22 um 11:35 schrieb Daniel Vetter:
> On Mon, Mar 21, 2022 at 02:25:56PM +0100, Christian König wrote:
>> [SNIP]
>>   EXPORT_SYMBOL(ttm_resource_init);
>> @@ -66,15 +172,21 @@ EXPORT_SYMBOL(ttm_resource_init);
>>    * @res: the resource to clean up
>>    *
>>    * Should be used by resource manager backends to clean up the TTM resource
>> - * objects before freeing the underlying structure. Counterpart of
>> - * &ttm_resource_init
>> + * objects before freeing the underlying structure. Makes sure the resource is
>> + * removed from the LRU before destruction.
>> + * Counterpart of &ttm_resource_init.
> ttm_resource_init() or the link wont work correctly. There's a few more
> like this. From earlier patches, but please fix.

Hui what? I've just tried it and the current documentation works fine, 
but when I add the () it doesn't work any more.

> Also in my earlier review I had a bunch more kerneldoc comments that
> arean't addressed here yet:
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2FYfAqtI95aewAb10L%40phenom.ffwll.local%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C43a4517eb6bc4ccda10708da0cb8cbd6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637836285385616052%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=%2BqlN6044DRHaXsYub9pCEVKUu5a0Nfod06lOp%2BaXNP0%3D&amp;reserved=0

What comment exactly do you mean? I thought I've addressed everything 
except for the lockdep checks.

Thanks,
Christian.

>
> With that addressed Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> still holds.
> -Daniel
>
>
>>    */
>>   void ttm_resource_fini(struct ttm_resource_manager *man,
>>   		       struct ttm_resource *res)
>>   {
>> -	spin_lock(&man->bdev->lru_lock);
>> -	man->usage -= res->bo->base.size;
>> -	spin_unlock(&man->bdev->lru_lock);
>> +	struct ttm_device *bdev = man->bdev;
>> +
>> +	spin_lock(&bdev->lru_lock);
>> +	list_del_init(&res->lru);
>> +	if (res->bo && bdev->funcs->del_from_lru_notify)
>> +		bdev->funcs->del_from_lru_notify(res->bo);
>> +	man->usage -= res->num_pages << PAGE_SHIFT;
>> +	spin_unlock(&bdev->lru_lock);
>>   }
>>   EXPORT_SYMBOL(ttm_resource_fini);
>>   
>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>> index c17b2df9178b..3da77fc54552 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -55,8 +55,6 @@ struct ttm_placement;
>>   
>>   struct ttm_place;
>>   
>> -struct ttm_lru_bulk_move;
>> -
>>   /**
>>    * enum ttm_bo_type
>>    *
>> @@ -94,7 +92,6 @@ struct ttm_tt;
>>    * @ttm: TTM structure holding system pages.
>>    * @evicted: Whether the object was evicted without user-space knowing.
>>    * @deleted: True if the object is only a zombie and already deleted.
>> - * @lru: List head for the lru list.
>>    * @ddestroy: List head for the delayed destroy list.
>>    * @swap: List head for swap LRU list.
>>    * @moving: Fence set when BO is moving
>> @@ -143,7 +140,6 @@ struct ttm_buffer_object {
>>   	 * Members protected by the bdev::lru_lock.
>>   	 */
>>   
>> -	struct list_head lru;
>>   	struct list_head ddestroy;
>>   
>>   	/**
>> @@ -295,7 +291,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
>>    * ttm_bo_move_to_lru_tail
>>    *
>>    * @bo: The buffer object.
>> - * @mem: Resource object.
>>    * @bulk: optional bulk move structure to remember BO positions
>>    *
>>    * Move this BO to the tail of all lru lists used to lookup and reserve an
>> @@ -303,19 +298,8 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
>>    * held, and is used to make a BO less likely to be considered for eviction.
>>    */
>>   void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
>> -			     struct ttm_resource *mem,
>>   			     struct ttm_lru_bulk_move *bulk);
>>   
>> -/**
>> - * ttm_bo_bulk_move_lru_tail
>> - *
>> - * @bulk: bulk move structure
>> - *
>> - * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
>> - * BO order never changes. Should be called with ttm_global::lru_lock held.
>> - */
>> -void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk);
>> -
>>   /**
>>    * ttm_bo_lock_delayed_workqueue
>>    *
>> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
>> index 5f087575194b..6c7352e13708 100644
>> --- a/include/drm/ttm/ttm_bo_driver.h
>> +++ b/include/drm/ttm/ttm_bo_driver.h
>> @@ -45,33 +45,6 @@
>>   #include "ttm_tt.h"
>>   #include "ttm_pool.h"
>>   
>> -/**
>> - * struct ttm_lru_bulk_move_pos
>> - *
>> - * @first: first BO in the bulk move range
>> - * @last: last BO in the bulk move range
>> - *
>> - * Positions for a lru bulk move.
>> - */
>> -struct ttm_lru_bulk_move_pos {
>> -	struct ttm_buffer_object *first;
>> -	struct ttm_buffer_object *last;
>> -};
>> -
>> -/**
>> - * struct ttm_lru_bulk_move
>> - *
>> - * @tt: first/last lru entry for BOs in the TT domain
>> - * @vram: first/last lru entry for BOs in the VRAM domain
>> - * @swap: first/last lru entry for BOs on the swap list
>> - *
>> - * Helper structure for bulk moves on the LRU list.
>> - */
>> -struct ttm_lru_bulk_move {
>> -	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
>> -	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
>> -};
>> -
>>   /*
>>    * ttm_bo.c
>>    */
>> @@ -182,7 +155,7 @@ static inline void
>>   ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
>>   {
>>   	spin_lock(&bo->bdev->lru_lock);
>> -	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
>> +	ttm_bo_move_to_lru_tail(bo, NULL);
>>   	spin_unlock(&bo->bdev->lru_lock);
>>   }
>>   
>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
>> index 323c14a30c6b..181e82e3d806 100644
>> --- a/include/drm/ttm/ttm_resource.h
>> +++ b/include/drm/ttm/ttm_resource.h
>> @@ -26,10 +26,12 @@
>>   #define _TTM_RESOURCE_H_
>>   
>>   #include <linux/types.h>
>> +#include <linux/list.h>
>>   #include <linux/mutex.h>
>>   #include <linux/atomic.h>
>>   #include <linux/dma-buf-map.h>
>>   #include <linux/dma-fence.h>
>> +
>>   #include <drm/drm_print.h>
>>   #include <drm/ttm/ttm_caching.h>
>>   #include <drm/ttm/ttm_kmap_iter.h>
>> @@ -179,6 +181,33 @@ struct ttm_resource {
>>   	uint32_t placement;
>>   	struct ttm_bus_placement bus;
>>   	struct ttm_buffer_object *bo;
>> +	struct list_head lru;
>> +};
>> +
>> +/**
>> + * struct ttm_lru_bulk_move_pos
>> + *
>> + * @first: first res in the bulk move range
>> + * @last: last res in the bulk move range
>> + *
>> + * Positions for a lru bulk move.
>> + */
>> +struct ttm_lru_bulk_move_pos {
>> +	struct ttm_resource *first;
>> +	struct ttm_resource *last;
>> +};
>> +
>> +/**
>> + * struct ttm_lru_bulk_move
>> + *
>> + * @tt: first/last lru entry for resources in the TT domain
>> + * @vram: first/last lru entry for resources in the VRAM domain
>> + *
>> + * Helper structure for bulk moves on the LRU list.
>> + */
>> +struct ttm_lru_bulk_move {
>> +	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
>> +	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
>>   };
>>   
>>   /**
>> @@ -267,6 +296,12 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>>   	man->move = NULL;
>>   }
>>   
>> +void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
>> +void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
>> +
>> +void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
>> +				   struct ttm_lru_bulk_move *bulk);
>> +
>>   void ttm_resource_init(struct ttm_buffer_object *bo,
>>                          const struct ttm_place *place,
>>                          struct ttm_resource *res);
>> -- 
>> 2.25.1
>>

