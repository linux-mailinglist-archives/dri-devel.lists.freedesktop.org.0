Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9FD53C9B0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 14:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB9010E8F8;
	Fri,  3 Jun 2022 12:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D71910E8F8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 12:08:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StffBeqJ9lWwS0yiCWYXwCC/K4aQ9ZdW2ItQP+bv++CIvqcQUsfcEcmxvEgCBINn4PTkZy3Mc6jm/LDmaL4IPk7++Pkd07npfE/igrkGetplmqUt9udv8EGuJT4L7H6Yo4kKR3nOPeCXWRYM2pNDDv4IghGjCVY+FbhXRAlKf8VrazZ+FbKEU2V+u2E9GqAfTrC34voQdmoWYZoUdHL3Im0g5y62sAYGO0Tc6fH9pZh5+adjdo2m7/ZkwmKSMMQD0+WoOb8Q1A3ePMi5uEYBBCK20MtSHDI7SweAADfAiBKVoYCV+lKg1WFs88Cyw8tCPWj/bhBSiA0EgAB51ig1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxuxZCVO/pdDRQEAPCS9jTJgFbaR6dU/RQuRN3ArIVA=;
 b=H14mXdVjt8Sm8s+1domaYNaSyGmvWAvVEZCfiVvUQ4tVhMmDkfO3uw+iDP+tRE3gWmpjUPmcwxNY5opdDO9nMczWzxhgkcCcfmNmeMAbAc52YCWqVh4Zp3QtEn/TT6AdaPgRLaq9fkpGbcNm5Ynr+t9gJN9MRXYSlQsXUtWDxt+ml1rilX6u16znkOXL0TyxaPvvWuBveQ7pox3mP23bLMJz4s8iBgy35VseNHF0cTTJSdmz68jE9eKLa4MraTiI/399gycxPuTJgyBac5KCskTptlPmWhJ3cmwo3iC4DAiP7OX1y6HQQj476EwnnR9S//ZIGP9x1ipO1UqShKrNYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxuxZCVO/pdDRQEAPCS9jTJgFbaR6dU/RQuRN3ArIVA=;
 b=t5mFw6oVRV98TU7cIF5OCUse/cImMwOmJ/vVBrn0XU2fHIEJsxwBe7DxywgfU+UdM4dlqcyl4FrXM56375+btMRAbvMQhTztYKGmOyFLIG/yqHAQ3AvT8TdQxtf9xue6HKc92ZGGjhNTrZ9CBflU8BC/oC5bFowZvyvje4u+inM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW2PR12MB2492.namprd12.prod.outlook.com (2603:10b6:907:8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 3 Jun
 2022 12:08:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 12:08:48 +0000
Message-ID: <7cba4b1d-724a-3c32-2546-015fa069342d@amd.com>
Date: Fri, 3 Jun 2022 14:08:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
 <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
 <CAP+8YyEy8R3nbJVFkqHnh=3VsmfWKsQyY45tcWTQhm3hujBRbg@mail.gmail.com>
 <e502a4b7-e927-2abf-9014-0b23d15d401b@amd.com>
 <CAP+8YyHdbrvA-sJ=VZccmLkyZ9WCO7CnOp5K0pMoXA=MrHLCsw@mail.gmail.com>
 <bd850268-8324-79cb-854f-b0c843f9581b@amd.com>
 <CAP+8YyGuU_fBMLkSuqBMk7uy-F=BAaopWS-Vxi=-E0P5LGbsRQ@mail.gmail.com>
 <ea49dfd3-3c20-c330-3412-5b48481331cd@amd.com>
 <CAP+8YyGgam6Hr40PS_Rc7Dg=S2dLJdce=87=wNt2B0yAyPEPOw@mail.gmail.com>
 <237f28b7-258e-8b6c-f7b3-93f0db9676d3@amd.com>
 <CAP+8YyHnR=eQZMkxn=RpdzYF69y-54ri2pFrTj8DJuRTtwrDaA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyHnR=eQZMkxn=RpdzYF69y-54ri2pFrTj8DJuRTtwrDaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0067.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::44) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c57a364-7109-402a-a0c1-08da4559d086
