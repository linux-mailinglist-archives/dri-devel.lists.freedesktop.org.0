Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A868548D7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 13:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE9310E797;
	Wed, 14 Feb 2024 12:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mm2aBfon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D8810E71D;
 Wed, 14 Feb 2024 12:00:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5nz+CiBRFOJOO75a9Ifk8ofHmIr0P5OyfVuXEnqxB+E4/q/KfPI9GdJcX6OpCMXVAR+RwiMydnFAOWUVFIVjUV4wYeMdq30Wyw5PzwUVu2sLPqyXPY/8nt73GkiLbqLKoudA11ug7Vfb+v3tauosBAjhKhS2tg8S146e+jjmoMG+SiEOvtNfM9/xk99EdT6W2GgvvKHReuauYKA7xI9qvCTVLa61YeQ5VEfBRZw62DOGOhW2CyVBVR5vHJgWXTET/sY+ZTIP7fzIRrH8WUjI5h7RMPuiu9Z5IVnuvLUYiQHoikiFiZpdCMcebtuIzvV3cWa+QF3khwd5LxQaiCydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPcRKGoQsXdYjknqLkiLJA3UH9YhG2j0gha5O4LTCYo=;
 b=mBK3qod+ym0vqBW7RAozUOugEIQpfAsexesLp0nTYqM8rB9rypGlXH5z376ZCo5IloJyhvrlvlJzEVgWgFDFIP5wCvaqEqfHfZsnb3vIAa7aKfAt4x4tJYsi7C+1EX+9G8xvzIO8MZBgRwuTGCHrBeHx/sg9mOC+pTf4eaT0EJdfsE079gUqLi3eq832LLH/d/nfAqzJsSz5vxpUGcTrPixN/RPyOSEJ45rA26Hyfz8tKB8TGPoqA+AkEuh43NryKza0QfAj1Muw5avp2wvavFydAweR49owCmcyOf9YQTBPPMShCtynByjbc7aZRQWaHVeUWlgrVB+VkawwyFBt9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPcRKGoQsXdYjknqLkiLJA3UH9YhG2j0gha5O4LTCYo=;
 b=mm2aBfonX1D7FiP2/SKp6xAvBYo9pCAaw3BgSYB4erre2rElNze/UIiQ+5iLIqcCD2NJaAif0u95LDNO193M7jB49k3Q0JdTKcY/S7fGl1+YEdDQGG8XcRPLfFcWDxjLCnfScxv7rVcVe2Pw+2dFQPEDQ/hvn4zyAni3virl0iQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Wed, 14 Feb
 2024 12:00:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 12:00:22 +0000
