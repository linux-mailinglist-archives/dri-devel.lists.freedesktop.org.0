Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 239E350B1FD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 09:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BDE1121A8;
	Fri, 22 Apr 2022 07:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2042.outbound.protection.outlook.com [40.107.102.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BF31121A6;
 Fri, 22 Apr 2022 07:47:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUUSdTGQyjOB73xrctrqYcgqrDgnI2PRa9nRqyWdu2sFtLFyp+ISfufRhgFEjYSOWxxltudreK90qIcV6JG31ylIooNP1MJFMxbeUsri9vjyqLZv1YQ66EmwuhikFV/G9Uvrrd3XxiFt6qeAfbptqNuSCnD+vklD1fbsmnFUSxmbfloRD+24TjupFObWSqJ2yYpAgrs0TUpWvpcBivuUnEIrwS8beR1xTJUf8eA/Jrn9FPodpk4YLXxHccT1bjjYQDXjgecAnz3FbgilFDMEwpY24RWZZ0zCME8piaKXrFP+y8dmhSLyxydpZIzPmONXoPsBQaCZgaOFQTKSkHYU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80akURHfmHJ7RFAZt4LSem2hJb+vXXs9n1TVfCP5iYE=;
 b=bgtQu71nXWOFrwOwTZXj8PjACf7k9MVgJJNE0hHrwcZuP1GY85YHrzNIdhB2+oNyJ/5bkl4BSLJcSmp8d3Iro+/3mifwzTR2OxxzV0M1k1gJJ0Rvh0NTqJ4omaVhhds5l66SibzXTwUQjvb4JlPSDUMXTqSwqczoQEHmzMQawAU1FqeEuaVvw5ah81jSvgY8gjOlqC2tO7H6bV6klPPPiv7RvtG+ymQLgp32viwz1x+HqcTw4Y2sX4yCCsicCUPLdfu0RMDjGHWyj1yU/XywmzFLFqAfXsUVg+jBqJxBft/WKgoT7p6SJ92MzcEo1aU/7qOTkbuEgFcjAhkJJDRWWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80akURHfmHJ7RFAZt4LSem2hJb+vXXs9n1TVfCP5iYE=;
 b=MEDq8o1qCqVIGagdoAL4o6PK1jOw/QvWtZbvgmwb6VzbAdcCS0i3bCawvqCfV6zvke+ZnVq5SdSGlLbikocAxfeJuxVLL/1Zw7AykovnsX+eS3Yd87FjAg/mroUPlEc/GIJt1A9ptdVwESHyLQxSTG6X0c+mgFB/NZWa35wzo0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1651.namprd12.prod.outlook.com (2603:10b6:405:4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 07:47:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Fri, 22 Apr 2022
 07:47:52 +0000
Message-ID: <a8768665-beba-5897-82fb-df1e4bd3b058@amd.com>
Date: Fri, 22 Apr 2022 09:47:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/15] dma-buf & drm/amdgpu: remove dma_resv workaround
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-4-christian.koenig@amd.com>
 <60ab53ce1ce1333f5e6a15fc83c3c05cd9bd1084.camel@vmware.com>
 <4c2e9414-3926-c9d7-8482-0d6d9191c2ac@amd.com>
 <fe8916b53b0f0101e6616d23eb6896399b092d58.camel@vmware.com>
 <54d00af9-9384-5794-490c-7d4cafe086b6@gmail.com>
 <e1c60e2a1478c406f515d51608a751fdc9feff3a.camel@vmware.com>
 <baa19a2d-6ad9-63ea-20f4-284a794f8998@amd.com>
 <ac12f900-fb47-37d6-9a1c-ac44bc711069@gmail.com>
 <5d699ffa903b5e54e8660367c3b46f07c86f4c55.camel@vmware.com>
 <6cd3571c-099b-df43-a7e0-243aba11726b@gmail.com>
 <3da8b3f4240a2f8bbc442abf57982bb321aca789.camel@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <3da8b3f4240a2f8bbc442abf57982bb321aca789.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0502CA0064.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::41) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ffde1b8-5044-4d36-f18a-08da24346796
