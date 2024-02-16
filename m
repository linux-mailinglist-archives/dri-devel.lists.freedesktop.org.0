Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332008580F8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA67310EB15;
	Fri, 16 Feb 2024 15:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KYJF+avS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1229810EB15;
 Fri, 16 Feb 2024 15:29:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLVzVa/kwvmEGS/MKP6s7ltPSwLCOB2QSvf5050ja3AIMq3IMs6njhWcSbj8bL7wQucroQIVDHUE79iJIJm9XI6zTka9fA3vCHAtRFVVmIY8y+Vm5LkLG2GeRNEp2/fFmkNjXohiihP1LMtacjt1lD9DEqrBeao40VaHNGqrsg+0dVXk41oyIMnBbWI1OxD9TnwiPGqJ2aKNmz9MSCduGTaPik15QBmT6lnQsREM6lPlq2jnjwQg5hYkX6prhsG3lQJjI8oWjgF9VXzJKH1BUXrYfnZIzU/dqeVgLGGBBkft+BDmvWAZBkyVu5lleKzEsTv0HYE21l/tYpCTN4+OVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ajlpz0K86e+5PtIxDQZ13IG7EUVyif4r8nN34/N5i9Y=;
 b=EBOsTLhsdIDQgyHJKejFLQJQbY1bwz3xwQJp5yOKYiejASmZm6GH2sRQgCDWJMOYQaqoz/mbw3HbWtm4wWb7jDr3zFRtSYEKkYk/CM4TthsRI7qIlgoQ4r1GxAxNL/1no5krgdv6gxMWFhwfdP9U4WbeegW3YJ0TRRhaI1gNyWhLHMEgtOp7HKpbMo4Wuyg3Rvh+hleZBNPI/L3Ph8SwPsB05I6muSi1/IoktxSFLD3Fv4dkuXoy3or+9qK1+k+CW70zkvVqWu0/tjcAbtiGjWQqspNlN1IeUSzP7Ki2QgewPDsmNW8cFM9Kt7ty065IcelJ9cJrQXzK9d1Yv3julA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ajlpz0K86e+5PtIxDQZ13IG7EUVyif4r8nN34/N5i9Y=;
 b=KYJF+avSE66MvZe7nGAQ0oBosLp2T60p2yZJ44HqjyuvGrZAOunjiwdSaxjiu5DL4fQriUv9F42qBEsp5Ebnu84wRbsIT+oTdqlJJiSxN0TBi3nLP015uH2FXBc2UU1uURo/QOV2+uTVDJHSsAgsqY+wHZ2RkDX1yB62zPIgbQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.12; Fri, 16 Feb
 2024 15:29:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Fri, 16 Feb 2024
 15:29:03 +0000
Message-ID: <d7a4f812-5dc0-4d7d-a070-a6d13be96025@amd.com>
Date: Fri, 16 Feb 2024 16:28:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] tracing, dma-buf: add a trace_dma_fence_sync_to
 event
