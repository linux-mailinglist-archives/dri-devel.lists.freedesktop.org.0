Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A627C728FFB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 08:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F9810E19F;
	Fri,  9 Jun 2023 06:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D85710E12F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 06:32:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLh37Efk8E3s3nrqMvz/12QUEpZcx8JbAGVgBGXvXSgCHWlgE088zC6XzNiVAjSBZLiXvkzDVoOlYO7h86me5q7xmYfTtHSrRKY0KKtM5ffsn3IZlYnjc6f+W/faeVaL/e1g5hzMTzIBLKhveXk5uSjwvW/JVbu2fIFttWMwDJWh8Z9sv6Fetxzhmr85De+B/XeAocKymHn9T5IwUO3MtCMuGB5Nm6mLzWy+XkV4HUZqu/++Jso7eHB9LzciSwqn62LZze2a99Z4vzKLqUNcVaAWB2JOSQniNgzgSJ5aY+qvdUWMd044Srqv0U8QWgxaraGmqo6BfhiBgx4gVZv9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eE/J+0YGgT98dQ078DfthB4Wimsi7f4dFLqeXskrvZQ=;
 b=X4DqoHmVFCW6eUGo7wGPJn+cVtzUENZmrZ7a3lpoxSdPMp9+Ync/N3sJO5sRftGlRaozx1upF1WuAGE3tPe/3T+No3JxFVqL9xG821F2VIg4iwRF7oLjD6ePG6BhjaGnE5uQFIzJu+thZyJCy+evCdbIwHvEV7se+8E/1ltnp/b+G0JWVfmRP75PnNMSrWSalhdG7rUdsOXk4A7t5UJ6YoTyseD7H5Ke6viYmiTD/OX8R7OpvgAiZ5SygJoACiKwy4pVwBzAmLLVLdsihk+SQWXIjNQdQlA5O1nIoC3EikCRSJlS+J9ETxfqeNIsS70VBTPd6Afy6MvVAxMlHp37BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eE/J+0YGgT98dQ078DfthB4Wimsi7f4dFLqeXskrvZQ=;
 b=NQZoYICSitbv0rFYyJY0JeBho81HbV6ES3BBrwHANnkmpzL/6E+PR8YbSk3k3WOTUiDZCrwkSDSj33xsneJPSFcsMvEvOXi2Rry/X97K5dHPaRKXszT7jGKQKIH3ooxZPcCv5+Q7PoKLWyv7pz9P1E6FjF9YekvOT7HopFGHz6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by LV3PR12MB9260.namprd12.prod.outlook.com (2603:10b6:408:1b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 06:32:54 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff%4]) with mapi id 15.20.6455.024; Fri, 9 Jun 2023
 06:32:54 +0000