X-MS-TrafficTypeDiagnostic: BN6PR12MB1651:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB16519B11C15099CE8600ED3183F79@BN6PR12MB1651.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZKYvRqcm59MzHAxUq73nsZpiTQpj2bg88FFrzqzfbZofE3FSOgNVekB513JKnWeJsC9ZoY0enJqagDqbKa3VDpXBLj4Vpo+kMlL/XhvDI3EkFWl7jrMuBB6rObkeuAlBoBw+69ODJ90AdBPBqKHdvB7lP/fAMbubnuAkX3VJvXEHkUJFEQZ7szG6YkGGCu4/LO8ifQFNoOz0yzZsTsfoaERBod35hMe7SfwJhe1EN1wr8vjtsmTGyXzx6iS4kfPZ1WLrID9eXbihl5EWes0jC6b/Jf00baabdkqi+6jrTvh++G6VaW0ktDGuYIeMyHtCesRpJwy+pNhyR8A3SGl/b0ug/j1d75SDW/rgSyrOmTc5pq2X6AbOVMq68NjQmqxA13fY/1Is61qm4H/Cey6pq4ZkDX/2s4RqqPLSGYTVERDR7FnNMj1uGA0vW1TIQz4UWiBJYdsSXos617+XUbHBJ+jjaBfTUrP93Yc/w2AfCgXsWn0MFHMgeqV6rngHy9T0mLWdQFVgfjDMb169ohMD7ZIlt3uZa+oQxmy6Glao32w7wMIVgfuvRwZgdXWNdnmCzFH9la9JkmbG++lTqT471EXvW6Zk2vKL4qDyFh+L6PuRpffu4t6AP2SHZ09quJtdercE/rg84SHjN7VSeuXXjB0IfmuO/4Na8mjKYf1eyCCh6KOFD2rstrV15oY6YxaILTJQV/lFBqWo53hcvyJokZFIGsZzvPJGf25fnAD8asY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(26005)(66574015)(66556008)(83380400001)(31686004)(8936002)(36756003)(2616005)(66476007)(8676002)(6666004)(6512007)(66946007)(2906002)(6506007)(5660300002)(186003)(6486002)(508600001)(38100700002)(316002)(110136005)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3ZPLytMN0ZhdVE2NThCTnlIREVkclJEU2hrMUJ2eGFIYWg4dW0zcTc0eGdP?=
 =?utf-8?B?bjZNRmRWb2s4TkRiTnI2R0NkUWhjQmtFNVpEQzI3anFSMnh6b1h5d1E3MFA2?=
 =?utf-8?B?Ym1uS3pzOTJkN2N4MVB4TVQ5dDI2WGdrM2xpcjhQaGtDSUkwL0dGUGNkS3ZS?=
 =?utf-8?B?ejhOUkFEaHNqU0tUNUJrZm9nT1A2bitIQldBY2RrQ1VXMnc3dVlNTmRwdmdl?=
 =?utf-8?B?QTVHeTdDZnZSN2wreWQybCttT3A4TkNLTE1qL1UyTkh5QmY3Z1JpekJrMU9W?=
 =?utf-8?B?WkhiYlc2RmpDQ1IxdElBV2VXczI3emdvaE9Zc01HclVKbnlOTWRHVmViNlJz?=
 =?utf-8?B?bitxV2d2RXFjczF6S2VSWUk2NUNXamIrNUhNa3N4N3BXbEpzTGJPcjMrb3hT?=
 =?utf-8?B?U0dPYVRPb3UvR3VJNTRBaFNER0ViLzQzWFUwUUdHQ09YNjdMcnlmUzRqZ2F1?=
 =?utf-8?B?MHdCUUthQVdmeWo0RWxoMUpnRUtYMXNmV21BQXdveHA5THNaTmppeGNSU1F3?=
 =?utf-8?B?Umpac2tja3BYeWx6UEJaczZnREtRcjhISGRxY2pmWHJsM3UxbHYvRFh1Q0VJ?=
 =?utf-8?B?MHFOWEpvTnJKdDE0Q1JxNVQyZVV6U2VoK2NSR2lWOUxjQUkwdGlBYmxPdWdG?=
 =?utf-8?B?SDdhc1VFU3QxeW0rbGJpR000SFVVRHVzZlpIci8wWHpMdDZSUUhoVklJR1Qz?=
 =?utf-8?B?ZjdrbkJWeEtmeER5OVplcVplVHk5Nlh2OGllZ09rNzQrSW84SUowZEV1eFB3?=
 =?utf-8?B?T2o0dWRzWjMxRTFkVUExd2FqL3BZMnBSeFNMQUVlRmo0WU5ReTEwdThCMFA3?=
 =?utf-8?B?L0dEN3Bmc0w1RkJRNWlRdTdJbWNsTmJ4bDFMbDBYUWdtQi9BUGJTRkZubVgz?=
 =?utf-8?B?VXYwVHpmNTNNK1BKZ1JkSCtiQmhmeEY5RFNLdGJvRHBqVDFUMGtYSHp4UERX?=
 =?utf-8?B?cUdwbFREcDZLN0ZoWGxNcDcydy9MUGZ6YTBrbXFadmVpNEVYT1YrNGZKUWcx?=
 =?utf-8?B?VW8zY0Y5K1hYVktOTENhRmZVUTJaT0xnVk1zOEhhYkNJWVpudW90VjNLRitv?=
 =?utf-8?B?aExsVitqUFhUaFdkT0VKWUVhRXhXa3RMZG5lQWZUOURCS05jV1NpeUdiWGpE?=
 =?utf-8?B?eEFqclZTWFRPTktaVC9KVnQ3TEkra3R4Q1M3NUFMYUtGdFB4VTAvYjE0VW0r?=
 =?utf-8?B?ci9tRmZPSHBVcit6NldDc05ZRmUvREZybG5JcllYL2dvYkJPc3ZVeWh1VGtC?=
 =?utf-8?B?amRsQWlwZFBhRlI2WEsvR0hheTBacytONlA1ejE5WHliQlFIKy9xYjQzM3Ay?=
 =?utf-8?B?dmJlNXNVMWd5czFDUkw3TEl2MCtsd3NVWWZaa2VkQUsvSnJZaWpMZkxCaHR5?=
 =?utf-8?B?U3hZYnNDaEpiUW52Qll5L1pBUWtWUkYzMmZxSnF2RVFXdXNGbTg3NnRVWWFq?=
 =?utf-8?B?QjN6UnFWQnVmZEFOV3ZzNytZT0o5QXh1SjFCZEx3Nys1cmFzRyt3ME1IcjIv?=
 =?utf-8?B?NHRMenRHUi8zVys1WHYwZTk4NmpNOFpjVlRtYmtrSENVUzFhOUpaOUY0WG5J?=
 =?utf-8?B?MXMyb0tEVC8weGZYOTFtREE0V2NDNi9UMlVhelZWUXp2Smkxa0ZBV0J2VVpB?=
 =?utf-8?B?NC9SU3E4M0laelNKUUc5L2pjSkRabnRzZnhORmxaSkZ3VzhIRmxpdjlmQk5a?=
 =?utf-8?B?NVpHRFlVaGQ0TE5KZHVZUm91SDlrWVI3Sk1yQlV5QXc4Zzd0d2NvaGo0T0RX?=
 =?utf-8?B?OE9XT1ZlYXN5cEJldzNUTG45OFl4cE5EckJMNFRlaDdodHRNYXR0YjgrNVdh?=
 =?utf-8?B?OG03YlhpeW9wdkVORlpNZXVGeHo0MW85dEhIaGlwK1lrVFVMWXdxMXJFQU5L?=
 =?utf-8?B?ZFBuSWk0NS9Mc3JBWXB1dEFBVjhKMEJTMlErRVpteVFLNmd0UEhDK1BNWU9t?=
 =?utf-8?B?Y2pMaExiSnRkV2x3bnA5V2REL3NnTDAzWkpnSmdsQWtJZHpabjE5UHZmdmli?=
 =?utf-8?B?ekhDQjBFSkpoWjNyWC9LSExoRy8wS1BaL1oyMTFIZ1ZQdElMOW1HMTJzV0xN?=
 =?utf-8?B?ZEpWOWtxU2RCVG4yWjB2OGpzUFJRdFZ0NnFidGNaQ2ZGODBaUjlmMjcvY1E0?=
 =?utf-8?B?NW5yZUQ1VGtpUi9kVE5BQXUxRVgvaUcybEM5SXhjemhMcVBYMGZhakR3cEtK?=
 =?utf-8?B?Z1BWam9UYmlCcXNZekhmam1pbUEwV3EwZzBady9VM2VtdjVyM1RNUXpLN2dV?=
 =?utf-8?B?aGh5d0dKRzNOWVAxNDZRL1ZNMCtwc0pwTDVrT0loYWx4SUdRVjdKR2xKQjk5?=
 =?utf-8?B?anhMQ0lGUXpDU0NaOEIzNXN1eFpCV1pWL1NnQ1E0cjQzdWdXSTYvZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffde1b8-5044-4d36-f18a-08da24346796
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 07:47:52.4003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsslYOpI0DC3EZzjxKshE2yvDoV961oML956cy8/j9gqDD5iOK0yqfOzU1aLAzRJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1651
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.04.22 um 23:13 schrieb Zack Rusin:
> On Thu, 2022-04-21 at 12:17 +0200, Christian König wrote:
>> ⚠ External Email
>>
>> Am 20.04.22 um 21:28 schrieb Zack Rusin:
>>> [SNIP]
>>>> To figure out what it is could you try the following code
>>>> fragment:
>>>>
>>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>>>> index f46891012be3..a36f89d3f36d 100644
>>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>>>> @@ -288,7 +288,7 @@ int vmw_validation_add_bo(struct
>>>> vmw_validation_context *ctx,
>>>>                    val_buf->bo = ttm_bo_get_unless_zero(&vbo-
>>>>> base);
>>>>                    if (!val_buf->bo)
>>>>                            return -ESRCH;
>>>> -               val_buf->num_shared = 0;
>>>> +               val_buf->num_shared = 16;
>>>>                    list_add_tail(&val_buf->head, &ctx->bo_list);
>>>>                    bo_node->as_mob = as_mob;
>>>>                    bo_node->cpu_blit = cpu_blit;
>>> Fails the same BUG_ON with num_fences and max_fences == 0.
>> Thanks for testing this.
>>
>> So the buffer object is not reserved through
>> vmw_validation_bo_reserve(), but comes from somewhere else.
>> Unfortunately I absolutely can't find where that's coming from.
>>
>> Do you have some documentation howto setup vmwgfx? E.g. sample VM
>> which
>> I can download somewhere etc..
> I don't have an external machine to upload it to. Getting an external
> machine to run Mesa CI on has been on our todo for a while, so I'll try
> to setup something next week.
>
> The issue here seems to be that vmwgfx always had some buffers that
> didn't immediately go through vmw_validation_bo_reserve. What's
> happening is that in vmwgfx_execbuf.c in vmw_execbuf_process we call
> vmw_validation_bo_reserve and after it we call
> vmw_validation_res_validate. Inside vmw_validation_res_validate (in
> vmwgfx_validation.c) we call vmw_resource_validate, which calls
> vmw_resource_do_validate . vmw_resource_do_validate has this code "ret
> = func->create(res);" which is an issue for vmwgfx_cotable.c . The
> func->create for cotable's is vmw_cotable_create which calls
> vmw_cotable_resize which creates, reserves and validates a new bo.

Just wow! No wonder that I missed that, I would have never ever been 
able to find it.

>
> In short a new bo is created in vmw_cotable_resize between
> ttm_eu_reserve_buffers and ttm_eu_fence_buffer_objects calls.

Well then the fix is trivial, we just need to call 
dma_resv_reserve_fences() on this new BO to make sure that at least one 
fence slot is reserved.

I will try to come up with a patch. Thanks a lot for that!

Regards,
Christian.

>
> z

