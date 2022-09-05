Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3596B5AD59B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 16:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7C610E3FB;
	Mon,  5 Sep 2022 14:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2063.outbound.protection.outlook.com [40.107.96.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FE710E03B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 14:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8ApC/5uZ7oi7rnZHDTl04As+0sjPs62JYiSU4f8RXATi7lNp4phhO/6cAKS7Jx4Nc4H+lTxlVgpx+WjmnwuRoshGcD/JSY05icpOXutfa0A63C4YBw/JLj66eGF95PoVEKthv0mtZEAZfZqIK93TLN45qhJ1wHLY2+Nrdh62xgwqDwpI3EWYvqxOWM35ore0RoNq3bteW3Q45z+uj+9719QtNKsK71IIbm0N76b5Azv9Qf6PoV7b1Rc0VkEK8Dp6I18RtsOhmSP1dEbjUEiCYIhKXJrdhJcRM1vWIeQhyL4Nt5kxj2N3XZauNc3XDlI2PCRoaQK2cMxAGNqzeIYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+56O7ZwNu/V60IlYufm/5s2EWbglvy6wmv0UQMJofm8=;
 b=Mf4B3Oy48zg72rgeNkVf0ORj+VWC0+397lyb4C7qeNFSOwANi5MLPVDtFUWDFRbhcKymCdKQG0lshN58BhG8j0uJVpSzCrdRpTrRzECJdYMV45lnIWf6fWS+llbPRirMKED/v3nKpSsnD8nTBtfVrXetZR2I83i1qhMPwNizRcIaSoX9QzB/nCZWB004GxCWpTLhMiad2+r8tRJ+illuQ+4lCBBO2HNEInG1LHLShRN6HLxaD1vzOOADjCI71EuzTJ9/4HEPKTZCwnj4vXudJQ13wX0a08r6jhG/VfrRrYs+cxdWFV9nhLBD0CK1VHGDgR1bQXUAlple4Df2xceK2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+56O7ZwNu/V60IlYufm/5s2EWbglvy6wmv0UQMJofm8=;
 b=H0JckgeTGhgRAk4WRvLka113rcOdnKD9gTIAg4BzVLGfkrtK3ctarB1yTU3PmyDiWOBZrVgG+xPONZ2vik19+N4jmBfUxsRgcC0vDRBSR3xXCBujFnIXqCyhFEfGoaw4yx6C/YDRcWwkYe8HqfUKAf8tZeTfAaiePHZLMOROS0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 14:58:22 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::2e8f:6161:3959:aa0c]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::2e8f:6161:3959:aa0c%5]) with mapi id 15.20.5588.015; Mon, 5 Sep 2022
 14:58:22 +0000
Message-ID: <979c371a-6210-161b-3541-ace6d68ef1a3@amd.com>
Date: Mon, 5 Sep 2022 20:28:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/4] drm/sched: Add callback and enable signaling on debug
Content-Language: en-US
From: "Yadav, Arvind" <arvyadav@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220905105653.13670-1-Arvind.Yadav@amd.com>
 <20220905105653.13670-3-Arvind.Yadav@amd.com>
 <96d14c8a-e3de-fcea-b3b1-434bc6a78ae4@amd.com>
 <5b84f7c1-99a6-02c8-2606-8986891a95b0@amd.com>
