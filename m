Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679FA5AE6AF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 13:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C41C10E621;
	Tue,  6 Sep 2022 11:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340EF10E620
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 11:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1e/4gsFKvuvcrQOvESa7fWOgxjfFXXURMKnsC6y2wf9ULaNP7yIXQLLYLQIekfdXwX5mQdU0wgaGG8J9LJTkucrM24QVyUx8rv1axOragRVN/TjSeXaXLmCEYXob5ojVfipjcEkKP1Zv/E5CNjeS/sWirpD0iyQYlcLElSXrDBz+KuA0SUo6F7xguU12py6mnSkni46NGu6Sk4h0jWaVLUisKhS2hHhrGbxeNtifnAyLpyyW/oI10kFrDs912UTiValC9r8KhR2JGWVwCBI/Kv/jQ6IzgFzeHObmx+P2RSRlI9glzCNh/84Z0VlQRaA5hbNsJZepU+Wb3Iokzi5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yw+fb2jvaCzj88EDTbvRV2zFCU+ZqHZtUJ5BQw/fMZ8=;
 b=Q2M3+CPbHIkaKZvFG9ia36XlSqCokgwWwqv8Smub47j0ApcCs/vl7CD8NZY4oRPygXu/WLeWiTjClTcX2If8LgC2BAOU5RcLIWWIWfw9v4Z3eJvWZIB5dAOoNohvz8VwoH40egtemAQndzt4AXjg5wYTSedL/70t+Tv0Y6IDtcgnq3upz5DQhujqISZO89Z7oA4L+iYdlz0cpoZuy9NjZZ1lqMkBHxJuH2kpbf1m7isvhTOKQHIBvBT7r9eoa+OXMLcPwM3y8V/NLqpDvZ6TS3sbF0iTrpH4nMd9kK7WNGWWvngxqw7DW30HyO/D4EFRy9LjIXGrHl1MG1+G5WRUUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yw+fb2jvaCzj88EDTbvRV2zFCU+ZqHZtUJ5BQw/fMZ8=;
 b=4gWK3NNYCmLZlJxOwa6b6SXn2eT0UlSSC55fEqkaBZRt9JCFBM4PcLWOxvtIbUCotP04yzPm9KyYaR9Lgq78Mr2mt+f6wBiseBGV2CRLVphqvL4QJCNMyQiMjQVh2IWU+Ks73Z2ddF5ouVsvuUnTJp92u4VSbvrdFLAD2oBNI9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by IA1PR12MB6281.namprd12.prod.outlook.com (2603:10b6:208:3e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Tue, 6 Sep
 2022 11:35:57 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 11:35:57 +0000
Message-ID: <83f1fee0-8e9c-c536-d215-791f16fa4a07@amd.com>
Date: Tue, 6 Sep 2022 13:35:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/4] dma-buf: Check status of enable-signaling bit on
 debug
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220905163502.4032-1-Arvind.Yadav@amd.com>
 <20220905163502.4032-5-Arvind.Yadav@amd.com>
 <f2e1367f-b056-b2af-365c-8ae4ef03f008@amd.com>
 <ec41b299-4280-d8e4-7ab0-23b5ea6ad401@linux.intel.com>
 <de799b93-1b55-c420-61d9-ad8fa926c7d2@amd.com>
 <691e636f-07d6-f4d3-6d83-29a3834ac1a2@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <691e636f-07d6-f4d3-6d83-29a3834ac1a2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0187.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::21) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 102ebcde-54a0-4acf-6c5f-08da8ffbf700