Message-ID: <137e8d79-bf19-4782-918e-0c09b029e3aa@amd.com>
Date: Wed, 14 Feb 2024 13:00:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] tracing, dma-buf: add a trace_dma_fence_sync_to
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
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-2-pierre-eric.pelloux-prayer@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240213155112.156537-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca69b8f-d76f-497e-2716-08dc2d5485c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d0IYYD8OB96mY2cQH61fr0AP5DokvsGrrIKvZ8iLI6cKXyBJTUnRaWkYkKIWfWNRkctwIpopwkK34CAw6FNOBYX7d9tqPgIKq9jSWjbiiUMwJ13mvgCFdCyD5fdfdJk4uYAxB2l8lJGemhWCa82Z8nzSV13eiSDOREfzTNo18YYkzCsFfFbxr+nhiId92nLHVhfpBli95dGJZKcumukM428KsPNnTsedouL54VWi0n4RdxW9f7TNmHMbVJPj+F/TtWu8xaOer1YqZYmp6Nm2nrXM2fapmHg9sCirRDJ5CyBR8ISR1AGgquB6OYUiRwYqsLNVu7Z8RjPKp0FPPEoJrA13iY71krcI/ztepuT/z6LSWNDmNsJx6umJnwDl/Dby60dcLsqGiM4WMadseI5se/avZRuk2B+YKycp1u4tucVVcslzp6HxhCDw8LROGgUe1Us57fkWZpCqyF1afaoNZTuw8V/D7mPBn9hhP32LBxu5jds9IkWP9i4iEyQNgdDAT1XH6ESBexVWtjI5cHxn67xtmuGbOyVHFKRueqDxP5LyMa6gyYdPzffmRpQocjQVfd9wS/mbSPySKbg/HAFIP9lYfjUUantJGPkor2GsgTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(376002)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(8936002)(8676002)(26005)(41300700001)(38100700002)(36756003)(86362001)(31696002)(83380400001)(5660300002)(478600001)(921011)(2906002)(316002)(66556008)(66946007)(2616005)(66476007)(110136005)(6486002)(6666004)(6506007)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHd5Wk5XcHFjODhjU3MrRGp1dkgxS2ZuVlNzcTZxT3hENXMvekdJT2FRblhy?=
 =?utf-8?B?OEhYY1VmYnVncHEzdEJnaTAwR3ZpdkZjYkxIOUdYMU96bUtEOGtCdVY0Qmsx?=
 =?utf-8?B?VVpYemZLRVI5YzM0WUZhSm1jRm5jQmlKQWFwNkx6bmhMTGhIbFZCNXVPOG9q?=
 =?utf-8?B?dEV0TWFBWk5MekdiRTNFSWtmem9MK21uUVNTeHUyWGtxTXVyVmxWdi9icGVY?=
 =?utf-8?B?RzFIcVpwUFJPVjlGdHdWTytmeW9yT0t3VERoMVpKbkgvVUJFQW9MQ3UvRjdm?=
 =?utf-8?B?dzNYSlE0ZUxUb1Q3eW1WcUNOQmxFYzNlM0doNCsyeXg1QnRkNmYveU1GR2hL?=
 =?utf-8?B?aTZzaUFISjFDRndGRG91d0hSeFRoaDZycnh0L045cnhlK0MzejVPbmdqYU05?=
 =?utf-8?B?RDlLQ1pPOEwvTlJwbnhDcU40MWxvMFVyQ2tEOS90bzlpcW5GMFhaYXI2UWVN?=
 =?utf-8?B?SW5rM2lHVWhIdi9OaWEraHZESEtRdUtqV3dEZVJPTVBvY3VtbXljd0h1LzRW?=
 =?utf-8?B?MHJHdnI1Q0xWMzVsVlRBK3RPaWkvaXJoU1duKzN3YXdTdjl3RitmeW0xbmdY?=
 =?utf-8?B?M1F0V1dwZ3dmZmpVNklzblRYSkVCa2NkelNGekRwUEFEM0NoVHMvR0VvYnJP?=
 =?utf-8?B?WS9yZ1IwL21ybmhuOUt5aThSTHFhZ1ovTHhybWRvNTZCNW81UHFIdGJLUEhI?=
 =?utf-8?B?S2FhRFc4SDVXK29KaGN1cEVWK0RwRDUzWGN4bzlWMnhYY1gzaGtieGRLWjlZ?=
 =?utf-8?B?b3lLYTltSUNwbTFXRUpqVHNZS29IRWtHTWhnYUF2SENqQy9ZaThScG91L2xC?=
 =?utf-8?B?a0tkMFVUQW1VSUJDejFwbzVPY1E0L2packNmZnJ5K2hSRGtSU2dxa29vZndO?=
 =?utf-8?B?bS9Vc0MyL2JqNUlTZzFWWlg2NFBVS0ZTdHpzSjdNZTByQzJobW5jdU1VcFVX?=
 =?utf-8?B?d0dzRXM5MlJGUStUNUhhTTRhWVlLd3l4Y3ZsQUFzeXZTYlFDd3pzUWxyL2Y5?=
 =?utf-8?B?eHJBM0J5QnVxMjZzUkgrZDloSUR5alBRenNzemRrYys3S2VtWEZpUG5RdHlj?=
 =?utf-8?B?Zm41S2pDMkZiUlBsTjluSkhmQkIra3dyZG5oT2dVWXBHbm0yUllxN1FQSXEz?=
 =?utf-8?B?KzBFY2VLOFVBemhrWm1JYXNQc1UrN2JodThGUHhkK3BoUEhqUFk2WlJDcWh4?=
 =?utf-8?B?NzRBN2tmbGpSd2dualdzcDNGNnNxa3B4bnlmNk5ST3lsa3JmNFpFQ1dNUCtU?=
 =?utf-8?B?eVhLb0N6bVUySmRrR3kybCtTVzFjTDdFT2EzNFh4bElwYzF6YVg0UGorOHda?=
 =?utf-8?B?YUtTSkFpUWUxakRDVkhVUUtpNDFjVGY5dVhNZnIrVit5ZUthNFFEK0p0K3RM?=
 =?utf-8?B?ZmF3bzdkMmN1YUtNOHQ5ZzlETTlqZ2lKMHNFdVN0ZWJLcGxzZVh4VFdUQmNm?=
 =?utf-8?B?aDNtR281K3c3Ry83c2pnMmR6V3VQajNVanZDcjFVYWh6K3Y0Qjl1TW9vbnlp?=
 =?utf-8?B?RGVXMnVidzVsb09LaGNONjdVdWNnNjYrU1g0TGVOV3ZHNGpjUk0wbjlMdmtZ?=
 =?utf-8?B?RnBKbkRjaXd1UGtBUVlCRUthRTIvZVBoTkJYR2VrQll0UjNzSFVpZFV2dmNp?=
 =?utf-8?B?WFJYMmJTTUlSU1hCQ0Y3R2hqeTgzNm5pWFdGdzFOZUxMTkNBVi8wRk9mMmdD?=
 =?utf-8?B?SkV3dy9YeGp1MVdJSk54Z1ZaYXlCZWxrcGRZSEpyK05YOUZSdmZPVSsvM1Nk?=
 =?utf-8?B?M2V3Tmk5d3pkaGsvYkJRYzUwV3hVdFhIY25iU283dHhhL3l0UFFZMjVRS1Ri?=
 =?utf-8?B?WXA5cktPR3RWRmZCMFdMOXNSaHZyallhMEpYZ0tqY3VNUE5leVA4UU1FM0lI?=
 =?utf-8?B?WCtzMmZ5OC9jZ3ZEQzRsTGY4MU9wNE1vYVJkNDhhUmI5QXQxQXdOOEVPSUpw?=
 =?utf-8?B?NkRRQW93M0xIYlZJYWUrU01LTGkxT1JCQkcvcXh1bUl6RTlRcmpaQ1dHOTBs?=
 =?utf-8?B?OUdVSDRwOHZ0NnExK1ZxNXNMMW1FamNiYU1ldG14ZGxySUJlYTZ4YWZrYTRx?=
 =?utf-8?B?V3R0SmZvOFFZaFgxT3NDbGx2SjBSMVV6RnRvRlpHTXk3MGlTR2ZIdzRJbGtH?=
 =?utf-8?Q?Stumm2bR88Ve6MX1yP+uMto9S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca69b8f-d76f-497e-2716-08dc2d5485c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 12:00:22.7411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NWzBkx5LqEkZADJrXbAPXsLtZgtFyEGWMEkOsWMyTHQtRt32XQWu4/iDppzfOfB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442
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

