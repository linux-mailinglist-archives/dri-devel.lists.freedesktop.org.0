Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E7C7537C9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE2610E856;
	Fri, 14 Jul 2023 10:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C30310E856
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:18:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxouhJmDEUnxMm8Pn/grtSTZ48wxdhzJZwVvGQmEmFUM06cyvGGiGpXnCeuXo3A+YE1feELA0J2ursjodqPDJhsdEaDyWtvRb8N3RNKfJi8hjhqRXMbnm5vM8bnskUxB+UYvW8/2eSSURzcNVm+je8sS3tcClJzplNX5XOTdnvEmHhB4TD8XStaGxl6JipBBATEWZBUgcLAr8TWVY8uB2hbqLaxLpmAM36JUQz0hUI++BZQ2NQBxLnmOzsiSwMCas8Dpjaobwo1drQk5LP7IatYDxCDjJ7UXWkFZNZHslTAuz23I6c40DqMNEIRWmMdTWp4p1AjGP6A6QZ4oyCiTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPVW11uBSjEhw3Fi3z/3wckyRmc4tXTqYUoVnaVC+44=;
 b=aYHu1J+JSteE6BOndpRx3yyWNaR/ppd3QmEQjNylDvhlC4UbM/x7BoLvhMw/+bpFXfDzTvcIc3rWP9CzmP7ES7LtlA/u3vZE2m4FdAEO5lJEgJomYqqvH0oo1ZOeKRirih4TGpidHG0n+MaMnfFnNGY6IJai72/vOn+2xbQajsUmbG1AcagBZHZq0ORq4GmI2/OIrpG9HXaUxildubpvzispHWcpO3HerNA5DO4AnlfNH1Ey7RwnLSO4kARkqUj2URtXbPdfwOb0mJ0CTO75qtVd2jAMHnX9DVf3dD3u21LcX08jrAqp6AsX42sXFXH6eTNOrt0VB/yeJDHqTa1c/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPVW11uBSjEhw3Fi3z/3wckyRmc4tXTqYUoVnaVC+44=;
 b=Y2GQg5Qx8hLf5sGjm3+WoSTfvldbb70L7G83eubJK/ujWJ9CJAuJEMKxFSEdo2GWXPyF99hl+AuhKE4NU2vXBuEz9VdItBb3jqREWkyRjRt7MgKXWnhkIzl8iObXgFgsLPc59RqwWtrVa1bAsVO5KN+6PDLA3ExiicwOlAPCi5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV3PR12MB9167.namprd12.prod.outlook.com (2603:10b6:408:196::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 10:18:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 10:18:10 +0000
Message-ID: <003eb810-654e-3a2b-0756-d62440c2d419@amd.com>
Date: Fri, 14 Jul 2023 12:18:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Luben Tuikov <luben.tuikov@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
 <6b473196-9f87-d6c8-b289-18f80de78f0a@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <6b473196-9f87-d6c8-b289-18f80de78f0a@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV3PR12MB9167:EE_
X-MS-Office365-Filtering-Correlation-Id: aa08a333-c68f-4099-7055-08db84539fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j1hpPBleGsJFtbqV5Skj/s1cLMgQfif8biU/0UWlIJODuYAZfbDbqRK3+172m6k+Bu2CQaTpecZIPTfkEN2s/5fQLlQ3Wbk1uFWT1xxqppljHGkW3lQf0+VhxtBse10135HYp29vGIijtHmBzV340dzLPUCXXsD5XetnDXQ51zyuB+XP3ih6Cn391fqoAfwOLNSw3pAxGH6GewJBBN3ZQZSNmHJgF0ulWdVhdRmKVrOkR2bMF8J5+dKHJjW6xyfY44rVlzt3DUG7bMrwkiGcmNwV3p1pg/tVB5aM8EXqJGLMapREpUhtl89/X4tQ5XNn/EGUXpvHRgAF0/kK+T8NQv93a7re1AbGqpOIX63EovMm4SppHuXetU6QcI8BUTs440ghcZ7TsJSqAKQuTwZb4gvsgy4iSahZRVtWtylsWTOccOrCNjlV+OoG82kYD82GDHssFy4Tmal9AqZycsxMDU+uALZOEIig/Z5HAMyHnibR6zyBEW9rySjd2l90SnxpJUWPddMmb4UzGNzkxESH0uY2roreelUV7nY5wCzKrbP40IPXVHU2ipQD9por7F+fv4IYNugcj2jKTV72ZapUh700BM96qs7tTsXyQDxSElAE5NmqJ/YS1ZMw6Pn7cgPkTtxBcS+ubdkHm82dkMKQqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199021)(186003)(41300700001)(6506007)(478600001)(110136005)(54906003)(31686004)(4326008)(316002)(66946007)(66476007)(66556008)(8936002)(5660300002)(8676002)(7416002)(6512007)(6666004)(6486002)(66574015)(2616005)(66899021)(2906002)(83380400001)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVgvSTNYY1lPQklmK1N0ZXlSZ25kS0FQenhRY2lHei90OTloM0l4dEpzNWdq?=
 =?utf-8?B?SnczTk5raURPczZZWDNWcWxhZFZHOGVFRDRnRTljUlJZMDFLVTNLcVFqRXJl?=
 =?utf-8?B?RWYzSi95RUhiMXFxdFZLWnpFVjFBNllueU5YVlAvTThyQmZVZFVBaUNEajBj?=
 =?utf-8?B?eEJ6WEtGMklCdjFIVWRaem05Vlh0djlEekk0ZU5IYkZ1cFdWaGdDY2ozZmNW?=
 =?utf-8?B?U3FycFlXbkJzTEE0czJVV2J4ZWxPZ3BCMXNyRWVkVmMxRDRuY1hiNTVQN3k4?=
 =?utf-8?B?SGV1cWxObjlnMmVRNkVVLzYzZjg5Z3ZhaE9SZXAzQkVEbURpbHd1WFIwM0JM?=
 =?utf-8?B?SU5yOUNxNFVNeDMvZ2k3S2RlaGsrT0ZRK2htV3huT1M0L0czak9iVnZTUmV2?=
 =?utf-8?B?RlIyTlEvNllWaWZpbHZLZjEwczRHR2E2Wi9LQ0pNcGhEa0RXVU8yOEpTaC80?=
 =?utf-8?B?MWszQ2ZoaUY5SUtjalFCWkhGWGZ2ZC9rcnNiY2ROeHhPNWoyRCs5THpLSzRI?=
 =?utf-8?B?TVBvV0dKaUNiZGNuNE5tQkkveVY4OUJqSHNPOXVzOUxKTFpOcjJQRXExMzMx?=
 =?utf-8?B?Q0tiWlcrODdGVk4zSi9sMHhVRzNWL1doQk50ajBJOEVCZ0oxS09PaFRtZXlJ?=
 =?utf-8?B?aEFObEpLWnpMdW1pK09NbWxDenhtMDlUOXk2QmdTZWdFZ1lpWEdXaG9RVzhj?=
 =?utf-8?B?UkRlLytUaWEzdGFaNVVJckV1UnR0ZmFsM2dVcHAvU281cEppK0xjSHdxeEpi?=
 =?utf-8?B?bS9ib3ZXOVpGY2hsa0N5bmgvWWExVVVKdXc0Ly9TTTIvVURMQ1VBMThxclg2?=
 =?utf-8?B?SFVIdU5iMG9aL0dKSGJhbVpQT0JDeXU3aExCOGZrN0g5MGtHRzhRSmpjS1lj?=
 =?utf-8?B?N3FuNG5lbFU5VXB6bEdBQXc1UmlBN2VSYW9EemplTEtRdnM3SDZPakNlM1pC?=
 =?utf-8?B?YlJac3JqaEVKN2x0eDJwcnU2V0w3ZG9SNzRRWGJHenJoQ0lwRC85cHJNUklN?=
 =?utf-8?B?SWVtTzE4aUpVYVBNdnJJdjRPN3U5MFdZSjE0MnBaT1hERnAxbm9KUEdSaUhH?=
 =?utf-8?B?LzJINzVOdEFyaHpDUDFNL216QzZudHBERG9QM3dGRDdRNE4wQkErRU9Gc0cr?=
 =?utf-8?B?cE5rYkVQVGhHK09lZjIxdUlmMDlsUHJPR0xEbFJzVllaUzhNVUg5Z1ZxbzN4?=
 =?utf-8?B?c25WeHpPNzFpUnEyUVJvUW0wc3RoazhYd2wxZWN0cm9ENlQ3WElvL0VpQnFj?=
 =?utf-8?B?cVFmNW5kRU9sOU1EaW5lc0VTdU0rbDJKQ2pnOW43TXZjTzEzL1JXdmVaN2Zu?=
 =?utf-8?B?WE54WXdlWTVrcXlDd2h1MHpzNW51bmlhUldqZzF0dUxBNmszMm1Ua3VDekx0?=
 =?utf-8?B?b1ZyRjBYNEdoVWxQZU5aWGJmV3VTZ0Z4MHRFUGFHeTEzZ043TXRtSm9DWDcr?=
 =?utf-8?B?QmtDWE1VMUZxY3Zac1VCbkpER0pIR3BDMkE1RWpEMW5jN3BJRnFOTldocTZ5?=
 =?utf-8?B?RDN5OUxzZDBXb1BNLzdUZDh3SE9sWUtJN0tZUGNzUTlCU0tXSWwvUkRaQXpv?=
 =?utf-8?B?cXpQK2NxcnBLTTd0YjgwQ3VvVkNlZjJNWHlkR2p6RFh5aFRVVm4wbGVNa2dO?=
 =?utf-8?B?dlZvZjhHb3BLUTA2eXNKYVhXQnlNajFFSjYxdTNJNFQxR1VwZ3dCbjZOdTFp?=
 =?utf-8?B?NG9sTU1aWGV2eUF5dExUQncwcG5WeXQvM09seGk2YllJY3c2V0pBVWlwVmd0?=
 =?utf-8?B?eVhNWW44ZVg1Zm5wTi9NSWJGUk9ORHA2Wkh1ODkvWXhQMFBXU2t0ZFo4OUlJ?=
 =?utf-8?B?QnFaZTRaWm5PRVljNmdBUHlPbUFGN2ZoL00yZUJid0lPVkxCcHhhQ0hBU2VO?=
 =?utf-8?B?UHljUG1ZaHBvbDFrNGt5eDNqUjBMSk95NEFqcWJ4eExMU29RaXpTWnVyR0FZ?=
 =?utf-8?B?Zmt2MXZ3bzFtQVJGci9HQ09OKzFnUVdMUGpNYTFSYzh3TE1lMGJ6Q1RZNVBx?=
 =?utf-8?B?R2NLMHlzY29TM00zSVRGclBpNGJLellDdk1VMzBzUU8xWERQME9hSzBMSVgw?=
 =?utf-8?B?M0hBOWhVbHU0dmhzekFtdmYvZk80T1RrZ1FsZ0pHNzJTMVc0b0l6TS9ERGZ4?=
 =?utf-8?B?STlEclJmYkxwR05udTU2TldLWEpOMUtIYzZHQkJGUEtwNEVubzFzL2dQQU4x?=
 =?utf-8?Q?nCAbLwsVSJfnXDD7w/UzFyqD8H1Z5Ktk1W/50nwYBBXL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa08a333-c68f-4099-7055-08db84539fb0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 10:18:10.1979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9NtWmp74IkzDF2XCVubnC6jbDujXm6TrB1FEAc041XjVT2cYVX7BqTiQOhx2FVf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9167
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.23 um 12:06 schrieb Asahi Lina:
> On 14/07/2023 18.57, Christian König wrote:
>> Am 14.07.23 um 11:49 schrieb Asahi Lina:
>>> On 14/07/2023 17.43, Christian König wrote:
>>>> Am 14.07.23 um 10:21 schrieb Asahi Lina:
>>>>> A signaled scheduler fence can outlive its scheduler, since fences 
>>>>> are
>>>>> independencly reference counted. Therefore, we can't reference the
>>>>> scheduler in the get_timeline_name() implementation.
>>>>>
>>>>> Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
>>>>> dma-bufs reference fences from GPU schedulers that no longer exist.
>>>>>
>>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>>> ---
>>>>>     drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>>>>>     drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>>>>>     include/drm/gpu_scheduler.h              | 5 +++++
>>>>>     3 files changed, 14 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> index b2bbc8a68b30..17f35b0b005a 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> @@ -389,7 +389,12 @@ static bool
>>>>> drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>>>                /*
>>>>>              * Fence is from the same scheduler, only need to wait 
>>>>> for
>>>>> -         * it to be scheduled
>>>>> +         * it to be scheduled.
>>>>> +         *
>>>>> +         * Note: s_fence->sched could have been freed and 
>>>>> reallocated
>>>>> +         * as another scheduler. This false positive case is okay,
>>>>> as if
>>>>> +         * the old scheduler was freed all of its jobs must have
>>>>> +         * signaled their completion fences.
>>>>
>>>> This is outright nonsense. As long as an entity for a scheduler exists
>>>> it is not allowed to free up this scheduler.
>>>>
>>>> So this function can't be called like this.
>>>
>>> As I already explained, the fences can outlive their scheduler. That
>>> means *this* entity certainly exists for *this* scheduler, but the
>>> *dependency* fence might have come from a past scheduler that was
>>> already destroyed along with all of its entities, and its address 
>>> reused.
>>
>> Well this is function is not about fences, this function is a callback
>> for the entity.
>
> That deals with dependency fences, which could have come from any 
> arbitrary source, including another entity and another scheduler.

No, they can't. Signaling is certainly mandatory to happen before things 
are released even if we allow to decouple the dma_fence from it's issuer.

>
>>>
>>> Christian, I'm really getting tired of your tone. I don't appreciate
>>> being told my comments are "outright nonsense" when you don't even
>>> take the time to understand what the issue is and what I'm trying to
>>> do/document. If you aren't interested in working with me, I'm just
>>> going to give up on drm_sched, wait until Rust gets workqueue support,
>>> and reimplement it in Rust. You can keep your broken fence lifetime
>>> semantics and I'll do my own thing.
>>
>> I'm certainly trying to help here, but you seem to have unrealistic
>> expectations.
>
> I don't think expecting not to be told my changes are "outright 
> nonsense" is an unrealistic expectation. If you think it is, maybe 
> that's yet another indicator of the culture problems the kernel 
> community has...

Well I'm just pointing out that you don't seem to understand the 
background of the things and just think this is a bug instead of 
intentional behavior.

>
>> I perfectly understand what you are trying to do, but you don't seem to
>> understand that this functionality here isn't made for your use case.
>
> I do, that's why I'm trying to change things. Right now, this 
> functionality isn't even properly documented, which is why I thought 
> it could be used for my use case, and slowly discovered otherwise. 
> Daniel suggested documenting it, then fixing the mismatches between 
> documentation and reality, which is what I'm doing here.

Well I know Daniel for something like 10-15 years or so, I'm pretty sure 
that he meant that you document the existing state because otherwise 
this goes against usual patch submission approaches.

>
>> We can adjust the functionality to better match your requirements, but
>> you can't say it is broken because it doesn't work when you use it not
>> in the way it is intended to be used.
>
> I'm saying the idea that a random dma-buf holds onto a chain of 
> references that prevents unloading a driver module that wrote into it 
> (and keeps a bunch of random unrelated objects alive) is a broken 
> state of affairs.

Well no, this is intentional design. Otherwise the module and with it 
the operations pointer the fences rely on go away. We already discussed 
that over 10 years ago when Marten came up with the initial dma_fence 
design.

The resulting problems are very well known and I completely agree that 
they are undesirable, but this is how the framework works and not just 
the scheduler but the rest of the DMA-buf framework as well.

> It may or may not trickle down to actual problems for users (I would 
> bet it does in some cases but I don't know for sure), but it's a 
> situation that doesn't make any sense.
>
> I know I'm triggering actual breakage with my new use case due to 
> this, which is why I'm trying to improve things. But the current state 
> of affairs just doesn't make any sense even if it isn't causing kernel 
> oopses today with other drivers.
>
>> You can go ahead and try to re-implement the functionality in Rust, but
>> then I would reject that pointing out that this should probably be an
>> extension to the existing code.
>
> You keep rejecting my attempts at extending the existing code...

Well I will try to improve here and push you into the right direction 
instead.

Regards,
Christian.

>
> ~~ Lina
>