X-MS-TrafficTypeDiagnostic: IA1PR12MB6281:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f8HRPppKGj16lSC4ayktg2CKZzqeZFwT//DWCKhw+fUHlkv0HlVHCoeFHCWnYgBHH0irpJG++/W6djwHhuuWuBTIM794h/SHKlRRMrw8JN62/oD9p6yYPnRB+BsBdD29BJuOvFlcoacuY36N3LxQorueAVE9dwuyd1ctsOIkPJqKWQ0YrkSggRC9hATwdj3eHxqzJ9pFllaeOz9ixdCdSwjcG+RJDaUlOTgGZsitbB6iaiVGVZfxRRL6DBfxODELUTc79Xj/q/DfEg8dtBAPY3eP95yslzHmWRYcGWPiTD/3UdgzmG7FzlBzILA1BzmQgWnbQswR+jXePrERMtcnliGMDk9uGi5JEBoe1x8a7EUIOgKNrOx9aRxCnt3RndxWcV6Lnzkbsn4GnAAamCCHMm53bl85ibCjaoViDuJwdkK3CSJRzploRk/eFD5kgFrJgIT8/WMD0H37ZTAHNr44r/O9OVqdb1gw/R1rC7XmdkXKqJoirplO+Hgma53t01vp9os+vG1d30PjeQJEMElHYkOZ7N3cnQflETOqsVH57B/DdmZNkWmjz+xx9DRMgZZ9AyIAp99qTVD/91BpyuPib82byH54+Iim8fxIZdAzhVG6wXD20QzszkChzjgLEV8mw8bhVhNz8akcfhwv/5DnmhTsylOhVDeq0S+GDyIsinHDamwKZh476l6vezKGQphpkn/ZhIt63TpJ+Let/tA6bhdGfQOo/lNQZcteejemMeER59wThoJxP0r83n01YYNw2yFyw6U0LDYPvBvGP3FjxxODd3MN/IcAe0JuPlKYOgaJaQ7Se7yGeAw4cO14mIJayeq9N8R7R7hlmJcmAyXjaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(8676002)(66556008)(83380400001)(66476007)(66574015)(66946007)(8936002)(5660300002)(6506007)(53546011)(478600001)(41300700001)(6666004)(6486002)(6512007)(2616005)(186003)(316002)(86362001)(110136005)(31686004)(31696002)(921005)(36756003)(38100700002)(2906002)(60764002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm1oSm5QWlhBanhaTFJvNTZRUDBSWVIrNlUrVy84aWZrdnZzbW4wOXFqLzdQ?=
 =?utf-8?B?ZkJxdmEzclZ3b1BvMXpSZlQzbVpSOThWRmJ5SVRyVU8yTUxSRkZ4VkRJb3Np?=
 =?utf-8?B?aGFGRVNuWTFVamRza2RvRmNmd2tKYURKUWU4Y25yU010S08ydkNDZ0RoRjVq?=
 =?utf-8?B?S3NsQ01rRDlRd2pmU0t1Mm9wMDdXa3RXazVNNzVLTWg0bUZoK0ZUN3BaM0li?=
 =?utf-8?B?aDlSdmhUa3pNSFdPVzdrcEp5UkJBRmNDUDFRWGlpbHdGU0s5OEZ1blJjYzBx?=
 =?utf-8?B?YmVPUTlKWU50WnVCQ2kvb2o0ZHFpM0FtbEdXV1loQmpSTDZnR2JSL2xpN3Ur?=
 =?utf-8?B?Y25GeHEzelJHQkREWEdLTE5tUXp1b0haOHdENjQwWFFhandvQWZBa3ZEcUhZ?=
 =?utf-8?B?VC9tUi9wNVhnanVmYnlYK3VNa1U4Z28vcHNMVmdjYXRpR1pIOTU2cUVZUzdi?=
 =?utf-8?B?NVp4ZThPR0orVzExNTFNTHRQUmFaYlNkMVhSN1duZllFV1lpRGFqeTF4NlRT?=
 =?utf-8?B?d3ZyTHYxM0FLMWl6NnRmQXNWZGs4MHFhaEY2MjREbHgreXZkTURvS3RZdGw2?=
 =?utf-8?B?YTh3ZHhCTHdDYnpRNE1nSXNrSFpxVERxeGkyWWp0aktmZFdjREpUblQxQXZ5?=
 =?utf-8?B?eGIrcTBaU0lkM2RFV2pnRmh1Z00vMXZseUVtT2s2WDlPYVpqQ29jZEpqbVJ0?=
 =?utf-8?B?cFRvNktIZDB4RGx5dmMwRDVKTFZLOXZzd0Q2SSs1bUYzSXVZcGhFNHVOb0s2?=
 =?utf-8?B?c0tEK2krZURBajZtT3pJMTcvVDdkZkNuL1UybmhweEhOWUR0bWFOWG1RWElJ?=
 =?utf-8?B?aHJZNHJpbU4rUGJTdC9SL3BlbVlnZ1ppSVl4eXZsdnVVTDJaZzI5cjEzaldi?=
 =?utf-8?B?VDRicTd5aFFVc3dxZWVvdjB2RE13V1kwYmlIR1hrTG85MXEyQkFPd2M3UzlB?=
 =?utf-8?B?c0MzUWRLWWdDb2hjSVd4eTJEMWV0eGI4MVZOTGNZdEx0SkNVRkRSQisyRENJ?=
 =?utf-8?B?N0xDaVpMdGUvTVFkOTZzSE9na201M2U2clBXRUZkQVNQMDZpT0llR1FRU1I0?=
 =?utf-8?B?dWZ0WVd1bmFhQ0ZiUjlPdG56WDVjb2J1RWhhVUI5RlVXZzhmV3hqUTdaRFpr?=
 =?utf-8?B?dWRJdnhLYUs1cFZzL2laQitTZDNoSWdnTGIva3JUWlVJcXU4aU5BS21YazV6?=
 =?utf-8?B?UGpYR3VUZ3FRM05uUEp2QWNoTmdidmZhZlNRRnBRUE9scFNzcFZjdWgyLzd6?=
 =?utf-8?B?VXhmdFNlVEtVenIwK2J0SkdIVmhSaUtDSUxXWDdsaDNpRUxwRmo4ejZiMUh5?=
 =?utf-8?B?OGVpemZxYmhDUDQwQVU3UDhkQytvL3REdGpPUEVoYnN4S1IwZzNmWVYxcTNG?=
 =?utf-8?B?T0VHWXVTSW1QQ21rQlFGbjNESnl6bEJQaExvMHlyY2dQU1VlaWJuRDU5ZzYr?=
 =?utf-8?B?NkpEZzhsRzFobnE1dUtRWHcwdUp6cUxIOUp5SVhjNEpvVks1dERxNlVqVFBt?=
 =?utf-8?B?Z1NMMVJDRS9GZm1XbTNNTkNwUWZFYTZLRUtmVzdMajJBcm1LWkNlM25TeWNK?=
 =?utf-8?B?ekp1akdYR29TOVBVOVFMNU5mVXRxb0hLeER6SFNqOVBBdTU3SmhQRSt2Z0lG?=
 =?utf-8?B?ZC9yeTc5NnlRSVdRc3hDd3dDcXhpcmVodW04bzh3TVdYRHNNWTJtMXlGUmlT?=
 =?utf-8?B?Z1VWVjc4Y2k4U3hIUy91VHBQQ3JSSDFEQkFlenRkVWF1KzdqQXlUQWNMTzVq?=
 =?utf-8?B?VzhRbmlXZkZqY3pTQmZZV2VTTEFjd0JIY1J2SUNGL0FGOElwbGZOOXJPd25q?=
 =?utf-8?B?c3NiTUErcGtmckJyR0JOUWhXMy9SZFRyRjh3Vnd5MG5ma21ObDkrN2dLaVBU?=
 =?utf-8?B?bFVrMDJDNk5iUjVyK1ZhK0ZtejV2dUhleno0NitiRnBMU3NlZGF3T3VEVFhM?=
 =?utf-8?B?TEpZQ1graE9MZUJWQjFVNnQ1VXdCMmpISCsvN0EwQUkxMGFYSWtod0xab2JC?=
 =?utf-8?B?cTN2UFkrSW5yMzRaWEZjVDdUeDVacWN4ekJOUkgzM2pqcFdrQVVzSnF0Undh?=
 =?utf-8?B?ZEhYNzQwM0E1RFlVN1lwS0c4MWZqZHN5NThrNzRyaVpGZWNjYmJGVUtXbVNo?=
 =?utf-8?B?emZIeWJISUc3UGdwdjJrb0FsMEljTUE0ZHRmUHh2WGNVNDBBV3ZFR3F1K2h3?=
 =?utf-8?Q?jScTcII3CX/lEuWr+nbtBSmYUdd7PQoXJNhuNyQ+dKop?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102ebcde-54a0-4acf-6c5f-08da8ffbf700
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 11:35:57.2722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGUe8ZCHm6YbtrXagabgvvtssn/V6sCnT+94PUjmQcq8zniNfGNEhIR3J7OsHh3s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6281
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