Message-ID: <b8f0ea1e-4ab3-8ff1-5e69-4e723adf8c2a@amd.com>
Date: Fri, 9 Jun 2023 08:32:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dma-fence: Bypass signaling annotation from
 dma_fence_is_signaled
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230608143059.1038115-1-tvrtko.ursulin@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230608143059.1038115-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|LV3PR12MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: 8246f444-8157-4395-e6a7-08db68b35b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XrzDAFKrzLgTJZxsAng+Ekejxb2+jwB+wrbzTDfU/kE2TCOVPtZ0ulg42Ikz59OETMTIaj+KVg3yPZLy7JRUty+XS4G9E0e85HYNtqh5p0MAatBgWMH26rXqLCRAT8/vfCfEOSLxZCUQMR7Y0HtSvIAArRiIY96nelBjLpbOKHqVuSRze93daETkWqL/lOV9SQgLb3AEZXNZZonAiSzwlTA+eOyO3llc4UFLcFZbQmaF6hMnNT5xmnxKuj/m6fx5LTD8vzV9LR9xNIaT3ZnOyFp8Tyh1ip2pdTl94KMjtp1WfeRX6CiW34JjH5YYdT/PXNMNSuA+zjg76psFg3jKi8keiyao1uTb/eixAX+Lw6nmV0gSR6XtL4BdZ2LuxNQmQG3FQDMObt/vhdHQJ0I4bdehcdgciRiUjwmPVYJTsBz9tQleKZTCsVbNoJ4vBlgiVwxaEEVxb+Nt55I5P0eFvURVIlkXiH+hIxnE68cV5aCJJFGRqddR06rWQohRyncHfg/Ps0K7qxnzxelhdOqTae1Q4sC33GrJiEL3C6H5Own5OzL7MELsk3y9f+FiNvgAQRs/cOIKPuXRe832p7UXHUPd+waRW8273WHV84Phs6rzhr2kZOhbPmR9/8ZocD+DazrvdkDoThkpXu9wslZerQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(2616005)(6506007)(186003)(6512007)(31686004)(6486002)(83380400001)(41300700001)(86362001)(66574015)(6666004)(2906002)(8676002)(8936002)(478600001)(36756003)(316002)(5660300002)(38100700002)(31696002)(4326008)(66476007)(66946007)(66556008)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDIyTC92V200N1VweEVCaEhRaGJocDRHQjl4L3MrMnZ2VW0zcHBCYVlMdnpo?=
 =?utf-8?B?VnBGaTRwN0diTWlTQVlFMi9idnJnbkg2dzl2clgyNjM1VVlOK2NFdUZORzd5?=
 =?utf-8?B?RjYrN1loRE1kT0VaK3NuR09WWk5vQkl3S0t5UHo4MjFma3lkMGNFa0FDZUJk?=
 =?utf-8?B?SDR2eThLS0JlSzNOWG9zQTFFZXVoMXU4SXF3bGs3Z0NIK0FLR1ZmVGlDQnAw?=
 =?utf-8?B?YnlXYkRJOFd3a2JCdFF4MTIrLzd5Qmx2QVZRL0ZTandzalF2K05LRllrNTJk?=
 =?utf-8?B?REpyc2Vyb0d6ZnhKWDJmZzdKUW9qZnNMYUMza3B0SXJMVnF0Nk9lWlI2UVVL?=
 =?utf-8?B?akJaeUtaZFZIeE4zNm9BdGhrMXZWVGRZMFlNVlpZeElncldMZFdJRStoNWdK?=
 =?utf-8?B?OGVOREJyTXE1cUdiRlllTVpjalJYTXNPb2tzR1dpNURKSHVNS3J0ZzBKaXll?=
 =?utf-8?B?YlNmQ1gyWnZsckJjbzJNbEo0bEY0eFIxZFZJcW0wZnM4YjYwMVhSWVRQOUxW?=
 =?utf-8?B?WnR5YzdBb0ZFREQvamtiQVNuclBCZlZGbW93eXdTbFZSUnc2cHNoT1lUQTYv?=
 =?utf-8?B?QmE5SUZTN0NPTmJYanZ3MXNHTmxJMW1SbWU2SzA1Wmt4WGtDMkZyeStwMUJJ?=
 =?utf-8?B?eXhnYXBYVXc3VjM2cVc4b0dTa2FvRER3SkZDSG44eGVzcmE5SU1GSUR4Umtj?=
 =?utf-8?B?VGNzSERndWJLNm1FUmtraFJ0Z3V2RTg5SlF2ZkdzU1FiQks2OFloVmU2eTVR?=
 =?utf-8?B?MjdJTGhKbHVCN0R0SldlSlEwV1gvTnc4U2pORW5oOTA5d2xDQnBXSDAxZVVv?=
 =?utf-8?B?QjhtdHpxdVhMNDV2UmpZRHAzbHNJVGlXL3B3eFEwa3dGcjZrUitqQndTSnZq?=
 =?utf-8?B?THZ0eWs4aDEyVEF2SXlGb2hqZjhPUERINU5JQ2JOYmVET29aTnEzeE4remZC?=
 =?utf-8?B?UDZZNlh1VlV5UEdtV1l3YURpa2pGU0J3b0xpZnFPcFUra3hpdXoxMzl2V1lS?=
 =?utf-8?B?c2I2UUVOMVpseWttbHdqWHdnS3JTbDZ6Uk5hbkVIUm1oMTRFUDgzemJ3TWts?=
 =?utf-8?B?UHhBSHRpVG5YRTJJR1BUcHpmcm5hdit5MS9hRVY3MDFreTdtamFwdG1heWt6?=
 =?utf-8?B?S0YybDRqbURydVVacE1sT1ZZZU9heUdwNjl2YnRiV1JDRHhlTDdQOGg2cU1r?=
 =?utf-8?B?eHRLYjJleXNLLzdnalBja3hTLzhsMGJkK3FlQUFid0lhTFVhQlI5cXBWWmli?=
 =?utf-8?B?VzJ1aW1TL21CME5KUzU0ZHdNV0dZVE5MOTRiY3l5TjJBNll1TERWTk9WcTdv?=
 =?utf-8?B?K3BvRWEzM3ROYXFIWWdLU3hkZGlzMEVaYTk0NzdmOGFtMnFva1Q0ajRnRGh6?=
 =?utf-8?B?bHNNNnpIQzdjZ1A3ZTBTVnZrMEFOc2Zlc2trdWZlN1JjTk4vcm00UjVtZUFt?=
 =?utf-8?B?ZGwrcEY5SEI1RENvWnNxakkzMzJuNTNSbW5qbnNuOUNaVnJhTkExaFFDRnEv?=
 =?utf-8?B?Y2xiRGl4c0ZBTUtzWmZOMm5kUE5XT2VxN2czNHRFb1hDUCs4ZDI3ZjBnQStv?=
 =?utf-8?B?VHQzaHBuby8vNFNIaWRNTitkSDMxandicWRxdS9GNTNIVzZMdnVjamlaOTdp?=
 =?utf-8?B?N0NMZWNYQ2xVRktCdm1KeHBJWUxib1pDalBKR0p0djNab0lXcWtEWmJKd2pX?=
 =?utf-8?B?THlVZXpKdGVPMGR0bmV1amRZNllQNGI1UFBFMWtxOGZad0JQV3JtbjJJYjFI?=
 =?utf-8?B?RitZOG1RU2IzYUErREFaM0UzdGh3b2d5dWltbi8zMlVFMmFOU3IwSUFHTXlM?=
 =?utf-8?B?QXVjdi9lUUtld2MxanYwc29Xc3E3cHBUTnhxSjgvWm9NQjJ0a2ZMNVFpNmQw?=
 =?utf-8?B?QXNFQTA5RDdsUEVJOUdZMXBTc0tXa0xiMWo5cGxPWDBVak5UK3MwVjF2MWJ5?=
 =?utf-8?B?OVlXYkEwK0ZXYXQzWWJmVm8wWlpZRnprTkVsNnFPT3pLa3FURkVtbGhTWjJR?=
 =?utf-8?B?bmEzRlo3M0pYN0N4cURwS0Z0L2VyOHJDZjFKNHZBOEI2RHNpT0JxWlEzdWJJ?=
 =?utf-8?B?YjQ1T2xlUnQyOFZ4bTlkUEQzK2xUYzF2K0d5NlJBa25sQlFXdVlqazZKKzRi?=
 =?utf-8?B?VTZDRW5zT0t2TGhBak1aS1VTR0d1blV1V1RGeDdBaW1pa25ERzhVaHgrcEI4?=
 =?utf-8?Q?XpKJXO+s3tQjDU/caQokCmCYDZuhNeVknXAxYiZnIAp/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8246f444-8157-4395-e6a7-08db68b35b14
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 06:32:54.2064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JROyl99uBsH/jVr8PJOJFmj1E1K6zIvWu0mXLyhx5wXyNh1offknSENLTmpVYiMn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9260
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.06.23 um 16:30 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> For dma_fence_is_signaled signaling critical path annotations are an
> annoying cause of false positives when using dma_fence_is_signaled and
> indirectly higher level helpers such as dma_resv_test_signaled etc.
>
> Drop the critical path annotation since the "is signaled" API does not
> guarantee to ever change the signaled status anyway.
>
> We do that by adding a low level _dma_fence_signal helper and use it from
> dma_fence_is_signaled.