Content-Language: en-US
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
 <20240216151006.475077-2-pierre-eric.pelloux-prayer@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240216151006.475077-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: a4536469-e8fc-47dc-3027-08dc2f040176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DoCjraTy4wbw13Jagj+nq7V5biXwwEByL+9h+Nym9PuyF5GtEYdwl6BwH6ybogCM1rhiE+oTk9ed3MQbD+5ftBqXDIWwpHaIQwFnl3L8nQyYwhEKf0/IS0d31j0+oFLGj7tmKjdx+AfSsQTKcRURyqneOh0vg8+9+sqhpLyFZ7vPxVdMwTrjkVmeL+hOmWIZzlhJquej9QneW3U1YLxZur7xJg0rbdQwUEiEOXPuF6/6junZxi1JZnaezzas38qwISeA0buK8DA090wTE9r52CIE4B1EnxL8AU3rPwyx2E+3vGXZbsQV5J53a99JPRqdW/CbcHpcZP+4hFcObQsvPEsuorqbEfzUWGzsp97UPiPJ1SLrhO7PP9NtDmma510VW4V8bpQNmNamZ61JcTDnfsxMooLYiuBR30JiEcEOcsANwQinDm6MoFc1jQ3sG7k1sYe/y2kWqgRhXkIDwwbiOWAOFHBcv2leHQKksmEBfTtIpQGbyfeDRtrEgeROUWkHIegeQ6ZlT0dzUYBVynQIzsHZAs4Odjhy40h0Ba/w+2DNMQteIiuJ5EK0/Uvj87fpc5o278z3EPb7JTDOJAkigcEWg3yZEkjKhcYVw/QWxwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(31686004)(6512007)(6506007)(6486002)(478600001)(2616005)(41300700001)(316002)(2906002)(5660300002)(8936002)(8676002)(66476007)(66556008)(66946007)(110136005)(6666004)(26005)(83380400001)(31696002)(36756003)(38100700002)(921011)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjZHMVhrTDYyVGU4U3JLZldDMHY2ZFVYQUtDRS9IR3hTZHVUOE5IeXJQaXV4?=
 =?utf-8?B?VGtYemJSWFZTa3FMaUd5M2JLd2ZDQ1RtUDh1VkVDanZHb2VwT1B0N1BpRmc1?=
 =?utf-8?B?NnNWTFB6MmRENENZOUY3Q3ZMV3BkbnRkOHdPZUtjSitmTFNDamNYeU13b295?=
 =?utf-8?B?Ry90ZlFxNmdGLzRIQmpqRkFGTmVkanJzcmdNMW4vTEpGdEd5SkpOWTcwb2JH?=
 =?utf-8?B?R0tJTkQ1U1oxYjJLVmNjc2xPY1pESmJ0RFVwK0Z5RjNjcjZtdzFwc0pVQktY?=
 =?utf-8?B?VmE0V3gxYmU1NWNXZ1JpZHBCOE9SQXV1TTBIdHBnTW5aZ2V3ZWs1aWZRcGJ1?=
 =?utf-8?B?NlFYbHY3bk53ODNKaTdhYTFaNHVrTXBvOUMxc1VRd2dkcWtUTVM5VEtiSGZZ?=
 =?utf-8?B?R3hLMlZmeVpQazlwMjlNNXlJbnNMamtGV25QNjAyWXhMem1ZSjZBMGg4M2xM?=
 =?utf-8?B?TUtjN1QzZUZPM0RtczB4NEY1U0NnV0Vyb3hLTVQ0ZkNkekJpbXNYN3A0emFP?=
 =?utf-8?B?dDlodjZEZUlQUWZIR2drMDFZeXlWTXBiSE9Eb0hMMWttaUVUQUFVRDhGdVJG?=
 =?utf-8?B?azd0cjNES09QOGNkcURabmwxb3B6dG1Jd0Z3dml0SGxFQnhINmpLK0I4aHNa?=
 =?utf-8?B?K29YNFRZTGRHUUhibDNiZ1llYzc1UXlCaWlteXNJam1ZK0RRempRbWV6NU5q?=
 =?utf-8?B?Z3JnMEZuTWJBUmZsMzliNXBYb2owUkFwSjVBWUN1cGM0cnpGQnQrZmg5K0E1?=
 =?utf-8?B?Ym5odTlHcWdtVlRCdW4zajF2VGRXMVNqQjRya2lpRkJWVUw0aWR4OXZRZ0ky?=
 =?utf-8?B?eTU2Nkk3QUdEdEFWeFpJanJ1WWhGVDJ6UjEzblpHbVdHbEZpcS9scENTNmZ0?=
 =?utf-8?B?OHVKdnV2eVcvT0RsY09sYVpTZXdnY0VlMEJNRS9GTmxYeWtMR0M0L0h5a21O?=
 =?utf-8?B?aGEycHBXdVBwdDdjV3dDbnJ2NkFlNHRnK1drczAvSnFzVlBsajJLMmFYQ0x3?=
 =?utf-8?B?VWJreVBXQzVBSk96SEp1Sk4zQ3F6RGZ2YWoxVXhySlNsNzFnM0U5RG9LTVFs?=
 =?utf-8?B?NllqMUJIOGUxcEJLWXB2SVEzSHM2VTdydldXS2FHcExCdzlFaWJuOU5pSXVL?=
 =?utf-8?B?TVNia0tmYVUrcDZBK0VIRHgzREh6TVZZWHJxTnhEODZLZTZSNlp4Yk5INUpC?=
 =?utf-8?B?RitaaTZGWlAwcGM0NWtOeC9ZYndkVWVCbVdaVFU0U0ZuVWxYWFZqZDVaWExH?=
 =?utf-8?B?ZjlndkNxNGMydmxrM2RrT3MzNWgwNHY1dVF4UzVzYndlTW5YV05XSjNzSzV6?=
 =?utf-8?B?bVhJTmtuc0hkSm9rUkxmaGNMQWRVTTFQbHJuRWNzbUdneklqdS9JM2FWWFZu?=
 =?utf-8?B?bUQxVTZPUG5TWk0wS0t0ODFCTk9YOGt2RmRKRllKN2tzVGJkUEsyNDcvNk15?=
 =?utf-8?B?aUdjbGlrSWthMXhXaXZwSG5lK1hEU1ZFU0ZrcHJwbkJDV3FWNlBGcWZSeVNm?=
 =?utf-8?B?aXpFR3o1Slh4N2psbHcvSFh6ZXpJQ3E2bWZRSlZmSTZCbnJNSGc2Smprb1ho?=
 =?utf-8?B?V3BFMzFwK3hDcXVLeTZYS24yMVYxbzh5aW1zQmRzdlhnaGxSTkl4STFMKzZL?=
 =?utf-8?B?R3VaQ0xwM0dTRm9HZ1cwcmRWbXZsK2dZYXVMTmlsdjk3OWNVRzdtZkZsaTNQ?=
 =?utf-8?B?TW5acXltQXBTYzBpbSt0c21YWVJ5UHUrTmFkV25pYkJxN3d3ODYvSStsN1Yw?=
 =?utf-8?B?RlFpaXlmNGU1OVNEQncvK0lrck16R2x4NXY2ZlFkSExxUllIdCtQUXpUZTlz?=
 =?utf-8?B?TGREdUUzQm5jRkRpa0lBQmtRM2ZrR1JOV0xOV1FuZ25mM0tHa0txVGZDRTE2?=
 =?utf-8?B?WDBWa3VwSm92T0kvaDVFTW1DcFNuUzFDcUU4QTdmSFpiR0JNdWozeDNINWNN?=
 =?utf-8?B?NHgvUXQ1aENyMEVvMUs0NlhkTWt4VnNyV2Nvd3dFTWNscHBibUpiMG5tZjFF?=
 =?utf-8?B?Rm5ZOHFocitscnRHSFVLWGZhQWJNcWszekJ2ZGpiZGRrSG53bXYwRTI2cmxD?=
 =?utf-8?B?N1o4TkxzYmcza3kyVERrc2g4U0RlVStGbHl2Y0lsa0IyZ2xHQlFFRVFQWXIr?=
 =?utf-8?Q?wNiCioXdKHk9e/C0fo/f9Lxrq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4536469-e8fc-47dc-3027-08dc2f040176
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:29:03.3508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvCOqeBZUZO7/9vaM6oetUdH5zXtnE6qWjOTdwQEuA2NO9ZL9Npzf37zMmuGXwfX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770
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