Am 06.09.22 um 13:21 schrieb Tvrtko Ursulin:
>
> On 06/09/2022 11:43, Christian König wrote:
>> Am 06.09.22 um 12:20 schrieb Tvrtko Ursulin:
>>>
>>> On 06/09/2022 09:39, Christian König wrote:
>>>> Am 05.09.22 um 18:35 schrieb Arvind Yadav:
>>>>> The core DMA-buf framework needs to enable signaling
>>>>> before the fence is signaled. The core DMA-buf framework
>>>>> can forget to enable signaling before the fence is signaled.
>>>>
>>>> This sentence is a bit confusing. I'm not a native speaker of 
>>>> English either, but I suggest something like:
>>>>
>>>> "Fence signaling must be enable to make sure that the 
>>>> dma_fence_is_signaled() function ever returns true."
>>>>
>>>>> To avoid this scenario on the debug kernel, check the
>>>>> DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT status bit before checking
>>>>> the signaling bit status to confirm that enable_signaling
>>>>> is enabled.
>>>>
>>>> This describes the implementation, but we should rather describe 
>>>> the background of the change. The implementation should be obvious. 
>>>> Something like this maybe:
>>>>
>>>> "
>>>> Since drivers and implementations sometimes mess this up enforce 
>>>> correct behavior when DEBUG_WW_MUTEX_SLOWPATH is used during 
>>>> debugging.
>>>>
>>>> This should make any implementations bugs resulting in not signaled 
>>>> fences much more obvious.
>>>> "
>>>
>>> I think I follow the idea but am not sure coupling (well 
>>> "coupling".. not really, but cross-contaminating in a way) 
>>> dma-fence.c with a foreign and effectively unrelated concept of a ww 
>>> mutex is the best way.
>>>
>>> Instead, how about a dma-buf specific debug kconfig option?
>>
>> Yeah, I was thinking about that as well.
>
> Cool, lets see about the specifics below and then decide.
>
>> The slowpath config option was just at hand because when you want to 
>> test the slowpath you want to test this here as well.
>>
>>>
>>> Condition would then be, according to my understanding of the rules 
>>> and expectations, along the lines of:
>>>
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 775cdc0b4f24..147a9df2c9d0 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -428,6 +428,17 @@ dma_fence_is_signaled_locked(struct dma_fence 
>>> *fence)
>>>  static inline bool
>>>  dma_fence_is_signaled(struct dma_fence *fence)
>>>  {
>>> +#ifdef CONFIG_DEBUG_DMAFENCE
>>> +       /*
>>> +        * Implementations not providing the enable_signaling 
>>> callback are
>>> +        * required to always have signaling enabled or fences are not
>>> +        * guaranteed to ever signal.
>>> +        */
>>
>> Well that comment is a bit misleading. The intention of the extra 
>> check is to find bugs in the frontend and not the backend.
>
> By backend you mean drivers/dma-buf/dma-fence.c and by front end 
> driver specific implementations? Or simply users for dma-fence?

Backend are the driver specific implementation of the dma_fence_ops.

Middleware is the framework in drivers/dma-buf.

Frontend is the users of the dma_fence interface, e.g. either drivers or 
components (drm_syncobj, drm_scheduler etc...).

>
> Could be that I got confused.. I was reading these two:
>
>
>      * This callback is optional. If this callback is not present, 
> then the
>      * driver must always have signaling enabled.
>      */
>     bool (*enable_signaling)(struct dma_fence *fence);
>
> And dma_fence_is_signaled:
>
>  * Returns true if the fence was already signaled, false if not. Since 
> this
>  * function doesn't enable signaling, it is not guaranteed to ever return
>  * true if dma_fence_add_callback(), dma_fence_wait() or
>  * dma_fence_enable_sw_signaling() haven't been called before.
>
> Right, I think I did get confused, apologies. What I was thinking was 
> probably two separate conditions:
>
>  static inline bool
>  dma_fence_is_signaled(struct dma_fence *fence)
>  {
> +#ifdef CONFIG_DEBUG_DMAFENCE
> +       if (WARN_ON_ONCE(!fence->ops->enable_signaling &&
> + !test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags)))
> +               return false;
> +
> +       if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
> +               return false;
> +#endif
> +
>         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>                 return true;
>
> Not sure "is signaled" is the best place for the first one or that it 
> should definitely be added.

I was thinking about adding this WARN_ON() as well, but then decided 
against it.

There are a couple of cases where calling dma_fence_is_signaled() 
without previously calling dma_fence_enable_sw_signaling() is valid 
because it is done just for optimization purposes and we guarantee that 
dma_fence_enable_sw_signaling() is called just a little bit later.

But yes, in general it's the same idea I already had as well.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> In other words somewhere in the drm_syncobj code we have a 
>> dma_fence_is_signaled() call without matching 
>> dma_fence_enable_sw_signaling().
>>
>> Regards,
>> Christian.
>>
>>> + if (!fence->ops->enable_signaling &&
>>> +           !test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
>>> +               return false;
>>> +#endif
>>> +
>>>         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>                 return true;
>>>
>>> Thoughts?
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>>>
>>>> With the improved commit message this patch is Reviewed-by: 
>>>> Christian König <christian.koenig@amd.com>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> ---
>>>>>
>>>>> Changes in v1 :
>>>>> 1- Addressing Christian's comment to replace
>>>>> CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
>>>>> 2- As per Christian's comment moving this patch at last so
>>>>> The version of this patch is also changed and previously
>>>>> it was [PATCH 1/4]
>>>>>
>>>>>
>>>>> ---
>>>>>   include/linux/dma-fence.h | 5 +++++
>>>>>   1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>> index 775cdc0b4f24..ba1ddc14c5d4 100644
>>>>> --- a/include/linux/dma-fence.h
>>>>> +++ b/include/linux/dma-fence.h
>>>>> @@ -428,6 +428,11 @@ dma_fence_is_signaled_locked(struct dma_fence 
>>>>> *fence)
>>>>>   static inline bool
>>>>>   dma_fence_is_signaled(struct dma_fence *fence)
>>>>>   {
>>>>> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
>>>>> +    if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
>>>>> +        return false;
>>>>> +#endif
>>>>> +
>>>>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>>>           return true;
>>>>
>>

