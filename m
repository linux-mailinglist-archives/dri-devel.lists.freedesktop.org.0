Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA6A519B63
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFB010FE0B;
	Wed,  4 May 2022 09:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2081.outbound.protection.outlook.com [40.107.100.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D1710FE09
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 09:15:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeGepD3ddE4EPfsVyG9lot3tUwwAIEGua5Png2t9H8r4tfcfSmKcsf53BU7kHMwMoNjY0qO5wziZVnANPp2hmtTSTBiyejC4cbql2wcCjWPuN+G/K+usx5GHebO9eCmyq2eCBTOiJrat8nZtqPWgZuC7gkiVdVDakKjXbq8+/bJl7eaCuJ4fhsU4iWm4uh8AMNHiC4sDQbULxAJ6C83Up++6Gi8sGSkPCP1gTNsUEt0iGAvyhmzPBktKpYKsDCE0vusGV6I3gIPTlvWCO6VnkthCWTJ3FmeJbAJFoDtsPJwm7uUzglUmKdxU5C1o4sutiYbxxHjqs4BsQEEIC8DvCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87Ot/B6uHukEPfxUCty/O3JxLFrWMROa5DQQLu7rhpU=;
 b=eTIxqN2YJEtxXk4m9uq4OAPIdEjfs6iOmrLeJLcsKP1xW8+VboIQ7tzFxqDW4zPSuDEvDdT47RDq1jMt8f5PH2CpGWXrs0iE8RM00GNgMB5qYzfsThG21HDiXE+HmlHPr/OfWioWQb3M9TPNypJ+/1WAlIoBs2moep/PQcH8Szb3QWGIfyt9QF2RAInPc/bWDuIso4dWI0P5hfUhtShTDQI496mDrs94ORxrhWqXD33hr5pt+T4Ew0RcIWO9oOAWiVgtb7ovjGrysoc6kQB1w1jxjpe8T8fijVf8oDOGBLQNl91NF1J4AY3DaC8WKykxuFXOQgtgQnQn1ogkpca7ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87Ot/B6uHukEPfxUCty/O3JxLFrWMROa5DQQLu7rhpU=;
 b=tlXKNIpzuFzEE82xuCbNPrmB+Ff5z4KLBqY71BOVB6RNKXJFxKs+VGMn7Jtvots3aUl+tw8fBmmYKAdm6WVqVsPCCrfM9a4CckWmmLwaLiB5UI7h1p4ffp+ojok9cq6Sk1XV1rWk3WgN5MdLQfdxRrdV77MA3UBhAVb0PcXAeRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3202.namprd12.prod.outlook.com (2603:10b6:408:9c::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Wed, 4 May
 2022 09:15:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 09:15:18 +0000
Message-ID: <7b1c76b4-3074-24c1-5a76-46780f5056fd@amd.com>
Date: Wed, 4 May 2022 11:15:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 02/15] dma-buf: introduce user fence support
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
 skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, tzimmermann@suse.de, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20220502163722.3957-1-christian.koenig@amd.com>
 <20220502163722.3957-3-christian.koenig@amd.com>
 <c3e168cb-fbd5-07b7-f927-ac9e5e73b1e8@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <c3e168cb-fbd5-07b7-f927-ac9e5e73b1e8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0069.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::46) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5f38a0c-9692-45a3-2dd2-08da2dae9b2b
