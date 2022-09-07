Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F595B09F0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 18:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5173510E7C7;
	Wed,  7 Sep 2022 16:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704F010E7C7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 16:18:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTu5jveGTngdfBeo0KJwi1EQ7TGAJAmVifzkfU2/CeDigHWdFq9tTYF6MDNp4hXiqP66LbXfHo77Iuq+XTjwxqEf8kF4QNT7iO/5I3rbjJvHwU71iIHbFs6Lix6eAeQklmNvPIqokVAoV4nW12yBx/YshknoRNRtm68sMivCW7wgvcxqcu9/+tqPYhSF5+8v7w5qZUjKWamCuGGOY9gpXz3agBwrVJHJgnND6wwbkJ8yHaXqEMpuJH4p5K/ScbSrf+bVDDZgjv9vQWKg+22B52p/7WEdYjYzfqD65ThlpViS1MYJvAzU66b2t+3alVCFUUTi18iA8YRcruFZaVk3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4woffgzYz5EiZjB+u8rBpdJf3XddeREq5x4RvD/3xus=;
 b=fCPiC0UcigxFBF6TXpbF4K92BmqrCuHlqUGgcqRFUF6FdBm7E5r7Nd6LgIFn9LHm1eZL6tGQd1V77f+i0YnQMpE97c1s6QEN/vJwlNq8v6+TYH5m8IooeQCVTi8iox2kwWQbduIa73wE4GQbO4d5yGAgeh3G6yrngVXB4S53Y2WYkxyEREoMuCvch3jS60Re/KfCnapfDpNyGlRY7ZKy2tJPwnVOfiYQM1+bzeuxKH1jKvkxohFPmwipFQGrMD7hiaNOmMr5gFwLF6M2eh+RBFpKsYjUS8sKCjCL6OPgf8pIGG457lacbGVKn2M1OEbcrpobKI8q6+ONee3+pgYpUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4woffgzYz5EiZjB+u8rBpdJf3XddeREq5x4RvD/3xus=;
 b=QrGhtC/z4Mu2G8kuv4Wx+tV5ENNMBApft+UXRSTtsN21t/Gokrr4NziuzkIWef0tSRbtVPMdxqnmF6rcwe9vWF9KSF7ljMJHGMyUsb89IC/vTj1AoqYHKb0b6w1x0Y7KcB8H3tCo0B44g6YD8NtM2lArMVF4a/1yaJzcjIRgpS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MN0PR12MB5762.namprd12.prod.outlook.com (2603:10b6:208:375::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 16:18:40 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 16:18:40 +0000
Message-ID: <f905c70e-b93d-5a26-cba9-c826a1fc21fe@amd.com>
Date: Wed, 7 Sep 2022 12:18:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] drm/sched: Enable signaling for finished fence
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, shashank.sharma@amd.com,
 amaranath.somalapuram@amd.com, Arunpravin.PaneerSelvam@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20220905163502.4032-1-Arvind.Yadav@amd.com>
 <20220905163502.4032-2-Arvind.Yadav@amd.com>
 <5568fad0-1503-a0f3-222e-c238fd4eefdd@amd.com>
 <ffb5acca-7c20-4497-d7d0-25508a6566d2@amd.com>
 <9b57b254-8d67-9937-5cec-783e7a4d8f56@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <9b57b254-8d67-9937-5cec-783e7a4d8f56@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::30) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|MN0PR12MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a46d6da-d663-48d0-72ea-08da90eca01e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aM3+0poZjrJRAN0dTVeXUQfRrl0yr/Tn0i0OQY+TKuCd3eGYWAUAsNCA23q/1C3TpWgMyPyKDe1viY5APaBkd1zuvjjixTIBmuikWmcJOJthBI4NF7lMzpWO7ligsMiIGr+yqbCxqeqvadnCOqkPQaVMVw2+nrbB9pqDpgjlrMI6ba758Ka5QS1Ax/pKVWsIX+XsHw2Aa8UhDpPqARS+WGOlwwD5KkVFZYminyoTbiqsjsuKCOnrd01dGvGkaKbZf+9++vdOMYTba8SRbOMoQ/SGjxo+fmbIfNJ1fnhdxLKRi4yUuvy2vSNxnl+13x19nVRICeXgDGvp5VuaKESxgFRw88FL3Bw3JWztT4f7EhsrUt2FFbDgeQalf/E1uoNDDTvDqempHuarRaJK7Gfhikjpl6R3Y1Xj6Fw/H+GNx21xXkvY3Han8qRlMXmCOZD5la9M3WLeEMOhfVJ6nDezvfMIdEMSikueM+xA/04YTSI0d92XPX/6vRN15Ejq26yK2lRJq68lGg73RDMni5L5Z1SA7rdobQ1wrABZCIBoAIEi7J+xqtwAe8Bx3xh5S4OTTh/7fGD7MwokYyDrfIoiJ4gbL8wG2RB1fTAGUKupgOdxbk9jMbyzj6rWqOkhzOpGtgXdwoCEbPOc8KloXui2I205bXi96oQKRvAY3bYhyB/BfqWJlhE6pwVCP5OShosmkuwbcmtGepyU0lUkz0W0bFCXddDf/0wc9HMZiy4fCT5Dy1neHvS/dQ4rr2QVSzTzANKvLONPx6BFzoQUo/374qtMdA84OtlB7JrY1XfO8Qatp/zi32apFpwrST/RFiKB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(66574015)(6506007)(86362001)(6486002)(8676002)(66946007)(186003)(31696002)(66476007)(66556008)(53546011)(478600001)(44832011)(41300700001)(2616005)(8936002)(6666004)(5660300002)(2906002)(316002)(31686004)(921005)(36756003)(110136005)(6512007)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDFuZG5Bc2tONHYycWs0ekh4dlJ1dFBMWTM3SXhrei9yaG5mY2JJWlU0N2E1?=
 =?utf-8?B?TlBZOEFCR213UHExRXdzdlovQmxpc2NpUkNrUXEwVDZoMW05dlIzSktOeEhV?=
 =?utf-8?B?NGJ1bERoemVJNUQxQUx6WjZ2UTMxclZzek85MnZ2R0NKcXFiSDArTWNTelRU?=
 =?utf-8?B?QjJhckRWemMxaHYzenVydTVrVmV2SGc0UlAxNnJSQmNqOTllWjBvc05wT2ZE?=
 =?utf-8?B?ZVVkM0VkaUFYcjlBVGsvbjVTenNSb3pMS1RDZG5sUkVXdE1rTkhRRFo0M3hm?=
 =?utf-8?B?cWxQa3g2R05DOFVFU2RnM0xYcmRiRFZsTnBjc1pwbGEzZC9DVG5VUE5nS0Fv?=
 =?utf-8?B?VzJVajJEbzF3NWRaLy9kUUROZytqNmY3TjAzMENXOU5YWktGK2V6VkE1WkZp?=
 =?utf-8?B?Tzg0bWJPb3R4V0htRUt3L3JQd0QrYjRTNDk3NUJRN1JHOFdOL0sralFiVGdp?=
 =?utf-8?B?M08xeldzcjg4UkdiRjRZNkxZRWxuWmhTcG1YYlJUMGs5Wm5jcnZZRWZxQWVx?=
 =?utf-8?B?YVVmSjNFTXM1WjMzdmxFV3F4TjZhM2ZsSjFvWEtZWlpTMHppK2xRajdLaVpn?=
 =?utf-8?B?dmMrUVZLd3ZTaDRpeHBFbmJPNEhDTXlUL3hTZndMSGNsNGJMcGpXNzdNckY2?=
 =?utf-8?B?MmlGSVpUVUJLTWthb0JYNWp6TEpiS2lRcUJER0RQZXByWWRNVXlhbzNyOGYx?=
 =?utf-8?B?VnVkSlB3Q1VlUFRRVUR5TElESllRVmdsblQwM1NnUWJGK0paand2MnNpZWxZ?=
 =?utf-8?B?SmtZbVJxOHdvNnJOUEh6bU1WN2g0YWdhM3BpVjMxdnA1dW5OeTFsUnBIaXRQ?=
 =?utf-8?B?NHpVRkwvcFM1MXVkTjQrakZ5d0pubjdKWW1IZ3ozSFRsQUhRSzVBMWx5WnpS?=
 =?utf-8?B?eTdqUkhQSXFJb1VoZi9acDk1N1JZblNkUUo0cWlWMFV3Z1dRRldJMlVESjhu?=
 =?utf-8?B?U0VuUFJjZFRSRDNQZ0VLMUJncFVFRXRNU09waytpTXpYUmdPOVdNZVpWWmpo?=
 =?utf-8?B?cEd6UUNIaE5EekxWR3d1dXJnOHFwTW5HZWg0OFp1VlM4L0tkVnBOTEpTOHZ3?=
 =?utf-8?B?L3dWZlNSb2loNFZMSDlkV1V0UWtwRSt6TU1kUEFWazFwZVI1bFFnWGZlU0Mx?=
 =?utf-8?B?YU00bVREc2NBbm0zWUZtOFp3aWQ1dkdzYnFUeWU1dE1QNVNZY2ZEU1p6ZUJ5?=
 =?utf-8?B?dE4xVFI0Mk0xYmFoWHY0RHM0OE9JeG9iNGJ4MDUwNTBPQVNzU3ZSOUcwS3Yy?=
 =?utf-8?B?ZUxrYXNTcG90ZWRkZ1hxY09mdUZwR0doNTRZcVZ3Z2dMb2ZtWlVoSVVueGlG?=
 =?utf-8?B?RVZQYUo5TmIrcC85a3VSUE43WXZSYVJyR2dxNzZ4STMyUVEyNXE5SHhrL3dh?=
 =?utf-8?B?czdWMy9CY01CeWkrclNPWmFaTGQ2N1Y0Qjk2ZWtLTk1ad2ZabDl4OVUvRGhQ?=
 =?utf-8?B?V3FiWG5qUGhSMENoNnJxWlZSSExBSzdnMittVXpGSDMvNnA4SWI2VXhjbWZt?=
 =?utf-8?B?blNhVVdnNk1NSUhSUEZqVEtHWm8wMDVTMjJacnlMMTlTd2wyRmsyL1VEbHdz?=
 =?utf-8?B?cytBdkxRNXNOak5RMElFQndTZGRXUVYzWGRLWjdnMVFKWVVuOXNnWFQ4N1Ex?=
 =?utf-8?B?Vi9DZzRrV2w2Y3RCNXRaT1ZjWDR4cFVxNjRvRG14cnp0cHlKOFY4VlBTNVpX?=
 =?utf-8?B?emdRY2pxU2ZWQVZ5b0F3SVlDVC9USGNodnZ3L3d0eFhuTXFqU2RnSUJRQ0NL?=
 =?utf-8?B?UDJETFd4a2UrTUtEdTJBT0pObkZEUUZOQlFYWGFSMlIrQXV3TTJ1ZmdyZFJ2?=
 =?utf-8?B?Y2ZkTGp3dmc3WTRPQ005YkRzL1UrclFWMjZ3dnQ0TmhlbUVhZTgyZy9oTjli?=
 =?utf-8?B?dHpoYTVxUXZUaEc2ak55K3BzOCtaRDU3SWxNaEg5OVBkUTFqdkFJTEphaFow?=
 =?utf-8?B?M2gxY0ppNGZmYU9SaEUzbFRrY1pxVTkraFh2T2JjOW9xaUZnbzRpTTd6TDNj?=
 =?utf-8?B?anExMldnaS9kc0x6aHEvbVl5bHZaVTVmUkVrQ1oxTWU5VExKS0l0VEMrTXdC?=
 =?utf-8?B?MGJkZjk4empMZXZNUXIwakt5WldnTGZsOXQ3U3NhTGlYYzNHSVNrOTZMTjAv?=
 =?utf-8?B?bGVGOHB2enFmM2pDckJpYk5IV1JGRDhGRW1PZC9kSVRFSDdxdmk4V2RXdm80?=
 =?utf-8?Q?Sl5I5fMMIWeezwcIDTO3JBvOEzQAUqcZZk1FQec+koHa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a46d6da-d663-48d0-72ea-08da90eca01e
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 16:18:40.0940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1t7haCHM3M/HF/X5GEkzvC2s/BcGUiovV9pEYE2OV7SKkHWYmQsKcqL3bdz0J6pxxMYtUCDniVwrMt4WSTgRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5762
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


