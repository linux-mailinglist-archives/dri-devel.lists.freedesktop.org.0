Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 710CB7504EC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 12:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0CF10E4CF;
	Wed, 12 Jul 2023 10:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EEC10E4CD;
 Wed, 12 Jul 2023 10:39:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjTmHm4nROvQQVPrGhteifQcW3Qsio7Kbh6+WXmujVDE1QIQPq60BHlWIC3B96fScYNvCwkQEHPz9RiAWftLw6R22J6zr6HtmgZRDmrEisTrToQd0I7O72qw2Ix5ud0f14Fom3ypZ9s8w0Pp70DjInlkofL1ymL0v7QOhlYBqEEV5kihTmE3fE/cUkSGVrXC6TDr75QwbSFb0Bm1DHIBdTZJcFIHJ90V7dMNMAPaFgoEWUbEkSYZcI1ar++WDCalDzx/lt4YOpuFdOdUcdIuU4Srrgd4KUSpVuC9EdSqQLGrs3+bXcFxc036tb6jks5feBvnDB9CN8UAE7oMjEE7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmNVkqZSuiSUU8o7FzEg3eNdUhkXGWHhhxtrqSV0GkE=;
 b=jCPUEX+CTL9vNiHWdKl96u5xnYiHAr0wRrlIQxLpojrYBBpPIqx2+7Zay6NW3vzlw38r9jbfn38Em0bEskOwpmGPxQNqR2q1D6frvN8zUit6+SIM3nr4+nArqzCet+kvfJuGDY5rKUu332yf0hm0iixKTjyC+JBQBg3juL6c29SsNiMEDB0eWbxdtgCs1qU80Ke7aD3AJXxeiePVpZBgrXOEZUCK5emCELIq3qLbqDy1mSFkvb3NoBdOE/hWVv76J32oPgR5s/z131ZgdoV5PfuArXCHzRqCwwziXT7fFQpz0qNXd8rP2OOPNh/1sTtg9l5gBy+MKH3yX2UZN5Nd6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmNVkqZSuiSUU8o7FzEg3eNdUhkXGWHhhxtrqSV0GkE=;
 b=Z825eRgLK1PXy7oHkQQE8na9PX8CiGPMXS3LeGPKaU3+xx+JDuIP0NAc2ER5SuoEN9er50NbDRDhG1PqBRfuT0oRMG+yt4hxlB7NzFFQrrR5GYZPD4eoDSS7DW3OrapVoNO8yXdCLWowmZ0yX/GWHyW2Duvj7LoNp0J4AoStXbs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Wed, 12 Jul
 2023 10:39:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 10:39:54 +0000
Message-ID: <3764d627-d632-5754-0bcc-a150c157d9f9@amd.com>
Date: Wed, 12 Jul 2023 12:39:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/6] drm/amdgpu: Rework coredump to use memory dynamically
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230711213501.526237-1-andrealmeid@igalia.com>
 <20230711213501.526237-4-andrealmeid@igalia.com>
 <e488da74-af52-62eb-d601-0e8a13cf0e87@amd.com>
 <0e7f2b0cc29ac77d4a55d0de6a66c477d867fbf7.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <0e7f2b0cc29ac77d4a55d0de6a66c477d867fbf7.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5349:EE_
