Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DFF5103D3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BDA10E8A6;
	Tue, 26 Apr 2022 16:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFB710E8A1;
 Tue, 26 Apr 2022 16:43:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCNfOOCSxi4kPg9qaMlmFkeFZQcqxGySF6D4RAQuf0veL/G2aYOE++Y8Pk65Vw6SH/n1k3c7KjWCgb7ZWSR7i6b64A+JuJA52708JaJ5gcav3ezO3WeduANFmLERc/usDLfn59U32DVRvHrFVSXjkv74pkoaycANYtXwmFKQWqb5Ne3QcY/iD4z74TOQpjcPsOClSZnXdFWcfGPLLP2SuYBEOss9wn6isWJTZ95sl3CVntQQn7mzwdRwGd0S7xJ17O8nK59YalIMjPydY/dJanbJHiXcci/U4uk/JiNUmmgmaf+iSwYjU7FCbWFtpNtvpzP+PgJTkicNjvc2iI8LHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqGTc7jA+C6eMlc4Rkrw9Rn4sXdoE7eZQo9GQnF7v8U=;
 b=eOWTukorS+wDNKlLEk6esfmVd5k/SiqLrLi0n5doXssWKb4qo63z+TnFbb6YRpKx6TRPr8H889XaECcbBM4jIzjZlLUm3SQrq9jlRdaO5NvJ889WLFPqHy2IbY6URnd5k2+Nxb2Y8Q6D3kaSFU9Ei4+PnBrYsdrGpSDwmuiuiFNnFA/pa9CvAoxdckzD3+DLhp+gm0rEuXJLE07nmS4VsYPtSpoETfqmd7lrQFtqXT5FUuQRlxl+7AMtBiOaOlib0AiHOUHVu1NCAAI8z3cYbLdEtIkr+dmnsi3ovswrMWTjeG2WwoI0vbhPvDoFYM26pSJb1vtbbzMUwPt/D+Dkqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqGTc7jA+C6eMlc4Rkrw9Rn4sXdoE7eZQo9GQnF7v8U=;
 b=ZPs7Mf+hoWGkE4wpCzJ+FTE8XB8/LUe7vrsludDqQo6lQOJKdeSYonlp/+otWqMdA6nO83C0BfiNurX3ReozdXNzARhCqsEZFaTUiOxhoBM5Gu1eDGV/93BOHclO//tXfaQ+Ov/B615tkYl6XA/7hpImCzk1VOh7bCCMuGAviZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB2551.namprd12.prod.outlook.com (2603:10b6:4:b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 16:43:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:43:55 +0000
Message-ID: <a1bcc211-01fa-39b4-8c52-4e0b6143b3a4@amd.com>
Date: Tue, 26 Apr 2022 18:43:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
Content-Language: en-US
To: Rob Clark <robdclark@chromium.org>
References: <20220408211230.601475-1-olvaffe@gmail.com>
 <fe1e583c-b942-0f33-55d1-435f0966b110@amd.com>
 <CAJs_Fx6ehFu4Fzvo93XCN+7yufU0NQCshreDniRk37V4f6fmPA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAJs_Fx6ehFu4Fzvo93XCN+7yufU0NQCshreDniRk37V4f6fmPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0071.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::48) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8346fab-ab40-4331-f271-08da27a3f32f
