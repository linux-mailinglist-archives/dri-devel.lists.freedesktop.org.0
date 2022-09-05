Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDEA5AD900
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 20:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD7010E498;
	Mon,  5 Sep 2022 18:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF67710E499
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 18:26:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5sU+SxfTVR/L2ga1+9lOmkBfRiw1C+CD452mCykTma0rr9dkqbXTd1B499jLCwwToyPxx7qDvY/dUqLrwFTwyg8HYwQSBlKEitAe6/NpvldftKYH6LiV3gTQOevTl3nRhmoMauys9Z6Sc+JncbPEL1OUAjXhgm8bAId4SoMLM0MIkvZUgXH4/bAHUOVaSrp+kRpFcGWTf1EPCCGqua0EAdo9PcyFZddbd2lgD4NlLJkciMfdSP09RjXBZhiIPLQ3P/JHH+Ktb3NU2u5N8upsnp+Lq8TvU+cGPMamPx0yPlN6WMgBF2uLTBQrwye5QN5WlcdpoLQ0SHEvZ8j9h98zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poSojd5kbTekZqSfy8QCPrycXD96N8UxYkoF+PazzD4=;
 b=EY0zFA6htxTqeyR9XGpspUIPAufg+w6bCQjXSH/LU+Oqamd5XrDJ4dpbsjlAs1xLmcij+dSvkDfeltL0tMWhRyB1Syk8C4oTuv+uKLUiJCRt0fRXceaEtxxKuC0b2toJFwumaI3hgan371E3kn4dfGar1ste5tOqZqBq90BAfEjXdRmmDLXnr96pNvt+yk951Jxxn7DvhtJuOnnRcgjXLsFNK/fNksUSylV3GMThSDO67BNQw5305dhgGpeRzfYWhwtcgRbDt8si+MzHGzaww0Q3ePop5QwWDKEZ39Cu8u6ZT0DuwIFytF1w28xUQR2I4EpeVpj6LZxAmh/X70pxHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poSojd5kbTekZqSfy8QCPrycXD96N8UxYkoF+PazzD4=;
 b=2vEAlp1k3EvycXPxiwwEKbYtONiui88AekinCV8kyxPjOhqUzoF7i9g6D6KpNLQrNVon15jM8O/wCHkRlZIk5X1Z9IpSDscNgXwo791jZGBYfeYbZ2OUsioM/3fy5nKGKDAto9gf6XAlHuefdf0qS8AKH+aUiZopjSsG8yUONiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4485.namprd12.prod.outlook.com (2603:10b6:208:269::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 18:26:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 18:26:47 +0000
Message-ID: <3da7b3c2-737e-a067-9018-8e743e59ef65@amd.com>
Date: Mon, 5 Sep 2022 20:26:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] dma-buf: Check status of enable-signaling bit on debug
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220905105653.13670-1-Arvind.Yadav@amd.com>
 <20220905105653.13670-2-Arvind.Yadav@amd.com>
 <0038fcff-35f1-87e3-aa26-cdd104a13628@amd.com>
 <3c702549-75f4-c640-9f9c-37d7fcbb1645@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <3c702549-75f4-c640-9f9c-37d7fcbb1645@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58a2fea0-7a65-490d-019b-08da8f6c3131