On 2022-09-07 02:37, Christian König wrote:
> Am 06.09.22 um 21:55 schrieb Andrey Grodzovsky:
>>
>> On 2022-09-06 02:34, Christian König wrote:
>>> Am 05.09.22 um 18:34 schrieb Arvind Yadav:
>>>> Here's enabling software signaling for finished fence.
>>>>
>>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>>> ---
>>>>
>>>> Changes in v1 :
>>>> 1- Addressing Christian's comment to remove CONFIG_DEBUG_FS check from
>>>> this patch.
>>>> 2- The version of this patch is also changed and previously
>>>> it was [PATCH 2/4]
>>>>
>>>> ---
>>>>   drivers/gpu/drm/scheduler/sched_main.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index e0ab14e0fb6b..fe72de0e2911 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -962,6 +962,8 @@ static int drm_sched_main(void *param)
>>>>               /* Drop for original kref_init of the fence */
>>>>               dma_fence_put(fence);
>>>>   + dma_fence_enable_sw_signaling(&s_fence->finished);
>>>
>>> Ok, this makes it a lot clearer. Previously I though that we have 
>>> some bug in dma_fence_add_callback().
>>>
>>> This is essentially the wrong place to call this, the finished fence 
>>> should be enabled by the caller and not here.
>>>
>>> There is also another problem in dma_fence_enable_sw_signaling(), it 
>>> returns early when the fence is already signaled:
>>>
>>>         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>                 return;
>>>
>>> Please remove that one first.
>>
>>
>> Why we even need this explicit call if dma_fence_add_callback calls 
>> __dma_fence_enable_signaling anyway ?
>
> Two different fence objects.
>
> The dma_fence_add_callback() is done on the hw fence we get in return 
> of submitting the job.
>
> The dma_fence_enable_sw_signaling() here is done on the finished fence 
> we use to signal the completion externally.
>
> Key point is the finished fence should be used by the frontend drivers 
> which uses the scheduler and not by the scheduler itself.
>
> Christian.


Oh, so we need to explicitly call this because dma_fence_add_callback is 
not always used for finished fence right ?

Yea, then it makes sense that the client needs to manage this since each 
one has his own logic what to do with it.

Andrey


>
>>
>> Andrey
>>
>>
>>>
>>> Thanks,
>>> Christian.
>>>
>>>
>>>> +
>>>>               r = dma_fence_add_callback(fence, &sched_job->cb,
>>>>                              drm_sched_job_done_cb);
>>>>               if (r == -ENOENT)
>>>
>
