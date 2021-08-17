Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0493EE8F8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 11:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C0589E50;
	Tue, 17 Aug 2021 09:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2080.outbound.protection.outlook.com [40.107.102.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E489089E50;
 Tue, 17 Aug 2021 09:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWrGtyDKPlPO8fI8DxFdjpdU+6l/UuS8yNQD7C/8R8FtMnVdylOQw0/6oUB4jjtekQu9+1LTD03Q0rckvC/OMRQwHt1kcN1oOdmEUuYFVa4kyDO1UyzZkbG2xxNPV34Cb7UFNvtfockpuyxOfdfPsmt+RjqcZ/rm4KQJ5dSBVPDmarRM70ja1AdQKEHUJc2kMBLnNJhFj7cR1QrmSDy8Ia7crGkBZFK+PtXzJU0fC4w6El9W01Oc8gKIVTGazvg1SxfHVONYP/ttk5YhZdC+Ze7Wd/TS2CQUcVG96mfEfCwmpRRody073G0uTVvhHFi1AQfujpoKbMZz5onWww9BGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1v1Ebg9SViRdsZNluCgN81CXay7Yrgc10drKIwbX/mI=;
 b=BPwh9qud2trdtlWJ7bjpgfTF8c4RAYBcaoEivQLKgY3azXx7DvkM/UKFAxt6Hhbo8UWlyFPLy5urmuL/t5MI0rSD5hA2igbrrLsI40wcRn8LRj6lXIff8a7txfWWG7ZjXokxClMSlqVmgmwmnCInfsat7J5u2cyMKXxYABhX7Bf3ZeKzPScAxlKh+ZD5jAgCib5ZagV3hS1FPUv2csL+xJUNh+S4PLX0PTy7E4Fs/w/4VKBDK2+hqcELA8BTzxmW2VJtZdEHRdaf1zO60Lm4O3cakPdVdi3YCJGWDGHv0QW01BXmJnUv31BWbsF04c3DlfJMKrgnw07sXqx+xwCVdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1v1Ebg9SViRdsZNluCgN81CXay7Yrgc10drKIwbX/mI=;
 b=VgkKTVOLY4pWkG/By+TZRatizeBsj9Lf+suFNhdU5PJzdMgV78Xk/rNrCpXoUk8EX9DzPtW+HFK0MZTgQOKmljRtWZDxTJol/9suAoZxVTXc7WcMvhgn7TtIPNprFYCavskQ7XD/4IQueNBn9JJKImkPLuJFx6KyPTNqhcqs4RU=
Authentication-Results: hisilicon.com; dkim=none (message not signed)
 header.d=none;hisilicon.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Tue, 17 Aug
 2021 09:00:36 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 09:00:36 +0000
Subject: Re: [PATCH v2 0/5] dma-fence: Deadline awareness
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, Daniel Vetter
 <daniel@ffwll.ch>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 Lee Jones <lee.jones@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Steven Price <steven.price@arm.com>,
 Tian Tao <tiantao6@hisilicon.com>
References: <20210807183804.459850-1-robdclark@gmail.com>
 <9a7bdcb5-4f6f-539b-060e-d69ec15da874@amd.com>
 <CAF6AEGuwmLXW0xiFGGLie6qiL_ryE47pTiNYxmwwyshrb7eDpQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <76b14bb5-f17d-29ec-d64e-bfb0fc6d2cf9@amd.com>
Date: Tue, 17 Aug 2021 11:00:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAF6AEGuwmLXW0xiFGGLie6qiL_ryE47pTiNYxmwwyshrb7eDpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0085.eurprd05.prod.outlook.com
 (2603:10a6:207:1::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4842:7f52:3f27:a3c2]
 (2a02:908:1252:fb60:4842:7f52:3f27:a3c2) by
 AM3PR05CA0085.eurprd05.prod.outlook.com (2603:10a6:207:1::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.15 via Frontend Transport; Tue, 17 Aug 2021 09:00:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73a5c4ee-f101-4f95-3a4a-08d9615d7a1f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4551155B3824FC53F41233D583FE9@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rbY2vvs2oo8WJruGNAnIkuyO8IbajaiBsiKNip1EOlNaFmn+gVjUKirKh1UvwMe4KUHB2dhBqht5c7RhUexwAHlUzHtpt9EAHShBGNqD4unBNJlTznV8Qn8f8vA2Gu/MoxU6DyubJBL9sIOH+IcKddJN6rfUt/1gTj+1XfNZrGpCXWmQsFibCKCsqIiZQd5HxZRGVH6MUhhzNZZkMOfq5uxv7NPNrkdzHbzngN6wIzGUTFiENiFnw5bL2XqhbWalYJxKv4TGj9SumQUrwqjQTQE/LLtZLML/ie/EXx0LzN63VngdPKh1wHO3bHyrMpeLbl/BcGQMhfRVNjy7Qj1mZK3AH4YRZq9IHU2OyHbC4nNbRFivisS2/+GDRFcSyJ39pQRu04MC8l3+N3fQrQqbcJZorK5W/5LeMCSA8uL7JlcvSq6Om38olP6dS33w4iCIdOKN95V0mm9JQbkonTTKfAIjWXCiRM7k+uxrboT1sB9JerK5ZzKzzpxmsfzEj/XUUuLLSS5P0fxhayzSkzVjScoZAnyELnHWuv+eaR7uuJyvyV5INs9M+ntJnJeEsyU3IXWQ4uK/S6qoPREyzqk1mIanVVorbl4WRTb7/zNLVLtdy+weRmfe3IsdT1VPgLEu0hPL3WKKAHtBWoap05ElMKsQdtkORkowZlwcm5EeCRyyW3fkOvG3rYqJNaKfIh7vzAkuSyH9BaFgibPg91gPpyPnCWAr69gv8eeI6pN5N5irnm8Tg8DyEBC2yM8CWh5A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(7416002)(6666004)(66946007)(316002)(6486002)(5660300002)(478600001)(45080400002)(38100700002)(31696002)(966005)(186003)(8936002)(31686004)(86362001)(54906003)(36756003)(83380400001)(8676002)(4326008)(66556008)(66476007)(6916009)(2906002)(66574015)(2616005)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzRZTC9xK2FrSWJzbGlvRi9odExyUnNCR0xCR2xSd2lsOW55Z2pyS1EwZnNC?=
 =?utf-8?B?eVpwZ2tQbCtIUDNSM09VQVlqWEdNSXIrNjYrWUxtVWZ3Uy91dTZWdjladnFq?=
 =?utf-8?B?QkpjM0g1d3FYYSs5LzZQUjR4VGNSaTc0OU9ENm9rd1NZejIyNm05YzZkcW5v?=
 =?utf-8?B?OG92cE1zRWtPc0VNV1NucUV0RXByWGx5YWhvaytiQXhCZUNhR0hRYVpxRE9i?=
 =?utf-8?B?NlNDQ0xrbEJEN2tXOUhuMjBRUUdMR1NrRFZIc1lhZzgwaHNtWC9XcDkxQXFZ?=
 =?utf-8?B?UFQxS0hsVTYxRVNOY2lkZW1IMkorbG9UUlFnM2VvWkpJL0NjWFhlZkh1dkli?=
 =?utf-8?B?TThlalI0SGVyT1V1WjNta1plV015c2paWVlCV1RVVTIvWWVPSXlOTGdQZ01k?=
 =?utf-8?B?YkUzdGVDZ00yWmFtR0pGbUxLYXk1WDZCYjgzKzM1c0d2dStDVmUwdklPcHo0?=
 =?utf-8?B?VHp5ZkN1RkhJd09SaU1wU05OOFQ3VkRzcU9GRVF5M3dtaTlzUmNFUm1DYUlE?=
 =?utf-8?B?MzFERDVNWFNua0dJRm9uYjd6d2h2dHpuSWlXOXV5SG1IRm02T1Rsbm1XSUI2?=
 =?utf-8?B?QmlWam9TTzdMV2RPaEg1eDZMZUdnekRvREFwWFIvMlYrdUtncEdZZndvQUFZ?=
 =?utf-8?B?ZW9CdEFHeklWVEpDaUtzSEFjQnZ6ZCtFUElRemZoMGlueVRIOTFUWnBxZWV6?=
 =?utf-8?B?SHdaOTk1RnZnbndtQnRGdXUwZUlGZDlYTWxMbTNCMmNUMWZTY2tnak9JSkZR?=
 =?utf-8?B?YUwyQnZ6cXZvdGxTVFpIbnNxVDlscXoxajNiK29OeUJwdW9LSk5xY0E2dHZk?=
 =?utf-8?B?ZmhBQUJTMTl4cDIzQ1N1ZnIzYWhVYUw2NFFuN1NPdjdmNjBMS0tncTR3TUNw?=
 =?utf-8?B?aW9aeFd5a1RtTkluMFJUaEFkWUpNRXBIa1ZMVTh3b2RBRzBQVlFERG0vcmlQ?=
 =?utf-8?B?K0NteWxOZlM3SnAwRlFPdkJ1RzF4RHM1OC81U3dRSUpoeVJQNUViN0RHQjNX?=
 =?utf-8?B?V2RuR2dMNm9kb3ZwYkxQdkpNN0lnVjBIZk1QdUs0bm10OUNSZ3pUbEg5bmdQ?=
 =?utf-8?B?bjlDUFVwalY3QTZ2bnZaUmhTRW92cGYzUVBCWWFBUEcreklUVXk4ck5XdVRy?=
 =?utf-8?B?dG1IRUNUVnlISVVaR3plU1B5UmVjWFpOVmR4MytSd1ZxQkRMQzI5djNMOEcy?=
 =?utf-8?B?bDZubVE2aVFUT29PM0NZUllyQ2NMVVdzR3cydVZZZmhqYmJDeTJNQlh1V1Mv?=
 =?utf-8?B?VnozbnVwQzZPVTZ5ZFB2aUM2SDFvWklQNXlvYjU4N1hnNGZyOXA0TWRVcDE5?=
 =?utf-8?B?b2x5R0o3dzRlRlY3Mm1WZys5RXFRdkhxbjFmRGVZR3djU2djY3MwYmtNVVVE?=
 =?utf-8?B?emNxellPcjF6YjhCYzRsVUFMdXFMUE05Q0hneFpQVjgyUmpnM0JDN1RTZlhj?=
 =?utf-8?B?RXhkWkhZOC9zREhvNlJyTm53NmV5MWIwQTUvRy9ISXd5RjlwWkp6ODFIY2kv?=
 =?utf-8?B?NmdwUTJ2Wkt3S01wNkx1bHhzKzFnUlJpNk03SjR4aHR6R2djaTlqdkErNVlC?=
 =?utf-8?B?VllIcEpqRzhiTkFYN1ZoT0NkMGhxL3B6WXZxYkFDVjlTenAxUVhZV0s3VlI0?=
 =?utf-8?B?MVg1MXRYWHZhTGd6YmVjSTZqSm9yOUsxY1JSN1RRMHZnOWpDS2V0aDhacUcz?=
 =?utf-8?B?Zk4rczF2VVlZZ2FDMENTbEwxWEFwQ01FLzJlcFpVak1sYzR5WGhOajlsRDdh?=
 =?utf-8?B?b2M2a1FBSzlQVjVHYXhaMFNXZ29jZmllNFVtWmpMTlZNTUlIN05jM0lEQzdQ?=
 =?utf-8?B?a21rYXJqaFUvNG0yZDE4NnlZSWYzMk9Zb1k1c0FLeUJjeFh5M1h0U0FXWEhU?=
 =?utf-8?Q?O/z7fwKTeD05r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a5c4ee-f101-4f95-3a4a-08d9615d7a1f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 09:00:36.0104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JkrH4eS2xb/peMs77Khe6KiD0ohDt8w3qS+o0E/ZKF1nhCZyZhR0MoZ1t6O1KslX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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

Am 17.08.21 um 00:29 schrieb Rob Clark:
> dma_fence_array looks simple enough, just propagate the deadline to
> all children.
>
> I guess dma_fence_chain is similar (ie. fence is signalled when all
> children are signalled), the difference being simply that children are
> added dynamically?

No, new chain nodes are always added at the top.

So when you have a dma_fence_chain as a starting point the linked nodes 
after it will stay the same (except for garbage collection).

The tricky part is you can't use recursion, cause that would easily 
exceed the kernels stack depth. So you need something similar to 
dma_fence_chain_signaled().

Something like this should do it:

static bool dma_fence_chain_set_deadline(struct dma_fence *fence, 
ktime_t deadline)
{
         dma_fence_chain_for_each(fence, fence) {
                 struct dma_fence_chain *chain = to_dma_fence_chain(fence);
                 struct dma_fence *f = chain ? chain->fence : fence;

                 dma_fence_set_deadline(f, deadline);
         }
}

Regards,
Christian.

>
> BR,
> -R
>
> On Mon, Aug 16, 2021 at 3:17 AM Christian König
> <christian.koenig@amd.com> wrote:
>> The general approach seems to make sense now I think.
>>
>> One minor thing which I'm missing is adding support for this to the
>> dma_fence_array and dma_fence_chain containers.
>>
>> Regards,
>> Christian.
>>
>> Am 07.08.21 um 20:37 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Based on discussion from a previous series[1] to add a "boost" mechanism
>>> when, for example, vblank deadlines are missed.  Instead of a boost
>>> callback, this approach adds a way to set a deadline on the fence, by
>>> which the waiter would like to see the fence signalled.
>>>
>>> I've not yet had a chance to re-work the drm/msm part of this, but
>>> wanted to send this out as an RFC in case I don't have a chance to
>>> finish the drm/msm part this week.
>>>
>>> Original description:
>>>
>>> In some cases, like double-buffered rendering, missing vblanks can
>>> trick the GPU into running at a lower frequence, when really we
>>> want to be running at a higher frequency to not miss the vblanks
>>> in the first place.
>>>
>>> This is partially inspired by a trick i915 does, but implemented
>>> via dma-fence for a couple of reasons:
>>>
>>> 1) To continue to be able to use the atomic helpers
>>> 2) To support cases where display and gpu are different drivers
>>>
>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90331%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cf34fa8c2316241f1516408d96104c2c7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637647495930712007%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=4DoEsan2nW2cNwWrhnHsJF2h0MY1uCslRfOLmbYu6uw%3D&amp;reserved=0
>>>
>>> v1: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F93035%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cf34fa8c2316241f1516408d96104c2c7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637647495930722002%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3%2BRFE0nEgZXPZ50iVPila5CgzXErllBEK6YpL%2FOEGGc%3D&amp;reserved=0
>>> v2: Move filtering out of later deadlines to fence implementation
>>>       to avoid increasing the size of dma_fence
>>>
>>> Rob Clark (5):
>>>     dma-fence: Add deadline awareness
>>>     drm/vblank: Add helper to get next vblank time
>>>     drm/atomic-helper: Set fence deadline for vblank
>>>     drm/scheduler: Add fence deadline support
>>>     drm/msm: Add deadline based boost support
>>>
>>>    drivers/dma-buf/dma-fence.c             | 20 +++++++
>>>    drivers/gpu/drm/drm_atomic_helper.c     | 36 ++++++++++++
>>>    drivers/gpu/drm/drm_vblank.c            | 31 ++++++++++
>>>    drivers/gpu/drm/msm/msm_fence.c         | 76 +++++++++++++++++++++++++
>>>    drivers/gpu/drm/msm/msm_fence.h         | 20 +++++++
>>>    drivers/gpu/drm/msm/msm_gpu.h           |  1 +
>>>    drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 20 +++++++
>>>    drivers/gpu/drm/scheduler/sched_fence.c | 25 ++++++++
>>>    drivers/gpu/drm/scheduler/sched_main.c  |  3 +
>>>    include/drm/drm_vblank.h                |  1 +
>>>    include/drm/gpu_scheduler.h             |  6 ++
>>>    include/linux/dma-fence.h               | 16 ++++++
>>>    12 files changed, 255 insertions(+)
>>>