In-Reply-To: <5b84f7c1-99a6-02c8-2606-8986891a95b0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::6) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26ce0c7c-3715-4e97-5dd6-08da8f4f1354
X-MS-TrafficTypeDiagnostic: MN2PR12MB4302:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KkOZN/jnv6hdPQ58R8AgCOj3/bDjTWNZ05+ywJ4Zm4ojwG4L1fhFBiwBq27tOMQ9ntUPlbwQNdSBhsBmKfqZ0E9NI7o3Ae7K8aNcJIR7YanMp3hl8NESpzYx0WAVCw20EMNYIL9Tv1EyoShZXRWQT7m5fU5kxuM/ibI1nfChC2Cn0axAzShWuwHcVDoPG/0V4vmtlAHt09rtc1QL2jmgTUXYr8rQEDNjAagoSWYGBDYPqx97q6Z7bj3I6/3R1gG6fFjkmHPl3HAargzlfoBr7MaQctSHqn9rVAx9NUZeuNmZWQjhRmosERMQFa8oFK0pcGKO8uMRGAohDLUANaj/JW0W6lD4FbVbCZ8XHy6ypePuKzzwiY8stxGUjkg1ApMljLOnVhaEXugQmyfXvHkbeckSbZTJKFqANukI26yjTc0HXWA3m/wtfCv+w9SUC2y9GgsnY+OSXWoRWO/xCMquDmfV6zObm1ln5/iTtrCUWkVkr5SV6yKjijT4KE0eCKwprS1WwC97A5VFqai+boeZ3dsKUsN3czUF2JaVNUyrNasvl8l+5hfDuvF0OrRikoWlv3RGeogysBUmoutB9tQV+C7NLAuOxSLa9XL1CI9OzqOCnxofdhvqrvXK8HFjX5+MLmVe2ysp6NZMK4mXkW7/E4+UG3SZxQU0C9y4a9eL8KvtEOOR5NhOqWP4ros5HX5HHM30RhKOlJ2tqC+7tGypLA3j70YKQUwQkVhqb8yM0TyaprMp81oBj6Lw3z3gpAMnXAfth0L/CtltTuWqQIui/eZznJU9w692RhVTIgf0fLxPZAj0muMoJuh06ah8K0yP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(66574015)(186003)(921005)(110136005)(2616005)(83380400001)(316002)(31686004)(8936002)(26005)(6486002)(2906002)(36756003)(6512007)(41300700001)(5660300002)(6506007)(53546011)(8676002)(31696002)(478600001)(38100700002)(66946007)(66476007)(6666004)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDBkNk10TWpXcWx0Zkl1Mmw2MGRUbXNCVW4zUnFybjV5Qk1MakdPSmVIaVNj?=
 =?utf-8?B?eFZ4STlPTk1taHJsWUVubHR4cCs3WENPaExjVWJqamdSUTNiVUx3QjhNT0lO?=
 =?utf-8?B?Z3dZMmNHbXBIdUJTMC9NcldxZzVoc0pIMms2LzNkUTJ6NG1WMTFFRjFlS2JY?=
 =?utf-8?B?c2lVLzFRZFNIeHpTNEc2aHdZTWJYRVVXUDkvSUJJSXlhTitieHhOS1M3eTVT?=
 =?utf-8?B?cjJYdmdqYUhuOFRFME1LVnZ6N2pEbWlkT3dUT01zREtUNzBQSWUwQ20zY09Y?=
 =?utf-8?B?RXNsL0NuU0x6bGtCb21qeU02TjBVVWYvNVNFcnV0d3IwSkdRTU1sVHVmR3d1?=
 =?utf-8?B?UVFqUS9Gc2dUY2NEbEpOcEpuQmpyVUozZjBNc1lpKzVhV3R3YXpqaEVYTjZM?=
 =?utf-8?B?cWxQbnNoUTVibm9qRWswQmxyOExDaDB0NnFnTU5nRXZIUVdoS041Q0FrVTh3?=
 =?utf-8?B?ZjBYZmdEMlV3RWNQQ2JNRWNmT0dodUVNaHp5SFNRNkw0cFFuMnFGMHVzRmxP?=
 =?utf-8?B?VFlPaDcwVGpYRklmMVR2TnM5SzVTWXJONjVuMFVta3FlYzJmM1lOd2tNUzNV?=
 =?utf-8?B?QVltZGROamJ1a0UwUlFkRUt4Sm1lMkFyL2NTS2d2enVPc2FMK01WTVhhNHU1?=
 =?utf-8?B?QUtORm1QaDViS2l4SERyaVpqSnBOc0pRczM0Mm12QnVmc3dEZUhPUG9SQXcr?=
 =?utf-8?B?VDl3b1A0TldnZkJVSDI3Y0NSR1hGcTZGN0ZJL3NSd2VOb1lXdUdQQk55Nmxp?=
 =?utf-8?B?SlczcW9TaE5vOGx4YjhTN1pyeEM1WEdSbWp6dzRHY2NtSHgwRm5VWGRxYzJU?=
 =?utf-8?B?djNTWnBZSEw4QmNNUVZheWliZlBKQStpQnF2R1dMUzJ1cjd6aDQzMHd4N1cx?=
 =?utf-8?B?QVlyVGo1aHhGSnFxdlE1TElrRVo3OFlqTzJzYVkvdnJ2cFIwRkpXTGo0ZEt0?=
 =?utf-8?B?SEM2VWFCb1E3NkFvMlQvbkZmdlp4eEVjYkF2L002d2ZTbHY2ZklReGFoREE2?=
 =?utf-8?B?WklUQjVhK0VjbENrckFRYk5LdThLa1ptcGtjeXFWcEIwYTlaYjVTU0dhMHpD?=
 =?utf-8?B?VE1FRy9mRTFpN2NiNlFpMzRTaFZqODdSNkxnMmYzZksxWGF5YXgyZ2R3emkx?=
 =?utf-8?B?cjdDRHFkRGxxeWhKRklKdEpiMWxwSGttTlUyZVh6V29LQk1mRnhMNFVuUjlN?=
 =?utf-8?B?eFppQXI5Yy81eG1aT0FMQXV3djZNN2V4WXNSdTdQMndKYnJIQ3h2SVpsZVBD?=
 =?utf-8?B?ZFh1bDM2eHlaRGlZYzFWWHpNOTAvcDJjS1hTcWJTWGQ3ZHNISDgwZHgrRHor?=
 =?utf-8?B?dWIySXFFcENpOC9oUXZPMHdnSkFqVUd2SDdwYkRTcEJYcGpoS1psTnFuTEZU?=
 =?utf-8?B?WjVrb3hxY3F0Q0JieFJ2ajl4ZTJrWDJvVlp6Q2J5TFJ4RUVvOVRzZm9wMTVT?=
 =?utf-8?B?WmYrazlTVVpPaTRNTkV3cGFLZm50bERjK3Nob3hUY1l1RmxXTkRTUVJKTUQ4?=
 =?utf-8?B?Zm1ZMnMzR1owNnNtekRiaFhhWDlyTDRhcWV2TFQyM2FnVXpIYW1sbjYxbWhq?=
 =?utf-8?B?eWhNYmZpNkJjQmhZMTdHbFdDenZJMFF3UlJ4YTI2TytxUWFMZUZsY29mSkxQ?=
 =?utf-8?B?Ymc5QlNzeUhPM05DRHpqYndyaWtEZWpna1p3SDc4cC82NUJSMTRWNFlHNytx?=
 =?utf-8?B?SlR0YzdkSTgyT2NWVUpzeG1XeVhvK2dMYk43NFI1N2N2SW0yVUMvYS82VXhW?=
 =?utf-8?B?SmhXU1VFdnl3V0lISERuYlhKc2pxdERsSjgxWmFhVXlNdjVxU0UybjlSV1d1?=
 =?utf-8?B?YjViZHYvZVR5aGJIK3UwQ2pDK2NSejBINlQ1NXIxdUg5V3pLdG96Q2lKN3p4?=
 =?utf-8?B?ZUtOTDFBUTU4aWhzd0M3VHlHRldCTnRHbmhobHl6bjNnTGpIeUttN0NYMURI?=
 =?utf-8?B?emxlVEQ1aFZtbDBHVFRnelBDNE5QVWVFQW9SVVJBV2ZOb2hORCs4MFUzWGFN?=
 =?utf-8?B?ZHludUFJOG1MaTR3bERxMktZS2drQis3RmM1bUREU2paQ3ZZb1FoN3AvKzcx?=
 =?utf-8?B?cVpmWXp2MmlwUVE1L1hqS2lnSzNGZWhic0VxMmhRZElVV2pmMk13TlBJU0hP?=
 =?utf-8?Q?gkrr6Xs1rreays3Sy6mdxe86j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ce0c7c-3715-4e97-5dd6-08da8f4f1354
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 14:58:21.9258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4ywl8MsPNkrvedwLIHB2G+67UsY4NrX+Z8W0Pmo7AfnkFuSoEvyRJDGb3BUBd6PqyJ56Y9ZKUluovgs9h3IuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
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