Am 13.02.24 um 16:50 schrieb Pierre-Eric Pelloux-Prayer:
> This new event can be used to trace where a given dma_fence is added
> as a dependency of some other work.
>
> I plan to use it in amdgpu.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c      |  1 +
>   include/trace/events/dma_fence.h | 34 ++++++++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index e0fd99e61a2d..671a499a5ccd 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -23,6 +23,7 @@
>   EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
>   EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
>   EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
> +EXPORT_TRACEPOINT_SYMBOL(dma_fence_sync_to);
>   
>   static DEFINE_SPINLOCK(dma_fence_stub_lock);
>   static struct dma_fence dma_fence_stub;
> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> index 3963e79ca7b4..9b3875f7aa79 100644
> --- a/include/trace/events/dma_fence.h
> +++ b/include/trace/events/dma_fence.h
> @@ -83,6 +83,40 @@ DEFINE_EVENT(dma_fence, dma_fence_wait_end,
>   	TP_ARGS(fence)
>   );
>   
> +DECLARE_EVENT_CLASS(dma_fence_from,
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

Those are 64bit numbers, only recording the lower 32bits isn't enough.

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
> +DEFINE_EVENT(dma_fence_from, dma_fence_sync_to,

For a single event you should probably use TRACE_EVENT() instead of 
declaring a class. A class is only used if you have multiple events with 
the same parameters.

Then the name dma_fence_sync_to is not that descriptive. Maybe 
dma_fence_used_as_dependency() is better.

Then we should probably wire this up in the DRM scheduler as well. See 
functions drm_sched_job_add_dependency(), 
drm_sched_job_add_resv_dependencies() and 
drm_sched_job_add_syncobj_dependency().

Should be trivial to add the new trace point there as well.

Thanks,
Christian.

> +
> +	TP_PROTO(struct dma_fence *fence, const char *reason),
> +
> +	TP_ARGS(fence, reason)
> +);
> +
>   #endif /*  _TRACE_DMA_FENCE_H */
>   
>   /* This part must be outside protection */