X-MS-TrafficTypeDiagnostic: MW2PR12MB2492:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2492135D86FD58F78F343A1583A19@MW2PR12MB2492.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sCXJ17VPC0klTA2ZTprWuenpEW182/rdOKdZRqQRIYl4ezKQnYjiOHEgNN2J4bZzCnC97EBr8zrip3E5P1EJTypI4Ei26yKI765dCvkjapV2DSYk/EMNJXzPO1vgu7p5wOriD1f3w50+2fp8i7vzh+/8Z9f5YnV8Env+8sm6H2M9jIlPzf15jNm9jsopGImQfiHDanxrDL3vJdTLvKxD7vZOGL/xVU978HqDzk18IeC5ZcNc1ZiJLT2Cct5911oIBjlObvRd/JmFIzIszQQ+dCk0xVgaINL2+ChwxoGwNq6yLnaYKyA0LP8YuinEV6NWySn33apFkTdd8n953jvnTr1UVvdQLKfy9etvLmwQhpWmflubYzPp6cepixWXYFFPiX+O4vvVxohqfC2Wgf5W90cnSdGBpJ1OT+D8Ip66vTNEigKm+HXu3RxkDvW1fJujrj4Ft7WbA5B4+5xMxdd+3C/huibKrbz8NNtYCGb/fzAXwU80b//nCbZC4PhZZ5ajPOFJTKoUwmo4X7NqhWbCaxKnQebhbzVqqWIYj524WhnMq10ys1SbZLvcXHTQE/q/pSYiJjLtAbOOeLCTTJRYdCO8LQpBjpxqbq2zkJ9DVM1cD3o8rSSe8MJ20OOSikJR2MhxSvA0dHhS64+ADUfofjbDVwH1UHSjAe5sBXCbwVLdnYD9QO7x1Ad0u1wbwI3a1TKXnrkLS1fHVEwzZTOKPaK5tFdOhXuhuUbpZ2pMouaf3VInteb/TE9jMGjfM5zd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(66946007)(2616005)(66476007)(6666004)(2906002)(66574015)(83380400001)(5660300002)(53546011)(6512007)(6506007)(186003)(54906003)(508600001)(316002)(6916009)(38100700002)(8936002)(6486002)(36756003)(66556008)(8676002)(86362001)(4326008)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDZ2VHJwVUJGL3BPRjU4OTFKM2hwQjhBVG9LbHZuWEV6RGV3SnNxZUo2RVpX?=
 =?utf-8?B?Y1dBaGIwTWtPZXVsR3AxUCtxeW5uSVZLdGhKdm1Zb3RqVWEwRHAydUR3c2RX?=
 =?utf-8?B?cmRWVzhYUE9vVkZvUzhxSm9xMllGNTNWdzJmcUlxOWI3enQ2SXNMdUltZ0dh?=
 =?utf-8?B?cm5Cc0xlSjJIZFVZcFJEdiszcmZjWWdTejZWRSt6VnN4N3ZtT3NZalp3Yk1R?=
 =?utf-8?B?cENjMWcvOHNjakRqMVFSelBkcUd6VWFRbDRBVmtnaXpDcWI2ZGR6WU5uZjBw?=
 =?utf-8?B?NHZDWTZEb2Izbm5ESTFEZ0FiR2VkSHVrekpnU1FYY2FqVS9ZMzM4dzJOZ3ZK?=
 =?utf-8?B?aENDeTR6RDBCazZwV1l1S2JaSjZOMjZYa1hMNGwyQTFiZVA1YjdRcGw4emFx?=
 =?utf-8?B?Nk53dG1SK0RxVEdHeitScktPMVBnSXFqUkRlOGNmbStJaXc0TmFkbVBGdXMx?=
 =?utf-8?B?NGtiVnVYakEraVozNldpeHR3ditpVDE3d3RFanMwNDNnNG50KzRnLytOV3Ux?=
 =?utf-8?B?eHJ0ZXQyQzdFWTdSTjJjYllhWjlxN1VaNlZXY1hCN2lkcGJzb3dzaFNjYlZx?=
 =?utf-8?B?RUZ1czZMbHB6RXpiSTVRUi9MQlA2RnJEQlBNZUlSeWdVbnNBaGk0TmxmVzUw?=
 =?utf-8?B?VFI1NzA5RmpWWmJBbWhOTkk2bWw3amM4Uy9PazB5MUYzTkZkNzJQQmpDV2Ja?=
 =?utf-8?B?RVQ0VjRIOHhqZmJFdlFrcGc0bVRmbE1TbU9nZWlXeFg1SGRkUi95VXh2WjNv?=
 =?utf-8?B?YTI5VUVici9CUXF2R1ZERFpYeWZIQjVmTVpUNjRFeGFPODB5cy9vMkU5RW1G?=
 =?utf-8?B?akhpWDEyR2MxdGRXTExnY2NRdDByQVoraC9kbFg0UHJlM2hWY29lNnU0QXVX?=
 =?utf-8?B?ak9kSllKM29OUTZiSEhySzRnR1VibVExZ0czbzRmanEzTys0eUpYdnBCTXJY?=
 =?utf-8?B?b3V0enVXcmpmKy9aOEE3QjB0SFJUb2k4bnBiNHAvOFNvbXVNTkNEQjM1T3F3?=
 =?utf-8?B?MFB1WFc3Vk1GYXc1R2RLaXNZUEY2UnZCZTkxM01EMG9OSTNERlk3cjZsNm44?=
 =?utf-8?B?Y29GemM5a3BuaFdTdlNBWXI5Q2grTnlra3cvOU9hazNIYTJQa3cxUUlybHpj?=
 =?utf-8?B?bHk4TWFJYzJPQU5FK283WEpYdkduZ3JheGJya2xXRlVKTDJTbXFIK1F0SE5u?=
 =?utf-8?B?UXNIaHE4cGFzRi9USXR6Si94dk9xYjNZS0RyMCtRb3RSdDB1clVkU1ZTME5i?=
 =?utf-8?B?Yld6aVJ3QTBUQW1MMU44RTZTeFpMYk91cmdaUWQvSkVIOHc2NHBiTS9uMHBC?=
 =?utf-8?B?L2VmQXl5OFNuTFh0Q21CZjRNUzFZY1ovVUdhSldlQnhqVUpnMVIrNG1HYVVB?=
 =?utf-8?B?bjJtZVdVb21oZS9CRVpHbElyY3FlclpzdURrTmd0ajh0RFE0NHB4UWpJSWlr?=
 =?utf-8?B?ajZhMmlabU1SZnltR2dTK1AzcnlDQkdRK1dLUzVGOVRVV2lZeU5XNFVkTGQ1?=
 =?utf-8?B?cG9yaEN0WUQ4K2wzWXp2YXlYWlFJcFdmRDVBbFpUWWt1T1pFZm1BMExhbit5?=
 =?utf-8?B?MGMyS25YMkdLeERuZ0NqK3dMNFhoUTRIR0ZBNzBpV2Rzc3ZIVmZFbGU3RlBP?=
 =?utf-8?B?eXVRdXFuODhMUHQ3Y3hYbnM1SUcyT2Q0Y0V4WEJZUXJoR2hFYTFwMnRSamN6?=
 =?utf-8?B?MzN4WU5nREVsY1Z1TmRPME4vV3g5S3djdGxSZGVHcklZSGoxQkR0MUhLN1Ey?=
 =?utf-8?B?TDhoMnYvRDdrYm54OW85VTJpOWduSyszTEJzam1SckRObkpuMjdTRHlUZDVh?=
 =?utf-8?B?QWtJQVFvNjhZTDVEVU0zcXpMUE1iN3g0R1VvUkFnL1JYMWRJLzNtc2NqN1dw?=
 =?utf-8?B?eEgwYmg1bGtvOXF4TjlwNGkwR2lGeWlyZUNWUEVMUDVWeDEwODgzUVJyaGJ1?=
 =?utf-8?B?eHFqaHlGMUdBV1RObVNjU3RlYWMzWlVFamJ3TUlQL2R0NDhZdGI5TGFHcWxJ?=
 =?utf-8?B?UTBxOGVkMDZxYlhxRFpjR3lCTWtBR0xGcldqWUlaZ1BlSEZYTGNNaG9wVHNn?=
 =?utf-8?B?V3RweTAyNWVsM2ltc0RlNU5aMUtYVTdjeUhkVk5iek9KVjJsb2lYMlBVR05O?=
 =?utf-8?B?SWU2T3VZdEl3dUNhNTJiZFJaYnRWeU0xTUJHNzJVRTFFOWsrMlZxZnVpZU9q?=
 =?utf-8?B?aVZsYXg2dVhaM3B5WTdWc25HWTBWME1XMERiZlp5WGpWOHlieWdEODFHdkRH?=
 =?utf-8?B?dElqWTFvcHorYWlYQWFZL0FoNmNRYkc3L0M1Q2wvWnJSQjVjdnluNE82eVk0?=
 =?utf-8?B?SUJxa2ZzQ2lCZGtpTTFYQ1Z6MDEyTmtzd0dWZU9HeGJhcmNjVUd4MlNPQXFT?=
 =?utf-8?Q?igELxYDJmINLYnvG96vGwS5/5XAI9KdIgUILR+oJHZStP?=