X-MS-Office365-Filtering-Correlation-Id: f558ac75-a070-4b78-ae85-08db82c45379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RHMN73qiGm6gCccgWFvQ0z04MjEsoTUEp0B6d71qtYuutKz0+8y3JLXTx0Jdy0kciNpB/n/vcq16d3bntlbogLTIMF9i1e7DL2vTCDZ9F7W/U9W+ixkRLkfb/4sjLbDnF3H6pCn9uOxKUbhVq9X051CDDHtLDQxyDj64paESVvO6Z1ZAyQMGoopZKSsGI326JJlE99cw26ax+kPHKn5TIL7bzRIyR5ugBJf2ICAYbvKnyk3NNgWufbpMv3dR1la3FMvBfo7HRHMngWUrg8FNE4Ts4lF31JyKBLMg+7u9DyCQ4fGGPW0NCUEuyOOptWQYK732TbWWlXXZ/EqcEMFUMxRd2S30BsJg36hsj3GQjkjiG/w0V9RKPS1RZ1LcEqCg0iWAWsK2uYIWr1NdH+4yTjhPnNAoPm4wBcIV4iijwvV1MnalaB3xysnQa3aSDTw3mqWKNocrwXzdJw5qrhneAiaTTArrjwSBo/9Xy0iy2bkOt1+vbAVnLFeoEEdya0XveskjEXD1Ozd1ZXMyl23BRNDZVCDeQmvF4jRZJ5ARILNmz98mwSe3iXcpOsKWrxP1o0KHjYUK5VzF9fB6Hf2T4hs2+Gp+TZidw2oJRd1Y/qOioHN32G7tNXj9If3Rv4kuYt92sOTUtQVQPG6SVQ9QLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(31686004)(4326008)(6486002)(6666004)(478600001)(66476007)(36756003)(66556008)(41300700001)(316002)(54906003)(66946007)(110136005)(86362001)(6506007)(31696002)(83380400001)(2616005)(66574015)(186003)(6512007)(38100700002)(8936002)(2906002)(8676002)(5660300002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDMrWjM1cDJzMnhxMVVhNCtWU0ZKNzhOZGttNmhrY0FnUzNyakRyK3Nld1Vh?=
 =?utf-8?B?NnJFVUV5Zk9FdjVic0JLZlJkbnRjSmNyOGg5L0VXVlNIY3AxRjB1U0l3M3Bz?=
 =?utf-8?B?RnlNMm1LUmVzalZDUC8wRHNDb2djcmsrZUxXRDFnNE1SdDBhckFVQXhvUDZy?=
 =?utf-8?B?NXNTaHFZNitaUDlUYk50TS9sdlRDQm5KbXhTUTdMSWpzR2hxTWhMWWRndFp6?=
 =?utf-8?B?T1lmalpBM2xQRlYvdW9vTlVaWi9WZlZnZTZGcXZUTDcwSDJjbGZoczVFQUhQ?=
 =?utf-8?B?TTRhOUo2K09qcFY3eEhnL2hsNzdacE5sYmdlR1R6WkYwSThsMHYrK25VVGk5?=
 =?utf-8?B?RERJVkFmMUpENzZRR1crdWFUYXgxSU1Yb2NFbmZ0b3ljNlRPNnB3dnJFMGhv?=
 =?utf-8?B?bVF5NnBoaGZzUjdEMStEK29PZnF1TDVYQll3d3ZIeDc3K20vbkFNRDZRMHdl?=
 =?utf-8?B?SVRQbEt6dlBBZ3VLbFdIS011Y1ZXZEdtMURIVjJ3ZGRqZC9HbDFLQ3JjZk5q?=
 =?utf-8?B?UzFUVE9zYy9MSkxxWW9qYUxtTEd5V2pqQ1kzZzYwc1BsUzlDYmtnMUpFVW1R?=
 =?utf-8?B?TXNmZE5sOW94eThEMkYxTW8vZmYrTEozanNpdHg0aWIyYWx6SjZjek1WaDdw?=
 =?utf-8?B?SGZXRkI5TlpwRlZ2ZDRoMVlVRk04bVZ6bVJLcFdOeHZvV3lkaDBmRno2dEMr?=
 =?utf-8?B?QThoWW1iUCsyLzY4SGx3S3BZNFhheXBITEZySDcrNW10YTVJNzE2c0FUZ08v?=
 =?utf-8?B?VnhHNE9SUitER0JtQjJ5K3ljSVdXQjFQVW5UdnRiVkdrdW1FR0JwQ0hoaXUz?=
 =?utf-8?B?aXQrOUp6M2s3cldaRjJPeUM1bmJpeElvOWdjWWZKTHBibkVsRjBRWitnanVk?=
 =?utf-8?B?UFJENkNRUGpERkF4M0hxM1p0eVVMczBpR0dFdzREQnBlTnJ4djQ0Wk1weVZO?=
 =?utf-8?B?QlU3WXZLSmF2OTRVaEQwenpWUDNHMzJielJXdmUrK1RlQlh5QTg1TDlzWVVo?=
 =?utf-8?B?RGp1Z3pSRTdWK3BlOUJCTGE2akJIbW5qQlkwVGhyNnBFQnlid2g4SVR1NlpJ?=
 =?utf-8?B?aWpmWE96R3hEeFpWbEF1RzF5MVRMWE1tNDlHZEczWHFDS1NsMHZEdDlrUFla?=
 =?utf-8?B?MVdUUmkwa29GdVJpbmpTTkJBQ0RwZ3pYdTNhLzdWRVczZTZHSzcydzRtMitO?=
 =?utf-8?B?WFVtbHRLSFY4NTBoVEhMbmVELzl3aERlSGlYNFRaQWpkekhwMHJKdEVObzl1?=
 =?utf-8?B?cHlVbzJsaUtuNGtLdCt6cjZDNks4SXV1K2JMcVZhT1htRmtTUG56UkRseDdk?=
 =?utf-8?B?ZmJLWHFLeXhlSW5wQnRjVGVnbDMySDlpWUlhbmdLQk9jOFZxd0NkeG1tLy9D?=
 =?utf-8?B?TG1SUzRxVmowbXNhTkhITURXQjdRV2ZKb2lGSmM4dTNhdlpqbXNpQ3FqNDBt?=
 =?utf-8?B?aDJ0YjBiOGpENWlOYW1OY09yNXVIbXA5UXRaTXdxdk1oS1pvYzg3bEhuMjR0?=
 =?utf-8?B?QUloOFNUSW00WVc1RzdwWkFQMmpuRVhqQ2Jxa0psUk9oMi9nU0E0RlZOeWxR?=
 =?utf-8?B?MUM1bWl1YkZodkoyQkZKZ2JGdE1QSnZ3S3ZTVmZnNExXcHdRWWhSUldOTWdq?=
 =?utf-8?B?OU1LcWR3dVdCSlRBeUx3bUd6a290Sm9mMXJ1dVQ2QWJOdlpQclh4eEtyUW5B?=
 =?utf-8?B?YksxVjBSeHl1SHNsNThsOXVjV0czVVIxczNueWFMWFFlVkxGellTYzJIaVJD?=
 =?utf-8?B?MTY1OU1WNzk1MDJPV0QvRnM2clNBajh4akpGUXFwaDFaelgwaXRRbzdyaTlk?=
 =?utf-8?B?bHV3NnNFRHg2bnNvamVRdm5SVzU1NTVVaEk0Y1JwcjlBNHcvS0RKQWJvU2U3?=
 =?utf-8?B?dmI4K0RXaVBmNWJLQk5tYkloOUJJZnRvTFBqa3llbEg0U2Z2aXY4RnNwcnZR?=
 =?utf-8?B?amhEK2lDTytXdmR1VGRXRm9oTnJBcSttUnBJSEhUWjRTMHpDd2xPZkVOUWxn?=
 =?utf-8?B?NFVQSE1QUDgvaWxXUTNrVVZCTTdCN2IyNnNXclQ5bGg4U3dQWGFoRjJzS2Ny?=
 =?utf-8?B?Mk5RWjdFbmJnbmJMVXdBNWR5cXNUaVYzWDlHdGxTZHkwWWlDdFRnNXJuWHhQ?=
 =?utf-8?B?VVB2V3ZFVFViNDN1dGJUQ0d3ZTByMnVFV1RuVHdFNXA2QjJCR0xBZXlBbFFH?=
 =?utf-8?Q?YP3VONpSmiAJqH7f6V8FSYbQPGEeLv5kGYXS//IesaiG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f558ac75-a070-4b78-ae85-08db82c45379
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:39:53.0300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1dHCtmXUHWn/YG0z8Uhw4HPBp7hx9XHXlwfGWXsPn4CrM7PeylHzXcEEoeT7jEV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5349
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.07.23 um 10:59 schrieb Lucas Stach:
> Am Mittwoch, dem 12.07.2023 um 10:37 +0200 schrieb Christian König:
>> Am 11.07.23 um 23:34 schrieb André Almeida:
>>> Instead of storing coredump information inside amdgpu_device struct,
>>> move if to a proper separated struct and allocate it dynamically. This
>>> will make it easier to further expand the logged information.
>> Verry big NAK to this. The problem is that memory allocation isn't
>> allowed during a GPU reset.
>>
>> What you could do is to allocate the memory with GFP_ATOMIC or similar,
>> but for a large structure that might not be possible.
>>
> I'm still not fully clear on what the rules are here. In etnaviv we do
> devcoredump allocation in the GPU reset path with __GFP_NOWARN |
> __GFP_NORETRY, which means the allocation will kick memory reclaim if
> necessary, but will just give up if no memory could be made available
> easily. This satisfies the forward progress guarantee in the absence of
> successful memory allocation, which is the most important property in
> this path, I think.
>
> However, I'm not sure if the reclaim could lead to locking issues or
> something like that with the more complex use-cases with MMU notifiers
> and stuff like that. Christian, do you have any experience or
> information that would be good to share in this regard?

Yeah, very good question.

__GFP_NORETRY isn't sufficient as far as I know. Reclaim must be 
completely suppressed to be able to allocate in a GPU reset handler.

Daniel added lockdep annotation to some of the dma-fence signaling paths 
and this yielded quite a bunch of potential deadlocks.

It's not even that reclaim itself waits for dma_fences (that can happen, 
but is quite unlikely), but rather that reclaim needs locks and under 
those locks we then wait for dma_fences.