I have been considering dropping the signaling from the 
dma_fence_is_signaled() function altogether.

Doing this together with the spin locking we have in the dma_fence is 
just utterly nonsense since the purpose of the external spinlock is to 
keep the signaling in order while this here defeats that.

The quick check is ok I think, but signaling the dma_fence and issuing 
the callbacks should always come from the interrupt handler.

Christian.

>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/dma-buf/dma-fence.c | 26 ++++++++++++++++++++------
>   include/linux/dma-fence.h   |  3 ++-
>   2 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index f177c56269bb..ace1415f0566 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -444,6 +444,25 @@ int dma_fence_signal_locked(struct dma_fence *fence)
>   }
>   EXPORT_SYMBOL(dma_fence_signal_locked);
>   
> +/**
> + * __dma_fence_signal - signal completion of a fence bypassing critical section annotation
> + * @fence: the fence to signal
> + *
> + * This low-level helper should not be used by code external to dma-fence.h|c!
> + */
> +int _dma_fence_signal(struct dma_fence *fence)
> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(fence->lock, flags);
> +	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
> +	spin_unlock_irqrestore(fence->lock, flags);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(_dma_fence_signal);
> +
>   /**
>    * dma_fence_signal - signal completion of a fence
>    * @fence: the fence to signal
> @@ -459,7 +478,6 @@ EXPORT_SYMBOL(dma_fence_signal_locked);
>    */
>   int dma_fence_signal(struct dma_fence *fence)
>   {
> -	unsigned long flags;
>   	int ret;
>   	bool tmp;
>   
> @@ -467,11 +485,7 @@ int dma_fence_signal(struct dma_fence *fence)
>   		return -EINVAL;
>   
>   	tmp = dma_fence_begin_signalling();
> -
> -	spin_lock_irqsave(fence->lock, flags);
> -	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
> -	spin_unlock_irqrestore(fence->lock, flags);
> -
> +	ret = _dma_fence_signal(fence);
>   	dma_fence_end_signalling(tmp);
>   
>   	return ret;
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index d54b595a0fe0..d94768ad70e4 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -387,6 +387,7 @@ static inline void dma_fence_end_signalling(bool cookie) {}
>   static inline void __dma_fence_might_wait(void) {}
>   #endif
>   
> +int _dma_fence_signal(struct dma_fence *fence);
>   int dma_fence_signal(struct dma_fence *fence);
>   int dma_fence_signal_locked(struct dma_fence *fence);
>   int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
> @@ -452,7 +453,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
>   		return true;
>   
>   	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> -		dma_fence_signal(fence);
> +		_dma_fence_signal(fence);
>   		return true;
>   	}
>   