On 9/5/2022 7:16 PM, Yadav, Arvind wrote:
>
> On 9/5/2022 4:55 PM, Christian König wrote:
>>
>>
>> Am 05.09.22 um 12:56 schrieb Arvind Yadav:
>>> Here's on debug adding an enable_signaling callback for finished
>>> fences and enabling software signaling for finished fence.
>>>
>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_fence.c | 12 ++++++++++++
>>>   drivers/gpu/drm/scheduler/sched_main.c  |  4 +++-
>>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c 
>>> b/drivers/gpu/drm/scheduler/sched_fence.c
>>> index 7fd869520ef2..ebd26cdb79a0 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>> @@ -122,16 +122,28 @@ static void 
>>> drm_sched_fence_release_finished(struct dma_fence *f)
>>>         dma_fence_put(&fence->scheduled);
>>>   }
>>> +#ifdef CONFIG_DEBUG_FS
>>> +static bool drm_sched_enable_signaling(struct dma_fence *f)
>>> +{
>>> +    return true;
>>> +}
>>> +#endif
>>>     static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
>>>       .get_driver_name = drm_sched_fence_get_driver_name,
>>>       .get_timeline_name = drm_sched_fence_get_timeline_name,
>>> +#ifdef CONFIG_DEBUG_FS
>>> +    .enable_signaling = drm_sched_enable_signaling,
>>> +#endif
>>>       .release = drm_sched_fence_release_scheduled,
>>>   };
>>>     static const struct dma_fence_ops drm_sched_fence_ops_finished = {
>>>       .get_driver_name = drm_sched_fence_get_driver_name,
>>>       .get_timeline_name = drm_sched_fence_get_timeline_name,
>>> +#ifdef CONFIG_DEBUG_FS
>>> +    .enable_signaling = drm_sched_enable_signaling,
>>> +#endif
>>
>> Adding the callback should not be necessary.
> sure, I will remove this change.
>>
>>>       .release = drm_sched_fence_release_finished,
>>>   };
>>>   diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index e0ab14e0fb6b..140e3d8646e2 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -961,7 +961,9 @@ static int drm_sched_main(void *param)
>>>               s_fence->parent = dma_fence_get(fence);
>>>               /* Drop for original kref_init of the fence */
>>>               dma_fence_put(fence);
>>
>> Uff, not related to your patch but that looks wrong to me. The 
>> reference can only be dropped after the call to 
>> dma_fence_add_callback().
>>
> Shall I take care with this patch or I will submit separate one ?

This changes was recently added by  Andrey Grodzovsky (commit : 
45ecaea73) to fix the negative refcount.

>>> -
>>> +#ifdef CONFIG_DEBUG_FS
>>> + dma_fence_enable_sw_signaling(&s_fence->finished);
>>> +#endif
>>
>> This should always be called, independent of the config options set.
>>
>> Christian.
>
> sure, I will remove the Config check.
>
> ~arvind
>
>>
>>>               r = dma_fence_add_callback(fence, &sched_job->cb,
>>>                              drm_sched_job_done_cb);
>>>               if (r == -ENOENT)
>>