We should probably add a define somewhere which documents that 
(GFP_ATOMIC | __NO_WARN) should be used in the GPU reset handlers when 
allocating memory for coredumps.

Regards,
Christian.

>
> Regards,
> Lucas
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 14 +++--
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 65 ++++++++++++++--------
>>>    2 files changed, 51 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index dbe062a087c5..e1cc83a89d46 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -1068,11 +1068,6 @@ struct amdgpu_device {
>>>    	uint32_t                        *reset_dump_reg_list;
>>>    	uint32_t			*reset_dump_reg_value;
>>>    	int                             num_regs;
>>> -#ifdef CONFIG_DEV_COREDUMP
>>> -	struct amdgpu_task_info         reset_task_info;
>>> -	bool                            reset_vram_lost;
>>> -	struct timespec64               reset_time;
>>> -#endif
>>>    
>>>    	bool                            scpm_enabled;
>>>    	uint32_t                        scpm_status;
>>> @@ -1085,6 +1080,15 @@ struct amdgpu_device {
>>>    	uint32_t			aid_mask;
>>>    };
>>>    
>>> +#ifdef CONFIG_DEV_COREDUMP
>>> +struct amdgpu_coredump_info {
>>> +	struct amdgpu_device		*adev;
>>> +	struct amdgpu_task_info         reset_task_info;
>>> +	struct timespec64               reset_time;
>>> +	bool                            reset_vram_lost;
>>> +};
>>> +#endif
>>> +
>>>    static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
>>>    {
>>>    	return container_of(ddev, struct amdgpu_device, ddev);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index e25f085ee886..23b9784e9787 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -4963,12 +4963,17 @@ static int amdgpu_reset_reg_dumps(struct amdgpu_device *adev)
>>>    	return 0;
>>>    }
>>>    
>>> -#ifdef CONFIG_DEV_COREDUMP
>>> +#ifndef CONFIG_DEV_COREDUMP
>>> +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>>> +			    struct amdgpu_reset_context *reset_context)
>>> +{
>>> +}
>>> +#else
>>>    static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>>>    		size_t count, void *data, size_t datalen)
>>>    {
>>>    	struct drm_printer p;
>>> -	struct amdgpu_device *adev = data;
>>> +	struct amdgpu_coredump_info *coredump = data;
>>>    	struct drm_print_iterator iter;
>>>    	int i;
>>>    
>>> @@ -4982,21 +4987,21 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>>>    	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
>>>    	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>>>    	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
>>> -	drm_printf(&p, "time: %lld.%09ld\n", adev->reset_time.tv_sec, adev->reset_time.tv_nsec);
>>> -	if (adev->reset_task_info.pid)
>>> +	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
>>> +	if (coredump->reset_task_info.pid)
>>>    		drm_printf(&p, "process_name: %s PID: %d\n",
>>> -			   adev->reset_task_info.process_name,
>>> -			   adev->reset_task_info.pid);
>>> +			   coredump->reset_task_info.process_name,
>>> +			   coredump->reset_task_info.pid);
>>>    
>>> -	if (adev->reset_vram_lost)
>>> +	if (coredump->reset_vram_lost)
>>>    		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>>> -	if (adev->num_regs) {
>>> +	if (coredump->adev->num_regs) {
>>>    		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
>>>    
>>> -		for (i = 0; i < adev->num_regs; i++)
>>> +		for (i = 0; i < coredump->adev->num_regs; i++)
>>>    			drm_printf(&p, "0x%08x: 0x%08x\n",
>>> -				   adev->reset_dump_reg_list[i],
>>> -				   adev->reset_dump_reg_value[i]);
>>> +				   coredump->adev->reset_dump_reg_list[i],
>>> +				   coredump->adev->reset_dump_reg_value[i]);
>>>    	}
>>>    
>>>    	return count - iter.remain;
>>> @@ -5004,14 +5009,34 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>>>    
>>>    static void amdgpu_devcoredump_free(void *data)
>>>    {
>>> +	kfree(data);
>>>    }
>>>    
>>> -static void amdgpu_reset_capture_coredumpm(struct amdgpu_device *adev)
>>> +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>>> +			    struct amdgpu_reset_context *reset_context)
>>>    {
>>> +	struct amdgpu_coredump_info *coredump;
>>>    	struct drm_device *dev = adev_to_drm(adev);
>>>    
>>> -	ktime_get_ts64(&adev->reset_time);
>>> -	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_KERNEL,
>>> +	coredump = kmalloc(sizeof(*coredump), GFP_KERNEL);
>>> +
>>> +	if (!coredump) {
>>> +		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
>>> +		return;
>>> +	}
>>> +
>>> +	memset(coredump, 0, sizeof(*coredump));
>>> +
>>> +	coredump->reset_vram_lost = vram_lost;
>>> +
>>> +	if (reset_context->job && reset_context->job->vm)
>>> +		coredump->reset_task_info = reset_context->job->vm->task_info;
>>> +
>>> +	coredump->adev = adev;
>>> +
>>> +	ktime_get_ts64(&coredump->reset_time);
>>> +
>>> +	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
>>>    		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
>>>    }
>>>    #endif
>>> @@ -5119,15 +5144,9 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
>>>    					goto out;
>>>    
>>>    				vram_lost = amdgpu_device_check_vram_lost(tmp_adev);
>>> -#ifdef CONFIG_DEV_COREDUMP
>>> -				tmp_adev->reset_vram_lost = vram_lost;
>>> -				memset(&tmp_adev->reset_task_info, 0,
>>> -						sizeof(tmp_adev->reset_task_info));
>>> -				if (reset_context->job && reset_context->job->vm)
>>> -					tmp_adev->reset_task_info =
>>> -						reset_context->job->vm->task_info;
>>> -				amdgpu_reset_capture_coredumpm(tmp_adev);
>>> -#endif
>>> +
>>> +				amdgpu_coredump(tmp_adev, vram_lost, reset_context);
>>> +
>>>    				if (vram_lost) {
>>>    					DRM_INFO("VRAM is lost due to GPU reset!\n");
>>>    					amdgpu_inc_vram_lost(tmp_adev);