Am 16.02.24 um 16:09 schrieb Pierre-Eric Pelloux-Prayer:
> This new event can be used to trace where a given dma_fence is added
> as a dependency of some other work.
>
> I plan to use it in amdgpu.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c      |  1 +
>   include/trace/events/dma_fence.h | 27 +++++++++++++++++++++++++++
>   2 files changed, 28 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 0393a9bba3a8..e7276c043984 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -23,6 +23,7 @@
>   EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
>   EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
>   EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
> +EXPORT_TRACEPOINT_SYMBOL(dma_fence_used_as_dependency);
>   
>   static DEFINE_SPINLOCK(dma_fence_stub_lock);
>   static struct dma_fence dma_fence_stub;
> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> index 3963e79ca7b4..5a5d272031ce 100644
> --- a/include/trace/events/dma_fence.h
> +++ b/include/trace/events/dma_fence.h
> @@ -83,6 +83,33 @@ DEFINE_EVENT(dma_fence, dma_fence_wait_end,
>   	TP_ARGS(fence)
>   );
>   
> +TRACE_EVENT(dma_fence_used_as_dependency,
> +
> +	TP_PROTO(struct dma_fence *fence, const char *reason),
> +
> +	TP_ARGS(fence, reason),
> +
> +	TP_STRUCT__entry(
> +		__string(driver, fence->ops->get_driver_name(fence))
> +		__string(timeline, fence->ops->get_timeline_name(fence))
> +		__field(unsigned int, context)
> +		__field(unsigned int, seqno)

I noted it before that this needs to be an u64 and not unsigned int. 
Otherwise we will lose the higher 32bits.

The existing trace points have that bug as well, so you might also want 
to provide a patch to fix this.

Christian.

> +		__string(reason, reason)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(driver, fence->ops->get_driver_name(fence));
> +		__assign_str(timeline, fence->ops->get_timeline_name(fence));
> +		__entry->context = fence->context;
> +		__entry->seqno = fence->seqno;
> +		__assign_str(reason, reason);
> +	),
> +
> +	TP_printk("driver=%s timeline=%s context=%u seqno=%u reason=%s",
> +		  __get_str(driver), __get_str(timeline), __entry->context,
> +		  __entry->seqno, __get_str(reason))
> +);
> +
>   #endif /*  _TRACE_DMA_FENCE_H */
>   
>   /* This part must be outside protection */

