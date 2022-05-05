Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE151C680
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 19:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC1510F073;
	Thu,  5 May 2022 17:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716D610F073
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 17:46:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcLgZbtqzcr3t22xQfTHT70ntLoxh9beqHpFfl/S4/okmFor21aUOCS5J7stYipWr3zTmUUxshBQDEoyoULrqraCKbFQaLEJwaTHFzv4swVqfxIEfOzBtyioAjHpNB8rnEKWAovyo9tCi68rJVJD5MahU24piAkc0uJZJLPTF37XlaAPsarYrRQ6OVQB5STGi4SHIoXOXXhI4WoCkVrGWdWxdrThYgKKH4NnE00An6sKnJ+BmlwL9NICYQDQXkRWVd+FZYfIbqCFHp5A6hlvnhoVqfv9bLSz5Ox0R2dfQzaRphRBIIYO3nLU9C9y7Nlj35q4Zoi4EPBA43BoGJ+Gxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bb8R8rcHoJ4WypX3wtRzfHknvnEBB1bjpOxZeLPtOUY=;
 b=Q8Loe9ASGXImPLSVY8m+0Id2nnsA4TgWx4Fl09UKQd3RZcQv1ZvNz9bprOwmikOGUbX0Yn7+SUUn4+ad9rQtIJMUrhfBz/Po/YzBJO2zK+0fK1bovWeQTEsaHHodng/uTHvE9817eJs9sNb9w7BrzZ2Rci0x/2LgnxIBvv/NfFm4RREnMRmNbxW0HUmv/6MlrLnKB8Qg68Nv7mr8ksv8ZWAgpuJe9sR73DJCKCuOoPGUt74zma8Qv5ugSdNgt+DBzmChdbzDwlVC8ONd+LEe9pSQ5UjSwcc+pfiYHUPuv64iQYGFBMaBEQvGKeB+0OT+PmWyaBNWZ5sczeJl+DDsbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bb8R8rcHoJ4WypX3wtRzfHknvnEBB1bjpOxZeLPtOUY=;
 b=wywHAdGaNQrngIk8smbFIqygRC/T2vVI/utcY0o3a9djkVqyYdyLZdEMRmrUAVIOQjTsHLF0PwkaEBbVZVZeZ+3vFNJVPS9XtvOXz7wvhl42o/xGY0JfTa8iyiSVNo9+JBiFS/hGNLESU8qtQC68yf8jybSU11umx63LrF2dvKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1152.namprd12.prod.outlook.com (2603:10b6:300:7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Thu, 5 May
 2022 17:46:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 17:46:21 +0000
Message-ID: <70344113-6dd7-3d56-9a87-26d91f2f766e@amd.com>
Date: Thu, 5 May 2022 19:46:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] dma-buf: cleanup dma_fence_unwrap selftest
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220504122256.1654-1-christian.koenig@amd.com>
 <YnPRL7ndeh9z01mW@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YnPRL7ndeh9z01mW@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0051.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2877db00-3af9-49e8-b797-08da2ebf2a33
