Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72AB5AE5B3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 12:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7BB10E40D;
	Tue,  6 Sep 2022 10:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8DB10E40D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 10:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3e2eE3+/4voLVQLcLn4EqenBlUemW5iiuCsWHKqVhvXk6Mb4165paJF2uPDbX7b0teNj3Tc+USdOTYW7M8TG/Pt6bk/azh8K+k7M9CAuIO6n6GcY7V6Us617yo9U8ig+9XdHhlGZuMa6fWG8GTTbv2A//yUkV7B7WE2YAMo9A2TL3bMUCLdQuPM1FxB/SkqE2lbyfExEvm38WK8uDnBv3HIgu7DJkre4tEOOnpdBjIjE4/iGrIASvTjDm9PskFNOzxYTunoMb8CjTB1eBFIYHDXke4oQtWh2nccAhJl7L3pQcZ0/v0XlPLfvy88rjTGAr2NNHB49KK7XCpxe/oKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOTc2P3N3Pe8q2hLkBPf4R8v07rUra1C+ryagE8qmX0=;
 b=DaVWVhzcNsL8azscS6m1aW3/JYD4wHnFYOewRYSgvXBdhIUrriirKyVRZgYfQEM5F6gI0ztXUZeSH/Jh9cWXeQ0AgAexW7yUsrPZ35+uvEqkun/1Qgu1mwXBDR5IxUC6g9wVwku552Sqsgo8qjk0YXI/Nm0yP26bU++eE3oudZ+4iunx8Qfztm89MMnOadkxtztx4jcnq9u5TNNIZWJ9XpBzX45zqqlGb/M6/Kf0CpLUrJGTq1Wo7Voi3uKd6CDBsLrMg+d9LlRJBr9770leSoGO9Y4pEVZGl/RVvbN3ziue8lJOghylyNnV+OxWgWj50COb+P2V+wJWFmY6EWr4uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOTc2P3N3Pe8q2hLkBPf4R8v07rUra1C+ryagE8qmX0=;
 b=mMQ790rUoRUt0j4msDzy2vKA4HXZTMXCSOZhx3UaIWlyAYWeGFyOdsZRxmUbKNifEgiewgdh+J8UYKIx3JBOhRG1lxwNxNWI0ISps7p6tEf3qyLK4760wi5QuT2rBu3A6U8aoCVFvjtDLzuVbFZdxCeaFylMghe8y+Hdlt9oM4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by SA0PR12MB4541.namprd12.prod.outlook.com (2603:10b6:806:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 10:43:47 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 10:43:47 +0000
Message-ID: <de799b93-1b55-c420-61d9-ad8fa926c7d2@amd.com>
Date: Tue, 6 Sep 2022 12:43:39 +0200
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ec41b299-4280-d8e4-7ab0-23b5ea6ad401@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0301CA0032.eurprd03.prod.outlook.com
 (2603:10a6:206:14::45) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1419fc62-b0df-4785-6677-08da8ff4ad6d
X-MS-TrafficTypeDiagnostic: SA0PR12MB4541:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a1xx2BKvWSTY3tsl9kcvDeL9BWsBIMjl/6PZkqqI1MOy8NQuHsPSA4GMVzmKQJTzdsNiJ5X+pvAk7p6UdkMoicqwds2pMzrBiaap+qbl0121ft7TZFSg02RPKjRZv6pxDXGte8QYnT+XwTH5L3ibfXHmP5V92nhRZCGiKVxDEslN9cLxGL7CyboXzeBA+ljAw0OTPAvmI07DYReMnvKIz31xCXX4XN0gpXPD4v4sfWZmMB7IJAU3AYZUULEm6F9rO/ha0r7fvntsV5wyPjWaOGDwHUNmN4405AFE7CkHEd740SSBbAvMezMyPqpRG1XNF1jCtGlGSizqIojuJlCu14oxbjL+iYfAGafSWHfD77F11TF3EsEtomWdUbTaI/9Y9NfOr4rS1OBtakXfsWdVCCB38QHvpy1l0xW6s0R7TnuakpADm1dVJm81CQLFPKAh5P96Xd2gAUdcHw0p2deInL5QdIdBRIEUHCN2TercNtKxqH8ycNeGA1crzgp6Dccpd8Bj3n3Muk+iETjm6kmSuIbTM9D2PS03t3O49eHbPx5J3yDlL2bQqqkLBXRg4QXCjn1NPk4XjFDRF18P/R8XVIzgHuEE7wwXlgnjtVg63dlN0s3z7JiQ33cEnSoDitMjsGo+nvRn2WTjoBb0JbzmpWUVdZJRUvFZYEx8DoCenpwQ/2LxW7Rzu/tU2PJyW5YsCVzMxHoPIka0AutAufBQLZ+2/YokmYiLI1W+JN6tdT6RocLy9HFufNCe9rrGJBToG7v9ItGhMjBHNtSe1jLUjEEDpKoFEpFCd2O3V9aHv2syxe5SAaeig/oKXtaF++fM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(31686004)(186003)(66574015)(110136005)(921005)(83380400001)(316002)(2616005)(2906002)(6486002)(5660300002)(36756003)(6512007)(41300700001)(8936002)(8676002)(53546011)(31696002)(6506007)(38100700002)(66946007)(478600001)(66556008)(86362001)(6666004)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGs4TjJ1Q2VhNSsxQkpDSXJaUllyYmU4M0o4MDNNOWt4LzVpSHcyMUNOVTg3?=
 =?utf-8?B?QmZrOHp4Z1BVaUMzVkpRdkg0WkhDT29CLzdhOStVOG14cERycWlTbjEvcHFR?=
 =?utf-8?B?OVpFOERNSjl5UENWamlnMDZpL0NKV3cvdjgrR1RjWitkcktjbk9kenU4TnZQ?=
 =?utf-8?B?UjRyNWtXS3JVRFhiMzlrMWsvdTZGM09lN1lrSzJZeE5yZ3ZpeWF3UnRrUlJH?=
 =?utf-8?B?My9jOTlvelIyUDJ4R0RsR0RzZjNJS0YyclFIQnp4YXRjckpxSXpNMVkzbVNu?=
 =?utf-8?B?dHEzN3c5YW9VOUllSER6VHJ5Nk9QNC9yeC9MQzhPR3UvNzhEbS9HYnFkNE5X?=
 =?utf-8?B?RTFwZDZRYXZvanF3WkQ3ZE9wTW1iem1jQUg3dkhXaFE4K2ZzbTFHZFJsUTZJ?=
 =?utf-8?B?QTJncmZNSXNsUmZvbTNEazE2Z1ZHSU1haUhLWDg3RklUOWhQQ1ZoUUJVWnFl?=
 =?utf-8?B?VW5qSFJ0WDV6T2JMbUNDYzFUOVJUOUN0UWhMTmIySlJ3RzFBa0J6THoxTHo3?=
 =?utf-8?B?dU1wMmx4SU5yKzZLazNmTW1pU2xjMG1IRXFxcEFxR2V2dm5Sam1yc1U0REEy?=
 =?utf-8?B?MjcycUsvekxEdmhvWndHUmx5OUlpd3hXV3V0ZjNrSG5QVm0zNi9WZTdPNkQw?=
 =?utf-8?B?aC8vUFpVaFRzamZmYVpnOTBVdkwxRTNJaXpVNXNjOFZHaXE2dnRkSEVpcVND?=
 =?utf-8?B?MEQ2azAySzIyQnRGd1VxWFJoeGhVSHR4TkhBSXZ3L2RieGJSemR0UGxwSWlU?=
 =?utf-8?B?N2NXRnFBbG92SmpNdmhZOHk3dmRQTnJ4MzZNZ21uOVY3M2kzNmFFdEJNZlBK?=
 =?utf-8?B?c1BZVU9VOVVHQWlJbHpmV2U4QVNQOUZOcFlUcENJdzZGMzAxcytGRW9yd25P?=
 =?utf-8?B?clBnSnF2V2pxNzdvblc2cWlnUGI4dklacjVDVmdlaGdkaXorU0pJbkpWTTA4?=
 =?utf-8?B?TlZGSk9ZYUl2M0JJcnhIMHhyYUtoaTQvK2FaRHMrZ0c3aDhHcGhMMG90T21h?=
 =?utf-8?B?WUViNlNSTWJsalhORnZDWFRhLzNuUDBFZnMvRjJFeUZGS1l1bEprNEVQWlpX?=
 =?utf-8?B?ZHo0T1ZhaGEydU9OQmh4amFxbGVDakJvNVlYSEZpMGYraXYvREdIbTBTRTBx?=
 =?utf-8?B?RUFYQnpway9ycUVUTUszVjhGRyt4THFQM3hWcW9jRkxRSjdDbFhQMmE0K1RY?=
 =?utf-8?B?eXRFdzV2RnBoNEJHbGpuTVJ6emUvbFNqbjVuWk02aVZrRStqV0FaNFFIeWM3?=
 =?utf-8?B?NDBNV2NwdEFNNkZiNDFid0Riem53TEM1WXFPbW4vOTUzTU9SdWlFSzJhTWFC?=
 =?utf-8?B?ZFh6TGdCOXVEbnpjSWxIR1FCaUQ4VjZJSmxORnVkSDI2L2lUR0w2TlB2WGJm?=
 =?utf-8?B?RjhqZmZ2ZEZBVWJqYk9KaDRTdi80azFscFFCTXdYRHdRR0xYWVB4ZGQ1VkxF?=
 =?utf-8?B?WHB3VEV3bVIwNEd6bjE5ejhzd1VLN09QZERucmpnUVY0U09pQjJYYkZ5N0NG?=
 =?utf-8?B?YStPVTF5T0c2TFZrajBNVHgxRzBiSyt3aEhsYmE5QU9Yd1BDRU1QMkVBYTJ3?=
 =?utf-8?B?cEZqeXJ1WFA4blVqaytKWFpNN2hyRHZ6THNvcGlSWnlYV0xpMDBpelBzM0d1?=
 =?utf-8?B?RnJSK21xMmozOFhlTmcxK0tpVkxNaHQ0Nm5lUERueU10UzJpS1lHdFJBVTJR?=
 =?utf-8?B?SGo0SVlPVlZwR0t1b1FrYjcraHUrRUtWV0xwa01TYVVobjJVY3dRbE1Ya2g0?=
 =?utf-8?B?TE5TNnQvUi9xQlRrdHNLc0J1cUdZQWo5RGJCTng1bGhRT0cwVVphSnJPQkF0?=
 =?utf-8?B?UmRHNk9uRVMyN0FFT3lvWjdtNzZRcmJHYmk2WWV4STV5VXdDS1NwZ1VSbDh5?=
 =?utf-8?B?ZGpITFJYNXhsbVJBUi9jTVNJYlJDZzYwY2dqS2c0RXlRRGN3Y0V5SlpOOXFj?=
 =?utf-8?B?T2c4ZUJPeXhmSjhDbWpGMTl6VENrK3Q0VC9JRklLYmYzQzUyTVNiNy9CeTRU?=
 =?utf-8?B?bHVaSUV0MmozM2JjbUJXZmZLdlN5VnNkOEFWTVAzdWNVczdmdzNNWGxmZ0FR?=
 =?utf-8?B?bU5tWmN0akRWSXFHOEFMK0JoUm1DQ1MyNzgwRk8yK0pwMXkrU0ZWL0RPVHgv?=
 =?utf-8?B?QXNvL2dQTUNDY0hMcEZpcUlPNUJBbDR2dDVNRHQ5UWUxWWlnQmF0NHc4N25V?=
 =?utf-8?Q?DvtuS2bEAYddgOPwSxJUDoQOd4CQhFyK4IqLScvQBOwx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1419fc62-b0df-4785-6677-08da8ff4ad6d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 10:43:47.3110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NW+PcKaEEfxipMF5tDOAHEav1XCUvEqfO60W6YWsUiVUXgQUE+tJhdvZGYLrPse1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4541
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

Am 06.09.22 um 12:20 schrieb Tvrtko Ursulin:
>
> On 06/09/2022 09:39, Christian König wrote:
>> Am 05.09.22 um 18:35 schrieb Arvind Yadav:
>>> The core DMA-buf framework needs to enable signaling
>>> before the fence is signaled. The core DMA-buf framework
>>> can forget to enable signaling before the fence is signaled.
>>
>> This sentence is a bit confusing. I'm not a native speaker of English 
>> either, but I suggest something like:
>>
>> "Fence signaling must be enable to make sure that the 
>> dma_fence_is_signaled() function ever returns true."
>>
>>> To avoid this scenario on the debug kernel, check the
>>> DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT status bit before checking
>>> the signaling bit status to confirm that enable_signaling
>>> is enabled.
>>
>> This describes the implementation, but we should rather describe the 
>> background of the change. The implementation should be obvious. 
>> Something like this maybe:
>>
>> "
>> Since drivers and implementations sometimes mess this up enforce 
>> correct behavior when DEBUG_WW_MUTEX_SLOWPATH is used during debugging.
>>
>> This should make any implementations bugs resulting in not signaled 
>> fences much more obvious.
>> "
>
> I think I follow the idea but am not sure coupling (well "coupling".. 
> not really, but cross-contaminating in a way) dma-fence.c with a 
> foreign and effectively unrelated concept of a ww mutex is the best way.
>
> Instead, how about a dma-buf specific debug kconfig option?

Yeah, I was thinking about that as well.

The slowpath config option was just at hand because when you want to 
test the slowpath you want to test this here as well.

>
> Condition would then be, according to my understanding of the rules 
> and expectations, along the lines of:
>
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 775cdc0b4f24..147a9df2c9d0 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -428,6 +428,17 @@ dma_fence_is_signaled_locked(struct dma_fence 
> *fence)
>  static inline bool
>  dma_fence_is_signaled(struct dma_fence *fence)
>  {
> +#ifdef CONFIG_DEBUG_DMAFENCE
> +       /*
> +        * Implementations not providing the enable_signaling callback 
> are
> +        * required to always have signaling enabled or fences are not
> +        * guaranteed to ever signal.
> +        */

Well that comment is a bit misleading. The intention of the extra check 
is to find bugs in the frontend and not the backend.

In other words somewhere in the drm_syncobj code we have a 
dma_fence_is_signaled() call without matching 
dma_fence_enable_sw_signaling().

Regards,
Christian.

> + if (!fence->ops->enable_signaling &&
> +           !test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
> +               return false;
> +#endif
> +
>         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>                 return true;
>
> Thoughts?
>
> Regards,
>
> Tvrtko
>
>>
>>>
>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>
>> With the improved commit message this patch is Reviewed-by: Christian 
>> König <christian.koenig@amd.com>
>>
>> Regards,
>> Christian.
>>
>>> ---
>>>
>>> Changes in v1 :
>>> 1- Addressing Christian's comment to replace
>>> CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
>>> 2- As per Christian's comment moving this patch at last so
>>> The version of this patch is also changed and previously
>>> it was [PATCH 1/4]
>>>
>>>
>>> ---
>>>   include/linux/dma-fence.h | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 775cdc0b4f24..ba1ddc14c5d4 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -428,6 +428,11 @@ dma_fence_is_signaled_locked(struct dma_fence 
>>> *fence)
>>>   static inline bool
>>>   dma_fence_is_signaled(struct dma_fence *fence)
>>>   {
>>> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
>>> +    if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
>>> +        return false;
>>> +#endif
>>> +
>>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>           return true;
>>