X-MS-Exchange-AntiSpam-MessageData-1: uFb+E6GfQXpyjA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c57a364-7109-402a-a0c1-08da4559d086
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 12:08:48.1579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9EMpevOt57FjIEJmpyw6s5u1iFilV6VkkmEPWP8xxWDlj70NHYFwUwLhzo980j4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2492
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.06.22 um 13:07 schrieb Bas Nieuwenhuizen:
> On Fri, Jun 3, 2022 at 12:16 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 03.06.22 um 12:08 schrieb Bas Nieuwenhuizen:
>>> [SNIP]
>>>>> I do have to fix some stuff indeed, especially for the GEM close but
>>>>> with that we should be able to keep the same basic approach?
>>>> Nope, not even remotely.
>>>>
>>>> What we need is the following:
>>>> 1. Rolling out my drm_exec patch set, so that we can lock buffers as needed.
>>>> 2. When we get a VM operation we not only lock the VM page tables, but
>>>> also all buffers we potentially need to unmap.
>>>> 3. Nuking the freed list in the amdgpu_vm structure by updating freed
>>>> areas directly when they are unmapped.
>>>> 4. Tracking those updates inside the bo_va structure for the BO+VM
>>>> combination.
>>>> 5. When the bo_va structure is destroy because of closing the handle
>>>> move the last clear operation over to the VM as implicit sync.
>>>>
>>> Hi Christian, isn't that a different problem though (that we're also
>>> trying to solve, but in your series)?
>>>
>>> What this patch tries to achieve:
>>>
>>> (t+0) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
>>> (t+1) a VM operation on a BO/VM accessed by the CS.
>>>
>>> to run concurrently. What it *doesn't* try is
>>>
>>> (t+0) a VM operation on a BO/VM accessed by the CS.
>>> (t+1) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
>>>
>>> to run concurrently. When you write
>>>
>>>> Only when all this is done we then can resolve the dependency that the
>>>> CS currently must wait for any clear operation on the VM.
>>> isn't that all about the second problem?
>> No, it's the same.
>>
>> See what we do in the VM code is to artificially insert a bubble so that
>> all VM clear operations wait for all CS operations and then use the
>> clear fence to indicate when the backing store of the BO can be freed.
> Isn't that remediated with something like the code below? At least the
> gem_close case should be handled with this, and the move case was
> already handled by the copy operation.