X-MS-TrafficTypeDiagnostic: MWHPR12MB1152:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1152A565C3DD99A599E9B5DB83C29@MWHPR12MB1152.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oq08dL5rWgHiB5EOLjVy/a3l2tcImjWtxsQUOeCtqmVQSDy2XesXo+O+brXqll5C7E3LKv56tRMGKmph2Q1mPreHa3mKBwqFmFtnN+yLBtp8u+K2xUrnU7h/jE5AlqwTvq1/7IRBldEu5wCu8l9rfbyswwDwtVP9HajYSk67Is0RBl/dSYjOhekENksMi2cNqOow9hGzeu95ecdih0w6buhZGIRvT2QKoG14LGkkry7bpklKJMO8cdW2y8SQwwC75gZSSfdnnvu3xAOWJxK7vKg4nEq6lYs86DtU617g/nveoupq0ODRuCzU3gE07QxFjXw+ZK6Ewb1WiAXvJ13ibwb96hZugpZTddanntloBDmfYC63N2LgIBpIehI96EfRfAuvvsWdniLABsHQQNVtH8w81xu9A4+ZwOyzuPnrItzsyoP4LEzS5X5LAw53+Cx4zYBrIHqh6LqYzbfuFID8BRlDhXeQjaL0N/GoIQacWq3HwaBifbH2vB+B9hP8sQ1zvTjXE1mKLtFOkSbSGH9OkCuJesZumserxWGVUQO71gDvoF7pxLN/A+19rhEzON/qf3NjUt0PMGhduYD5WSdACJ/8oGFKvf1Bx55prxrSixGggmyMHX0ehnXL//BeYKEyjunTr3P54qGGIuv7oUQw1xdbg/E0K5Wt+dxkLgM37fOHEm+1kZJ76jyy/EUpLlnzW/HRSckwZLpfkWgOlqFrvgWTzq51SLx6kcFySCOSsZbIWznQP22jXpRnpNRk+INr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(38100700002)(110136005)(6486002)(6506007)(66556008)(8676002)(66946007)(8936002)(316002)(508600001)(4326008)(2616005)(5660300002)(86362001)(31696002)(6666004)(66574015)(186003)(36756003)(31686004)(2906002)(83380400001)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWl0b2swd2hxU2dkY3JRMDFobDZSM3NOQkZ6NVJWZmJLd0YyZEJVUUhEVlE4?=
 =?utf-8?B?MU9YaE1TZTZQQ1ZsTmltbW44L3hlMUtKNFA0RWQ2ZnJ5Q1F2ODVIT3RmOS82?=
 =?utf-8?B?MTBqNVBscU12Ym1vOVdzTmxTUjJ5TUlVUUYyWHBNYVV5eTl5Tzk2YmdRM1F4?=
 =?utf-8?B?T2hkc1NUcjlqVzZudWw2SWp1THpwajJlRXNRYjhtYWFicEFlNGpRR20wTGJC?=
 =?utf-8?B?V0RodlpieGJRWGlxSkhxcnh4VmlNaXRYcDRqUzlTSGQ1R2J5TnoxRHpwM2F0?=
 =?utf-8?B?dk4xN1ZMNzluY1c5VHRYKzFuMWgzVkFxZDRLbHkrT1I3QTZqUDI2amI5UFc0?=
 =?utf-8?B?Y21zTG1OUHpVWmRvbUxrRGVwbFo3Ym1rYngzeWh2TnNqMnZPL29mS2JvOXFJ?=
 =?utf-8?B?QStKZ09NWVkvS2pPQXhEb1dTL1hoVjJoUzVEYU0rdzNXQlZ0MTJkbkgyN2dT?=
 =?utf-8?B?QkpRTm1IZS95VTgwdWpLZDIvSzg1VnRyWVVDb3N2cFNpMGc2YjJ4WWFIQmFY?=
 =?utf-8?B?S2RBK1VucFhhMWFPMHFtUDUrcWx5ajROcVpTeUNYQzl4K0gxMHVVbDNVTnc3?=
 =?utf-8?B?ZnhVQW5kbTNLMjhleXpHMzNTMUw0YjJqbVI5UWlUTmpWcFd3UHNSN2pLbk9k?=
 =?utf-8?B?bmVyc1d2ZGc2aURmc0pTeUtQRHRlUTJjSGkzelVWelo1U1E4b3pPbWdHZk9E?=
 =?utf-8?B?cU9vSW1mTTRQZ24xa1N1aTlPUDlIdk56d0VOWFNwaXVaSWZleDVCcUNvMUFD?=
 =?utf-8?B?Y3diQkRhNEpNVVRaYzR4OGFWRnBCcnc3eWRjcW1pOXJyK2hVRWNJSk00VlBZ?=
 =?utf-8?B?RW9yRzgxNGprdW1JNlRZZ2J2TXFEMDJpQ2x6clRxZTRrMTVHa2E3RXVoTU9M?=
 =?utf-8?B?Q1ovWHloK2JZVmxodHNTdWVaODFsOE9ndVlQcU55RTlzYTZFYTVVRWFiTHkx?=
 =?utf-8?B?WlhTVE5qcDdJaGJFdnp3THR2OXhlam9pRnVOekNzdDJJMjAxZzkvcmcvRWRJ?=
 =?utf-8?B?YWhkbDlHR1hXZ0dIMENpTjIxcjdFY0NYa2ttVitGaFN1R3BlcWwreXJ6N1E5?=
 =?utf-8?B?cHVKaTAwN0MwUjBHQTRIclQ1SG9mOHJDWjRRQUl2TUM2Rm1iaVgwODFUVFNp?=
 =?utf-8?B?MmNjRHUvYjhrRmxHeE00aUlkcHk1MDIvV0JRQjNUWUtZcWpBOVlReHRXQWVh?=
 =?utf-8?B?b0NUYWxkUlhHZExhMUpCNFA4R1ZuTTh4WEc3QVlSMjFSSWJmd3VUTWNqSUxv?=
 =?utf-8?B?RnhsRWVTWUJ5eWtnWFZVWk9BWkZjRGR4OWdFRGNxUHBLWDZEbmNOWDQ5VVpk?=
 =?utf-8?B?RzYzd0xCdUI2VVV0K2dicHRCMDArQm1Wc1FuVGNYUEgyUm9lMUprTk1Wb1pC?=
 =?utf-8?B?ZTMzWE41ZnZhZnloUER4K0NIOUNXRWZrSnN4QUpBVWpCV01xVEU4ejVBV2hK?=
 =?utf-8?B?cmZ2emVlMTR2TWpkVXdtb3MzR3A2TzQxMlE2TFYrdVAvYjRlaGR4TjVZRVJ1?=
 =?utf-8?B?SVNTYjJnd2F4Q3FLYUVFRUlkRUJHK1c1eVBvSFIyQlBnYUtTSWgxMm9CY2ly?=
 =?utf-8?B?L2UzSXluK0xvMjFKdU1yNWt0L0svZ1FEeURxcVNmWm5zUWhrL0t6cmRNbEl2?=
 =?utf-8?B?d0ZSZXp3SWdpVyswVUM5RENNMzViVHlPRWsrRmhYaktoREpNR0J1Ty9wcEs2?=
 =?utf-8?B?Q283YUFOZUJXbXFmVEkvMHZwaVRWL1R4TVhhazBWREdEZ2lFMTB2TVZzOGZZ?=
 =?utf-8?B?WGNIdUZIMk5mdHF5Wm9LTk8veVFZYVFSczFaMGpTZys5M045MEVwenc0OWw2?=
 =?utf-8?B?bnBwS2IyVjRWcDRXcFdVY3NhckpSQ2ROanJwbWRMYVNHR2IxVU01bTJQTUxn?=
 =?utf-8?B?c04zSUVSd3Fvc0tHNG1pT2s4OFNYaWlHbXQyUmtnd3E3cW5GcDVvV2daVURY?=
 =?utf-8?B?ckxaZXJ3dEVoQkVzS1RnRi9hazdWYTRlbzRIczllZ0tBRTVLUlM1K24xbWZp?=
 =?utf-8?B?a0hEWEtFbUxUd2Jhejk2OS93QW1BOERUNVpEOXhkbENsOEFmaFZRTjNFVUk5?=
 =?utf-8?B?cEcwUUJKVTlGNDVualZxV1d1K2g3c2NTZHBJd0VSQ2cwajZwS2lVK0ptc1hr?=
 =?utf-8?B?dGZkNGo0SnVyUVlMSkR4bDd2VmNrcGdnRlY2eGRRYXAwNGdVMjZQZlpnQUNy?=
 =?utf-8?B?VGQxVmVSVUw3OHZLRTgvd2lUWmJUM2FLZXJjVnNCZWFTTmZBWWdlZmhQZHZ3?=
 =?utf-8?B?NHZqdWIrZHNTVTJXa2Vmc1BIZnB0dVBjb2VqQThKUjA5WTVGM2M1S1lPc0t4?=
 =?utf-8?B?QU5oV21MQzZ0Tjl5VUdXNDBML0JzSXhoWWRTUFo1bWszOTlHeDdOTnd1T3p0?=
 =?utf-8?Q?qNPfwM2zFn2ZIZAB4TbzjqaQIpzPYj2xpzkRfiRYDECs0?=