X-MS-TrafficTypeDiagnostic: DM5PR12MB2551:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB255161FC1798D0150AAE139A83FB9@DM5PR12MB2551.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kwpXUV/wCR49lBL5+89hKLz8MnJaHW9vdP3ZucbAFJIxfK7phZKHJkWkjRKCMluta/izg80VC8gjhL/wWRiNULac1XU5M7stUu2KJ5A6BcT0Ouu2cqK5Z5fmuVK58B8nKa6NHsdZAB/j9O8L6wWnyqqHbllMXlIhRAfrYFOxnCpdLRUnLxbgE5CSKKwT7m6Frn0QRFqGl1rsmGDyQ3tEbfXrhbgEVwkaXuFL4CBCnZeBxYzxHrf8m8dJ8SioRXvvl0kr1qB1eiT5odWQX2WCQbSXlubJvkQyzAAck0eGNuYhe5Tsi7B5Hi1DNRP13QBLNJReMibQ8HcE8ttwvweuSyZyMt8qBYKctF9982e8DbegKPb7o8m3q2f2kG2e3oEN+UQcpvRpd7YMPug4Icgq+pd2MoC8xJix+UoeoqY/1ciRbysm/HO98nSgkGJGjS+sTfPOiAhqW8YBv40qKgL4piuxHQtIH/dXajjDao1LAprHllIeySRezBrxFhSJyN7FfZ8bs6DiIJr4p6tBRa/vSmytn/rPcLZ+qu15SyOSsxy+bZrmIPqZshKZo7evcokqUOOWVaFILoQvwp9/qny05HHrykz2lpnqlzojjboxo1tZ200C5EgREYWw/dGxuBXAamNlv33Y2gaMmL3v4xFdOSA6Lc7Y4syptXnY0BGcqNP7g76XWM57V7HWZm2qihk8rqo1KLkdTQAC38dESrq6M90MM0d9yVK3bZUan9pKvIlKjYv0VDKj9OJQrL0R/Enk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66574015)(2906002)(31686004)(6512007)(36756003)(83380400001)(316002)(53546011)(8936002)(6666004)(6506007)(7416002)(2616005)(186003)(54906003)(508600001)(38100700002)(6486002)(6916009)(4326008)(8676002)(86362001)(31696002)(66946007)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjdVMGNjVDdLOG5zazlKNnhxVE5pK3NhckUxSHBqT0h6QW5xY2E4MEZENkYx?=
 =?utf-8?B?aG9sc2pwQXRUeUdGWm94Z2RkTW5Ccm1CbllyaVVNMlMzSGxaU09saENienZJ?=
 =?utf-8?B?SHd3ZlVwUGdRWU5TeG1ONW9NYUQ0aVlDeEhBOHNzSk80L05BZzBBdmhEYTl4?=
 =?utf-8?B?R1JnaWFOVjhpUkhOa3JwTnA1UVY4VUNDYTRSZXordGdBOEpMRVlMNjVuY09R?=
 =?utf-8?B?YVZjbFhFT1czcmsvQ28zdE4xcW5YVHdPM2NGZW1MdGY0cGRRenhDTU5tdDV4?=
 =?utf-8?B?Vi9aSndTaUdqL2pwZjgzQ01Ka3VYQk9EVmFKMHhZT0c1RWFNOVVaajY3ZWRv?=
 =?utf-8?B?YU15YXhIK0V0bWJDbEVLYW9ZaXIzOW9JeWdjN1dkWmt5d3FoSFlydXBQQVVH?=
 =?utf-8?B?amszeFA0TXVqOVpuV2taakp1b0R0MTkrVVhySnNZdkFDNWs1cGd6ZnNGazdt?=
 =?utf-8?B?N01OTldvVzA4T0drUXB1RE01MjdNSEdpalAycXdEMkIrVlVBZnRJQm5DU2t4?=
 =?utf-8?B?K2IwSENaOEptYVgwdGhJVDY3UDI3dVlHYjUvVVhpRVJLUElXQm5YSjBPRmRQ?=
 =?utf-8?B?bHphL21OTE9KM1dlelM1V1RIWkM0Qk5GZGwvSjFKVFFKYWtHMWZKbUJXRHd6?=
 =?utf-8?B?UFN4ZXBJVnFnaTkyblc4Uy9aak1VU2ROcHdydkxLQ3JTTFdvaGRUb1NTcGht?=
 =?utf-8?B?V3V5NGJ3YzJXWktNeG9RMFlHOEp1RkE2V0RVWnFSRDE5dVYxKzdGOStZeitu?=
 =?utf-8?B?WnEyY2lVZzd3S2Zsc1FyNkJ2aFhrNEVSTlNGVE8wTUxQZFlyYTQ2SC9VN0RM?=
 =?utf-8?B?NDQrMVFLZXNJVXhkTTFUMTh5Y3ZCL29abjJQMjBSdkRzb20yT1JNdENWSWZV?=
 =?utf-8?B?ZWhUU1NTSGZ0eXZGYURwcTZDSTIrbGJsQUtJWlFxdE9Ub1FVL1g3ZG52dXRr?=
 =?utf-8?B?cXo4dm5iUm9vTWVxZktmUzRGVGZCVnlMZ3N5NDR6M3I1Z1hoSUt5OTYrM2dX?=
 =?utf-8?B?YmdCa2FrMzNhaVJ5V3AxVDlEaWdySlFOSUJwOUlwdGQvZG5FZW5HOC9QWkNP?=
 =?utf-8?B?cUoybmJyTS9GNjd3d2ZWQyt4eHZkRUJNNFRGakErMjZOTFpoM1hYZ0Q2aEZO?=
 =?utf-8?B?eGF6ZzZEVzlMZFk4ek9lYmxhY2oyNi9ZSWVwNS9JNFB4ZUNzOHArTmtvZ1Vz?=
 =?utf-8?B?SnVid2dCazlmMnA0bXhRL2VHRG9jUU9wTlcyYWFnTkdSczR4ZDZDbm1Yc1lE?=
 =?utf-8?B?NE55bUlpZzRLdGhoYjlNMDRFa0FYbnZqbm5FUjUzTDR6V0RQRndEUmRBS1Ni?=
 =?utf-8?B?eXFBNWVDUWZhZVg2clZWVlJOQjVKVkdzUjZRZm9TeUdadnVWL0pnUTlIeDNw?=
 =?utf-8?B?Mkk0QzhIVEhvanFCTVR6a1B2cUNCbEZQeFBCOW1TZGVNbHVPa3FnaDFHbFNv?=
 =?utf-8?B?RHFPeEhaMzFFem5rT3IyWlNmODlVNE1qZGVjTnlTckUvUHpTcXJ3YWl4RzNT?=
 =?utf-8?B?MVE0SG9BeXkxY3JPU1I0cGNiTnZUempZblRIZUpKV2ljZ2dGYUZjQTZzV1Np?=
 =?utf-8?B?VnBBNkh5QnVQdzVzZ0xNSXhucWtCTnZsOEpwQXMyd0tianVDWU9vRWRVQVpC?=
 =?utf-8?B?NXNpeTBVSVU2RExxVmM2ZlBsVVBlcDBtWEl1cVBHc0pRUjV4UkR6RUNHWDZ3?=
 =?utf-8?B?MW9mbWg1T0pZa2dYdmFPZlpCVnVSTFJDN3VQaHZ4SVVldEorVVVtNkFyVnhZ?=
 =?utf-8?B?UGliN25EOWVnSzA0V25ZUEs2YlpoSGZRTkxnU0xRMndVdzVjR2wzc1lZbUJM?=
 =?utf-8?B?djJLamQ0MG9nMU9RaUVZQnltOWdkakMrUzFpTG5MQ01vSDg2a2hTZkVPOGMz?=
 =?utf-8?B?TDVkMlZwNXg4N2kyWmhxVGdFR3FUZ0JaTTNiNVRRTU94Mk5PZWJIeEFPaXFj?=
 =?utf-8?B?azcvLzEySi9mamJDZVhZemN3NnZXdlBFTk9VTytkaGNlanY2cXArT2Q3ZVNU?=
 =?utf-8?B?WUdac2YwSDE3RVdHYnFWRzVwSDI0ZmFwN3g2RGdXTHRwRmlGT1JDQzBGUFFq?=
 =?utf-8?B?a25keC9kd3ozMWFSRjhza0hxV1dyT0szR01ycldFZmxnRC9vUTlZYTUvVHBv?=
 =?utf-8?B?djFDT1JlU2lnekhHdUZpblJOMnNYUEpqSFFzVDV4YlpIT0N6MlBqaTRJbzJH?=
 =?utf-8?B?MUQ0dFhQWFhsT1VmNDFCTGFuRktNQWpXZ2ZUd01uWXZmT2FqZ3k3V2MyeTdZ?=
 =?utf-8?B?VXczeEdpc3pxR09wcDVMT3RFN2dCdno0QVhhd1oxcGNFOFc2Nm5qR2p0SE9E?=
 =?utf-8?B?RExRenFsNmNqTXRSZFlhTEpURnFtTzZ4MFZxOEk0bzNXOEZHY0Npeko4bFR5?=
 =?utf-8?Q?cBDgZputzbr6ogeuGikj1fsn0+b1qPsd/459UMaoiPqqY?=