That is one necessary puzzle piece, yes. But you need more than that.

Especially the explicit unmap operation needs to be converted into an 
implicit unmap to get the TLB flush right.

I think I know all the necessary steps now, it's just tons of work to do.

Regards,
Christian.

>
>
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -187,6 +187,39 @@ static int amdgpu_gem_object_open(struct
> drm_gem_object *obj,
>         return 0;
> }
>
> +static void dma_resv_copy(struct dma_resv *src, struct dma_resv *dst)
> +{
> +       struct dma_resv_iter cursor;
> +       struct dma_fence *f;
> +       int r;
> +       unsigned num_fences = 0;
> +
> +       if (src == dst)
> +               return;
> +
> +       /* We assume the later loops get the same fences as the caller should
> +        * lock the resv. */
> +       dma_resv_for_each_fence(&cursor, src, DMA_RESV_USAGE_BOOKKEEP, f) {
> +               ++num_fences;
> +               dma_fence_put(f);
> +       }
> +
> +       r = dma_resv_reserve_fences(dst, num_fences);
> +       if (r) {
> +               /* As last resort on OOM we block for the fence */
> +               dma_resv_for_each_fence(&cursor, src,
> DMA_RESV_USAGE_BOOKKEEP, f) {
> +                       dma_fence_wait(f, false);
> +                       dma_fence_put(f);
> +               }
> +       }
> +
> +       dma_resv_for_each_fence(&cursor, src, DMA_RESV_USAGE_BOOKKEEP, f) {
> +               dma_resv_add_fence(dst, f, dma_resv_iter_usage(&cursor));
> +               dma_fence_put(f);
> +       }
> +}
> +
> +
> static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>                                     struct drm_file *file_priv)
> {
> @@ -233,6 +266,8 @@ static void amdgpu_gem_object_close(struct
> drm_gem_object *obj,
>         amdgpu_bo_fence(bo, fence, true);
>         dma_fence_put(fence);
>
> +       dma_resv_copy(vm->root.bo->tbo.base.resv, bo->tbo.base.resv);
> +
> out_unlock:
>         if (unlikely(r < 0))
>                 dev_err(adev->dev, "failed to clear page "
>
>> When you want to remove this bubble (which is certainly a good idea) you
>> need to first come up with a different approach to handle the clear
>> operations.
>>
>> Regards,
>> Christian.
>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>