X-MS-Exchange-AntiSpam-MessageData-1: DZ8TiKFad3hVQQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2877db00-3af9-49e8-b797-08da2ebf2a33
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:46:21.6290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2bMTgRhIWIoYhwYLq/b/o9ipRXu+vjlWDSugvzMENyZWQ8ZOHbTu1grE7vpq7Sp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1152
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.05.22 um 15:29 schrieb Daniel Vetter:
> On Wed, May 04, 2022 at 02:22:52PM +0200, Christian König wrote:
>> The selftests, fix the error handling, remove unused functions and stop
>> leaking memory in failed tests.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/st-dma-fence-unwrap.c | 40 +++++++++++----------------
>>   1 file changed, 16 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
>> index 039f016b57be..59628add93f5 100644
>> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
>> @@ -4,27 +4,19 @@
>>    * Copyright (C) 2022 Advanced Micro Devices, Inc.
>>    */
>>   
>> +#include <linux/dma-fence.h>
>> +#include <linux/dma-fence-array.h>
>> +#include <linux/dma-fence-chain.h>
>>   #include <linux/dma-fence-unwrap.h>
>> -#if 0
>> -#include <linux/kernel.h>
>> -#include <linux/kthread.h>
>> -#include <linux/mm.h>
>> -#include <linux/sched/signal.h>
>> -#include <linux/slab.h>
>> -#include <linux/spinlock.h>
>> -#include <linux/random.h>
>> -#endif
>>   
>>   #include "selftest.h"
>>   
>>   #define CHAIN_SZ (4 << 10)
>>   
>> -static inline struct mock_fence {
>> +struct mock_fence {
>>   	struct dma_fence base;
>>   	spinlock_t lock;
>> -} *to_mock_fence(struct dma_fence *f) {
>> -	return container_of(f, struct mock_fence, base);
>> -}
>> +};
>>   
>>   static const char *mock_name(struct dma_fence *f)
>>   {
>> @@ -45,7 +37,8 @@ static struct dma_fence *mock_fence(void)
>>   		return NULL;
>>   
>>   	spin_lock_init(&f->lock);
>> -	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
>> +	dma_fence_init(&f->base, &mock_ops, &f->lock,
>> +		       dma_fence_context_alloc(1), 1);
>>   
>>   	return &f->base;
>>   }
>> @@ -113,7 +106,6 @@ static int sanitycheck(void *arg)
>>   	if (!chain)
>>   		return -ENOMEM;
>>   
>> -	dma_fence_signal(f);
>>   	dma_fence_put(chain);
>>   	return err;
>>   }
>> @@ -154,10 +146,10 @@ static int unwrap_array(void *arg)
>>   		err = -EINVAL;
>>   	}
>>   
>> -	dma_fence_signal(f1);
>> -	dma_fence_signal(f2);
>> +	dma_fence_put(f1);
>> +	dma_fence_put(f2);
> I'm completely lost on why you add these _put() calls?