X-MS-TrafficTypeDiagnostic: BN8PR12MB3202:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB320220E8F587BB1A3B81BB6183C39@BN8PR12MB3202.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LW43OKcO2EzMJHJN6/2KIYwWKOUitDXBEXjEJNpOTl9k67nur4tba7VDcIbGrOQZAbFdQh3t4Y+WwLNbL1MIRU4yU+NM5knsBtbIgvSql5DezBU4NbUEmW5qD6pQ6t+OVxVIMuWNTBun4nvr6hxpNujZ3jXXAjQzWnPA4j5R2z4X0PGM4z1x8EAiXhT5MGEBPbGs1nYkz6slXZrwo4kT8Pe2fGkDarUYtF3TccHVLE4q4xMKY7BH8BF9KSY2wEde4wZRqyWm0wfS1Dt/lSGlXiuT/dRFotuJmumdB81sO1NzLRnQYG0RFfvV6wZq1rJYzKVJaYm88q7BUC0Q+St8f9gN4P1I/c3yoDHSR+2RO0wMESlfWmaDR54dkEgW3FAhGxqmLs2KpyD9fy1vpcPHvs+LBBRS/yraNX+R7gauEcrmoiimC5/3hVYkCtcHgowRsd3pgCUr3SsfVxH8iTMhZSdzSH8f8AhcGp8HOZtvmL9oZtQOMLKtgyR7nrIMZithhTXVU6w20rFSPpkTI83CBF1oYWrTATgigVBXFrg6y/uF2pbpuzLdjeqJfOxC9wpS3xY1q8W0q/3+poL/ib9oK6LK3PQ0K4q5bJ+bVkViTH4Ze/7KF3n3qpWBng1fXFYEuQngJDJRJzg6JeJPG1it/mFSwvIJA3NWaAuo29nRywW0Ta42Y8mrpNoXGfGf4yy8mCqKfWxaQ2N9Mqr/VMuW6M/2gn5AxdgfTt6RSEQODvcVNx+2EWWgS4Kv2Syau0mm6Hfky9CVSexkas8saI0FlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(6506007)(7416002)(53546011)(316002)(8936002)(6512007)(83380400001)(31686004)(5660300002)(2616005)(2906002)(36756003)(66556008)(86362001)(8676002)(66574015)(66476007)(31696002)(186003)(38100700002)(921005)(110136005)(66946007)(26005)(508600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW1JUUdWdkJlS3p1OWJPa0xwblJCczdDVUt6TnRWMmcrbG0xUFpIT1hQODdv?=
 =?utf-8?B?Ulg3aWwyYmRsNm1NbXJkS3N0bEgya1VJdW14ZTg4L0lNanpwSUdXR3Roa3V6?=
 =?utf-8?B?dTFvR2R6VnJpTEpTVDQ3VnhKdDlTZVJ3WUVwVVZQQXI1VHIyZk93WlBBRHh0?=
 =?utf-8?B?UlBFYzl1bzdjSzBaczNvaGVyQ1ptQXk4aldzQ09paitURjhnb01MelpjbDJW?=
 =?utf-8?B?QzFlU2x0N3pwRkljUm1BQnlnMTNzWW9pSVV0SGxxUTRKUTdnbFNQVEt1cTQ1?=
 =?utf-8?B?NmpQSEgxWS9nZzBsNVIyZUcxbGx4czVHNlBFM2Uva3QzZHlXYmp4NHoybnhG?=
 =?utf-8?B?Z1VJUlVKZ0loMUEweCsrZzNrR2t3VUZZSkNRTU5qYkpaSTNWc1RxTnA4aHdK?=
 =?utf-8?B?SGJ4QnRnNFJsNzIxREMwV3pIb3lDVVc1djJjdVFoWkF2ODVxeHg5QUtOd2N5?=
 =?utf-8?B?VklKajdNRWYzKzlNSlFRSE5hSkZMcnVtd0ViOERBU2pISDhFNDY0Wk9zWHE5?=
 =?utf-8?B?akNoNnlic0lZVUluZGNhbXhPSERpQ1NXeVpZZDNHZzZWVEYvSFp6cWsxeENo?=
 =?utf-8?B?em10bjR0Tk9sOHU1ZFNZb21Pc2VnaHdvU3RNUzdlS2hYYWdUSzNJVmpUbks0?=
 =?utf-8?B?UHFrMzN3NzYyN2YzcGJ1UFZzaFhWb1dvaTJadVU0TkpCMDZicitIWDNZclFa?=
 =?utf-8?B?R1NCTUdIYmM0TmJlenBpTFJnUUVzVm1zU244OHJRVEpqUzRFZm9IUkxGWmYz?=
 =?utf-8?B?b2o1OXk5anhiQjlaWkRBcEdjSllCQUhzc1VOcXJ3cWQzTklQeVYrMDNTR3Jm?=
 =?utf-8?B?SWRDb25ibkZXTXF4V2tqVE5wVVlkaWtWVjBWbUVjcGRwN1NxSnhiNWE0WGx2?=
 =?utf-8?B?R1FOK2FoU0lRTkE1SlI0TVpRU0Q4Z3BabHVzQVVQMFRub2ZqWUVQek4zZ2c2?=
 =?utf-8?B?bTNmUnpkSi9oWnFMblZBbW9tL0lBVm5mRlFFbEZpSTRhQlE0aVhrVTJkcVVC?=
 =?utf-8?B?WEhDTVlQS0FmVkxNcWViQzZzVUFiQTltU1lTOEJRcS91Y3p5dUlYbmlSUjlZ?=
 =?utf-8?B?RkVLWG9IZ3gyTTJIbjh6YzVsdUQ1R0RoV3BlVVJHS2VwNS9YM2hyVlNMQlhX?=
 =?utf-8?B?a3FaM1RrMlA0TDJXWDFiSmJBSlFtMHNkd1hUTk9KNHdCWW56WGwzTkRvZWd5?=
 =?utf-8?B?VnVEempUdU5sYkJBZ3E1U3B5SDFSY3hPTkl4VDllNnp0dnJmRGFqTlU5S1hm?=
 =?utf-8?B?bU5sODAzME11akRjYklGeGZRTHR3c2dsTWV6bnhCYnVxZUM2enlwakFUMk4w?=
 =?utf-8?B?QVJhOWhyaVdvWUV3SlM3bEpwTU5VUW5WV2haUm5obWtJNUorbjZFZ2RqcXVL?=
 =?utf-8?B?ZE9naHZyZ2cvUFd1NXRDQVZDbXRJVkZpVkdLY25uTlprYkRoZTFDN0xWR1pi?=
 =?utf-8?B?anJPcFVPeXVGby95T0x1OGkxVVZwR2RBRUFrZ0hHNkJacldEWXFmNEUzWTVi?=
 =?utf-8?B?MTJpS3lONzlpNFhicWtob0xHdFNIWm5JK2tJRk1vM1ZLdkNzVzJESVV0bWVq?=
 =?utf-8?B?THZGa0xDWkFvQXhqUTdWaThhZ3BHbUJucVFzNlFQWENNWHM2UnpIbmNBSFFo?=
 =?utf-8?B?K0xsRHpLQmxSTCtpRVR1TjVFS1N3bkNzQm5HQnExVDlZUjg2S2xrdXkyTDRo?=
 =?utf-8?B?RWEySkdONEFUd29LSjR4MFVrVklRcnVOVFNnT2pYamdLNmpDOUJRTmhmd1Za?=
 =?utf-8?B?d0lJNVo3akhhRVFhUlI3eHJrdDVhU1FudVVzaDJtYTVrMTBtQWpBVlAvTDdV?=
 =?utf-8?B?TFRHNmlOTDZBVHVhMjhwYXA4L05TS1dScG5YOG1BbXAydHBmWDVFVG5QTitn?=
 =?utf-8?B?dEUvcHY1bThITGIrT1NrYnFHUU5xcmRhN3lhSzMvWmx4UFVEV1BGbkpNclZN?=
 =?utf-8?B?VE1ZSk80NVl4NWNvUk5HV3Y4MDZCc2VEK1JJcG1ITURIM2NxTzdMeHNjNXdL?=
 =?utf-8?B?ejlOQjhiOS9zemRqMVBIVXJhWitaS3h2eUt1bE9mN2ZWbWZCeTNxV2JVUUQ5?=
 =?utf-8?B?NHJqbWZ6RnJjZnozQzVXT1QxSzdpZ2o4bDNnNW1MSWJaS1pTZEVFREx5ckZt?=
 =?utf-8?B?Rlp3TFY4dDFYOWw2eElEanZlYnBscXE0d3hZRnpEVDN5bkw0eHBHVUJPYlQz?=
 =?utf-8?B?YjMwNGY1R3B1UFNIczJ5a2tLeUNGRlhnZGwzNGswdXk0Nm1rWEFuY2c4eVVy?=
 =?utf-8?B?emNISFA5VnRlblA4N1JDa1VCUmkvTktPbTEzVWR4WFR5S3JINVdkL0s5eWNv?=
 =?utf-8?B?NGVuaFNPUnlLTzhRV0FCYXdrTHNIcGpVdzQ4USsvYXBvNkdZZnJOdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f38a0c-9692-45a3-2dd2-08da2dae9b2b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 09:15:17.9860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AIdCFqPHvYl8B7loVHQu5FVhsOyJF6VCqZvb9Pdn5Hshxa/wAoKwQL6m+b1/AKJK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3202
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



Am 04.05.22 um 09:53 schrieb Tvrtko Ursulin:
>
> On 02/05/2022 17:37, Christian König wrote:
>> [SNIP]
>>   @@ -398,6 +408,8 @@ void dma_fence_enable_sw_signaling(struct 
>> dma_fence *fence);
>>   static inline bool
>>   dma_fence_is_signaled_locked(struct dma_fence *fence)
>>   {
>> +    WARN_ON(test_bit(DMA_FENCE_FLAG_USER, &fence->flags));
>> +
>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>           return true;
>>   @@ -428,6 +440,9 @@ dma_fence_is_signaled_locked(struct dma_fence 
>> *fence)
>>   static inline bool
>>   dma_fence_is_signaled(struct dma_fence *fence)
>>   {
>> +    if (test_bit(DMA_FENCE_FLAG_USER, &fence->flags))
>> +        might_fault();
>
> Why this one can fault and the dma_fence_signal_locked cannot? I mean 
> obviosuly it must not in the locked section, but how do signalling 
> callbacks know the context of the caller?

Well, dma_fence_is_signaled_locked() shouldn't exists in the first place.

The locking can only be done by either the framework itself or the 
driver exporting the fence. And if you take at the actual users than you 
indeed see that the only two cases where this is used the driver knows 
what fence it has and should probably call it's internal function itself.

>
> This maybe ties back to the issue I don't think I ever found an 
> explanation to - why "is signal" helpers actually need (or want?) to 
> do the signalling itself, and are therefore hit also with the 
> signalling annotations?

Yeah, exactly that's what I could never figure out as well. And I think 
that it isn't good design to do this, because it results in the 
dma_fence being signaled from different sources.

Without it it would just be consistently signaled from the interrupt (or 
whatever context) the exporter uses to signal it.

Thanks,
Christian.

>
> Regards,
>
> Tvrtko
>
>> +
>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>           return true;
>>   @@ -583,7 +598,7 @@ static inline signed long dma_fence_wait(struct 
>> dma_fence *fence, bool intr)
>>       return ret < 0 ? ret : 0;
>>   }
>>   -struct dma_fence *dma_fence_get_stub(void);
>> +struct dma_fence *dma_fence_get_stub(bool user);
>>   struct dma_fence *dma_fence_allocate_private_stub(void);
>>   u64 dma_fence_context_alloc(unsigned num);