X-MS-Exchange-AntiSpam-MessageData-1: YkPbfveQzKkQdw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8346fab-ab40-4331-f271-08da27a3f32f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 16:43:55.0285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXSR7uWniO/nrTAgIPjBfZPr7tkvIyWtW+FNJEIq2BjrHDuQoAjGWDXrbzjELp9n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2551
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for the delayed reply.

Am 12.04.22 um 21:41 schrieb Rob Clark:
> On Sat, Apr 9, 2022 at 7:33 AM Christian König <christian.koenig@amd.com> wrote:
>> Am 08.04.22 um 23:12 schrieb Chia-I Wu:
>>> In practice, trace_dma_fence_init is good enough and almost no driver
>>> calls trace_dma_fence_emit.  But this is still more correct in theory.
>> Well, the reason why basically no driver is calling this is because it
>> is pretty much deprecated.
>>
>> We do have a case in the GPU scheduler where it makes sense to distinct
>> between init and emit, but it doesn't really matter for drivers.
>>
>> So I'm not sure if it's a good idea to add that here.
> visualization can't easily differentiate between drivers/timelines
> where the split matters and ones where it doesn't..  IMO it is better
> to just have the extra trace even in the cases where it comes at the
> same time as the init trace

That's exactly the reason why I want to remove the extra trace.

To make it clear this is only useful for debugging and *NOT* for 
actually visualizing things.

So by adding that here you add more confusion than solving anything.

Regards,
Christian.

>
> BR,
> -R
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
>>> Cc: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/gpu/drm/msm/msm_gpu.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>>> index faf0c242874e..a82193f41ea2 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>> @@ -15,6 +15,7 @@
>>>    #include <linux/string_helpers.h>
>>>    #include <linux/devcoredump.h>
>>>    #include <linux/sched/task.h>
>>> +#include <trace/events/dma_fence.h>
>>>
>>>    /*
>>>     * Power Management:
>>> @@ -769,6 +770,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>        gpu->active_submits++;
>>>        mutex_unlock(&gpu->active_lock);
>>>
>>> +     trace_dma_fence_emit(submit->hw_fence);
>>>        gpu->funcs->submit(gpu, submit);
>>>        gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
>>>