Because my five year old had a nightmare and I had not enough caffeine 
in my blood stream on the next morning.

Fixed in the next round.

Thanks,
Christian.

>   The reference we
> create all get transferred over to the container object, and that takes
> care of releasing them.
>
> The other bits with error handling and code cleanup all look good, and
> dropping dma_fence_signal calls also makes sense. But this one I don't
> get.
> -Daniel
>
>>   	dma_fence_put(array);
>> -	return 0;
>> +	return err;
>>   }
>>   
>>   static int unwrap_chain(void *arg)
>> @@ -196,10 +188,10 @@ static int unwrap_chain(void *arg)
>>   		err = -EINVAL;
>>   	}
>>   
>> -	dma_fence_signal(f1);
>> -	dma_fence_signal(f2);
>> +	dma_fence_put(f1);
>> +	dma_fence_put(f2);
>>   	dma_fence_put(chain);
>> -	return 0;
>> +	return err;
>>   }
>>   
>>   static int unwrap_chain_array(void *arg)
>> @@ -242,10 +234,10 @@ static int unwrap_chain_array(void *arg)
>>   		err = -EINVAL;
>>   	}
>>   
>> -	dma_fence_signal(f1);
>> -	dma_fence_signal(f2);
>> +	dma_fence_put(f1);
>> +	dma_fence_put(f2);
>>   	dma_fence_put(chain);
>> -	return 0;
>> +	return err;
>>   }
>>   
>>   int dma_fence_unwrap(void)
>> -- 
>> 2.25.1
>>

