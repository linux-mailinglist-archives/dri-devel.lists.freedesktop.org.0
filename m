Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259BB8582FE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 17:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB8310E876;
	Fri, 16 Feb 2024 16:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i+8R0iTD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219A110E679;
 Fri, 16 Feb 2024 16:52:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6p4fkwTcZ7PUoh7rUrR9UwXxxIDGQeV6xb+JnhjTXtVsYphXSXaaoqCTzVxFsEH5KN48/FD+db+zXxQHw255qlRDHieh7Cav6AgLn/EIpwWFZQkiaVwZYIrpyE4hlJBcRqYfgwSA3DD5biW7/L4lwCp9F2MOCHY2KQU7Wtik0Z8JY6APq6A+tdfPtEoktwH4RVz5C7O08en3AqmkUZomMDls3hnMhJgS/0m8NopuqyMAolWRtCD5mtB67JoKBEdfW641FU1xrrbpA1FEgrrl54pkPuuZBluB9cbwiM+2Xxy6Au64oUuv2Buk+F5jwMKVgzOK+rjTLiHbqln985Abg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfdllTnhRX4n/nnk51BkSwarCXusAV6bF32PAQlWylE=;
 b=Ia1FEgKhlOW8hKlYqWoheuhBY98WctdJSzOdhDEK4t+sPPmRC/5MPm2N+RIo+2e0/JbbSgR9zsRnj7iOWr7CSfm5iYMhH0h9jOTC1RlP29eFMg9RyMnlCFOzv2DHYLhbbtUT1Tecbs8jAhZhkTCLJxMH3gmRjOFDI9SFHGy0Hl22tBTqDA8nLEAY4EXTvtqyKPDKra0rQ8WmdWIIWvaeJPmU8g+5zxasrlts7Rwx5+hlTVu8ugKAvFdZj/wl/CwJRRWxCKLzwNAfZ2fyALftDVA96XPgEvKfZnGPrN1dnQLAT2YIafrRYWvjNLhvVAUQP/WUFwjdcA0j7d4rjMJ6Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfdllTnhRX4n/nnk51BkSwarCXusAV6bF32PAQlWylE=;
 b=i+8R0iTDrUspG2fnIAKbwPQ+gKzMlMOFfzcnS968aYzdgO+9WJ+whvpTnstPV3K0P+chBefiYXbrKEamukgUz6knSoTVSiW8YTW0aIuEF/VsnjqOo3bfwpn0Lenvk2QpAS8Lli7hcBNLFww0Do0hgdPsynTTcWE07kQePXsiw6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB9055.namprd12.prod.outlook.com (2603:10b6:930:35::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Fri, 16 Feb
 2024 16:52:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Fri, 16 Feb 2024
 16:52:06 +0000
Message-ID: <b719d7b9-8a9a-42ad-b35b-145d6a835964@amd.com>
Date: Fri, 16 Feb 2024 17:51:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] tracing, dma-buf: add a trace_dma_fence_sync_to
 event
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-2-pierre-eric.pelloux-prayer@amd.com>
 <Zc-OJAXlApzcOfYQ@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zc-OJAXlApzcOfYQ@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: f60a4406-bd54-4fc0-196a-08dc2f0f9b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y5WyXNWSDX90qvIE/ua+lS+rv7mkZAjrBcKGIHsX3jEFbv47Bq/h/zBS6cFj4HNE6KTXCuqAg/uPcLcn052teAmv7YAtfzMYjCHc8F1Jl9i+3FisLj4v3PXHelaIZQqevmoOc1hY/S17gM0oOiKknRaOtt0WMt4tPHov1kkGr2Z5tlH8gGyVRdNo2/mPsVTp1VMzDJQMJawOTKgJrewB2nWjjftOXXxCWtXr4Ria1OgXpu8eo+Sxy9MYhEW6p0pOXHX+oiy60S4ZfmFqcuBwJ5DCqrrErls+aHvc48wbDRbChrNkPZ5Xk1SUpDB5kob1Z4zgPw42gI4rH6PpK96W7+b5vE7jaCc+oF7F7NeRkmvxeGndtUTsI4pNY4J1V3FhS+1ShFo8PfDeCSRArtUI31wxJRoHQQP7l+9TaGBqnjZ0ZytTPqpkv3pietJyMQoxrXUFK8BpEw3b9hitXB3dTjG0qP27gsjMvVRhyf81Hvze9LezNE32m1FPC+KXUhT2CEWP6jzkORaakSvNGsaO9583/4BmIV/rrG980tMaF/J3T7YzZZe5cW/zVN8EV5Nw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(136003)(396003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(83380400001)(66946007)(66476007)(66556008)(8936002)(8676002)(4326008)(2906002)(7416002)(5660300002)(26005)(2616005)(6666004)(110136005)(41300700001)(6636002)(316002)(54906003)(478600001)(6512007)(6506007)(6486002)(31696002)(86362001)(36756003)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXhXUFFva0xPS21mR2hYei9CUjNYZ0FPV0NuQjZyUHBscVo1eXNJY21QYSsx?=
 =?utf-8?B?SUROam8rVE96emhQZmI4K1M1OU5pLzJIVVdCTzNwZ1dub2lOS1FId0JCTVVV?=
 =?utf-8?B?M2pTekFxV29NN09tR1hESnUwNnZRUUpUSzd5RXdQeVQvT2pUb2U5eTlrYzFU?=
 =?utf-8?B?TzFXRTl2N1VoeHhoS1M0bGk3NnB5UXMrRDgySXFjL1k0NThDaUs2OUs4alhk?=
 =?utf-8?B?ak1KK2xwaWM3Z0RGekU4VnZ5WTNXRUJRWEpDdjNka1ZyUWt3cVh1TjRScm9v?=
 =?utf-8?B?bGl6ck9WS3pkenZFQzdNM2s5VmMxc0NFd1JRTE9VcHFvM3NWV0FMYU4wWDUw?=
 =?utf-8?B?NGRuZ2tQbUJMR2VZV2ViR2JOZmFRZmZBeXVmMHgzd016MlBQM1QzR1dPNXlM?=
 =?utf-8?B?WTdHS2dhZ1ZIbDJQMmpHSW9hSFhVSXkyUmQvQjl4ZjhBeGlEVUdueHFJMUVn?=
 =?utf-8?B?K1hTUnNSRi9NRDh1OGo0aEZKUFhtTCtOTno4VlBtbkN5LzYyY0ltdnVId1pk?=
 =?utf-8?B?RyttKzQ3OS81c3NaL2tXWWMvdzMvaTYvQVg4WnFwYUMveER2ZmNyS3Y2QXVj?=
 =?utf-8?B?MFB3ejlvVzBwc3BlUGFPVFNrTzVRWjJFc2hqMUVpajZRelBjUXNpeEljUnVV?=
 =?utf-8?B?WWhxTEVvK25EbWJwNGtsUDFNRHV1Um5yTitWcW5sK2RvaUlRNnVwMzduVjBt?=
 =?utf-8?B?RmtzTFFyTmppS0JZTE80cWVsamRGQTV1b1VTTmE3RkZCV1R1UWY5QzB2RWFW?=
 =?utf-8?B?dE9iSmdFajVld012c2hWSU9lV2VSVERBOGRTRUx3b2hySnFUUzFLWWVpWVM4?=
 =?utf-8?B?VnpHL0tlUTVhVnhkQnRZOThHdFFEMjFrckhPRkgzTWFhTk40Rkt2aU16OVlZ?=
 =?utf-8?B?VFRPc0tWdm9IOUROdEJrOXVNZEhzS1lBWlkzeERPeHE1RXdBSzlIZGQ0ZXN3?=
 =?utf-8?B?OHhTWVd5MkVOeWJ4azNtZndWeVBiTmdOODdWVmM3dDgvcGRNQkorTVFpVlJ2?=
 =?utf-8?B?RmMzTkxuT2pEbWk2Rkp2SFlCUjhDbWRuQjh3OG1sRUVOVjZ4c3lSM1pzbXY1?=
 =?utf-8?B?WS9lOUZIUW1iSXB4MnpKVlNTdFlPbyt4aGJFeTVxQWtlNDB2SzI5aVJuR2Qz?=
 =?utf-8?B?cjJsRkNOSnVHbjJPM2E3WnZicElJbTNXVThlOXltNkttMlNXNVNKSEd0NXNO?=
 =?utf-8?B?bk1iU2pDaVpyV0hGOXdjNHRGVFZtT1dydEs4cTdsT2tYQUIxeVEzRHRuVWZ0?=
 =?utf-8?B?SFFpMFk2ZkxJV1RRQlY5RU94OEdIOGhhV0J2SnRaR1VOVmQzQU9Oc0M1VjR0?=
 =?utf-8?B?RXpSbndIeEVDRG9LZDExTE1jTVBFaG9MRFFYNEIxa1ZLd3dzcXY3NllhOE5S?=
 =?utf-8?B?bExoVHV3SnNEZGNIYXhHWGE2T3RBZEJZaWR3NGNUUktmQ2xONTliV21PWmVO?=
 =?utf-8?B?Z0lnZDRHZnBva3ZrUE1JWTdaYURrbFdGQXNybEs5T1k2UUYyVXIvQ21RYzRJ?=
 =?utf-8?B?eWZBd0hnV2xjZHhMQ0YrTElVRjFVOGxkUXBGd0VITXI1eHcwUHpqQ0RySVpo?=
 =?utf-8?B?VUh6RlcyRUhxbm9EaHdzMml4c01oN01PN2Fka2ZtSHNiaUFYb203ZlFMNGZI?=
 =?utf-8?B?d2JpTVJsdTl1Q25zREtld2VqbHo0cVVYUEM2WDV4cDBLTzZIaTZRRm9nSlIr?=
 =?utf-8?B?cVl2eUZrTm5XOHVUL241Z3E1bitzYnM1dU42Zit5cTFJZ09hREtLR09sMHR0?=
 =?utf-8?B?Z1cvaG43cWR3eHJtRGV0UVZISUxoeUlJS3pWVVRVYnJpMnFGY1hOVlk2NmtT?=
 =?utf-8?B?MGprSkdMZ0tQQ08vV0JNaDFrYzNBeGxFNmErU2w0akY2VHdNaTltWDJlS3ZR?=
 =?utf-8?B?SWExa2Q2clcyVXpXVmxQZEZzdEU4Qkttb1AvbTJnWjkwaU5IMFdYZkhvSlBh?=
 =?utf-8?B?U3A4UDdHUW5jdmtzMm4zQVZuWmhuaVR6SEhaMUtHSStveVlnRzFQMTdHbFov?=
 =?utf-8?B?ZldLcHVINkJQeXRHSVNzd2grTjQxQkRlRFhVV3dEamJFNmhQakpuR0pRcHZJ?=
 =?utf-8?B?Mm4rNVRGeFpNWnhyZFNPV2NHSTVFMi94dVBvZVllSkxpemQ2SkptTFVXVW5H?=
 =?utf-8?Q?orqSn/2rDph22Xefc1C+eeryI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60a4406-bd54-4fc0-196a-08dc2f0f9b49
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 16:52:05.8913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IOI1SqnnORpKzwyfJvVwbSLMEoVepaojNTS8jOeT+VujEhz/i4n+ADW4Vp4q//z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9055
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

Am 16.02.24 um 17:32 schrieb Daniel Vetter:
> On Tue, Feb 13, 2024 at 04:50:26PM +0100, Pierre-Eric Pelloux-Prayer wrote:
>> This new event can be used to trace where a given dma_fence is added
>> as a dependency of some other work.
> How?
>
> What I'd expected here is that you add a dependency chain from one fence
> to another, but this only has one fence.

That's what I though initially as well, but at the point we add the 
dependency fences to the scheduler job we don't have the scheduler fence 
initialized yet.

We could change this so that we only trace all the fences after we have 
initialized the scheduler fence, but then we loose the information where 
the dependency comes from.

> How do you figure out what's the
> next dma_fence that will stall on this dependency?

I'm not fully sure on that either. Pierre?

Christian.


>   Like in the gpu
> scheduler we do know what will be the fence that userspace gets back, so
> we can make that connection. And same for the atomic code (although you
> don't wire that up at all).
>
> I'm very confused on how this works and rather worried it's a brittle
> amdgpu-only solution ...
> -Sima
>
>> I plan to use it in amdgpu.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence.c      |  1 +
>>   include/trace/events/dma_fence.h | 34 ++++++++++++++++++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index e0fd99e61a2d..671a499a5ccd 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -23,6 +23,7 @@
>>   EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
>>   EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
>>   EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
>> +EXPORT_TRACEPOINT_SYMBOL(dma_fence_sync_to);
>>   
>>   static DEFINE_SPINLOCK(dma_fence_stub_lock);
>>   static struct dma_fence dma_fence_stub;
>> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
>> index 3963e79ca7b4..9b3875f7aa79 100644
>> --- a/include/trace/events/dma_fence.h
>> +++ b/include/trace/events/dma_fence.h
>> @@ -83,6 +83,40 @@ DEFINE_EVENT(dma_fence, dma_fence_wait_end,
>>   	TP_ARGS(fence)
>>   );
>>   
>> +DECLARE_EVENT_CLASS(dma_fence_from,
>> +
>> +	TP_PROTO(struct dma_fence *fence, const char *reason),
>> +
>> +	TP_ARGS(fence, reason),
>> +
>> +	TP_STRUCT__entry(
>> +		__string(driver, fence->ops->get_driver_name(fence))
>> +		__string(timeline, fence->ops->get_timeline_name(fence))
>> +		__field(unsigned int, context)
>> +		__field(unsigned int, seqno)
>> +		__string(reason, reason)
>> +	),
>> +
>> +	TP_fast_assign(
>> +		__assign_str(driver, fence->ops->get_driver_name(fence));
>> +		__assign_str(timeline, fence->ops->get_timeline_name(fence));
>> +		__entry->context = fence->context;
>> +		__entry->seqno = fence->seqno;
>> +		__assign_str(reason, reason);
>> +	),
>> +
>> +	TP_printk("driver=%s timeline=%s context=%u seqno=%u reason=%s",
>> +		  __get_str(driver), __get_str(timeline), __entry->context,
>> +		  __entry->seqno, __get_str(reason))
>> +);
>> +
>> +DEFINE_EVENT(dma_fence_from, dma_fence_sync_to,
>> +
>> +	TP_PROTO(struct dma_fence *fence, const char *reason),
>> +
>> +	TP_ARGS(fence, reason)
>> +);
>> +
>>   #endif /*  _TRACE_DMA_FENCE_H */
>>   
>>   /* This part must be outside protection */
>> -- 
>> 2.40.1
>>