X-MS-TrafficTypeDiagnostic: MN2PR12MB4485:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tj4DW1lQ+s+sSZoQnV+Y1xE9LeXE+kirZWlzuAI4sIwReJWSP5yOFk7XgKo6wqd8rx+KZ9FLlHzhJH9CarZViz6TH8rf1wzhlWD/S0OPFyZaiJA0M+NCqq5MhIOEM7MQHYhMCY00KSCnxkVvov7hX1BIx4U3NKTodhoCsmATyht86d9FzXk9KPA3K692IkAP1BM440AQY2bf9185QCAlydu7xSfbmbCE3U2JI9gXB4fD5V6TOTIcT/3xI4XtA4o3XRjlpREcDLjvWJfcuZIFyd+rW42uXE0z2x3jfMgEcRGBSLcn4bQrWa9U7nA2UcIEjF4RLlsLhEB6U5/Lw65EmmoLLpQCa/Nu/cwt+QrOl2+UnxzEjuKrFxbhDXvpOL+digHrRnb3KYjxrRXfFzAH5/v8nRHIj9ydOF1W6L7TOrbrPU1OzU9KgUVm1IFfiU+4aCiYZioAJ2lnWbG65n3yhhPgTkyUhpHFcxwwxxwV87vDcuIWxNfeasvljlYXtE3I/NcY/lYcWcbR30VkwvAL74ig49hO3Jym0p3NOdX8Q0/mGUy4VtTKdD+EQR7UEZwAEorWqmHemhYLlBoWEnYauEZEV4BDfmpj0EmoLI1xzz7vdOtWsupCu4ljhf76uyp1yCmrUsAY+s1KTSNAM2tEqK8bi+b5J0GUT0dQv80jKw/PV9xCYZHwawOr/SjeQ+wOFTUMstX05tu9tLkQPzm5AYeB6hAIOXbMuEjtQyEcxF9jwjJr2k6ynCSQJHGsEjKzXeehm4LeoODyplmOsC8u3Ln5nb7eLA4oKBNopLisggRdaaR2g0VjmJCf6pGtnCSn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(8676002)(83380400001)(66476007)(66574015)(66946007)(8936002)(66556008)(5660300002)(6506007)(478600001)(53546011)(6486002)(41300700001)(186003)(6666004)(6512007)(2616005)(316002)(86362001)(110136005)(31696002)(36756003)(31686004)(38100700002)(921005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3F4SjdmQ2NpVDZSSXFGR2o3SHkvcDNCclZYa1NFSVJnbWRwVWR5MWZ2K29x?=
 =?utf-8?B?alNkUHBJQmY1ME5DRFdnSDdzdmIvMldCalNyQnduMFBpWTJVdDEzbms1MXVN?=
 =?utf-8?B?SWQzY002RzZXb3FoZXRKeDVKTFNzbWhsdzRLNExTOTVNN2VWZUM1V2xRRU0y?=
 =?utf-8?B?NkJnUklYQmpZdUE1K3lJYkNlRTl3SzcyRWhxZ1lEOGVwSDZpdjBzNWVpSGky?=
 =?utf-8?B?TlVZeE0zTGppRFNvNHJzTERHVkVRMERZTk9aWWRobDM4M1BuWXN5UU52ei9T?=
 =?utf-8?B?WkpaTkF0S2pBMWd5VjRsYWV1S2JJV0Z3N1N6YUZzUXNmbjNoTU1BSnRXZTdr?=
 =?utf-8?B?ZW11cno2U21rVHlrQUVnUStSclVneWh4TmV3VmNqY1dnb1NmMXlSSkZ5RkFq?=
 =?utf-8?B?SzJrSjZMeE5NYWxSa0l2RXl0YlBwbWZMcU5xcHRaNEVyUEtJVDJWaWZwcWNP?=
 =?utf-8?B?Ti9mZzU5L04vNTNtM0R0TWJVTTdkRnB5SnR0enhIaW03T0FLTlBhdDNaRHUv?=
 =?utf-8?B?d3g5NmJkTUJFS3BDZWRIOUlnQ0hhU3E5QjkyUWdnWkFUUU5udW5HcWxiemJU?=
 =?utf-8?B?VkxIRUgxcmdpYXRodGsrL2R3N0ZBcHpUdzVjMWZheThDV3h4Ylg1N1oyNHV2?=
 =?utf-8?B?NDJVdVFuaWd1bTRsVXRUcFYzUWhlS2pCQ2FwNjd0aXRheFBiVndvMjczWjcv?=
 =?utf-8?B?enBIRHpwRlQ0WlpySTlBSk55bGNvUncydTBnSy9IY0FyQkhzTkNiNzZPSGpO?=
 =?utf-8?B?WWtJdDhqLzVEdHNieTZlVkNyUThyWGdOeWZBZithek5vR1BoOFNqWVVkUDdw?=
 =?utf-8?B?WFAvOEhrZm9nN1dWaFZxL0tVMUJlemllYlRIcWdmK2d1ME5UTmNHZU1kYTRD?=
 =?utf-8?B?WlhYMkxSNElqeHJOMFlaVzlLdEcraTN2QlE4K3RNMlhXeGRURFYvSEF3cFpv?=
 =?utf-8?B?enBtcktwbFlMSWw4a3lWV251V0p5SHdyTEJjb0xhcUxSbkFqbzZySDBqaVFG?=
 =?utf-8?B?TlZoVGkzYk1Sc1JVdjE4dHhLMlQxcTlLWGJyL0FXL2MwRGhLRmFYS1RpK2Mv?=
 =?utf-8?B?cjY3aHVIdTdjZmlFdmdDcEh6ZjBtQStkSjFVY2pwaGlUVWNta3E1NE9OdDRD?=
 =?utf-8?B?OEh6N1d0c2dDY2NQSEZLc2laNmdsY0pHanNIK2VraUgzM3hEM2syVWFtVkc5?=
 =?utf-8?B?cDdrZzVyaDlmTlVUNTlSOWZPeEEyK2xjaVNiZjljL210ZzRONGpFMU9Wdi9N?=
 =?utf-8?B?eXRsWk16WnZPV1pkVnA3c1pUUHJpZXBBSitzdWdZK0VvV0twcTRkOEo3a1Rj?=
 =?utf-8?B?d3RtWlBDUld4TUJzUUNLRis4Y0xJby85VmRYcjJ5WlZPdE00anN4TStYTnhT?=
 =?utf-8?B?eW1sUDJCQUh0OElUR29oZXpzZ2hJTGhzalJWeFJSRzd3KzBWMkZpRUJMSnZO?=
 =?utf-8?B?by8wRDRDZ1Q1c1NqTVlVTWRmWTl1RkoxNm9NcFRzcU5iVXh2VS9VeUpIMTZ2?=
 =?utf-8?B?cjV4TFRhSjMzTXZPeG5aaUc3NEZrTWlsdEx6Lyt6NDRBbGdkR0F4RGc2N1E0?=
 =?utf-8?B?OEwzNkExWDdlRkhuYkNQRGZtamZZQUVqUE1qMnBwRmJCYk5sS1piTERmS3lp?=
 =?utf-8?B?ZFpvR3pZK1JnbUVsZmsxUGthS1lNOVdJSzBKZUpGUEdRaHMzSDBSYmp3Y1Zj?=
 =?utf-8?B?MUI1ckhIN1JOQkdYaXdFaTEyVDhidExQdjBRVGdNSVBXcHRoNDZyZTdyRTJM?=
 =?utf-8?B?RTBqcFVBaExZWXdTQWJ4bDR4anZFVW9NeHNpMnlxaXdFYUxUKzlOVmpubzBB?=
 =?utf-8?B?d2FSK05ERFdlRjJ2RjFaOHQyZGM3TzFBS3gwd0I2TEd2RHBoY0pzdjZWSEtn?=
 =?utf-8?B?eGlRd1hpcEJEU3lVN0JhbDZheUNoN1A4UlByMVhKcmx6SHhxdkFCbHdFc1NB?=
 =?utf-8?B?QmM5ak53dlljT0N3VnNBZVlrWjNkdjBOYlg1U1hSUXIyekxlVnBJa2tGUWU0?=
 =?utf-8?B?S2hQYUhuY2g0MU8xRUtCNEF1dk5URUFwM3BkdWhRb2pMU2J1aUMyaFRqa3lU?=
 =?utf-8?B?U2dtMnlITjVSQlJjYUpGUWszTkFhd0I5OHdCSVBkTitCOG40TFZNTFRSMkp4?=
 =?utf-8?B?N1NNSVd1eERKVFB5L3dRdFcyck5NSUJqRW1hYWc2SFJOMFMzdnVMRTJxa0hK?=
 =?utf-8?Q?NR36zzsc+5AIzb34udo7qtZkTy+VsDr3iwLtmnWTrqjT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a2fea0-7a65-490d-019b-08da8f6c3131
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 18:26:47.3693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+mmSSUxF8Ny4Qk/IpGZJiFqUWrbZYg8k5enzf7AXUwWU3fNpHyj3eqxDc+SooK4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4485
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

Am 05.09.22 um 18:39 schrieb Tvrtko Ursulin:
>
> On 05/09/2022 12:21, Christian König wrote:
>> Am 05.09.22 um 12:56 schrieb Arvind Yadav:
>>> The core DMA-buf framework needs to enable signaling
>>> before the fence is signaled. The core DMA-buf framework
>>> can forget to enable signaling before the fence is signaled.
>>> To avoid this scenario on the debug kernel, check the
>>> DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT status bit before checking
>>> the signaling bit status to confirm that enable_signaling
>>> is enabled.
>>
>> You might want to put this patch at the end of the series to avoid 
>> breaking the kernel in between.
>>
>>>
>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>> ---
>>>   include/linux/dma-fence.h | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 775cdc0b4f24..60c0e935c0b5 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -428,6 +428,11 @@ dma_fence_is_signaled_locked(struct dma_fence 
>>> *fence)
>>>   static inline bool
>>>   dma_fence_is_signaled(struct dma_fence *fence)
>>>   {
>>> +#ifdef CONFIG_DEBUG_FS
>>
>> CONFIG_DEBUG_FS is certainly wrong, probably better to check for 
>> CONFIG_DEBUG_WW_MUTEX_SLOWPATH here.
>>
>> Apart from that looks good to me,
>
> What's the full story in this series - I'm afraid the cover letter 
> does not make it clear to a casual reader like myself? Where does the 
> difference between debug and non debug kernel come from?

We have a bug that the drm_sync file doesn't properly enable signaling 
leading to an igt test failure.

>
> And how do the proposed changes relate to the following kerneldoc 
> excerpt:
>
>      * Since many implementations can call dma_fence_signal() even 
> when before
>      * @enable_signaling has been called there's a race window, where the
>      * dma_fence_signal() might result in the final fence reference being
>      * released and its memory freed. To avoid this, implementations 
> of this
>      * callback should grab their own reference using dma_fence_get(), 
> to be
>      * released when the fence is signalled (through e.g. the interrupt
>      * handler).
>      *
>      * This callback is optional. If this callback is not present, 
> then the
>      * driver must always have signaling enabled.
>
> Is it now an error, or should be impossible condition, for "is 
> signaled" to return true _unless_ signaling has been enabled?

That's neither an error nor impossible. For debugging we just never 
return signaled from the dma_fence_is_signaled() function when signaling 
was not enabled before.

I also plan to remove the return value from the enable_signaling 
callback. That was just not very well designed.

>
> If the statement (in a later patch) is signalling should always be 
> explicitly enabled by the callers of dma_fence_add_callback, then what 
> about the existing call to __dma_fence_enable_signaling from 
> dma_fence_add_callback?

Oh, good point. That sounds like we have some bug in the core dma_fence 
code as well.

Calls to dma_fence_add_callback() and dma_fence_wait() should enable 
signaling implicitly and don't need an extra call for that.

Only dma_fence_is_signaled() needs this explicit enabling of signaling 
through dma_fence_enable_sw_signaling().

>
> Or if the rules are changing shouldn't kerneldoc be updated as part of 
> the series?

I think the kerneldoc is just a bit misleading. The point is that when 
you need to call dma_fence_enable_sw_signaling() you must hold a 
reference to the fence object.

But that's true for all the dma_fence_* functions. The race described in 
the comment is just nonsense because you need to hold that reference anyway.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> Christian.
>>
>>> +    if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
>>> +        return false;
>>> +#endif
>>> +
>>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>           return true;
>>

